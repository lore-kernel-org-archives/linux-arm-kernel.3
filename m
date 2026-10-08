Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB38CA6018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X529MLugTqxfwTe5adGPF/N2sMvvH1fFwubETAK5fsw=; b=LHCIFWBEqVXtO2/Caw36RE/2Ix
	T9N5S71yNyHvKKS9WMuAdGYVSTAAdUEap0HqgwvvqtrN7e4QF0uEpjTeRNKi+SfaIEwl3E6dfaTLw
	XBknmFJDJwQcTCqxG72Bg0jY6fz6BfgGuHKqqZzPD9f7LGfkm3mSQnIXKMiDFSwOjxaOLIYN+cKZx
	NB8hvH5VM/zfQctzCx8QjWrU3yp/Ir2xq1Y0Zzn7q9IbSevddNBKyOOgARczcTGVz0/N0deJzBqtK
	ddKYxigHFn4tyNFUvywg310NbhHekRaVmvlWYdu2y6PUKQJq0z82azJ1lKGoeNa3Yat6ccbM0dtTW
	16h8Mrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEviG-000000054yR-1Typ;
	Thu, 08 Oct 2026 21:31:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEviB-000000054wv-06sm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 21:31:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7727E60DA9;
	Thu,  8 Oct 2026 21:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EE31F00893;
	Thu,  8 Oct 2026 21:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791495094;
	bh=X529MLugTqxfwTe5adGPF/N2sMvvH1fFwubETAK5fsw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=elNMaz5JzoBEBzmBz7exLuPwXTDmDkr+bNTn2FqHxNhLXeOv11+09hWRnrjdHrFoM
	 uoxwWXPmh307G7pFi/go/qFLbmJzcknBndKTd2WMRerNPHocadMG+VCOwM7zgdxhPH
	 pmcfHJSoej5TwA4a2kl/1sjQHg2MbDt8yxCtNxYWp4flDE8gQS7JK/FH2FfeXz3UsM
	 Otd+jEqUsxVee/u75wK8LWLgFUs9Szxt6bm5ZIuch1NVr+J2ffYmj49EdRYAZpwox2
	 SX5ZbLSlFHuawDFL9VmUsUCEB2vQJUzleETZf8Pxh1hqwQLfXTS9CG51ZHZF7h00ai
	 enMAo9MP0wFHA==
Subject: Re: [PATCH net-next 3/3] net/mlx5e: use skb_share_check() in the
 loopback selftest hook
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, o.rempel@pengutronix.de,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, dtatulea@nvidia.com, alazar@nvidia.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Date: Thu, 08 Oct 2026 21:31:32 +0000
Message-ID: <179149509264.434549.15492783775949444420@kernel.org>
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-3-458369bfa1ba@tipi-net.de>
References: <20261007-nb-net-selftest-shared-net-v1-3-458369bfa1ba@tipi-net.de>
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

- [Low] In mlx5e_test_loopback_validate()
  (drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c), the comment…

Pre-existing issues:
- [Low] This problem wasn't introduced by this patch, but
  mlx5e_test_loopback_validate()…

--

net/mlx5e: use skb_share_check() in the loopback selftest hook

This commit adds a skb_share_check() call in
mlx5e_test_loopback_validate() ahead of skb_linearize(). With it, the
loopback selftest hook no longer linearizes an skb that another
ETH_P_IP handler bound to the device also holds.

> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c b/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c
> index 1dcdb86690bb7..8eb9a9469549d 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c
> @@ -166,6 +166,10 @@ mlx5e_test_loopback_validate(struct sk_buff *skb,
>  	struct udphdr *udph;
>  	struct iphdr *iph;
>  
> +	skb = skb_share_check(skb, GFP_ATOMIC);
> +	if (!skb)
> +		goto out;
> +
>  	if (skb_linearize(skb))
>  		goto out;
>  

[Severity: Low]
This isn't a bug, but the comment just below this hunk in
mlx5e_test_loopback_validate() now contradicts the new code:

	if (skb_linearize(skb))
		goto out;

	/* We are only going to peek, no need to clone the SKB */
	if (MLX5E_TEST_PKT_SIZE - ETH_HLEN > skb_headlen(skb))
		goto out;

skb_share_check() calls skb_clone() whenever the skb is shared. After
that, skb_linearize() can modify or reallocate the skb head.

Should this comment be dropped or reworded? A later reader could take
"no need to clone" at face value and remove the skb_share_check().
stmmac_test_loopback_validate() uses the same skb_share_check() +
skb_linearize() sequence and has no such comment.

The commit message also says:

  skb_linearize() on a non-linear frame then hits BUG_ON(skb_shared()).

Is this accurate for mlx5 in general? __pskb_pull_tail() only calls
pskb_expand_head(), which holds the BUG_ON(skb_shared()), under this
condition:

	if (eat > 0 || skb_cloned(skb)) {
		if (pskb_expand_head(skb, 0, eat > 0 ? eat + 128 : 0,
				     GFP_ATOMIC))

Both mlx5 non-linear RX builders seem to leave enough tailroom for this
small test frame's frags. Without XDP,
mlx5e_skb_from_cqe_mpwrq_nonlinear() uses
napi_alloc_skb(ALIGN(MLX5E_RX_MAX_HEAD)). With XDP it uses
MLX5_SKB_FRAG_SZ(XDP_PACKET_HEADROOM + MLX5E_RX_MAX_HEAD).

So on mlx5 the BUG_ON seems to need an skb that is both shared and
cloned. Could the commit message state the triggering condition more
precisely? The fix itself looks correct, since users == 1 after
skb_share_check().

[Severity: Low]
This is a pre-existing issue and was not introduced by this patch.
Further down in mlx5e_test_loopback_validate(), the UDP header is
located using iph->ihl, which comes from the packet and is never
checked:

	/* Don't assume skb_transport_header() was set */
	udph = (struct udphdr *)((u8 *)iph + 4 * iph->ihl);
	if (udph->dest != htons(9))
		goto out;

	mlxh = (struct mlx5ehdr *)((char *)udph + sizeof(*udph));
	if (mlxh->magic != cpu_to_be64(MLX5E_TEST_MAGIC))

The only length check is this one:

	if (MLX5E_TEST_PKT_SIZE - ETH_HLEN > skb_headlen(skb))
		goto out;

That guarantees 44 bytes: 20 for IP, 8 for UDP, and 16 for struct
mlx5ehdr, which includes the padding before magic.

The hook is registered with dev_add_pack() for every ETH_P_IP frame on
priv->netdev. While the loopback test is running, could an external UDP
frame sent to the port MAC with ihl up to 15 make this code read
udph->dest and mlxh->magic up to 40 bytes past skb_headlen()?

Those bytes stay inside the skb head allocation, in the tailroom or
skb_shared_info, and they are only compared against constants. The
result could be a spurious selftest outcome or a KMSAN uninit-value
report. Would it make sense to check 4 * iph->ihl against skb_headlen()
before using it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba%40tipi-net.de

