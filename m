Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24E6CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 23:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R9/3uo93dbTvAFjBA0VazM/vXR7CkHZ2fQvEyXpdbAg=; b=rs118HS40h2rU5tmW8TkUi3mKH
	y2gXVr50A2mNsp5xnwDJpu652LLkwQg4V6TxyRuPQp7j/OSyTmWlrbnZCe4Ogi4Nxocef6P+blZFg
	GP4sdnnGhJWHhk2ce8CtSaMwuVp89AFdAxObohMcZWjS/Ygv4trVL+JhTSxsB48zGqdehAl/H/hc2
	N3a6SKv2ORK9y7UCy4SK8xC6iQ0pY4qH5mISj9BxFsbAUQb/IkA0Mr0rY42xfLU3KH7wxtLQbF3+j
	lygLqgfWR04eofEVgpkAxvH8sArs17JAN+BbZcocAziMZyus77vIu6GhzfisTGYrE3BX3Va3paw2c
	8/Bfbkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC53v-00000007qkR-3uSH;
	Thu, 23 Oct 2025 23:49:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC53s-00000007qk0-2iJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 23:49:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC12941AB4;
	Thu, 23 Oct 2025 23:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B16C4CEE7;
	Thu, 23 Oct 2025 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761263379;
	bh=mlPjpupG6YFu3WZLIE4LsuGTPZmpesaS7fkVRKnB3lw=;
	h=From:Date:Subject:To:Cc:From;
	b=t0/l3WWYWLbBTQOHmNsyP23wB1Z5kdA1Je7bN6WcAXfXa3DXM2nBZi+kZ7/MGqcqs
	 ZtbQYYT4BD5rCqJLmzFMYUULpnyNXGx12yGfKLt14jFzO++9+O2UZlWrW2wbkCuT98
	 9afI+0ohwixDO2Z+f3b4nvBBzV5YdhKHjqgz2OCqZxuvxqb5GXoodOFTiFqeWn+IiP
	 18ajZwl7+bgiYnwprfxHgGqtytnhISHpp1NE0uCNQ9n8aqVNgZztwY6agaATmQu4Rk
	 qyxByaKbqEQV7NZYWDplCuruNvnbyOO/K6evKOgDHy3q2ensVTnaF3wUm2Afy2SLUd
	 lDG/JVCoijDoA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Oct 2025 00:43:39 +0100
Subject: [PATCH] KVM: arm64: selftests: Filter ZCR_EL2 in get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-kvm-arm64-get-reg-list-zcr-el2-v1-1-0cd0ff75e22f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKq9+mgC/x3NQQqDMBBG4avIrPtDMlGhvYp0IekYh6qViUipe
 PcGl9/mvYOymEqmR3WQya5ZP0uBv1UUx35JAn0VEztuvOOA9z6jt7mtkWSDScKkecMvGmRixDq
 4uxPvBw5UIqvJoN9r0D3P8w/+AbhYcAAAAA==
X-Change-ID: 20251023-kvm-arm64-get-reg-list-zcr-el2-c43090e11f23
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mlPjpupG6YFu3WZLIE4LsuGTPZmpesaS7fkVRKnB3lw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBo+r8QxY2JcsLXKRY9i3x2+USWkDSHg3bd2J9tr
 4x4LkFf+W6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaPq/EAAKCRAk1otyXVSH
 0KCsB/4sY4EU2Z485tooicTVWlxHlXnwLdrbACENRpSPR8AbNunmliL3tXgWrtUwaY1HkI8dpox
 OQV7mIl0CF1dNQVv94MyAum8RMJXHtzE/ecPLWToGYxAC6nNQrxlndg2NWqsa+poVrXpTdPbe3X
 TCuitoGMhhLSMX0eQiS4MOQEJA/dKMWNVu33FeioSKBJbW5fkJsnE6cgYSpDYaio/B/7ltDkfrY
 +9xmQPYzMNKdIJLUCcCpJWqKsQ/8VUTk4IKG9BkZQMSTYO6XykhzS97kEng26H1qDac+moC3+Jq
 87S+6fNn+tBG6QUWAKmsXaRQuXR+QV+uASWRNXKN1DUjaDOR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_164940_727859_46DC4233 
X-CRM114-Status: GOOD (  10.70  )
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

get-reg-list includes ZCR_EL2 in the list of EL2 registers that it looks
for when NV is enabled but does not have any feature gate for this register,
meaning that testing any combination of features that includes EL2 but does
not include SVE will result in a test failure due to a missing register
being reported:

| The following lines are missing registers:
|
|	ARM64_SYS_REG(3, 4, 1, 2, 0),

Add ZCR_EL2 to feat_id_regs so that the test knows not to expect to see it
without SVE being enabled.

Fixes: 3a90b6f27964 ("KVM: arm64: selftests: get-reg-list: Add base EL2 registers")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index c9b84eeaab6b..7ae26ce875ad 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -68,6 +68,7 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(VNCR_EL2,	ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY),
 	REG_FEAT(CNTHV_CTL_EL2, ID_AA64MMFR1_EL1, VH, IMP),
 	REG_FEAT(CNTHV_CVAL_EL2,ID_AA64MMFR1_EL1, VH, IMP),
+	REG_FEAT(ZCR_EL2,	ID_AA64PFR0_EL1, SVE, IMP),
 };
 
 bool filter_reg(__u64 reg)

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251023-kvm-arm64-get-reg-list-zcr-el2-c43090e11f23

Best regards,
--  
Mark Brown <broonie@kernel.org>


