Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DBEE77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=; b=bmReHx2GonMWQ8FVkGXeopAGT9
	Oak1j4k3drfyB9sj4sfpuPM8Bnmf2N/k8obStPHkfzzPuSzsMaKSIzjwCCk10hohbwz9OQbjl1oY5
	d9geobsg5u8T2eCIROvBrxDJ+VcWrgge/B0L/oNB3UrFHfMzZCRfdFwxB49uNt0i90Ph6JrRyZMl4
	nsLxBiXJs5Zob4uYbreHevQt7UTSrg1BYoD+a+LhnVEpGOygUC6JCGQA0s4KcqLJb3fYgmEMbNXah
	j0t501WUQZaggf7JPX0zvuOo22bHHEUat0dIuqKhPIEGxADudJkTQMeNcfzf5nG7nFe6VppjYvSXL
	EB4GnDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZ8d-0000000HTGy-3U2W;
	Sun, 05 Jan 2025 22:30:27 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZ5A-0000000HSxH-02Ms;
	Sun, 05 Jan 2025 22:26:53 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71e1b1767b3so7473028a34.3;
        Sun, 05 Jan 2025 14:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736116011; x=1736720811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=l6097IHn91i8LVraZgN/PbMfISt8RU6I3oeznhBWBR/EDJOzlQDUPuBuhKw4/4SX5i
         5taJOQIrylRibYXR+Zd+v70aOugk7qbCSgehPrBHCO+o+6I1CVoRVzI3uBJDsu9xMxYb
         WVDtDRZDmG+vS7k7THFk5H+ZFqBuilj6VlLo9EdYVI8KoUk+5SKNqJmwXmUTPfZyuvYa
         XyvQpUiB2c9Q2ovR7+tQolUYlzlwb1PRS4mKiHd9Waf2/Np0GeNd4k36XS1P3iy6xmSw
         7M4bllLxgRdhngbaqFYaMQoxctI1ndz7Ghuh6wO2u7M6ebfAbkQ31NUVG4waGfhUNGBt
         jiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736116011; x=1736720811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=nu5BD7okZVge3nHGM9IDHkJa/SWc91XtZiyXK5uCdepbjDQSmwMC1XgXkz5tjnwsW5
         XE5HeIA9IIgq6RRQPqekGhPKM9inHNJ0GIkxbTaGHJzUtnJQPEzIE16/E/sjga7tq61I
         R/JLO8d1TNIcQETsLDO40sHqqJ848uMS31gc3moHppM4pxfJXFLPrC8AqB/UWOQCvk2V
         +q7xNqO4ML6yptH2lRIetd21bdwQGgCFyLUBsXcAsgCtVexZyGqOQmXKJNn8KZIAB1e6
         R8VnxdiYn75x2H4wDCisaEnmPE/E0CpKquxOFT4ptmVFLLA3EPUXlZVEZJtSmNAqkA/v
         BZeg==
X-Forwarded-Encrypted: i=1; AJvYcCWjqzqgiptEjU/mff4Vh/GuORJLOCmkhq5iZiEPqM8JfEr00ilVjRbcl1ocF8N7/q57H8YD9sd8W56/7bNWrfo=@lists.infradead.org, AJvYcCXSI/dj9rZYFeK0yYHK2Jl9mmMRZyt0iqTVnga7xeGzNe48AzwYH0Mom7LlgT1nH5Wcw/SnwtN2j5H5LlMKnssV@lists.infradead.org
X-Gm-Message-State: AOJu0Yydju+PkSgZBjWazlsrQO/m5A1Cy3stZUDWhCAvfO0ux7Z6zspE
	6LfVlbEbG+E3X675fTlzEKyOyuneRxFg1zJPSiZJwtEP4Yd6nKXb
X-Gm-Gg: ASbGncuQ6GNQ7KnKK9iN79w4mdi4iEfUBli8Tx2YZ+saEOijOLyT5k/sxrlBxGJ6Vou
	/xY6TzG87clYII+tGFceS2QUiOEhmHBkYntRq3N4jSg2XvRqAfh2dCuUIT0N6+GULZao9OvWuR8
	NyfmSARy5uDr9vxHXq4rVe87VCnKYddSIW2niUhePVi+y1/O4A7aujM5KtJsZYlQu9oKynR3rTv
	JaoTtuniEIpY3RuzO1ruUgtjPqkzGazZIARa+MiTUh5f81kWPBuHA77nrd7TX4XrA==
X-Google-Smtp-Source: AGHT+IGRCrhiq0dHp3DK/7CzhcGH01DOb1UH8Ca8QvgkX+Al9ucnxcacMAvFntA0Hxco9Zey04paHw==
X-Received: by 2002:a05:6830:374a:b0:71d:eee3:fd26 with SMTP id 46e09a7af769-720ff685707mr36138120a34.4.1736116011013;
        Sun, 05 Jan 2025 14:26:51 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b377:72ce:54b5:bddf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc980a9e8sm9555227a34.43.2025.01.05.14.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 14:26:50 -0800 (PST)
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
Subject: [PATCH v7 2/4] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
Date: Sun,  5 Jan 2025 16:26:11 -0600
Message-ID: <20250105222614.2359-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105222614.2359-1-honyuenkwun@gmail.com>
References: <20250105222614.2359-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_142652_054348_F7BCD738 
X-CRM114-Status: UNSURE (   9.01  )
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


