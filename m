Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8512EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=; b=mpcOBj4ID1oYIjla2sFU1NULpW
	uVx/TJZidYoWVedqt5pk1YfAt6J7yHcoXc46ae5hErvBel2/Ami7rPpb0gzQ0XCxPdNF0zojwqk3Q
	xZjDc+sDwjbMIkMHhb0mslFUiwgaxZtyxsBTwRRR7WK8UQFIfAcC44cI4TEHOhukxsvTklWa6Qqxm
	HhHTst4mHA1sqAi57XoDNW+lgeJaQuqr7FN2zSXqNIFc3PdTAkL9cbFWDHPj7NcaxZNv03iUhJQxT
	Ri4bGljQEwUVi9ePi/0GMd782bmOkzt6TGsC2PW9+aT8/EPGBoh035UsameTnC2Ot4wljM8XV2WTR
	UOGzDrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFj3-00000003GMY-1VXG;
	Thu, 20 Feb 2025 23:13:01 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFew-00000003FI9-0GMQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abbae92be71so176012166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092924; x=1740697724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=VFCj7PbPz6QBsND8OI0mKAKkezM1suzxlQZCwTkgEi0FUH+ta0+a1oQa9fCRzFhF9j
         DEJgrmnoUb6cF6xnBZIcVXZtQqSkRWSYje2amp+kQZbC8DstA748RkTf8nUvqRH1EhUj
         IPe2BrU/XRyvbLqOEocML3Tav+C0cq+6pLcIyqs42hvzuWlgSdAIBa6gi5JA4IhfQ5wg
         NPDF3XWA59otSlltvPOaxwGlmdBaykHN+U81ASZMN2Ih+ihKtSMXUkHCSQmT8UJaPOWR
         yytr1zJUpa50VcKOZkTqzRQm+Q4zVAHWfZj4ERcEIT/udWOcH1tivqosMXlRYknALI0l
         WvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092924; x=1740697724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=E8Phdk5prqjcSScA9hQTPZcLqMtK7894NBs2sg0VGFKT13Y7EUWmYX7IGztwUDM67b
         om9pxRbFa3HhXLGskwsjoWX6O3GRu+fTVYnLdmWqmlS0rW8ihyp0vdvufTkwT6ztq92F
         iWnhXFEC2JQ7O5OVzHgERCkw/UYXjo3N1zkmg51mhqcXK8Qvd3Tnf4MTznBK1ZApMdrR
         aeBzYKvcxE8WG/9LkQWykpxU80P4ZMvU9VxGAeMrT5Owo7CsSrvqjq0c8coiBMxT12rP
         K+GpfdtSQYYGNCpogxnFpp+UY0d+ZMdcLbv0Fs712udK+Av7tIWcvH4I24C0AJTlXrp7
         PdUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVNDwWyLvxXQeOj7YujP2GLOkQK3GQecrWJ6EwloaqBA6ljrKEh8wJC/Q+mYd5185+XWlqf7SvK1E4h3LzDAuJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd23JMii8BdYCbLh6JaKTtAyi0kVNNNSVi4RajVC9iaetM5HTl
	zQbAaXHpaTmkY703tQcK82t/xMj//tmX0nSoBR6lIS3iqF93mVSw
X-Gm-Gg: ASbGncu4VPCH8mxEKbc78mrVnLjpfBIVawxk8A+GsbKXyR0erCHW7l5JDynaFGKc1gm
	CYX0JIUUo2Wg+jMCpY1iH1VLnoUtqLkuJBCU+2ocRuBy8aVH6bROQjBcotb5fLaHQj8CB4P10/G
	GO663SAPVXId4CiUBdHigaNoXx5GWK1XQMtGe4zkGvAkJq1jWGZIzDowTyp7KIVpBwTRnm4TR10
	tXGJfqw9tbkmoEFaRtvPiYX7zrPMPE9wJIZi2fvjNsOBR4qSbFMMPe2/fCxf2QMwEPecpBbQRIY
	lzLppmMq4tWWRUws4F5fclsGxaNm
X-Google-Smtp-Source: AGHT+IGI84KAeDso59r/glMSFnTqqVRIRbIaVVOma5XZW7x9oyN/znWeSz2Mp+/p5CWLAdYA/aqo1g==
X-Received: by 2002:a05:6402:27d3:b0:5e0:7510:5787 with SMTP id 4fb4d7f45d1cf-5e0b720ae8emr1532105a12.19.1740092924094;
        Thu, 20 Feb 2025 15:08:44 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 2/6] media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
Date: Fri, 21 Feb 2025 01:08:10 +0200
Message-ID: <20250220230818.275262-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150846_095099_FB1D768D 
X-CRM114-Status: GOOD (  21.12  )
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

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 15 +++++++++++++++
 include/media/v4l2-mediabus.h         |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d..97ecc01e1e39e 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -129,8 +129,10 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 	bool have_clk_lane = false, have_data_lanes = false,
 		have_lane_polarities = false, have_line_orders = false;
 	unsigned int flags = 0, lanes_used = 0;
+	u32 vc_ids_array[V4L2_MBUS_CSI2_MAX_VC_IDS];
 	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	u32 clock_lane = 0;
+	unsigned int num_vc_ids = 0;
 	unsigned int num_data_lanes = 0;
 	bool use_default_lane_mapping = false;
 	unsigned int i;
@@ -208,6 +210,15 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		have_line_orders = true;
 	}
 
+	rval = fwnode_property_count_u32(fwnode, "vc-ids");
+	if (rval > 0) {
+		num_vc_ids =
+			min_t(unsigned int, V4L2_MBUS_CSI2_MAX_VC_IDS, rval);
+
+		fwnode_property_read_u32_array(fwnode, "vc-ids", vc_ids_array,
+					       num_vc_ids);
+	}
+
 	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
 		clock_lane = v;
 		pr_debug("clock lane position %u\n", v);
@@ -248,6 +259,10 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 				bus->data_lanes[i] = array[i];
 		}
 
+		bus->num_vc_ids = num_vc_ids;
+		for (i = 0; i < num_vc_ids; i++)
+			bus->vc_ids[i] = vc_ids_array[i];
+
 		if (have_lane_polarities) {
 			fwnode_property_read_u32_array(fwnode,
 						       "lane-polarities", array,
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 24c738cd78940..291b680d2a845 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -72,6 +72,7 @@
 #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
 
 #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
+#define V4L2_MBUS_CSI2_MAX_VC_IDS		4
 
 /**
  * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
@@ -94,8 +95,10 @@ enum v4l2_mbus_csi2_cphy_line_orders_type {
 /**
  * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
  * @flags: media bus (V4L2_MBUS_*) flags
+ * @vc_ids: an array of Virtual Channel IDs
  * @data_lanes: an array of physical data lane indexes
  * @clock_lane: physical lane index of the clock lane
+ * @num_vc_ids: number of Virtual Channel IDs
  * @num_data_lanes: number of data lanes
  * @lane_polarities: polarity of the lanes. The order is the same of
  *		   the physical lanes.
@@ -104,8 +107,10 @@ enum v4l2_mbus_csi2_cphy_line_orders_type {
  */
 struct v4l2_mbus_config_mipi_csi2 {
 	unsigned int flags;
+	unsigned char vc_ids[V4L2_MBUS_CSI2_MAX_VC_IDS];
 	unsigned char data_lanes[V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	unsigned char clock_lane;
+	unsigned char num_vc_ids;
 	unsigned char num_data_lanes;
 	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
-- 
2.48.1


