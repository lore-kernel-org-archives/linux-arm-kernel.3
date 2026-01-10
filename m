Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA3D277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 05:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRmj6n80JYrNuWPK4JdBaS4YTu/hZ0Oho3r4jDBrKMA=; b=McA5UxmsyenR+jOqSKy3/iX+W3
	0Htnn6PUIe+d91dCoNsuLAOqrBkie89uL5MvJvB01ULngIDQsonz/dQ3v4klBQXbGqfzLHu3+I2Se
	ztRYyTxTH/ChKnc6AHlqQ4PKLM8FwD+CNLxIQIQDqau6GWyi7GIxY0Sa3IsVhWDIQLRZoJUkPubo0
	EsuahElDSCkGgqXJ8XomfHKl6R6azWsZdN1sAWK81PdPEfbggGLWYz56KUaxPLbqV7BU3CpSS3mYW
	ZKpvQz7jkyXushuYDpGDvtYMWllOmA7OnF1BeImtEOd6oH//a/HvFB7xuBUSvaAwxUIBwoE3no3+7
	+jRmBTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRfR-00000003HLX-3BHc;
	Sat, 10 Jan 2026 05:37:41 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRfO-00000003HJo-3ST3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 05:37:39 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so36392195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 21:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768023456; x=1768628256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRmj6n80JYrNuWPK4JdBaS4YTu/hZ0Oho3r4jDBrKMA=;
        b=ibihrTljAneVfW2kplpOBEb8cBJzPCT0M823nCwoyg8o64/xkdw7LvgX1L2vQyg4cd
         hngv3O9xN9cqb7nUzUnzyonKWVQyMe8hM4k5gQlSup5muwxkoHtnUQ6RnR6Xa9A7rP7m
         kPMlh6H1XhIhfeCXUFxp8ozonDumgdi7MU+qsIxrqjNB9pqypQSclReg4CWzwXqYIoiJ
         SoVcJH+2BCP7HdCzHhlqPSi4aYSx6bCTadeEKqtlnC1dBfKcfOZjrXOgEO0mbstgmQ9f
         BJnk3hgaoRqF435lu71m6zwvIKfpJ7gHG66cDCHBZNIRhwvjqyQrkBWTyPhuzz/vajob
         vj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768023456; x=1768628256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bRmj6n80JYrNuWPK4JdBaS4YTu/hZ0Oho3r4jDBrKMA=;
        b=RSgLBHSoNYeicq603wE7hc96MOFgOpa1DKQlV1wuUspgiHLs9C/XNHPut1sOb+PB3T
         RVYCTaau4ntUa4f1pwIr1qMg2LhlLCK9y6PsGTmc0ulle6ujz5B8Dhgmgs+x7uQ0qRJ7
         23a9cafsTgyb78ONOC8sBoXfSJskQ0NLj4S2JTKCXtdeyFqMopU0YgzMGBT0lcVAkIvM
         YxaAXm4HwN85rAlyGg3A+FZkG3h8XDy0z5BY9cSsjemg9g+3C99iVM8aJw+xFoce4kAk
         nhsRGU2JWWqNmyTjhdLAZzLxfHhxI3NZGo70i91CA5vTGJ04dzSX+eQbvgA3zvXaMJLr
         ULAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFEuxNq/HtMsW4B3R3VogaCB4+XbfX0486ZkGNXf6MrLyFWbElLPuOSyVdSw7KHjFCHH6Rz+c1mbj5RL/AghKP@lists.infradead.org
X-Gm-Message-State: AOJu0Yws1yzXkaXwdov8Gu5k7hK5K3xPMu64q4bu7BuxBNUYeVZ1Jugz
	2gT6i3SzsVi5CKwJgDkDhlVKNUMNQAjq1++3O2BGEoWccI0gtHA9aOHi
X-Gm-Gg: AY/fxX4HiwQ97qTDY5GvRSW3dbr3s+cIPwrIO0LwNlasu/OWvKiySYVt5H8tgtOiosP
	ODA5Bq4DoAZyUUavzbeXw8zyLiFfW7/vgHNkrTHN/rW9V6AOrOYZWn5Ejuzd7e/A/jUExQMIya/
	E9yW0RZJcLret/wsBqG+/SHInAdKFEhgvGpSPIBqn5a83cgWjK2qrP+Qj2M6H/arwrj7fS3GDWu
	4z9SNXfUHrnD2F6COezeL3bFpGHFpKQT8GcL6GXRLYjYNNr9zsHeabD8L859jABBJmKwTs4OrzP
	FNZdKD0MVoBThJ59ygZxxRdcx/lJ3KJknrDrRXB75xgI41j7Xqk+JXFRNmYtt20ZYBT9RyWgN6l
	DEQjPAeyN4F7ACcWjSxyLxA7clsWAeq1oRGGuXqOC5DMkwx1us1i9Vo7vZRmNTpgHSNcT3zhg7r
	4lPuz4c4lYgjHpb3tD8BDEUm304w==
X-Google-Smtp-Source: AGHT+IHFjnlCF8pTEQfGb9W1ffV5gzSschOlhEKfZUTAdGXo3QGSdTLZRenFmR/o3QVDEWnVyv6rKw==
X-Received: by 2002:a5d:5f54:0:b0:42f:bb9b:9a82 with SMTP id ffacd0b85a97d-432c37746d9mr14189554f8f.60.1768023456178;
        Fri, 09 Jan 2026 21:37:36 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm25973825f8f.3.2026.01.09.21.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:37:35 -0800 (PST)
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
Subject: [PATCH v3 1/3] media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
Date: Sat, 10 Jan 2026 05:37:25 +0000
Message-ID: <20260110053727.2295260-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110053727.2295260-1-christianshewitt@gmail.com>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_213738_889440_84369D4B 
X-CRM114-Status: GOOD (  11.89  )
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
2.43.0


