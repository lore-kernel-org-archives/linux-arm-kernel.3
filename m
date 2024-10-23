Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD6D2C56C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiHU+RGzzr4QpQkTFm33dPeV4vASMP8CImMEmnlICDk=; b=j3vFTtvv3K8VtM4i/DCPF8KIEN
	ZdoK3wlWRFsb/HfOzABoLjos6N+JXxStwiBYt95ZaNXBZvZ5eqfUWEzM0jlM/raoxmwcmMsGzzi73
	TqHP8B/dLpbfMLftB5FfyEDHai5bOUrEnSskMNoPFeMt2ew41YIPXhnJDhRLZ0teDK0T4o3RkJU6V
	Wao+gajl5izaKPuell9ysYr74GEsN6O4S4N9YL1GSZJzbA5xdL9ZwfcZ29Wl2/itdGLyGwvJXpqnJ
	vWc/yQgUMp6ZgRi2Ch/7W2gqgJjVGzmuh3NfUvHoxnB/UXGDHZLbAPiG/2M5LunsHVnIvuA7Sao+T
	q1wsHHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dLx-0000000EyVz-0osd;
	Wed, 23 Oct 2024 15:32:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckK-0000000EpJL-1Xie
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95561A45040;
	Wed, 23 Oct 2024 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96600C4CECD;
	Wed, 23 Oct 2024 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695235;
	bh=LYdBETnn2M88/sr9XD6Wu4WwdOew9iodz0Dr8K47paA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CB3D9WZwyVqUkgAk6CJ0EmYhuneyYy+AN+Rm4VE3DukctgyrCmv4P4k2wErFNzI7P
	 9BGIz96t3aFMmU8aSNsxNN+8pMrPONEeNR/WP/MPP9mnOjQ4cNNug3yHIFLaDKX4yj
	 R3O3pSEbkRVoIDYr5dkaJrt80GoR/oqD/nuEw4qd/EOS2DIGnj7PdtljFLuQothzid
	 7/9/rIr+z3B4DohK0aQENLBGS2lMWx0HmuNpRFwS3oXXnTXtWnTaAj2YrEHW0f2iYb
	 M+ux05CnhqZOQAKiLrD9IQjBLEAL7WXr5N9H7JxixX/S+4+S7EZvpS1ZK8aXB8dUBq
	 EcP2q6K/a5LDw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckD-0068vz-RV;
	Wed, 23 Oct 2024 15:53:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 21/37] KVM: arm64: Implement AT S1PIE support
Date: Wed, 23 Oct 2024 15:53:29 +0100
Message-Id: <20241023145345.1613824-22-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075400_791573_7FD510D3 
X-CRM114-Status: GOOD (  16.72  )
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

It doesn't take much effort to implement S1PIE support in AT.

It is only a matter of using the AArch64.S1IndirectBasePermissions()
encodings for the permission, ignoring GCS which has no impact on AT,
and enforce FEAT_PAN3 being enabled as this is a requirement of
FEAT_S1PIE.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 117 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index f5bd750288ff5..3d93ed1795603 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -781,6 +781,9 @@ static bool pan3_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, PAN3))
 		return false;
 
+	if (s1pie_enabled(vcpu, regime))
+		return true;
+
 	if (regime == TR_EL10)
 		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
 	else
@@ -862,11 +865,123 @@ static void compute_s1_hierarchical_permissions(struct kvm_vcpu *vcpu,
 	}
 }
 
