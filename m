Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5948DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=; b=bJcMDfL7wRnd0HBpJqcndX3v6e
	gGm87zKX/H6rRLc0X+ig8jekiyWir/lU5z6MsMscih9KQ0zBoBPW2LcMkYdmkZPJw04en1p2IXx3f
	s9V6NgAoVb4vueQ8EppV/7U14zEBu4ef/e5BrImw8AkBHEW9uRq7xZafZl1futRSB+ZojyPdRT8J8
	XqlXoLaTJ+qNYjZRCrUUZs0mG+nPtqaDCcLrEqXQQPXKkoeqdJi9H6g4jGAn0tDqEhyoJWaInT0tO
	JqYqk/16+8DoUJj7EaUPTJOrUeAd3N2u/HeWJY0i6SplQ1XHnXwbLg2GPoTQtjKCOeHra8c+lmzu1
	KWvvBmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxlG-00000008VhW-2OLl;
	Wed, 02 Jul 2025 13:44:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOt-00000008QpX-3AXS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae0c4945c76so642655266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462482; x=1752067282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=;
        b=FJecLr0ljRK3s0CNYUdEBL9C6hjFzkNxQeovXsDqfHIOjTBOuzqoXZhjEpIqNOOyNm
         pA7Si4sOEoXnfF5slJprQ59OwpWS7NzJI7WOi415wHx71KFqo0v4PcgcqPIucenqYf/t
         oIVnCRd5Qwk8sI0qajy5frqaXh9X5F/Sm787wpbVsjzbBhBS8h2wA4GiIVdSrjVihp7J
         faQxCmhQlJKuonjMbeWxe1f04UVdx5VhRIp0LYclC18GKD6KKJyIlYz6O+GlPxPnN9R+
         NxkD1ot4cim5G1HBxLiJbrmskDCFkZF41PYy8NCkQC+c81242R3tS9+PiaW0BxSnLxSD
         ji/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462482; x=1752067282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=;
        b=WPexS+141VydN1AAns6XyBcW4VKnmtizy4AEzEdPmgx7eamxkbvcFkb3DnNXkjyFk+
         3JY8S7umjsEIqBz+1N9PbDtGL69ocPS9F0yqfbc98av5OqbhsdkzLI7twEQQL2xlBQkG
         RnGIm9ypsxLei38UIYOWGYRrw8BW/l9eE5V2NixkorfNF/JbrQWEiggK5KYQwZoVGUL0
         Yf1gTSaDVuXlzrOF8ldPHMlCfYyw+F4Rz1fKfBrTzdwGJvCDCPY26y8i7gnzeTmFa+dE
         ND3rNC/+/pDtRvSifmH27r9u28m7tGfxkOnvdDiG4nd3mLxxXapt5FeGclFZ/WupZe7+
         7gxg==
X-Forwarded-Encrypted: i=1; AJvYcCXUnRDVZHCAtz2qfkovYljg7Jz7ZheuW4ezDO9nXxBeZ6XWYSosElHQYHppBbLoZJuQgaQ2UXpWydUg+yG8fQFh@lists.infradead.org
X-Gm-Message-State: AOJu0YykID/v5gH7xbxBC6OsSlRoeQySeanfcljidyDszvQR7wuH6ANh
	M8CsYlfdAQHBQbfNo/pd0/Zi4zOSsUq4yUmIlZxG/sKztcTv/9UMKql7
X-Gm-Gg: ASbGnctgSmjCyh6VJum5K9yl3xuHftv1x/DzFsy4gZp/0gwUe7R47eK+anYj8kVrfK0
	iVUunLJDa1DBfRQS5fLW/mr+w1deFYrTVn0woKc2spBAZ/q6mgoW9vkzP9s5j1gJhpVoVMC8a6Y
	XTZBfmhVbVaBBNooBOhb1q6d7cTxsR+qOaSU8AU9E1AaUeQNyPiOttP4Ux6sFr8u/WWQBPnswIp
	w83/WyhXyuTaEGRJOwbJXJZR9hLcTPWdW/FHCIP+Z/SdQgf8RDrZ1zjqCWD/6J1d4Hm3a42rJIR
	+rtPQds3Xg/K4JuEqcJuDP2h4FBDmuBQCcn3kiydK1PwVexfB4BvhkN9PQTd88Hku5p1saZRbTE
	=
X-Google-Smtp-Source: AGHT+IEwIV5Blqx17B9jiMC5uhIhf2/2xb+WOogVA9BwtlKTuRFKbLAhdj1v6eSRtnrWjGQF4goQWg==
X-Received: by 2002:a17:906:9f96:b0:ae0:bbd2:68d5 with SMTP id a640c23a62f3a-ae3c2a6c6bbmr270964366b.2.1751462481909;
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
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
Subject: [PATCH v5 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed,  2 Jul 2025 16:20:31 +0300
Message-ID: <20250702132104.1537926-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062123_793174_8B342724 
X-CRM114-Status: GOOD (  11.94  )
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
index 9afaa8a7a3f5..78ecbab8205a 100644
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
2.50.0


