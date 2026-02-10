Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EBDEA8123
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GNCXerJx3sFfDg6KS7EVW/a5lfhIGse5nvrVk7F3w1A=; b=03XOxrrhBcgM99SMiRPdb+UUZn
	VV4nL0cLSUHYnt1VDF0KlpjyXMs8TWijh/ZCq97orcUX0JwyqtJ8IbtkMAtXP3mtFKE0FSUnze3Sy
	e/rq2pt1Cbk3ADOv6O86w0XMeiV2Ob2yIyNJ1msRQ3glo16NU1bSHPNqv3X04gfXwH5G1FArGIwqs
	bTHo/nBWo+UTxcVYO0lmEQZIVe9TvYY6IJ8dkXm6FIKFFH1piSh+az48DYkrI0ta8l4Ks128E1EZT
	y/1zQKwcoYmToWbL/l0RdLp7zR8jJTGdBbgMz6m+m0VQ0JXaN0bX6+ZR6NrpzG5Z4olDPIYTI792U
	ZilxYs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp3B-0000000H3y6-3bYb;
	Tue, 10 Feb 2026 14:49:13 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp3A-0000000H3xA-0KVV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:49:13 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-64ad79df972so3075499d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 06:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770734950; x=1771339750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNCXerJx3sFfDg6KS7EVW/a5lfhIGse5nvrVk7F3w1A=;
        b=Mf9TuYXYEUSflGa3XUwqBvX4W6DO9440fwYc2/QSF57g+Q8E6tal7BnZUerIsYNKmV
         rsqrSB8xyHJzDgbVWejJnGjoX+yYKiuPDw5WU26kMbs7JYctak6ifzdDx1kp2/Vbh9HE
         OCAY2X1QP6zw0ise1vwmZ92xRXYntFv0hIf2RqzzERI3uFmt4DXF0y6Tt7RXn5oAKq+B
         54APq/SRrYFfP179cvJUosEuMJEPEciFP9hGrOEqwIEB+mOaWaTY9YijLpeYeK9GB8aF
         j9kjGeix/G9h8CvnM/YxwzfvIMgsigtfPYnJS08zhffNE6HKpfhdQiFXXEsN1bs2cCvN
         zGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734950; x=1771339750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNCXerJx3sFfDg6KS7EVW/a5lfhIGse5nvrVk7F3w1A=;
        b=vrfzWOB0y4O3IotlGV9uACWuSogT+8pXDY0rnbexxEgS/E/IwBeRKfx7r/HKfY/aOR
         csanOkHOEKmGevrroLd9KmyirXPp6gsJx1CquwnX8F54v5kvFdj5+rutfhELfKY2NF8A
         rxdg8CPYsttMDBrJhf2U4tHDB1/Kr/l5PjhBxewzzD77Y1m/RzxjZ1wTuDI9JCqMy/aZ
         pH5dbwvboKsKvX0swisJzgdaTGEyFitPfHiNtMgSKJ2dI0Dhw+hrR+NC2z2047ppgf8f
         gm+9bsgmeC9q3JQKwgnvvWAfdaeiBiHf4zObGSYZALgBSCp5+oL3zKpuDTf/fIWaYpAU
         oSUA==
X-Forwarded-Encrypted: i=1; AJvYcCUpjZv/C1+DTjLA0jVYikY4aw6qXxqDsyoD/8A4JbwSJJbg01AP2fL8MrFD8kS/jbnomrlmZXpe4oSTn7KJpFuu@lists.infradead.org
X-Gm-Message-State: AOJu0YyL4mARtkmAWE31ueufov2jvNHgZqAoYbE/KOJzug09CNE/M+5K
	Nikmr9jYMMulKS7eqQ9TOl9UAhnFRtU6ZpJ5g82Z38kTqXs5KWMw6pZB
X-Gm-Gg: AZuq6aLCL0/DFy30Rm6d61nbBz+5Jd1Frv0JNWfAemK+HWV6SAp3rttFKXzY4syafP/
	fFOXEsXA4I8LQVxJV9p1ZTumKXn7w+HGPwGvvxukILR9BcMCInL6gX/E54UboB/arNPtSxcBaVK
	5m5Pp7iKzFrQdwd5JNP3u+9qcWUOLaPVDZBuueGmdCF8LRKOBd/fEp9jyH+/p/Dee2YIF8LGA1e
	0KWg0SAgGMngPVBKgRezAeVah78wfOAvyINd0pk2yM6NkRg/H5e2Xupu9vFgoeV9bU7OOc1tM4o
	bWJjra0d8KV66XJtw1l4mlIHiD6RToz1MWwubpqnqaMeIuG3WG98KMOvO/BuGItS3j+2+OIqUhG
	PAHnTO6jHakfjUGVXBTtTTy5bgXLgAo8jTR7ewpI0cW9OIU75o6b9zdkaq1zgyhLAILAR3EO535
	jaG3jE16Wrsh9ROtqlQz6zxG4JdYcp1qGMXDurvcwguPv3wMg=
X-Received: by 2002:a05:690e:124a:b0:649:f09d:a6e3 with SMTP id 956f58d0204a3-649f1e5286bmr10865997d50.19.1770734950183;
        Tue, 10 Feb 2026 06:49:10 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7e95:428c:8802:872e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64acd247ee5sm12086263d50.6.2026.02.10.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:49:09 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Tue, 10 Feb 2026 11:48:42 -0300
Message-Id: <20260210144845.317048-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_064912_144946_3D34BD1C 
X-CRM114-Status: UNSURE (   9.18  )
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
Changes since v2:
- Used a more specific compatible name: rockchip,rv1103b-pmu-grf

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