+#define perm_idx(v, r, i)	((vcpu_read_sys_reg((v), (r)) >> ((i) * 4)) & 0xf)
+
+#define set_priv_perms(wr, r, w, x)	\
+	do {				\
+		(wr)->pr = (r);		\
+		(wr)->pw = (w);		\
+		(wr)->px = (x);		\
+	} while (0)
+
+#define set_unpriv_perms(wr, r, w, x)	\
+	do {				\
+		(wr)->ur = (r);		\
+		(wr)->uw = (w);		\
+		(wr)->ux = (x);		\
+	} while (0)
+
+/* Similar to AArch64.S1IndirectBasePermissions(), without GCS  */
+#define set_perms(w, wr, ip)						\
+	do {								\
+		/* R_LLZDZ */						\
+		switch ((ip)) {						\
+		case 0b0000:						\
+			set_ ## w ## _perms((wr), false, false, false);	\
+			break;						\
+		case 0b0001:						\
+			set_ ## w ## _perms((wr), true , false, false);	\
+			break;						\
+		case 0b0010:						\
+			set_ ## w ## _perms((wr), false, false, true );	\
+			break;						\
+		case 0b0011:						\
+			set_ ## w ## _perms((wr), true , false, true );	\
+			break;						\
+		case 0b0100:						\
+			set_ ## w ## _perms((wr), false, false, false);	\
+			break;						\
+		case 0b0101:						\
+			set_ ## w ## _perms((wr), true , true , false);	\
+			break;						\
+		case 0b0110:						\
+			set_ ## w ## _perms((wr), true , true , true );	\
+			break;						\
+		case 0b0111:						\
+			set_ ## w ## _perms((wr), true , true , true );	\
+			break;						\
+		case 0b1000:						\
+			set_ ## w ## _perms((wr), true , false, false);	\
+			break;						\
+		case 0b1001:						\
+			set_ ## w ## _perms((wr), true , false, false);	\
+			break;						\
+		case 0b1010:						\
+			set_ ## w ## _perms((wr), true , false, true );	\
+			break;						\
+		case 0b1011:						\
+			set_ ## w ## _perms((wr), false, false, false);	\
+			break;						\
+		case 0b1100:						\
+			set_ ## w ## _perms((wr), true , true , false);	\
+			break;						\
+		case 0b1101:						\
+			set_ ## w ## _perms((wr), false, false, false);	\
+			break;						\
+		case 0b1110:						\
+			set_ ## w ## _perms((wr), true , true , true );	\
+			break;						\
+		case 0b1111:						\
+			set_ ## w ## _perms((wr), false, false, false);	\
+			break;						\
+		}							\
+	} while (0)
+
+static void compute_s1_indirect_permissions(struct kvm_vcpu *vcpu,
+					    struct s1_walk_info *wi,
+					    struct s1_walk_result *wr)
+{
+	u8 up, pp, idx;
+
+	idx = pte_pi_index(wr->desc);
+
+	switch (wi->regime) {
+	case TR_EL10:
+		pp = perm_idx(vcpu, PIR_EL1, idx);
+		up = perm_idx(vcpu, PIRE0_EL1, idx);
+		break;
+	case TR_EL20:
+		pp = perm_idx(vcpu, PIR_EL2, idx);
+		up = perm_idx(vcpu, PIRE0_EL2, idx);
+		break;
+	case TR_EL2:
+		pp = perm_idx(vcpu, PIR_EL2, idx);
+		up = 0;
+		break;
+	}
+
+	set_perms(priv, wr, pp);
+
+	if (wi->regime != TR_EL2)
+		set_perms(unpriv, wr, up);
+	else
+		set_unpriv_perms(wr, false, false, false);
+
+	/* R_VFPJF */
+	if (wr->px && wr->uw) {
+		set_priv_perms(wr, false, false, false);
+		set_unpriv_perms(wr, false, false, false);
+	}
+}
+
 static void compute_s1_permissions(struct kvm_vcpu *vcpu, u32 op,
 				   struct s1_walk_info *wi,
 				   struct s1_walk_result *wr)
 {
-	compute_s1_direct_permissions(vcpu, wi, wr);
+	if (!s1pie_enabled(vcpu, wi->regime))
+		compute_s1_direct_permissions(vcpu, wi, wr);
+	else
+		compute_s1_indirect_permissions(vcpu, wi, wr);
 
 	if (!wi->hpd)
 		compute_s1_hierarchical_permissions(vcpu, wi, wr);
-- 
2.39.2


