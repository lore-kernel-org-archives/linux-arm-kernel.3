Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DEFC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scGHDOQsniGl9/8dMOFDd/VQBe6gjQ9BCaox4rixqOk=; b=3/HbLAxZWbenxoNcckIcHmryuo
	GXTxtodzkhctT8ko8GM26OGcTSVEYH++agHSH936ZkWC1pG7jpYobGrlffd+Al8LPDd2CFCHvIulP
	/7QvhjVdtGcmCumV3pGcABTfL6qeFQtEZH6YHRnxRrU4LkiDbRhacsL8oqwZH/iGpfNyAc3TQb+xT
	QaetNGKa6deDjfjQiZffeSKCSydxJQSs3UodKCocyMHsfZ2deY9zHtidvHxDz36WBLMWySXBQAVu9
	tQv3LmkAowKOHHMCEEmKysRU7WO01wEGOQN3izI4nNjb2mGrgYckx462Xj951UbvmePD77htacIes
	1SIfaBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0PA-00000006XEB-0nM5;
	Mon, 17 Aug 2026 16:41:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0P8-00000006XE2-2WWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:41:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C51EE600AE;
	Mon, 17 Aug 2026 16:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA621F000E9;
	Mon, 17 Aug 2026 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786984901;
	bh=scGHDOQsniGl9/8dMOFDd/VQBe6gjQ9BCaox4rixqOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NI1tcbW88D/JM4DsY4r+8J6LPn4hOSRzw8om06DAydAEI9MoXW1UagY8v3foAQvBD
	 t9pNJtGBrJcLO4jPwhkmMVuQuWmqhM/pjr82G9XPEIA+lq9tAL/a0RdqFlVA6Xrxni
	 LOG5/P/oDuyn8a8Xo/farbHJfm3Sr7WMfZmwEddTBaDdENaboTDf89/Se2N3PKT4YK
	 WLqR6a0pSg5aHgaAv4nIB5n3yRrFUVgqtco9jCcSHdbysuPbS4LTRMFdZMaReyV5+G
	 b1z9EVvPoBKAjs+IRqY+ntT8NbuzQ7/mlMGFZYzt8oXjBwsynFRtQjX6Y40qkRtKa1
	 A0nwgjKJ175hg==
Date: Mon, 17 Aug 2026 09:41:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: stmmac: improve TSO/GSO queue
 selection
Message-ID: <20260817094140.0e92f54c@kernel.org>
In-Reply-To: <aoJwbQ-v--cTcysz@lore-qca>
References: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
	<anybM_3Rdg8X8CMs@lore-qca>
	<20260812161038.5602eac9@kernel.org>
	<an4qzUrK62-rN7Q6@lore-qca>
	<20260813172156.0243cb7a@kernel.org>
	<aoJwbQ-v--cTcysz@lore-qca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Aug 2026 04:22:37 +0200 Lorenzo Bianconi wrote:
> > > thx for the pointers. I reviewed Russell's commits and I guess we have two
> > > options here:
> > > 
> > > - manages all the TSO/GSO checks in ndo_features_check() (stmmac_features_check())
> > >   and disable TSO/GSO if the selected queue does not support checksum offload
> > >   or it has TBS enabled. In this case I guess we can drop ndo_select_queue()
> > >   callback completely (it does not make sense to me to always use queue 0 for
> > >   TSO/GSO packets, e.g. it does not allow proper mqprio offload).
> > >   Please note this approach would introduce some performance regressions with
> > >   respect of the previous implementation.
> > > - implements TSO/GSO checks in ndo_select_queue() callback
> > >   (stmmac_select_queue()) in order to keep TSO/GSO enabled if the selected
> > >   queue supports it and at the same time do not always use queue 0 for TSO/GSO
> > >   packets (proper qdisc offload). Please note this is patch I am proposing.
> > > 
> > > What do you think?  
> > 
> > I don't know this driver, or how it's used.
> > 
> > From the commit message it sounds like "if the packet wants TSO and 
> > the queue has a scheduler enabled - take the packet to another queue".
> > Presumably you know why the TBS is enabled and whether the packet
> > should or should not be going to that queue in the first place if
> > you're sending the patch? What is the use case?  
> 
> Reviewing the driver codebase, TBS and TSO can't be enabled at the same time
> for a specific queue (TBS is not enabled via DTS but it is hardcoded in the
> driver). Moreover, for some devices (e.g. dwmac-intel, dwmac-mediatek, ecc.)
> TBS is enabled at bootstrap for Q1, Q2 .. Qn, (Q0 is never a TBS queue) while
> for others (e.g. dwmac-stm32, dwmac-sunxi, ecc.) TBS is not enabled at all.
> The current codebase forces TSO/GSO packets to Q0 (since the current driver
> guarantees Q0 is a TSO queue). However this approach does not work with qdisc
> offload (e.g. mqprio).
> I think it is clean to just move the TSO logic in ndo_features_check() and drop
> ndo_select_queue() (previous option 1) but I guess this could introduce a
> performance regression with respect to the current codebase (we could disable TSO).
> If we move the TSO logic in ndo_select_queue() (previous option 2), we could avoid
> forcing the TSO/GSO traffic to Q0 if the selected queue supports it and
> at the same time avoid any performance regression with respect to the current
> driver.

Sounds like we don't have a clear understanding of the Intel / TBS use.
I'd rather risk introducing a regression for them, and have someone who
actually knows this system help with the fix than accumulate
incompatible workarounds.

