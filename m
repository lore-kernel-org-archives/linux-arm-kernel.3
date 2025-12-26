Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C759DE8FDA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuMCPB2Cfnw96ImXExWXbYx4SWWW9bt6GASD3DMHGsA=; b=fVKP9JO1zr0XhNx19ULtrdWDvJ
	XHsiqxZnXabG3m3Q0lmOzYdJA0KXPpja5SX/B+MX3vsp/cgbKbjq85kIQ53Az+DOyUE0szGub6Ohd
	NU9T2zLPsETz1x9IdhYiX02w57dzOVQ6zUHPD3VqP8w6jCm82qtGwEwGQmcoK8KXi97odqv1/ijB7
	w3+/K09V0inadcCDqDM7v1nKnPdMR7NxzXQ3Pon1b09iWnux6ashQ22JuIG1j+gsWh0BRq61WWVdv
	iqGbmA8glqU78Ymm2bEhwmUDcAOZe7/HOiVQbiICXxRQX4Ep8TxgDD7FxXbQdrFMcBV/vHO+QZYsg
	47i3qAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ632-000000018sO-1pWC;
	Fri, 26 Dec 2025 11:31:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ62x-000000018pU-1syf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 11:31:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3590087f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748709; x=1767353509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuMCPB2Cfnw96ImXExWXbYx4SWWW9bt6GASD3DMHGsA=;
        b=Fd6aWZY8lvEIRhhxSRHmYUD50cufdybjUvwKPjqjwlwZaI6oAZ26xz7JueN31GLDXZ
         ywGYlc6gyiimkfidNgTCaoSf79flr44fs+VHy6yUtf0P1UE1YEAVWkijJ209hc5mRXii
         JuJ7X5oTalcxYBkN13GZv/1hSNtwetvC4u0jValpMryiZD8uuhFMzRwD52ZGziPt8TC+
         YvlMxB/u5Hjwrng2Xf0YZTV+bhtY5hEvPNa4lMOTkexvVpfUUWOGoqJsvM1gTWpfEHZS
         W3n2jIS2El56FT765s2JxAwPc/iuQvzxcJA2t9ZlQKDzPbU/pNz1RovCUqH4VnX+h2H1
         DtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748709; x=1767353509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KuMCPB2Cfnw96ImXExWXbYx4SWWW9bt6GASD3DMHGsA=;
        b=D0zb3qpWJ2ukS5DVePVRjdpxyjmLNCzmbj7klHwdvTCFcYn957xLZFFlgLCDaW5Y0/
         d/BqeTNU1EzM/WAHPdh+9/IOzHJRbtYOVRaaJpCv3jqFhyS1nviHQy4GPDwo6zckqvVR
         PC4ng8TuJvF5MSA96+Nyb7kdFzPe3WJALBf7XndRVcJnW/jVM2VweqJGMgbpoKUBo8Dn
         A6vpSa72M34ThN8FBUCNhHJKsrdUXt+VzZS24c5gNnJfkdBMMvvOGz+MRGmUoIe47c1a
         Vg4a7C2ttxGTWRTjGqbefXfbTblX0xIfmdVviG6jCA3Wx+Iy4XLolvK+B9OvYZYDjMgl
         uyqg==
X-Forwarded-Encrypted: i=1; AJvYcCUAy1b3yGWkp51t8myVkoD1ReUiB3sKTTZ4R6pYx6Zdns1tI7i6e8pGJEhpZYGMzUHNtq5CbQNMoxJu9gkdohw4@lists.infradead.org
X-Gm-Message-State: AOJu0YyhY2irn5TX2yYlrXlhfs+HAW+zn5+Fk4LpznKV0c+NAvl81h31
	U3xeF2D9fACFA5dHddgUWXSFH4I8trspA2L88j7eUG2OEiCIkP2DkTnf
X-Gm-Gg: AY/fxX5DcaCWTpQ/u1RqjExqH4XVe48U63ZxLJSJRZCRJ4qZuPJecJDEaFNVTa280+2
	IzCIjp2PhpgP+vHsnj4jNU9bapEdr06/P7w6dQv7RXvGs132GYUxPpOgzC+ruGClyWxk4gEs65U
	GDMq3Ok9OUHNNmtWlSvHJfbL7/GCTM+IX9ekEp9NeL1MTEWSiaaBbEn4MwsFcNmrzE6QffOBaXB
	kdT0p9qtZG56WwRijgQXky7skKadkPCOp175mY3TgnDAAIm9bMUceJGAwK8eomeBbbfZ8OLZHLQ
	/wk4ZrdS2UwDtpmBS41uGO7cxHb4aU/qeH4ki9ZEglONsF0Y83Op+qVFaRqN51o1rZWXVGhACYK
	4xJOKHEFcxvFwCZw2c1Bsu+Ir0F2JK/Yf5Or2Qz6Q5T8BDq9532YiiCqP3gYOTI+5H6Su7I2xx/
	x0R8z2B014ZTnZZWE=
X-Google-Smtp-Source: AGHT+IHgXf/up4jkfIeElgBTb357EsgC5MRWNtr9/aPdG43pJwbtZ7QqWeH/nFQ6nQwGUv1j8qob1Q==
X-Received: by 2002:a05:6000:2c02:b0:42b:3246:1681 with SMTP id ffacd0b85a97d-4324e4c97d7mr27121460f8f.18.1766748709464;
        Fri, 26 Dec 2025 03:31:49 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:48 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
Date: Fri, 26 Dec 2025 11:31:38 +0000
Message-Id: <20251226113140.573759-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_033151_590980_DED256B2 
X-CRM114-Status: GOOD (  11.37  )
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

The video decoder in RK356X (vdpu346) is described in the same way as
the one in RK3588 (vdpu381). A new compatible is added as the decoder
capabilities are a subset of the vdpu381 capabilities.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..656ceb1f116e 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-vdec
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3568-vdec
       - const: rockchip,rk3576-vdec
       - const: rockchip,rk3588-vdec
       - items:
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-vdec
               - rockchip,rk3576-vdec
               - rockchip,rk3588-vdec
     then:
-- 
2.34.1


