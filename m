Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FC6CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QzLW9awd3vNvuf8W7Wp9CCWT/0H8mh0rC8ZP1OwiNJU=; b=Nl9lkkap/s9ewdmOeBfsYfdfpn
	pwJSJIwVQu/hUdfqqZkMoYyz5YrcPgAmyfj14d4Mao7wXzGxS4zJ6hn9gAFg8JRQjVwc+mYkYQsGq
	lUVJMfQX9QN6ZAIzS23KgsqcVkbmGvFIudIIwIDbzIeCm0AmbYSqX7lHF5jUzups8+0rvMONMR9lT
	RG7VJokrZEe2Lb9nytUWwmOxdFbvcJmcgY6J836/AnBYkSYTUhY/OnjCX1fg/9YVxcnsx8PWNzuH1
	Lcqv4p7+ZovwtCd1U9avUeLHJNBX5MNCDsccmaxm5rQEO3I+V56sKflv00U+5Dv3vz2KfxUVz3139
	WC2XbjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtF5-000000061qv-396o;
	Thu, 23 Oct 2025 11:12:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtF3-000000061ny-0oCo;
	Thu, 23 Oct 2025 11:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=QzLW9awd3vNvuf8W7Wp9CCWT/0H8mh0rC8ZP1OwiNJU=; b=jxOik2Iddy1l8boel5Qj+SovlW
	6L6KHxuhcFY2dxzF7oicpue7dI65N9ujwppKiB3/W0f3xtbBqIBF0PeBWNMYzhUUPNgjoKznsV2Dt
	0evKfS5WcJ0LCf03+3teWCAwRsE35awUPn1mZu2ZpmyX3WM6iTce+PmAuiEWtj0Sr7PXjS/8djHqW
	ZLq6LrMZlxHsYWLkVFPT8viBpmojhaQ7OLf9d8WmxsSpIozsEA6A2DW5zrUhIguxi9FWUR6F/3mg0
	QPu4gfq1My/HFAmssnRBaG5e0I3+tJAfzGJoExZTw8D981mchzsU6UWkppPGf4qMLYPHWaVCgMVrb
	yi68s4+g==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBtEt-0002w5-NZ; Thu, 23 Oct 2025 13:12:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 0/5] DWMAC support for Rockchip RK3506
Date: Thu, 23 Oct 2025 13:12:07 +0200
Message-ID: <20251023111213.298860-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_041225_247036_20FB1278 
X-CRM114-Status: GOOD (  12.47  )
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

Some cleanups to the DT binding for Rockchip variants of the dwmac
and adding the RK3506 support on top.

As well as the driver-glue needed for setting up the correct RMII
speed seitings.

changes in v2:
- add Conor's Acks to dt-bindings
- add Andrew's Reviews to first 3 patches
  I didn't add the driver Review, as I did address Jonas' comments
- adapt to Jonas' comments in the driver
- add a patch for a MAINTAINERS entry (Jakub)


David Wu (1):
  ethernet: stmmac: dwmac-rk: Add RK3506 GMAC support

Heiko Stuebner (4):
  dt-bindings: net: snps,dwmac: move rk3399 line to its correct position
  dt-bindings: net: snps,dwmac: Sync list of Rockchip compatibles
  dt-bindings: net: rockchip-dwmac: Add compatible string for RK3506
  MAINTAINERS: add dwmac-rk glue driver to the main Rockchip entry

 .../bindings/net/rockchip-dwmac.yaml          |  3 +
 .../devicetree/bindings/net/snps,dwmac.yaml   |  6 +-
 MAINTAINERS                                   |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 64 +++++++++++++++++++
 4 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.47.2


