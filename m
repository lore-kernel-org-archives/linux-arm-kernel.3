Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B811606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kUdGx/QV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EL71qw1T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZO0R7AUCd3fn8n7Ia6A45uzQOJbzCgxNKEP+cM/ZrgU=; b=kUdGx/QVnbkpIG1Q3zdxKBbqe0
	LiHma4MwXDleS70qW4khMrKSQLi+Ex+4CBeybOqahrkRnkDTdX4msnRyPaMhRTDtyGcfjHuo8xpDo
	EP/iTryVsiHnDebJe8pLnmsp5nkl99Y2NtBVDHlUXOMOJlDS6kPrRi9jXlgVsl5IBY9ZsomN9PS4j
	ib/riDKRHmiX9CfGCn2czPRw1jXFrWBTf3MlIBTwvHrqWzZ1g6+ndIsZjdW9dKlUke/tnPHh6BNrh
	2C/zUtaJOnyEwj3L5XirFlSYg36QTVI7N3ui/x3qqvH480hQbK81oFICCBd+XRvRypk9+r0ZqEQrR
	ITn/XHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXNN-0000000C6jW-36LV;
	Wed, 21 Oct 2026 14:33:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXNM-0000000C6jI-0zAy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:33:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF43B43ACD;
	Wed, 21 Oct 2026 14:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177EB1F000C4;
	Wed, 21 Oct 2026 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593187;
	bh=ZO0R7AUCd3fn8n7Ia6A45uzQOJbzCgxNKEP+cM/ZrgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EL71qw1TUN5cW41RTrsuoUw2znHrbg0f1ajBkG3QMsazwtTvyR5ZaKNIoRrtyhDm3
	 eJoFN849bTc5gPNLOoGIwAi96XBWmfWNXRJPjqhHeLgyIpEECXz/PIY/5+tBoVUqvS
	 FycVxB/tvFuRBDJBI7/bl6CHcuuUoSMWSjCIbOprgClI1lXMMJ7T7lJ33lh6IiKHN3
	 4gvi8ToDmBdVy9uMYzhuc9LF6HWJtT7SDee7mCoPBl070yaAF+gb6DOYv5htAqZT+Q
	 L59pNgrK82cbE4BIL7BNqc6SaVyGhp6alH/KhEP4YCwhKSoRszm7hGQ/OYWwsf1zhY
	 FjhRmN46nG3eA==
Date: Wed, 21 Oct 2026 07:33:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Song Yoong Siang <yoong.siang.song@intel.com>, Mohd
 Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 0/2] net: stmmac: Fix XSK crashes on stm32mp2
Message-ID: <20261021073306.61972417@kernel.org>
In-Reply-To: <874iefjjan.fsf@jax.kurt.home>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
	<20261020140849.12fc79ef@kernel.org>
	<874iefjjan.fsf@jax.kurt.home>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 15:05:20 +0200 Kurt Kanzenbach wrote:
> On Tue Oct 20 2026, Jakub Kicinski wrote:
> > On Tue, 13 Oct 2026 10:57:20 +0200 Kurt Kanzenbach wrote:  
> >> while looking at the TBS thingy [1], I've noticed kernel crashes. That
> >> happens when opening or closing an AF_XDP/ZC socket while parallel Tx
> >> traffic is going on.  
> >
> > Let's respin this against net-next. The merge window has started,
> > applying this to net would give us an immediate conflict and pain.  
> 
> I'll send this against net-next when it opens again. Thank you.

I mean that you can repost it now, just rebase on net-next.
By the time we apply it net-next will be net so to speak.

