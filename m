Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC673D75BA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Moeko09cNn/tBMWxRyaAP4nMoxzoQVrPZMKwS5ag9u4=; b=NqMQ/rehuwlIOPl3/TtJw7csyZ
	tekoAoOXrVocw8oFhheXtFanelt3Ks0uOZslU8dBQ5I2aRZ55dPdAZwqHJfVq+Bc8WOMaakUD/Vi5
	bQ5PDaCfOsmYVqC+zCcWTrPmENaP3reDZ703GYmwNTudSR78jbq8b9Y9MqDsb7o6N5dzPne5dweVh
	JxkCZ7bgYpznVFCLUYlppL5QR4zby3Ld+mZuAkSC5vX8/E2QubsBLNNmC6TziG8rp2tAuNCJ6ur+A
	y0zFNlu4uPQbxdP/qEf3vTOjijqHHi7pn+naiaA8trSwPNRZ5VUWwZXfs5KgVLe1/xhPpZpDVf16W
	/yUema3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxOZ-0000000Gdww-0cJV;
	Thu, 21 Nov 2024 02:58:15 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxK9-0000000GdBP-3Z6g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:42 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ee9d50efaaso3811547b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157621; x=1732762421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Moeko09cNn/tBMWxRyaAP4nMoxzoQVrPZMKwS5ag9u4=;
        b=D0i+jbF4pf5SBnyxQamY6WKVzcSZTE3UHwBrQkZhUoAvRNXyjU7E3LPboFmPxcR1zb
         ws0Rwn/YOJGHGzaxiVy1UpSwGMZBsr9WT71lq4li3EgAQrnMVbwyrFhtXCXAfO+vBey9
         L6fy8pGrWyUMuQP33S/neoAAxK3hFQ0n3zpcIJFramq7mbQdAsLeqZqwSWlUMqrC6+tV
         HJt0uIR8WcdWi0T4C4rGdx38EgdKlc9O0gEt8yHY2KPvORUn64UO4SOO/L9olcchueYQ
         vd655gMEjwTukeF1CngIXCP0821/aT0rtNQf3pZEhv3vNFJWl9SMVq3kqYjGx6CzNE5i
         0IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157621; x=1732762421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Moeko09cNn/tBMWxRyaAP4nMoxzoQVrPZMKwS5ag9u4=;
        b=cM1BFh1SRA3gPxeiZdshCtnOjznLuKEeb5OiHT52q8dWfPprEDB8w2f3AOul/HDNaQ
         hPCV6n3nQmoOEZrw27tkfptR8DmOc9dVOl78DXgmV40epZS4Ps9o46lHtuw9dru/9Y9C
         a07jDITZcgZ7krPEDvmCs0bij8SmMK+XSlLsHRNdqJKcreJZsMJavWq/K5b5/9r1TfAB
         SGmzOwcJiQGlGq16EdYscANOmoyXC4t4nFI9N2Lqjj/ZGxQ5U2cnvvb8htdiOB8NWNhb
         u1K046GKglr1SGNF0CtIZSerszUUKvRM5pvYPHjFPyGppj2xzMNO7fVhqu4WIEN8abFX
         Uy7A==
X-Forwarded-Encrypted: i=1; AJvYcCWze3klxyIcOcW2Q/g1qExOHPMgz2aYNyRI3r/bepfDBb6lMKaqmhU8hU8JnFx42GCAVjnpP6373YsTOfI4dkjY@lists.infradead.org
X-Gm-Message-State: AOJu0YxExEGH4il7aDMBV1+IUnO9AWS2rfqWat41tz5hBDPtSEioTo4Q
	V0vOkNeQdJHfkZxxSEdXV41SKrKKhZw3YuE7V30z+hvQ5Qshz424
X-Google-Smtp-Source: AGHT+IHfi9U3ChAkSgcxwjTETaNCq22J6zc0QHGyI9uwWq7ryknGbpWpSp8Z2Ihu5uyhiDydYDfSfg==
X-Received: by 2002:a05:690c:4b11:b0:6ee:b43b:62fd with SMTP id 00721157ae682-6eebd2d1a9amr60919277b3.41.1732157620851;
        Wed, 20 Nov 2024 18:53:40 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:40 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] ARM: dts: aspeed: Harma: add e1s power monitor
Date: Thu, 21 Nov 2024 10:53:21 +0800
Message-Id: <20241121025323.1403409-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185341_888139_E68A5A3C 
X-CRM114-Status: GOOD (  10.21  )
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

Add E1S power monitor device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ce1731bdc1af..9d7e7208562b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -354,11 +354,22 @@ imux22: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
+
 		};
 		imux23: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
 		};
 	};
 };
-- 
2.25.1


