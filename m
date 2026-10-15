Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5134CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDbldnx1eZ//vxHr0/tLnnKthK+28bXbrhnsFJMTMq4=; b=ouFU9nCQwLpA1vqqIisMmHtusj
	HfHBK5+SCgtd8DHweLVa3VMIRyVMIP3c+OnsPJcREthe3clIfoiRnqo8IRSSMjyDG8xIbCHY8XG2F
	pD7AJ1g3oFcAX/l/WAPcGA6UmzXhzqNFat4kNKITVt74+bM5LXrYLmJVCmwxaAEkbDCZ47kQsojl/
	VLImO5OG2KhiIrOeCpIvLclY6m6EOaYYt7CQ6rVuWLOGEgqAkU/zUfzpVuuBF4zRj1sI2kylCcs5G
	bQ15xdJz3o1yV1GQQDB7S6DsKmf5ILMokx6TbPXUAxyrhfzty3ut6r4l/8BW6jKlzd3MKZxj+Qzo5
	gbZb1cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHV0K-00000001Z5G-0zvY;
	Thu, 15 Oct 2026 23:36:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHV0I-00000001Z59-2zNs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 23:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E8394357D;
	Thu, 15 Oct 2026 23:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572CE1F000C4;
	Thu, 15 Oct 2026 23:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792107414;
	bh=sDbldnx1eZ//vxHr0/tLnnKthK+28bXbrhnsFJMTMq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LY1JkJOSLWADAUm2I/Ja+wKOJr1N8GWTCg2z8p4WsmRVff5Mcd+0aY4w3tasZQPIo
	 AIhAJbC/qQKbF1SPIXnGZN7q3lFjt7vJ/sxbHym2n32/mjTZ0Jv8CQgrApMLbBsCli
	 LDQ7RIgjtM4H7Q0630uBo1C2IcxF+5B5xKkx0PinrSJAJ+9n53N8r566qjsgmnapHe
	 39wFrB3HlZPJOx3+fHuKnbY5mSKy6SCyZl5n/hCgut5oxbcZPF+q+0YycoPdmdTFlt
	 a486U9wor6hBV3XjRYN9p790SDDQEb4KrU89dl6KOZt7aHXUZ1hCv8UJOPJCaTnXgK
	 zSOFCAEQ7stxA==
Date: Thu, 15 Oct 2026 16:36:52 -0700
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
Message-ID: <20261015163652.21ff3a98@kernel.org>
In-Reply-To: <bfc0027a-932e-42f3-93b3-49ab5474abd6@bootlin.com>
References: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
	<179121059086.434549.5364767976780818051@kernel.org>
	<d6e61c8b-cd3d-43fe-b4ac-19ff5d790b0f@bootlin.com>
	<20261006163349.61c738e8@kernel.org>
	<bfc0027a-932e-42f3-93b3-49ab5474abd6@bootlin.com>
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

On Thu, 8 Oct 2026 11:04:44 +0200 Maxime Chevallier wrote:
> >> Yes it does, that's the intended behaviour here. RSS bits are all optional,
> >> but does it make sense to report hashing params when the indirection table
> >> is size 0 and key len is 0 ?  
> > 
> > Not sure if there's an implementation in the tree but 
> > it's possible to implement poor man's RSS on strict
> > power-of-2 queue set with some hashing built into the
> > Rx engine, without a key. We'd still want to control
> > which fields are hashed in this case.
> > 
> > In the Netlink API we combine the two so we'd break this?  
> 
> Hmm I wasn't aware of that :( I guess the safe choice is to check on -EOPNOTSUPP
> for .get_rxfh() + 0-len indir table / 0-size key and skip the device during the
> dump instead of returning early ?

Not sure I'm following the suggestion, isn't that what the v3
already does? I think the API was suggesting we let the device
progress into the dump, and rely on the existing "unset" checks
before the nla_put_ calls filter out the data which wasn't provided
(which may be all the data).

Not sure it's worth it, could you poke around to see if a device
which reports zero-length key + indir table actually exists?


