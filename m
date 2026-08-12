Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DFDC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiugukty1Mn9VBap85XV+9U6g61CkNYwrAZccCYiZGU=; b=JVJInJlulecx9Hf08cADOaznx8
	Mc0dyOfagjOasaTW12Tmj5EvNizMaebj998wdHJu73Soziwp7xqjHhvkX5PtspM8Ogz/C3awN+AON
	kZDkf5TodgpJ4GqUDuQ/6sOZZ1DwqLEL9RvCZvUAy3JRl8u+j8jKNI7wjRQj6QUINEBelzK0XJtvN
	nCvhKCpEJ1hbdkGfePoHXxwB8SmpQcTvabFmYuYeohIht5jUQAqqT+asncTW7B4rxoOko3zPxuanQ
	typoyP0ndy+fDHstmtWmJKXKZtxDq1Qp7auCHJDk+9QkCXsRrbr5gizGgb8VJGC3sV9izzBg1+4U1
	man8gbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOV-0000000Grmw-3pF3;
	Wed, 12 Aug 2026 19:13:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOQ-0000000GrjM-1jZ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E67643AFC;
	Wed, 12 Aug 2026 19:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C701F00A3A;
	Wed, 12 Aug 2026 19:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562018;
	bh=fiugukty1Mn9VBap85XV+9U6g61CkNYwrAZccCYiZGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aH/VAb63NjO4aWXwR7JWuEYnBTHhuBjU+Z3WdshMCmFz64+M0jZXO7loOLriE2Mio
	 XclGPrASPJe92tqkVCg+Gnlp6bpOOgozC6DI1HFhOCB1cBro5gn0Z7vvFCOPw7NHXm
	 qgR8sbG6XK1EEt2ezn3nh+8zAlxDpWY/T1mxEc5kPBG9HBJ3xC/1lM5g4bIMRydbEz
	 UEibOGEifsYFpygV2bfbzMx+xsdO5nDUCmI9OYfcP9L4a70PAX6mRElVro6RkP8VB7
	 0VLYsPm8zbT3USLE7ZcUhD7J608JSU3mAaxRPzlv53v8MblbXQNBFQiJa38Jl5lwpK
	 XpokjY/5f70wg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:06 +0100
Subject: [PATCH v19 07/14] KVM: arm64: Forward GCS exceptions to nested
 guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-7-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
In-Reply-To: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fG68MfhkwRfSg1W6YX0cbN8/yZcNS3S2f4yLKb+2+CU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfMW/S5d5PGH9T34XW+AA1po5WQjsknYblW3L3
 C4IBv2XS2aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanzFvwAKCRAk1otyXVSH
 0IAkCACBituvLEzDOaeuMRwbX42AwaQLAEUbskM76j5V8qSKjSK/Bf8H6BaOJ6TWn6DHWePPWL1
 ILR0+l0PF72i1qJl/q02Q7s/gXAK/PI+pm9bG0dJ6DkIXtj7LIxgkU2tGNkB1ae23m0HTzzi2X/
 391xfgq2KAbVi+72vqu6oakyYPBf0N9XvEJqkcGkyTuJQU5An5h+TIMjbpnpY+EC8hHvc4K4Br3
 CD7zkCUf5+KrJbOK8ZUHqciTfbXc2S4ws58mVotFbVpbTt2lM0a3vacQ9yZRDoF2y9prsIbaeTb
 CimgWWyuCpL9dATtag4rsJelCsDsZ1/xOskVMQaj8FYHoSjc
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

For nested guests where HFGITR_EL2.nGCSSTR_EL1 is clear or when there are
L2 GCS data check exceptions we need to forward the exception to the guest.
Add handling to do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..63dcc4a0e69a 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -304,12 +304,24 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+/*
+ * We might get GCS exceptions that need to be forwarded to the
+ * hypervisor when a nested guest has HFGITR_EL2.nGCSSTR_EL1 clear, or
+ * for a GCS data check exception for a L2 guest.
+ */
 static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
 {
-	/* We don't expect GCS, so treat it with contempt */
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
-		WARN_ON_ONCE(1);
+	if (!kvm_has_gcs(vcpu->kvm)) {
+		kvm_inject_undefined(vcpu);
+		return 1;
+	}
 
+	if (vcpu_has_nv(vcpu)) {
+		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+		return 1;
+	}
+
+	WARN_ON_ONCE(1);
 	kvm_inject_undefined(vcpu);
 	return 1;
 }

-- 
2.47.3


