Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8AACCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgkYS8W41TWW7Qh0J3Gb/1uoJw3SePkNINmDDJhIeDQ=; b=q7n/EjX3YGUT8cEA1iEK0zU9VZ
	FlHWLjTa5UJmDDYakwcsSi4voK3DFhwmhJWMG3vvitJLEwVDssAGzanKXn6eUREi2fTRU++pvMvvg
	aeiQiUOgl2yHV1SQtgw0TRa3ttbVPP86UIY0zU9qly82Q/zvdyMTOiVhN6qjtk1xf5pwj9eDKR2Uz
	jWoRUP0QzEub4F0qqsaWBQ4G53M6QywAol1UCq659Fwm5Lx2ZWkn8v+7XVpflvt69pGMDMMKKloRV
	FhDiikdcae9HOOhrgXOvIg6BSSDbaNd4AlUABVeY+BkBDUED0AuK/dYySuyKKm+w0rh7jJlYIMkoP
	Yk5AlXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPNE-000000010sR-20MJ;
	Thu, 15 Oct 2026 17:36:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPNC-000000010rL-4ApC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 17:36:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 720CF43ED2;
	Thu, 15 Oct 2026 17:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A511F000C7;
	Thu, 15 Oct 2026 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792085770;
	bh=NgkYS8W41TWW7Qh0J3Gb/1uoJw3SePkNINmDDJhIeDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pt32eBppSHO6O9Iy1mACmhSAlKzeXbofrCsUOXjNg/gh4ODe7GqKWzJja3HR7vsq+
	 7zynSzC23ux0/u8xH62WLLzyXMaBRlgrpOQ5wVdb36/E16s6Q0sU3dPa8k6/auKGIF
	 KLy3yUbuJLH1KJ63YW/v8oSShmfQDFmzfm5PcmSbiIlmjZ1swlPxjCAgukF6JGTwL8
	 Dh91H2Jw43IuY06Lp4lU/oJm0fmUXcq9XR5rePgr82iwY6Ax0wMc2Oxl6xeibh+i1l
	 suCQWseSg+/onCLEE15szp9FM4UV2MCh+7cd+5H7AQw2wKGRM9VgUV1juWgr/KpTlw
	 x6NlHVzY2lhlQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xHPNA-00000003Q3a-2Q87;
	Thu, 15 Oct 2026 17:36:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 2/2] KVM: arm64: Get rid of compatibility HCR_EL2 aliases
Date: Thu, 15 Oct 2026 18:36:05 +0100
Message-ID: <20261015173605.1072963-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015173605.1072963-1-maz@kernel.org>
References: <20261015173605.1072963-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Now that we dropped out reliance on the old HCR_EL2 aliases, do the
right thing and purge the kernel of the compatibility definitions.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h | 65 --------------------------------
 1 file changed, 65 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index b78e5ce08905b..ae2dafd21cb7c 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -14,71 +14,6 @@
 #include <asm/esr.h>
 #include <asm/sysreg.h>
 
-/*
- * Because I'm terribly lazy and that repainting the whole of the KVM
- * code with the proper names is a pain, use a helper to map the names
- * inherited from AArch32 with the new fancy nomenclature. One day...
- */
-#define	__HCR(x)	HCR_EL2_##x
-
-#define HCR_TID5	__HCR(TID5)
-#define HCR_DCT		__HCR(DCT)
-#define HCR_ATA_SHIFT	__HCR(ATA_SHIFT)
-#define HCR_ATA		__HCR(ATA)
-#define HCR_TTLBOS	__HCR(TTLBOS)
-#define HCR_TTLBIS	__HCR(TTLBIS)
-#define HCR_ENSCXT	__HCR(EnSCXT)
-#define HCR_TOCU	__HCR(TOCU)
-#define HCR_AMVOFFEN	__HCR(AMVOFFEN)
-#define HCR_TICAB	__HCR(TICAB)
-#define HCR_TID4	__HCR(TID4)
-#define HCR_FIEN	__HCR(FIEN)
-#define HCR_FWB		__HCR(FWB)
-#define HCR_NV2		__HCR(NV2)
-#define HCR_AT		__HCR(AT)
-#define HCR_NV1		__HCR(NV1)
-#define HCR_NV		__HCR(NV)
-#define HCR_API		__HCR(API)
-#define HCR_APK		__HCR(APK)
-#define HCR_TEA		__HCR(TEA)
-#define HCR_TERR	__HCR(TERR)
-#define HCR_TLOR	__HCR(TLOR)
-#define HCR_E2H		__HCR(E2H)
-#define HCR_ID		__HCR(ID)
-#define HCR_CD		__HCR(CD)
-#define HCR_RW		__HCR(RW)
-#define HCR_TRVM	__HCR(TRVM)
-#define HCR_HCD		__HCR(HCD)
-#define HCR_TDZ		__HCR(TDZ)
-#define HCR_TGE		__HCR(TGE)
-#define HCR_TVM		__HCR(TVM)
-#define HCR_TTLB	__HCR(TTLB)
-#define HCR_TPU		__HCR(TPU)
-#define HCR_TPC		__HCR(TPCP)
-#define HCR_TSW		__HCR(TSW)
-#define HCR_TACR	__HCR(TACR)
-#define HCR_TIDCP	__HCR(TIDCP)
-#define HCR_TSC		__HCR(TSC)
-#define HCR_TID3	__HCR(TID3)
-#define HCR_TID2	__HCR(TID2)
-#define HCR_TID1	__HCR(TID1)
-#define HCR_TID0	__HCR(TID0)
-#define HCR_TWE		__HCR(TWE)
-#define HCR_TWI		__HCR(TWI)
-#define HCR_DC		__HCR(DC)
-#define HCR_BSU		__HCR(BSU)
-#define HCR_BSU_IS	__HCR(BSU_IS)
-#define HCR_FB		__HCR(FB)
-#define HCR_VSE		__HCR(VSE)
-#define HCR_VI		__HCR(VI)
-#define HCR_VF		__HCR(VF)
-#define HCR_AMO		__HCR(AMO)
-#define HCR_IMO		__HCR(IMO)
-#define HCR_FMO		__HCR(FMO)
-#define HCR_PTW		__HCR(PTW)
-#define HCR_SWIO	__HCR(SWIO)
-#define HCR_VM		__HCR(VM)
-
 /*
  * The bits we set in HCR:
  * TLOR:	Trap LORegion register accesses
-- 
2.47.3


