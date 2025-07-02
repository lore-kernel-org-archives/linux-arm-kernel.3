Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8583C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upG5ePm7BuBMLjhAjxdxOx+e2MDPCegrLyoq3RT+0t8=; b=odaZJ3epo0BcTA0+M6nwrehmJw
	ZCHbq0P/yPGoY103uqzSul1dkHb58VRl8cxFwMRSrrIred0h+0Hip6RzPZ903Zke3Bhe3xK2FIAGz
	xZYB3OspGkTGn5sukrlid+Ki7qpcmvbQ7mDmJ+NzHShV1Vx+Wfmo0DBeIixRrZyn8Fhj3AAAzWj0o
	THN3Is+FMSbcQBw1kMxcJSCwVzXdcrAcdn3JqO6+aqmj3KT+dv1W0SAZpoDk/A09+HZhslfsLPTpd
	mvjzI/t/MsL9uIKdlOAApbWBSyak/5XIwTJfF35acv9tp7ogp9Ovn+bChDnpzgH0/ukNUXQs01mme
	sV5+glGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxc0-00000008Tdh-0v9O;
	Wed, 02 Jul 2025 13:34:56 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOk-00000008Qld-31g5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae0dad3a179so1084034166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462473; x=1752067273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upG5ePm7BuBMLjhAjxdxOx+e2MDPCegrLyoq3RT+0t8=;
        b=eNZ2NaT9WKsFbKiyU4i2A8weIUs3GHyQHWJQ36VNoeZwGwmKKjVHRjUuF6qJQdSq19
         OwBJo1MF2hp+Un1+qTrputwufnBtqo0pSDHzLPgdVp/zvupAZ3qeSPcMO/nkKH9mJUR7
         MXjuo+B0BHoEAfOB2sBOQ5OlTlS2KHTs+63CUqVPttWHrNlshYIavIMndIfUGEiDnU6Z
         9l1X0OrPapXRmcc6vaGcSO+z+32VId7fuZbq5g65uPbRjsSyiTTXG6yT0sCwht3hi30f
         XcGPXJjlSWWXjHV10D9cR8XtqgIusPidoAykn4gavZh9Z00E1IsnBcDgXh4ku8aDM1KY
         tsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462473; x=1752067273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upG5ePm7BuBMLjhAjxdxOx+e2MDPCegrLyoq3RT+0t8=;
        b=wgH51ZGd/VADzmDCBx2QFEcUsscCn8bhphpe4zOmzF9r0O+HFqv4Lsm05fJEDYruZy
         ZdGDWpWjvN0/3esdw/U1ekT48tW/Z61hRdOyqRpiY8NhahREqqNjkLDzn9/t4XJNMYrn
         6AiveH0tvbKYHbXZLjLeyXQOtptJBcuebKpOIofE/sL0tYWY3HJ/whFlgmAOeyVdFzhk
         HDDpMWKI+Aoe4OYYCDY+kqRrpXMo+MsRHmxWBGH9OSa2L5xU+TKLRJCC3mtm2ep31a9v
         K+pAwBe6UToPo6gWCEnI6mNOLEMBWCt06WbUvRKN6R0OUCkgDmf3GO26d10PPlO4Rw4d
         y72g==
X-Forwarded-Encrypted: i=1; AJvYcCXJQrgMu0UqV6VweshbiIfoyUFXQuSdFh7iVLi3xEChyOqaVHO/Twxo3+vbMblzqEUfRsGkEXSxraD/qBJDv5+8@lists.infradead.org
X-Gm-Message-State: AOJu0YwSqSCL6s6tFZr41NiUoXsu9PSE3am+ViKZD/+Ph5v32ZQXHPPS
	2PzKDwCoxFnAGzldI1jKDLOLRHZnWtU/Np0ZbWvm3sAZw82TvAyW5oha
X-Gm-Gg: ASbGncshgafomScndEmXrExaxcU3XSBsb5azpcOAP32DBZjQVXmnwXFMM4Xi+nH6ndi
	APVb6yl7b71ZwGnfIoPWN/Y16T+ftkec9aGDvkrzgRUeRmBdtjXWuLuy/xWgpXRp4HEA38vafpF
	M3x1lnyCTMpiQmA7UctSMVTUvt2kDXWjdqkPhXfs77rJSVfc2hLzdESpRRvnolz7G79VN1ah3yq
	iQAheEYc18oDAsGJDTOCp36zD4k5YetAnvXgn4CBJv6tEM/EpCWwlYIEv4aSqmtL8my84IWELuU
	PRWkgYXW4S9p12QQ+iqKl4zRZBwTHL7xRNeX4kEN7P9mVO5tdnIiSVgUuN6zUb9m6FXkRHl+bl6
	H1ixQJUd1TQ==
X-Google-Smtp-Source: AGHT+IF/sKHcXFLP5mxbS49LHMrfftwS95fHZ37EO5GWP/QWfZu/zNbRtWTsJ4YSMtScr/AkwdbI4A==
X-Received: by 2002:a17:907:d15:b0:ae3:65a7:5621 with SMTP id a640c23a62f3a-ae3c2bd9b6fmr296095166b.37.1751462472854;
        Wed, 02 Jul 2025 06:21:12 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:12 -0700 (PDT)
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
Subject: [PATCH v5 01/24] media: mc: Add INTERNAL pad flag
Date: Wed,  2 Jul 2025 16:20:27 +0300
Message-ID: <20250702132104.1537926-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062114_759784_1E757401 
X-CRM114-Status: GOOD (  20.13  )
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
index 6332e8395263..f55ef055bcf8 100644
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
index 045590905582..d1feacc60807 100644
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
index 1c80b1d6bbaf..80cfd12a43fc 100644
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
2.50.0


