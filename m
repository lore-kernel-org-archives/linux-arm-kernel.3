Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A3CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiHBdJbfHrVtpDhp68bjMjb9GJcwMtqCUnZwS8iakKU=; b=igW9T7J1UwxC9oGsO6x1ETA6wf
	XOOzOpfg/v+sXiUKHc/ejmR4AC+v/QJGyXfqRmFVtYPCQbDuRoZNttiJWJBi8fJAclVZWB/ZU4YSl
	xWnjtyHKypTrrOIujDlE0nD8n0EF4Ieci1zrEefBSjBg6dvP3laI6SO3ltbHGjFBH/Sl4ncWSXA04
	/IYSuA3JyDyhAT35EtGqJ139rQfiI4bR08bsjlOu/LutLXl/JGNSJ6pcnNPhsdEVR74h2RrfUGALd
	AEq0oagyKQ4pTw6xU2NML+6XsoR4a6zSnKlLwxSHm4nRManlWiEceYAux8jeTw0g3XaMDJegxC+IH
	C4k4OJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZZV-000000015j2-429M;
	Thu, 28 Aug 2025 10:09:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYUO-00000000tWm-3pq0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MiHBdJbfHrVtpDhp68bjMjb9GJcwMtqCUnZwS8iakKU=; b=Birl1vYJEpA7kB84VCvvcyCInu
	jWWbkDkfkg8JC/F9o6KIhg0q9AuuuG/PTTztoyUTrP5PeVLfTy5IY0m5H4EhL3t2hPNH/fjyfK7ae
	yiK9Ym30vrWPo0ZmrYo9groB68UOqAQqvHjSNbmHxy3CPIKDRUCo7P+UK2jAynWY2NBLhm5GupYC/
	wbCopi50L98YNKm2wbxL6UT1xBh3jgWG9m5F5/ddMPw8FN1s4cBQ15AvHq84rAVgzMUdV9213DNL7
	T5sRPlFbweLs9RWHC8se2hl1AGXgbhvG4963GXpWNaOlp+33VhyTiekOZ4KPeciSuEQ5Ugbd6whCV
	re13wChQ==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYUC-00000002g39-1ULo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:00:11 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250828085944epoutp032f72d65355c84464c9662b0f33efed14~f4qZ2xVAO0033100331epoutp03R
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:59:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250828085944epoutp032f72d65355c84464c9662b0f33efed14~f4qZ2xVAO0033100331epoutp03R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371584;
	bh=MiHBdJbfHrVtpDhp68bjMjb9GJcwMtqCUnZwS8iakKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aI9Np7hyuBLbHIWLY0jpDY7dsMh/oXWangAfqzVGy2BjMExfkD8HDLTqQfWIQfBvB
	 vCDaAxcbUylGe9nfbShqx8TZoiuM+clQqBCsQdMV+hnZMgExL6/0k68lMutJs8EfRH
	 VF4Uaavl1LgH7jTyk8oCNByXJV/yaQz1AYx7bRCc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250828085943epcas5p2abc570ed0afce51201230b0a623628f4~f4qZiduZm0593805938epcas5p2s;
	Thu, 28 Aug 2025 08:59:43 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCFhZ6w18z2SSKZ; Thu, 28 Aug
	2025 08:59:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7~f4qX9omGJ1633316333epcas5p3d;
	Thu, 28 Aug 2025 08:59:42 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085939epsmtip2842c1ef84d867f70baaae3e4d034b56d~f4qVS88A00283502835epsmtip2X;
	Thu, 28 Aug 2025 08:59:39 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 5/7] media: imx-mipi-csis: Add support for dynamic VC
 selection
Date: Thu, 28 Aug 2025 14:29:09 +0530
Message-ID: <20250828085911.81266-6-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_100003_577507_4EFA0A78 
X-CRM114-Status: GOOD (  22.30  )
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

The existing implementation configures VC0 by default for streaming.
This patch adds support to obtain the VC dynamically from the
subdevice(Sensor) through the get_frame_desc() operation and configure
the corresponding VC when starting the stream.

