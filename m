Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E982ECD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i69UPaPeukOXG1EGWuJPIr1RJ331Tq2Fgh3Di6Gql8A=; b=rlsnZhEuG7qPukaXgcQS976enp
	X1sqvh+Xb2Mfkp9P/z+KfRVNG86y6s7pjUbCzitTmX8PSRF12Syu/TUYLVHzdObDG/QvtZQ/IdxaK
	pdhVs3GBPC8N9p4/CxlIJS38W7pevcUSZSKCkkX9LTP5OuWwBM4cYXVweV8o2MSeuv65Z2dXcwZZX
	JzhuPzBKp7gHZrM4P0+5AQbQb7dmjX42HKL73hRkSzb1Va+xVHVu5woz1sSIGMZqEe95qWXBZ7z1p
	FCtL57+sryvHh4/KvjzzHAQkwcYckvioXpSB0bMAkPvLbx+fP3Y/tLakkdb1AhksW3+3k7g7TMWDz
	1DgHRjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIF-00000004L20-193D;
	Mon, 08 Jun 2026 20:09:55 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIC-00000004L1O-0vZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:09:53 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7e266714bd3so53795107b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949391; x=1781554191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i69UPaPeukOXG1EGWuJPIr1RJ331Tq2Fgh3Di6Gql8A=;
        b=WiCK/ckBvNB9SbUhypv05uBVGMlCEDbmc0+3S8s8RH9fKcazQfjFjRRbdT2PokdkOO
         JC0RrNVlRZxcRNfcSjgg1RL/irPtb18gHfhNIQ7/TUOe7QKJWZWgSzk+6qBMhQ+CYZe1
         ZvgrlEssbpmpqvZvivo1Kzy+d/dwrA5BZ2jgOClMVUEYFmHItWK4+1ySgxRyL1T95FHO
         Izm7v9aBmcA2icpoIn6m5Guw+8nF59QCR+lYGLZiZSqn2HMrcKorVOv769KeDv+upL85
         5yazqHHpY6ZrjfBIvpfUj/LeOWsW/AuVcXdiiqQyGJMEGaSXgosLFWCzHzmDo2GdOdt8
         BU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949391; x=1781554191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i69UPaPeukOXG1EGWuJPIr1RJ331Tq2Fgh3Di6Gql8A=;
        b=OSLdT09KdLYn8V5Qig0vb+CIK9lNUhLlo1EUko+7lL9OGyr8O6/H+E5xdC0XMR5tjm
         C/sS8WcXztStZJx0sCJ2bvwKuO05eleuLqYwIz9vSW2zHUMPx6/qvQiOj2296TGKGr3G
         2tn3R+5QTzVcuKiA1wYrl1i4LPKEjx/D/198RHkIDjO1J9zBDgZn9yOkpTnr7l3j0OZ0
         BmomE3jdyNOCFfTB4+j3bviKcjGxeN0GhjdmeiRN97raxZ5BfiAPn/xwJ+Nc/arnnd4h
         x1hMPIrrjMa4MzGNou98enTh0+JaBd78WmS+OVyu9HRw6p22XXvoPYmNwDmyQGehybqD
         m9Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/6xj0W90CZ8wZleuph/8soaV96ucDbD/pPSo2aNe146FfLm2Zr6+vOHMFPVd5sgifaYwJu8Vx+28vIVM6UOQWE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw+Oe8qlxGAZDXOKKYISbo2gGomcdb901ykyRpCOS2eg0SIc54
	hL3V0gbpQDZo3KWZx8qxh9l5jwyGifr0da9I96W01V1pyhfLJuCP8RpoJNbcEEv6
X-Gm-Gg: Acq92OHd+9vmpA/GCbNEHj0pDZHLRfG+7aKoiS2Z9hrUyaHJiMpOozguXSk4sX8/Hxi
	wI4dSSo2hKtCRaspSqwmhs9pGhpzmtXF79VrVbGx8v4pBy58xLgF1kZftGvovyH+2atZGNSIgPK
	rkh4jpAgXGQLOVWiEX1FAcFWAFCqvvoNUI0lr6AvbMpOYY3YLdR8ur19yrL8PduE2dtxWCRdJYi
	a9CHMYr8YHBIN29VaGHmJq1D9shd0PfkL7VhxL8aTZDDytqbwzOodQBDh9aIwA+/UVGsF4f92+C
	4wg4Pedt2hPQPOAVGT9Tt68LeGFHonMIjbrFLCZDt5KxuKzy+uV399T1v1KEPWHQL47C61NGAoL
	fVOy6lChviTAA37OHa/DxMh6qla6ybsX4DEA30HwS9hvtK1lq21ISND100Db5ciDpQyMfK5fm8J
	+gHYxsH9JzPMD8c/sL0rDljztZKb7y6rZjb5lmNFm57YBTwVgR6Pjv2P/Ubxi6PQ1vBm93huw1w
	ArVujNKaOr7FJ/SiWgEyEadk3f2c5iJnTQr4H06i0gzeA==
X-Received: by 2002:a05:690c:e003:20b0:7ef:c894:2101 with SMTP id 00721157ae682-7efc89429admr69439157b3.37.1780949390968;
        Mon, 08 Jun 2026 13:09:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea986bsm88688987b3.9.2026.06.08.13.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:09:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/3] watchdog: sama5d4: fix IRQ and timeout bugs, use platform_get_irq_optional
Date: Mon,  8 Jun 2026 13:09:30 -0700
Message-ID: <20260608200933.18669-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_130952_266495_3C1875C4 
X-CRM114-Status: UNSURE (   8.18  )
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

This series fixes three issues in the sama5d4 watchdog driver:

Patch 1: Return IRQ_NONE when the status register indicates no watchdog
interrupt is pending, and pass the configured timeout (not the hardcoded
default) to sama5d4_wdt_init().

Patch 2: Replace irq_of_parse_and_map() with platform_get_irq_optional()
for simpler error handling and EPROBE_DEFER support.

Patch 3: Move platform_set_drvdata() before devm_request_irq() to prevent
a NULL pointer dereference in the interrupt handler if the shared System
IRQ fires immediately after registration.

v2: address sashiko review

Rosen Penev (3):
  watchdog: sama5d4: fix shared IRQ and hardcoded timeout issues
  watchdog: sama5d4: use platform_get_irq_optional()
  watchdog: sama5d4: fix NULL deref in irq handler

 drivers/watchdog/sama5d4_wdt.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

--
2.54.0


