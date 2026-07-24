Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39177C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U+htnAATywGPyMXFWmN2bw/5HJemt0qcsoVWYOwwS40=; b=bZhiC+PwjomsgwHIY2s4h3EuvP
	+0CjHYyXqTY4A5XaenMk3/tuJU/jR9ZWSVtsJTCS/fxRP1VRh0DoDVqzNmgmMjPoVIr79BoH5uOT0
	RQWuwKd93+Fz+lS7lWt0Kqi/1Im+yHXqOK3k0e0FU/TYlAlTJGFWeeInpv9l+DnghiH5jmTMpdWhz
	zTMpeeOuYbngM90CvikKmfK+VzEFHXIAVlS5PlRkdjs+ERFzcAZErBpzCAOLzHtmk5fZOGff+/SG1
	Xq9ZNmb6TT7GknL0sr06LzAClam873AoorfQDZRlsAvX0yiM0hEryEAQ+FTlh2as9qQhx8dWD7L7g
	SXgHLlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLG0-0000000H7bU-097Q;
	Fri, 24 Jul 2026 19:08:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLFw-0000000H7Zy-2tdo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:08:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954afac04bso8861635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784920103; x=1785524903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+htnAATywGPyMXFWmN2bw/5HJemt0qcsoVWYOwwS40=;
        b=GEaPV6cS1WUutOC3oR3HY6+Wh6OsoV4T+IMviyCvwya+YAa6JEMPDcXpU9BulL9Nba
         5MDUAHBneKRdstV/+rwZMNmM9/CXsHQkOjPUKdRbZ2uKGfNC8KrCU1RdJ/VBD/7UhJFg
         M1BTPTXgrMlxnI7HqQjaHqOEH/gXiKFkV7FQ+cK0KxsEi4XWNZsYbXVSS8Z5T+iyL9u3
         AbPs0AICdZnxwYoz9oJMd36UcXHG52uC8pxXGw7Y5j0yyqyK/m4lmjZ34wr7Tq1hZR1B
         sXREqtPgfmeID+Kvmgzp2veTb5oh7QzhelyxnpvaKrhEH1/4qfFh+rjhyTFo7q5Wz2h2
         GZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784920103; x=1785524903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+htnAATywGPyMXFWmN2bw/5HJemt0qcsoVWYOwwS40=;
        b=V8BmHEdhEbsXFor/VAi0Xw+IZlCb9DX0WxDNcXcTe/w0990hkd/fJ0zw+V64seN+QI
         gyXkeQrGMvOIe9wspafoBowakGF2S9Om2HGdsXn1Q1TUuWhcW/9nMlYpPtYycWRjx7xF
         su7FswADKCYUsl0ELKn6039wbFpeS+Q/d85GKu4Mx1NMXAQroFVB3N7OysyNj9ED3FD6
         GMWUqxatcdEdMD6sjTmlCbZpENp20xnVOMxmslQMObnSA4N8Sjs1L9M5FNI5tx320Iug
         AS7dsDb1QYA5w/iJgaDcrEn9ogpf4IfT4FsNE3F7QE3FDf3+92MpMsDsYfuD3sTZANDk
         g9AA==
X-Forwarded-Encrypted: i=1; AHgh+RqUakBiatepryVkLFmKZcsZWyhS+yH/TDsDqDszZPdVyfb4H5RqdoJGXt4Y6u+6ycyjm1Z9po1lEoKIl/woouZ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw34m+EtLuecCmzxUnO596mA31/t/pHMOid0xJfQuKp80nrIcAn
	cW0kHDyaFtPaNC9Y8LHjVyl29tTQNM2C/ytjOpbU/Z8Re84tLaff4Q8q
X-Gm-Gg: AR+sD10YHxdma5aHPHxH8/0WGPia5narTHKJe88zioN2pdE1903jcmcBe0B+9sWrzmt
	ZIlYTcW9fbJ7cRH9oDu24AheLmJNsUp/MlbArNpDaJZNS2/mk7yLQdjcJUISbKUjhjwt9/AjMr3
	ntkOh65uF2n5PHRDxnV4rrnPvtlf1e8Np8xInX/J/nHZP7M8WQoccqoX6Lu47ukfXoyEI0fLVWN
	jrwJUWIg7mPQuzqZh6tXGdtygqlSZSdj7ahEwCuTvMxUn5ZjlDAci/nQYSGfDmjNWBzalvOcs8b
	5Bkx1VVJ9eJZskgBHE1CSyVQ+ox3I+7OgTrgTRpd1C0moIH6HzAYQ+CfAk/TCOPgeXnsvX0RR9f
	zikx8Nrsna7Nnh9uGyZkw0gSRvzeyL9XKZFOGTymPHDP1rBk3fAXjF52J+/yu/QHJYljC7JqtSc
	di9T6ox+6NrsgIxBtMuFGMlt1Qf0zqGbbllZSINpV9Q9M5ditrCsEuDn+xkhh/NGdf
X-Received: by 2002:a05:600c:19c8:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-49573cffa23mr108734915e9.19.1784920102617;
        Fri, 24 Jul 2026 12:08:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4c8d6b5sm5893755e9.2.2026.07.24.12.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:08:22 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Fri, 24 Jul 2026 21:08:03 +0200
Message-ID: <20260724190811.198339-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_120824_749065_5210BC80 
X-CRM114-Status: GOOD (  15.72  )
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

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: generalize cal_cycle function for GE SoC
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   16 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1812 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  518 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  364 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2312 insertions(+), 500 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.53.0


