Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C4FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ZgY2Y5BzkIraCasJSMFe50CTMRyvNR5i+L9TZ55dRQ=; b=gg7g28PpM/g+fznEKpOGaLZK+3
	g3jttPnUAUFJ45TdmSsS8QaBe3js6+kaNRmAJ9EzbR3Pc/+VlE3w71VtgCkjUFilZU2G9ejopit0q
	1EUvQG+Myy/mfW3eKT9YHB8Jye7jcMY/jHLU637JiS26TmW852TiC4Ct0HcPwhrK3GwrCrntQETBY
	MhiShFUEPUUV5//XpzKwxhqtqPeuGW+AhcHJolMCHyoxmgJdRqzUQCVFtJ/zrLW8Pvh3FAwaSj3D/
	ObO9La8oSiiAmwdJxht2K/9oXxbueZGx//N4CLaTesYsuDjsD8Jvy/a+hF09wrUGT2ZesE3xKyDRk
	32qz93Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqHS-00000003THN-120M;
	Sat, 08 Nov 2025 21:15:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqHP-00000003TGi-2PGc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:15:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b3e9d633b78so327976166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 13:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762636526; x=1763241326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZgY2Y5BzkIraCasJSMFe50CTMRyvNR5i+L9TZ55dRQ=;
        b=QNc4JCEBmScy9HCepcpwRykw/HOnW7vvIbi1/UU28wuPilOElFHNeImJgfhpC6pIVY
         RF5xg/NfhAm+Bx5AJqc1sP8TlCUeTCblCo5rLM2GdZ4WRumYIc7wZOq2H1EUecVHTQjb
         MIORYZ33TupcNAd+JucIR/qROm6TD3E/xzM1asKkg0ExjszbaW9vIH3kdLpf8ER1VrDf
         kSgKz02sC0LKepwUPIuiq/V0fPeH9S20a60qnlpL2BY+Y9goVyt3+x+JLXK6Vind1kTe
         GXLFiKdQGwGZgARTenPrxO34+gGkzCGp+IbJWJ9ITynRnkfcfLyFzKtDuetXawB/rPSt
         5KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762636526; x=1763241326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZgY2Y5BzkIraCasJSMFe50CTMRyvNR5i+L9TZ55dRQ=;
        b=kMn23pmtPTETjW0Lkn3BG0DcTxcT8QPTl8sSm2HkQMf//IRhyE+4bM50JgvYlTq6Q8
         E67JFjfw3R7eZvsIq8rNNV2PEAUVTfmOUeFmqXUpNvuYlp7JBJm64p1WCI70hGco6z9i
         yIRE3pAbvifTeoVzs6xcDof5Fqz7n2z8BPklVaa0mHh7WL7Qi2K0jcynIT7BgMn/wyPT
         vTJF2q8cpOqXvGFKiaVW4ldiyB04dJQzSh+dKg4eN8eOhOKTrfqi4jpD7EdXAoLdqse2
         7DlBj/QDq2EVyfv5ZRkbDLRyOBuR0IbPmQ7tWsLt/YoVhHNR+UqFcsTQgj6RovwYciV6
         hJEA==
X-Gm-Message-State: AOJu0YwvnjnpkA0G0FEgYVrJCP/IQDTc+cm5nkajA+bIHMelxGGWC7nw
	6BdNducyRuX9UoCuJ9uxVSbu8ykiUrNOSVpsV1WxzalYim966oSWEF9D
X-Gm-Gg: ASbGncuwdva/xdRZ6uf38W9iwv4sJ50umnhqvgur8Jlxflopw3Epq8g4CuAEK60mTpL
	FW1gu8P2FzGC6jqwSoorXh8PzdACd71tcExF0aYN//gw+umuYda0anP3HnsrFyTqe0dkqyEtzVQ
	V7jze0QMZs46tw7wA75E0Q/jgpllY8LVthutqvOf7jIVnpod8NmPy7mk6V/DKKAHwdmmbhYvnzD
	lbfEIxT0TqY48N69QmsjDgRa3rt3Do/9PCmYpg+3qR9Rj1buw60s1SlBANQebuVCu6YaQmun+mA
	UWraRHUR62o4kr06XbB3H7CYkZ+tQByVnyOmsEaWWUukS+3pSW2tbHf9C9VeWPQjNnXyIFBHQ3w
	AJ1mG8n+0KhsQnzPZWWYgPSv2ZkT5Ax5hneg44CQUIpafsckXwv/0Y01x6MvpYCLEFfIVTiMQJR
	9b6fNpcalX89vrF/OosNAEilOERViIt00CdYuWtS/4ZIUExzi/3RuoCvvfgEc5PA9dTuznwc80T
	rat+YRI4wX6c8bw0nwyTM5FW9AmrzAKRlb/Lci0bu4=
X-Google-Smtp-Source: AGHT+IFDQ1XE4DMnxHGoDNAOKOn2R9RCApPoGixxW18C4L6aTC8U7/yf3/RbX4oWw9F4XY3sUBF55g==
X-Received: by 2002:a17:907:728f:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b72df9055camr438123966b.4.1762636525488;
        Sat, 08 Nov 2025 13:15:25 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b72bf407a01sm625110666b.22.2025.11.08.13.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 13:15:23 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1] ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal
Date: Sat,  8 Nov 2025 22:15:03 +0100
Message-ID: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_131527_621335_A4D8AAE7 
X-CRM114-Status: GOOD (  11.41  )
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

Commit 85b21fdec906e ("thermal/drivers/generic-adc: Register thermal
zones as hwmon sensors") made "generic-adc-thermal" also register hwmon
attributes. That means we now have the temperature sensor shown twice:
- once from iio-hwmon
- and another time from generic-adc-thermal

We need the latter for SoC temperature control, so simply drop the
former so userspace doesn't see duplicate sensors. Also
generic-adc-thermal provides a better name to userspace
("soc_thermal-virtual-0") than iio_hwmon.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
index 28ec2c821cdc..6792377b2841 100644
--- a/arch/arm/boot/dts/amlogic/meson.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson.dtsi
@@ -12,11 +12,6 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&saradc 8>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.51.2


