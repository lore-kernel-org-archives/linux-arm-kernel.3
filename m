Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF3EDF172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij1j68evF+RVTznYCI+JIcMwqalnsYaa46SaQhqSPec=; b=uOTKyxyTbHOQ10qI7A5Q4hg6g8
	mADjm+bkJpal0vT4hJe38bx0Yk06ICftkjptnQJxGJ8mQkzMBepbV7Ing65BotSjZ/J5rq14ZYlOA
	LUH76Zwm+9FwaqUolqWGt+SdRywQvnYP6ToEtePVbxchfeHJSrTOrZ3gwRRXfEMe5H0sWoBcGyxx0
	GBiGsXpPZTwV6zWQZZrXronsBNkjhOyJTpYMtKhBOuUiHeSyFvmxdQlHiUMJAflPOBGHtonCyo2no
	q3NtT86PuJiYiRTHZ4EmCkiQfttZmLo3kBASBJ40sSm8LygN7vqO/WvEoKtew9Tf11311ZBMM2dlr
	g3FDkt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKg-00000003YWG-3ARk;
	Fri, 13 Feb 2026 14:39:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKV-00000003YLQ-00K9;
	Fri, 13 Feb 2026 14:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=dbmD73BoFx8n8ji9c8pKJSP2kyDhGv8dKwkqGb0zmWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pzB+xnEDEuPr/TFEiOu4rkMCXIkKAPHkB/0K2Gb3cm/zHwLBGeIjECq5PtNCizOmc
	 CfWXI0BwZV7bd+UlMjpu5oH14BmLVOdglfpFrfFWcN4iEMRgWXm1HEB5juX0P+y/kU
	 TgO2z+zIyi2MsRy3G9rpze0MTKcwr+V6iaR2NUtNRKPaiDvXi8LMhwWaxHeQ+DsfIn
	 MreL/EKE8Q/sdEIZkPhLbveFrrh5UMW7pyFkFwvHoOcEMMOHPumklCKEvoish+twEt
	 p8O3sRDeAoSf89kfd+yGln0DYYvGEppWi1vuMlrBW63SYUiijUAeUix7CDgjZd2LZ7
	 sEjD772b/ILJg==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00E6A17E35C9;
	Fri, 13 Feb 2026 15:39:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A3769480026; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:25 +0100
Subject: [PATCH v2 2/9] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-2-b67ec225f96e@collabora.com>
References: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
In-Reply-To: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dbmD73BoFx8n8ji9c8pKJSP2kyDhGv8dKwkqGb0zmWo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6IKL3g9Xg4uHD3m3XJ4FYx+rjvoxp8Nn
 PZI4qPvLtn/sokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qamMIP/1SyV/tn5Qk3Iz0vOkqblDl1EZk0ZLi9R4wyaPyHRTr9lmiNSJqGPzMK+HzUCbw7PDn
 V3mJB/qw95Jb2vC4HPlMVFUpsa0QcdAxszqQp4/qAKqwUnN9LC4FICd0GsK8w8flwDDq6+C8tvL
 dAsOgnkfmWyBAAp0474Xl/ha3ODBcgVF/pl0XX/SPOQIs4P4slvL74DxDkTvcaN9bRkM9O0crDP
 C3HGS+6rdtC9QKDc2WYxL6N8YXrkEZOm9e3GG6GZdPPgOR0hLUZNddHzKC0nsKThJYPS0+iPdCR
 mlGNVzUxx7Lqmb/YtrrvGY5w0IzU9iid5Z3y6Bew4q2OLQN5AdDMwTkIi/z2lvf7J9FOinfoEDs
 Vze5uMhZrKbBBaWmeKNvFhVc2GXK0HTrjPozzioFxZ3hyQ41PRM6VN5vZ3srwsfJ2kDhz2lcrvt
 KBepDgcB5UUrHxHEDtfOGpNbnxKmP3Kgxa8mW4I/i/oGyew5NMig6T2ZlpkVetlsJ9cxDQpVTjZ
 JBuknTXMUAXPVNpjk+ZyVl/C2rrtssydnsnNeOY4I+OzIt9WIEE6BtD+so0I5JED8ZOBuulwd+M
 pZuiGaCs7/cIqutYDIuncAlr8QgAEd0/aFB8CsPte8WWxEqz5E5tYWjSSneMxDqKXQ26T01aEJN
 kcwsy825ypADI6SVMCWYwjQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063935_223327_D2094F03 
X-CRM114-Status: GOOD (  14.57  )
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

When a mode change is required rk_udphy_power_on() disables the clocks
and then calls rk_udphy_setup(), which then enables all the clocks again
before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines, re-enabling
the clocks is just delaying things. Avoid it by directly calling
rk_udphy_init() and skip the clock restart.

Keeping the time with non-working PHY on re-init as short as possible
helps (but does not fix!) a race-condition: The USB3 controller needs
the PHY running to access its registers. With the PHY stopped, accessing
the USB3 registers results in an SError. The re-init is usually
triggered by the DisplayPort controller driver requesting the DP's side
of the PHY. If the USB controller is already running at that point
(which is usually the case), the system can run into the SError.

A proper fix requires some API to lock/pause the USB controller from
the PHY side, which is a bigger change. Luckily this workaround, whichis
sensible anyways, I didn't manage to run into the SError. This is
most likely due to the fact that the DP driver will enable the DP PHY
directly after the USB-C cable is plugged in, before the USB driver is
aware of new devices being available.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 744cc7c642f4..98562a888b42 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1012,8 +1012,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 	}

-- 
2.51.0


