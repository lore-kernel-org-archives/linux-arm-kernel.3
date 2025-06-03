Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8119FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=; b=vRnAoL4LQviuByo2Xt6WMxTCDy
	7j0YttAHqtgoAD4NrAPAf/g5Jkvt57DXVWOEIMb41R0EV8GD9U4h1rJOst5zebXAtuWmJLe4OMrPn
	1fuj8I/MZNuHtXuaABcc0x8pFY+4i1HMxuMu4SAVEUKJH9jOnmCjXUcUJDlRmt73v1S0ICVlMgAWJ
	vXryetNkNNQB/Mbkn6qrtyWeck6lr4vgeOQAE7d5fm/5iOeAHzVYY3ZrwZgbJSqqe8pZqeW/bbwjp
	vOMS4RCPaRejggtFqPnSlod8IIIMn5dZBKcwQLFz89WvniFsnwLowJDUKKRbNmR5XzjGoogqZwvex
	BigenUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQLB-0000000AsB7-0BiP;
	Tue, 03 Jun 2025 12:02:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGm-0000000ArSb-3fX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so621253f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951847; x=1749556647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=JYQNwJIQ563LoPfJoefIwGu+hEXLF4rjqykMgcdz06jtSUIHu4AQYfgV5UBaej0ESi
         xK0k3PikvzdZ0/+Gu4BWmY6gbrFPK2TSsxIPinOibuEr421Clk6oQ7L4rP16f82mOvgm
         zLpotjosX+ImqMo7O1yoL+zxlrJ90R7dV0j6zwYkK0qMev4CC6JNiqOUl3VmtTDG8s5v
         8pO/ohV+kMAkrQlfqZIl5kUraQaaw9asWF7By/C8u5gUpMRJ6b30VhU8wkaIBAhjfkIY
         QkSfzyiwoFrPapT1BruZsoUDvzkfwbb8Y7jq0FLYKrR6EZyZAXBVhlnWk5yNf85fhWFw
         zxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951847; x=1749556647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=KBoiBuXRrgr3ecgKvaNiyXA+h0UlasWuruwVCWe2Kr3bUiByMrl3ZS0YpFK3KLuvM/
         FtLWl00Jz7YvWssvU0IRNlxIj8zXkPywHaxtR2Y4q6Y1gs4nc8vpwEV5KSC7n4x4ZOJm
         OasnBsCbq97UYwItvhxOZihdiqupr0PwYakDHTWFU1Z4OGCW4O8azedkGwy/G5Ti9V2y
         60soBe3A5vrdkFIgXs1q1u2pHbIkJe5MxNzHKo42CFUWAJt02/uzNUqlMLIC0lEc0ahA
         6O1cGEyRVL6JXGEkF4i1zXSGzGaCiAS1VQAPnb3XDRCdxe/o77UZH9UlYXuuKF6AhWXx
         zp6w==
X-Forwarded-Encrypted: i=1; AJvYcCUvh9qaVmmv2G5gb5h1CiYhKAd/kaDpcSpQ8ta4EtzHo8U6xVqZEgGJ+JEJvyshj/T4m+BmqPAGfHd0CfLK3WOM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6OCzpBjEp7RISKko5oO2cC8HYC5uSjTfhngqA3yKkf+Cc2EDQ
	8OYS2+4DNNXybfkk6RYp8zXAoGOyBOPk0N4BvOfE3hO58BiZu5MGocylxaU80uinUjg=
X-Gm-Gg: ASbGncsyR8voEiwU6sHkmbOHwxzCro33GoWG91RT7SD+Kl/AcFispuheCT2S3znHJ8r
	oPjNJbF0O9sNc7QvKd13OH4We1kkEXZ0ccE/DdZdlSexNe6xwy8lI1oO5h7xu1QNgcv0uqAsyq2
	CWa0AJ6+VLZkGzZW6Qa/BUwNoQARwCBE2920g04jXCy5XSzy98uvpBrgyr1hLl1iUxqjde1gr91
	nLwch6Qn+yTal5WudQs5HJXow7Mc5JwhEK7j9dwmCdBsZBP5Xw5tK0YAA4Qh4nI9OdG4CjLQgt4
	I59Tqg7VBkMW6AtynzElOUBrdWCPbmFzrL7KKf26Yzkr+P1f8Vbo0Lkn8SJ134SOhgSV6Lhb3vx
	2DrdzZL8hXjYx6/Q2Wg2gPw==
X-Google-Smtp-Source: AGHT+IHBMSZmFHh0iBBqbg6iYgmvQuQtkRQ7ni42guJxRJHi8RXPAyYfJYKwxYJrmX9gnms5o+3FMw==
X-Received: by 2002:a05:6000:230c:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3a512c032ccmr984242f8f.1.1748951847021;
        Tue, 03 Jun 2025 04:57:27 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:08 +0200
Subject: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMafbts+SQHLrCKWoSXydLXFpBuxk4+UMd/K
 nu5qIc0ykGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGgAKCRDBN2bmhouD
 1ybCD/9RNGsVwuWaYUnIhMCF6XOqANSxF4pvD+oiEd/nFdvuoXKyHPDhNDJkzr5JI+eCG+Ub/MQ
 IFPA1Eq4zim5rKSJGghjZ4QRpCKGP/BiC0e3S+lzj0PcZ47Upq2cpIw5uEGa84l7HVOKXzobLHS
 4dtbpNI66GnxgZ1/hAQyG7cQ+b/JVVCKbo1XzHQdPkwO/sBtnEFmUp36ZDI/u9u2hJTCNd9xwDh
 z8DyRDvM8YT02OvK2sUVR4UoJIaFA43uNXyC0U+o2mZ/XAHLxkOL6t9aY9JhZ1KZ+heKhYVtVDq
 jq6Zz6go76ikVf85UUQkieagE/lk1hxHLb8tPkYIOVn2IR9e9sjHN/DFFOa4m725Ke7rxh2Q4FT
 3xEYfP/AU+h/cHPAK8he55zMq5tzMMHeNybBTtDKzJP6gXsE3UrINKmF/MYJBWgtu9wx5yWcFY1
 VYfpQ7cJNEoGpu/gPhFNVgrNwEs9yeRon6WMn3H12OTKdniyzdgIpnJ7JIqajxRgkZkKb7n/zxM
 zAzeos1xnYnl4qwTwwQHYBwmfVZYlkcYcXUthGxU188ahk3mMCNE5DE2eEzBmKlVUVfoGpETAFD
 xe8BwA6xrgnmksHotq8VKWpDAzKd0sqUmepz4DJDrs9GYrxZuqqnQzCCE7b34Hj7GArCuhFFaYq
 RxgIODOMV9Ib71w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045728_923104_6094BE78 
X-CRM114-Status: GOOD (  13.12  )
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

Lists should have fixed constraint, so add missing maxItems to the
"interrupts" property.  Since minItems=maxItems, the minItems is implied
by dtschema so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 385809ed1569206a7304b777ea42743321c899ad..0849799ee0c5caaeb27fe1e3e3714a630a7c2b09 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -27,7 +27,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 3
+    maxItems: 3
     description:
       Contains the interrupt information corresponding to each of the 3 links
       of MHU.

-- 
2.45.2


