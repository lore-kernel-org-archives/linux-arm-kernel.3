Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77260C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=; b=iA/fH7iXc4K3nZhdr1I9hrPddu
	7kLqEZ1rphedXVwZ52cvO5NrPiMdz/GQik/jgR3Dg+hsxBMteZGjLUlGFAy8TAnY/GN1Znrgix0ZK
	kwxybXL9QGn9T/1O0Zp1GtbQsY7eKoLhyrx0e2sKFwZiByQwWe/vAJxI7otVvWcN8EKxaKr3FFl27
	Qnjp2NO8bOSFXc+lZrFuqxQC/xCMo7xOEr1paEme2BdMmVh7m+y79cw4sKUniclDDevT2kWUEo7Q3
	VT8YqJpxIGsyLSYZiZqL0uhb3HuGhyUgX4IBbMIDDv5ws3InTyrDS2QxsyEcmrmao9Frn/LyCkCn1
	41/z8pog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucn87-0000000Cy61-2e8I;
	Fri, 18 Jul 2025 15:36:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxY-0000000CvlT-0dDs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso17642415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852314; x=1753457114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=ejKddbgGBEml1GCHrZcSvDQQihga2Ri8WBdAcG5xAuqsfEmy4dqt37ZRz0tB4uQUiG
         khQKN6DpWIZFuiAXe51iIUbDuP7MBolML7vc4jDHsjJh2w5pbVlWQzlw0aImWgnjX8Ve
         d4oDg+miClyhd8IIOmuvQ/MrTJmEqIOUhq2npir0DiQYg2llD6LN+gfjkLBH8N61T8J7
         ucgzhJ3R8vF+b/Oe5rMo9rqT2GP9ORDbp5DyW47P7i4C0pBxOOf2+tmp5UrFfxuEeA4R
         0bc3zAVzET6w68iJ3YB1qeV8Ty4Vy/lAM3SQunuSj0YdJAd0/ZCys6nJo7V14ocWhu4e
         lOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852314; x=1753457114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=ZzPQXilrtfUcwWdHBcXx3j/zvtCqRHTtU+LiZR8WHfoLOeQ2dh3s35u8gFz4uJGBG3
         4maVjQnFh0xHgjb7XXd16C3cJeFHe2lc7MW2SZikY1rtyEB5L+tTNcZwDoiMESs02Uj/
         w0olFfw8tOUx+1DO0H5Zbh+aAxZYAU9EOuoYEzbk0EWyxfMoWw6hLKo2vFg3ek5BJ1+u
         T/qvBEqoapMBL7+x4Nu65hAveTl84U9oFdczZkrs9e6ghjFLw/F3Z7qw2zv/pOzWvpMg
         HFD94AgSSS7pUkmM7oqQD2Bkv4ByLYDfPxwAzBklvQI9DxekjtrdEFVmqMbmIGekhJ6u
         Hkvw==
X-Forwarded-Encrypted: i=1; AJvYcCXnsHh3BzZjE6/i37bnD5S5lV3FCgE0qWCbSQTHzdjgm7h7PGNfSHWltToiJ071kYoAffx7mKod2esfpgsnE8Md@lists.infradead.org
X-Gm-Message-State: AOJu0YyrQp9HIcqnRG12QzqCSPk5fwv5ee6AHsL2mxKWtbaWZo4KlfmW
	ShNsbqa3QxU/M9sfydKoMALQ7KhNo2KnWEoFRzjINd9rKm+zbQ9Nnw6r
X-Gm-Gg: ASbGncsXeq7et0itHzoug31uEJF7gmMlu0RMUVNxiUmGJbH0OOQKV2zvMydmD0FnEBy
	Y7xzDfXtC0re4c/n1IOvYKWKfgNxHraHjOaDgdqlU1RR332o8TCmk/MQ2GHVUIvIK8tXgSsdouJ
	8/LIxFXl+UvsHR9jzujjSwRaglz1VmEVKp1vn52dywH+fJ1xNcYehYzi6Fls0l3xvqlkX8K7bft
	G6ndvaPImFnEWd8SCu/c243VEFgBshr37sMhoV2QuqYzDHFge9R1hT62HbtL0kte//mE2C8bk4c
	FXuVdqScVkLMdhhLLiY5dGeoLOgCHkWRiVUXG/cLZ2/TaI1RTIhmmTyCJ4RawWCSg8IV6jdNM68
	q8TPRf7cYY2OE0vQJfyGYHZVqYuAfgsOmE9J/ckvjgPoXpQ==
X-Google-Smtp-Source: AGHT+IEsvECTV9vCQ7lE8o+YTff30hJOsIR9MuRvOH5+iAHoGOCA7S1w2KqX/lPKISemuJT6ZPDrTQ==
X-Received: by 2002:a05:600c:8205:b0:456:2020:165d with SMTP id 5b1f17b1804b1-4563b8fcc48mr35428645e9.31.1752852314107;
        Fri, 18 Jul 2025 08:25:14 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:13 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 01/24] media: mc: Add INTERNAL pad flag
Date: Fri, 18 Jul 2025 18:24:37 +0300
Message-ID: <20250718152500.2656391-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082516_182738_77032115 
X-CRM114-Status: GOOD (  19.68  )
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

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
Internal source pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
 drivers/media/mc/mc-entity.c                           | 10 ++++++++--
 include/uapi/linux/media.h                             |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263b..f55ef055bcf85 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link.
+
+	  The internal flag may currently be present only in a source pad where
+	  it indicates that the :ref:``stream <media-glossary-stream>``
+	  originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 0455909055820..d1feacc608072 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1120,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1151,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf3..80cfd12a43fc1 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.50.1


