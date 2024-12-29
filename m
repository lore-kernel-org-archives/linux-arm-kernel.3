Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1688E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=; b=v7wSPBGdsmXSErOj7TLrRdSp05
	zlriBLRZEtvaPY+Z9pzRzSELjPBw5GS16v+fnuFlMpgVZoohot4sokuTYxL1Hhz9XdeuCf5FTjxkh
	Jvdbk0//tJBoKlkC9tIVn1NbaAhIiClgrlBs6Q2AKLTaJ5AQOc8Vt/uZB2ytuYJNhkCyN7b39rv4a
	Qi32XCPhLKuF5NwdceSvEglRNZM1ZcGkgSlMhHkAz2pSujsZur9z/h1x3sZ05KKXweQZYkIAt3niy
	h1MOXqFQD5JvoqQBSsu/LvI711d0ytLRZpKN8HLZNmXZm2pYcjgkQvLgMpIUtiXq9eRQdERDh0FJC
	W2bL7dsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyK1-00000003lVn-0tgZ;
	Sun, 29 Dec 2024 18:47:29 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyGp-00000003l6N-3d1U;
	Sun, 29 Dec 2024 18:44:13 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71e10e6a1ceso1642528a34.0;
        Sun, 29 Dec 2024 10:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497851; x=1736102651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=d/KD+LciyrI8SUVtpxO4mgl6xEtyyxFYCdEofkyNRfafrH+aAxgwqnVZak/oC3RCre
         ynYRTqJumZ4outfY+Gn/G+AqZLvMt6HZP8ZBZ0BlP2ELz6UHKqCSD0IiYm8/VpVu3ZJ2
         a4iH8Mrul1MONP3/YPYaZ3GCVUDKigzWbkzNfCfjPQYuTBRMgQSyHVJPIRoB/ikkHoOy
         cx2NgUy3PQYD9qTFQGLVx6U0RX6j3lCuq05w248EJyGeDtK6OMAfH6cKccoWJYfLti5N
         NDGeinz1N9Rfh6opMiLi3cSOK0sKBRGUSnb9S8PMGdKgGmRd2+MnVUpZm5S2Ix8yaq6+
         Ob3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497851; x=1736102651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=grkmt92/2BxDjbDXrFUrPpUQ/di2pHFoSd5Irw6SKaWvVuZiEz6utfRZlFhV0qp1UR
         ysK6lR4C/Ip6mayCFIXJR0nGns5sjvvAFepaHe6nf3LKTcf1nQbsyk9jebmTg3aarO+w
         7i2NENPYG0xEYKt3cL8CelivicUGLYyUiuK4MSvtWAz1VV2IAWzFB6WrVmN4XLfNhksY
         IGL0eQyYMrdoEUkPV7hCgOc2kJwilR4dw5UadoyrCDXxM6L8Rs1lFd4NF/vhKs9OwfCf
         DzJPxVkobCU4ODTuNIjAUskN+ULq8Z7HxYUesopEKUUNTrW6LwGg41CCqSehSkkWFsKX
         iNGg==
X-Forwarded-Encrypted: i=1; AJvYcCVG+wre72tlD6IiBPX7ke5YlKGVs7QuVqJqaCg/JMTVcjxcmP+q8ULOyRs25JOGo63mDKhAzBpDZwxiNjWxW8e4@lists.infradead.org, AJvYcCWhMOEXKtTbHBKoYMhYcPZ4k4CsFdLhCfpyUvI3w5gXrHXPraVIr3op3sa/Y1z90TAsMpkwewU7cHV+ZSWptME=@lists.infradead.org
X-Gm-Message-State: AOJu0YzihVa0G0Ys5E3FxUBq1y1JNga/lRDBs6N5J1PzXJLtCMoRyMye
	9a7Uq5L86zNT6OCcz6duihNFfes/xQWpSskf6WE5V2U12kaD7dN+
X-Gm-Gg: ASbGncvwdgRgf3GI1jUCyEJS89v7LpfXZqPQ58sueyweCqSzXgXNlbg5j5WXsn4YH5g
	lelCmmRxkVv534boDJtvhspTybblfw48mVZgQGqBGf0Ol0ev+Hm+x1E/LwzBBfeVHcbwLZ8D4TR
	9WUtM5NWjngYmGgh/1IF0Bdf1wzwI06c4elLHhg8sOw8BAT3dRRKxA6mofxZh213HnHexiex21c
	B7t94qUdKqmIw5t3+sy+i0IEO2fCSWpHAnytzHOhlbpoCaO6yaAxEcqHtkoGkMr
X-Google-Smtp-Source: AGHT+IHcOvw4X/mURfyMbYbaw9HI7UAEZMSk8SYcZJoXJXIdCfuyH++j/uv2ZWP/3V4lKKq1MCLQ4w==
X-Received: by 2002:a05:6830:4422:b0:718:123e:922d with SMTP id 46e09a7af769-720ff801918mr17728569a34.18.1735497851231;
        Sun, 29 Dec 2024 10:44:11 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:44:10 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/7] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
Date: Sun, 29 Dec 2024 12:41:27 -0600
Message-ID: <20241229184256.1870-4-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229184256.1870-2-honyuenkwun@gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104411_900831_668C0B54 
X-CRM114-Status: UNSURE (   9.34  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Max board.

The Orange Pi 5 Max is a single board computer powered by the Rockchip
RK3588 similar to the Orange Pi 5 Plus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..2a141d99c533 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1075,9 +1075,11 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Plus
+      - description: Xunlong Orange Pi 5 Max/Plus
         items:
-          - const: xunlong,orangepi-5-plus
+          - enum:
+              - xunlong,orangepi-5-max
+              - xunlong,orangepi-5-plus
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.47.1


