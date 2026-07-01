Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB07C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAa3tcovunBLoTdkZwtetv/3ICXAYv693JCDaK4o61w=; b=mRlUV69PWQTZ1u2wE1P0VM7iLE
	FZILQNBl/dQobqF2VU4cw9i9z9gxdAqVFKVRR9PjdvAclnZ0uSkybjTV0KxemQTnxJjQ6Nrb8wh/H
	vIkChOURakvFN48IDnbN21XDr08uzQ8A04LUgBh8kk8AHqqY+tLRrdWiQpCdPKX/vcSroC5oam/2f
	jXB7o7tyd+o3gW0IlenUiG19fmQASFeXy/mgqK9mRfMwKLSWuh+4geZ/MdlCp+R7q1kMBuzSixnt9
	PxK43mU9GmtLLJBeDHQc6N0AyiNLUzQXM+K4HzrQbXMp2ExDRepy8vtVuwPni0Yhk2wazQGNmWRBD
	h9Eol7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tn-00000003BJl-38Yb;
	Wed, 01 Jul 2026 23:36:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TL-000000039y2-3CzB;
	Wed, 01 Jul 2026 23:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=dIroGrHc9sFXK1bNgNMwSvW11AbDOuZpaYHkw2BWwcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iX43+sf+m0Vpbou+yCxm8NfivfbT0cngeHGRsH52lnpp8XuJ4BsNxdUYBUp1blB37
	 KoUQtxiolyLqQ8X7904dMsCjXKOrTHUORiKBmznXvM7e/xxfBf86y/cwO5Hg1oVix3
	 WwWMg03bp/zxIO0jXfz8GeDhxjjhgFC/+e0zfHc/CEbYA51QI5kon2u8K0UO4MnVY5
	 8givIgo1g2S7+HYrD7JxJZWywzaAega7jbrZSKSHoOzl9qw+wdsnc157qHl1vjslP2
	 f/54jhauZXp/npfWj4cg3K+ckmbQNXGioUAfCeVb6eMR5LjCL50Ii6khY63IY/Klte
	 vjOzcc4yorBMw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E591317E35E3;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D194C48006B; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:03 +0200
Subject: [PATCH v9 25/38] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-25-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dIroGrHc9sFXK1bNgNMwSvW11AbDOuZpaYHkw2BWwcQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFRRAhumZ4QbtEL4NGs2RQjMZXWti6n9W
 8wYg6SoX1V7BokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaa8sQAKh+ZneJ3Wt//kUq2tquvEUjyeA63OLGbClfj+fEIrxcnAgkwB1ZA1NEGgIp8DuBuKd
 VsTRsh8rHCsMhhl2o9tzZlTsr3pf28TxLkZh1oJ73/eJyJhe7uWYxSSsPKmggy36QHoOoZg5cdU
 SJZsDnbOUjcduT1Bu5oT4e5fEv41v+iXw4w8gd9MrbZrTPFaX1WAs7XR90pyksVE4/Z2hL0RILl
 C62uU5ZtP5umkD3o+oWWXkI8qJj0S114GV7m1Wr64i2kcvZOV/xts99VeOuJ5Ug+xvvwtegcvva
 wFfbFLZoq/GBJZOwEetcwJekgk6si8aPhyYgmQzToNFgxsn89RzOp/0Xc4icr48bNcAtXNCzU51
 ImARkJMWu5v6XRdlYuaMuFXNJ78bH2A2WUd4JIYuaV+VF5PWIp4SceO8m6B+txYLIPSCBV9Q7Hu
 KSaMHsnudYnYsRFvPGEwpXZnV7yhEumlepb6IdmU3NVu5A+OvURmZWxgukpcP6d1RT2XhRQBTzr
 6+6cLDdXAuQP4heAlMcETstKC6iGIH8IccmqbVDgX8sQmM+s+avv07F/s5Z/KpPvXEYp+F2CfZi
 yY2o80pLQDhUmMD6WVvctqeWJ123a4m8jk/Y1w2SsfB6zws2d5XoaCEEtXrx9as1fSK0kgv+iC4
 7flpJSEQfL3I4qrDjEywzTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163604_011870_1A165DC3 
X-CRM114-Status: GOOD (  11.27  )
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

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1a983c1cef4b..c874dfeeece9 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1190,6 +1190,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


