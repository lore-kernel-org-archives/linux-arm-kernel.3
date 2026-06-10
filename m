Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE7CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EevDIl3T2tRBqKOfS6hGhqCsYiv62Le6WH61wInv79E=; b=ZHLLxD+bdkf3mrQ/vDjHDYQB+Y
	4U2uN3hLFnzathKGlbpBlSauhPcXnsoBeH+iQcoOI5i7j47SmAw/87nrO1iuEOuqyuly5z0v/gF8n
	M1vEFPRNbeZoOiFIFO8Y6VyxQ5qXlsGcTVFTBfVyelqgnBCRZWLl+82vaOf3+1R+i9MFmZkA9SN0Q
	ML6QD+zcp0URORI+belvO/WMwx2NZZWjAYZ1etiZFVjoOW+onM5N5zHuDtVFWuRN3ju1gOHaU0dSr
	gp9s5cEz+rP1Hb3q2a2w/GDgzXok5qCvf+tMJFZEv1+cF6qzAR4Hc6/Ky6OAmFa/z4ALHfqnDCas8
	jU0+EBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6xL-00000006YoJ-2OjT;
	Wed, 10 Jun 2026 00:38:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6xK-00000006Yo8-2nTF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:38:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1BDF602C4;
	Wed, 10 Jun 2026 00:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC47E1F00893;
	Wed, 10 Jun 2026 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781051885;
	bh=EevDIl3T2tRBqKOfS6hGhqCsYiv62Le6WH61wInv79E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kMOvifmdrxuqXxaTsT7spri7/bwWkkDRVMbJ/XqDSXYookm952FeqwRm2HxMp5mYY
	 nWkmXXOuZV8rl2zXMgE2RAKtR9aEN4/Ke5uOTWtj6KPJdDw3YM0Zu/QvxyNfXUtZww
	 bPKoYSVqJ+kD+2HylJDpSzc4/YkXqGgqy4zHnMb80oAtPlGO4h01f4GV8jhXzPPdeJ
	 AJywWCIqPchi3OmLGlnEL1He6wD/klnKE5rFKr/+9/JLMsEBOfLZMIEz2/Lon4GF7W
	 zonQvFtAA5c8IzxsTKNm5cjUQXpJ8xM75DhEPj0au4u6X4huY0LiKA9OgjiKqIJGLd
	 8/fBQSYk0k7Aw==
Date: Tue, 9 Jun 2026 17:38:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Carlos Fangmeier <carlos.fangmeier@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: prevent kernel panic during XDP program
 and XSK pool transitions
Message-ID: <20260609173804.77d13413@kernel.org>
In-Reply-To: <20260605-main-v1-1-aed15b1cf1af@gmail.com>
References: <20260605-main-v1-1-aed15b1cf1af@gmail.com>
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

On Fri, 05 Jun 2026 00:56:35 -0700 Carlos Fangmeier wrote:
> stmmac_xdp_set_prog() tears down and rebuilds all DMA channels via
> stmmac_xdp_release()/stmmac_xdp_open() without pausing the netdev
> TX path. Similarly, stmmac_xdp_enable_pool() and
> stmmac_xdp_disable_pool() reconfigure individual queue DMA rings
> while TX remains active.

This still looks racy. Please look at other drivers

> If the kernel transmits a frame during these windows =E2=80=94 for exampl=
e an
> MLD report queued by the IPv6 stack =E2=80=94 stmmac_xmit() calls
> dwmac4_set_addr() against an MMIO register whose mapping has been
> torn down, triggering a level-3 translation fault:
>=20
>   Unable to handle kernel paging request at virtual address ffff8000840ec=
000
>   pc : dwmac4_set_addr+0x8/0x18
>   lr : stmmac_xmit+0x64c/0xb60
>   Call trace:
>    dwmac4_set_addr+0x8/0x18
>    dev_hard_start_xmit+0xb0/0x220
>    sch_direct_xmit+0x108/0x3f0
>    __dev_queue_xmit+0x844/0xd00
>    ip6_finish_output2+0x2d8/0x610
>    mld_sendpack+0x180/0x2e0
>    mld_ifc_work+0x1dc/0x480
>=20
> The existing netif_tx_disable() in stmmac_xdp_release() is not
> sufficient because stmmac_xdp_open() re-enables TX via
> netif_tx_start_all_queues() before the caller regains control, leaving
> a window where the freshly rebuilt rings can race with pending TX work.
>=20
> Fix this by wrapping each reconfiguration path with
> netif_tx_disable()/netif_tx_wake_all_queues():
>=20
>  - stmmac_xdp_set_prog(): hold TX disabled across the full
>    stmmac_xdp_release() + stmmac_xdp_open() sequence, only waking
>    TX after stmmac_xdp_open() returns.
>=20
>  - stmmac_xdp_enable_pool(): disable TX before tearing down the
>    queue, re-enable after the queue is rebuilt and NAPI is active.
>=20
>  - stmmac_xdp_disable_pool(): same pattern around the pool teardown
>    and queue rebuild.
>=20
> Tested on Cortex-A55 (stmmac/dwmac4, kernel 6.6.60) with AF_XDP

That's an ancient kernel, you'll have to test an upstream kernel
for us to merge the patch
--=20
pw-bot: cr

