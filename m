Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7222DFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+FvUacTIN8Y3RkgOIyOs/KzPSyRbdzGVppt1ldi77Vs=; b=dYb/hHbI7fDn1CbzGzk6XNkS4Z
	CESHohxDtNnvtkVXzwCO5HvHDAqIlSmoFS9pLcPeAMMJOqmzjCiio9BUUC0svX/VuqSQDEUf/hBO4
	w/baCV0m7FlaBqEFH3+e3l+afQebCQANLT0Bq+6Makh3eQ1Etn/q6YxKR/V/r0cI4jCOo2AOZfr3g
	jpNWFSlmW2Dynyfun1hhPm0QsrACBJqkL/H6uvzil72zBvz9ALIZiiAvan+fOF4WbOkk4KpQB/qfR
	oSNpfvRL7yM4UmMBhZ8BjY7APeYzJYXJlI6zp6NEVgdzo9vKghZ7GfSsGn8XHNHCDOneIqKiWFXhF
	e1U4J6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMWX-00000004yDZ-32aW;
	Thu, 30 Apr 2026 08:13:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMWV-00000004yCh-0dSn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00CC243857;
	Thu, 30 Apr 2026 08:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B149C2BCB4;
	Thu, 30 Apr 2026 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536805;
	bh=S5S1PqKBAesjpTpYEqLG27Nkz48WzA2pnV6rZGQVgEs=;
	h=From:To:Cc:Subject:Date:From;
	b=oTXDE8frxBZ0w5tEZIHa5hvN8xdRvA0EISTX93AgrA3NxlQGMAD1VaitXS/nPac1a
	 NDqMLxS1rJtry5bkxJkDoFYUTwDPNCfsIV/tithH1tVKB8AEWBIKnHvgKasLLXYFHc
	 V5oXyUYjClSY2cvq5edqwTHkSjnN5Pp4rL2dmSrsF5ezCZsCRw6CvkislDoB5AkhTd
	 b57aOtINhJixsjaJVMJt+et0zVDHyR3a25L/YlSHi/lGTUotMlw6Hb4oaldnGLZW+g
	 hZvAkkJJXabPrs41wCYAiB/nMapaW8IKFkKrmLReEDxnoBaAuQy53fyqnRP+Mbuu3s
	 sFZw2UC8/D8zw==
From: Arnd Bergmann <arnd@kernel.org>
To: netdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Andreas Kemnade" <andreas@kemnade.info>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Roger Quadros" <rogerq@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 0/3] wireless: p54 devicetree conversion
Date: Thu, 30 Apr 2026 10:12:39 +0200
Message-Id: <20260430081242.3686993-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_011327_254788_692E8788 
X-CRM114-Status: GOOD (  13.25  )
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

From: Arnd Bergmann <arnd@arndb.de>

This is an older patch of mine that I lost track of. We already decided
a while ago that the OMAP2 platform should probably be removed entirely,
and this is the only known user, but it's probably a good idea to still
get the driver changes in, in case there are other out-of-tree users.

We probably don't have to worry about bisectability any more though,
so the devicetree and driver changes can just get merged independently
through the OMAP and wireless trees, respectively.

     Arnd

v3 Link: https://lore.kernel.org/all/20260427142355.2532714-1-arnd@kernel.org/
v2 Link: https://lore.kernel.org/all/20230404082401.1087835-1-arnd@kernel.org/

Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>
Cc: "Andreas Kemnade" <andreas@kemnade.info>
Cc: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Eric Dumazet" <edumazet@google.com>
Cc: "Felipe Balbi" <balbi@kernel.org>
Cc: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Johannes Berg" <johannes@sipsolutions.net>
Cc: "Kevin Hilman" <khilman@baylibre.com>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>
Cc: "Paolo Abeni" <pabeni@redhat.com>
Cc: "Rob Herring" <robh+dt@kernel.org>
Cc: "Roger Quadros" <rogerq@kernel.org>
Cc: "Tony Lindgren" <tony@atomide.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-omap@vger.kernel.org


Arnd Bergmann (3):
  [net-next][v4] dt-bindings: net: add st,stlc4560/p54spi binding
  [net-next][v4] p54spi: convert to devicetree
  [omap][v4] ARM: dts: omap2: add stlc4560 spi-wireless node

 .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/ti/omap/omap2.dtsi          |  4 ++
 .../dts/ti/omap/omap2420-n8x0-common.dtsi     | 12 ++++
 arch/arm/mach-omap2/board-n8x0.c              | 18 -----
 drivers/net/wireless/intersil/p54/p54spi.c    | 66 +++++++------------
 drivers/net/wireless/intersil/p54/p54spi.h    |  3 +
 7 files changed, 103 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

-- 
2.39.5


