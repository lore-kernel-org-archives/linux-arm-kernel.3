Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680BDCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm8j7s6dPbe68KVfUZh47NlPhrjF01bigXUXsBDCEJA=; b=VErSXjc40qXxPidmWIYB6y+pMY
	xMZuMHsUoppDT9P0ST9OAECV7SefsnS051xuiZpLotpNQFrbQg1NXtK+5HPGHQtd7swhKwhVoph7n
	R0w+rUQu0O0U+cw/Y2P9F4znLWYozpxjaTwuHDNOgu2ZLy1UHmmXnkAIQhIlVgGfIKgcN0yoHjy+b
	I2HI6sWxMd0KvTSiZMWkCF2pE8TsUa92sZ9SeO7qzK8yIrcuNo7u8SNfm3IOZ4CaIdw6IETM89tUd
	JhKsk9jDFkYnRZvV8mtA2xLneAlSdi5KA6Zrx70JjKnQ0JU7oHHNWDeZOWFdYDC4sgG2Mt8XSm/iK
	wKzfJpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEfR-00000001Umf-0m6w;
	Tue, 06 Oct 2026 23:33:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEfQ-00000001UmQ-0H5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 23:33:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15680402D7;
	Tue,  6 Oct 2026 23:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458C11F0089B;
	Tue,  6 Oct 2026 23:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791329631;
	bh=zm8j7s6dPbe68KVfUZh47NlPhrjF01bigXUXsBDCEJA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LvUyGXERuHldy1RvQ0Y8rrzYpA/YI/r+2a1j9oknazUvbUrCHMLeoLeDQX8ZwhRVG
	 z8q0k5GuuU9KxJq0q+H4n74pDWMa+qW2CybIrZQulQShrjCwMnjTlOdrkum3ss7xXM
	 76GJ3otPNaz/ZiZ1XgePKUxFuQSMN82dtM05mL6EDJb5F0Hd4eQJhRV2Kbdk3x8TTo
	 JjLMXVi7/OTtP4whUpRLP+aW5WPdrrCpkQ41nZSOq+CAhPa1+Jku1xySfaMhyFdEmA
	 0n5LPO/nyFTmEdxoYBcKCmfjYD2IGasey0tkRIjYFcLNpahx6ht/xIN+Zk5axDeKEM
	 scg7F4PsAEaWg==
Date: Tue, 6 Oct 2026 16:33:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 jitendra.vegiraju@broadcom.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com, joe@dama.to
Subject: Re: [PATCH net-next v3 1/3] net: rss: Require indir table size or
 hash key size to support RSS
Message-ID: <20261006163349.61c738e8@kernel.org>
In-Reply-To: <d6e61c8b-cd3d-43fe-b4ac-19ff5d790b0f@bootlin.com>
References: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
	<179121059086.434549.5364767976780818051@kernel.org>
	<d6e61c8b-cd3d-43fe-b4ac-19ff5d790b0f@bootlin.com>
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

On Tue, 6 Oct 2026 09:59:29 +0200 Maxime Chevallier wrote:
> > [Severity: Medium]
> > rss_get_data_alloc() is shared by RSS_GET, RSS_SET and RSS_CREATE. Does
> > this drop flow-hash reporting for devices that have ->get_rxfh but report
> > 0/0 sizes?  
> 
> Yes it does, that's the intended behaviour here. RSS bits are all optional,
> but does it make sense to report hashing params when the indirection table
> is size 0 and key len is 0 ?

Not sure if there's an implementation in the tree but 
it's possible to implement poor man's RSS on strict
power-of-2 queue set with some hashing built into the
Rx engine, without a key. We'd still want to control
which fields are hashed in this case.

In the Netlink API we combine the two so we'd break this?

