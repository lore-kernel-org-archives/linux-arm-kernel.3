Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E7FC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iGhgSepTfMvTest9R2671rFzQ55p8ybqQp29LxKFTc=; b=br0otif9X9b7DUHzvPDMw8i861
	N283RG6q8DpsyEe98jXYetM29yEhDGrYKLscC1afOmkgmZApgevNrKBt6/4Bdit+5VzJ8ox5ShKSR
	3MauQJQlkQm6s7QjwYA36oKPy9MApXM6zexIC1glYMWbOLmJ0WcGxDd6g98LYKLfpQCatLxQY6zl/
	OVzgsfNJAGjaBxV6k2swsmK4XDIgyqfyPWMCMfxsA6vR/JFHsDZmeRsqlfADP+s0MB5xVsfORLF9M
	3+a5Ht9C+2dNaGmRjnakXlVE1Hgze3NoAlE2dYVewsrzZHZ0pNh0sRVgkALbb3VZ/q9emO31EtQXa
	uOJR8qmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Din-0000000BdMX-00mm;
	Thu, 17 Sep 2026 15:08:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Dil-0000000BdMG-3OS0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:08:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42C8542438;
	Thu, 17 Sep 2026 15:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B671F000FF;
	Thu, 17 Sep 2026 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789657699;
	bh=2iGhgSepTfMvTest9R2671rFzQ55p8ybqQp29LxKFTc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jl9qAJD3FmxNKwOaalSgcsSphrCK9ND2fSQ70tv01efnCKfqh5cn27jfjw/u4Ov+t
	 4+i21OUJJHtmKAvZrAKtmKfDMUdSybA2Afg8Camf5k7K5vFU5r9WesMPzBejE6Qulr
	 d+JieLRmXDXhN0PI+SoWMdEeHSE+Ziu5FxXrC5rRSKB8xJlZ+k7MVX8jpHFjujCsZH
	 y/dm+bGpg5alcjOMW3nHXrJhIppNPGNO+lmdnrea6GANJJ1xxoVK6wqiKW7F+VkAJL
	 GiTeTG/oRdKjQHJSDlb8fnw8OsWJB/nz+OU7h0uOpJO1I0FMgnc1BPzToCbbf5u1WK
	 U9NdQNcH3OLGg==
Subject: Re: [PATCH net v7 1/2] net: stmmac: selftests: Prevent RXC from being
 disabled in LPI
From: netdev-bot+sashiko@kernel.org
To: peilinhe2020@163.com
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 he.peilin@zte.com.cn, jiang.kun2@zte.com.cn, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, pabeni@redhat.com, vbridgers2013@gmail.com,
 xu.xin16@zte.com.cn
Date: Thu, 17 Sep 2026 15:08:17 +0000
Message-ID: <178965769776.22033.13374439300724313005@kernel.org>
In-Reply-To: <20260914150612.9798-2-peilinhe2020@163.com>
References: <20260914150612.9798-2-peilinhe2020@163.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] The last paragraph of the commit message describes the
  `eee_rx_clk_stop_enable` precondition backwards.

--

net: stmmac: selftests: Prevent RXC from being disabled in LPI

The patch wraps the selftest loop in stmmac_selftest_run() with
phylink_rx_clk_stop_block() / phylink_rx_clk_stop_unblock() so the PHY
does not stop the receive clock while the MAC is in loopback. The code
change itself looks balanced and is a no-op when the phylink config does
not allow RX clock stop.

The question below is only about the changelog, so the diff hunk is not
quoted.

>     As the NETIF_F_VLAN_FEATURES may be empty on some platforms once the
>     software vlan stripping is removed, the phylink config attribute
>     'eee_rx_clk_stop_enable' may no longer be inconditionnally set to
>     true, hence allowing RXC to be disabled during LPI on platforms
>     that don't have any VLAN features.

[Severity: Medium]
Is the true/false direction here inverted?

include/linux/phylink.h documents the field as:

 * @eee_rx_clk_stop_enable: if true, PHY can stop the receive clock during LPI

So true is what permits the PHY to stop RXC, which makes "may no longer
be inconditionnally set to true, hence allowing RXC to be disabled"
read as its own opposite.

The code in stmmac_phylink_setup() also goes the other way, setting the
flag when the VLAN feature mask is empty:

	/* Disable EEE RX clock stop to ensure VLAN register access works
	 * correctly.
	 */
	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
	    !(priv->dev->features & NETIF_F_VLAN_FEATURES))
		config->eee_rx_clk_stop_enable = true;

In the current tree __stmmac_dvr_probe() sets, under
STMMAC_VLAN_TAG_USED:

	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;

so with CONFIG_VLAN_8021Q=y the flag is never true today, and it only
becomes true once the software VLAN stripping removal drops that
assignment. Would it be clearer to say that the flag starts being set to
true, thereby letting the PHY stop RXC?

Related to that, should the changelog also mention that
CONFIG_VLAN_8021Q=n builds are already affected today? With
STMMAC_VLAN_TAG_USED undefined in common.h, no VLAN features are ever
set, so eee_rx_clk_stop_enable is already true on platforms without
STMMAC_FLAG_RX_CLK_RUNS_IN_LPI and the selftests can already fail there.

As written it is hard to tell whether this fixes a live failure or is a
prerequisite for the following patch in the series, which also makes the
Fixes tag range hard to check.

There is also a spelling slip in the same paragraph: "inconditionnally"
should be "unconditionally".

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914150612.9798-1-peilinhe2020%40163.com

