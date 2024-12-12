Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B492E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wf0lUEIsGTnJndimnrt/UOqCv8R701BigsdRuKPieQY=; b=2vpIUpQv4Ae6NgdlaADqjeN2e7
	qcE2AFclqICp4cirJXVTH8XcwGMp8WCMzKj5a8340lITkSHbY7M0rsYtLFTGKH8Tp1KRvnt8DDeag
	FapWkIV+rUOMGt3+zQ2NrEKTjj3AHIa3spQlcoxnstMcdt+tHj+mTVgp8bPL/aKu4WfoNsb41ZTi7
	tz37Z39SuurBIjC1LvFxuZNefhPW0adYwpOyIBnjNTtYeaPf93jSBOWNBYZflT8GELs3MKk2qngNk
	U8oPUz/nF0jTJMBXRctoA4RCJe+2W0W+uLuvyUFguHjS6jCFWNoMKbaoL3DwKadhn4dqojyD1WzB8
	3zbFgmCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjP2-00000000VVC-16I9;
	Thu, 12 Dec 2024 13:38:52 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjKy-00000000Ul9-0GkD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:34:41 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2164b1f05caso5490095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734010479; x=1734615279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf0lUEIsGTnJndimnrt/UOqCv8R701BigsdRuKPieQY=;
        b=NINXRw6ZVuyZbJG29FTeLOOfACrrdRZMc95de1JJyGmqJ1chjcSLT3wq0544Q0DqSj
         Vqu+RR2E+0ClzvjGOrlIp9yM0Z+uMbKZ5HHsstk0tR3KlveivPu/RKM9sDXePFgYT79T
         fvMKsdF1Kb18mmSbTuS+klkzE7aOZg9CMYZ66W1yp2OGB5mhmj18j0MmkRHS8RSkM8hf
         fQNv77YM/vGdyoZrqxFhyNbNLVDEKQYuTxFCH91ouzNZJkkqbCHqc1MwmyCxhRqEs0m1
         T+X4DQN3MAaVbYOwnRmMvFbX1RC18da2olq0RzP5VulsC7ZYEZ1PBg2UD2qbm+QScyQP
         sA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010479; x=1734615279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf0lUEIsGTnJndimnrt/UOqCv8R701BigsdRuKPieQY=;
        b=j6NUQVAIIRwcKcQDKrdE93QYjgETHxlnRkC3L9KjomVmSl5Siw7ErTfQOadComiF46
         qtzjc0yxBTxhNxSl8XXRldcH65aoZilp5Rf+2kaSOoG5MswVQzapTmbXEtyoOVr9P2+l
         q28o7I8hq0PKHgabRL5c1PTxUgIBA1mJHncMMMFz4SEZsLKNdYxbOR40SH/6rC11Fq8Y
         /iQkSEp/8WkSwM5sW1ry0+a9pNYpiZaC4KOGyPQyEwtuqHPVkneiYRkmwuaWScSyX9pi
         gJ5m5yx6LId3kiecWSNpe0wToX7MlnlSsYw2EWxjb5LdU3TIa7qFQJ15WC+GYSYrfzok
         ha/w==
X-Forwarded-Encrypted: i=1; AJvYcCXIhMi43nMC1qYACH+gyD8RUEe1EOysKnnf42rv8i49BeMxHo4ijZiheh8jN9MiUvkhktA6IbUxXei5oM5LKKTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz18qp5Zz7yaDLOm5esj8efXqiWheTNbRIDJsph5V9Fb35NzXfl
	0C5kYsBLV9KwnAXnJcREsB0Ahjw2FHjoKOJLTMVgI95GVBATwFsP
X-Gm-Gg: ASbGncvHzDLP6X+9vbO4MdCP+/VlBv7UGDdQBEB922JLK9A/qSlgchzL9M/dkjBHWqr
	3CRo2mFm6Oyx1xK6G7I16np+HJy45yfY7/H993nn6qg5SxVsd3T8ZI5MVVxSx9miYe5J/Qc6jEF
	VUhwc+Za4JCBewACrAHtMBz4YLkwXHHyQChY0CwFdN9NJsiG7W1CKvvxIUqHno5uEFu9woNTbTr
	8lqx7kGz2jxcotqtYdAueszackjMMYi28EZ63M2qcmCGyYKUThTHGrkp+qF3NfGL/+MxoDNYgPR
	gsxOfqtwoxXTOuwQhxCwMU8RQQvIksDqaDIrla2yf66fsmteLMWN/zoJhbzvXLGHScIa6LMH/HG
	PoQRx
X-Google-Smtp-Source: AGHT+IG72CSpTzAbD2aJjX7X490Q3VfJnza4dGyLAZeAdhGFBrbCMchjemqwfL5MBOt5N81pQsYWJw==
X-Received: by 2002:a17:902:da86:b0:216:725c:a137 with SMTP id d9443c01a7336-217783c0b13mr109498415ad.28.1734010478887;
        Thu, 12 Dec 2024 05:34:38 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163562a838sm83390165ad.29.2024.12.12.05.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:34:38 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Cc: Jerry.Lin@quantatw.com,
	yang.chen@quantatw.com
Subject: [PATCH v1 3/4] ARM: dts: aspeed: minerva: add bmc ready led setting
Date: Thu, 12 Dec 2024 21:32:25 +0800
Message-Id: <20241212133226.342937-4-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
References: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_053440_103862_F3CD39B0 
X-CRM114-Status: UNSURE (   9.59  )
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

Add GPIO BMC_READY on LED and give it active value and transitory flag.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 9cd225ae96cb..7fddbe833cc2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -101,6 +101,11 @@ led-4 {
 			gpios = <&leds_gpio 10 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
+
+		led-5 {
+			label = "bmc_ready_noled";
+			gpios = <&sgpiom0 141 (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
 	};
 
 	spi_gpio: spi {
-- 
2.34.1


