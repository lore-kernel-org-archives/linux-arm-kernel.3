Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E210FC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmYtX5vt6EbB/EOm2Otei/UM5A4FPa8JtYdIHaVjpCQ=; b=ybrM4gAvrS4EIW2f4+6OTU7BRE
	epF/MCILGhf2ik17SITCdiiyJ3BM19pn5wjEBP6jKYGqGMVv1L2B+oTBR/T47LoxOyzreK8A+xsVA
	Q2hPCKAXvV2SyH6Sn0QoM+W1DKh5/9fFJvLG1dGjbdtR9dr4G+IW/HV2l878NHSf32z5O5YQT2r43
	4FCR4VE6nK7BHyKVyJIabocnbgroagDmskeZg/jbYTtx0MGIOLVW5XT7LNq2903DSFfkvmNXpTaXp
	nM4Rd1jvbYJvRpYazWr7c8UxXI3ISpUbkTlLer93xjI5QhHfIbSP/TQ78dOHfxEBrQICNahWJ1J7+
	goDoUa0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oT0-0000000FZJ4-34fW;
	Thu, 10 Sep 2026 23:46:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oSv-0000000FZHW-0aaa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:46:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B089D439B8;
	Thu, 10 Sep 2026 23:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3DC1F00893;
	Thu, 10 Sep 2026 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083960;
	bh=VmYtX5vt6EbB/EOm2Otei/UM5A4FPa8JtYdIHaVjpCQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KrVIY/M9d43r5ern1GpJAKwUSRKdRYW6e+cN8Q0Kjx/ElfQguwjPLM+UHwmJzzFvk
	 kf/aZJllXfJ3KCB2JWadI5T/lHnTsWksXxMdiPp2ZCoHa5pqCaG3IvBXUT1B/UCMnt
	 uTusSagt1ASZCaayEdMlolZ1SeJ9m3rYw4+qVCGvOJ26JNjpg0vd06pEs0Sm9hKKpQ
	 E9LZEsgq1MAm5QW4ejHaHvpCUsHj1DuHCfggXZltIxMEPuaplM4cVsTWfQwZxpdTEb
	 LRT1o/7lCX1lqVtaFxAIEVQX/jJ2w5mY4hKwx9SWJBbaLRZARyD4uocfKLB++ulQ4a
	 97C/tkpl66a8w==
Subject: Re: [PATCH net v4 2/7] net: stmmac: Stop toggling the EDVLP bit
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:45:59 +0000
Message-ID: <178908395911.219967.10332020997199039014@kernel.org>
In-Reply-To: <20260908164309.59282-3-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-3-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0

- [Medium] The in-kernel selftests "VLAN Filtering (perf)"
  (stmmac_test_vlanfilt_perfect,…

Pre-existing issues:
- [Medium] XLGMAC Rx VLAN offload state is never programmed into the MAC:
  dwxlgmac2_set_hw_vlan_mode()…

--

net: stmmac: Stop toggling the EDVLP bit

The EDVLP bit is no longer toggled per 802.1ad VLAN registration. It is
now set once from vlan_set_hw_mode() and kept enabled, and a new
set_hw_vlan_mode callback is added for dwxlgmac2, which previously had
none.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> index 983a90cb9767..200b34588c7f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c

[ ... ]

> @@ -222,6 +219,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
>  	void __iomem *ioaddr = hw->pcsr;
>  	u32 value = readl(ioaddr + VLAN_TAG);
>  
> +	value |= VLAN_EDVLP;
>  	value &= ~VLAN_TAG_CTRL_EVLS_MASK;
>  
>  	if (hw->hw_vlan_en)

[ ... ]

> @@ -283,6 +278,14 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
>  	}
>  }
>  
> +static void dwxlgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value = readl(ioaddr + VLAN_TAG);
> +
> +	writel(value | VLAN_EDVLP, ioaddr + VLAN_TAG);
> +}
> +

[Severity: Medium]

This isn't a bug introduced by this patch, but now that dwxlgmac2 gains a
set_hw_vlan_mode callback, should it also honour hw->hw_vlan_en?

