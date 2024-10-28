Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA047D33981
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuPaYH7muQ+6E50D/hZ/FPeAmhYFh1B9WY+/CGXP/jw=; b=D++qbGJjIGpLQChb8Dety4nE+u
	i/JNhcqETADQMIOLQwJhRNjioo/JaSgFi8e3TnrAjjfGRzaIDnJP7ig7HopODLJL90Y0sgDBu1ciI
	Bmrjd4tsX+qrJcMs5uYRVPAMUjv971bGsYXE1w6T/VXsZnIJrlJwgrwaUdbhrCeyxyC7X4eJsHUYC
	HWUg/UTNvS9YhXUcExoFo9yrvMdGOuINnScYqIAdM4ej7LeG4KCU26RsoRmLnJv1y6khgOL2KQJaN
	vt7Pt4deKKUhxXUHyTfkQk9P+ySXMaHQbJkJtNK0UO5AecyPKQYPnHZn6DM/Ue3xCMv1oXhfpPIrH
	g2g+rnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Q0p-0000000AxuJ-05YA;
	Mon, 28 Oct 2024 13:42:27 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PzD-0000000AxiD-1Paj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:40:49 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XcZK75skPz9skW;
	Mon, 28 Oct 2024 14:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001;
	t=1730122843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuPaYH7muQ+6E50D/hZ/FPeAmhYFh1B9WY+/CGXP/jw=;
	b=JGmD6ePJLdyNqUmEpNYA5tmL7WTHmkPHpPd+WNxAMn3lX0JLJJmqz0Flwg/0FBdcX9jShB
	ioumr8aoo8JhrZY8ky2obBNuGIDsUiHWFpCYZ1EfSEyBgWSwUdTo9Co4MVuaGpmZWDxdiy
	Ez2ttjEQYEgkqrWs3Uhq+6+lJzQkk/nhGcngAVGinQjCygmRXvPy7NfrU46wDcOlQ7fpo8
	ExjJmnyrckkz/NQocmuZifI2zzGxQReQAFbrEn6W4ameGg7VP+i2qMva9GRuxGPZbw53to
	aSDDEm+W3+sXw9QMMcdOwttxGomeTvwWx0sbjzx1MNIwi6B8wRxobTMN+iXm+A==
From: Steffen Dirkwinkel <lists@steffen.cc>
To: dri-devel@lists.freedesktop.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: xlnx: zynqmp_disp: layer may be null while releasing
Date: Mon, 28 Oct 2024 14:39:40 +0100
Message-ID: <20241028133941.54264-1-lists@steffen.cc>
In-Reply-To: <79aca344-b27e-4b77-aa92-6e4c079486e0@ideasonboard.com>
References: <79aca344-b27e-4b77-aa92-6e4c079486e0@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XcZK75skPz9skW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_064047_675264_2E6A37EC 
X-CRM114-Status: GOOD (  11.76  )
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

layer->info can be null if we have an error on the first layer in
zynqmp_disp_create_layers

Fixes: 1836fd5ed98d ("drm: xlnx: zynqmp_dpsub: Minimize usage of global flag")
Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9368acf56eaf..e4e0e299e8a7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1200,6 +1200,9 @@ static void zynqmp_disp_layer_release_dma(struct zynqmp_disp *disp,
 {
 	unsigned int i;
 
+	if (!layer->info)
+		return;
+
 	for (i = 0; i < layer->info->num_channels; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 
-- 
2.47.0


