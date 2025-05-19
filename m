Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F1BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhIrVHwGSFZ05nBRjG6lvTsPjni98+/+X4SN22sS+iU=; b=uFF8pBX9MKeAgN4oQ2MHwDDyaO
	OL/abiV2JCnDYCgCG8S2SUPD6uWToVsB3WAtAj2EAG0yORiQe+vXj4baQ7GwlxnpdmcZ7SOOLT9VX
	ZB0NS5W/bQMbniBtjgUDDGtwo1NU1RPlwNh+2ldDHGn0DQvpNvQjwkiFudjDSuwagRpyjz/DThzkf
	y6EZoDcj6WG9+uzeRnxPTajvCoN7vEEbraGAC0VCnXsz0x7YvDeS7dPYOZH88VvZeh9dp67EutU2c
	BmDGmMjrUlsBFx9vjAJ/jyy1fXtaaXDkRt1oFYqoYp2QfJnr8DtDno6ojL7v5AslXSGUthJBileud
	dmANv+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4UA-00000009zUQ-2gbm;
	Mon, 19 May 2025 17:41:10 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3kv-00000009shY-2hxJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:54:26 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4e14877b7daso1065142137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673664; x=1748278464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhIrVHwGSFZ05nBRjG6lvTsPjni98+/+X4SN22sS+iU=;
        b=UvBjPzBmngjVdJNL1hGIwmHXDzXr2HJBCC33bVSAJF8VkBof1H0Bs1Gy57yUQmDCNj
         p4pDrG3gEDtDCeyl0hmM5rtcaYGMtvrK7zusBKsW3dVP4Sr0asXDY77zbcwZRtYtQFPe
         ljq/Qq54H/1qme6K8YrqyP5WtEa4KcHXSyJ6lfsnf+jzV/TU198a3yEXKr/oQROisW9g
         2yFPgnLqioaKmZHAs3PiLCpdpvlEXZvIZ+yr7Adjmvid5MCTagDZsicc4mXHRCtOHsJr
         ZCEIB3Uw0z4dwiR/tz62wskdXN0z4SX6PB9z1lCr77mVhDcFPBxb6Mf0KcF7K5fepLJs
         O0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673664; x=1748278464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhIrVHwGSFZ05nBRjG6lvTsPjni98+/+X4SN22sS+iU=;
        b=kPeGVub51abwUFlq3Ixe7rzw3FVnb6KRKCMF/FmQfDa6vXPuAlNkhJybgfuI+p4GFF
         0rJgHMqb4lkfmTOrdBiwNO3L0rGEefVNWO2Ocn/23UXCBtXLSB4T1eclt9OQF2NgPEXZ
         mZKTrIojngFS7MaZURpDGDROZDIXZ6jpNJ/j+djUjQcq1FEgoWRH4YKv6WKdLCYKooCN
         dfRemhFzblc6m1xuREXTVe4a4KRSnTk1Pc6+6rN6x4eAPv3X+YkLUNgyPjGizK0+bdCf
         W3T2isutUx5+lCTW4StT7EJw9q0bQPVVLiDwwBRRkUmM6XZTIw4rNUDP+/nTarbh/eWQ
         1bog==
X-Forwarded-Encrypted: i=1; AJvYcCVLvdedqxH8lj6GBk0eh7LAwiK4C7TlTP6P1g3EryHK3SJhOjGOWP/kTwiR3b0Y4Hpixb8h130QXE5cKZz4S8B2@lists.infradead.org
X-Gm-Message-State: AOJu0YznsZhXYbwfzXYvhmOjM4F6Y47nwLM2y8fNglQgzFRYO8k/630z
	59w/2WBiWav2bSq4Cm8V6rzIgJ8ghHQnFTF02y2leHLfVEGUja2tHHtx
X-Gm-Gg: ASbGncsuDAJrKG34czstaDNas9rmBCh72J1IUtzJyv5BgCT+MgYlm+6xC8BeBUOFHQI
	s/xtLFGYNHTyFA5HLzfKYomJABmAypZtnS5N/ZMGt/lfB1+WKsAeGxXHDkP6Pxnf1MGQR2Eqef8
	TFIW3sWeqsCoddjaLNuhy+vkhUpRpn7BuDj7W4cfoiQt3I77/uNdRf/7/niphpQChY6XhIPQr9w
	oBWmUKwDtyI8wGqxbmyBtGW75opFP0g9vRHMQYwoYmZFI7GNpRq77IH96ecs559jWcebRQdPgm6
	CDHqDbZPqeOzmIEgNhEvTNLEXa8RyZFZkZJ5HpIwiAsjT52STxFfy4WWyJq5QTWN/g==
X-Google-Smtp-Source: AGHT+IGNAlmpe/4UpTfZp0v7Qkx7tVnZUHpE9aJTaQ6+lOIzV5Sj09f6OAWMbJDTSiHTczUaASsxKg==
X-Received: by 2002:a05:6102:3ed0:b0:4dd:ad20:a333 with SMTP id ada2fe7eead31-4e049e6529emr10850873137.10.1747673664482;
        Mon, 19 May 2025 09:54:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:276e:c8c9:6d13:9b45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa687ed41sm6671528137.25.2025.05.19.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:54:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] ARM: configs: at91_dt_defconfig: Select CONFIG_WILC1000_SDIO
Date: Mon, 19 May 2025 13:53:52 -0300
Message-Id: <20250519165352.1314199-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519165352.1314199-1-festevam@gmail.com>
References: <20250519165352.1314199-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_095425_684553_5C4EFE59 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Fabio Estevam <festevam@denx.de>

The at91-sama5d27_wlsom1 SoM has a WILC3000 Wifi chip populated, so select
the CONFIG_WILC1000_SDIO by default.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb..d195aa31976a 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -87,6 +87,7 @@ CONFIG_LIBERTAS_SPI=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_USB=m
+CONFIG_WILC1000_SDIO=m
 CONFIG_RT2X00=m
 CONFIG_RT2500USB=m
 CONFIG_RT73USB=m
-- 
2.34.1


