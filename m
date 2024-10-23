Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3DCF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGAk2uRv+7yVnyUwOZXQqu+RWeUcifZVhWERCAO0Xq8=; b=hzJPIUCeJMQgMN8TQmFTCBgGIp
	3NcU4Nbl5QE5rp42qB8PdRP/4Rv47CRtzvmOkDOpGeumbTfa7afps9y4pa9vwIWUTGBL2Y37A8vCe
	2n0p2/lBVzScOHR5TyFrD6sNaDQ/ItDq3gJWEO+USEqMzW55NdhAQs5r3zKjfjDyoKYRji/SghhaX
	Ce6WZuTxhzaD6xI5LUkyfzyiADj4WDNUmeSSBYOKbIVzph4VohpE3KSMc/sUDga0TntBq/JbU8iv7
	uepUzFJ9JYHpOqgrJ0a7T7Ic337snleGU6TIQyvG1BC1TjIn7DlCmEedYVGHeTQuKiyylz9Kz6KI7
	eGf9I8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d0s-0000000Eto2-12Lc;
	Wed, 23 Oct 2024 15:11:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckF-0000000EpJL-19z2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09256A45001;
	Wed, 23 Oct 2024 14:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0165C4CEEC;
	Wed, 23 Oct 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695232;
	bh=qTU8Sn0UfT+g1/7CEvxr+5RdaQfMXlRaTE9fmjoEjhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwaQS/XMU4/rTO4AerKcgN1GHCbJ8UI/gf14ymG0q9krL+G6UrbZWNzWGOWihyUja
	 8o5kzQB+RbT9V2zLLGHudj6Y1ubHwKoGp275tFNahl1vFRZEimAou7AMtIX7dQYOeA
	 GE/lEVzBeFOgfGmq7AYaWQZk5/bElJ7uvigEd79jsIG3CS/IUsNQQgi2uItRRRXS+l
	 fAxU30XBvr91hsYUy6GgeXqPFvINLr+iVtErK6Lwl6z+V18teMER4QSl5ndolCmcVK
	 JgnIbRJDGnzipbgd5upcfmx5bkCSzaWaogakKEpDj+OmiI1QqV/lcOIQFU7kjkKvIC
	 lPhg40mhaQF9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckB-0068vz-3H;
	Wed, 23 Oct 2024 15:53:51 +0100
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
Subject: [PATCH v5 08/37] KVM: arm64: Correctly access TCR2_EL1, PIR_EL1, PIRE0_EL1 with VHE
Date: Wed, 23 Oct 2024 15:53:16 +0100
Message-Id: <20241023145345.1613824-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_075355_617388_8B460184 
X-CRM114-Status: GOOD (  13.54  )
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

For code that accesses any of the guest registers for emulation
purposes, it is crucial to know where the most up-to-date data is.

While this is pretty clear for nVHE (memory is the sole repository),
things are a lot muddier for VHE, as depending on the SYSREGS_ON_CPU
flag, registers can either be loaded on the HW or be in memory.

Even worse with NV, where the loaded state is by definition partial.

For these reasons, KVM offers the vcpu_read_sys_reg() and
vcpu_write_sys_reg() primitives that always do the right thing.
However, these primitive must know what register to access, and
this is the role of the __vcpu_read_sys_reg_from_cpu() and
__vcpu_write_sys_reg_to_cpu() helpers.

As it turns out, TCR2_EL1, PIR_EL1, PIRE0_EL1 and not described
in the latter helpers, meaning that the AT code cannot use them
to emulate S1PIE.

Add the three registers to the (long) list.

Fixes: 86f9de9db178 ("KVM: arm64: Save/restore PIE registers")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 329619c6fa961..1adf68971bb17 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1030,6 +1030,9 @@ static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
 	case TTBR0_EL1:		*val = read_sysreg_s(SYS_TTBR0_EL12);	break;
 	case TTBR1_EL1:		*val = read_sysreg_s(SYS_TTBR1_EL12);	break;
 	case TCR_EL1:		*val = read_sysreg_s(SYS_TCR_EL12);	break;
+	case TCR2_EL1:		*val = read_sysreg_s(SYS_TCR2_EL12);	break;
+	case PIR_EL1:		*val = read_sysreg_s(SYS_PIR_EL12);	break;
+	case PIRE0_EL1:		*val = read_sysreg_s(SYS_PIRE0_EL12);	break;
 	case ESR_EL1:		*val = read_sysreg_s(SYS_ESR_EL12);	break;
 	case AFSR0_EL1:		*val = read_sysreg_s(SYS_AFSR0_EL12);	break;
 	case AFSR1_EL1:		*val = read_sysreg_s(SYS_AFSR1_EL12);	break;
@@ -1076,6 +1079,9 @@ static inline bool __vcpu_write_sys_reg_to_cpu(u64 val, int reg)
 	case TTBR0_EL1:		write_sysreg_s(val, SYS_TTBR0_EL12);	break;
 	case TTBR1_EL1:		write_sysreg_s(val, SYS_TTBR1_EL12);	break;
 	case TCR_EL1:		write_sysreg_s(val, SYS_TCR_EL12);	break;
+	case TCR2_EL1:		write_sysreg_s(val, SYS_TCR2_EL12);	break;
+	case PIR_EL1:		write_sysreg_s(val, SYS_PIR_EL12);	break;
+	case PIRE0_EL1:		write_sysreg_s(val, SYS_PIRE0_EL12);	break;
 	case ESR_EL1:		write_sysreg_s(val, SYS_ESR_EL12);	break;
 	case AFSR0_EL1:		write_sysreg_s(val, SYS_AFSR0_EL12);	break;
 	case AFSR1_EL1:		write_sysreg_s(val, SYS_AFSR1_EL12);	break;
-- 
2.39.2


