Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DEC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=; b=Tw3RWMj6niyivofY+eIbTVYQKi
	MrrFX7Kdtkl/UEXfc/Opzn28i5MY7xln1D/9TRUfPfrYuc5MmVa85IK5hE9gU0Igxzdq5r9K0I26k
	Li0SNcMqVYfrE1iXGOW3kMRbouqHRmN3ZkFgWsMIZjLgGuHp6jNFLZFNi5RdjKG15THCZW1CIcI9u
	kVnSq+n3PIdWHpemVID7eO2wZaqQOQCB2pnmK5cMEQm2bVmCGWpv1QySjSczQT/sswnp3yydI7rqf
	CowGWq7XspaZ3B27ErAXTx+Z7jRJ0+PgyNe2yBaR9zYIhdANkG4nL+SHTaDhpjmkw+AREzPXhJ18O
	At7IHZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Y3-00000001JZl-0I80;
	Thu, 20 Feb 2025 14:29:07 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7NH-00000001GWA-3Xmf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:18:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso1358423a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061078; x=1740665878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=D0gCQAVmXVuWWL/M3WfkD1sfHZcScpUwseF/FSiEm0az3T79ABd3iDWyP+uw9OIBDr
         8wha6zi7zu7eDuhZDa6uM7C0Jiinj01DyMaMEQPOzp63RDlmRCcqbt3fOzp3lCGCXr1z
         BuPQP8tc7ldYVFVeGBGAxXyUkvq3GfVKaf75KSRVbjedqcHkgH2sap1pO/CXFYcXsXud
         lanYbcVUEn5P2Hn0nsGWGktdlKKZqnoo9oRU3ZFVi5CoUU6OEO7OW04gPVpUEU6FhdN+
         hmY3W7tANcPGkvajbNKrZPgjal14qyzUMZE3ICgzT+snSG7cYsjZ1Efl9b2+wiTH6q7w
         1L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061078; x=1740665878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=gNbPRuwk8w0he09F0H+gPKook5bA/BRRgydI+QEwGeKVoqi7Eb5jTr3qZPu/SDhBao
         NoXj6MOfppb1FtPr7pTCYWl3oTtmG2jCRGT1GE2TPjzlNNY3tC2Hdc5EA/9/uFCN142Z
         2XCOv4JJj8x5QrKkqlHZY1ZSNXRnjWqXNLLY7vGbXdIPOPRulbJBI9bM0YYM70b9kOe9
         PGn/XNn76Qiyh0yNnsHuZ1yjlqcA/E9P+qyJa0VI5vQ9APq6ga97p63fMDvFm5dxYezm
         WQntHOiOT+38DNQQ6ItECJ4WY8KivBA+dBhOQnc26UOJwJm5hMkxQY6JbeZyFQcz6t+u
         prbg==
X-Forwarded-Encrypted: i=1; AJvYcCX2+6dtgU+XjnoNIJXRCNWG1tTaoAIg/sgYbBP4yOh0waviKsxsuIFOxGGtpuJVhgaWyPMWlB84+Ah35u3uOc3p@lists.infradead.org
X-Gm-Message-State: AOJu0YwjrDcm1xf3Vvc9J8wXpeC5aUJ2Wc/YmoPy89oNd0yCwLbUBedF
	BvM4d/MkDjq09TG56etFAUSogbpiLRf41WKPhyCjseG/ldJX02Fw+K7QrA==
X-Gm-Gg: ASbGnctrkSQgDnWDhEoN7hyf1g/0+Xs7uEXdl5cBf+6+4YXbCazHxGYDbMXTdLUSRwQ
	aIV1xKi7vCAaX4l8FKT46o3LwmwJQibdYbQLKp6lqNch5H9zh43uR1FDPXW5lZE5Au2N2h06jrh
	f8/EwuasFNiVyFqa4BE2tBrvNCGxD0uvODeHgWY5m+hXg3V3b9XYMh9eC0yBsfIjYua21+ZcU97
	IHKTb1h2Kh+yf4bax3A7hHZziqybygycBENFJtqOaCHCMGzpGwtTSQRssO2K27W6wxm5sB8cEO7
	NmapXbDXZkMZjUPmN4YA7hfINgj4
X-Google-Smtp-Source: AGHT+IG+yJuG5x65qDSW6wpTU4i8GdeI5QaF0F4bU7rg7alr8iRr1hZM5jP7CSW2D5EyG71m2P93dg==
X-Received: by 2002:a05:6402:2084:b0:5e0:8c55:52b with SMTP id 4fb4d7f45d1cf-5e08c5515cemr6215804a12.15.1740061077904;
        Thu, 20 Feb 2025 06:17:57 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] media: i2c: imx219: Report streams using frame descriptors
Date: Thu, 20 Feb 2025 16:17:27 +0200
Message-ID: <20250220141739.228714-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061759_889644_4F6D0805 
X-CRM114-Status: GOOD (  13.46  )
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ad1965a91ae3c..4c4ebe54f191b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -990,6 +991,28 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
+				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = imx219_set_stream,
 };
@@ -1000,6 +1023,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.48.1


