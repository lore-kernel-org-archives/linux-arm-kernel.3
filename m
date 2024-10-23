Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9560CF539F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7IG9ClUKrZbF4m0NZ0w/X/fbOOFPcIdyXsx+BX2LIQ=; b=qMy0zO/j0gWtu4Zmwm3AlsqAaO
	YtKP9RVYj9S943VXpLB0mtfNosm3LE/ebiyV4o+QgWzgVwNvPV7Yt8VYn++sSXblM9zwrbNDpd7Rz
	sMSSXzQ/yw7ceGdBVky80eGP5B+IPkbDIJpPudi0GVb58G89XhFgVForRxShHFSu8EN3xFKIy/TuY
	rcLNnf83diijy2kLDy9bhK4qzrXGZv8qlne8bD1M1V525l6c5HMJI8r8dU3M5pX6Jd1Y7YKn2vrH/
	UxZ21U+q/22yy0yUkFTrrOj1+keQQC84oBK0FiPSlQ8f7PYpyZIqtJpL+suaAMJy7iZI85Fef0TPq
	MsbOv6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cxp-0000000Et9A-3yEE;
	Wed, 23 Oct 2024 15:07:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckE-0000000EpHj-0B2J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0950CA45018;
	Wed, 23 Oct 2024 14:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79136C4CEE6;
	Wed, 23 Oct 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695232;
	bh=EpMdlmm/jnve6UFHeWosHwxnjKpz/BqO3pApXnWcWx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZpdHD4mYkDcBhG3rVAcr3KVGDi1bICSyZIhVJmNgZsJw6r2xAmtUDRJ72LlGL3hE
	 8wDRo9Clg3zU3lrxSp/hRtU63ckU7a1HjuGPlUL/ccRjLiJLEoQUJMPFE8WmTJfJ8C
	 gLecLFnELNXuK0wzA0TW1Z3mtdhfdJj7LauiGIRQOeg/EJKs3YONWxBwIyUUcMKMJO
	 pWP24mTa5/K2ULWsSQJLgwarI3Q1rZ334alBGGp2hWI63OGuI8xXoj8PlOaNSrRFvl
	 FocBn+jZ56OK7Yk/xc0OpSaWVOwlyZ35HF9/5rdwFJpUL6mp7NRN7OEB+hX+ihyIFz
	 Y6WnG/d5nMAHg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckA-0068vz-G0;
	Wed, 23 Oct 2024 15:53:50 +0100
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
Subject: [PATCH v5 05/37] KVM: arm64: nv: Add missing EL2->EL1 mappings in get_el2_to_el1_mapping()
Date: Wed, 23 Oct 2024 15:53:13 +0100
Message-Id: <20241023145345.1613824-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_075354_171915_E0B9729D 
X-CRM114-Status: GOOD (  10.13  )
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

As KVM has grown a bunch of new system register for NV, it appears
that we are missing them in the get_el2_to_el1_mapping() list.

Most of them are not crucial as they don't tend to be accessed via
vcpu_read_sys_reg() and vcpu_write_sys_reg().

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index dad88e31f9537..3cd54656a8e2f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -110,6 +110,14 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		PURE_EL2_SYSREG(  RVBAR_EL2	);
 		PURE_EL2_SYSREG(  TPIDR_EL2	);
 		PURE_EL2_SYSREG(  HPFAR_EL2	);
+		PURE_EL2_SYSREG(  HCRX_EL2	);
+		PURE_EL2_SYSREG(  HFGRTR_EL2	);
+		PURE_EL2_SYSREG(  HFGWTR_EL2	);
+		PURE_EL2_SYSREG(  HFGITR_EL2	);
+		PURE_EL2_SYSREG(  HDFGRTR_EL2	);
+		PURE_EL2_SYSREG(  HDFGWTR_EL2	);
+		PURE_EL2_SYSREG(  HAFGRTR_EL2	);
+		PURE_EL2_SYSREG(  CNTVOFF_EL2	);
 		PURE_EL2_SYSREG(  CNTHCTL_EL2	);
 		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
 				  translate_sctlr_el2_to_sctlr_el1	     );
@@ -130,6 +138,7 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
 		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(ZCR_EL2,     ZCR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
 	default:
 		return false;
 	}
-- 
2.39.2


