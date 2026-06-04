Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE9CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 01:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AyvbjefoxWefiry2TdXlq5HSZ0FcJuLz0Lra0pLvUAU=; b=IBCUoOCgeLdrdOpkjAfEMsUzMC
	wSLESWHoOem610gUaLB+8OzfXnnm1Y8BTY/RI0fYktPBRSx/nZNxnAZ7twcVB1waujWhOb5lB4XgE
	rbmzy/Kyf6t66WdpNskexjXjrAkVnbw+hcxgmfwBn5cTT6mPks++Dzw+Cer1BoiSZzG8yVcph/y4n
	eupipDk2/jbqVCY+dfzt00srBABNfXN/SoB7b8sfOr/pqKAF7kCTFXs0CBEOkpQrWc/Uu9p+zCpex
	uUtWyQq94oEunyXvMDAVVtPnB6XLsnjvWCe9f1NFhDBY9VbmUwkIb6uAsRRlJQ/Qo5EIDrDO77z2a
	28rtaxIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwX6-0000000Fz1X-0o8W;
	Thu, 04 Jun 2026 01:06:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwX4-0000000Fz0w-0DmG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 01:06:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso69308a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 18:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780535161; x=1781139961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyvbjefoxWefiry2TdXlq5HSZ0FcJuLz0Lra0pLvUAU=;
        b=JYbRCQJfzjaE0/dC1zYqNnT7OSUP0fwoskRf6Elq6a2D/PVavwC1RheRGWJZhB6GNP
         bDBe7WnuZ6doCJAMm7HKibVNMx6tmpDZ3RROu2STnTWe0+d4UbvPdbEm7EUbJP/WJmEZ
         KX0MWh/lfkMGpTVfqOnlZ6THfnxqMOxQhMjdwBJxjjToRKZczyYPSMM5SKeiA8TwRjPT
         TFdZacNhPGjYzaldGdS0iH4rwgIRKzdtXbvSXmagdMWhOcCdEyn8hijn5ROaf3LqAqG7
         bPGvvFd0w6ZwRZd5uAFDnNTRR5jmMs8TkZ+TwmtkhLmMiTxGnxyBJ2QiNRTuq6dw8TT7
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780535161; x=1781139961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyvbjefoxWefiry2TdXlq5HSZ0FcJuLz0Lra0pLvUAU=;
        b=DZnmVnZfl6jGxEJfLPxOJYmdPkvdS1EOjKmd7ef+DoQ91A1xDLgUIPqrZ0CDmIIyiM
         tS6Kb8mmPTngUOXijwgIgivJClByx40eZQskNWyxrOk3ocRaYaGAF21J2DNtHPf2rwVU
         62KoWq8vdeJLkIHIxc/9HiE4YiI6mUIp36qDtG9QAJQNlJ0FGz3sdfWytxoyYfcqCNKw
         ASAMb8mJ1mlMM5gONPOKGZKXxiQlWoMxGPyayCHd8tTPyN9UNxR1Ng5hr+mP5ftPmWVT
         /Gljjat+BXz8ePWxiAq/QcCc378qpgH3avclJicinaXjuXJsTinPypPxXZEE3v+5ChEO
         tt2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ffl+g2FF23ZRxUPRkdDC4hZFsi5tn1A91gu6RAv9UIIGqfYqmFIJM2/UOZcOrhEwedzDdq8igjTh4Lb38XDcI@lists.infradead.org
X-Gm-Message-State: AOJu0YxYnMlYaQRetLxIdS8eNOYS/jvhs2Dp+JWswAmul5UKcNia+Lc8
	wey3jkYsnv0Q9798qKMBz6lC/Pr9yoRG7mgUBowEZ2GYc2B2haNqCrrq
X-Gm-Gg: Acq92OFNNHfTXXOH5GyPK+7LEdhHXKU8dNwqP+rnucbfvYfvcHSjd45ky2YDbcWwqu4
	3cykDYiWMFkn39dJjHZemfD3LnkP9da3f9PcKRb2RNFaDb0g9i2yAXMmcZEVnK6PIFMEebd4TFG
	9sPMJv0tP4xfIaX1SPdusoPzdBg9vC3j+ZcSCkduYZlcWfNX3djZDV0daZmv5pjJ4rC12qgWHGE
	GtdeNnrtSmokk5btafmd5Xn8igLyTG14nxuZu3nX9NOciwa0Dr7EOllyF0oFvVrsXAE8YX55wKq
	f95og55c77iyMPk2dv0xeSzzeXfk4CMEpuu0l2sB/AWoqT2N8i5llGV/8LmycTtxJT1dMaqRl6w
	o776feQUJbYc06yFUmU8j5pIhQDNiPjkXlTtmrTfvnSHrSqGJJMSsnkkadExN9Hmr9UJ5bZxOOy
	CI8jeYLu7JL1nKhz1DX5CIqbdjK23VAc/P77FGoU1TCyfjDmfzlj/J/Lgot45gMoezlx3doe4YW
	LfzZGH8yVcuovN9Z9g66OAm2xADENyjpLZBte0LzPriNyhf5lCuwdLD
X-Received: by 2002:a17:90b:540c:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-36e3083798fmr5960595a91.6.1780535161109;
        Wed, 03 Jun 2026 18:06:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6d169abdsm2366747a91.0.2026.06.03.18.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:06:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] watchdog: sama5d4: fix IRQ and timeout bugs, use platform_get_irq_optional
Date: Wed,  3 Jun 2026 18:05:40 -0700
Message-ID: <20260604010542.23177-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_180602_120534_55AADEB1 
X-CRM114-Status: UNSURE (   7.55  )
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

This series fixes three pre-existing issues in the sama5d4 watchdog
driver (unsafe IRQF_SHARED, incorrect IRQ_HANDLED return, ignored
device-tree timeout), then simplifies interrupt acquisition by
switching from irq_of_parse_and_map() to platform_get_irq_optional().

Rosen Penev (2):
  watchdog: sama5d4: fix shared IRQ and hardcoded timeout issues
  watchdog: sama5d4: use platform_get_irq_optional()

 drivers/watchdog/sama5d4_wdt.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

-- 
2.54.0