If get_frame_desc() is not implemented by the subdevice, VC0 will be
selected by default for configuration and streaming.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 61 ++++++++++++++++++----
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2443906377bd..b7ab441cc78a 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -334,6 +334,7 @@ struct mipi_csis_device {
 	struct regulator *mipi_phy_regulator;
 
 	const struct mipi_csis_info *info;
+	unsigned int vc;
 	unsigned int num_channels;
 
 	struct v4l2_subdev sd;
@@ -585,7 +586,7 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 	u32 val;
 
 	/* Color format */
-	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
+	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(csis->vc));
 	val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK |
 		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
 
@@ -606,10 +607,10 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
 
 	val |= MIPI_CSIS_ISPCFG_DATAFORMAT(csis_fmt->data_type);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(csis->vc), val);
 
 	/* Pixel resolution */
-	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0),
+	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(csis->vc),
 			MIPI_CSIS_ISP_RESOL_VRESOL(format->height) |
 			MIPI_CSIS_ISP_RESOL_HRESOL(format->width));
 }
@@ -683,14 +684,14 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
 			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
 
-	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0),
+	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(csis->vc),
 			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
 			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
 			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
-	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
-	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
+	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(csis->vc);
+	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(csis->vc, 15);
 	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
@@ -707,7 +708,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	/* Update the shadow register. */
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
-			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
+			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(csis->vc) |
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
@@ -778,7 +779,7 @@ static void mipi_csis_queue_event_sof(struct mipi_csis_device *csis)
 	};
 	u32 frame;
 
-	frame = mipi_csis_read(csis, MIPI_CSIS_FRAME_COUNTER_CH(0));
+	frame = mipi_csis_read(csis, MIPI_CSIS_FRAME_COUNTER_CH(csis->vc));
 	event.u.frame_sync.frame_sequence = frame;
 	v4l2_event_queue(csis->sd.devnode, &event);
 }
@@ -810,7 +811,7 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 		}
 	}
 
-	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
+	if (status & MIPI_CSIS_INT_SRC_FRAME_START(csis->vc))
 		mipi_csis_queue_event_sof(csis);
 
 	spin_unlock_irqrestore(&csis->slock, flags);
@@ -1191,7 +1192,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	entry->flags = 0;
 	entry->pixelcode = csis_fmt->code;
-	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.vc = csis->vc;
 	entry->bus.csi2.dt = csis_fmt->data_type;
 
 	return 0;
@@ -1269,6 +1270,39 @@ static const struct v4l2_subdev_internal_ops mipi_csis_internal_ops = {
 	.init_state		= mipi_csis_init_state,
 };
 
+static int mipi_csis_get_vc(struct mipi_csis_device *csis)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	int ret;
+
+	ret = v4l2_subdev_call(csis->source.sd, pad, get_frame_desc, csis->source.pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(csis->dev, "get_frame_desc failed on source subdev\n");
+		return ret;
+	}
+
+	/* If remote subdev does not implement .get_frame_desc default to VC0 */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(csis->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
+		return -EINVAL;
+	}
+
+	if (!fd.num_entries) {
+		dev_err(csis->dev, "get_frame_desc returned zero enteries\n");
+		return -EINVAL;
+	}
+
+	if (fd.entry[0].bus.csi2.vc >= csis->num_channels) {
+		dev_err(csis->dev, "get_frame_desc returned invalid virtual channel\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
 /* -----------------------------------------------------------------------------
  * Media entity operations
  */
@@ -1296,6 +1330,13 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 
 		csis->source.sd = remote_sd;
 		csis->source.pad = remote_pad;
+
+		ret = mipi_csis_get_vc(csis);
+
+		if (ret < 0)
+			return -EBUSY;
+
+		csis->vc = ret;
 	} else {
 		csis->source.sd = NULL;
 		csis->source.pad = NULL;
-- 
2.49.0


