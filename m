Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F33C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=; b=Cw9Xr0r9Cvmn9fW0kuJu+JA168
	QaEtb7oGuQTzwrayNDLxJj5PPcOmD2CDJpNKMDjIgOT1NNZiU73BQkDOtKGEsicVCceTt15jZLQsp
	IAJh9HjZGP1RSypaQLcR94/nD9env2GzLIeTT+WnVI1QZtGIZdpuxjt5Am8J67VjtW8hZo2VJ1Eps
	PaJMnI3IS626UJsVh/66YezQDQuRmYNAbMJxgXOvm9exTRs2tcq97HY2XXqZbpyMCiuxOOCcgsrHP
	8sLndflWFDmCf3HXZALZmCOfaXWL0bRklH+KK00KhdE7fbE3SOW4qqcArXoMxTPSWBX52mDgLS0WA
	OIMc1Cjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Tf-00000001IHv-04vv;
	Thu, 20 Feb 2025 14:24:35 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7NA-00000001GRx-2hSV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:17:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so1319408a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061071; x=1740665871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=m4WT5fr6OIw5ukFxloyy4nAnCUkCldzJ6nY0eYfLBgybSeq+DDOVNIwLv6NXYF3Z5V
         d7uIukt2SRGVHgsdTA/hp68y90sWhq1oyF9idfw3Mc4tYMkeD5QOu+vzCv3xFviVghiC
         3rf+UFkfGHKg4hXwdwZkX8CQOYN+rRpX2k3HAG8zAwx/hPzHFNDWD7Cko6L4rTUGhu0r
         EJW2dMLOC3tiLxTT13fXY2hACTD/0y7bunJq4L6MQV/mmXX/35e2v4BaJWQcQotXDX3Q
         ALzRUBEo0ULHqxtHKj2Ocm/0zsAY8ZK64D1+cw7CoqwFQjYrBOy2t01w8Zq08y2i1BxN
         /lIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061071; x=1740665871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=hlsJ9Qyi53V75bKv1pGYCilkvM3h+4bomph2Po1l6Vw9liHMKdTzivpmTNhzpHh+HD
         oSNtRNb2veya/VNXoTeAtBMFIXanKjSPVDeaiYwEIq9qGeYGUcZHoQQxNGZEAcDSwvKh
         CZEL5cdeHxhw/sPEJ4tLLvJvHOI8hdp0WZkezl9piv/7fdmlmhEGQKCS8AeXXio/nBYW
         1wzvJ3xiGV4z3nk2XGNaU7gjH1AJDBgGkOFShwO+gFo8UthuNxUbfFQxbckPRBggBc5j
         RbisnKwwoMooP0bdb3jJa4BSbWJ7dpaqXUkzz43i54jw9C+Sx6UU8XCSNiQws13Iq6wW
         odDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlKdXPnxehkrCvnqesB1RkcG79dLyP66GUiCd7UbPfuSCH3FteL4cEdYNUZqESxfHqWsj/k5wHWHGA+55eVfaP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlby5tNEU5C1yvqhSNvlhtfCLMKDAgmDSjI9onjW887ttCjMMP
	P2TcDt4PGhq7ddFbEzgKIvy6UZHcbhCWH1n5wSt2kbNUZ0nvQxJ6X17/uA==
X-Gm-Gg: ASbGncv8b4bGZ831nhgWQoknzO1yF4MIjqJCKvNsG0jKTT0u6o55yLJZ5x/WO5CFmw3
	ikmo0mshnikExwd9fHjm1WAZvFDm1S7JDki2uLXyDxrCc5fx3oN18l1l8EkpCPoS9RPvt30YCoN
	LGQ5Q5SEBmwgN8EnCDRwYd5p5f4m+y18mrg2eD/1Vt0TFszBDDaboc9ZZH+lqGoiQL/9qRc1k/Y
	d5oxJ1yQdGZ4Ry3VjZOyrs6QDreXPOwJg2VRcw16U/uKRlSa4MUDFmzOcw38EHqvgHxcOq2PrCF
	zMkLMVjJDdCZbdBUcwQSOG4YW3Up
X-Google-Smtp-Source: AGHT+IF+XJVyqbiTAhRVT2DX5gAGDj/R1pffrBAQNQzM7DfV9u3X2EU5bwoluW7W/73TKgTxtEDY7Q==
X-Received: by 2002:a05:6402:35c3:b0:5dc:1f35:563 with SMTP id 4fb4d7f45d1cf-5e08950fc04mr7944322a12.7.1740061070649;
        Thu, 20 Feb 2025 06:17:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:49 -0800 (PST)
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
Subject: [PATCH 2/6] media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
Date: Thu, 20 Feb 2025 16:17:24 +0200
Message-ID: <20250220141739.228714-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061752_686683_B16D3F8C 
X-CRM114-Status: GOOD (  21.01  )
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


