Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C86CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=; b=yCV6sNTAVmKANfXE/Y/JvEOthK
	SmFfEYtZvGUvbFAFla6K8OjaiNIWJLPir2Rxo8DIxePlfBz31diF0HxmGLAgY7YUAp23FdwptQcCN
	1lB29mXNqH3yO1M9vVvy8ParhlSWPnjck6A0eLLn6RATZiHdu+C82H+eD6OaL0AT+NfQ+R7ehe4sy
	KOZPziLIe2JaJEZ6LX06w0KeGuBXGz37f8nJYMBXZzehLSnwzuqgf/R/i/JJyoQuT/MF6aeXLy2og
	QfDL3QbU5lMkD2SZgBHEjETdJNcQZA1uKwEsi/kntkw10/7qpcEnO1wpzQfmH3TBmQ5JzxuHuBwyn
	d56kpVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFQ-0000000Ehx9-28uo;
	Wed, 14 Oct 2026 07:18:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFO-0000000Ehth-2Buh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:17:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so6048515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962276; x=1792567076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=;
        b=hXzG3EQPcuugvejCcPoktYF46LR+gCWSY6MnP3pmuMxZK0wxYSheHUEtbzRrw22F36
         yAIbckvFpKXbPZOknzKQj7TNgKtv64yhK8yswkpXv1vTh7lg68YxIJdF+vYJDgWDbM7A
         Q+DPdV3w1XwP30uG9VBzDH1zuAwSpfZOL26yi4uOhC76pC+S/CSsBGc8V/pKtehIZanj
         Io62kDfFGJM+R6tVODx48tYV5ICHxt3vGpEbDMdAbiaIH5A1+auKtnf8C6pTHDO4fm8k
         LTKE22olgCUviGvG6vjvvilKAsyUsDvbVZ3vi0jT3eW+YClGBsU9/KJFkMsH1hCEyW7p
         s5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962276; x=1792567076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=;
        b=VWqDfgByxMLvZPXpqEVapLoNvnqKM2jWJZg9ehz3WOlCqgpHzvplrVSN8Ugk6dassQ
         y5wgZBQgR+BPK3PljmsdvybTHRpjV8UYpwpREI1XUfCXsqCaeEE6YiKMgMn0iXGCngKV
         PXrLRpd4ClctjPaigWNGl8iEnCDJv55FXtdI+d09MSymM6DT9bAdlEB3HJb6oF4gROhB
         ZJ6vMx/u2F1qgaJxGaCnai6KWSsuZRB3Qg+qWs+XDjzjIk5rJfgpAQpjf3BBYu9tJbZ8
         05RjMWuyannG7LxPIrKC2/JsgYrlsmEXsyjcEUA+IkBdNtlUr9RQCC75m+cbRFGwPu/Y
         4gIg==
X-Forwarded-Encrypted: i=1; AKwUvBzKA0e5IYAPilETmM5blj2iRLhX7mSrfqJcWD+Xt8whLQZdVEatqn7miBS0+d7el+4xI9t0eo4COk/SdXiYusEh@lists.infradead.org
X-Gm-Message-State: AFq9FYKlC2ZuFKdfr0asfY9ZoaeYLemTWr1wAYuJNG+X5rHabJKvkud+
	oSUTM0smEy3hC15c9rt4IHhWalkW/KtWYrADv3ekP8bk7foO6n3aF9B/
X-Gm-Gg: AYBFou3X4b+9pXz66+sdc88Utc/CHmr+vMM7uaol+LiAZDfwA5tRd0pZBXq+DApJz5w
	pqQfzMEpMW0KAQGqJYTQMKUomr22Jfdb4U0s3uXp2ZJ4M+IdS7dXwmMojJQws9hwtXblH2s5dBO
	vBiw9AI9WEt38rcYxfEjgGbkkDRlqmma8m3tzr7ymQfEqvBArRR0XKAUAjc+FFJEDCYALleyD0Z
	30bBdn/xypq1+Ps+YSCcB0a6LxNklmSdcWZdzadKrE8GWfeUp8JcXwfWhkQzRhoT5lUElEyiCHb
	8KhR018rOiii++tkvNvihOOjqZzyd3xSf9qnvPJ23sujioCoLTGX1EX4kON6ni05S3CLY2kdT9e
	RRn5ZE77qmDhzcMWWJldXDrVaoYbkbL+55mQ/N75XFKhSg1XCay7n0mG/JjSkkNlieNbAJXSsZ9
	1ghWcfz2d9NTQW/ROLgy/imru+ukkP98oW5XdipFDgSzWXGI6EMV5plb80kfftghpm0iSjR9OeS
	+vO1wawh8Jood5MtBBEF4IutpuVlZquT4bjF7D/Lv5xXeBJKT6wrSQrKiwSgkfk5ksLKK3C4z4O
	vJZZLl56D3wZkFVrSUG7GA==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr296146185e9.6.1791962276389;
        Wed, 14 Oct 2026 00:17:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:17:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Wed, 14 Oct 2026 09:17:31 +0200
Message-ID: <20261014071739.216345-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_001758_586596_01FA9F8F 
X-CRM114-Status: GOOD (  16.42  )
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

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

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
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1851 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  553 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  377 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2365 insertions(+), 536 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0


