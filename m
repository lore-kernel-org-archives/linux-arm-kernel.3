Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77D9C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=; b=Dsu6G+xbhwxQe7MMO/EwjCZXWE
	oLqU5GUXQFq1EMlusoBP7g8gj43AXK9sZNtHYVm29xebZT3T7Kwdp7p2rDLAcu3c4D7OLujhvLR0k
	aNRQPKrEFOl2u+m7l5L2cqMfl8Kx1VCJuXiiumnNLXcSAbQRGT/sH3kMhxlnyiodvBM6XjP2Jnf0Q
	5NyXlwMAokZsq5keYwyLGhQYS778G91l+yt10y8xBH4JBDA15NwLtia9hY9ql4OMz/FyGwZmzmLIf
	nJfVWvwSoZ/whN7ATrMkBPc70c7T/f84q92FB2JPsAVHEiuAwAtp/xT2t5MqHGsKIxcj2sSs0XOGR
	COpOcL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy1Q-00000008YpK-1raN;
	Wed, 02 Jul 2025 14:01:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPB-00000008QwK-1B5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:42 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad572ba1347so644411666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462500; x=1752067300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=;
        b=hiP4H9yE7qCtTkMg9h13kcurGLUYNu2bfY5Q1VIq1XA46qg+bLqFLdT30eazda97AP
         2AmlH9NxKO4avQR3R1Mjopus9HgKMmqwBhYYyyGjnE6ynGSaEojflfN9uEZelFELcR33
         BA5ed+NQhZv0sb3jd3PCbrU161blLUCYiF3eKHVNgpx9AKoBeNILL0+HWOFthi2GELZC
         susMUqXdhGL5Z7Cwe8j12Xnr4yY/ISRnxOUzE9TwDEY/7LMfG8mdA+qZ8pSGyj4aQL23
         jVpWZo5sjVTn3/dt9Fcli0QXzwmrQJxgJMg/HN1teZshC0O5weqReYXcsmjwHeVxDfP9
         R5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462500; x=1752067300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=;
        b=Pz6On2LcewqBD4zKN0eMhtSGLoseNmqR56S9RMXQxo08xZUeW0yzY3HFMq7/Tfzs0h
         jQ9ZJnIUhnIrXlOAj79MJCXOVsNE1dY8B6jZot0pXsGd9bbOhg+Pe+/7Jz/pYEl5HyiD
         Lbe6sv72kTSOsqn7rxd0SGmIRiX+3YSZ9Gsq1s/7LXggrmfx3mn+vwO7ZvvDu6mRPXzd
         FC+UASJLyfUJsncYWdkZJTFIJI3sCGtJOt2+1Wd/ZC6HRsv4D+1/Wl2GE3f2SGgXa8Ih
         6PiXqC5yMxz75jqudBTcDp0vypY2JsXZL9mX1rjVKSGweSRDLdLfHKIo0cJqaWjO5+q5
         5AZA==
X-Forwarded-Encrypted: i=1; AJvYcCXU9pgHnJgVq9nw3gRIaqCOEuNtE44wMkFEQcx4N8HG9bJBiHzsWccJSfC6czdI5cdtu5iWxuCge9yEId1abYAk@lists.infradead.org
X-Gm-Message-State: AOJu0YzT7nC+XL35cIDKhD0Xq9y/Hyg/dyEYVIeDGAiJTTzrlNIgyP9g
	45ECUUvD8zxusfreoNjdjebJ3kq5HFu6tVx3wVxoPE09E/BbshrgjDzqPASXWg==
X-Gm-Gg: ASbGncut6Ab6gH+04hllyRiS32akDhGlLT0ljrmkyBKMYA0GPHyy9f6PpwGeSfDUvZp
	xQbC82UKUJCv60qJaYAYNB8kr3itPZfgqbGCsvJA0HBk6guksia5XuHMKIBeuRZK3S+hFo/a4X3
	hVBVAgIAQQnrrEZ2cVeNIuYaJUFGct/mDL1H7O43HC98ASmFi22CDG7u4YmMwTBRUP4qp8JBmXr
	B39ZP18xcZuJ7JQ1+FboXR0mRKqIaM5HgiomlK4c7aboZv0KndBxcoDTiH19GbFzpcp/c26/ii4
	r3Q8ea0TM0GSaDyY7B7BIfDQ4mIUd6iXcq8liTe0XGHhV92CPxpomngUJ990QQHUgZf5S3oLZ3k
	=
X-Google-Smtp-Source: AGHT+IFSFezEWpfgEBsp/mJRLUM12wzHFLkzaMEJRfqJQGh3GVulCFiNoRfRWUaVV2bT/4DwuhdRIA==
X-Received: by 2002:a17:907:94cc:b0:ae0:ba0f:85af with SMTP id a640c23a62f3a-ae3c2dfc3fcmr314072766b.51.1751462499748;
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
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
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed,  2 Jul 2025 16:20:39 +0300
Message-ID: <20250702132104.1537926-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062141_321846_329F9A06 
X-CRM114-Status: GOOD (  13.17  )
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c572..1c97624833eb 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.0


