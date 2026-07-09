Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9/QBsgUl+YAHSU3KRVgzfp7o3z60FnCLy+stiPlLsM=; b=JhjN87EpKtEtLwhV7pQ1INUbzF
	q1PuLZLzG1C5FdOfWlos2tIX4DGvhvDx/JhL/aWnM+X2Pfriz030VAztmNVIDN8E0UHhGAOb3E16G
	LjrqEeabNx262CJMwQdvpGDazt0/7ob1LdUPrGvC7XLsfxl984drAeQhLiAHbREMjzykHFvNw4hGO
	GFWNXihZW23ar7FF11XS4XxtgPdRB8YnG4C/C0S5h5ur7LyvZFXgsd6B8+nXkbWN93Hz50HQKkWMz
	y29XulWxn1ggPevX0sXTqchRSDWXWxoqdRt71R6KOZFSkhdeR+zld3W8B97mFvglzv1llv0jyc0BE
	IT3oscPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthG-00000003H47-1vIj;
	Thu, 09 Jul 2026 18:42:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthF-00000003H2L-1YGx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCE3761831;
	Thu,  9 Jul 2026 18:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6881A1F000E9;
	Thu,  9 Jul 2026 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622524;
	bh=V9/QBsgUl+YAHSU3KRVgzfp7o3z60FnCLy+stiPlLsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VpaG0lqUM9AJpjH5h2yYuDiybRa/XGorO8CR+46KxgKuXsP+ZlD24JnA3NGHjZSbj
	 VDvCQsTokNpbKimzr6UHWc03P9iPWK2n+WS4t+Zr5u22pU59ELlG79TDr+cbUMsAgd
	 pUdz/3yFvNgyufCzUqMngT9KXWls3TVQh3VCs0T7vvnXRF18wvfMAQZgF7ctMH31xC
	 CnQhN3Sufw/1roZvIvf7YDQsx++KToaYsk6AnqwtucyNGyPQ0p5NH4JCC1Zk6Bl9rd
	 O4Jwa0tz9/ePPoPCvda6A5nmR+LOLWWh+7doeeD+tYUkQJN0MON8RpOf/1cPHpqfQo
	 qRuhFLhq/s9iA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:47 +0100
Subject: [PATCH v12 26/29] KVM: arm64: selftests: Remove spurious check for
 single bit safe values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-26-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3zzAFIxW4QntGIfc+v0S58ciMfKRPipxII9rhMorBnU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+r+KQ1zJ80C6wnIIVYlDY8xGooQpjWeJucoZ
 +qY2kBb6z+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q/gAKCRAk1otyXVSH
 0B3wB/9iWEG1cKGN60DbAJRUDX2lO5oQv99lWbCu882DlgSdoN82JGfBtU6ZnDJi8u/469CrkMR
 kRO/PhUMi4/+Tpwxs6LT8Fw5NgV+aWwsDvJ8vBYyHmOuhX1pBYRpyP1V5+K5cYWkEcRLLBxmVh0
 cs+tpR+QhvQ06Qznczflff9hA13XAsyZIQ+tPnj0oSEfka3mTIOBYnq4JbuJVJlaCgNg3UHtNFj
 HgP8Zry8wOJ4BNQvN5BaZQNzHQxGo7QyqfYu2YgkkcDgO2yDBKYN/Seg75MJG2mKErHBsjUfOnd
 QqbduqIMjyKkJRifjaYRXWPUY/EU3Mb/IKHovBkzYlwG0uUX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

get_safe_value() currently asserts that bitfields it is generating a safe
value for must be more than one bit wide but in actual fact it should
always be possible to generate a safe value to write to a bitfield even if
it is just the current value and the function correctly handles that.
Remove the assert.

Fixes: bf09ee918053e ("KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user")
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df5..9eceac84e297 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -279,8 +279,6 @@ u64 get_safe_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
 {
 	u64 ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
-
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:

-- 
2.47.3


