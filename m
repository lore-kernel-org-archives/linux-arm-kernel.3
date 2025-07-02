Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32775C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=; b=adqFc2pxi/ouO3s7Weyzz6zI3c
	2R5tfD8t7Qbdmi19WXv3uqP2ypjLsWW9Cit9Bhvmy0Mu/pxK9WxZ5BJOpJnOLPcPTOaAqasX8PH7Z
	6V+UDqVRlnYNB984/KwB+Xt6yKmR65rTKo0B01mVp6VnguRPT/r8X06Yd2sVJs5p27iUb7+iHUpPa
	Kxe66ILHZaYpG0eOEh9Et317eL66XMn8IUgelsNdwNmAasXn3/sj1p1yi99TulaUqT4EsocHaDgK6
	B00PwUNGL/FEbFp6BCHDzedak16eNHPUrfdX/gOdLGY07xu7CB7nqIOKcn89Rl044YbufHM4xqtS2
	EzsGAyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2jN-00000009MFV-0pT8;
	Wed, 02 Jul 2025 19:02:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2NL-00000009IRW-15L2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:40:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-236470b2dceso41672335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481607; x=1752086407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=;
        b=UQs/Wfh8syMGOcf8dqgtO2PaZc2iTDwcWRFNqGYxmrf9WuTtV9d+vsEo6sEM/HPQbS
         qWQwOmVl67TO9OWaA//6luguhp1SFTS4WBFIw/ElMVDKtsQjpfCGnEIUINi8KJ0+MSCz
         GscOfKtOGrD3540vsijUPBP4ACD5rzadRL9rLln+nZQ6wUnYipuzCdUgdRIZLAPgL7wr
         CaaEkZkfZdiKiBh+eWw9iiQpdAdjVOD8Qrz1hxWlc/tjUFUzjVV20Flk5bKIJHq38UWb
         ZEWRioQ/3Grt5ajZh9T6UZRbJhj0LS6FN7ytvhgj3JO7dOZSV3nNEnwl+16S0aSwp+OH
         K5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481607; x=1752086407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=;
        b=HuluLDoN91DZ4filSoAkNQO1VbRS1W6Y8td4G5kjm2/O+8qWkp7mHonNqZjgTMWSO/
         sm+MPJP/KeuSYgMl6TLmkAhGQlCnWD6kbrCZxZYGBQOrA8OeKe12DljeHO0oMTfL/DiG
         Z3GvvH/mKLL2ota9Si0KW9FITph6NuceUfetV3V3PyUgyERLic0ezelxCt9DkUJk3eQ3
         sdOJo0/hXjPb7U6zF0MrJifdN5Gp7qxJVjybnhrSl1YWEtVncIJ5SoZZGYe4arum92Wc
         MOl2ZpXxCUau6TUiMw5VLCLE0+hkrmSakhch7l9k6b2yFFCJr1SMpA8iQNhKcbhXhNWZ
         YcYA==
X-Forwarded-Encrypted: i=1; AJvYcCVb14ySc5afs7lYKEY927tFxAPOytcASNMlg4PGoxHsbnGG6J3mV5XDfm6kzcNNtOxOXAO2r+QLSWX8Dz2F2Xt2@lists.infradead.org
X-Gm-Message-State: AOJu0YwGVRXQY0EI8HUqmfrUknqKerX2eft8unLmJV/LZiuQg23HDMJc
	6pug8GB3H1WuNab3kMbRRw/uCarm6biG5hZ4r3npygTGu6Kmp+uWZiaOR3xXqYM3Myc=
X-Gm-Gg: ASbGncvKrY1fewQJ9pGSOfUacLS8KRUk2M9BkBJprP1rcV41jG33uPpX9F5UuDc7cv/
	XwkMNSHTbGkrzLPV0krOMrSMkNLsgXelzmuXB3YSlY+xhb/cmOdG9HhjqTmRjJojo2ZTWkoqR5W
	LNmspdl+I0oZHa/0o24o9X+ZDLD7pSfQGQLloNVd9emrVFJ+QlLvnp5/4qQQPAK29jEjXTyzjE9
	SPvo96w3g1X2NYD0+PakmjT+JV0Dzsci4LLuwmfXeKTlgBrQpDGRpVsO/1mLfXV4SZKO2LyVgca
	qRE+VkA46g1TgzQMKOEmCIyMWNnCiRbJN1FIaQqt4afurJSppldHz5M4rwiLJZ8sfgCgvTlauaP
	HFJdgFj47a7eBlkhjigMEGxI=
X-Google-Smtp-Source: AGHT+IFr57CoKx0dtGw3L8LbGIOnkIEZXLju9E0LUunBcEwcIBFNROCo+7NEiDnUKvwkV1U4hmG4cA==
X-Received: by 2002:a17:903:2f8a:b0:234:dd3f:80fd with SMTP id d9443c01a7336-23c6e4dbafcmr49910685ad.2.1751481606631;
        Wed, 02 Jul 2025 11:40:06 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:06 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:06 +0200
Message-ID: <20250702183856.1727275-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_114007_299119_15B1C69B 
X-CRM114-Status: GOOD (  13.04  )
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

LAN969x uses the Atmel XDMAC, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 3bc79f320540..05c7c7d9e5a4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -110,7 +110,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on ARCH_AT91
+	depends on ARCH_MICROCHIP
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
-- 
2.50.0


