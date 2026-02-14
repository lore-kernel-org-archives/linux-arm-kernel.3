Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582C3EF99F1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 02:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpkCPnIPCeuJ8T3n0TK0PZKz3qkGjDrlXnOs3V5iLkA=; b=1lU1FBW1AXnVQtxvOVgbd7sEte
	NvP7YqfW5BpaPcS/moT0U4hWu8eouQWdu18BLjsWzJS4rH1GhVcIeYmVCw8Q203ZzgPonDfGUCOxf
	e5/SpLjfHYLDrD/B5YF9ffsC+soiSjVX9e778mJk0EE8LbgRjGkWnKxoDU2b4G/w+LKxy/pRk7ADU
	R+uWLSR7fV53oyeBYMBZoFqvDwwlw2tMxUHFcZsrphiMslWp9vllEZu5032VU4SVY+B4E6/vEJhkB
	eaudUOpVDAqzhRobQCP8QJd/RzfG9AnZDUJID9jI4zKmoqc7Y66zeVSlQn6SyQONMPgW3B1XopLvW
	9NifSECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5EI-000000049ZH-2e45;
	Sat, 14 Feb 2026 02:17:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5EG-000000049Wt-0RTx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 02:17:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso9027915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 18:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771035470; x=1771640270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpkCPnIPCeuJ8T3n0TK0PZKz3qkGjDrlXnOs3V5iLkA=;
        b=GL7Wp8FSKfx0EIB6LOMbOFE8qiO1U8dPSYHD2nkcc+Q9YhBLNxueIUxouRigDMjMA8
         duoR3Imkp+3Yz3xrceBWBLyIQYrZFTj9alYCKPOgffgQJKo41PaFV3IIfYL3wLvF7md2
         fWN6UeBC8XIpO0ALBzHomIMa5UP3kqVJo1keRa7/yfBiErg9b4uNL1y0lDeV6PA1T6zp
         1vVBFH5eCtiWQ+YK1PuvZSbEzD5UZ6Ajgg0ZIIngf24P6qPNsjpaOx7fFaaSLfzC/gO/
         S89BJQoSGohaYN0GvY0+akLtqHl95WMzOD5p3c1G1s6o+4s0YrvCrXF2nEzF6nLeH5Dz
         hL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771035470; x=1771640270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hpkCPnIPCeuJ8T3n0TK0PZKz3qkGjDrlXnOs3V5iLkA=;
        b=X5YUd+sMyiLYIDakdX+S3BVmTjO4ujQiAVyG7F5YK+v0/79biNRcc6gODbfGt5tjux
         fq5NSRYg8TmkFCv9wXf+m00iNXeUk2lx2HpFXlnqez/3u+8OiCNxCQZDKb9EBSkyO9O4
         7CwKv2Rg8ve8Zbeo6nq4HIQKyrX34vcX5P9vgLyIlhVpaRU2NrCOqVcC2+NhXX8d14Oj
         +CbNy903xrM4U1EOkMjSvdYM6sox+kjb0MYCVox89eAh8fihl8XOJ2w0FonYP9RAm9+J
         smu2/lT0aL5/ymLVlVaxthIJ4tQSKnP/T1ua5aHTvEW3M3WyMsIm+dFNyp9AI2SZnPvP
         cWSg==
X-Forwarded-Encrypted: i=1; AJvYcCXCBAbpVwimSrYkCUnlx7YXu8dmv4a8KfIOW74J2uMMyGDKtNI6uexqBORU4pJ044L0y4JJPHfcNzhllzkMQH8R@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0im4eTPnzShXG/odRtLnVs1j2f3vJCfJBd1daMlTdN8oSPNVJ
	nfZR9zwoqPTd4lxyXzXz2s3O0dVYycFfZp72Wyv4yS6cNZySAeeQttCK
X-Gm-Gg: AZuq6aK1swRsysnYA0eA/nwFpa8ko1s/995QyYClPisrbwa4Kdc0Mkyxy8NrbPfgSyJ
	sf0Cr72MwWmnkxFnlY/+gdfpWFtoQoUQKQqjVxEgchiCFnY/fJ6jAGXeRie+YWvCE15SBvay9Z7
	RLeAzWq8onbJMeVxQ06T+NZwZLrAS7D+zHVy1cxCZaqzbT2bmz9Tro3BWmcjK7A2s1RTskoVaau
	MLBDhmQ8y4CC/Tq7a4YMXA9/P7ueh2TbMBwsclPRgAPA0aSZRVU7qsIIA1Z6bR81ieP2bXmefl6
	AIOJBJVUoaDg8ZA9YqRvrI+OC7QYt9aNJoPQ13gFmK+Oda3YTrBeCWWhUWDVmc2LNx606jpUfOm
	O08ztYVSHxfgFdN0GaxICSKhmxsEXEglt5pNB/Fhl9lJApjNl/TqxdR6WEIsPDQfEFKE3CQqBbw
	Ish/Nh/J4DgYZf0MLyoO9O
X-Received: by 2002:a05:600c:5251:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-48378da3e01mr31119965e9.14.1771035470027;
        Fri, 13 Feb 2026 18:17:50 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a53:6b71::1002])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm8608308f8f.37.2026.02.13.18.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 18:17:49 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	jonas@kwiboo.se,
	Jun Yan <jerrysteve1101@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add OneThing Edge Cube series
Date: Sat, 14 Feb 2026 10:17:15 +0800
Message-ID: <20260214021719.620752-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260214021719.620752-1-jerrysteve1101@gmail.com>
References: <20260214021719.620752-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_181752_163626_1CA0B910 
X-CRM114-Status: UNSURE (   8.73  )
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

Add devicetree binding for the OneThing OEC and OEC-turbo

The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
eMMC storage, and supports one SATA interface, one Gigabit Ethernet
port, and one USB 3.0 port.
Among the lineup, the standard OEC model comes with 2GB of RAM, while
the OEC-turbo features 4GB of RAM; The rest of the specifications are
identical.

The OneThing Edge Cube series (shipping with the vendor firmware) is
originally designed as a PCDN (P2P Content Delivery Network) device.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..292fa0bbec93 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,11 @@ properties:
           - const: openailab,eaidk-610
           - const: rockchip,rk3399
 
+      - description: OneThing Edge Cube series
+        items:
+          - const: onething,edge-cube
+          - const: rockchip,rk3566
+
       - description: Xunlong Orange Pi RK3399 board
         items:
           - const: xunlong,rk3399-orangepi
-- 
2.53.0


