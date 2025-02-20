Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BDEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=; b=kf9TZhx5SzPI6iTYR8vYneWaOk
	hWaCQvn+xu26XlR5y/pK7Bs4di7+TKbPCvrflFUMXNtfquVfEzVBE9BkcyWbu5QAullFYB9Pl5S1H
	H6LtyupPUhmtgDSLZTPqUBiYbyQaogA0bMlVqRz6ZXyShA1fAVM01/eAozd2NvTZKRX2DXrHKdQ0S
	4e0W9tphGs+jAVUrlXbGZnOIGYZCeJd7aQFFpyzoKqiZ7H+kdjsx97VcyYug+zgA3tld56ag03Q/B
	szw7dI/GK1A+yPnD+hDNn2Qtb4iJeRWIgt9g27U6isFGdBEBH2N/3YxV5qboo3Q9pszDc2+IQ8S1R
	R5vnJHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2mY-0000000Hb3P-36DX;
	Thu, 20 Feb 2025 09:23:46 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2je-0000000Ha9s-0MnV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:20:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abbae92be71so88301766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043244; x=1740648044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=;
        b=keyBFQEGLwLNU5nfSOLzJUI3H0EC9U17RpIH/5hLJfZinqYcmdenLaUjHGt/TexyOG
         /58dLHdiKKhEGhERynQSpeZ4ev+OSIh1WZgjI6ImWJ2ABDCUzKtdvh5LNf+KegYQMAAo
         CCeenYTXxTp4mhR+YTpqiwwR4i9TmtZOj+BL9BftaeJfyUKVk7l0+sdVoEXBp+I4TNV8
         gfz1CYQZPa6a1AcQsMqLP/UDp2Dg/eHrDF+4rQCMPkSPRKfCxSQc5iAR2mdKrWK0UJLy
         FWQ1NbsXYepZ6K5uoFsh1lpeW22+D5EhwJ9jUp28cb3gAxE0lPrIpREitSe0JgKmXIgz
         Jq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043244; x=1740648044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=;
        b=SsisczRFqGxcVDs3CdmsMjIwqPpme74ZGwFQqH/72yNwUPknTmRzHGSbaBLMDXH6Lu
         3Cd7v8lKctOjLXvHdyL0cUKDIAyUhIf9XuLLx56oo29nN6R5eacsKaT/ufReYlYsU/ZO
         mmI98eBzQTnwBrc3uzMY7NrAmUinaaSIkE0i6T77tzouRmKKUMz9wsb1sg9BExl4Zsec
         zFu8LoG/mU4yNIFsgfUu2erZz7U39ryr1WvRsBDiu/oADhhf7+2zd2mQ3WPcUPWIlNu2
         7guB3NRaGAodqJiz8920r2JX3k7atE1f2NTU/EPYPbR+bKcTqgMcmH2EfC8dzj8aMRUY
         ESCw==
X-Forwarded-Encrypted: i=1; AJvYcCWzUoiX125lf1lfDT7Fw6ZkI/SR6puSrGLynLqHwSk25VDbQTP/eeI6CE2YiOFkkKvpYYeEbJu6ukCrdj9QBLjD@lists.infradead.org
X-Gm-Message-State: AOJu0YyYQ0purskASMLrspDHfFuTnXJwE3sAUEy1w5PQzko6SaoXnani
	WwavG7co5+V2j4pTdOdie2cMBY3A7fFozO33ALDEHaFWRxlUhf4e
X-Gm-Gg: ASbGncu/oWajdz/2SjRUNwJicJLfKmegQGyACmmTTQzTbkpNq9WSC70fLgVODY6x0OK
	NO4IPyDOk/kIlGxxmEUvsHJjrWXXWNZGK/w/xsC9Y/qhMJXbMT9GKamk1gfAYXBxTuMyW+6T+gp
	WVS0zvM34UGsls7C7zDOu6918ZTgRdNku+uSjhNhrqsZCCiXCXKY8Vcnbr639hHv3OoPL8jidJq
	q74WHFBXGxyXZl1+rYHqxDAUd7+g3DxgO7ExLXZKcRw22kmfYVoRWzgm3fwHCuIRLC4wc4jhk1y
	5jSDUi4FSntnpiUyuLHv43ua0qia
X-Google-Smtp-Source: AGHT+IGELBAVHlT1FsAwAPLAfs/8eHa7w1H1BXAuCz31GVyau0LU+/O4GL+wfZn7+PcEvnxYdppSug==
X-Received: by 2002:a05:6402:1ecd:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5e03602f764mr55679741a12.11.1740043243699;
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
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
Subject: [PATCH v2 1/3] media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:33 +0200
Message-ID: <20250220092036.6757-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_012046_133461_31D0DE86 
X-CRM114-Status: GOOD (  17.91  )
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
 include/media/v4l2-subdev.h           | 20 +++++++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a3074f469b150..91fa51259237e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2044,10 +2044,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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
@@ -2068,6 +2067,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
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
index 57f2bcb4eb16c..e49dba3c59bd6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1584,9 +1584,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
 /**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ * v4l2_subdev_routing_xlate_streams() - Translate streams from one pad to another
  *
- * @state: Subdevice state
+ * @routing: Routing used to translate streams from one pad to another
  * @pad0: The first pad
  * @pad1: The second pad
  * @streams: Streams bitmask on the first pad
@@ -1595,7 +1595,7 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
  * the subdev state routing table. Stream numbers don't necessarily match on
  * the sink and source side of a route. This function translates stream numbers
  * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
- * on @pad1 using the routing table from the @state. It returns the stream mask
+ * on @pad1 using the routing table from @routing. It returns the stream mask
  * on @pad1, and updates @streams with the streams that have been found in the
  * routing table.
  *
@@ -1603,6 +1603,20 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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


