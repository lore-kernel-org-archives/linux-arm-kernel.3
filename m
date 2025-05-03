Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF733C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KNtr5PT0dXz0YHq1FB4htXBiW/mFemNZgrQEEs1haDg=; b=rK5QD8t3VsxSMYd+s7LbStdCl8
	Bkf6p6GQI3jxUwRkwS9xA23ZRkSuTm3+8/fYBKKm3/vjPMd0ZpIEjRiOVeCjT511K9hdeAwwidJyy
	srH7pcp7NatkuXInV1eVOHMdB/1e/e8CHDSO7esuIB2y6x7HTHE4w71IZHbw2yCbnDT46hjdaqTi1
	bCkxqtTdluesRBjwqsxqbsHHvG2UAaKqt6GEa4uneqlYqmLEUY0rHIFEr7VD20DzectrUlTWssx60
	ao6F4ZMZsWId5KtljPQ3S5J6478/9ze0UQ6iQx0mvhZgZGIWYK7lghakmlhk7wNPor8V0IWkTr8hY
	8AJ0EKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJVM-00000004TiO-1REW;
	Sat, 03 May 2025 20:30:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJQq-00000004T9o-15Gk;
	Sat, 03 May 2025 20:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KNtr5PT0dXz0YHq1FB4htXBiW/mFemNZgrQEEs1haDg=; b=a3x3v7QaQzonymVnxrEP7O/qJs
	Lmkhg90XvUnvaj66TQyYDD8vrR7EfWsu9+YmWANEPIzPa0d3Xob1oJDsF6tKtXslKoLuJPvxzkwaD
	ghBxrZCh+x9Xub1kNBKysEZ/8vKukAGHW1hte568nvRJep7Jtvgwmc4L+mutHtfqogqP+zNxkPnjU
	677OL1CH4tCOv1BlGF9zjluyOQkNbFP0yMexCmNfA5dr375c1dKAI8bLX5tn73xtq6HKVb+m1nMsO
	R7jvJ3oTNqdTUns8OJsiQjjW2JaLLaiuv/e6xol9KyRbIj9YtRJadFL8w5SPvbeDrOUD8b9IXwW99
	ZiH6JN6Q==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQn-0001s2-V3; Sat, 03 May 2025 22:25:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] Correctly implemet the usb480m clock on rk3036
Date: Sat,  3 May 2025 22:25:28 +0200
Message-ID: <20250503202532.992033-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_132556_295077_F5DA1EB0 
X-CRM114-Status: GOOD (  12.23  )
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

In the original clock driver the usb480m clock was "stubbed" as a fixed
factor clock, but instead it actually does have a mux-bit to switch
between the 24MHz osciallator and the actual 480MHz clock supplied
from the usb-phy.

Both the register layout, as well as the implementation is very similar
to the rk3128, which seems to be some sort of cousin to the rk3036.


Heiko Stuebner (3):
  dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
  clk: rockchip: rk3036: fix implementation of usb480m clock mux
  clk: rockchip: rk3036: mark ddrphy as critical

 drivers/clk/rockchip/clk-rk3036.c      | 11 +++++------
 include/dt-bindings/clock/rk3036-cru.h |  1 +
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.47.2


