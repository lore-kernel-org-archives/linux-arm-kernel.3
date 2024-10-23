Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B4BCFA445
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ULZZ2LK7ujPnXy6CurZy4aFOmBGYzbvK+7Ph8be5us=; b=x1lSseQJCsnOXE/XxGTUol4goP
	uuohZjxsqQxh3f7kIRTS7Balh+QkV5EomSFZKFLy2Za/LK8O8wVf/6PZHWDaZ+Mc5NTk8gC2HBHA9
	jEIv+BrB+iRxfvSclVFKXnyt1+MHZ88MxKn+3a2oHcHNETybSqZPvQdqDPhI+lDtTeOvtwybszjSn
	OvIEDETbm4xOHqRNp+aWizJEDPZ/sxvAUIR4KMXudOSySQkvCT+T8Y7zOCiyx7L2zzRZKPmIAhSWY
	7Jat0bXaCAsE7VUbwIz7HXE74xHijyW+O/+RzubcRalNKY1UnN3tK3OPCC4ZL1ntSV1DNalyt1Ief
	xydjcRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dZS-0000000F1PP-320K;
	Wed, 23 Oct 2024 15:46:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckR-0000000EpS9-11ot
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5ULZZ2LK7ujPnXy6CurZy4aFOmBGYzbvK+7Ph8be5us=; b=pxJwOKw5TrMeZFbWeLAdsoUm5F
	l2r8j4iKWNeUMx0cexC9EBk6w5VIlLIgDcFExPPqT6eEWyJsM2CzExKBQrZuwrPnRnzmbYR8hNkLc
	XUzT2iW84rWx6KUJAM1J+XlvUsbWvOr3IlwiiKLFeJlW3d1G4VTN39WRI8psPs9vn/yYiaFjUsxpK
	T/9V0rtVDANTEx35XDkjzPiEpVK791GuV+Xcpqch36sYNqExIt/a4wMaoB4EcBjOGzRW0lGbyd894
	o2IPAVzl/DugVz1gAVyVkvw50lhnPF7H1cjEfUvdg0HVVMfrtzxhktEkQe/wRl9cxJCb5b468fVUo
	pOwf5lQw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-00000008Qe5-19p0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C02BA4504B;
	Wed, 23 Oct 2024 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A8DC4CECD;
	Wed, 23 Oct 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695237;
	bh=cFUROgj0irWvLa9NjPuW8hzFSF84yDju9um7+8iPfLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n/+mV154dIlk1SUt8pGG59eLSwCJNzoFwUC1b++UdbAIJ5/8slb9rRINIgIJjCK8j
	 D8CiwVmOPxgFLHUHQ97hEZMeo/qQHRi4rtxIs0e3vKZNYxSfe/rsibjMk0EiE/JqOC
	 AzwWzlTz3GGMvG8UjdoCKAYQO2PJ4HGWAA/aNGT/IdV7rV2Rb0qrP3Og0Ba0DvIoji
	 6vHOTZSxqJFDIjzMDRjHcn3fU3rULSPhT/hfI6P3gNQPFeZ4ZT+Jr98rwqk8Pfr3jz
	 YoV1StypigTuBs3e14IpkGQZEpkEZkvSsFYDcwfH93eIYdUAL8d5VBVpzODs2Vsg+w
	 KyqN+gEAV48kQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckF-0068vz-Ub;
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
Subject: [PATCH v5 31/37] KVM: arm64: Add basic support for POR_EL2
Date: Wed, 23 Oct 2024 15:53:39 +0100
Message-Id: <20241023145345.1613824-32-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_155403_729971_9DA5B341 
X-CRM114-Status: GOOD (  13.33  )
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

S1POE support implies support for POR_EL2, which  we provide by

- adding it to the vcpu_sysreg enum
- advertising it as mapped to its EL1 counterpart in get_el2_to_el1_mapping
- wiring it in the sys_reg_desc table with the correct visibility
- handling POR_EL1 in __vcpu_{read,write}_sys_reg_from_cpu()

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/sys_regs.c         | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3c435e88d74b8..e426c843e7ae7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -473,6 +473,7 @@ enum vcpu_sysreg {
 	TCR_EL2,	/* Translation Control Register (EL2) */
 	PIRE0_EL2,	/* Permission Indirection Register 0 (EL2) */
 	PIR_EL2,	/* Permission Indirection Register 1 (EL2) */
+	POR_EL2,	/* Permission Overlay Register 2 (EL2) */
 	SPSR_EL2,	/* EL2 saved program status register */
 	ELR_EL2,	/* EL2 exception link register */
 	AFSR0_EL2,	/* Auxiliary Fault Status Register 0 (EL2) */
@@ -1043,6 +1044,7 @@ static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
 	case TCR2_EL1:		*val = read_sysreg_s(SYS_TCR2_EL12);	break;
 	case PIR_EL1:		*val = read_sysreg_s(SYS_PIR_EL12);	break;
 	case PIRE0_EL1:		*val = read_sysreg_s(SYS_PIRE0_EL12);	break;
+	case POR_EL1:		*val = read_sysreg_s(SYS_POR_EL12);	break;
 	case ESR_EL1:		*val = read_sysreg_s(SYS_ESR_EL12);	break;
 	case AFSR0_EL1:		*val = read_sysreg_s(SYS_AFSR0_EL12);	break;
 	case AFSR1_EL1:		*val = read_sysreg_s(SYS_AFSR1_EL12);	break;
@@ -1092,6 +1094,7 @@ static inline bool __vcpu_write_sys_reg_to_cpu(u64 val, int reg)
 	case TCR2_EL1:		write_sysreg_s(val, SYS_TCR2_EL12);	break;
 	case PIR_EL1:		write_sysreg_s(val, SYS_PIR_EL12);	break;
 	case PIRE0_EL1:		write_sysreg_s(val, SYS_PIRE0_EL12);	break;
+	case POR_EL1:		write_sysreg_s(val, SYS_POR_EL12);	break;
 	case ESR_EL1:		write_sysreg_s(val, SYS_ESR_EL12);	break;
 	case AFSR0_EL1:		write_sysreg_s(val, SYS_AFSR0_EL12);	break;
 	case AFSR1_EL1:		write_sysreg_s(val, SYS_AFSR1_EL12);	break;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c89a165408498..b493fb7632adc 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -137,6 +137,7 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
 		MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
+		MAPPED_EL2_SYSREG(POR_EL2,     POR_EL1,     NULL	     );
 		MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
 		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
 		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
@@ -2322,6 +2323,12 @@ static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
+static unsigned int s1poe_el2_visibility(const struct kvm_vcpu *vcpu,
+					 const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, s1poe_visibility);
+}
+
 static unsigned int tcr2_visibility(const struct kvm_vcpu *vcpu,
 				    const struct sys_reg_desc *rd)
 {
@@ -2909,6 +2916,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 			 s1pie_el2_visibility),
 	EL2_REG_FILTERED(PIR_EL2, access_rw, reset_val, 0,
 			 s1pie_el2_visibility),
+	EL2_REG_FILTERED(POR_EL2, access_rw, reset_val, 0,
+			 s1poe_el2_visibility),
 	EL2_REG(AMAIR_EL2, access_rw, reset_val, 0),
 
 	EL2_REG(VBAR_EL2, access_rw, reset_val, 0),
-- 
2.39.2


