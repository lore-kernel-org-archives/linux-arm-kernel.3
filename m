Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C803E9E2E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8q8Sj38G7lSy2PHdK39pfdrWAcnwDx01kj871muJL5o=; b=v95qrMlcmRScen3PGGjuLRIs6y
	1iOUZBLLA4iol/jPoK66OjC2SbVaD9RDZXibnUK3kCFDhqSLMYnoPR0Ow+pLyOatu1g1VGZnPYTDp
	H5si7/H8Dm77Qk/yTbIeNAqrs2opzWsin1m9uWVcUeFuTbUXfqPhTwYvNdbOh9ABMfhcXf0hsXbU1
	9BCH+Plh4rppRB/uZNjT3W+onJl4//CEExlmK0U2tv3v1O2SJqKdbDKV7gU3jIGz8kHz797GMR7hZ
	xWCr61fyLty1lvQPjO0C3OJgweKv2Gdn9e0H/xDIKXc8WgVKUQUjTWPpvy6i35MsVpB5A4IIl0KlL
	OHTZAvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq82t-00000000YPg-0kgK;
	Wed, 11 Feb 2026 11:06:11 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq82q-00000000YOo-3ylU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 11:06:10 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-649b1ca87ddso1775476d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770807967; x=1771412767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8q8Sj38G7lSy2PHdK39pfdrWAcnwDx01kj871muJL5o=;
        b=T9+Q/SHn74Cia9J8U6h7gwaoMPwW+/y8Epel8w+NQJyhCDC+VU9wIlHWuyc9x1C19w
         QRJ/9K3YwHNKZIJNmdOXvlrS76X9yN4xt0jpi/WKs55oyHCAxti324cgrOdFWcDklKGu
         zXwgIsrNgYnf33xcAMpG0GPEFiLpNbxiyoGIJq2i1fOlTbFSOc0Z9TfmFVON+nnterIB
         iHb2VM8/5gWWyZqx70IZiPM84bFMr0ncD5rXsjrQcp7ytWs1Zp7EyVskbb7u/5xqXQDW
         LE5ERPpWmD8L3DFPfZu3KzKUCgO9xxh8Qr3WLVP0XqtCrUmD/QHhUReIpgs8FAVDVlF1
         0R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807967; x=1771412767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q8Sj38G7lSy2PHdK39pfdrWAcnwDx01kj871muJL5o=;
        b=IYNw+m6+siGp4FYR6kxPAlC0O3pWIgGl0UJgKvMpDJIioXWAh7BskepWE9Dnq+xrPE
         YjoEGUxyJrC/bHkYCpznGES45k9hW4d4oS8j/Hm17PlQzSylqz6LustMCa157aKs9kkK
         VLuhyFmWTVbl8g4cHGhhZuHFE9WgVQ2amQGfPGnenITGLlPDvw/t6DU1npHcbjvfXEIg
         O1TiS6uKTxOWJWiVrhS2hp5SoTv2R89fhAMxOTJIyBQFgSp3wJ7aeV2rpvI44keWUM83
         YSoHR8LXVFd5nE4xzBYVbRcFpIyV3AAKf/WyVBN16jmlTzzDmJ2DK1yVOoWwnss6ecsD
         bwvA==
X-Forwarded-Encrypted: i=1; AJvYcCUQnp60vUia0Hb3hLKasGlQLrMZTvF+Os2RmA5MCg6pmafd+23jY546IYQSmcNF0CixHuGqhE/NfU2nGZjezTN+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy/NvTEg8wlRhzjCqSfMXC+Pa5mSjRq7gnp6jT66W4WSLqFqb4
	WXZTSBawDXkJQCRi0PHd4fCG1LWx/Vak8nh1weA+rGB03TSB1XrSAxh16bR7dw==
X-Gm-Gg: AZuq6aJsOmhGD1k06DHw6U8XDr0QW9UlyvRms/dXO6g7xJ/o6cfdmRKqnCSdlRXPRHV
	DaP5hh2PKY3Y0/HzHx8mY/gP9iNK5CIM6A/R1DEY+fnLOlXPtLYKjm7mCj1+psD9zCPx9rnchPT
	tMl+wG+M5fT+q/aCNbm6rn3WBlNXbxEj6ZsJ1PKeLIKx4Z6F5UEmd/AyA/agHW8Kk4JPe+ASuL5
	2nNqKTQ2zeaOp8GblHClE/aX1p9LIKZyVvyBDEq2RvAsiooWjbJwrUQdOgfDgwSRVGRUdU0mqJH
	texAXh5Hk3BiFMDd4KBR4UWW8UXbz+NQrwlZ2EJuJoQ2luZr3TMb5oriB3RiaE0nGHxAeu+QzUE
	uAbtaPzNko1+mHrqDRs3nlxFOXPBoCxeDZ1pjJDXq7Ug4+4/TBXFV0CKJcuKV7h8wtLLsryHaMd
	E9m1Ywx8VUAApdXpXyorPS2oolEMp0Ue0Ke7I=
X-Received: by 2002:a05:690e:1401:b0:64a:e234:e722 with SMTP id 956f58d0204a3-64ae234eebfmr8768217d50.39.1770807967480;
        Wed, 11 Feb 2026 03:06:07 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4ffb:e36d:8763:a188:5dcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc87ff20sm1533719d50.10.2026.02.11.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:06:06 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Wed, 11 Feb 2026 08:05:47 -0300
Message-Id: <20260211110550.580474-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_030608_998017_84B9E9DA 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add the PMU GRF and IOC compatible strings for the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v3:
- None.

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 0b8e3294c83e..2cc43742b8e3 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -63,6 +63,7 @@ properties:
               - rockchip,rk3588-vo0-grf
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
+              - rockchip,rv1103b-ioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -98,6 +99,7 @@ properties:
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
+              - rockchip,rv1103b-pmu-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -231,6 +233,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rv1103b-pmu-grf
 
     then:
       properties:
-- 
2.34.1


