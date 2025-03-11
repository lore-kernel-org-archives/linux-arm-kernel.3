Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED46AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=; b=a8QoeVFL5yzAJB4fpgG56Nk858
	Ae6zQJBk1dX7izummOG+WkOi+1SzHxHCMdQRt6fJixcaNLCKh7lOfo9lj/1rmTtYCF6hCh9zAsmX6
	XtCoVHOJAav57JJpLm5rBZzsp1BYar35o05h5pCDaWhh4Z2UJ2r3bWXLLShbam/ItPVizrjWr6v0C
	cpZE9RoZwh19aA6qG5MH0EuMqqKn56t9oA76PMhESPc/WL6L9e3XvrS8gPGq0DTXbwBpWPZDYRgXJ
	nYPbcGPFerzNDIfz099C7o5jruXdcdMgmZui7p5aH91v7fZs4vWF6IO0tJcx6jsmIlT8LlJDCu7cl
	rr7lVwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2dV-00000006Lvp-1Rba;
	Tue, 11 Mar 2025 16:39:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2Yi-00000006LR4-2hej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:34:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso24979135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710863; x=1742315663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=;
        b=UHJUdQgFTU1eWSfVttXuqtUgbsWL99T5M1FTyD6SfgQxD9OYEyuy3Tv6ccI4PzJV9Y
         jArp33vuTeYjCyzVNfbI4Hkj/wDjrpFrIGUgeczJbtPNmvjMlVUQV4jYorkj0hNyb75I
         VaaWmfzyPRM1vkjCCHdLD2Mf4wDoPnrh4ZEY4txSLPx2hrENwpeICeH8aVzUVnfFYSb6
         iU4uAWEZceqaKely0Q3W2Ufh2nild2CF49MuXmtU8GHHFLiL+PjVRweoVwB59IlcjMFi
         OtPM/22Nd/EnBdRoxCRvtMNWZsX0ARaOadERmRR/pCJZkYEqdYKiL77g24fsdBJx0rMd
         E0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710863; x=1742315663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=;
        b=buEokKha6Un9kXKZJ9V85ybMHEbGgqVh8p6MOhkRJDQPIOfQTY3NJsH6J90ToJmTjy
         elw4aq5P7KXhrD0kVpyU3v7KlF+vBaBlQhVjSLzGHPZTJxCVajD5C3G/dKRyMMcveP8z
         C01rYI6UYdbB8GbUGKljrRD9EcoxU8HTQrqcqU/2FnWYnr6n0cWba7N+jsqKnxBbjT5M
         PSWOeJOepkRYOMM3YhlYUclzmuREgdeUMtAOsz8i2wRcJKg5YsIOk3/CLhQj+BqrMIg1
         g/W+9PhoqnjU2takUN8+TAfqEzOSO86D3M7ECnWIQoVLGTEg2sIB1yPI7P5MIWm9U2CX
         Lr8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5yOzoGZas/5fxVL0kUhmsvrnLvOOhncMXL5E9VGxRIyVgI5v8+JsugaCezfV8XbLe8+5dG1ztLN7rIf9r7PNZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9exqZEhtCpnn6Bvj3QNAEl49mbXHviyn0TGJ2l5WEVAJ8h/+9
	D7FTjubsBL7Q+B1e7FgxdRIMdJie7KxdA7P+GOaJDyygPBxvZTzW
X-Gm-Gg: ASbGncuutxpq1Y+fsJ7/phZjhDjFmPOPmmnd+8ENaLia1ME95Ydjins2TOcNDEEo5NI
	a3LKIvkD4bI7Yd/pHLiZzf7ZBWB3a+kfc7AveJe4OOMgnXWY25Vxd4GHoI5ERkbt43gmYR78gsN
	gYbBVAssRP1xSu70Co7/yImF/EFLxBzBlxH0fFluw/W22f/CEr9JyaIIPXTK77g1ima/7GrB39M
	1CBhdOdUexTC8pV98DBrP9o5KNQMxBlpJC9uWyWykltwWpJh3Suca6g6GscI7s62CDJxpITuPk8
	m1wwjGuOg4ovaG2RtGhLKR12ikwPjbDt63mbIGelt5+p0o+iNt78Mu38yLjfEzSaEloIGJODFb6
	V/+VrI2g=
X-Google-Smtp-Source: AGHT+IFlQFbhR6ZyJ0YJ4Jp/6nAyf81QOetcCX+atGFftJ3QGc1xuajtd/R1oj0kBDUVF3B5CIeiqw==
X-Received: by 2002:a05:600c:5109:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43d01be71ecmr58521685e9.17.1741710862554;
        Tue, 11 Mar 2025 09:34:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Tue, 11 Mar 2025 12:32:54 -0400
Message-Id: <20250311163255.2664-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_093424_683612_F27C9360 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1


