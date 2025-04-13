Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEA2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=; b=oscuGa0iwSQ9Jb9BAW3r2Ibdbr
	exbJxqCU+dbcHwqFgns2DqDSrQ+m5GzJQAxP9vywEIN3s+BLiOUT0Ea1Q1bhBVQ7mN4S/iHtSrdwO
	jsUtbuX8raRPbNAgf5HRpk3IvZY/5CUQ93W0Qc7wJYjRopKlMaoVIRjFFplAJkC58bhjCxIAe3LXn
	EUVuEM2B3ti8vzcQtn/NurG+aRBQxr3syRpJCzh4+iunKLSrt9qfOoX+wAzM0s2BXh01IXvqhCkru
	ne6BWzq95EEyXO4tq/L0iAx3orFeBz7ZBleJEpuwgzM/WGEfLpk+uwYgBfoQAmFKv9hpQo1jGL00h
	3H35bwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3xgC-0000000HDvW-42jm;
	Sun, 13 Apr 2025 13:47:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3xcb-0000000HDae-37Ru
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 13:43:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso590772466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551820; x=1745156620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=;
        b=YU5Grx10h7LRIWKGbysqEvAeOd7SAEB5k3s6ola2SlPjSvqLQBhyAfIWcuCrhEcbl0
         DiV8R2y8jnSWdZ8bo/HH50gTWtpRu/N+ztzPy0sWhdXWl36xUOVY/E3q1hDuk/dH+3Rx
         eNsQ42bIU1U3KiMetB1NXdAVSG7GoYCmgY1rDq8kUQTv3yAqIOzH/snDjoAWOuyEqUZX
         mtgGoAJD2oN8gLlJWRnIpDlRSLKEtI1XTMxdmMLDt347xMdSnEE4PO85mZvbwcpXPLEw
         ocI0pr05riQ7AbK5FAV6JZKGKGK+wgQfgi8wcur1v79to8ZqYoAYvSDoh0Mw32sC27ky
         mSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551820; x=1745156620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=;
        b=T0pSUKWrWi/9yT4tBlWNJar5/u8ak+SwqvHsRW8M2QGgjtr1+qvIYrwDVonhdb7LcX
         i8Q42lUIInyQJbRlp4oTbY/p2a5vJCIFOhhZc/oTNBPrg+O97jxhD5IrxocSpKicK9+W
         1UIl3GdCJCJbm1CD2Qd/eyVsmvMrJFxl1b4Ig7A+2SZj3VIYxi1T5hPT9k12GY3dZo1Q
         ndxPzdtQ0LPact3BrFU4l3SRp1nR+OkRcSMs9cUYBVIgA6Jflez1+rVsnsQFGRuak9au
         5ICScJp67rTDY6HwxuiMGhqIHmCk6n1SaGrNRIyV87FYWblkQx0rp0MF1rgVtX1DXqzn
         8+UA==
X-Forwarded-Encrypted: i=1; AJvYcCUm0mwDVva97ujF/CvHQK4vEvlbePxwXkBtxSZgn+bGns2rP3U+B6wLk1yiHp7sCLtl6v5CemdunP1qYV1YLIrU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28ZcXhe97XdXHKIqJcQ+2M0kj0KdukNinJGUqJqZtyvi+/LoV
	spMxFafyrEDwMwhinNVv4P0HTZTwmY9Frynm1aNnEVAonE1x/gXQ
X-Gm-Gg: ASbGncvHDJuZMysH8NSVgCewuBF8tII/fIal5DgNwoXCLNKO0TUiam/mpU2WhTxc+Gm
	2sLUZ88NlEfzBWlWnzmf7MI7EQD6sWS17r+ZML1mn+roPqVrjKfxbp7y4Qpnbd+cVsbsGYO8qfs
	WxJMkgzSUvQkcZ/uS9fnGXUMXDGD90g54TGW4GfN/ktj82yz69/n4wXdpUJm1kC0GRRyK4BDynn
	x0e+l0uFLowIvFHGthP4IMrtE9MNmR74etZOJ/MPJie4+oSvLP03fcGQ9DJ3rvKFkSgg+UQfA2P
	+6wQbN/6dPUco3hb3Ce1Wo3YB8wOZr+08UCQPh4xBSJbxjJijAm4nYIQBlk=
X-Google-Smtp-Source: AGHT+IG6IIvTcbFlePkAwHT/05Hid/xlS3qf9C/W84/Ywcx7O1L5k60TXgJeL0SSV6porQsrQjvvUw==
X-Received: by 2002:a17:907:9728:b0:aca:cc55:fd35 with SMTP id a640c23a62f3a-acad36d901fmr776146866b.56.1744551819626;
        Sun, 13 Apr 2025 06:43:39 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm749422666b.55.2025.04.13.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:43:39 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
Date: Sun, 13 Apr 2025 15:42:56 +0200
Message-ID: <20250413134318.66681-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413134318.66681-1-jernej.skrabec@gmail.com>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_064341_780336_66A87210 
X-CRM114-Status: GOOD (  10.61  )
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

Orange Pi 3 LTS board is similar to Orange Pi 3, with slightly different
hardware but mostly same functionality. It has less options than
original variant. eMMC was optional before, now it's always included.
2 GB RAM is now standard, previous variant also has 1 GB RAM version.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f536cdd2c1a6..f417745c799e 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -981,6 +981,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.49.0


