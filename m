Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0114CD4844
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=; b=SKluSy53nuDPGNC9yf44NcL5j5
	xurAeTx2J0iZmQjSu6qyQnSPWGkDXoh6xAZZtR092HU0aNEjL2bcxC8Zc64tmQcA+/EUmzrRbdOrC
	La6MyFhN809eCdt/cBCzWLeytqaV2d6R3ccobpStzVwELWYNozlNQjOXuQ5E6XfD4LMNhtxIxQ7hj
	V/vytAEuFuVpAi6QXi8rBNT4dsrDSpdSbsPJlOLL5wWU3pYD0FRxpYohNVZMImOmy+09xP5/YWP+a
	/IOANkmTl8luZQsyaBYpkXZi+g1oGbvid+pPvvgFDCj+sLPHIIP3NBpLsMQtfsFtyhvrnV6I3kbv2
	CcK+pzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGmS-0000000C4vn-20Rs;
	Mon, 11 May 2026 02:54:04 +0000
Received: from mail-vs1-xe64.google.com ([2607:f8b0:4864:20::e64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGmM-0000000C4rh-3lba
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:54:01 +0000
Received: by mail-vs1-xe64.google.com with SMTP id ada2fe7eead31-631a7868228so1095011137.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 19:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468037; x=1779072837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=;
        b=OGxipXXYSXvz9UZBt+0p8E0h+u++KpD33T+h7u8WfJ3fCvkLvyZSerubJpg6XBrz7q
         7Um05FdiTFDB5drV0YODEvfacQjZLgnXN5+X0OqyJJoxQhDRoJ0cs6fNTDTCIP0mBs4t
         2SEzbw2pJ6QjhtJnPpWKrOxTqrco5KhkVM6EvomHg9ztDItpg03NLT8j0UGa8PbRgusl
         uKUV6ZWh/W3fqKHt1asUlPOWENCWUKjCq6wWqFcDJE/L5rd9elgHH/BvtouWhgYVxh6A
         2xGcvZeHrCVvGW2DZeQn9NFtGAMlmQGAdSQ2URwhg7NVFz762UFI1HZiyNggBEbeLGMd
         WbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468037; x=1779072837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBzxrwb3u6aAy65Ew28k5XS4vquizRynMypljlvuLRY=;
        b=Z9VtKEvxYpaWjB/ikZ30IcqqcEQGAFn3/atHvnf/4Bg56NJBfYYw5We9pM+go60lol
         Cp6SRrl8epk6XkDdN19U9czweK7RxRns118CYRZc8VX/GGmXCdo6UHXavtH3Bn+luw1x
         L7H0e1WMPzT/Foc64Z4YkWcUFTnXnneA5XbIoXGnuT27uBSknsfMLcan3dzCv1v/szL0
         +ha8hv+CSAtRvQJTouepXkqWhXl45E8dpUKWnU9yJYO4KI6yy3noS8iL6fziozFmNhb+
         Gb2J0JPwWs54rdSMgvyGRxZiVNYzuzPLKAre9N9WWX7P4rSx6tvWqZEiDsJ8d6ZPvUou
         BjoA==
X-Forwarded-Encrypted: i=1; AFNElJ9GqAxhTVGVLc/e65DmfkSXt3yiguC6WJiv26hvCUFdvhuGlii5+BC+lzpdlhuczZLzZE3ubri5XS9xJHm2y0/S@lists.infradead.org
X-Gm-Message-State: AOJu0YxktHlM5igoPKe4JPgMpvH+8cagxObsx5aGAvQLkcudEEpjZiIc
	WDS1dlSEAHAW04YGn8wQJr6FX6Fqi8RrldxUMY8yiSwSEJjrm+pc974O0iKAY3wZQT7eyfe33zw
	waDFdaji6U4tRejTBWtJBv5FVvxeV/RlkxBzF
X-Gm-Gg: Acq92OHsXKvc7zWjulVBi5ph4GekTXP1jRvGM3Erv+UmHFXIyN8+Dv0A6646Gk4zc4O
	rgSSoD6kHiGkmU5aT7GLXqyurrth8zcD50BiptQ/2ACLU2SzRFkL0bGBfF+WTAJHdVW6qcQImWo
	3NcoYmXbU6KW633wKNQu5/mGKegSsLVXNXjsGT4XhjJBBHOErUUAttyfbysX+yLa84eNLUVgNCv
	r7jJKEvkTIDlpsfbT3GYtyZbwGNt+6EVzAPaDzlOuljVqOli1jPoB7yx/edHuUM/XAvxS6GdYxO
	uq6nP3UduCNG5Uei3ObEg6g7Y4QkIPsr9Kz9VxLzWyKFpQjBS6SBeO32f0lHXNj3Q99WZ4ha3Ah
	3myYbLIeBC8V1LhwyFGEgTSb/mKFPSntEbujBl4OgEXK5
X-Received: by 2002:a05:6102:5698:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-631ec2d1a1dmr2814871137.1.1778468037614;
        Sun, 10 May 2026 19:53:57 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:57 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/4] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Sun, 10 May 2026 21:53:47 -0500
Message-ID: <20260511025352.106126-2-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_195358_965686_E8D90201 
X-CRM114-Status: UNSURE (   8.58  )
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

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ec1303140600 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1338,6 +1338,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.54.0


