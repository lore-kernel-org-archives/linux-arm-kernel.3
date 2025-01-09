Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A71DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsCXG5QdFyWi3c7ypelGdFzk7m3PRCB2mXJBAKsSM/I=; b=l8aIL7msXkoV2WmHPnWwsyqBjz
	lN9tVCplu9wZ4d7/qSSs6VBB+XtTIDQnYhZXpTVify+Kl1W2P7fzIV1W8BDcmNfOV8acdWH/4O2rF
	DmWx1IRwLBkOdFXCGRwRwhYA+SIfvb6xkEdKRRcl8Aj9cNH9aU7t7obA+iCZ99TXisqPNABIQSFei
	hS4hDdM+Ax54cDlJhb02Xf1yo9aO68Y9mGSWhGdH/dyP5ZOpX4sUH6J2M1MRXvQYXGpR3zL5V9tSV
	xwcYs9ZsmRgRx9Qqgnqy807elfE2K8NMaRNJkDhA81L5p+moFqPIuGxm9yfvZ19NacNfRKGyEzvi9
	FC9sUI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkyB-0000000Amsg-2ja6;
	Thu, 09 Jan 2025 05:20:35 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkub-0000000AmRT-0puU;
	Thu, 09 Jan 2025 05:16:54 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-71e2bb84fe3so284963a34.1;
        Wed, 08 Jan 2025 21:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736399812; x=1737004612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsCXG5QdFyWi3c7ypelGdFzk7m3PRCB2mXJBAKsSM/I=;
        b=J5sg7unYOl75pH398pRxGYUWDitTbeNv5Fb9BnWu1QHIGSym0vLyBCJt/NNPG1OyDE
         AZUUTKZXVVLlnrGqcjVMbG1jzDRbNGykBAAEUmT68ePMtN6r6mrGh2cXOR/0i98dxB5u
         7qf+Q4O83Qtvpf/SZXOshpN1HPrT6ikhPmRjtww52w08vqyhVjAuvbqNtdWPvsP5ccME
         zildmbgThS8Z84JvomuJgRo04t60CjrCGfOVEUd7hj6Il5O45qd+DpjFekfVKuiT5Kc0
         3qBsvxfVz03YVBY2uO1lKolxTc26oaAEC4AQAKT6UBQEAfnlpl31TdNQYLi3rKwrAznE
         hw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736399812; x=1737004612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsCXG5QdFyWi3c7ypelGdFzk7m3PRCB2mXJBAKsSM/I=;
        b=G38rZ1719eR+FncBMmD3qy1FMn5uKWYk3wMs8tsJtVC+txnezbHvCleIvqKxhrjkMK
         r6vVVDRIYRJWglxhRcmMxRMaJ8TZVkev5M2Ka39MbvhH0S+ogopMF8BGaE+WsWIRflwd
         CuLiHNcx9YGIh9XVVh0sJVPlKTPTvYjE5WuGab7aF/x+4ZkP56A9GIUZNNYcuQB7pAr7
         gdOxgo1s8JlboUQ2sjVAGvvsU380Ip0b7hBm/A7j/ALYltlaNe20hO0yWQLrlLXMsmhQ
         pECpKBQyseAJVupndgzEhq2q7DdNI+JzaEzzK4tSkx+HttjzlFebLXPRch2W4/pPsyb8
         kfZw==
X-Forwarded-Encrypted: i=1; AJvYcCVHzxhSO3Trs7twcXEhX2WinbmkHMXZbqAQekCW09EarAeh+SpVSTFJf+eM2hz968twalMMxfzSIS6L6z9UqqY=@lists.infradead.org, AJvYcCXu2hBHFSK1Y8yjBXbsi5fzvhq/I2Kqq2dcJ3YUZJ7SWcmbD46x3Yn9nbqZiAdN1PLxllmI2LaxNZB4eGheMU3x@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/G/ZMhTVOIMuUNY5DySL8OPd4MLVTw9X3mDso6XX30BIS8f29
	6aVqc8LWQehB/C0iVpkeYJad2PQLcOAGHcYmcM7qDtCiHI0agl4D
X-Gm-Gg: ASbGncugvZhAymWBRHaldHzEmiza3V1Z1U/UYVAL5B7FlgIHroAI7GpD5UBbakPf27p
	tQAq7nFTnxDB7B/d6e5ddkSaOj+QLb0Bx0UY6wXZq29ONL8PJ3/rrkLgmJqNjhK6c5hOxdlpK4e
	uiiMILoLR6CmqDRfHJJfnH1Tl3FoOdVElaCB2jmRJf8RJB+hHT7mQQ7E/IW07ime41a+i1EsasV
	Mg6xlgHW+axsiYOiiqhLsnqBCux/iPARB5ncT9C31Pg7VhKZGfnXPOJePOQbr1uHw==
X-Google-Smtp-Source: AGHT+IEvkWZ+ZX+FOPV/0Qubwqauw/EkQx4MTIkxgiRMmwM9R74P57M+oEIGRDk8mG4FhH1vkM11kA==
X-Received: by 2002:a05:6830:6107:b0:718:4267:d3c2 with SMTP id 46e09a7af769-721e2e5b58dmr3345389a34.12.1736399812195;
        Wed, 08 Jan 2025 21:16:52 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:f022:ffa3:5bc0:c1c3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-723185481bcsm187612a34.21.2025.01.08.21.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 21:16:51 -0800 (PST)
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
Subject: [PATCH v8 2/4] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
Date: Wed,  8 Jan 2025 23:16:16 -0600
Message-ID: <20250109051619.1825-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109051619.1825-1-honyuenkwun@gmail.com>
References: <20250109051619.1825-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_211653_235234_9DF7AEAF 
X-CRM114-Status: UNSURE (   9.62  )
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
index a09faf07ca51..f62e9a0d71e0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1129,9 +1129,11 @@ properties:
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


