Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484F1CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiFPi2Kqx80dkvEl/4oayuyKZoKEikHs2ABs0LVDYKw=; b=ef+c3RshfBbNgP2tmYTSxHiFfb
	fP+Qk5KrpMUW/Kr6L4Aw5utm95+6eS1tbq1tYi5TAqyQJdRIriE5jiDpgG/KZO/ukiS4uZjnrqN12
	GJlLQ1IwVzJL32fXNIIeGW6vQWTxZHfXic9JFZt9qlREdYk5xmwgT7CoRjFVicHDP/Jp0feKM+szA
	7TXMSQ/L3NcwlAvc9/Yn0QN9RYuCear3PWwh1+qNUbBIAhfjLYsM1nGVcGnbHj+ypseABOPtA9tit
	jp8n1lkfGSuvS64SRpb93yNQMILfLkRXJJ47ghTY1G0/iO0IN+7coKkYI+CSnfBEy1oAPCXgBv2Nm
	gDU9GWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYm0-0000000B0Tx-3Vbc;
	Fri, 02 Oct 2026 08:37:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYly-0000000B0Td-37yv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:37:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CA7860A5E;
	Fri,  2 Oct 2026 08:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09C71F000FF;
	Fri,  2 Oct 2026 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930261;
	bh=oiFPi2Kqx80dkvEl/4oayuyKZoKEikHs2ABs0LVDYKw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B9DOctviWFC46yM2NNuWsM7SNkc8a6QW0Oztuax4CKi1qhdy+uEsW1Vxa4WCd/pes
	 9bg2mu/BOTRXgisfelFo+e6n53Oz26Sic7CqoUXLRb2d17FXLIjGabuBgVfOOJCsrb
	 HhQSS0cHoF79MMr6fIOxkdn3aPHn//qGEwymCHXXb/EgQAsmON1JB8gF4hCccwUuxs
	 TmO03WBuuN4UGVkZPxww9K/iqJ5FDjA9rCQi0ftgqjKBlfp3JdkMUckBtI5UG1SHdC
	 Td/BJnMdekzVoxoVaeNX09tdplBMuUYPJEOlmEl9Z1aOIqwfkZlJy/Hux58PiWV/fo
	 8ywT+2mVmn72w==
Subject: Re: [PATCH net v6 1/5] net: stmmac: Remove VLAN perfect matching dead code
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 jun.ann.lai@intel.com, yi.fang.gan@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 08:37:40 +0000
Message-ID: <179093026044.434549.8453700533744395096@kernel.org>
In-Reply-To: <20260928203441.34876-2-ovidiu.panait.rb@renesas.com>
References: <20260928203441.34876-2-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch removes the only code that ever read
  priv->dma_cap.vlhash inside stmmac_vlan_update().
- [Low] The commit message's second reason for removal is wrong for
  XLGMAC.

--

net: stmmac: Remove VLAN perfect matching dead code

This commit removes the perfect-matching fallback in stmmac_vlan_update().
That fallback was used when the VLAN hash filter is unavailable
(!priv->dma_cap.vlhash). The commit also drops the perfect_match argument
from the update_vlan_hash() callbacks, together with the matching branches
in vlan_update_hash() and dwxgmac2_update_vlan_hash().

> The fallback is also duplicating the code in vlan_add_hw_rx_fltr(), which
> is always available since stmmac_get_num_vlan() returns at least 1.

[Severity: Low]
Does this hold for XLGMAC? hwif.c maps XLGMAC cores to dwxlgmac2_vlan_ops,
which has no add, del or restore filter callbacks:

drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c:
const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
	.update_vlan_hash = dwxgmac2_update_vlan_hash,
	.enable_vlan = vlan_enable,
};

dwxlgmac2_setup() also never calls stmmac_get_num_vlan(). Only
dwmac4_setup() and dwxgmac2_setup() do. mac_device_info is zero-allocated,
so hw->num_vlan stays 0 on XLGMAC, and stmmac_vlan_rx_add_vid() skips the
num_vlan block.

On XLGMAC, the perfect_match branch removed from
dwxgmac2_update_vlan_hash() seems to be the only non-hash VLAN filter code.
It is not a duplicate of vlan_add_hw_rx_fltr().

The removal itself still looks safe. The first reason in the commit message
holds, since the filter features are only advertised when
dma_cap.vlhash is set. Also, the removed "pmatch = vid" ran after the
for_each_set_bit() loop, so it only ever programmed VID 4096.

Could this paragraph be corrected? Otherwise reviewers and backporters may
assume XLGMAC keeps a perfect-filter path.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ec62fa7418f4..bdb856291340 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6853,29 +6853,18 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
>  static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  {
>  	u32 crc, hash = 0;
> -	u16 pmatch = 0;
> -	int count = 0;
>  	u16 vid = 0;
>  
>  	for_each_set_bit(vid, priv->active_vlans, VLAN_N_VID) {
>  		__le16 vid_le = cpu_to_le16(vid);
>  		crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
>  		hash |= (1 << crc);
> -		count++;
> -	}
> -
> -	if (!priv->dma_cap.vlhash) {
> -		if (count > 2) /* VID = 0 always passes filter */
> -			return -EOPNOTSUPP;
> -
> -		pmatch = vid;
> -		hash = 0;
>  	}
>  
>  	if (!netif_running(priv->dev))
>  		return 0;
>  
> -	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
> +	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
>  }

[Severity: Low]
This removes the only check of priv->dma_cap.vlhash in
stmmac_vlan_update(). Do the "(perf)" ethtool selftests still test anything
different from the hash tests now?

stmmac_test_vlanfilt_perfect() and stmmac_test_dvlanfilt_perfect() in
stmmac_selftests.c still toggle that capability to force the perfect-match
path:

drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:stmmac_test_vlanfilt_perfect() {
    ...
	priv->dma_cap.vlhash = 0;
	ret = __stmmac_test_vlanfilt(priv);
	priv->dma_cap.vlhash = prev_cap;
    ...
}

With this patch, adding VID 0x123 makes stmmac_vlan_update() compute a
non-zero hash and always pass it to update_vlan_hash(). As a result,
vlan_update_hash() and dwxgmac2_update_vlan_hash() set
VLAN_VTHM | VLAN_ETV (and XGMAC_FILTER_VTFE on XGMAC), whatever the vlhash
toggle says.

Before this patch, the fallback forced hash = 0 and cleared VTHM. That left
only the perfect filters programmed by vlan_add_hw_rx_fltr() active.

The "VLAN Filtering (perf)" and "Double VLAN Filter (perf)" entries are
still registered in stmmac_selftests[]. They now pass on the hash filter
alone, because the test VIDs 0x124..0x126 fall into different hash bins. On
XLGMAC (num_vlan == 0, no add_hw_vlan_rx_fltr), they don't exercise perfect
filtering at all.

These selftests also seem to stay as they are later in the series. The
later rename only changes the dvlanfilt names to svlanfilt.

Should these two selftests be removed or reworked as part of this change?
Otherwise ethtool -t reports PASS for perfect filtering that is no longer
tested on its own.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928203441.34876-1-ovidiu.panait.rb%40renesas.com

