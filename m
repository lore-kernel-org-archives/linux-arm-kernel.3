Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155A3C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4cuZR2OeJH9U0xo9iqQwKBOuSBnLCscDjqcJkUSqVlk=; b=hMC8U41TWLsMl1Km5DdXG7rWqp
	9w9xgmCOJU2VRYV9/GbXQ/cyOFZ+0s3d7hX/eHHiaaCS+Jdm/k35VLHK49hd66eg7jF04X2bnVI0Q
	yM2Cg6+rWrDD6Xc0/7npru+t2ia4sBXuR+UGkp0+rTGcC3cwwI8LYjv7YrBJwBVnTGkW+mMAksYHh
	+BuXCC2cuoHhkZqORFTRtJbuyIfexwuDRNFmIY0KtuOvTGMP3YUKy4b3IOIhlFK/fWPCodlECz9Tx
	3Yzpk/ThcRWHicVNf0p13NDMp8tg0LRBGiDPQHdARcJrxFUjbKEqz91daIL58pHYNhSGJR9sboxfs
	XbLdrIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT1aR-000000003ND-1FCd;
	Sat, 21 Jun 2025 17:01:03 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT1YB-000000003Ec-2mdI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 16:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1750525121;
 bh=4cuZR2OeJH9U0xo9iqQwKBOuSBnLCscDjqcJkUSqVlk=;
 b=FFK8NHgQ31ekNfm4u/gEMUnu+arZHGBeICnZcwormlTzeGgUHp7RTxHAvi65fQ/oyahysMyU7
 Bev4WfdhxEihd3Y8MGixvmFNbxfCufUssYi/d9dKX+jVNCFwez0BKGJW6Grs5jFZFu/W7+9yH+r
 TisXaNByNgCgHrj61053DTz1Euh/0GQwrZo297nb94//7V5efIjbZ5DMH3wCzGW4O2LJdGnhXQU
 1ztZa+K/4e3BT9mti8+a+rE+sghTc5JvMDdKkK4W5ONj/FKJ+DdHc7ZxufjQP2yqIDdE82NrgR0
 dEPMKsTBkMhTleSOnLi717gqMEiNa39EVp2WVZpwEGlA==
X-Forward-Email-ID: 6856e4be9932e6905b7c425e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix eMMC HS200 mode on Radxa E20C
Date: Sat, 21 Jun 2025 16:58:30 +0000
Message-ID: <20250621165832.2226160-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_095844_095156_62333588 
X-CRM114-Status: UNSURE (   9.41  )
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

eMMC HS200 mode (1.8V I/O) is supported by the MMC host controller on
RK3528 and works with the optional on-board eMMC module on Radxa E20C.

Be explicit about HS200 support in the device tree for Radxa E20C.

Fixes: 3a01b5f14a8a ("arm64: dts: rockchip: Enable onboard eMMC on Radxa E20C")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
This also help assist boot firmware that consume Linux device tree's to
use HS200 mode when booting from eMMC, see [1] for a related U-Boot fix.

[1] https://source.denx.de/u-boot/u-boot/-/commit/f8cb3fde935ed003ad1d7cf6a06d59586fe65cd5
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index e4333674a0ec..12eec2c1db22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -283,6 +283,7 @@ &saradc {
 &sdhci {
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
 	no-sd;
 	no-sdio;
 	non-removable;
-- 
2.49.0


