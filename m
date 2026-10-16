Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B1CCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT7IvVzrOMLRXWLy95WKGtq61dVNExNnVhplEjrD/S0=; b=VdXtt7mhiLELSOxIIuHTYKOiNH
	2yC5oWYmzB8Hj88STjbaRXKY390dSu0ObIYaQUncJpSV86xoAetw3dXmWaUNrzyGriiuLyMm3GuBz
	DmM8MgdyCbBFsVDEZKlWD9q7c/nTnGnf/QcTpz//VQZKunpBa800ZLSgkoJkVzi1HVouaM/kBwPO0
	mAi914hWfCILMiA6uX6C4WI/PX56VXTMMHzLxrgtBrLglyVDjubsk2pvpAea3C/koIvdvLJdnHe/w
	9TEb/31p6MCoKy3YOrT36m0F/D3RQq3XPNmMZ+HFDWpeYPLce0I1SNGyoIX88E4tcu5WqMa3qgbBa
	GoXcug9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkKS-00000003M59-3JxK;
	Fri, 16 Oct 2026 15:58:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkKL-00000003M1K-1c36
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:58:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88D8E143D;
	Fri, 16 Oct 2026 08:58:33 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF27B3F673;
	Fri, 16 Oct 2026 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792166316; bh=pq2+wWRhfYB/qAuo/UjADcYRpR88rqDHy/3xv7EDzq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JhwKnf3kkTqtWSIkHfurlJhQMGoDHsdffNQkZNaaSQLAqaRdqBIt3gbE/P6jJwt79
	 XJ4UdV/LJ5g8UKgWMHEb+4YqJgqJbBIGWbN95Ryh1VCBBO0mGuemP4nxFyYHz1DWZo
	 7nKdcVqS8+sPVQ7KPx4+8S7t+LQj+8cURSeAL8No=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH 04/16] irqchip/gic-v5: Add ITS MMIO register definitions
Date: Fri, 16 Oct 2026 16:57:29 +0100
Message-Id: <20261016155741.979985-5-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016155741.979985-1-sascha.bischoff@arm.com>
References: <20261016155741.979985-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_085837_535923_A4A2F557 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Introduce the GICv5 ITS MMIO register offsets and bit definitions in
one place before the virtual ITS starts consuming them.

Keeping the ITS register frame definitions together avoids spreading
register-definition churn across the subsequent KVM ITS emulation
patches.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 include/linux/irqchip/arm-gic-v5.h | 126 +++++++++++++++++++++--------
 1 file changed, 92 insertions(+), 34 deletions(-)

diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index a4879774124f8..7e64eb0436394 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -364,50 +364,88 @@
 /*
  * ITS registers and tables structures
  */
