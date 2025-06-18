Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE49C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=; b=Ueg5H26AVmynLQhQtzZVaaGpny
	nOl8BDmB8ocIQ/9xxFw2FBjwBo2gToCuBuiCP2Qhv1eM4X5MW8HCHGf93Krt7aR8YBBJa4kU9MAu5
	iM/f+4IoDsprfqmrsvh0Q79QOeAchsIufKJYb6jgDV7qZX/9klZm4Uvy9D6XfKyvySZmW5fo4ZRBr
	4IlFtFRtt3g6/42OTfrEfzS78EOG44EflRc/aVzQt0IEXGEHE4V9HaKr7Jml3vNqAW1Xsk8Zwk+N7
	R9SC12fhf0nTf57zNmj92ScKDmy4b4hNfSE7EoyofMJgomwkT2NyiOQgutt5Ogycl6Vtyv/QfbI7W
	YFMkpUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRptf-00000009khZ-0mdF;
	Wed, 18 Jun 2025 10:19:59 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZz-00000009gMW-1g0E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so12735331a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240778; x=1750845578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=;
        b=hBmKbrfU9HbV2vX7uIIAG5g92f7bzDPsNdchno6Tw82eppiA4rQx1LjD7vtuhqb8KT
         GSK1U5HDjgeqCHDlBFgtHsMOiJ1zPEbE8eOb8Oykp+zlKILo4QSGWoAM2uOEHnZmnmt7
         vpIGQGXG+dzQSflP1EVfms3bl9vXwrKkq7DpSKd99Y2Jb8Lpm7o1FjO7hkNmMjlGBlJK
         L8RFgoIiSd66ZD5GC7iPGVKnKMEWXKARg0VW9JQN3ohtViZtk3hJ/cxP75F+LZNatDCB
         7LpbwNZkyy8z7PwyqOMsmlLbjqBrh7aF3EZFF+KM7nc8nA/4KRqfzkp64wOIhMYO/VuD
         WIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240778; x=1750845578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=;
        b=AmgaHfBGgtSXrP2ppFkBB3ZPjqDVZcjj+ZHGCcKHjHotxCUwdt26bPagyppeTAPjak
         pm0ei7Wkd1MHSkzsK9Hn/TuhvAOddByax6pppDlM1uPLyImGfMpX4EWpoRyWlfCK9JYV
         Q+TFz3YQQLhTnKaVjENQwYGqes5DkCSujLE8qxL7IgCvDL3cyKPLfKOzBRaMpUoYZR0k
         4vq4haEbFlMQa3ePZPAvTsyn2Ldl06MkTDlcu+Fs9q3LfM8Fy5QIx3cHc9vflxZbH02T
         dpO0JsD9iih1H6YSU/2XP1FARYMLU+SJ2feC54Fp2KTEVqJxB1fPs6fiBvUHqZS55vrL
         vRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK81dJmLWvOm++GWsbaHqaZOhcq6XQ0ajp7WpIEhXMPdpBi5ZMnfNzrYwTB4TBAJ9AB6jnfz1/1TFYbYcE/oUb@lists.infradead.org
X-Gm-Message-State: AOJu0YypQQOvg85m3Lb07q+higVMoHkrjz/Tr+dlXkP4zrw7CDErGplw
	5hlY+qDiwQMIcSLOVGwlalfiPpxMk3OBfABRFC01CDw5+G1dWX0RD8Cm
X-Gm-Gg: ASbGncvveviM/5rpy1HxWmywYL6R6lyoXBDi3NDSRqXb2xeT28SzFvuDBozWlGaBp5h
	m18Fu0rNuSyKnMHv5oTZmoBGa+KSHw3UsLAyI4eS6op+DDZkrMPMMWbvEyA5TBClUuRsNVodCDP
	qUWGrveO/HRDO4lUHlTtpJVjnVnORJVEuXv2iU/nnKoLZl3K+Gsw7y3bXDt1/nYfj1SpU+SZ0pF
	LNxCbVonNPA1ZpMZlCCTfqfJOCJndBTmHl/iXMwQ5eFsiO1NariPrwPMEZ2K4tzX1xtMyIJN/xf
	nqOGtzu5hSmiIFtumiAlzHJfVi/BKiIdlTGRRwaGgSXDeeTMcJ+j4OGsfEVna6GsJf4wF/0ga0A
	=
X-Google-Smtp-Source: AGHT+IG6ppb/J0j8YRmIIXmzNHSVWkRtjbVe5WTms0GTJ75Un87Lu/WGD7mS34FxQ1gJTRZ1plZKNw==
X-Received: by 2002:a05:6402:5cd:b0:607:2469:68bb with SMTP id 4fb4d7f45d1cf-608d09a0dcfmr14594421a12.33.1750240777738;
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 05/19] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed, 18 Jun 2025 12:58:41 +0300
Message-ID: <20250618095858.2145209-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025939_466428_DB6EAF00 
X-CRM114-Status: GOOD (  10.96  )
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 5998e2518be9..ab46a5f0bd7e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.49.0


