Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B618C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOJrjmE3DJpCebGySDS8tDuAnUCcy/fbgtjv3DiwbMo=; b=e7YSIJGNsca91+5tfl5l3RMHmH
	OPHF9NhtYVQcTF6PL2ovoJ7GzIPef+kCE8sHVWAIZRk3o60BCJqJTFs2WMoZwJGt1pyNabqtqyEa0
	L4X+CrHCFna+/iMmJvYGJrNIVSyqOXeAxd9/SWcRhQwxxnnqCxl602kv/dxFqsthLsCjhOrsBhD1k
	la5m2MSkbL6jhcb+xDHfxY9RZkfe2bT33ktVGOaCH3f44cg8p4+oUfHEcK4/0mXHMLqBRD5oMrbCy
	FjOva4TI+TLeifMpVvfPjPo9XLUn1VBFec3LKMIBkMrcepnl9fIUfEKQ/h6+C3LDAAaTM5MvXI2v3
	B1KEnu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oT0-0000000FZJM-3fGB;
	Thu, 10 Sep 2026 23:46:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oSw-0000000FZI9-2QbO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:46:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5495B43E3F;
	Thu, 10 Sep 2026 23:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377A91F000FF;
	Thu, 10 Sep 2026 23:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083962;
	bh=AOJrjmE3DJpCebGySDS8tDuAnUCcy/fbgtjv3DiwbMo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Cs46i5tbb3ciF5ZWkN7EEJRvUjJloyqmZJEL/ZBCVPM0F4GHHCuarDob2ehN5xvEd
	 C0ERQnirBR2+b0Yy5JCJ0byhgmwdxSpUj4DceDaJCDmHdHmbWxwAcHPUDno5YyArbB
	 y14eRjdQ8faLKie0oXOvm/F2A0h7qgyNvno+WXLehcgB2iIesekpcf1fgoTd93ONf0
	 BSf/g1WsQl5fKesM5+Cn4JqxNxzzWqeVi/l3L04GUO0XM/keBXZBxOFhCq2ZnB00sM
	 CGrP+6PCaROgGwAUQw/h5RyO1fSuK+Xs0/6OkjZcNGYIO02kqdGBjb27nUVRbmfbsU
	 Uq1aH1cJy2VjA==
Subject: Re: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:46:00 +0000
Message-ID: <178908396077.219967.5872377195179207642@kernel.org>
In-Reply-To: <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 1 · Low: 0

- [High] Unconditional S-VLAN enablement: `__stmmac_dvr_probe()` sets
  `priv->hw->hw_svlan_en = true` for every core…
- [Medium] The in-kernel stmmac selftests named "VLAN Filtering (perf)"
  and "Double VLAN Filter (perf)" no longer exercise perfect (VID-…

--

net: stmmac: Rework S-VLAN handling

This patch removes the is_double / num_double_vlans tracking from the
stmmac VLAN paths and replaces it with a new mac_device_info flag,
hw_svlan_en, which decides whether the ESVL and DOVLTC bits are set. The
bit programming moves out of the vlan hash update callbacks and into
vlan_set_hw_mode() and dwxlgmac2_set_hw_vlan_mode().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24d64cce1d87..cd9671493b41 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6813,7 +6813,7 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
>  	return crc;
>  }
>  
> -static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
> +static int stmmac_vlan_update(struct stmmac_priv *priv)
>  {
>  	u32 crc, hash = 0;
>  	u16 vid = 0;
> @@ -6827,7 +6827,7 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  	if (!netif_running(priv->dev))
>  		return 0;
>  
> -	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
> +	return stmmac_update_vlan_hash(priv, priv->hw, hash);
>  }

[Severity: Medium]

With the pmatch argument and the !priv->dma_cap.vlhash branch now gone from
stmmac_vlan_update() (removed by the earlier series commit "net: stmmac:
Remove VLAN perfect matching dead code"), do the selftests reported as
"VLAN Filtering (perf)" and "Double VLAN Filter (perf)" still exercise
perfect matching?

stmmac_test_vlanfilt_perfect() and stmmac_test_dvlanfilt_perfect() select
the perfect-match implementation by forcing the capability to zero:

drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:stmmac_test_vlanfilt_perfect() {
	priv->dma_cap.vlhash = 0;
	ret = __stmmac_test_vlanfilt(priv);
	priv->dma_cap.vlhash = prev_cap;
}

stmmac_vlan_update() no longer reads dma_cap.vlhash, so it always computes a
non-zero hash, and vlan_update_hash() / dwxgmac2_update_vlan_hash() then
program VLAN_HASH_TABLE and set VLAN_VTHM | VLAN_ETV regardless. Do both
"perf" tests now run the same hardware configuration as their hash
counterparts, so they can pass while the perfect MAC_VLAN_Tag_Filter
admission path is broken?

stmmac_selftests.c is unchanged at the end of the series (bb70e68e6ebc).
Should the tests be updated, or the reported names adjusted?

[ ... ]

> @@ -7962,6 +7946,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  #ifdef STMMAC_VLAN_TAG_USED
>  	/* Both mac100 and gmac support receive VLAN tag detection */
>  	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
> +	priv->hw->hw_svlan_en = true;
>  	if (dwmac_is_xmac(priv->plat->core_type)) {
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;

[Severity: High]

hw_svlan_en is set here for every core, unlike hw_vlan_en just below which
is limited to xmac cores. Together with the move of the ESVL and DOVLTC
programming into vlan_set_hw_mode(), does this change when those two bits
are asserted?

Before this patch they were only set while an 802.1ad VID was registered
(is_double / num_double_vlans in vlan_update_hash() and
dwxgmac2_update_vlan_hash()) and were explicitly cleared otherwise. Now
they are programmed on every open and resume through
stmmac_hw_setup()->stmmac_set_hw_vlan_mode()->vlan_set_hw_mode(), and on
every feature change through stmmac_set_features().

With ESVL set the MAC treats 0x88A8 as a valid VLAN tag, and the same
register write selects VLAN_TAG_STRIP_ALL when hw_vlan_en is set, so
S-tags get stripped in hardware for all traffic. The receive path then
reinserts the TCI with a hardcoded protocol:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c:vlan_rx_hw() {
	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);

		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
	}
}

