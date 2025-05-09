Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5611C3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ox/S3wEHdX6LK40h/zbAQGRFc9coOf0nkAtFa2lcQHo=; b=n3DcOehCdURKEa8XLTAnUabfJG
	sUyMWME0dLvJQu7NX9NauFduRpO7kM+3gneZ0m8jWGymisRveaHU6Q8AmQJnZOmrDQwu0nFqwqieN
	+S51T9+5EJyYSex/wGuE7INcuACZRe/AjyquUldnfg/qDadJ+iFUZXuR+OH5tFuVSvbZQs4tPLnZZ
	ceA+j4571W31I6MUtw45IHr29KqJofUmaRTKgo0A92DpNfO2L/LMV8cNIEFWJaXxrga8DNzA3ciga
	OyOPgTGmtocl/r31N5kFE6XIfQE46VCUyq0uDwV/2ME9w6MIvtyVwllyhT0CmqzOo6lpMDyWpWuwQ
	FwTTP6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxr-00000004umO-2jNx;
	Fri, 09 May 2025 21:09:03 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUGW-00000004mD9-32i3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 20:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1746822253;
 bh=ox/S3wEHdX6LK40h/zbAQGRFc9coOf0nkAtFa2lcQHo=;
 b=jdEgIrP8zJXhCI5GPgU+oH3ReZGfn2B/IudytCqRxCYbE2B/Zx+7ekrj+MGnzyk4xssu6rM9g
 wLUnk4Gg1KriYU7YvyHfoOYRkZqf4r4b7bSBouX4Jj9qwvs0jI5F8gaLtbp5nf7qoL5RgHFZU/j
 +iEdHNMlWWgVp9ggdIosUKUj2xbYZuDb2BouJPcuEGjFftscIebUjSMjkghr3k6EydIT1DhDPV5
 qEDV205qUR1K2sYfsaPuelnWsgcsi9Wsn0uNM7JkugXV5fAVUy1f/Nof/WNJgySzUi4JyLYCGED
 a5wUJLIziqD2tAGNwniA+K6+9k7E+OdeV2UtkR7ib93w==
X-Forward-Email-ID: 681e6468b323f1ffafd05d60
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Date: Fri,  9 May 2025 20:23:56 +0000
Message-ID: <20250509202402.260038-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_132417_172466_043F3EB3 
X-CRM114-Status: GOOD (  11.66  )
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

The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
used with the integrated PHY and a second 1000/100/10 MAC to be used
with an external Ethernet PHY.

This series add device tree nodes for the Ethernet controllers found in
RK3528 and enable the LAN interface on Radxa E20C.

This include a gmac0 node for the 100/10 MAC and its related integrated
PHY node that only have recived limited testing. I have no board that
expose an Ethernet port for the gmac0 and the integrated PHY. However,
the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
this relate to the Rockchip RK630 PHY. A proper PHY driver will be
needed to support any real use of gmac0.

Changes in v3:
- Rebase on top of latest mmind/for-next

Changes in v2:
- Split from the "Add GMAC support for RK3528" driver series [1]
- Add ethernet-phy@2 for the integrated PHY
- Rebase on top of the "Support I2C controllers in RK3528" series [2]

[1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
[2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org

Jonas Karlman (2):
  arm64: dts: rockchip: Add GMAC nodes for RK3528
  arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
 2 files changed, 135 insertions(+)

-- 
2.49.0


