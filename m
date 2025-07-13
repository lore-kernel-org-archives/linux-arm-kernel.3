Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3850EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3ibt1l+rop3MAv0eHcRbDk5yd86v3dxAfG2YHfIqhs=; b=wr30/4sF6PtBpk2Qu2KVj0Rsmy
	UmcEOzXN7RRWOZ9vg9w4vtVDchU5Ew7gdbwgz8l8IRoGV1QD4iEuf2HKeZzr2lvtxkZPTBpVLgkIY
	PsBnL1+YCWWONNfR7mtl6xbRESEy+PDb3YXKlUL+2lEv+TAERH9HNBpQcWfuBSpiknSwyj5I7srhP
	K+TFDKK3ok5JqN1opHguFTeGaAh4u8735UpP7gWGsvzJ9+gwazjrZlGxEs1BNfV9UQ5eRwj+i7kKx
	shcHmMt1vmsxSVGXOFPOh/OMB/b/K2R8bK14uPDv53nwJNNYni5aQpPCsoZLA8tzAuJvQNFhrYox5
	QZKyalMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uar5R-0000000HSDG-2Di8;
	Sun, 13 Jul 2025 07:25:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqz8-0000000HRbv-1oSQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 07:18:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234bfe37cccso27917535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 00:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752391134; x=1752995934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3ibt1l+rop3MAv0eHcRbDk5yd86v3dxAfG2YHfIqhs=;
        b=UYogDbvQy9Kuk3Fwng8o3pSjG1vJrZUyC+S5rpuCelVJyg2xJFWlGAwXnwXVG9reo0
         sciWFDtatvp/UpXMcrAe921/sXFOaV1gcoMuZUJ8snjzcSEW3Ctp4un18MdpGBF2e9ML
         5IiOxvUKZK2tC4/AOud1Rki9LA4UklG3douflGAJt9wErO1Os5G6r6Hya8EMhDbdnxIl
         tcbxzkqVfEyBejIIUNXgi7zdiTWa4IfGd3fo2fW5fjAFoAuA8d6VNSRqLY+0WO6R9yIp
         6bGziBUs/sziHw+riBQkGiIfAMh6p6AZwYsrm8eONF+vNZ1U7gaAoP4kDQ0hY3N6T8Yt
         sm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752391134; x=1752995934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3ibt1l+rop3MAv0eHcRbDk5yd86v3dxAfG2YHfIqhs=;
        b=McTkGRwTAotvnURNU3aljq323jovxQV+XRu2Mn4RsgUyMPMKhcHxZkfCLUu5ObagpZ
         s78FTbgK1pQsatlDpb4YM0Kj4qCkpHbKByJxElvIAz0eGq9WK+Rw+cHLV/wDDCgSz1R9
         x9yo/SJi5yiSfTGy+8NUl6AeyT9n0rnueEdhNyQD3NQDU67Q58vdESqqLMJiGVs8A9I1
         YunJf1s98u6R3FnSENFnxPGk2VWt300z8osPOsdzWpzwgOR8wBpDpBoko2WmvO4+8KGf
         fTPfAokn9vZvi7fnrvqFDJAslV+U0TZk8bOm9gFpNEU1CuAr5QFN6GTHoyv9bzHDTmvU
         mrlQ==
X-Gm-Message-State: AOJu0YwJ1/0Y+gEd+h/w2hSTujGumUwGZgZTU9REMN7YZH/OPN3OMOUy
	CKkguc3nrt0KbhPkIZNQmXCRAvFUI9i04akONTYHdX/kuWWbDbLgH99G
X-Gm-Gg: ASbGncvP9TS3ZjwaQy9PjemX7r8QHYde5k5QMQ8jkyKtMbubZdaKCXWSOCf0/E8gZ9e
	PIy2E6H4i1/YvjB2hH9yWKVVrUHCPkD2ws9HxheSvzdM5SL1R8IZO2snsQ8ePR81y3PKRZXjpZD
	edwFQQbTcuZyqWE9vt01x3y2VI1yW1bhHq8gY2xNLbxmy7OS2YDi+wcbrwflJhK9YRcrEUpiQ51
	B7yzVtjDNwQW3IEKXUkKVtWcj3Cqw8x0FrGKWpJ/ocr7F2LYe9HLjtt2Cyhujml5HdZK5BcF7iK
	N/EcRKMdRlA+WxTTICyYu9R6fRrfQAL5O+bXcEaXZv1JwDhgcYwZZMoSx/hxeOZhuVeneLfitRK
	X1Sc9x8VNJEKXHPuCqcypY7bnxg==
X-Google-Smtp-Source: AGHT+IGMgM20cpvHH2kxzpXJumjvyHc9GWSjG5JdVb9B98ORpebrIisP8unEckmgfVfsezZxxcE4bQ==
X-Received: by 2002:a17:902:ef03:b0:235:e1e4:ec5e with SMTP id d9443c01a7336-23dedea54f2mr152203795ad.49.1752391133613;
        Sun, 13 Jul 2025 00:18:53 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:3d5e:f962:c950:134e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322db2sm75239065ad.100.2025.07.13.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 00:18:53 -0700 (PDT)
From: Taishi Shimizu <s.taishi14142@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Taishi Shimizu <s.taishi14142@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
Date: Sun, 13 Jul 2025 16:18:24 +0900
Message-ID: <20250713071826.726682-2-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713071826.726682-1-s.taishi14142@gmail.com>
References: <20250713071826.726682-1-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_001854_466779_0E5F7E3B 
X-CRM114-Status: GOOD (  10.27  )
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

Add Buffalo WXR-1750DHP under BCM4708 based boards.

Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
index d925e7a3b5ef..f47d74a5b0b6 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - asus,rt-ac56u
               - asus,rt-ac68u
+              - buffalo,wxr-1750dhp
               - buffalo,wzr-1166dhp
               - buffalo,wzr-1166dhp2
               - buffalo,wzr-1750dhp
-- 
2.43.0


