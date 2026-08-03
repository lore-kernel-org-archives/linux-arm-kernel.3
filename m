Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD5C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mM87d/BoLbN1zST8PJ6yEoztt2FRLeT4zLZWlzYzGU=; b=4MPAo/bDvl5MN9ND2AFd+zx6eb
	2NNUQ4KSBi7ivi5UZ+k9KMM59c/4GAfF7wfMcyyAlTrwSfldXgyFfN5mb4RKyoogZCldY4FoGivFI
	MKPEDQ/0Zt04rC1NS/oJbonj8vwm6BMReEtltksVcBma69C1eqo/35S849FI054RsPry75sFtuCv0
	Fs47vJPB8bEGNCqG5S2YfCBSLnHJ6ph6eJHJ95bBiRQVmNrh9ZiATg56ApNln08xTkAxEePuq1F7p
	aa6Slyo/Smxm6lfTEA524j5rN0JMnH+eeCQxc8JGQm4X7q8FveCiE+tVg07D+yEG3ocgnoBNBi0eM
	+L/KZqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rL-00000000fAQ-3i7B;
	Mon, 03 Aug 2026 23:14:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1rK-00000000f8F-03sk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:14:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B998141398;
	Mon,  3 Aug 2026 23:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C8D1F00A3F;
	Mon,  3 Aug 2026 23:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798853;
	bh=7mM87d/BoLbN1zST8PJ6yEoztt2FRLeT4zLZWlzYzGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GAUzCKQjZ5MZGK/l0iGJgyz/COLP5hl7OLokCPCjZje6VV26oRlQNKiauP9IlDft4
	 5t5zdvYReDngCQMXm1t1eNkjYTUQBOS75/4y04/rPlrTh8qHDMokrkBx780Wb8kuV6
	 hUNHGB/ZfUlosla48JLUzboGnST7g7Sxs1EV2iNZetCfS5nfGHW79VS5pMeT6XoMb/
	 CEcXQK0JcLSuFk7mYkNNKTJSRDBYXO4donlFKe0e4AZRPYFnKXCTFjz5+Xe1ishRj+
	 y/EYZt8CnpcNK+NLGoWx45gX/vxLaXqNQvidut1isr2gBs2bsUDR3Dq+cpFNkqhpNH
	 6n5wcnc+bmqng==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:54 +0100
Subject: [PATCH v18 09/14] KVM: arm64: Allow GCS to be enabled for guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-9-fd8c40f5ad88@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dGLgMnL9rflDIiQQE2mOvvL9pjSbxiXR3AQhq+zRFdw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCgVvZNHyYxP4KJ4G+VRTHyOsbEWGi733jeZ
 tApPHusGYiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgoAAKCRAk1otyXVSH
 0BIXB/4g8Ff7bixNT03EVmFn3AcdNaHHjiNBBBkQDDwNvAYtlNyOWyhdqt/mfXOt2qrjx/pIqiT
 DFtC/GRGSIdQaAIwu7Ye9O+mYYb7rM09du+nqaJz7milCp0tRJK02XzHzXgn7rJzq1/VnTG/bxr
 nKICnMHW88MKZnUb1R7CKcYQ/aB+CoS0fZO0YNNW0zbadzcM4mlrxdbE1NHPmXpg8Z0MAPdaj9E
 Th0al2S1FF7yqJSk1TpOgFc7WbNq5+tpqdz9aSETTyqAG8a9ZOATjnDpxQ7VBDnQ5Nj+zb2Qzai
 DKYI/VbhUcPfc+vwAoek1veecPrthAh8398wF7N0GWwPnWaT
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

Now that required functionality for GCS is in place expose
ID_AA64PFR1_EL1.GCS, allowing guests to be given the feature.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c   | 3 +--
 arch/arm64/kvm/sys_regs.c | 5 +++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43..e588820b1be7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1632,11 +1632,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support GCS, BTI, SSBS, CSV2_frac */
 		val &= ~(ID_AA64PFR1_EL1_PFAR		|
 			 ID_AA64PFR1_EL1_MTEX		|
 			 ID_AA64PFR1_EL1_THE		|
-			 ID_AA64PFR1_EL1_GCS		|
 			 ID_AA64PFR1_EL1_MTE_frac	|
 			 ID_AA64PFR1_EL1_NMI		|
 			 ID_AA64PFR1_EL1_SME		|
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 387c14a33524..7105f42a63ae 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2109,10 +2109,12 @@ static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val)
 	      SYS_FIELD_GET(ID_AA64PFR0_EL1, RAS, pfr0) == ID_AA64PFR0_EL1_RAS_IMP))
 		val &= ~ID_AA64PFR1_EL1_RAS_frac;
 
+	if (!system_supports_gcs())
+		val &= ~ID_AA64PFR1_EL1_GCS;
+
 	val &= ~ID_AA64PFR1_EL1_SME;
 	val &= ~ID_AA64PFR1_EL1_RNDR_trap;
 	val &= ~ID_AA64PFR1_EL1_NMI;
-	val &= ~ID_AA64PFR1_EL1_GCS;
 	val &= ~ID_AA64PFR1_EL1_THE;
 	val &= ~ID_AA64PFR1_EL1_MTEX;
 	val &= ~ID_AA64PFR1_EL1_PFAR;
@@ -3350,7 +3352,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				     ~(ID_AA64PFR1_EL1_PFAR |
 				       ID_AA64PFR1_EL1_MTEX |
 				       ID_AA64PFR1_EL1_THE |
-				       ID_AA64PFR1_EL1_GCS |
 				       ID_AA64PFR1_EL1_MTE_frac |
 				       ID_AA64PFR1_EL1_NMI |
 				       ID_AA64PFR1_EL1_RNDR_trap |

-- 
2.47.3


