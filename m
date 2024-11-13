Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA358D637A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=; b=PLHJCpx34KUwKv
	Ty4QB61GbeipA6hexas2UVY4w3OBDJwK8B0Qb7UtedeoIYv2KwVIidQBZ5csm4Mf3e3ngmVL6Glzt
	MpkVcE4ndkHGWKIRNBYPyvqt4wsjPZR0llEwzg8V1WsGwYtVnlr6xy8IvPu3xkzOa1TBktqiz/7t5
	PTGtfM5h6iiHuagOU5z4kjpifECtKR9EA6Pe2kg7B86/qMhenks+WFoRpMYUXQmbhrdqaiLuhXti/
	gQGtMsnYOzbN16yCHgP881lvpbJxh85WA5FfL1F5Ti7zUT2noU2RpYjqjThQ1hnkEpYYoaimeV+af
	/Gm3YwsJ6YIcuy8/j6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBI0u-00000007h60-445A;
	Wed, 13 Nov 2024 18:22:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHz5-00000007gsL-1NAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 18:20:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so4723551f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 10:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731522053; x=1732126853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=;
        b=a61UCPhQW8f8JYnnNLaskyoISYhMNebxg9neyUI/e/5VCu3rU06vpJ9nX4lbtwGCVb
         UhyOUM2Ap9JSYJ5HEKtMSZ5L48m8fm1qoax1tN0iMAX6+BxVaZ2/I/iklJmFDujEpwk2
         s+oAxtG496+3qbpL0VkaYXsUgy0YES3nbVRaZIWhfzSxcleJRJCYk/xrBTm5Us4QRcy5
         Pg/cXDdJjJUwonRTJ2LZv1afBIEZkhe90+kYyDiPBsG8F5PdX7k1Wli773g4xrTslSyC
         cya+aKmujRqaX8EDQ6JHOWLBXYtLEMIkCpWKxIsY7ORdDIGfR+uPgE9xVYpPomgHj1GE
         H0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522053; x=1732126853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=;
        b=Pa40CKfJHX4BJd9U4ds0sHeKsTNQfDMur+pkK7GMwM2+6mpYCpkPjanYIbHoXHDQMP
         DrxClOn8S8/6/1qx//xxuPVHNPARunoWZ9amSIgJpi/Hlo78Jt+6bhVzk//KQzAqN5rK
         4/lbFZogIIzhAtuxmkrCuqoB66BWBboeqBeBulY4clgYXT1JormXfFCJJ+b88iEibLX2
         jajUgVfd+69RoesS+jAdu4w3BbgvwrlnzZn6P1/loiJTrrbBjC9iBI5Z39PZtRVy1Es1
         h7abuapsj4sFGyYUafH49o6d6GyiEdiOExLvilZdWDl6/bBqL8i+bSUm2Sc+8FyhV9Xh
         hXKA==
X-Forwarded-Encrypted: i=1; AJvYcCXjagiZHnSDRlmrvSGJNGTEBA/ai4QvNmEZs67CMjMYWZ5YxE2Pl0Z+GK73rVarZkbmNEzc03RmHQYkmc7389r8@lists.infradead.org
X-Gm-Message-State: AOJu0YxHVOKuPG2I4+rZ1Ymm95ZSPQy2L5SHT3WGxPvq6xOmZ4J56JoA
	9bIXwFXQW5vz7lyUBdouTFR7mVBjlYuA0KWhKQF1Blt/wU0xDGfS1TTiarMuWNs=
X-Google-Smtp-Source: AGHT+IGY0nTu58anzCETD2GP4NDW4eKQUgghMT0sphjAndnGpHA51jBOS76Y4AKg75KizUZDCZp7og==
X-Received: by 2002:a05:6000:4619:b0:374:c8cc:1bb1 with SMTP id ffacd0b85a97d-3820833aba7mr5844551f8f.39.1731522052781;
        Wed, 13 Nov 2024 10:20:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm19009502f8f.50.2024.11.13.10.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:20:52 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Subject: [RESEND GIT PULL] Microchip AT91 defconfig updates for v6.13
Date: Wed, 13 Nov 2024 20:20:48 +0200
Message-Id: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_102055_489681_730462CE 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.13

for you to fetch changes up to 07891907687e3cc7e0659fdf5fbdc816c97ddb80:

  ARM: configs: at91: enable PAC1934 driver as module (2024-10-13 18:52:47 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.13

It contains:
- enable PAC1934 power monitor driver for the Microchip AT91 defconfigs

----------------------------------------------------------------
Mihai Sain (1):
      ARM: configs: at91: enable PAC1934 driver as module

 arch/arm/configs/at91_dt_defconfig | 1 +
 arch/arm/configs/sama5_defconfig   | 1 +
 arch/arm/configs/sama7_defconfig   | 1 +
 3 files changed, 3 insertions(+)

