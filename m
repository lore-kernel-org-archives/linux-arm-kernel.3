Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D1BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sDXS6ccmXHM7aVTn2W8PvKDj84puFXbx1PJBmmh83iE=; b=nTqGAriL4t9hz8UbTBpvdldUXq
	PNauOZNsAsVi+V3ROFrZSa0YvsznlvmE/qdUq3RbybwH17SlASswuq6mJQjcvpTA0tPYD8Nm9/XP8
	vsiUHwr0snSbvFgwTkQNQcVdrMt73NDtyHmo/5Xog+rI3UW2WZngVYGEpREj4lOxLJ6UTgZM7ubib
	P/g7wOVQ0T7XnrEgpsX7xUK2QQVNEKWZW99djhYnaGmreYcedaHfES030NYXmO1cPF1urgRn2aX3T
	T4skuudz7SWs3ZCWd/RSFglcen+aheg2cW0dX0mKmTvg1/1SBVMo1Vhyzk968eNwsWFptgmy10vs6
	u2xZBHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIWA-0000000CEND-06Iu;
	Thu, 06 Mar 2025 21:12:34 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqITk-0000000CDt0-0H9P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 21:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1741295403;
 bh=sDXS6ccmXHM7aVTn2W8PvKDj84puFXbx1PJBmmh83iE=;
 b=GcSfU1J6MQJVYBaWh2Eoo1hyFfeqEePJ8ppWLTlZJbbFJfzBiU7t5HSht1Paj5UwG7l1Df3FK
 jo4d8BHltXjiyCr7rSg2xhfBT5J9mTAgUrXi3bsmZ5feKOmD2sTE2nYx45lFdOvGCHn+uonMZbN
 JW5kpyArRG7kJuqMfWw8f+GH1JaiBASPvkGLEvdleVAwp88ghgfHtr82TR1heXBF0P4JvmgONRV
 WkjUHR/LhP2ZF6lxEk3W/YSZBnb+Q37OlgjKAsD222UrWD9TAl1modVxgp3T0+CAU7dIgOsW5IM
 yg8ekWZE3vuRxZplG3pPyx549lDsL3CY8/5bUKCmySyQ==
X-Forward-Email-ID: 67ca0f24ad3e70e1cd99d7f2
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe
Date: Thu,  6 Mar 2025 21:09:44 +0000
Message-ID: <20250306210950.1686713-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_131004_136120_0AD5A525 
X-CRM114-Status: UNSURE (   7.72  )
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

All Rockchip GMAC variants require writing to GRF to configure e.g.
interface mode and MAC rx/tx delay. The GRF syscon regmap is located
with help of a rockchip,grf and rockchip,php-grf phandle.

However, validating the rockchip,grf and rockchip,php-grf syscon regmap
is deferred until e.g. interface mode or speed is configured.

This series change to validate the rockchip,grf and rockchip,php-grf
syscon regmap at probe time to help simplify the SoC specific operations.

I do not expect that this will introduce any regression. Prior to this,
use of a device tree without a rockchip,grf would fail when interface
mode or speed is configured, with this use of such device tree would
instead result in failure at probe time.

Jonas Karlman (2):
  dt-bindings: net: rockchip-dwmac: Require rockchip,grf and
    rockchip,php-grf
  net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe

 .../bindings/net/rockchip-dwmac.yaml          |  17 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 269 ++----------------
 2 files changed, 32 insertions(+), 254 deletions(-)

-- 
2.48.1


