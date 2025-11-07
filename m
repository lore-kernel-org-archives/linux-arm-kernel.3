Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89533CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 01:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlcBKjJx4uP39C5Bp7ynHMky0Ctqov+yjLQA9z/pqvQ=; b=mn8x89d1fPLwz3Tsw10zA6pWQc
	ZuFnzpNroQg4eVuNCbx1dmtekk1svr4k5WcTSa7mtXMWGumtfZS3lO62ce4567mmxfTowPZ8PBkzu
	adKeYwLnXVaDTuyy4ty8wjeSOLvHdSMelNnYZ6Co5cmaSDgiBnQpV1A6vDGODaCBxXay9uM3Jbu7v
	zE1GkWB8nmEHisFxjpxMcrlnFos+93oeCJ/8LxThAn84y3QgAulODgKDs7HVtXrsuyAYEtX5/op5o
	ELJtCH6zyaSiIMW1ce8eJHrlCVzrTGcgdV6Bv96ARkt6s9a2V3mUr1+zVEmFOOS0/ubPvHuY46ha8
	V5TrWphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBI4-0000000GVc5-0vnI;
	Fri, 07 Nov 2025 01:29:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBI2-0000000GVbm-2YKk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 01:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96D7D601A7;
	Fri,  7 Nov 2025 01:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FB4C4CEF7;
	Fri,  7 Nov 2025 01:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762478961;
	bh=GbsyoaoMgC5ugJX7CDMoP2LUinPt69SQz5ZnttGKylU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PxJdsgmg+BdMKGKF2RoB25bnZSE0JPB5UXZySz2/x9cQ0eoqEhJnzGsNRM/PP8VeU
	 PiNLzTIlwkEPxzPBSo2GYUzwS386Ix8S+rTuRI5WpGxNtWvL1fZiuoGjNxqCmkwopq
	 gDXGmXV79vMnoz9xJrSJXllSV0IDpLB4pBfm7tdh7BGni0nha6IaCK9d488cLTzUNn
	 +qa+fUhUgjYHsLBpMkQT83JZtN1UZLzbUrf4Wznb4Puh6wu1EQ9GKndEerhXX++2/p
	 03UWY8xFnLtf7xh4zjhiSkSVai5Fi9ex/qBu3giLMObs1+tMvXCHOrDXloA0xGdvSx
	 M0a1B0E33uiag==
Date: Thu, 6 Nov 2025 17:29:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=
 <toke@toke.dk>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net V3 1/2] veth: enable dev_watchdog for detecting
 stalled TXQs
Message-ID: <20251106172919.24540443@kernel.org>
In-Reply-To: <176236369293.30034.1875162194564877560.stgit@firesoul>
References: <176236363962.30034.10275956147958212569.stgit@firesoul>
	<176236369293.30034.1875162194564877560.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 05 Nov 2025 18:28:12 +0100 Jesper Dangaard Brouer wrote:
> The changes introduced in commit dc82a33297fc ("veth: apply qdisc
> backpressure on full ptr_ring to reduce TX drops") have been found to cau=
se
> a race condition in production environments.
>=20
> Under specific circumstances, observed exclusively on ARM64 (aarch64)
> systems with Ampere Altra Max CPUs, a transmit queue (TXQ) can become
> permanently stalled. This happens when the race condition leads to the TXQ
> entering the QUEUE_STATE_DRV_XOFF state without a corresponding queue wak=
e-up,
> preventing the attached qdisc from dequeueing packets and causing the
> network link to halt.
>=20
> As a first step towards resolving this issue, this patch introduces a
> failsafe mechanism. It enables the net device watchdog by setting a timeo=
ut
> value and implements the .ndo_tx_timeout callback.
>=20
> If a TXQ stalls, the watchdog will trigger the veth_tx_timeout() function,
> which logs a warning and calls netif_tx_wake_queue() to unstall the queue
> and allow traffic to resume.
>=20
> The log message will look like this:
>=20
>  veth42: NETDEV WATCHDOG: CPU: 34: transmit queue 0 timed out 5393 ms
>  veth42: veth backpressure stalled(n:1) TXQ(0) re-enable
>=20
> This provides a necessary recovery mechanism while the underlying race
> condition is investigated further. Subsequent patches will address the ro=
ot
> cause and add more robust state handling.
>=20
> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to =
reduce TX drops")
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>

I think this belongs in net-next.. Fail safe is not really a bug fix.
I'm slightly worried we're missing a corner case and will cause
timeouts to get printed for someone's config.

> +static void veth_tx_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct netdev_queue *txq =3D netdev_get_tx_queue(dev, txqueue);
> +
> +	netdev_err(dev, "veth backpressure stalled(n:%ld) TXQ(%u) re-enable\n",
> +		   atomic_long_read(&txq->trans_timeout), txqueue);

If you think the trans_timeout is useful, let's add it to the message
core prints? And then we can make this msg just veth specific, I don't
think we should be repeating what core already printed.

> +	netif_tx_wake_queue(txq);
> +}
> +
>  static int veth_open(struct net_device *dev)
>  {
>  	struct veth_priv *priv =3D netdev_priv(dev);
> @@ -1711,6 +1723,7 @@ static const struct net_device_ops veth_netdev_ops =
=3D {
>  	.ndo_bpf		=3D veth_xdp,
>  	.ndo_xdp_xmit		=3D veth_ndo_xdp_xmit,
>  	.ndo_get_peer_dev	=3D veth_peer_dev,
> +	.ndo_tx_timeout		=3D veth_tx_timeout,
>  };
> =20
>  static const struct xdp_metadata_ops veth_xdp_metadata_ops =3D {
> @@ -1749,6 +1762,7 @@ static void veth_setup(struct net_device *dev)
>  	dev->priv_destructor =3D veth_dev_free;
>  	dev->pcpu_stat_type =3D NETDEV_PCPU_STAT_TSTATS;
>  	dev->max_mtu =3D ETH_MAX_MTU;
> +	dev->watchdog_timeo =3D msecs_to_jiffies(5000);
> =20
>  	dev->hw_features =3D VETH_FEATURES;
>  	dev->hw_enc_features =3D VETH_FEATURES;
>=20
>=20


