Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143DE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+oROHsI0pGM+lBjY+EF7UPmjz7c08DPed5m+aIOE+A=; b=B3G7932AhOoQ1P
	j8p4t1woQG+/ap1gDpJoE4CFuIgY3JVV8wfbBLWUQ9Vz4k/3iCCVupR125LcUGxrszsw691bAmq+I
	UlhtdmzdEytw2GEedUoBEmjf8/DIh/g3XulRXCNZEVTAeBzLYdIvQcsr/J3QsuC5AKeyYu5qVpEra
	a2169bNWe7+Pc1+mrNWIMTf1cYXJfHlBbpAKspaYg6T5t02lBHSdKHAmppWBAT+s8fSIwrb28vEIG
	VLkPN6g87rqshNZEX6Zwex47PC5qbaoZqQRYU6fk8lc+ic/PLJVNSOflUXFHtNO02CUyhZZTRpML7
	Dh0SL9NAe1R4Zi8XnZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4ke-00000003tNd-3xQg;
	Tue, 07 Jan 2025 08:15:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4jN-00000003tCV-3y7I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 08:14:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so158912445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 00:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237668; x=1736842468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+oROHsI0pGM+lBjY+EF7UPmjz7c08DPed5m+aIOE+A=;
        b=h+MLRv3I9IY0ORN1QBlsef+aR4MeeAHY4NF5QGYcp05fkkeE/EY1W4J1TZtzySUF2Z
         R5scMPbXjce4ShuAiXdGvJfccwxIbgrQzDsy+Rq8gUgTUiOcGWswPUsHz4krDAC46m09
         pc9YlrMFHUkZwl7tIcrevA3W77sytHv/giWMkutqN1HeDw0zGP3jn+yzQWsEqCk+I0Ve
         SBlxo0bKXLVKQlecMvzQKEhlERBCSCb9QyUUVeTXt41m3a+0h+JSc2XP1gmvw0vjcci1
         PcKKAKA5g5AAuFF1CwudpSBeMMsEE+aioBsFXJL7A354CqX85hPXm6EE7XMQj+z1DwES
         J/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237668; x=1736842468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+oROHsI0pGM+lBjY+EF7UPmjz7c08DPed5m+aIOE+A=;
        b=xLy+yZT6tVupNLWwNKnYcyiJarXhpG2lDrw1CAD63ZgaXUALpO3h6Iwm7qusiVAz/X
         +etHANWuK5EyVjt+uazRVTgcpzEvKxDhrjGEvS2j+fSFmrvWKmcgP7nsW+F615FGqGPv
         wgA3Hq8m/leH2sn3R8pc+01Ts7syUAXBrXL2ZSVcm3dQD2XUz64bpZYdS0Ej3Yz/ozzY
         yG7+17lz7IzzWALCasG9YAgyRDSowyKlyCQpnymAkg9btOtQIiSIxqWcvbKxFdDutJcK
         MXQfn7cZB2y/sox4GtBaNNBg6uHi/wJC1joVQZd2jMSe0XllsBkMUKt2Fc58uu6EA68z
         YCFA==
X-Gm-Message-State: AOJu0Yy7YRAwCDXpPrTnKOz7Arhzu8NP6SntnvHz2t/6rQj58rgL2kFm
	BiNV68VrGW/tvTPZCEvu5rKtuCUV9WOYYWnd9VsaBqPEKL+ElYfUhw4cS2Qw0ti3rKNVX7lVQBc
	N
X-Gm-Gg: ASbGncudobObYeZb5aoxiyDGCZB9j6Hnv0pLdZCe8iftkT16xOvquUV7styQi5N6MHR
	gJ7V98MbUnMCmbGaT1o5+k8Fv9kisg+Wb7j+jQQWyZEcLhv4GoOvHGt/p+3rADVSnjuhqkBjmdA
	mlHzEXEdtsNFtuPDA0kJsIeR5+Bm9BPIqXObSeCIMnKmCbB9vuAP0gVKbyHIWXrB7UrK+RbKLON
	oDTpa3t+/BwJfITMJp7iqt0JRmeDIUJ8/7Oo/Glh6GAZthJDZYf/vt3FenIo43KPVvFCcj2xNaB
X-Google-Smtp-Source: AGHT+IHbtvTzjUvXOSpt74DKXaCeM1TDBc5BheKAfpOnexjqRQXkNQ5Iuxor26lOK06bUMotfiNTYA==
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr53924526f8f.38.1736237667518;
        Tue, 07 Jan 2025 00:14:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm3541314f8f.87.2025.01.07.00.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:14:26 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.14
Date: Tue,  7 Jan 2025 10:14:22 +0200
Message-ID: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_001430_096606_935E6D86 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.14

for you to fetch changes up to 221984deceee75846b8a132974683d33dab5a029:

  ARM: configs: at91: sama7: add new SoC config (2024-12-08 18:55:42 +0200)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.14

This update includes:
- support for the SAMA7D65 SoC

----------------------------------------------------------------
Ryan Wanner (1):
      ARM: configs: at91: sama7: add new SoC config

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/sama7_defconfig    | 1 +
 2 files changed, 2 insertions(+)

