Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSVu+15UXFfSOFL1ip9ZLwAcn38zQdv9iDAl5Qkapx0=; b=W8CnEY/WoRzqG1QXdvYLAaCeVj
	Q1eZeWsTmV83XRy18vNDGK6Gb07hD7nijMwmEVCsuhIh/UOL2wWDEqSz4yWfBw0XHdK82OZLOFS/w
	Wn71kw+jX9TE2/QYtlTqG3Cs9itKQBOBjuxLFWrSFOb19aCfaJL9+aontxDeemOajNtER1oCxboPf
	hY8fdhrUYZy0/BGGn91bD0Fyjqmnxocngjnm71Vv8XcilJy12FXyvhHH0In7SLrRSQrGwq2FhNkzc
	3SGazZYzYKpHLOQEXIe0AfVnE3MVwr+JulZKPexRcjpvBL5VGPTzD5H/xmPb5QlWkuGdxYGTn5TJb
	gpHx4UZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrSD-00000004A8R-34XN;
	Tue, 11 Feb 2025 14:41:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrPy-000000049Xj-2bgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSVu+15UXFfSOFL1ip9ZLwAcn38zQdv9iDAl5Qkapx0=;
	b=Mm0FYP+F5HQN7S+k3XUh7rGU7aVtGWhytFxat4uPI0+hC/svTZprYXxeIhZzhl4Exir9Js
	qudIfF66BJdi/3biSrkyY7z2w2WX1hVCfEujuBLtN1oR4xbx80i6pIpwblDJTM/nDTeAhX
	SarP8tHK8EXH7i6raE+OgZNXw0lKIe4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-G4k5490hPvm-oyy2cZ31VA-1; Tue, 11 Feb 2025 09:39:16 -0500
X-MC-Unique: G4k5490hPvm-oyy2cZ31VA-1
X-Mimecast-MFC-AGG-ID: G4k5490hPvm-oyy2cZ31VA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dca55788eso2450492f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284755; x=1739889555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSVu+15UXFfSOFL1ip9ZLwAcn38zQdv9iDAl5Qkapx0=;
        b=f1uLvq5s2dhIbjtyYByQCoHcIY7bHULFs894l0hMch5wPY7F0HfgdkumRhn3KBCLI2
         octne+O8CZQTCIibvrd1cvh99iwjT3iuMKl6XCF0O25cYQ3HrACFQCK6GeVM94IjUNbo
         BCqKzlGN/ki7eTsGOxn2O7AW7nnPQEChKZnGfmnyhlvWi2Nmau9/YkpeP8zfl7Hd6hLM
         2ojRI2arm7H+DmYn+sRppbRGMnG8ldosuwfKr6Y9yI5ASoW1prWy2EywzyF3qvAEN51S
         4CUL/YhRIXerC38TPHsOVqG6Q8GRXMZyr8/htgSFBbPxDE/ZnIPb2y2D0Hr1oKeKcQcG
         s5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXMj21jMTnNaetBxrm9X2K/eUICanPkO0NzctjAeuoXct7XjE/xnsY2WeOhj3bPq0j6BpdV8f/DDA1EYTF3AYEK@lists.infradead.org
X-Gm-Message-State: AOJu0YwLx6v+krdHftzvJhTDQ07DlRMFq8FJzCSnC4g3Cs/hwOXPyVHJ
	7f3wFhHrGkHmYkTG7bQyn1m3AbsqNbDnS3pcSH00m6BNH1LGM3+SNtbWNxpZvzhtdROl3ltxxS7
	FWeOoeWKOHCC4pIwuqdaLV7ok/EgnhmDHZiEHuQr2WngPjqRDEecJ/0RBC/Zwuhx2Fc15aRYr
