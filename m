Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01056C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=; b=M0j+YMfskb3RP66zdKdTis0nIB
	aNMAmZP4AvPWjmHgJWtTnhVAK1PSxUgZZqM9LMIPa7W0sAXuLHIuNIll0z5P3RzydJPbWf5Kh+cru
	+bG06xLM6Cc81z2Gdxk3MwX0OTFyhTL9MxLlceTCCpLdeYia00Kg8U9IhMntUub1TDqPdvY+usthe
	DfT8Z7HcsAJs2ZT09PCEsb8RtJbRgmml7pDaGia+D9VTV50f0yLmUrAVR8Vs93y1JN8u4vaXGcknp
	PVoxQk1ZwTvMDmH5t5wDThdfNIuvqY7Rcv9l9uhxNfjHQcoI+EUCFU8T2O3V4FxhZHzYaZ4OSJbF8
	rG+eIzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpeh-0000000Eb8f-4A6c;
	Wed, 19 Feb 2025 19:22:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpU3-0000000EYSP-2FPx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:11:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abbac134a19so32135866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992306; x=1740597106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=;
        b=ILOpfreRoMkB0u7MwXTGUgbh0U1AhTtaDbKoSzqpQ03ykpkVA0vDbHMyUEgHynEGhN
         dAAibmUMglB61OKSWxo/ggTq3uZ79+X5x3Lv2dmK8CsazATws6asK/yCvmgFKdkjI2eN
         lnmOiK1nDbJB0q+DXw7JxPEGvbs9FxBrrvHJLi8aNMdxSUXW3dtPikMQt6oLCS34PFnX
         AUfrZ8hk5u+5vI/IItjpuKoAsUSWCzp2XJKt23hvof+w1i+Y18UIk5ZxvvBfmhk56L+c
         owjgNB+UusH5aAPUU+txRRkEkDHeVbOM2KbayXqrLEAh8C4wP5CnYJZovf4TYgOU6rPP
         FHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992306; x=1740597106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=;
        b=vE127q6Q1dZJrvzfMMvZqdLO5aLq37TPGch/JF5XqEEmfhjN24b0GjUt5Yd+o8T1ZA
         34CAOe6YDy92cXtk3pCez9jt/N7FpxdtFGWqtQYYIkLjefVfmZp/zhoq0HgaAo0UjXeX
         MhDlrUhZlHUHJuvOoYOOBpCLCQXp2HT7QQHRKvunWLOU6ULLGt/xXPiqmLW2FQQZ2wRt
         5Jtg6e2gZCnj8KpqKyuMBWU25/eqXshnYJrQz4z+NNeKtx+rROSUuoA2wNR3Y5Ey9LlZ
         /EjRggf9SJ3ojf1LIJU2OANfu9VhG2kR1Jc+eV52G3wspM+rOHdVNZbWWVyB8XiIVNVW
         wt8A==
X-Forwarded-Encrypted: i=1; AJvYcCWk5xQUfF4J3E0hSKWJB/BDAAobMPo0YIGr77UyJHPUQAqxSprIZfhmuxVBr+evxfm/ndkt0d1xTfWAecOe2A+B@lists.infradead.org
X-Gm-Message-State: AOJu0YxkrOqp0GtygZJZ2nJqYYOK8NrYONKJ3PKVaOuGt7QN93/oYuOz
	CxoX9UEAn4yKc22OII0rdIgLK6cw0EvoIolbnXOwDcuUhB4+O4To
X-Gm-Gg: ASbGncthxbhvvOsx7wVlnAioiR6CEG7d801Jt1lEypxl3RCEznDj8zFXHMuH8B/r2jQ
	oXM7NmDA090GLNKqfzDXvpttD3gUYBOXC2Wrfe5mZYSChM5dfZGUg4cfprjBsFWBJs1qj3fE3l/
	XyVvPsmyeqzexCMCxr+n4s9rFOCn+eqMsrUcakIDYCM7b0FRd/CazYP/TZKE6ke6aWcYWdxWrSw
	m0tnjSLJWE4CYYXnbJnSpeTCcCtk/g67wo35T7Pd1O7/DnUHLbZS97rBEmYUGUZyGMPWhuL5ke2
	DMCfXMW4Pzi3mTujlo/u0DivB7Xk
X-Google-Smtp-Source: AGHT+IGt33FKjogW2MeCmEg4l06p7Iw7k+Kx5sL28n3odtsZTl47FrANkRpgYS+18doFVosGl8reHA==
X-Received: by 2002:a17:907:2da0:b0:ab7:e47c:b54a with SMTP id a640c23a62f3a-abb71159ef2mr2192693566b.37.1739992305822;
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:30 +0200
Message-ID: <20250219191136.215151-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_111147_575526_5F1A4F3C 
X-CRM114-Status: GOOD (  15.37  )
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

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++++---
 include/media/v4l2-subdev.h           | 18 ++++++++++++++++--
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cde1774c9098d..d1581f1036487 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2042,10 +2042,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
+u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
+				      u32 pad0, u32 pad1, u64 *streams)
 {
-	const struct v4l2_subdev_krouting *routing = &state->routing;
 	struct v4l2_subdev_route *route;
 	u64 streams0 = 0;
 	u64 streams1 = 0;
@@ -2066,6 +2065,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 	*streams = streams0;
 	return streams1;
 }
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
+
+u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
+				    u32 pad0, u32 pad1, u64 *streams)
+{
+	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
+}
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
 
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f2200875b038..90d08e13e016b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1582,9 +1582,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
 /**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ * v4l2_subdev_routing_xlate_streams() - Translate streams from one pad to another
  *
- * @state: Subdevice state
+ * @state: Routing used to translate streams from one pad to another
  * @pad0: The first pad
  * @pad1: The second pad
  * @streams: Streams bitmask on the first pad
@@ -1601,6 +1601,20 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
  *
  * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
  */
+u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
+				      u32 pad0, u32 pad1, u64 *streams);
+
+/**
+ * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ *
+ * @state: Subdevice state
+ * @pad0: The first pad
+ * @pad1: The second pad
+ * @streams: Streams bitmask on the first pad
+ *
+ * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
+ * state as parameter
+ */
 u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 				    u32 pad0, u32 pad1, u64 *streams);
 
-- 
2.48.1


