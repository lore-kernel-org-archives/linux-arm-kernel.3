Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A722C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=; b=4cax+WdTQ+RQ1Wm1H8/dRmpmm0
	mnBZb5h1vNAxacvLYTt955hhKy75Q57Jq55iM9pIuERnHvCy4vshB7EgzCYyGTgsnijly3AByt57T
	Rkh/2rfRU2dqN1Tqljkd5xF8MqSJSZlQS6RTYmQkh6mPxjeZzFdToLC310rjQy0jYwMGNGHZNKC2e
	5qxPTXwCKrUxYMYbnWMWpgZt5WbAxlFy6WUaGLP9hRNHkf9yF6nzR1loccbMb69EiXW+iWGeCMXLM
	A9+cgayBbojfGHFfj3cWlnyWKtkivT7q2zS8UPHs2buDuevm6uBVIyoBlGxO/jbK/sUsopmN91K4h
	Z6AJJQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2pT-000000000sF-0ScJ;
	Thu, 20 Feb 2025 09:26:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2jh-0000000HaBU-1lIi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:20:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f378498c9so587878f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 01:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043248; x=1740648048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=;
        b=TIEf1NM1cReZJmTOMB4K4hdN9uiDPDpRqNDpJaudI97vyHZpzljK0HpLv8IFDL8h8e
         s35eNH1xstMsuzIoXXNrU3gUGFxqVj2golKpSteq9snb73trbmc6u8Km1hRpkb0EvTwC
         J5Gjb/WEJ0I+N2dRSauqERKXU668pNctBFj+zF3CHHcRjsNZiQm8/IeNAlOJWKJhZdxA
         5uoltzRahRpbML3fXfza/YBq3dEuQj+gvSlSj0zhPlT51bd8r+GJNQGnG0BbNq1mTlQt
         FG+tqPxwPXG+oCs+VIoxSY+OFJ7azVLOlAy/4zm0xFXLAraoRBYIur7/OjosYkuTOgcj
         7Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043248; x=1740648048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=;
        b=KD3WLKQs7X2siA9e2axHFYkC1R8cUY7xeImcD0deRkUe+BUA8DpbCjaVs4IyzZ8+4d
         gUKuVw00aqHearAnj4gduZZtBlfOuVXzobi7xkciLO6btRY7k5xDhULIcfzC91T8d/lJ
         84BXJVENuKoLWZxsmBf8IWkoIZCxsiPyJzTHNPz7C3vZPHygC7zPMcTJDn9ndTD5DShP
         8FXuK605vG0WCLnx//nNHTXQHRiU07lnUMUi4WKMBCzjf9WLq88aIMDEPIJS80Jdlr4e
         6p0DvPDGTjF68WK8EwfZbCXBT80Nj6cRFH2yPjynnY1THO3MzB+MxwWzFA+BuqO1pE1O
         8/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB+NeXzMFPYyEs9rrq9zb1RlHcjeaB8kewvHTYxxAC1cBvus9YM99vIuNHC63L3SpuifaFw5Fv4ZsjDoy/3nCH@lists.infradead.org
X-Gm-Message-State: AOJu0YwGicpFgoUXq0YtSyGbGu8aJV4G5v5hZD5RxcqzCwwh4mm8nKF1
	laYcZQXtKVCHMvvrTD2lzRGoJX8DVl4VfJX0/v+Dn7kYCkV0wmjA
X-Gm-Gg: ASbGncs2b1D997lqXmOWWXeOtCVYk5MXr3p1NCUr+LoKCE3+R0DWsHhh8LLZc/YS++z
	ap4r0/pGqQjsmoFUmyjJOxfj71iJEMz7V0fE8C/GAG7nDuEh//n1LKAYsG9d+PmRTEGX8XwAzoB
	nvQI61wTItd3I9qITrtWrI/bHjVNMfvUHWJrfoZTbAR4oj5AmE1iIXdQ8KzrSiAAA/mXzYP/zK4
	torxpKF1VTjHB0DLimp7AcJabtL34loxryMtXlCCDnR7h/V9j11nPxqk2Fp8qSoEzSlm4hwlKLq
	vqssP4bAGCoZdHLVWaKlXd+wnRz3
X-Google-Smtp-Source: AGHT+IFUfAy/nA4NjDORyka7i757ce3BhJX0W1jdcc9Lq8KT042PAkdLHvg8+1RRG5/LjvlPDzql7Q==
X-Received: by 2002:adf:e709:0:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38f33f51157mr22341024f8f.35.1740043247411;
        Thu, 20 Feb 2025 01:20:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:47 -0800 (PST)
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
Subject: [PATCH v2 3/3] media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:35 +0200
Message-ID: <20250220092036.6757-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_012049_483392_9E9C3EB3 
X-CRM114-Status: GOOD (  10.64  )
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
index 91fa51259237e..985d30c22acae 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2069,13 +2069,6 @@ u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing
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
index e49dba3c59bd6..0fa732e6dd55d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1606,20 +1606,6 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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


