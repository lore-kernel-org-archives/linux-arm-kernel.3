Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D81D5B158
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPRnLRSy0O8eO8/usPbgRGVWwoluAoJVN3wn79JTw9s=; b=RoSuFudMvRpd8tPGtw5iG/bl3p
	kiphkm4uNrXib/ceDQ/8wS8qN7vZGnECBRhcX0MRDwgenX4Q+kdR9FDA2pi+B4EvykCMzzbcR8Stm
	HqZNZV3Q6eXV9BGTak+1X1cJe5tdoO+kWTVFPO1Ueal9zbjAfdu6SF5o+kJlwUqPY1oKw8yvfKCV3
	3oQhWMcpXftbFqBf2AKCNid+d3Bw2XX5SfqplcVYQQDkH6hO/MgYyVHCgeDGWeJ2VvzySIr2gV7Px
	L3K2y7gujNkVfY7GtmoEj6TZBeoIKt4qaGFLgFozcZPa2DEAakiC13lJXFPoyYka4vfVXliIlWxdj
	MLs4X5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Xji-0000000CQzm-2WI0;
	Mon, 28 Oct 2024 21:57:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XMv-0000000CLeG-3XuO;
	Mon, 28 Oct 2024 21:33:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539eb97f26aso4870256e87.2;
        Mon, 28 Oct 2024 14:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151224; x=1730756024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPRnLRSy0O8eO8/usPbgRGVWwoluAoJVN3wn79JTw9s=;
        b=FuYBDEoddD1ZN5JahjUb1T/dFZLmCIBXdj5YlJDLTGnDk1mck3r+uui1IS/D8e4gau
         QhKZlESAJ1YCe+LGn7EgXFxWJADB3GBDm1m/xPt3iAIC4KxwkQx3gWPHk5kMOM6Uypm0
         jLoYEIvr93MMrKXjDrA14ExdInd+9WL4Z+TJd0pOjWjSo9dfdp1PwbQiS1MOT5nfCZ+p
         ukOkkMd1ckDLgE+SeL8zIF5doyyCJsUfSp81N+XeaDIK5EHpC0E8ibidB5yxpZYg8gSd
         cI7yl+Q5sxv+PmyU7jiQdcPSmHEYg6gqK6Ghu9Roelfw/1xsBKx2mS0C4jRyEhayBzh4
         HYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151224; x=1730756024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPRnLRSy0O8eO8/usPbgRGVWwoluAoJVN3wn79JTw9s=;
        b=p/zo3+wSbA3gUkNFTJtCvfjpYXaJbw08hkmAZf51iBBhk0nCnBOpwiuRZcpoMSNrZx
         EpudRA42QJxl+sjFgKffL5E09KO2S0RmzDEPeqH/UG/DTNmNbd4WEkRKEvtfTdd0qbYS
         2ll7gkreX53Fiwbf0Z+La43WiryS9TookgoZdG3spAmeVPaePsCs8qrJKmcoawNu8SJ9
         HuSn0xsOTTjMMSB8ADeO6Z7IBW9d+KevvLq4L34N4MTxQsFtTMzzDDGufTuI54BtQohP
         so4dnbKCiydkUJUm/JKkY4sRbiAFZOQgVwRWDjeB5nb8cE009ocG1TMc9DWTyfFyj+TG
         +N2A==
X-Forwarded-Encrypted: i=1; AJvYcCU+VR1+sMWrLnK7Hy6JJAqgC8ecBnJd3NxAj0oWPOZCwXyc4EMtsYVGxKFSkc3ItgMZkq+tkCZL+wwTfQJYCaM=@lists.infradead.org, AJvYcCUwe7pThGJDM8u89GLnZSZw+Q2mMedLNEPM4t4oRBBeWtybD2E0/p9U3kPV7KLm3zHg4bORqUHr8Bc052NMt6sA@lists.infradead.org
X-Gm-Message-State: AOJu0YzL3Ax1vioC6AS3EDf4N/S97vq14fE/QEEPCXkyOYVF+txTZqoc
	Z8gKdUOQ+KxTPoJKq7y3K6X6YcgiQVZC66HH7+7rG33aF5Yv1I7pcA1CbQ==
X-Google-Smtp-Source: AGHT+IE2BQsW00x49gT530R1Vo7XSzUMAOGRbVHewvEcO0xDjhqc7o/bJXhiJS7Rw9Fk4OIxjCFtBA==
X-Received: by 2002:a05:6512:10d1:b0:539:ed5e:e224 with SMTP id 2adb3069b0e04-53b348b9923mr4191254e87.7.1730151223612;
        Mon, 28 Oct 2024 14:33:43 -0700 (PDT)
Received: from localhost.localdomain ([91.90.219.38])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c98b9sm1204625e87.224.2024.10.28.14.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:33:43 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: rockchip,rk3308-codec: add port property
Date: Tue, 29 Oct 2024 02:33:12 +0500
Message-ID: <20241028213314.476776-2-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028213314.476776-1-dmt.yashin@gmail.com>
References: <20241028213314.476776-1-dmt.yashin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143345_941278_B513B51D 
X-CRM114-Status: UNSURE (   9.47  )
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

Fix DTB warnings when rk3308-codec used with audio-graph-card by
documenting port property:

codec@ff560000: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 .../devicetree/bindings/sound/rockchip,rk3308-codec.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
index ecf3d7d968c8..2cf229a076f0 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -48,6 +48,10 @@ properties:
       - const: mclk_rx
       - const: hclk
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
   resets:
     maxItems: 1
 
-- 
2.39.5


