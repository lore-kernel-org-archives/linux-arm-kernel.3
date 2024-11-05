Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268ACD2B950
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBg5+36qAG3/U6TCUA7nVYufsOJ9DF8ZQP7Y/0/CzU4=; b=ZKX/LXazpvSESrn1bZ/hv04Eyf
	027KPp2TbymtetIB176xb0exzqySDq8dBSpgV0TVCiCRsJhxQLz8k+1niB1QtfP6NJBS38636fqYq
	XTE6rWjngEybm+HSf7DdNl2sbnp4ppLr+nJZ7CEkyenFAlFJyZkyaXNN4brMwYRDFowpaXVqrzYkQ
	wJXqpWV7xkDADCzxb/T+kA6lJ8b0jVT3FadoVCMRXyUWImmAT6AG+XJ+kfdaTurOOg6g3TodcstV6
	sVmEvK9FgtSk0eflsCCIitvDWO/K1mHKfxoc5FpTcSfB4PLMNomg9XtzGcR2Vz/lJGhlWbi2zzlgb
	YBYLzdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8M7y-0000000HaH0-4AOT;
	Tue, 05 Nov 2024 16:09:59 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxE-0000000HWvG-3YIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:56 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5BvcWo014025;
	Tue, 5 Nov 2024 15:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=r
	Bg5+36qAG3/U6TCUA7nVYufsOJ9DF8ZQP7Y/0/CzU4=; b=lph8tXqVOWGVH40Fy
	pLzu4cLxFFUm29ewGjAfk6hoThm0AlX8kQAvPirkQVe7iovgrRKV73HhuMGrl6f/
	Uu7cIG517nHkZH2jJxxxeytcYEJPj1cGY0Mm6rLQO2FguUcEtuSNCsM1YzA4/7L2
	CmKVJIp/nRPBd+L5XxHlk2NkH7Q7LeI+wB9JFUngWvlkeow3NWEPD2jD48QztJNu
	btX40fZWi3rpFFM7b+i90vdhtdVTLQ4055TEmg/x3Bj+ZYRhoqoR1re2lCu48zNB
	FXpJjsP5dfn5I8Ix1WgZKPQlQz6lv7wkAStNZWdtHEWUGF0bY6qK7HbcImsACAml
	1IU/A==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42nb7wta0w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:35 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:34 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:21 +0000
Subject: [PATCH 15/21] drm/imagination: Add register required for RISC-V
 firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-15-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=2HpRktmfy1U6jr8J3ea/Pgv7sNS8R2Iklnor8GHoR+8=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcybuc3cb/W12IWiZiYCXIGP7Gdd7JXo89x+vCBb4
 pLnuuqYjlIWBjEOBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZgIgxsjw0kfizPHT/RK8BcV
 RQmpbt+zMKsy5zfHxNRP7wvlJPOWJTH8d08w8Nx/zHCfz6vVz+7xP/tuE/c2qD545YwlglK3ua3
 deAA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=ddzS3mXe c=1 sm=1 tr=0 ts=672a40ab cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=7nAL0jd3kcEsRNnToT4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: GEJNvXW4nWR-VrQzYuyh-Sm4pi7y_bAI
X-Proofpoint-ORIG-GUID: GEJNvXW4nWR-VrQzYuyh-Sm4pi7y_bAI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_075853_461671_9F8110A9 
X-CRM114-Status: GOOD (  11.41  )
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

Add definitions for a register required for a subsequent patch adding
support for RISC-V firmware. ROGUE_CR_FWCORE_DMI_DMCONTROL is used to
control the debug module in the firmware processor.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h b/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
index 2a90d02796d3e071b18e18dead105e29798bcddc..4e99832a667a2d88ee21469595d3abdad3a07c06 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
@@ -3751,7 +3751,22 @@
 
 /* Register ROGUE_CR_FWCORE_DMI_DMCONTROL */
 #define ROGUE_CR_FWCORE_DMI_DMCONTROL 0x3480U
-#define ROGUE_CR_FWCORE_DMI_DMCONTROL_MASKFULL 0x0000000000000000ULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_MASKFULL 0x00000000D0000003ULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_HALTREQ_SHIFT 31U
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_HALTREQ_CLRMSK 0x7FFFFFFFULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_HALTREQ_EN 0x80000000ULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_RESUMEREQ_SHIFT 30U
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_RESUMEREQ_CLRMSK 0xBFFFFFFFULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_RESUMEREQ_EN 0x40000000ULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_ACKHAVERESET_SHIFT 28U
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_ACKHAVERESET_CLRMSK 0xEFFFFFFFULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_ACKHAVERESET_EN 0x10000000ULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_NDMRESET_SHIFT 1U
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_NDMRESET_CLRMSK 0xFFFFFFFDULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_NDMRESET_EN 0x00000002ULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_DMACTIVE_SHIFT 0U
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_DMACTIVE_CLRMSK 0xFFFFFFFEULL
+#define ROGUE_CR_FWCORE_DMI_DMCONTROL_DMACTIVE_EN 0x00000001ULL
 
 /* Register ROGUE_CR_FWCORE_DMI_DMSTATUS */
 #define ROGUE_CR_FWCORE_DMI_DMSTATUS 0x3488U

-- 
2.47.0


