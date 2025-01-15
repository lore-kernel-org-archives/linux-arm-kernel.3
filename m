Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D03FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 22:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZMULtA3pvMEGT/4urvYl1mZaU5QZOvvQy8LlegvQtA=; b=Vgv7HMRwe7maFddG7lTZu+jwoX
	8xktYu8LEhUodewnct8a0+ZCqHnrat9l0a20LVLXECUjZxSchfY9yNnrC8wQi+gYKCaQaSRV+oAKq
	rjW3lcBFA++QAFSQi9Wyr20SR52NYMmI8JDReVqROxEP5ITeJZsB5IM2aLq87nxphuAVcc2K8Va6F
	dgPLcuBCVJsoKnntqD6wMC4a7Zm4dbAMkygL2ZOE7EgW972yeGwxZP7pQFzDQ78v6WQ6nnAtq4UcX
	5YxT0PWISZVQNWzIQ277888Mmf7/jb7e//KbYUwe0l10iD9t8bafDEfIHnAd8irV/nGKeAqCxHHuK
	deanCh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYBSd-0000000DD2R-29ok;
	Wed, 15 Jan 2025 22:02:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYBRN-0000000DCtS-1mGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 22:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81529A425D3;
	Wed, 15 Jan 2025 21:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8036C4CED1;
	Wed, 15 Jan 2025 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736978444;
	bh=keIMQnDJxBzpB6xvALOz2UCHABne6y4Z0KtjLyVep5o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iTXpjadQmUDeZ0NqHYPMeKUPWl24TTEJXe90UuH6alD/w/TPayh70MuTKNekAjDpE
	 VGaAvz6OaUPLF0gYbwFfqs3Xd4uEmc48PeR/UoQPsV4n250F/RWAQki2ObaYjqcPYq
	 O+RzY4z2xcBfcqbW+GeD6YSHEKOu9peWXnnroxkmpscbMb2QKCcb3Xzw3KXEmLhg6c
	 lYL8gXVsXX+uw4/geqD076j9LVuyxGKNgps2oga2SmyKeqatBNNxe6N/Bb7kRVKmVr
	 TO5Z2iE3Fv23C0VuB7qyn0RbbhU5cOWNsIh3hiT8SOTUibQ6kRClU7wGMO9EOQ85sr
	 n0Zdppzc/cuNg==
Date: Wed, 15 Jan 2025 14:00:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 net-next 07/13] net: enetc: add RSS support for
 i.MX95 ENETC PF
Message-ID: <20250115140042.63b99c4f@kernel.org>
In-Reply-To: <20250113082245.2332775-8-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
	<20250113082245.2332775-8-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_140045_535193_012B448B 
X-CRM114-Status: GOOD (  17.88  )
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

On Mon, 13 Jan 2025 16:22:39 +0800 Wei Fang wrote:
> Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve the
> network performance and balance the CPU loading. In addition, since both
> ENETC v1 and ENETC v4 only support the toeplitz algorithm, so a check for
> hfunc was added.

This and previous commits are a bi hard to follow. You plumb some
stuff thru in the previous commit. In this one you reshuffle things,
again. Try to separate code movement / restructuring in one commit. 
And new additions more clearly in the next.

> +static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *key)
> +{
> +	int i;
> +
> +	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> +		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)key)[i]);
> +}
> +
> +static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
> +{
> +	int i;
> +
> +	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> +		((u32 *)key)[i] = enetc_port_rd(hw, ENETC4_PRSSKR(i));
> +}

Isn't the only difference between the chips the register offset?
Why create full ops for something this trivial?

> +static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
> +			    u32 *rule_locs)
> +{
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> +
> +	switch (rxnfc->cmd) {
> +	case ETHTOOL_GRXRINGS:
> +		rxnfc->data = priv->num_rx_rings;
> +		break;
> +	case ETHTOOL_GRXFH:
> +		return enetc_get_rsshash(rxnfc);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}

Why add a new function instead of returning EOPNOTSUPP for new chips 
in the existing one?

> @@ -712,6 +730,12 @@ static int enetc_set_rxfh(struct net_device *ndev,
>  	struct enetc_hw *hw = &si->hw;
>  	int err = 0;
>  
> +	if (rxfh->hfunc != ETH_RSS_HASH_NO_CHANGE &&
> +	    rxfh->hfunc != ETH_RSS_HASH_TOP) {
> +		netdev_err(ndev, "Only toeplitz hash function is supported\n");
> +		return -EOPNOTSUPP;

Should be a separate commit.
-- 
pw-bot: cr

