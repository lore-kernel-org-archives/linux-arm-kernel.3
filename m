Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5103CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=; b=LiLXnnmLQ1dM3+smEae8K+ae0f
	TaywvUu0dOs1L/tjlNTTe7BEDixLGWHzETI1rOhKOKJJZc4A/pkRrUBavz/ltso100YkZB/peUg+1
	91dhd33ScUpXHxPr28HyuJ2PH+4MTci0sIXq+exYFRVbPx9wv1at2kLNPrL4S1kz3WyTDoIMiQjf6
	XvIe6DlFon22DpSv+TLsKj8n1pYNtPS8lUpr5K2UUA7XrNxmWFLfgvYLKY/ELUv30DPQxVveVS1qH
	kPgFtnDAnWidXap3mHKGQqM7jeq/bv5nFniVO4d7fVJdhEnTjc9x6RlqTmKQKQ/m693OmT+19MSKp
	K2yjRk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7va-00000008Vr7-3DgL;
	Wed, 16 Jul 2025 19:36:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qf-00000008UkA-0v33
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:26 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so263030a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694284; x=1753299084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=P/AJm/ilNSTBkWLHB1XjM+inDN8rWXJl1aHstasbqHQef1ys8SAGwN8SFR8QW3yWei
         GKRD6KZGaKr1Ws1vVSGrYq9apW0/NYvwn1taBKEbNFiyjagkIoSn0uCK4l7FcJw/Dsow
         +HCXh/zzue/owVCH/kJs56IWXbkWj+mUSXDiqL+BboekHmdqCiTzqqS717N8l/U+vtCv
         1vdz+A1MPVnbnRcNaZVKYmXTHUKJaiCRLvIP1nqNlKb27t4Cum6V1ka0MHUau1EQhiKK
         sn2ss1tyej7H8ni76NAGto5N9yl1vkALZkem3jhKTZ5wb+B01OTso9X/pzXm6/kvRNI+
         kB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694284; x=1753299084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=PMf6lP9gYYOWW0YproIaM/pCRSEcP0srZFFcrk/ymj+lHgJuXeOi9cXCd6GdsYEcp3
         ukb5XmqxBIss981Awu0iAAnw6aLXUO2rr4VaW4sr6EsDBIWsn6FGDUS87G10mbEqeIsX
         bXezNqTQ7n7njrBCQVnndFlfzOlzQd00FHoyjjIVcAFoAHG39Y12ESJI6TcWbd1JzpLw
         +eVZ7RHlA/mzOP5ZiTyDqxCSpforqAG+fmiMoD0BF+QWwtPLM8Fi0XSQCaAj0JRrpd2y
         vu6yTovUTQ5Wn/zpfY+dWA1LZRpmdaAqXMGUzuWezYRion869QTl5E+adg6Q4366as9s
         /ibw==
X-Forwarded-Encrypted: i=1; AJvYcCWo2Jti47RSk3vvxz2cRg0Kzp9k1JSN5T07KI9a4uPgrnKu5G0UHtQWUqvRfQaYQGJI9bjlBJVW4XIvvyf5t6NP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9iCZWLxdWTtaKvJ1swoAcZuGpVaaW+rfMcnCorPEiBKL2cnpf
	JuiOJeivMgOkljrMvmQzp6ddddRVSXAJtBwdp5yYPWq+jy1v/hm/+jrO
X-Gm-Gg: ASbGnctENAl0r+N736GbdVASWrhCPRkfYdptlX/t1QpAa7J5sGO3ReVJVwr46hSpggj
	S6VHBpMti6ah6SrLGjZ8HNj6njNONcLKo1RuPKI/MdllwmmlFsG7kkY/dWOuqxvj/JA/bf77Tx8
	iy7Taq7Vl/js5Ajj1/wSx/xAAhPs3ARCwPwmLZR1am0XVdq2NvBx5loh6Cm6KflNhI8t/dr2AqZ
	nC/3+TC/vNT/3Bhc44wb1KWOMEGH3udd+JQzSe+tXP8r1hGBABqggnOkct+fICY8B6/u6+mni6i
	oDEk0U0D3WzA55YQwcPkirVFB1A9RdR57vlO4CZl/11VIksBRttvcMlVda9VJbAlyC6z8gdVJQ0
	3GPzW/Lkal2VBylbKeBSvWDIevT7An7R1X5c=
X-Google-Smtp-Source: AGHT+IF1oWUA1OVfQOx4un1l96swc4j/iudsLCvxwM4vbZlbA9kI9dWlcOanNjxGseag2MN8Zx+TEw==
X-Received: by 2002:a17:907:983:b0:ae0:cde3:4bbd with SMTP id a640c23a62f3a-ae9ce14a5edmr399552966b.44.1752694283416;
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
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
Subject: [PATCH v6 01/24] media: mc: Add INTERNAL pad flag
Date: Wed, 16 Jul 2025 22:30:46 +0300
Message-ID: <20250716193111.942217-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123125_258649_AD30A1B1 
X-CRM114-Status: GOOD (  19.51  )
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


