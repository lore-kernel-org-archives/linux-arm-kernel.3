Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C42FD4921C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as1cb0Ho8uzTVCC+7kk+ZbW5T7Wctbdgc7WA7ZUdIM4=; b=XQvlU9rYJ6jIvUMvTGjZKUhGXw
	ju7rllwVKvWTzFlwZvx7cIQbujXakv+ehTsMYN1xQ7GDuzQSvrSdgYo81WLwciehdAqRG/0tHowhM
	ZedelySJcNKn6epz8Ta2JtwRMUUUb0njW/Bruq858RDfz8ddmdKmviTzl9wDo6h2xtG6cjzxHkw1H
	RMUgEvvsVosqjqNsvY2A9Sv0tpTRg9kN2nXlpfKMFk+wjBAMQr2ZI3ZkB8wkAiojgbYVtFAAbnEYk
	8cihuTPUH4QsQeXATK3uTSdf8X3TMj5Mk31m9do85xDfVW8BqOiyNGcp/Qudk3rXgg/ktkn4B8ISD
	8I49gFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1aM-00000009Wlb-1rZS;
	Mon, 18 Nov 2024 13:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1PB-00000009Tp7-2kYq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Nov 2024 13:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=as1cb0Ho8uzTVCC+7kk+ZbW5T7Wctbdgc7WA7ZUdIM4=; b=eR5mcRtz0/S46WsixPt07Ff0aZ
	zO5rF2UPcXd7lPDvhzeSYOzC41o6bGiZrheRjeMLtGR+V/1PyvE6NmN8RvJKXf0PM3EEmqf8ztPWP
	XrUzfndNUvt68jTatNe5yw15WoY1TMkfbwdxnY0ELwXjB4jZb2ZhOHGm9bdQpK0n03O6Q9ChSWQ2l
	gBKhwNX7Cc52jXKlO2vI2hSOYRyMrC3pVxm9Hrqhjn9TE1bc7J1HKgpWCeYJWZKe0VNKnCbKD4v9W
	BmHhwEPW5s/7yQdvIeX9PkMgRHcz9Lh6qq9QNfH0rXanqzhiQN+RDR+ky0H8S3I+qbRdL6dtPeY8H
	iA9BNEIw==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1P7-00000000Dpw-05P0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:03:00 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICJqTT027657;
	Mon, 18 Nov 2024 13:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=a
	s1cb0Ho8uzTVCC+7kk+ZbW5T7Wctbdgc7WA7ZUdIM4=; b=s2OPyEmn3G0RHJ7TR
	eOZevDjxtLbmlPOdk486XDR5slREJFh1BuwU5sTZ479lh5AZu6X6PSkupmwtUkWX
	VaBZkd1stIIiE0RftQHBDSuCSWb0SVxGvLPT2avVW4mujO9zOpBoQcpfwjgvfCKC
	hb2zuyP7TeoVQc6dTPrMa57ibkKyQiMZFihwiLuP7GLISvpl83Yg4M/r/RqBp3G9
	OUrswM80M4IBfRpNzBK3Amv/5205vIQpby6qYAbWxqI8MY77ZfqWLylUIvYlY0FF
	Y2hVjWpL5fgGDfEzo9kUg8s5V53Ygwuw/9V23m5mB+Fu5aYhZbjAQb7NdY+RK9WO
	9PPQg==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Nov 2024 13:02:42 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:41 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:07 +0000
Subject: [PATCH v2 15/21] drm/imagination: Add register required for RISC-V
 firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-15-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2191;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=gCR0QmeLLh8m/GksD06xa8wPF2LoimnvoNWbI8BLlgQ=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz27uL2vRprx4rUQhdm++s1THUOOeLx4t51z6dX6w
 4dtpxjqdpSyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBExG4x/HdQ/Sf31DUoJbXb
 0iHqXbDztrvmm35/Zfdb7xvLuFuguYDhf+AiQ7N4zRsLLO4vt2fwsFzkqS/mzehtkfDpxCblY9O
 tGQE=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: ZHzw0g5Vn5KpI8Ec9DW_qkSXOb9wgpjZ
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af2 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=V6O2pL_JGeI7trGcscQA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: ZHzw0g5Vn5KpI8Ec9DW_qkSXOb9wgpjZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_130257_313435_6B4B04B5 
X-CRM114-Status: GOOD (  11.71  )
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
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-15-4ed30e865892@imgtec.com
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


