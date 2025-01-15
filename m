Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d+c8ZViS8QEnVa4l3RBbC0mkMWBhNXE0tgtIholsxgM=; b=MNejaIEv2hdJhT8v5BmD797hSr
	SjqZlgR+vVK2qtFXFpJ37lcxbEY7Va5ioH4yBxUK72w2Dw+NalQVZvI5R+MtzypoAAwV+AXDTba3h
	orkjN0OlvHBuNbDG+UzWNQzki6+sXJ0R/1FJ/v37KfxYKPzXp91C/KVdEetI18qBdTpK3hr+9IqBP
	a3JQTMZ1ScAYW4dmRTkkPKu/JagzztntCpUbNXh09B6qF2HHB0ORKi2M2i+4s7ValcHPEs0dYdJr/
	ki5KmxVkX9IuNhyrgbvYq7giUmA6p4OOmSug9JYInlq+NnTA1tdzUf+QxRl1iz67x3FgXJJrwfpLb
	j6a3tObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAoR-0000000D8pk-2k4j;
	Wed, 15 Jan 2025 21:20:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAle-0000000D8IU-3VnU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:17:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso221955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 13:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975857; x=1737580657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+c8ZViS8QEnVa4l3RBbC0mkMWBhNXE0tgtIholsxgM=;
        b=QBVpul6TAsvrs6XYv+iL9uQ+7PsJFF2K3u3ha/h0V4duuxBpoJTODh2YkfGu49BxxO
         lFG4Phba8hi0Jkz5a2UYpnNLv4zmO1Cu67hB9cSoVO8tjys+CRULMMdrfN10brfgbo/F
         tZQk3gL4zeCUdAZyfujsfhPXoLRTh6bQUCrFNUL0f17AOxBRY6a52/KevUOwVritGgCo
         Ks1C9vFKBKcUib1zPCnuj7PSnWmxoFFg4qDJxTg94EiszchGQMdr4SFC/UgcKe306NKu
         Du7HAxiRdoBTps2lMuK703oMM5PBLSy/+IEyAwVXk4+f1M1M0/4h9+/5LqvClSc7L+zB
         skVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975857; x=1737580657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+c8ZViS8QEnVa4l3RBbC0mkMWBhNXE0tgtIholsxgM=;
        b=ogEWWHLPuvfiHEY8tJp+95aRfZHUw2bZ6b+zJA7r+41Sp9kNrkCjBKBo6TPUOpKMP+
         tsBIkBT/XV6uJCgEzH3/nt2XuI3ITH/Dnhf6R9bFjVv7JCJVHXqrD+kukGmrk698iILE
         121R6AsH+GtT+jGWJO1rI7fV1oBRNipriNrh8Asirq35zFojkPnZ8+X1uGXo09nuVB4w
         2nHjSzsfAPevNx7wV6nALOY7uygjIypdGmhHwWmNWwwm2jZC+M3ZoMzWtilMQYKrVz5L
         kZnUVdfAFQdkwjATp9EcD4Bv5GOr9o5H0DBWM86ImDtpOcn7iAT4ll+hhpiADXPB4SKW
         VOLw==
X-Forwarded-Encrypted: i=1; AJvYcCVu6COmgdp++QfhFvn8OyLakJcQJleN5nJqXmcwkOofk+c8x9ISDv6f3pEvmnPXiiMIazjaGCK04DSRpdvrug1c@lists.infradead.org
X-Gm-Message-State: AOJu0YxjD0SB/2yVsQXr5jak5tuY1ilXYKslu12k7/M0jApoDT8HxciZ
	th0NHIxQol01xnVEu5w3QhH9lD1ZC0/J7uljO3zyQ/XjdCg7Zuag993/e4rSaLw=
X-Gm-Gg: ASbGncuLMi7vu8x2+/PZMRdUis3CpAVlk5xRdspbe6s3MGZ+LYpJbXQagXpROq8Pexf
	swATfOyjQCHh2XiQDZJJpnTM45bBKvJ5akyE7BthdE4ZKaFcQw0SC3epKZX7aAtGStZmvZisGev
	3XZhzzgsNbz4bxtBE5u+41FqvRWe8Ht7F7dsTGpOCiXA+3QLj/0QJI8xT2k7Ct+72qhBZc0mNVU
	1m+qCTYGvO33+LhLvjytb/7Wn1tzSvqKpmEtl61tetaT86tFOG0rVP4Y5f60eMLmWxKJ4k=
X-Google-Smtp-Source: AGHT+IE6krwUR2QumwnUfPPmflTi7TTmshf5KLSxOu7Zj4F1rd78lylP3YHbkpgHZAE57cjbVARQPA==
X-Received: by 2002:a05:600c:1d07:b0:436:1902:23b5 with SMTP id 5b1f17b1804b1-436e26f4abbmr109908065e9.4.1736975857216;
        Wed, 15 Jan 2025 13:17:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d090sm18433838f8f.2.2025.01.15.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:17:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: marvell: armada-8040: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:17:26 +0100
Message-ID: <20250115211727.194142-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131738_873521_03C7EE68 
X-CRM114-Status: GOOD (  10.24  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  armada-8040-clearfog-gt-8k.dtb: sata_reset: $nodename:0: 'sata_reset' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 225a54ab688d..90ae93274a16 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -371,25 +371,25 @@ &cp0_pcie0 {
 };
 
 &cp0_gpio2 {
-	sata_reset {
+	sata-reset-hog {
 		gpio-hog;
 		gpios = <1 GPIO_ACTIVE_HIGH>;
 		output-high;
 	};
 
-	lte_reset {
+	lte-reset-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_LOW>;
 		output-low;
 	};
 
-	wlan_disable {
+	wlan_disable-hog {
 		gpio-hog;
 		gpios = <19 GPIO_ACTIVE_LOW>;
 		output-low;
 	};
 
-	lte_disable {
+	lte-disable-hog {
 		gpio-hog;
 		gpios = <21 GPIO_ACTIVE_LOW>;
 		output-low;
-- 
2.43.0