The other implementation of the same ops slot, vlan_set_hw_mode(), programs
the Rx strip mode and the descriptor report bit:

	value &= ~VLAN_TAG_CTRL_EVLS_MASK;

	if (hw->hw_vlan_en)
		value |= VLAN_TAG_STRIP_ALL;
	else
		value |= VLAN_TAG_STRIP_NONE;

	value |= VLAN_TAG_CTRL_EVLRXS;

dwxlgmac2_set_hw_vlan_mode() only ORs VLAN_EDVLP, so EVLS and EVLRXS keep
whatever value they had.

At the same time stmmac_dvr_probe() forces the flag on and advertises the
offload for every core matched by dwmac_is_xmac(), which includes the
XLGMAC hwif entry (.core_type = DWMAC_CORE_XGMAC, .vlan =
&dwxlgmac2_vlan_ops):

	if (dwmac_is_xmac(priv->plat->core_type)) {
		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
		priv->hw->hw_vlan_en = true;
	}

So on XLGMAC, ethtool -K <if> rxvlan on|off goes stmmac_set_features() ->
stmmac_set_hw_vlan_mode() -> dwxlgmac2_set_hw_vlan_mode(), flips
priv->hw->hw_vlan_en and returns success, while no strip or report bit is
written to MAC_VLAN_Tag.

The Rx path then takes the MAC level branch in stmmac_rx():

	if (priv->hw->hw_vlan_en)
		/* MAC level stripping. */
		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
	else
		/* Driver level stripping. */
		stmmac_rx_vlan(priv->dev, skb);

and dwxlgmac2_vlan_ops has no .rx_hw_vlan handler, so that call resolves to
nothing.

To be clear, this is not packet or tag loss: with EVLS unprogrammed the tag
stays in-band and skb_vlan_untag() in the core Rx path still de-tags the
frame. The point is that driver bookkeeping and the actual MAC VLAN
configuration diverge, and the advertised NETIF_F_HW_VLAN_CTAG_RX does
nothing on this core. This is still the case at the end of the series
(bb70e68e6ebc): dwxlgmac2_vlan_ops has no .rx_hw_vlan and
dwxlgmac2_set_hw_vlan_mode() never programs EVLS/EVLRXS.

>  const struct stmmac_vlan_ops dwmac_vlan_ops = {
>  	.update_vlan_hash = vlan_update_hash,
>  	.enable_vlan = vlan_enable,
> @@ -296,6 +299,7 @@ const struct stmmac_vlan_ops dwmac_vlan_ops = {
>  const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
>  	.update_vlan_hash = dwxgmac2_update_vlan_hash,
>  	.enable_vlan = vlan_enable,
> +	.set_hw_vlan_mode = dwxlgmac2_set_hw_vlan_mode,
>  };

A separate question, about the preceding patch in the series rather than
this one:

[Severity: Medium]

After "net: stmmac: Remove VLAN perfect matching dead code", do the two
"(perf)" selftests still exercise a different path?

stmmac_test_vlanfilt_perfect() and stmmac_test_dvlanfilt_perfect() in
stmmac_selftests.c select the perfect matching path only by clearing the
capability:

	priv->dma_cap.vlhash = 0;
	ret = __stmmac_test_vlanfilt(priv);
	priv->dma_cap.vlhash = prev_cap;

but stmmac_vlan_update() no longer consults priv->dma_cap.vlhash:

	if (!netif_running(priv->dev))
		return 0;

	return stmmac_update_vlan_hash(priv, priv->hw, hash);

and vlan_update_hash()/dwxgmac2_update_vlan_hash() no longer have the
perfect_match branch.

That makes the override inert, so hash filtering (VTHM/VTFE) stays enabled
during the "(perf)" runs and the entries named "VLAN Filtering (perf)" and
"Double VLAN Filter (perf)" in stmmac_selftests[] run the same path as their
non-perf counterparts.

A broken perfect match filter, that is vlan_add_hw_rx_fltr() and the
VLAN_TAG_DATA table, would be masked by the still active hash filter while
ethtool -t reports these tests as passing. Both tests and their names are
unchanged at the end of the series (bb70e68e6ebc).

Should these two tests be removed, or reworked to actually disable hash
filtering?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com

