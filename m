Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ULPXPFiSOdZmCJgGf8LxNKIrP883dRhcYk2KSZlt2Y=; b=hXEAPuyKNqFnE+Ft3S5eeb/2ID
	QRSfDqqAH55Oqt5yVaTgxJoKB6DlGo5wfIJLab8fBTg6hgqCvG7hHJmNQweQQuTGq/BcOfX18YLdD
	+GVNtrNBfGfeG9sMbJjPDseAmBNX5Esi9n+D1IEbKbLiSkVqUuFmUhaHh1bQNPT2DblMm8Om7tGGz
	Q55xSUq8pGle8TU2zcSY2ob/6l7A2gzzqlHp76LpbpEho4Gyg1Q/hftmdZC4OQ3dzZJsQpiXpSquV
	0aiYz56PFVThr8V8FDAD6InS3Mpm7FupWnBDuHMzg6Ev71yCAeevqln+mYHrRpnUYQElltzKfvhPL
	3QiAoo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRZ-0000000Gsx0-2y9E;
	Wed, 08 Jul 2026 10:23:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRX-0000000Gsur-0Me2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:23:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47de0093c42so498592f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506229; x=1784111029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ULPXPFiSOdZmCJgGf8LxNKIrP883dRhcYk2KSZlt2Y=;
        b=kh8fuHzXlOvNKl5AIgI9jO1PWspT2PGJF4y88W3qmSBFctWPsiRTzJIv8yhvfv570F
         eFyYNUJrApozuTAmegQDMUG4UhGthTur0NwZC6hSYctcq4ZsVLoGGfz3AGTIpuqFCp9p
         B9fq9C+dlLwJuVSAgeMsVEKp3uQI0gpEmOQQSxdQbHZe6dnQmnVJHw8r737Q6mifMT29
         dYYj3k1xeStySz8Wp/UNppuPcNSZDalG2hHPnqTFCCdw3uJznmIXBi6evhRGFxXEqmgw
         oLvkJpfV7CKkOJsg6XBIK0jnkMyH588dKcccAcAETI7Riyev7TYpapFq3PUIOm3f3mr1
         HmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506229; x=1784111029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+ULPXPFiSOdZmCJgGf8LxNKIrP883dRhcYk2KSZlt2Y=;
        b=f9lBzYHJ/ub2xFre+/YfDXFwWi7GZZNXaBmk+LUCMqBDJZFkDn0TwaiybzRR9pXkw5
         CXOtDC8g4djNR8UKTgIUQaUNU4d+4RVk4BvF8HTeZ+4z26woKjwtiBxaBxkJt46X8eoA
         SBdrmC86Mc8B/7+HCs2it/I/5ZVVFVNsSiDWoYdH36nNRnYRrL9kF9Fj4YOJeTzuN/l8
         M5VrokXHbAgeBJQfpP5lOLddg1SICHqSA0L/Hx1bdcpB7pKBDPAwAKdWSBNoHYzQLwiP
         zZDv0MEIUt+wRJ3lcPeAksFlR8TEhzBpC5G1BtGB29ljGhYAYJW1lNaUUWrT9DR8ypEi
         FODw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5TvLWzvVDH9XKlYWKDqnX7lUKTJ2bKmFNiXIHRkVUs+sr1T5czOWia46Y6jkxlChZuBUoeLS1C1SiEzoJFtct@lists.infradead.org
X-Gm-Message-State: AOJu0YwLvRYu3UN/XcmniiEyngHtXQhtmEgMJg1FBB7N2D4VEFImAzQK
	/3eOQZQR2pM60PsOnc2JPC44JxDuD17mG5GLVq8ZCBzjftGxfNWWdgWJ
X-Gm-Gg: AfdE7ckPfIXdtOlpvak6x6kjOTaDtCp/krNX+BtcsUAMmaDHPYV/em0Dj5Bbp9G0J5l
	jR+WshIUDrBYh1x2E5zdnlmRN2jpV2ocMi+9GH8duke/qNrWBMZwHuuipW2lF6m78DtD9RqTRpH
	AUOkm82LRY2AQZKTgshUn5wuWa1o3+NZ4kTQAkfkoYg2WnNRb4/zUdk3kfUO71TsNIO8Dja8S5f
	dEePvBGa5wQi8FCl/CtZaE9Q4itlhU0I0QfCn01/WlMTGkNckev7SOdk7pcDN6198bYlhpEj+2r
	R025INRviyTe7FwxGog8QU+0+i4W0XAm+bF8ZrCKTtPhQLRQGvHE1tcgP69/0/0PMFBzRkdTWto
	h7+Km8Y47n4Eiv9jWCe3K5zLdoL6LsYKrsYLtzALm9i3UMX525LYFG/NIXZbhdoz3n3JsbD+aaH
	suJNYgEUiLJKXelkD58pWVDU0mMNGdn7sX6IE6XSC621bnbSU6U9/Bry3UcuiIlMhtf6xy0rhoZ
	6hzd8up
X-Received: by 2002:a05:6000:2481:b0:475:f0d1:eb5a with SMTP id ffacd0b85a97d-47df07b9659mr2019348f8f.53.1783506228883;
        Wed, 08 Jul 2026 03:23:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm40660248f8f.36.2026.07.08.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:23:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 0/5] net: phy: mediatek: calibration for AN7581/3
Date: Wed,  8 Jul 2026 12:23:26 +0200
Message-ID: <20260708102341.53919-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032351_171253_3D1F67FA 
X-CRM114-Status: GOOD (  16.14  )
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

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Christian Marangi (5):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   16 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1812 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  517 +-----
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  364 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2311 insertions(+), 500 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.53.0


