Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401F7C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiugukty1Mn9VBap85XV+9U6g61CkNYwrAZccCYiZGU=; b=DI/8YzvspPBDgsD+/3Qd64hm5x
	sD7H0gCdJdCTnjEFoL6jS/Ip5NiOkGzZ6Nc/dhN5GTEZO06PhMUe2f5IdJiJuAcvgPlNMpA9ZfeHp
	zFFqFWJ1JC09BW5fLO9OAWVqP9p26WOUwvSjhOLnv/nVZtDpSekFzsY67b3Qt/+rxPRTUxw/IQUsT
	S7BrQENHD3s0Y70/+lBDsPc3VG53T0uuUx/q+Bq1TJQivRAzpvOrLROVysVRPJ6NuoGz5m6YgXph9
	77qUQDNovlFWBFokD/B3ZRjYVdL9Tb32yHCfgkMWaEBft/wKZ6yC3y9jAfgwm/IMwbNzOxXZWTIWg
	VvpD2dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rE-00000000f2Z-1noK;
	Mon, 03 Aug 2026 23:14:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rD-00000000f1P-2SOn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:14:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59A2343EF0;
	Mon,  3 Aug 2026 23:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DBD1F00A3E;
	Mon,  3 Aug 2026 23:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798847;
	bh=fiugukty1Mn9VBap85XV+9U6g61CkNYwrAZccCYiZGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AfNuvcWSdk4R6apsQH2JnDApmuBXbQg6asNwcqTyVS7BqpbXagvh7NbqDS307MA7x
	 saoi64x4R1NGCFNK/bZbbIRg4oGJ9RCFMq5i1TCSGa2y6jmiPL1y90Lelj06uca1JX
	 0XkbsIRH7OR6Dj/sTcxBOCYPw5qsW2kOQ3X1VnxelCsxwEsdrxW/pSwUHMmByExxuz
	 kmcNvs3TYj7nHn/0lxvaPGzOAD8vVbAb7vJfOk0QlNkXHzmbZ8lM4AW6mmRbSsqaLO
	 6zX7R1A2RjDc5vUvT9Rrf1I00Xn5bn6JaxfuQu02c0V+CBvcRk3xswBJULmi5MvFD3
	 5Pk2dKFtwEqvA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:52 +0100
Subject: [PATCH v18 07/14] KVM: arm64: Forward GCS exceptions to nested
 guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-7-fd8c40f5ad88@kernel.org>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
In-Reply-To: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fG68MfhkwRfSg1W6YX0cbN8/yZcNS3S2f4yLKb+2+CU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCfDFrrJu6EBWatsQlkDL5fLdxzD6q+uZ194
 xEX8/bZYV+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgnwAKCRAk1otyXVSH
 0P4eB/9zHfXUwqA3slkhU8zpWiO6oeFu2MR+OB2dN1p5kY4ZG138rVq10mYyWQU8QNQ6v1G0jpW
 In9wLKEM2acaBUUiCKckWBNkOJOlCGrneiptUyFmVfn5pmNv6S+KztRxd3gnCJODMFvftwMTFh6
 FJ3CsmvV5hPa1G1Z5/KttX1zHQ/qsbBPkeNgmfmt1iAzurlgrSIKreSMTByopRgvu56croTYSik
 FBMaDy/0JcX9R9KdFmT+fV99wDcVF8BDhzFO5Zmz9I9bOuIxMQfmfEh2+0xULOvImlxQb/oPIw0
 r05PfCDqy41xH/3wlnenzd6JxGRRauMN+CmPtGqR5toa2jxc
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


