Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944D5D10C11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaiWgQ1AXzTNomMAaUXn9Y1bpdRE43DfhiGZpik/Y10=; b=AOvvrDLiy8xheoG4jZMT4Q44Pv
	OiNyodl6PkyWM7M8l0N57H1qqYy1t6wj7pOPUYPiUuT2JUuBO7CLoYqRnSobGo/tUTG6D/68C98yD
	nuryHXUXHvX0cNLE5ueHrQW+5zsqAMFEP1dlN1KpjK9dx3248RRajawZUP7T2RDZD234n60bKuGhk
	Hgf06w4Q6lETIgzL0CoRkwizKGff2o2dCuhO1I/OWMS8FtAIuxUabdvKXnfFY/oSvtynnXU//wPxK
	s6DX/r82tN9M3WmZQrOuYRaIDudfTgRqecm+pWAK/yqQCW+fptBCIcvWp104g5KUwzzxm4ZK+bMib
	sXZoYjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Psi-0000000AwjF-13UC;
	Mon, 28 Oct 2024 13:34:04 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Pqr-0000000AwVM-2THT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:32:11 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XcZ6y4czPz9slB;
	Mon, 28 Oct 2024 14:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001;
	t=1730122314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaiWgQ1AXzTNomMAaUXn9Y1bpdRE43DfhiGZpik/Y10=;
	b=luo7zlF9FBoaEfUANDbeaf2YgSmiEd/LXMh1DINtKPbqtLaxF2NaE8YdkrulyYLpKF6tbh
	OlZLLuLVC4MOJVnjscSHavPP5sOkhRnWcSaWo93+IJevkS1B5y1pbqPL9QLfyhkYt56y81
	ik/u3jyHoV3qix7fAqahHeFiuQUBmEJR8ZOgjuMu/n3rWOFgozcfXxdK0/Ff/SfbMgMC3Z
	2aiJ4phODmpoebf4K+0IJpwVCslmGKaQtty5t9q9HkGEBAxiPSC0bw41GzkG/t2JxnWLMw
	MPw8tLVkIv+B9NBm91wEkJ3an53Hz8oZrxqdRnQjGD8Bnihn4Lei61QZJal9uQ==
From: Steffen Dirkwinkel <lists@steffen.cc>
To: dri-devel@lists.freedesktop.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	stable@vger.kernel.org,
	Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: xlnx: zynqmp_dpsub: fix hotplug detection
Date: Mon, 28 Oct 2024 14:31:38 +0100
Message-ID: <20241028133138.52973-1-lists@steffen.cc>
In-Reply-To: <f7fbd696-d739-457b-bebb-571b32ecc1d6@ideasonboard.com>
References: <f7fbd696-d739-457b-bebb-571b32ecc1d6@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XcZ6y4czPz9slB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_063209_775007_C47414F2 
X-CRM114-Status: GOOD (  11.00  )
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

From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

drm_kms_helper_poll_init needs to be called after zynqmp_dpsub_kms_init.
zynqmp_dpsub_kms_init creates the connector and without it we don't
enable hotplug detection.

Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index bd1368df7870..311397cee5ca 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -509,12 +509,12 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	if (ret)
 		return ret;
 
-	drm_kms_helper_poll_init(drm);
-
 	ret = zynqmp_dpsub_kms_init(dpsub);
 	if (ret < 0)
 		goto err_poll_fini;
 
+	drm_kms_helper_poll_init(drm);
+
 	/* Reset all components and register the DRM device. */
 	drm_mode_config_reset(drm);
 
-- 
2.47.0


