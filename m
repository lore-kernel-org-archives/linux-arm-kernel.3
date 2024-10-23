Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C928CFA444
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJQk5ghcbxz9gM7h17L3LyzWqmGjQ7cSZ2/q9rySNbQ=; b=Lw8663R/rPbwv+BUJnIoNU+IAH
	r8Kto8+cpxaLzFWE7Ibb0drJ+Mub1hy2Rg8R2jVa4XMAHLL1/14NgOfnFam+RgRO5m32XvMmczYVw
	pUUTbXFAuTB0Zp485ji24EZq9HITk5fvSg95dyqXcn94XILjdKxzpPHIMNVfddro9ay+/vbwOyAcK
	OGwzSi10MqPf3ukAXxj9Wg8JpwGlSxRKAx/MNIVo5oGEDiUehH9z25Te5SmALNzKTMVX04yFImbtn
	H8zlzL45MHOspCAzcJoUjhFrqNqFcPQHtiQ0c3v+IPNgEuSEwI/Boz6WYgZ0sa/RPEYwEE0ctsTWl
	eQJwfyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dUx-0000000F08k-2gcT;
	Wed, 23 Oct 2024 15:42:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckQ-0000000EpRW-1KwU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mJQk5ghcbxz9gM7h17L3LyzWqmGjQ7cSZ2/q9rySNbQ=; b=ocNYACN7JPqDdq9aTXTODngF3v
	iQWzhjuWzz1nOiPOD2uL2ZtFy9r9tVgkGRLC1Rgs+7Gb4FWXDP7PMeXbtmSGIoS+aTactNWEQwzZK
	XqD8rT8HpO4hvoq1mdR/kdLjpAinnyu8VK6F39bwa2lLFz48ijCPA4rbsvILzncKg+KXV+NgZKNP0
	CaMF9cxU8pfILmrvyarKPdXl8dK+lZuy0D0bt6WharLGHmn9A1thQuFejooS62KrqzaGEtNsntNOX
	FyCyWHv7dbGFFYEGT67vfERRNJFeGE8XuU4arYIq+IqE+qOQwba7p/za8gk0mvpsYUeDlWCZqCSUC
	52dN/uHg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-00000008Qbn-00iQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E5B5A45029;
	Wed, 23 Oct 2024 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF0AC4CEE5;
	Wed, 23 Oct 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695238;
	bh=l2iJmram/7F50cBafm2LbS3iBb2YLddO4eliTdm5KZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ubi+QkmLV6Y2ngbH2kLUsqgJaeH9GtkJsDzRYdyfF0IAIBdpBNfkcSyI6tbsvYxqO
	 0cMqWx+M41WI0IBm6w+Xt/fAL3nxRIcLehQNIiU9NeeiM/Ddyn9oQyagZfRTeHfwnc
	 Yjn/3A1KwR0iAvrOxoovj6krGJOJ+20up6l+SQoVuHbdeIaNqvQ6rtS/YIuUodw7T0
	 77JpjU43a8F/X4w0zryjxn9Nv6w+U9TbNFUfpgKGfuP5m5EqrqzfTb2S53JXAophWJ
	 pY0iWgjT5ZDlVVj7tZ9YwGdBIrelaceZiy5xjrSDOdfHTl99iUnXxBOEREybOg5OUO
	 NK7GCiTj2vApQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckG-0068vz-LQ;
	Wed, 23 Oct 2024 15:53:56 +0100
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
Subject: [PATCH v5 34/37] KVM: arm64: Disable hierarchical permissions when POE is enabled
Date: Wed, 23 Oct 2024 15:53:42 +0100
Message-Id: <20241023145345.1613824-35-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_155403_399760_1A36ADAF 
X-CRM114-Status: GOOD (  15.12  )
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

The hierarchical permissions must be disabled when POE is enabled
in the translation regime used for a given table walk.

We store the two enable bits in the s1_walk_info structure so that
they can be retrieved down the line, as they will be useful.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index ef1643faedeb4..8d1dc6327ec5b 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -24,6 +24,8 @@ struct s1_walk_info {
 	unsigned int		txsz;
 	int 	     		sl;
 	bool	     		hpd;
+	bool			e0poe;
+	bool			poe;
 	bool	     		be;
 	bool	     		s2;
 };
@@ -110,6 +112,34 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	}
 }
 
+static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
+{
+	u64 val;
+
+	if (!kvm_has_s1poe(vcpu->kvm)) {
+		wi->poe = wi->e0poe = false;
+		return;
+	}
+
+	switch (wi->regime) {
+	case TR_EL2:
+	case TR_EL20:
+		val = vcpu_read_sys_reg(vcpu, TCR2_EL2);
+		wi->poe = val & TCR2_EL2_POE;
+		wi->e0poe = (wi->regime == TR_EL20) && (val & TCR2_EL2_E0POE);
+		break;
+	case TR_EL10:
+		if (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) {
+			wi->poe = wi->e0poe = false;
+			return;
+		}
+
+		val = __vcpu_sys_reg(vcpu, TCR2_EL1);
+		wi->poe = val & TCR2_EL1x_POE;
+		wi->e0poe = val & TCR2_EL1x_E0POE;
+	}
+}
+
 static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 			 struct s1_walk_result *wr, u64 va)
 {
@@ -206,6 +236,12 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 	/* R_JHSVW */
 	wi->hpd |= s1pie_enabled(vcpu, wi->regime);
 
+	/* Do we have POE? */
+	compute_s1poe(vcpu, wi);
+
+	/* R_BVXDG */
+	wi->hpd |= (wi->poe || wi->e0poe);
+
 	/* Someone was silly enough to encode TG0/TG1 differently */
 	if (va55) {
 		wi->txsz = FIELD_GET(TCR_T1SZ_MASK, tcr);
-- 
2.39.2


