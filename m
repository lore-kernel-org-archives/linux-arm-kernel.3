Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE675CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3n945JOx207uVR+gqgNGgYqABxExGragHPNjUcalaM=; b=u63/3JZuOklJr4YI7ZWUF7N3q8
	pJQsmxKsUWa56RF2GO22kU0bWTYPx3D1Z76Y3kQyjYzw41BTQrRw1ij91AsmLnHRI6yWbslDbYyP8
	dqOqM7PPsQZP/6oyeXRmiN+R1q4zMSepEgUo7zn+HDBV4NKbO6HUUv7jOFTQChkSgJ9n7TElm5/ZY
	MtOydxpcYiNf7YO1GdNz2r+UIihz0qYrqPrgQRPPKAzZqYQLyFIftR+8mQKgBjjvNaUz8V7bL5SdY
	dvz81IeacODPpVBlmBfWBLmDpEmoxiAktSd6IMK3sKbvTx499OeUVmTWqtgYP4AwjRpnzsUBD113y
	rlbFJYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Sm-0000000GrWW-2HQE;
	Mon, 17 Nov 2025 21:08:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Sk-0000000GrVq-3Qvu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:08:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F300D6025B;
	Mon, 17 Nov 2025 21:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822D7C113D0;
	Mon, 17 Nov 2025 21:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763413717;
	bh=et//iptFPngI7sYYUefBHRZ7sY39xbXQ7hu+yX8dUcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfesFpQqzx04GaNVMV3gCHnCuhE2/mF+CsDWHYlzMyca+2KsG79h3QrsHDQnPaJb/
	 yd5kOT8reNgPLb5mf6+5SL+NJrtqjO0CIOqn3bzHFlLISXWzLtrM1GRWQU0bzy8Dp9
	 RzRWRQYAMxhNNKs1/ErIdJJzV8Q1Wh1QJjUF2GeHCa97yYFNizZjzE9U05XZG+nnvE
	 UK3PHHrTB22FzuZEU2hfneF9IYhRQ/H1/l7s6VN/rh8Krzd1JhgMcV59dV1BVDMWMk
	 uvh9x3hg60gFCHuaoaXncb1U6ZWTKHVKjruO/gQUW/yahh8XpR8r/Cuexqp6E81feE
	 +YrybfJkIuoew==
Date: Mon, 17 Nov 2025 21:08:29 +0000
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
	pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
	praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
	mohan@couthit.com
Subject: Re: [PATCH net-next v5 2/3] net: ti: icssm-prueth: Adds switchdev
 support for icssm_prueth driver
Message-ID: <aRuOzelPTiwaoNop@horms.kernel.org>
References: <20251113101229.675141-1-parvathi@couthit.com>
 <20251113101229.675141-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113101229.675141-3-parvathi@couthit.com>
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

On Thu, Nov 13, 2025 at 03:40:22PM +0530, Parvathi Pudi wrote:

...

> @@ -222,12 +229,14 @@ struct prueth_emac {
>  	const char *phy_id;
>  	u32 msg_enable;
>  	u8 mac_addr[6];
> +	unsigned char mc_filter_mask[ETH_ALEN]; /* for multicast filtering */
>  	phy_interface_t phy_if;
>  
>  	/* spin lock used to protect
>  	 * during link configuration
>  	 */
>  	spinlock_t lock;
> +	spinlock_t addr_lock;   /* serialize access to VLAN/MC filter table */

addr_lock does not appear to be initialised anywhere.

...

> +static int icssm_prueth_switchdev_obj_del(struct net_device *ndev,
> +					  const void *ctx,
> +					  const struct switchdev_obj *obj)
> +{
> +	struct switchdev_obj_port_mdb *mdb = SWITCHDEV_OBJ_PORT_MDB(obj);
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth *prueth = emac->prueth;
> +	struct netdev_hw_addr *ha;
> +	u8 hash, tmp_hash;
> +	int ret = 0;
> +
> +	switch (obj->id) {
> +	case SWITCHDEV_OBJ_ID_HOST_MDB:
> +		dev_dbg(prueth->dev, "MDB del: %s: vid %u:%pM  port: %x\n",
> +			ndev->name, mdb->vid, mdb->addr, emac->port_id);
> +		hash = icssm_emac_get_mc_hash(mdb->addr, emac->mc_filter_mask);
> +		netdev_for_each_mc_addr(ha, prueth->hw_bridge_dev) {

Is there anything stopping this event from occurring when
the port is not the lower device of a bridge - before being added
or after being removed?

If not, then passing prueth->hw_bridge_dev to netdev_for_each_mc_addr()
will result in a null pointer dereference.

...