Does an 802.1ad frame therefore reach the stack labelled 802.1Q and get
demuxed onto the C-VLAN device with the same VID, while 802.1ad VLAN
interfaces stop receiving? The descriptor already carries the tag type -
dwxgmac2_wrback_get_rx_vlan_valid() decodes XGMAC_RDES3_ET_LT and
distinguishes S-tag from C-tag:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:dwxgmac2_wrback_get_rx_vlan_valid() {
	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
}

Separately, DOVLTC now permanently disables the hardware VLAN type
comparison. Does that mean a filter entry installed for a C-VLAN VID also
admits S-tagged frames with the same VID, and that S-tagged frames whose
VID is not registered are now dropped in hardware, where previously with
ESVL clear they were not treated as VLAN at all? Probe still advertises
NETIF_F_HW_VLAN_CTAG_FILTER and NETIF_F_HW_VLAN_STAG_FILTER as separate
offloads, and stmmac_vlan_rx_add_vid() / stmmac_vlan_rx_kill_vid() no
longer pass proto down to the hash configuration at all.

The later series commit "net: stmmac: Disable S-Tag processing on dwmac4"
describes this failure mode for GMAC4 and narrows hw_svlan_en to
core_type == DWMAC_CORE_XGMAC. At the end of the series (bb70e68e6ebc),
ESVL and DOVLTC still end up unconditionally set for dwxgmac2 and
dwxlgmac2, and vlan_rx_hw() still hardcodes ETH_P_8021Q, so does the same
mislabeling remain reachable on those cores?

The commit message presents this as dropping the is_double logic and adding
a hw_svlan_en flag. Could it also describe the receive stripping and
receive filtering behaviour changes?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> index 200b34588c7f..fbb99b70ac27 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c

[ ... ]

> @@ -173,18 +172,9 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
>  
>  	if (hash) {
>  		value |= VLAN_VTHM | VLAN_ETV;
> -		if (is_double) {
> -			value |= VLAN_ESVL;
> -			value |= VLAN_DOVLTC;
> -		} else {
> -			value &= ~VLAN_ESVL;
> -			value &= ~VLAN_DOVLTC;
> -		}
> -
>  		writel(value, ioaddr + VLAN_TAG);
>  	} else {
> -		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
> -		value &= ~VLAN_DOVLTC;
> +		value &= ~(VLAN_VTHM | VLAN_ETV);
>  		value &= ~VLAN_VID;
>  
>  		writel(value, ioaddr + VLAN_TAG);
> @@ -220,6 +210,12 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
>  	u32 value = readl(ioaddr + VLAN_TAG);
>  
>  	value |= VLAN_EDVLP;
> +
> +	if (hw->hw_svlan_en)
> +		value |= VLAN_ESVL | VLAN_DOVLTC;
> +	else
> +		value &= ~(VLAN_ESVL | VLAN_DOVLTC);
> +
>  	value &= ~VLAN_TAG_CTRL_EVLS_MASK;
>  
>  	if (hw->hw_vlan_en)

Since hw_svlan_en is true for every core and hw_vlan_en is true for every
xmac core, both branches below end up in the same register write, enabling
S-tag recognition and strip-all at once. Is that the intended combination
given vlan_rx_hw() cannot report the tag type?

[ ... ]

> @@ -283,7 +270,14 @@ static void dwxlgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
>  	void __iomem *ioaddr = hw->pcsr;
>  	u32 value = readl(ioaddr + VLAN_TAG);
>  
> -	writel(value | VLAN_EDVLP, ioaddr + VLAN_TAG);
> +	value |= VLAN_EDVLP;
> +
> +	if (hw->hw_svlan_en)
> +		value |= VLAN_ESVL | VLAN_DOVLTC;
> +	else
> +		value &= ~(VLAN_ESVL | VLAN_DOVLTC);
> +
> +	writel(value, ioaddr + VLAN_TAG);
>  }

This path previously only set EDVLP and never touched ESVL or DOVLTC. Does
XLGMAC now also get S-VLAN classification and the disabled tag type
comparison enabled on every open, resume and feature change? XLGMAC shares
core_type DWMAC_CORE_XGMAC, so it keeps hw_svlan_en set even after the
later dwmac4 fix in the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com

