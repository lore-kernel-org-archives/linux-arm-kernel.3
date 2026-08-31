Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4897AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Unxr3BbyQGkGI0cPruc6eSumydLU0CJBjIYvcTDq5Qc=; b=ILzG9DOHZ2orJJ2zW3bzYhx5r1
	dp3rdt62dEsbnrWCMDm6lkONBfWqNHWrqrMPKMs28Q5xYtBmOCZlEzC0jYs5MSbMhz+edpnvcX8on
	hrjCYalBAeO+2P1ttV3IXaVmmCnEpNK45nJIJvDD9e7xODuQH/GEqhfFObdG9QcB7SnqNIO5Lpmt2
	cMiN0E1NJ5xnUx1WmC+8yFD8Kb3sJJR8+qrMLKwMVz/Swxt3tMc2XWXiCLeUHk4/kN9UsK+phj47l
	XE4A7jZ0mPWMegLaWI3DTTtt+tXKyxzIc6WebYXvJgDDW6Kftn64Tp48cLhWwI2fRWtRAe5moBXcu
	UiAI3lHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BkS-0000000AgjB-39ZD;
	Mon, 31 Aug 2026 23:49:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BkR-0000000Agj3-0mZS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:49:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 310A5601DE;
	Mon, 31 Aug 2026 23:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AAF1F000E9;
	Mon, 31 Aug 2026 23:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788220145;
	bh=Unxr3BbyQGkGI0cPruc6eSumydLU0CJBjIYvcTDq5Qc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZW8hiMNRQlKPNHk5SB6pekdpxoh5wqhetiSHQDU0LUepKpz064MG3/YKIwp9y0trv
	 j6xjzAd+bYb0/wUHzxIk2f1bgu2LsO/BAajf0gHOKFURgbwn9I+8M64lyxK7P9G1u6
	 Sx40y7ZAqMp3ULpATWYPhJDo3tv2PPw9qamTvIe7jr0bwXTtQFBBKiudRR3LfzAbuD
	 SmrejKoobgfCHCgXkVZtdWfQp+9kXTwuVayRkUlNvQX/IvNL2DuQX8tTXNfcHlhvOz
	 WRqWDHg1pt2eUV4MwWCau0RBtoaND/ZwJvKyUbIPtC7+oFaswN+2Mg6UTNKIlsncX3
	 2+tsuaSU91HoA==
Date: Mon, 31 Aug 2026 16:49:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 5/5] selftests: drv-net: Add VLAN test
Message-ID: <20260831164904.325ed438@kernel.org>
In-Reply-To: <20260825164522.4244-6-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
	<20260825164522.4244-6-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 25 Aug 2026 16:45:22 +0000 Ovidiu Panait wrote:
> Add a test that validates ping traffic over VLAN interfaces. It aims
> to catch drivers which mishandle hardware VLAN tag stripping, in
> particular QinQ.

I take it back, sorry, looks like AI found something to complain about:

> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    set_ethtool_feat(cfg.ifname, feat, {"rx-vlan-offload": hw_strip})

Does toggling rx-vlan-offload here actually change anything for the
802.1ad and QinQ variants?
In net/ethtool/common.c, netdev_features_strings maps the two RX VLAN
parse features to distinct bits:
	[NETIF_F_HW_VLAN_CTAG_RX_BIT] =  "rx-vlan-hw-parse",
	...
	[NETIF_F_HW_VLAN_STAG_RX_BIT] =  "rx-vlan-stag-hw-parse",
rx-vlan-offload is the alias for rx-vlan-hw-parse, i.e.
NETIF_F_HW_VLAN_CTAG_RX (TPID 0x8100). Stripping of an 802.1ad S-tag
(TPID 0x88a8) is controlled by NETIF_F_HW_VLAN_STAG_RX, which this test
never reads or sets.
For the st_gmac/stmmac driver used in the commit message log,
stmmac_rx_vlan() gates each TPID on its own feature bit:
	if ((vlan_proto == htons(ETH_P_8021Q) &&
	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
	    (vlan_proto == htons(ETH_P_8021AD) &&
	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
and STAG_RX is only advertised for DWMAC_CORE_XGMAC, so on other cores
the outer-tag stripping state is unaffected by the flag the test flips.
Also, set_ethtool_feat() in tools/testing/selftests/drivers/net/lib/py/feat.py
only programs the feature names the caller passes, and _setup() applies
them to cfg.ifname only, never to cfg.remote. The TX counterparts
(tx-vlan-hw-insert / tx-vlan-stag-hw-insert) are left untouched as well.
Would it make sense to include the corresponding STAG feature in the dict
passed to set_ethtool_feat() for the 802.1ad and QinQ variants (xfail or
skip when the bit is fixed), or otherwise document the limitation?

> +
> +    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
> +    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, inner_proto,
> +                host=cfg.remote)
> +
> +
> +def _vlan_variants():
> +    """Generator that yields the VLAN protocols and the stripping mode."""
> +
> +    yield KsftNamedVariant("8021q_hw", "802.1q", None, True)
> +    yield KsftNamedVariant("8021q_sw", "802.1q", None, False)
> +    yield KsftNamedVariant("8021ad_hw", "802.1ad", None, True)
> +    yield KsftNamedVariant("8021ad_sw", "802.1ad", None, False)
> +    yield KsftNamedVariant("qinq_hw", "802.1ad", "802.1q", True)
> +    yield KsftNamedVariant("qinq_sw", "802.1ad", "802.1q", False)

Following on from the above: do the 8021ad_hw/8021ad_sw and
qinq_hw/qinq_sw pairs end up running the same outer-tag configuration
twice on devices that implement S-tag stripping separately from C-tag
stripping?
If so, the commit message statement
  "Three VLAN configurations are covered, each with hardware VLAN
   stripping enabled and disabled"
and the module docstring entries for 8021ad_hw/8021ad_sw and
qinq_hw/qinq_sw would describe coverage the test does not establish, and
the QinQ mis-stripping case the test aims to catch would pass in both
variants.