X-Gm-Gg: ASbGncsmY4jUsLBAsaNazaa0Be00qiNCC//UouePuMM7pHTeR6mreo+ZJQaiivf8Uiz
	XixgV6QiRiIRRkRk091UdQF/sy8fB4Qwea3dn/iR4u74Bp/kFRVv6UX2CJlrXh9ORNLhOAe6PSP
	PzRTkkw46ErgaUYXN8hqKnOst8gzF9fuztmQ+tvZuLMonDUfiAg7XmuME3a0OM/6T+gMsQFDeH7
	St1qS6/UpZK3qEvy5YKtVUvm+h9utPxthNbfNdLmfMFMshCvQZFhlS8ZNhmn2srFAGm2ctlJRdA
	LVgU0/UTlxPWs2bLFa2coxu0TKHIa7QOhS6r2s3/F15fiQBOJeY8sraZ6BWlSbE07E8=
X-Received: by 2002:adf:ef4c:0:b0:38d:bec9:c8d with SMTP id ffacd0b85a97d-38dc936545bmr10411283f8f.53.1739284754974;
        Tue, 11 Feb 2025 06:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVlLeeltNgiMbHSqxLznPIfhFN4eDHUttCSHrTtTV0bsdUK3PjmcFdHZ6fTWELMuF2PXz6rg==
X-Received: by 2002:adf:ef4c:0:b0:38d:bec9:c8d with SMTP id ffacd0b85a97d-38dc936545bmr10411256f8f.53.1739284754577;
        Tue, 11 Feb 2025 06:39:14 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:13 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] KVM: arm64: Allow userspace to change REVIDR_EL1
Date: Tue, 11 Feb 2025 15:39:08 +0100
Message-ID: <20250211143910.16775-3-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143910.16775-1-sebott@redhat.com>
References: <20250211143910.16775-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bBrtP1_Gyya9toV1MTNiyxb8Q96Xd64gypK569x2exM_1739284755
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063918_731886_62DE2589 
X-CRM114-Status: GOOD (  15.73  )
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

Enable VMMs to write REVIDR_EL1 by treating it as a VM ID register.
Trap guest access of REVIDR_EL1 when the VMs value differs from hardware.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 11 ++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3db8c773339e..c8fba4111b77 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -374,6 +374,7 @@ struct kvm_arch {
 	u64 id_regs[KVM_ARM_ID_REG_NUM];
 
 	u64 midr_el1;
+	u64 revidr_el1;
 	u64 ctr_el0;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
@@ -1472,6 +1473,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 		return &ka->id_regs[IDREG_IDX(reg)];
 	case SYS_MIDR_EL1:
 		return &ka->midr_el1;
+	case SYS_REVIDR_EL1:
+		return &ka->revidr_el1;
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	default:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 7e1c9884f62a..646c0a04e58a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1666,7 +1666,8 @@ static bool is_feature_id_reg(u32 encoding)
  */
 static inline bool is_vm_ftr_id_reg(u32 id)
 {
-	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1)
+	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1 ||
+	    id == SYS_REVIDR_EL1)
 		return true;
 
 	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
@@ -2542,6 +2543,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	}
 
 FUNCTION_RESET(midr_el1)
+FUNCTION_RESET(revidr_el1)
 
 
 /*
@@ -2595,6 +2597,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
 	  .reset = reset_midr_el1, .val = GENMASK_ULL(31, 0) },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
+	{ ID_DESC(REVIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
+	  .reset = reset_revidr_el1, .val = -1ULL },
 
 	/*
 	 * ID regs: all ID_SANITISED() entries here must have corresponding
@@ -4646,12 +4650,10 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 		return ((struct sys_reg_desc *)r)->val;			\
 	}
 
-FUNCTION_INVARIANT(revidr_el1)
 FUNCTION_INVARIANT(aidr_el1)
 
 /* ->val is filled in by kvm_sys_reg_table_init() */
 static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
-	{ SYS_DESC(SYS_REVIDR_EL1), NULL, reset_revidr_el1 },
 	{ SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
 };
 
@@ -4999,6 +5001,9 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	if (kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1))
+		vcpu->arch.hcr_el2 |= HCR_TID1;
+
 	if (vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
 
-- 
2.42.0


