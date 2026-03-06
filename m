Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707E3FCB63A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9gAiV8dWlNo61kSNjKGW3mqGcWx9pENLTZx2SQzjCE=; b=hJ547qkkaiIHxHSF23EU6Q+xrJ
	2DuvzUnKYD4YsKFstN7joBVSP8rffrIG+PzqFY1aYEMUrFRP1+IUEmvqu1qkmUtvRc5SyfSDSaerq
	0noQzGMh4ptSd1rohVLo0CiENgrIKSi1GieWror1rQLkCoJWo4AQpf3mWC91cuML0GVztkmEwpZ48
	KVF2LiTPp53vkqIwxPer9SWcCcghERslobUu2dwkZvJ5GcnPiJwwaktycaQXFA6yN32mt4YPv3K2n
	9zxV2I6JG72w7R+pFMQj8+/sZJzSZpg17T74mA+suIX3o0bp+HgXon74pmZuiGZxtImMjpFV37+MY
	Y1yvW9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhz-00000004EU6-3oFJ;
	Fri, 06 Mar 2026 17:11:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhx-00000004EQb-3I30
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B31F60127;
	Fri,  6 Mar 2026 17:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C13C4CEF7;
	Fri,  6 Mar 2026 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817084;
	bh=RwM0lvASFFISwO7mYlHziW2rJGO2q+5K2S9ANJKi+qk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gghwR0a71jnooATMBX5TocY5duhVClWj7zPggZHjAaCF9uD8eCRsCrOQAJlx+x/OT
	 uHanDt7NRGLoKkO+KfOu0nyqwdlm4MDxs37uVWkg2LU3uuF0sdoFnqWbEHvAhgQx1p
	 6vBq5t1oqEKubYFosSdVNmUuOdOABEuN6cvPaMYpBtqvF9Rl9xrCUHNRNdEN/9ULKI
	 gjJaV54ad0W5IiG2Zz8wYBleVVNJmDNrDox+4phWDR26vRLR/omreN1J0uXx4xDT+O
	 ist0zJH3f8lZRe+oeIk8tzxjZEvMnAtM++KDHMggpBX/e+LrmoWsUyn0w0dtz3rIUn
	 +UQJlqcONXeAw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:19 +0000
Subject: [PATCH v10 27/30] KVM: arm64: selftests: Remove spurious check for
 single bit safe values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-27-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RwM0lvASFFISwO7mYlHziW2rJGO2q+5K2S9ANJKi+qk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo9khSGDEm4RKpWoYkjMo875PXE5ezoRFH8g
 p77Xmqp8JeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKPQAKCRAk1otyXVSH
 0Dc6B/4+xlyIn14vonZiqCu0iFWQPdpktw/K1mXbtG5oUfy1UaOU9VoAgvFwbAmJCJZ6DiB3nm3
 uqcfCqwuig8fEMuQcNEvik2VEoSahN2ujQaT2mu5t4y0A3d+sLzNxIayT2d65CAsRnO6NpYNcit
 gLf5qkvYsJcpi6AYMoyv6IW4GHeS5eZtZQTLD9MiTYDkz4b5VKJ8I8nlDZEETr3ejG+EiLyc4u9
 L2c/msSkXv4kQh7PKbP84zA77Rvg1GKyYRW6KSXbx+G28Qp6SXigjf+wlM88FIEw7PtmWgdsaHl
 4+5wobzSg4n0fNJdyDKFlvLAUV2KdmOCz7BfQ3VBc8kVyh7n
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
index 73de5be58bab..bfca7be3e766 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -269,8 +269,6 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 {
 	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
-
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:

-- 
2.47.3


