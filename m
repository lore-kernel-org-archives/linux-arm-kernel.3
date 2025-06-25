Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YtI8ysHDGF8GpZRGmovRBTlbGiNf5VjMID2yRTeQRTU=; b=IcAP5O0d8b/hCtP547XjpTlZr9
	IZZrSZ+Wn+p2rINFLCJjRUP3hOaxfTJKYMa/oun++8DY/xuqc95QnCfQsR+SP/nyCIu1khQqJ6HUf
	oEkoxkoISK0YAMClVg286bpTKDzQUU/3OZWtxNoMDSrcLuj9kdx/MZlsJL0QFeCvWqH9fV0ZML7Fj
	PwVtHts80t8IgZg1hmxmCKCwGS16464EiTggYQoGHcD4HQJLprMCJWiPGdxD51wGOzp1bnvTxPZox
	h8tRwMD9wCeFtMuHw4SxBss0rw0sSmWj4RshIb5EVaNfF1gGDF041df5M95u6bVPAivexPTdTvZV1
	Zi65MT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW9H-00000009mru-1iTH;
	Wed, 25 Jun 2025 19:51:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSHj-000000099bG-1z4C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 15:43:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-234fcadde3eso918045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750866217; x=1751471017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtI8ysHDGF8GpZRGmovRBTlbGiNf5VjMID2yRTeQRTU=;
        b=lq/wIi9TAm8aXlFjm918LOU+y79Y0G8SVAr2EQP6typT9sXUHzZp6qFGanAJcaHiZF
         bMOaXQc+WV2mDIt50oQb1JjxrlmiGMeN+8iqV3R58haORg2ippw3eujCr4e5wgp9BXHq
         Q5qhK8BNYOyxSGP6J90EqjYLkjMYyRN3VUcex6bkLj6XpwDGAige3L8ygMKLpz/SFg/w
         8gfu9A0xJpjQbnxp67qkKtPQjRbEOK2xRsu//Ps2q41jA0CgtKTwHVM6uRjQ/kWxnrJJ
         qGcsWdHfyykzzuQA//0i7lo1trt59F4RHYr/etyoEZGFflN2F2ziq4r94Ebm5qQKtCGU
         XPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866217; x=1751471017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtI8ysHDGF8GpZRGmovRBTlbGiNf5VjMID2yRTeQRTU=;
        b=MC18zxiy9dbDDQA12qa4S3F1aZOwNGWbnBY+IUmsGYqJOWiniKcz+EDhFKj5lIj7wN
         oJgiL5L4yJ8mDcBcoyU6WBNYkMruJ4KZ/PAADdbJGVSL4KhZo7AZSNgKaQgYzuYajtOX
         XDvWabYQ/XPZPwKD+4n6ZF5yLPEF6+MuQvazrhgmJ0Al6GaRPF8XWFsUbH88zOurbHHd
         kGGNmlvNIWTiBaw+TF/A7/k3gtY4obu4PVkelicozIXPeGFXPT8b891JQj37bcxX7BNU
         qOu9jgcBk0UA2XdVS++2yVxw87EJx7LjC4cWB2VVX/4CP6Ok3USHZpYtNU80KnSDJiCJ
         ljRw==
X-Gm-Message-State: AOJu0Yy/T6KMdSjNEPX2Xk8l0WMn98TeLWXRbivR82MvXwjp5c03ExMK
	lQmf0rz7sOSeKwaCfjTU6Ar5nUQ9EUyZ3uG4JL/s8DwOUNcjAjv7BtgL
X-Gm-Gg: ASbGncsfWWWotFQ5z0hgHA+fUJO0uxKkSazUJUpfnN6OS1O8Fdx9NSn83b72+Ljo8W+
	BvNtjMRnoQhVq2Y60H0L59P9+s415NvfOCNFYmTozthkb5tZj7TaL6mLSCbmc3NhHrwcqIYUI4V
	HJXFJPXnOYg3PaPek69v2uV7y7vr9JCgk0UEiP+AAgqcTVj26DW4ZdGKjXssIMJglr7cwdbunow
	U5tZj7Ob8aUybJV3urruUro9OLwM85SxMzWC8HrY8b71i19k5+yzWwayP5MmRQ1SDh5K/hviu8M
	awtfUcmANW4E+0M3quzk4rB9De0fhsuIt/DAU7Y5pr2QmdoCEseVPueubGM7S16OWVa3nM4h7t0
	x
X-Google-Smtp-Source: AGHT+IEojHuDEfhv+Il/aCDRUeJzWgS8kwDdwg7ziLognMyZb9CPBYDF5z+fFQk+f8Y8ClCOfvDCmQ==
X-Received: by 2002:a17:902:f541:b0:235:129a:175f with SMTP id d9443c01a7336-2382404b2d6mr68604945ad.34.1750866217108;
        Wed, 25 Jun 2025 08:43:37 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:951d:3a1e:f612:1525])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm134229795ad.156.2025.06.25.08.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:43:32 -0700 (PDT)
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
	Taishi Shimizu <s.taishi14142@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
Date: Thu, 26 Jun 2025 00:43:14 +0900
Message-ID: <20250625154315.114139-1-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084339_508893_A5FC8830 
X-CRM114-Status: UNSURE (   9.96  )
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

Add Buffalo WXR-1750DHP under BCM4708 based boards.

Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
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


