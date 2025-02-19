Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5073C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=; b=Mj7Jm6aGBUFiV2c8KCeZM0y1tL
	PWgBKXaDEA+aEuJ62VwWsKBzGes1x27o/ZGhFba9FWIwBJvRSYUMlSU+8RE+6kDb8liC0ooBkNYNr
	dGM1J8ui0KyithOsligBJKdcksVLZfFnO4oFXPM4uspsigWPnFLKuEHD+Cfx7MKeaPJD0W4Bru97E
	04V1REbCjByqn/gAJJHWLL7DwsYgMnNKx+XbIGbJoHZ/vHkztTSjqeVf1qj1sLHKFGDw2V0ogTV6Q
	GtZRM2CWecIKTeCX/o1iFMlOmZkuxSopCFdJUOrhseOAi9aV3eID6Y6HhOoGXXvtcRwReILsAht4O
	kuBh2DzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkphd-0000000Ec5m-1WjA;
	Wed, 19 Feb 2025 19:25:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpUD-0000000EYW4-2EeU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:11:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab78e6edb99so23859066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 11:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992316; x=1740597116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=;
        b=Lq3GCjb8TBNNg8ChVwUpNcaCl5Fq0ogKiqo9O308zwSLR7ach25nB7n0FMehrLJpOb
         XpkXJnrS0VJ3jdk2b1PFFCQaA/CynSMulomVuM4cUrNooJLGIsjmYZ433lkwQ+YPWJLh
         V26wOZjJ0rzpuVc9Ict5nkRusD6Htd9dYFkfuziwoEdedgmScjaRl9+SxzGMeSKX+K4F
         s46pV6N/1yMv/jYH9fcyweJwgn+b1onfvWHluAhyA+A/iIKbufq4MGFTkcqDeUcx8ULf
         t2RXDY/UpdXlK6Vb1xJWj9yvcONjRXCcORuPufWQ+pQr0tXIBBDmRuneR4NEKhqOKq7Z
         B8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992316; x=1740597116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=;
        b=f7ueYeIoLf8vpuM7ZTV5UwT/4Ot34+uLtpoLcNQk+6qNIXkNAQKRFUVJm2XbE3/viC
         J2gIg12ywHyxx2SXLGqO2iA3RDQsHFwql2GQqlFuFLtH0zZL2IRYDls69ynA02pAycFs
         5zcs9lLu8yuNsCb6neIsfLLuHqy33VT1h0oMXht4EjLq4Rl355VlZm0hH211yTFciBha
         RmeP7JwCKcpW8Bs6O94TOGjUTUvanEn25FxYHZAx5Smbck0GYw3ucniAdbvDnO5ikwbQ
         QkNQZXWb9S+lkXBgHyku21skoTqWbjScoWHTutLTKy0oFPeNZzsQ4nUExtEhN/dCsZJB
         kKxg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Pyt2qSCPy/JofESjetiDmn+mqqhxZBWPdLlK/eP4cmSL/cN3Y1jjBU8yfottXXDs8IjelAUJaLqgt5e++Az4@lists.infradead.org
X-Gm-Message-State: AOJu0YzFgObFwlWSWOlvY/1Yya1pmQzZpNLIZn17fmVozBjm++aRC2P3
	jrzcdbqukSm8ZZbQqGQfsAV2Gz+N0+NqMf5HkU+fa/BOmPVafPkn
X-Gm-Gg: ASbGnct5dDCClpZzirr4pWlFfmzafPExTC/dllhbvXLmc16N+NhPKl8j899NmXq8hVe
	8OgaVd2xSO25ajA7BcQHqaQyWu+8m6MMvlCmixxMyNt5HGGStGaik0VHT5x20cVTg09w0W5pL9I
	YzgQhDqrg0iIPkDJjdQEBeq9I4FOf01V/DS3FXZh7Cc0EhMUIURTZuQah60mubOLEk7WNp6JOTk
	ltwJ1pXrtQaEng6UGauNoKpx/W/YyqMR/e4PwXZTaIFrVgYKnJX/6wPp0a8+ozKJOSiy7gyusms
	79PKY8HPVwafZDtfhAfngcIIEM1Q
X-Google-Smtp-Source: AGHT+IFyOBwXGTpSYagOOpkWDMhkVuORfStvj5grnxd98RQN2N6gtL61zwIr20Bcm+RaMlN8QO+yKQ==
X-Received: by 2002:a17:907:7815:b0:ab7:d06d:b4bf with SMTP id a640c23a62f3a-abbcd059bf2mr461138366b.39.1739992315757;
        Wed, 19 Feb 2025 11:11:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:55 -0800 (PST)
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
Subject: [PATCH 3/3] media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:32 +0200
Message-ID: <20250219191136.215151-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_111157_567826_9A34B6D1 
X-CRM114-Status: GOOD (  10.56  )
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

All usages of v4l2_subdev_state_xlate_streams() have been replaced with
v4l2_subdev_routing_xlate_streams(), remove it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  7 -------
 include/media/v4l2-subdev.h           | 14 --------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d1581f1036487..1fb413bb337a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2067,13 +2067,6 @@ u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
-{
-	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
-}
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
-
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				 const struct v4l2_subdev_krouting *routing,
 				 enum v4l2_subdev_routing_restriction disallow)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 90d08e13e016b..3781d6d8465bd 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1604,20 +1604,6 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
 				      u32 pad0, u32 pad1, u64 *streams);
 
-/**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
- *
- * @state: Subdevice state
- * @pad0: The first pad
- * @pad1: The second pad
- * @streams: Streams bitmask on the first pad
- *
- * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
- * state as parameter
- */
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams);
-
 /**
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
-- 
2.48.1


