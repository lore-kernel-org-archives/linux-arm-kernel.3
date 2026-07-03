Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A9FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfbtgZL65NQ/aP4ZZPYW7iWf1i9y1+/TRa7DmydT0W4=; b=hS6flalRTCoDdKpv1IdZxfyYe5
	C2PHsFNvmCCnteE+JftE9g/33StnUXwxYqTD4VeYg/YmUtBriz0biLFe3KUa3bJPdGFYylHh28+NS
	DDxnYwFejggTqMOygEbCe75zJEphDgD+jLT1povPnhoLQlVWMpNjhZJRMb8H/nTLp8WMyTi3Ofcqi
	q6vYV03Tz1uHeggx6ul04rC2ipgH29yft8I+XcU/MhXI62h44ET8QSWRVcdEOXxNtLAoXGXcT/z/t
	uHLCYr/ecFI29ha8MYzrTuqGQ6PmXrlJtFlAET+qI5SAVGTBEeXcgMMd8rMBLhz3vJGgjSFzMtPol
	UJbbmcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiP6-00000007fNn-1EI2;
	Fri, 03 Jul 2026 18:14:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOX-00000007dom-02pu;
	Fri, 03 Jul 2026 18:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hkuZWXkIU12d6KGfboiySFMfsCL/h+1ITGYXnDzzM94+eKZWQW1gCoo5yjkfygjRG
	 1yp+8asEyPPFdgjw/inAlbVzHksItYCm9sfORE5Kznkgh3Tsogae8xtd7WOLbCAAeP
	 UalnJY5mnlezwqp6waq73plAt1q2WA8gGK3++/ft6VyIjjEbcXIk42QZlN45KfWCQt
	 X1bXEa7Rv49wkHTE05s7+qClrXAg6RHYT5kvRaXjLChRUorKaFFT9QKM4JkCACvk8S
	 os2suuz7oWQ++v7p42La2Pkrz5yCrIR/1nQyBsXjrY0XNmPQhDUCGkbiKtNW7FVEsw
	 Z2L7kXeGOhNJA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFED817E1531;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9D9E148006A; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:40 +0200
Subject: [PATCH v10 24/36] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-24-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8vogGbMd3nXWtyPpN7SliWADNinIJaRG
 PI5f3LQxqFotIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaCwUP+QGjpdJFqM5Xje+AP7NSFNGS9zeKNJk6bnktHB8N90FiR+Zs3wdvPHli1ccrqoLvQnP
 F0F6hCwMW69wfJ5izJXFauSVm1VTG/lf7YgcjeocwSEA+ikpS/hb/E6JXqfA4/VnPgUzAspzlKH
 xjko/nlhSbyA+81Eg1nVX2Q209bbvPsYs+poCPd0uVqhTlkytvr9v6gl4lUxekU4keGpSDhbWh1
 bT3z33Bwt6FT06mMi7LVoarWFiZ6GLVNKnvHiyrhX5fP27oD8Q6O5/zjVcS+sJhyx1MI86xgymj
 sstfuHQbaNkYxxtrlBtCq99LGsnTHYZZHiHYMuN6crqL+ZgRVZA5WyoXT/2Cn0UXSqqvZKwcpVe
 EhdDxFYLWH+TXJ7RZkyyG05Prp/75u2uqzbhECAQugoBcpTHo2V3uyzuMbFtplDA3qa7jhcLIA2
 RVqQdCZlAVNZPiCEFLQ3WgH/1pCS5l/NSEIw2x5d1owgFcPoARApgXB8HMHCYZCncuhydVyTiZK
 kvalVVtz1mI7MdkaouluapfUU7e7VDK8tUbFZzGotoR2ycyn4ceUVdgTsNtlYknodDp6iK6jF/P
 8CXaKMgSPiBsPIpBblsma2HVtcExyMpiYNmzzfyc7zNFTHupqZpsUWKtAC78YX08dwAmN0wC//U
 XgfNBydaA0GaRk2xXivkrgQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111345_257813_52C0D8B6 
X-CRM114-Status: GOOD (  10.78  )
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
index a742bde7155b..cd79c5da566a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1154,6 +1154,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


