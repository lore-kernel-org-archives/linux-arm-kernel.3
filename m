Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853B3D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87iMqAHh40Qple/XwU47TttqQDjC/RR+nzYkh3Aaq+Q=; b=DUIstKt6ObGpW96jKpawZ8NnLP
	4BReQDLSOFIogB1BPn/I6hpvDYKX+8JmCPOItsL5AjCYQgA0teACa9np1+L/C2BuPAWvlHqLhIFKw
	ZjbP1YRhzaBZGctFi6L2rBXthFwzevg8cz+k5h1c7mBmPoZKPgSkPY6XAsty+SThfIY4HpFkQDyfm
	dJWZXJZ0LQ6ACYFL5kEMj6rKa26RJ35K+ybixMNl1LkrpFlNmkAjHye8Wixk2Pblfrup3dZVI1sDj
	XCd+2AfoS4HZ4xeIFfH4KF+MBlNdE9nVPOZ3XGjh3ibbSXSBBWO/tlLcoJrdrE450dX7Wt4V5Yl4N
	mv6LpFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwh-00000002kRe-3G7E;
	Sat, 31 Jan 2026 15:31:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwZ-00000002kLb-3AF8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:31:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-81f4e36512aso2940390b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769873487; x=1770478287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87iMqAHh40Qple/XwU47TttqQDjC/RR+nzYkh3Aaq+Q=;
        b=bZwPKXob4NTJY/2CzpUkUGXMXAvBFyrwVnSzD62eZ96H9e1LEl7sgf7k5jXP1HH4Wp
         m0o2hDsrToiNfyF0qhd4SUs1JUOd7sTf87F07NzhVaS0jEl2rKIXKGnP4wgP1Lj1D94v
         VnxmkVl6J6IxTS9Xrhv8LNopVPwNUuMqs95VpSkuoDLF19ECjRXSGi0JZqpBcYesY2+B
         mBbz1YQfPo/M09E2C/bljrRCxhxUwguw5+2sEgcjtaKaOOwy4/zoY/H/E0B1T/f/ZVNm
         kVd3SdKnz2LKmV1SUbNCO1/IQOAf1a3sP1isf90Jtut/ZDZmIaraT8MlMLNpfAYU8iMz
         MsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769873487; x=1770478287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=87iMqAHh40Qple/XwU47TttqQDjC/RR+nzYkh3Aaq+Q=;
        b=jtszMATczWEiQ2CbSRXBYsGLv6yc2Td9KLx520fNaPonUJ7549LUny5zg+D8uWCyb5
         dAHhoc+NN0W+46cvRru5hnf9jAzRWL83KFLtx+QflRC6RO6tNUazlF6+RzoRP9bQ59Im
         DoudKhD54iwXFC+kzJ15qyN1nLeMSsMWCqyi3GYUHAkwn1OPRj/JwKCLR/N5wJXWAZbI
         NPI8l52gOZgDmNP/o/VX91rTNZXoNThS80u3w5drz/dInUSEGzywrNU5pIjI0Gq6dniI
         J+F8oixL+f2b4nCVWrSzzXrAVyjJ7m1Xr1Qv11KFi5Swo6Jizzn6icbGWMgxzt66jb1S
         UXNg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cu4Wo1UYBRJGddYPXteo74yxh/pnkCs8zAzeYvVctjCaPhHWI6Oh8mV8hEyIDtqJ44xA6TkJtTPyEMtXN0Lt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyp4Y+Uk0Xtp//giWqF3aZhf2YSVG2U3nLLPr9dRpsuxLewbpv
	dNOpBij8CKfOca6NePBb+bfdSc4Q47dhLccEA3DEqRKwLwcGvWxH43YT
X-Gm-Gg: AZuq6aL5cbwj5KotunNyTajgj+D3+DDH/ojrmzDYvsdJflLU5OKgv/sHd4A0HmmzJv+
	IQjSgSDl/DnpFReOOd1nxH06bgL113pj23tAkrap9XqXO20frUzSuCo3cg/OalrmUbyVEaXtMtG
	fikfKubF3VHrxrywVcxkjyeiR8sQfeoKA7AYGzQqipZH40bJf8sqEHWeM4ex1vGaFsXhwboazkA
	sc7C8ex5zizNSZzhPT7ieplpE0eFT03rYv6Cm6/4ay7sOx93za7BR9Qq6rERh3JMUQEKotRTDJs
	PiOKyM4RXmFZkwjiHL5uU+Be+eofXWnUCgGKbxjUcaB29xy0zPEGl6HJyIcJo77vRSLght6b6dy
	I1/hU0TcNrZj/nqYn4kTORtxUqF7T0Qz/gs6ZDNcBpNvKrT0yrQCO1MQvX2j0lx5Mh7C00Uqf1h
	IaPcDLURjDixz4W7bmfD4O6amWYcillZ+gh3YdgBIOazklKmDp
X-Received: by 2002:a05:6a21:e94:b0:35d:8881:e6c9 with SMTP id adf61e73a8af0-392e004eb87mr6088322637.23.1769873486686;
        Sat, 31 Jan 2026 07:31:26 -0800 (PST)
Received: from arch.localdomain (awork135098.netvigator.com. [219.76.135.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642487f1f5sm10701122a12.0.2026.01.31.07.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:31:26 -0800 (PST)
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
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add OneThing Edge Cube series
Date: Sat, 31 Jan 2026 23:31:02 +0800
Message-ID: <20260131153106.31723-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131153106.31723-1-jerrysteve1101@gmail.com>
References: <20260131153106.31723-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_073128_381998_39E7282B 
X-CRM114-Status: UNSURE (   8.76  )
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
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..eeafe40e0f23 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,12 @@ properties:
           - const: openailab,eaidk-610
           - const: rockchip,rk3399
 
+      - description: OneThing Edge Cube series
+        items:
+          - const: onething,oec
+          - const: onething,oec-turbo
+          - const: rockchip,rk3566
+
       - description: Xunlong Orange Pi RK3399 board
         items:
           - const: xunlong,rk3399-orangepi
-- 
2.52.0


