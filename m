Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F42BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=59AbTfsbJ8BKP/Y9A5bkq/pQV+P5x16v9MWoFB6Ie+I=; b=vTjM7mlzF/HrcvM9E2+EBkqiIT
	sfeeXs9z9ysDwkP5jcyk3nQNKVxijVMGUFK8sMr9fE9qxKsa3SRlAzGKEhFEXK5pJGR2ouJFcbLwv
	F5DHVjZJhKBt4JL/SJ5TNMZycDWwx6a+b7c+NERASkeySSX7FWmIWpY3R562U7h3POOWwC0JKy0RU
	N/OVZZGkToGoIzaVUXdbe9Lqz54KMEE/yDHbUYrGL62axgJHXBCaZu4A5MNdW7D+R2om3q0mElEt8
	hMnEaFPMzji/7kxs+LRewcuYSNZrUO+lhqVvipMAswz5T178osyzgU5j3dgrMTeTIiZ4FH/rObFoh
	ptzI4TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6DZ-00000004veD-3LQS;
	Thu, 07 May 2026 21:25:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6DW-00000004vdP-3uUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 21:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 140F7439DF;
	Thu,  7 May 2026 21:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F25C2BCB2;
	Thu,  7 May 2026 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778189109;
	bh=4xVIrB3BoO25kpWCsGNHbaYhrNjLMgOZJqdAM781Ba0=;
	h=From:To:Cc:Subject:Date:From;
	b=sOLHZcyng7jEWIx7N1q/jm8C7FHsoVY69SWitvcQ7M2O3YjaRO9f7ONaz7MrP3Wqa
	 zsOxPtOgvSlQRjbcbARjJBV/yD8Aqs1xPgzFBZLfUeXPOFSEyvJJMsB566vkV3/ZZx
	 5ldy6tithi+fVbc0+oAG5cpq8XutxP0NFtqvrABUuxyKT7A6rXYBpUK1QP6M2cSIFz
	 1CQEpg5eA2oUtBWWEpxV8o0iB8+ibyMDGPW58JJdUU/E79Slein8QzNBNHRCZ3aW6J
	 VRa8cW1ZzlEtBdCkU665GDlHWNTPM4X1S5XsWpDNGi/4HTBxpCcBHux36YsNIMvkfa
	 FiQl6pTFGzUqg==
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
Subject: [PATCH 0/3] [v5 net-next] wireless: p54 devicetree conversion
Date: Thu,  7 May 2026 23:24:48 +0200
Message-Id: <20260507212451.3333185-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_142511_014329_4CF145D1 
X-CRM114-Status: GOOD (  12.87  )
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

---

v4 Link: https://lore.kernel.org/all/20260430081242.3686993-1-arnd@kernel.org/
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
  [v5 net-next] dt-bindings: net: add st,stlc4560/p54spi binding
  [v5 net-next] p54spi: convert to devicetree
  [v5 omap] ARM: dts: omap2: add stlc4560 spi-wireless node

 .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/ti/omap/omap2.dtsi          |  4 ++
 .../dts/ti/omap/omap2420-n8x0-common.dtsi     | 12 ++++
 arch/arm/mach-omap2/board-n8x0.c              | 18 -----
 drivers/net/wireless/intersil/p54/p54spi.c    | 67 +++++++------------
 drivers/net/wireless/intersil/p54/p54spi.h    |  3 +
 7 files changed, 104 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

-- 
2.39.5


