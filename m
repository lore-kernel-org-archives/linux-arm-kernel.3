Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF564D3ABEA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eckdRA2Gz50Pl0iUsR156tV+5lFkIuN6FgaOkhY4G4M=; b=knh6J2GUjs7eXEan9SfzWg37kQ
	VueVOuSWVSPnmSkJQBIFJxeiu7yQ/uwyFAgvJnzZtsoVQl3lA9KxUhpHKkHQg1RngC7oHdjtoLiDb
	/J960RqJHxiaX2DD7o+qdkykzh9A0ouqFAxEUbewHOF6XzMSgFpbYYDkGsOJGEPU+M8qDpOKKmxik
	GqtOnu3NZp6LrSDi2MG8hRFsg1tgWgJVN/NsUX+sVODJ9jVUTkqhsnm7gBlC8O0XFDiSXm8GUoVVt
	0INAsJ+aeAIFMSYiCG3ZAHdzlPOjMr0olQDZ/mhi+Ff0/9R121Ng8qZSG0P5zPOYxmO2eGTaO8pdZ
	WwQW8b/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ5F-00000000trK-2RyP;
	Mon, 11 Nov 2024 18:24:17 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYzO-00000000spb-1Mel;
	Mon, 11 Nov 2024 18:18:16 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a850270e2so889695066b.0;
        Mon, 11 Nov 2024 10:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349092; x=1731953892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eckdRA2Gz50Pl0iUsR156tV+5lFkIuN6FgaOkhY4G4M=;
        b=SNFnki+U09yKPPo5cuVTpdDJbk14WCALYeCGYK8iXvKLvaY0d7TXf56VKjyvFylpZe
         2RBDn9WNr5vjalBLbPViRXSOKUJZf7pZeAeYfR428TXvSAE74pkaQTxsevKdRankFQwD
         ktBfRTZfZ7CqJsE1lp8/nybHI1s4huO49CRp5T6pDYRTBPyhRKbIsCelbxRNMFZMyVYb
         KH5rxODf0rMQ0ZADEcoTKmV4yPvHLG1PwElPf/WL68tsRqQ012M5QqJxyxVg2CMfWVRo
         dMyfZvPWeOlPeMBzfq3ir/EnqVk9g3nWTb5vicshcmYAAQSaYvYWU4jGwiaaU27mYx4y
         8e9A==
X-Forwarded-Encrypted: i=1; AJvYcCVlG1eHELtkNgxVahHlCvveBY/ju5afCYJEPFxeAxHid0T5ffQUgHXjPH3RRsO1f8BkxxrPzGHLfL8BdEcJkww=@lists.infradead.org, AJvYcCVpI16jVHivpbus0dJXskbGqOWUPShRD6UycrpaWYzZRqdlijW4i1qLQQyezmgKN9ZXFHldPNgWKugSurAws+1L@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtg4pxmDY4O6lMv0Jt62/bN87YUaaOqOADL2q3bCrfIpO8qOF3
	kw+w0R1HfbHSKheA0ktP1YCPKwymIwOHm912YHrM+3mbdpYt2oiu
X-Google-Smtp-Source: AGHT+IHD9WSUDwH4PlIGM00maH6QB8VOUn1a7QCnR3fLMSi0p8bYg2PXCsAsVliSK0qebYRlecvEmA==
X-Received: by 2002:a17:907:84a:b0:a99:e1a1:473f with SMTP id a640c23a62f3a-a9ef001914fmr1369234166b.57.1731349091955;
        Mon, 11 Nov 2024 10:18:11 -0800 (PST)
Received: from localhost.localdomain ([193.142.191.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17b64sm617868466b.39.2024.11.11.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:18:11 -0800 (PST)
From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: rockchip: Add supported UHS-I rates to sdmmc0 on rock-3b
Date: Mon, 11 Nov 2024 19:17:25 +0100
Message-ID: <20241111181807.13211-2-tszucs@linux.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111181807.13211-1-tszucs@linux.com>
References: <20241111181807.13211-1-tszucs@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101814_400763_4982E34D 
X-CRM114-Status: GOOD (  10.12  )
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

Add all supported UHS-I rates to sdmmc0 and allow 200 MHz maximum clock to
benefit modern SD cards.

Signed-off-by: Tamás Szűcs <tszucs@linux.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfaa79..242af5337cdf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -670,8 +670,14 @@ &sdmmc0 {
 	bus-width = <4>;
 	cap-sd-highspeed;
 	disable-wp;
+	max-frequency = <200000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	sd-uhs-ddr50;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
 	status = "okay";
-- 
2.45.2