-#define GICV5_ITS_IDR1		0x0004
-#define GICV5_ITS_IDR2		0x0008
-#define GICV5_ITS_CR0		0x0080
-#define GICV5_ITS_CR1		0x0084
-#define GICV5_ITS_DT_BASER	0x00c0
-#define GICV5_ITS_DT_CFGR	0x00d0
-#define GICV5_ITS_DIDR		0x0100
-#define GICV5_ITS_EIDR		0x0108
-#define GICV5_ITS_INV_EVENTR	0x010c
-#define GICV5_ITS_INV_DEVICER	0x0110
-#define GICV5_ITS_STATUSR	0x0120
-#define GICV5_ITS_SYNCR		0x0140
-#define GICV5_ITS_SYNC_STATUSR	0x0148
-
-#define GICV5_ITS_IDR1_L2SZ			GENMASK(10, 8)
-#define GICV5_ITS_IDR1_ITT_LEVELS		BIT(7)
-#define GICV5_ITS_IDR1_DT_LEVELS		BIT(6)
-#define GICV5_ITS_IDR1_DEVICEID_BITS		GENMASK(5, 0)
+#define GICV5_ITS_IDR0			0x0000
+#define GICV5_ITS_IDR1			0x0004
+#define GICV5_ITS_IDR2			0x0008
+#define GICV5_ITS_IIDR			0x0040
+#define GICV5_ITS_AIDR			0x0044
+#define GICV5_ITS_CR0			0x0080
+#define GICV5_ITS_CR1			0x0084
+#define GICV5_ITS_DT_BASER		0x00c0
+#define GICV5_ITS_DT_CFGR		0x00d0
+#define GICV5_ITS_DIDR			0x0100
+#define GICV5_ITS_EIDR			0x0108
+#define GICV5_ITS_INV_EVENTR		0x010c
+#define GICV5_ITS_INV_DEVICER		0x0110
+#define GICV5_ITS_READ_EVENTR		0x0114
+#define GICV5_ITS_READ_EVENT_DATAR	0x0118
+#define GICV5_ITS_STATUSR		0x0120
+#define GICV5_ITS_SYNCR			0x0140
+#define GICV5_ITS_SYNC_STATUSR		0x0148
+#define GICV5_ITS_GEN_EVENT_DIDR	0x0180
+#define GICV5_ITS_GEN_EVENT_EIDR	0x0188
+#define GICV5_ITS_GEN_EVENTR		0x018c
+#define GICV5_ITS_GEN_EVENT_STATUSR	0x0190
+#define GICV5_ITS_MEC_IDR		0x01c0
+#define GICV5_ITS_MEC_MECID_R		0x01c4
+#define GICV5_ITS_MPAM_IDR		0x0200
+#define GICV5_ITS_MPAM_PARTID_R		0x0204
+#define GICV5_ITS_SWERR_STATUSR		0x0240
+#define GICV5_ITS_SWERR_SYNDROMER0	0x0248
+#define GICV5_ITS_SWERR_SYNDROMER1	0x0250
+#define GICV5_ITS_MPAM_PMGR		0x0258
+
+#define GICV5_ITS_TRANSLATER		0x0000
+#define GICV5_ITS_RL_TRANSLATER		0x0008
+
+#define GICV5_ITS_IDR0_ITSID		GENMASK(31, 16)
+#define GICV5_ITS_IDR0_SWE		BIT(8)
+#define GICV5_ITS_IDR0_MPAM		BIT(7)
+#define GICV5_ITS_IDR0_MEC		BIT(6)
+#define GICV5_ITS_IDR0_PA_RANGE		GENMASK(5, 2)
+#define GICV5_ITS_IDR0_DOM		GENMASK(1, 0)
+
+#define GICV5_ITS_IDR0_DOMAIN_SECURE		0b00
+#define GICV5_ITS_IDR0_DOMAIN_NON_SECURE	0b01
+#define GICV5_ITS_IDR0_DOMAIN_EL3		0b10
+#define GICV5_ITS_IDR0_DOMAIN_REALM		0b11
+
+#define GICV5_ITS_IDR1_L2SZ		GENMASK(10, 8)
+#define GICV5_ITS_IDR1_ITT_LEVELS	BIT(7)
+#define GICV5_ITS_IDR1_DT_LEVELS	BIT(6)
+#define GICV5_ITS_IDR1_DEVICEID_BITS	GENMASK(5, 0)
 
 #define GICV5_ITS_IDR1_L2SZ_SUPPORT_4KB(r)	FIELD_GET(BIT(8), (r))
 #define GICV5_ITS_IDR1_L2SZ_SUPPORT_16KB(r)	FIELD_GET(BIT(9), (r))
 #define GICV5_ITS_IDR1_L2SZ_SUPPORT_64KB(r)	FIELD_GET(BIT(10), (r))
 
-#define GICV5_ITS_IDR2_XDMN_EVENTs		GENMASK(6, 5)
-#define GICV5_ITS_IDR2_EVENTID_BITS		GENMASK(4, 0)
+#define GICV5_ITS_IDR2_XDMN_EVENTS	GENMASK(6, 5)
+#define GICV5_ITS_IDR2_EVENTID_BITS	GENMASK(4, 0)
 
-#define GICV5_ITS_CR0_IDLE			BIT(1)
-#define GICV5_ITS_CR0_ITSEN			BIT(0)
+#define GICV5_ITS_IIDR_PRODUCT_ID	GENMASK(31, 20)
+#define GICV5_ITS_IIDR_VARIANT		GENMASK(19, 16)
+#define GICV5_ITS_IIDR_REVISION		GENMASK(15, 12)
+#define GICV5_ITS_IIDR_IMPLEMENTER	GENMASK(11, 0)
 
