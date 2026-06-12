Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5AECD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNX3U74PfTB3DHUJ/LNNS4CPtr9HnJIynsxmPVqqP7w=; b=AyPRSammaZxHtxAbq6Y368fbCl
	EI23x+I4nF3lEbp/SxsTJa8k6tWSbz4L6KLfIwDndsOeebYfQyngZFVHjpxu3TNUl72QZKkDHCNFF
	ezAYCJofT1rsK2NBCJbfvkKGlsmlXbCs4jN9SplUuCZg2WDQqxbuVeIJqzekH51wXJVppXtXR5OEL
	P3GwcvsJA9+hxRwu49XbO9vo3fwZeuGpf4lN6PCUJTX+T313L1LMeDauwPYMT5mcSX3Pr83KT+w+v
	dHAFvYrAzvK/nZvcgJhp4bA47bwcwUlC/nvrwrL2mZUAuitd+fBiRg9WKH1n+36GZb6yEZ1oBejvM
	//aV8l1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dv-0000000BE9X-2HrD;
	Fri, 12 Jun 2026 16:22:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dp-0000000BE2G-2Bve;
	Fri, 12 Jun 2026 16:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=6bxQYABZKbSJROsP1Uays4rg2nT4Vn+8RVnqtuNva7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KQKrtJpcHpmVEGPkr+aQTwiTxBgl0c5zw6zx1eaqKEuCx6Lnn7oUQ/bQntGwpG1Zt
	 gBR53yOH31Lypx+0J8+hCK2e/mhAaf/f5vXtYkTj9/QYFUkdLIaStMj7dCWNhyqIYm
	 hkHvc6cLHbFVabXOPvuI2ZaBjPdDujsNF4psXRiGgNTs0N5hV5AAICw6VVfIpidTt6
	 7DutdiG8KWZBAjp6LxAzdLJWyejdC1AcipeaVXfNk6TsbpLiAYYwWaP1SAhgatGQGy
	 pNS3CUs7luRZpkDJvljNPLZGmvxA0OpPH3KsJ0uBNxhBJOhi53rM4IVvIzaJNDmbuj
	 RTlzrn+jwrjQA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22A0117E0D68;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C6B17480029; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:40 +0200
Subject: [PATCH v5 02/18] phy: rockchip: usbdp: Do not lose USB3 PHY status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-2-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6bxQYABZKbSJROsP1Uays4rg2nT4Vn+8RVnqtuNva7E=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEt7UHbgzfLhaycF45fGDIWNFzbqyxdj
 K++ZKUQa4KaDYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qa0tEP/3xB9+iORfCFLwmwnyEg1raSSUMzZKaezpcK18/vLz3HSn4An8QZQWMhKVDPxYdR5LM
 w6JsvOUyHr2EhUJ1T4Sh0Hlwp82h3+lXGQryOg4J/4XWGoDKEmwhQ2elEykMxprGQrJA/M9y2UG
 ItT9UJ+CsEnCcmpk6w8KP3KSy3X0Gtu6CirDA0BTsWseviYjXHBYArhsvgFTBfyxaaEGoIu0Qei
 hp3jJXmCK3+dB4SV101EXc0y15RI39rTGHAuAF+fn+fvp6E18Il1cyQan2VcR7zjkTLRkAps+Vs
 ZMBwdxxT0U7Jt0AeOGN2IMJn4/ccXxAOv4oKjX+rEld5uhBigIpft8OJJM8HogU6pFUuofW7sdD
 lJSRF8zYjTrTx1/J6iFGCMTUYSYoOvLEls97dTTtb4rfcq1QBKQLOehTdbcLWT4CNADHwj2/93o
 5fpDit1WwN7ZsWMJNYNsCJJ27i+sjDTlmm9UOWQuZjGiTTqN8TjZ3HB4xxhjysFUCOylhcBbgX6
 JXORT/YJhGobkxjWpNsxY5gbwlnIOfBmn2VuBCyOuAE4dWQc/SGgKk1GpeN2+wOtuU8LltcQZyZ
 X/iTmI0cN/a8DSsJCSQlEbz+UGW0rrnV6J2/C1tY/E/KaZxQz1TY7lDtYm7aWRVYQaKoRiBA0LH
 PcbnqgM2hBIm+dk9Fsaki1g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092157_715902_35453759 
X-CRM114-Status: GOOD (  12.36  )
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

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..744cc7c642f4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


