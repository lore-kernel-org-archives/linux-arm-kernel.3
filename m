Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKJYJ1oT0EntJDKsEyJhIPLgpn+LHAvYW3vyfigr+x8=; b=EM16lko9SOuc7sePe4UxW4/TqZ
	93c6CBJuTSGE57sGQJFbMzMTobjMT7AyZTGf5Bb6yNwyFtczkaKAniSIK5SvhnYZXNDLz3Tf711yR
	afD+P/ZU7S81uw/yWu/wSbutoyBXQYSL8wx+OfFrTRl5T9a5n1+Q2Et9Vv/KizIK+Q/Yd8bzoBtni
	DZy02JQbsohtRjQzh/SD05Ajg31qGZFCoZGamo+euOcHuV2cSWnzV9pSQSYcVrWbjDu3QO8qxpwTH
	eu7VyDjcKw4rs0ktpis9q21JPPv2/ZbMOPQEVVKkGKpNQCaUfnbmaAfdhEOJxnopr1SBqnn2eRV3r
	X3AgvnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treO2-00000002yKv-3mcO;
	Mon, 10 Mar 2025 14:45:46 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcuT-00000002joG-2LHs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:11:14 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A55uUE006364;
	Mon, 10 Mar 2025 13:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=y
	KJYJ1oT0EntJDKsEyJhIPLgpn+LHAvYW3vyfigr+x8=; b=XpLfmm9m9am9EPXzi
	0KWqbFir1uXvZ4bykHpjooqy5rnV4AXN543ChXj/6BEy6FaZc7tZ7VeSReVar2eu
	UqyM860N8D4ROTiHcdFIwVGhP5HK89H/RFh3SWME4RofwUYZXLQ5NKZRpDkz/6mC
	qznaj33Htkx0gQCt+aGAM38rC9eXAe6pKhg9bV9qzbFuqAhFqix1yl8QW+lZ5Frs
	HIgFzCLk82ThXQidQYc8Xw7TBcOIQBLMFYQtuIU3gcEHxU5vbqA9xBE/nJYFal6c
	drglGYPbDA13TqSOdfshO4dn9h73OFIAk1szif1vMGwSPylvR8DNQULS/qi36rRq
	Gj8BA==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 458ev09erv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 10 Mar 2025 13:10:48 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:47 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:30 +0000
Subject: [PATCH v3 06/18] drm/imagination: Mask GPU IRQs in threaded
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-6-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Alessio
 Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=a87pJJ6QRI3G27rMA0r0KqtsR1jW6dnBZW56AiN3m6g=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3KhPzDTqD96caTjQ4u78T8ijm6P/nN5h+ytM4oCR
 5JvbLys1VHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATMXnHyPA46HuPRW8A18NK
 SwOVixZ6wneiOo4ICLSl6R0LZU7/3MbI8FRRzr39ruvvmZuKlMKeFT+cEzBl5yc9SwaPKP30aRl
 fWQA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=67cee4d8 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=r_1tXGB3AAAA:8 a=MXbv0OSQah28ATDbmwsA:9 a=QEXdDO2ut3YA:10
 a=ha9_M8TO0rgdwmpzGQMU:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: mxZIE0gXF2qf_xQozX3THaIJtT_SBUdo
X-Proofpoint-ORIG-GUID: mxZIE0gXF2qf_xQozX3THaIJtT_SBUdo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061109_981941_242AF232 
X-CRM114-Status: GOOD (  15.43  )
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

From: Alessio Belle <alessio.belle@imgtec.com>

Pass IRQF_ONESHOT flag to request_threaded_irq(), so that interrupts will
be masked by the kernel until the end of the threaded IRQ handler. Since
the calls to pvr_fw_irq_enable() and pvr_fw_irq_disable() are now
redundant, remove them.

Interrupts to the host from the soon-to-be-added RISC-V firmware
processors cannot be masked in hardware. This change allows us to continue
using the threaded handler in GPUs with a RISC-V firmware.

For simplicity, the same approach is taken for all firmware processors.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Added
---
 drivers/gpu/drm/imagination/pvr_device.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..b6ce936f07c8bb26d240e50b72a1d991dbe4b045 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -169,8 +169,6 @@ static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 		ret = IRQ_HANDLED;
 	}
 
-	/* Unmask FW irqs before returning, so new interrupts can be received. */
-	pvr_fw_irq_enable(pvr_dev);
 	return ret;
 }
 
@@ -181,10 +179,6 @@ static irqreturn_t pvr_device_irq_handler(int irq, void *data)
 	if (!pvr_fw_irq_pending(pvr_dev))
 		return IRQ_NONE; /* Spurious IRQ - ignore. */
 
-	/* Mask the FW interrupts before waking up the thread. Will be unmasked
-	 * when the thread handler is done processing events.
-	 */
-	pvr_fw_irq_disable(pvr_dev);
 	return IRQ_WAKE_THREAD;
 }
 
@@ -213,9 +207,13 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 	pvr_fw_irq_clear(pvr_dev);
 	pvr_fw_irq_enable(pvr_dev);
 
+	/*
+	 * The ONESHOT flag ensures IRQs are masked while the thread handler is
+	 * running.
+	 */
 	return request_threaded_irq(pvr_dev->irq, pvr_device_irq_handler,
 				    pvr_device_irq_thread_handler,
-				    IRQF_SHARED, "gpu", pvr_dev);
+				    IRQF_SHARED | IRQF_ONESHOT, "gpu", pvr_dev);
 }
 
 /**

-- 
2.48.1