-#define GICV5_ITS_CR1_ITT_RA			BIT(7)
-#define GICV5_ITS_CR1_DT_RA			BIT(6)
-#define GICV5_ITS_CR1_IC			GENMASK(5, 4)
-#define GICV5_ITS_CR1_OC			GENMASK(3, 2)
-#define GICV5_ITS_CR1_SH			GENMASK(1, 0)
+#define GICV5_ITS_AIDR_COMPONENT	GENMASK(11, 8)
+#define GICV5_ITS_AIDR_ARCHMAJORREV	GENMASK(7, 4)
+#define GICV5_ITS_AIDR_ARCHMINORREV	GENMASK(3, 0)
 
-#define GICV5_ITS_DT_CFGR_STRUCTURE		BIT(16)
-#define GICV5_ITS_DT_CFGR_L2SZ			GENMASK(7, 6)
-#define GICV5_ITS_DT_CFGR_DEVICEID_BITS		GENMASK(5, 0)
+#define GICV5_ITS_CR0_IDLE		BIT(1)
+#define GICV5_ITS_CR0_ITSEN		BIT(0)
 
-#define GICV5_ITS_DT_BASER_ADDR_MASK		GENMASK_ULL(55, 3)
+#define GICV5_ITS_CR1_ITT_RA		BIT(7)
+#define GICV5_ITS_CR1_DT_RA		BIT(6)
+#define GICV5_ITS_CR1_IC		GENMASK(5, 4)
+#define GICV5_ITS_CR1_OC		GENMASK(3, 2)
+#define GICV5_ITS_CR1_SH		GENMASK(1, 0)
 
-#define GICV5_ITS_INV_DEVICER_I			BIT(31)
-#define GICV5_ITS_INV_DEVICER_EVENTID_BITS	GENMASK(5, 1)
-#define GICV5_ITS_INV_DEVICER_L1		BIT(0)
+#define GICV5_ITS_DT_BASER_ADDR_MASK	GENMASK_ULL(55, 3)
+#define GICV5_ITS_DT_BASER_ADDR_SHIFT	3ULL
+
+#define GICV5_ITS_DT_CFGR_STRUCTURE	BIT(16)
+#define GICV5_ITS_DT_CFGR_L2SZ		GENMASK(7, 6)
+#define GICV5_ITS_DT_CFGR_DEVICEID_BITS	GENMASK(5, 0)
 
 #define GICV5_ITS_DIDR_DEVICEID			GENMASK_ULL(31, 0)
 
@@ -417,6 +455,17 @@
 #define GICV5_ITS_INV_EVENTR_ITT_L2SZ		GENMASK(2, 1)
 #define GICV5_ITS_INV_EVENTR_L1			BIT(0)
 
+#define GICV5_ITS_INV_DEVICER_I			BIT(31)
+#define GICV5_ITS_INV_DEVICER_EVENTID_BITS	GENMASK(5, 1)
+#define GICV5_ITS_INV_DEVICER_L1		BIT(0)
+
+#define GICV5_ITS_READ_EVENTR_R			BIT(31)
+
+#define GICV5_ITS_READ_EVENT_DATAR_VIRT		BIT_ULL(63)
+#define GICV5_ITS_READ_EVENT_DATAR_VM_ID	GENMASK_ULL(47, 32)
+#define GICV5_ITS_READ_EVENT_DATAR_VALID	BIT_ULL(31)
+#define GICV5_ITS_READ_EVENT_DATAR_LPI_ID	GENMASK_ULL(23, 0)
+
 #define GICV5_ITS_STATUSR_IDLE			BIT(0)
 
 #define GICV5_ITS_SYNCR_SYNC			BIT_ULL(63)
@@ -425,6 +474,15 @@
 
 #define GICV5_ITS_SYNC_STATUSR_IDLE		BIT(0)
 
+#define GICV5_ITS_GEN_EVENT_DIDR_DEVICEID	GENMASK_ULL(31, 0)
+
+#define GICV5_ITS_GEN_EVENT_EIDR_EVENTID	GENMASK(15, 0)
+
+#define GICV5_ITS_GEN_EVENTR_R			BIT(31)
+#define GICV5_ITS_GEN_EVENTR_TARGET_DOMAIN	GENMASK(1, 0)
+
+#define GICV5_ITS_GEN_EVENT_STATUSR_IDLE	BIT(0)
+
 #define GICV5_DTL1E_VALID			BIT_ULL(0)
 /* Note that there is no shift for the address by design */
 #define GICV5_DTL1E_L2_ADDR_MASK		GENMASK_ULL(55, 3)
-- 
2.34.1


