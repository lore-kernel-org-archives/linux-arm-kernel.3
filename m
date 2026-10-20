Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VlBrCuYW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8OsJUtF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKzBstValFuOg3CDf7s3NznDHsW1rCQroiqS+pQQYj0=; b=VlBrCuYWatJsMFOK5rzBdjDf29
	3ZB/lUjN/SSgseh4EfiBub1eQ+bky2rJKOEcTStX6UBNaqNdhLlGayiXtzlTfZ9xM7Z6FOl0tdNcW
	OUyUrTObat0fAiTSDAnUY6OAaO7cZJSxemmhx23/ZUySqd4xv+KWeyLU5/GKGpHvj/ElpVNKwiUvq
	7OFp2w/GnHriIZ+un8n0EfIzZ9VycD2mqHPHREZSQmIPD6At6bFS4dwUo+rw3JS5T39RljNmBeptX
	05IX3v5BXiT8sRFaw6Kod4+N3Z576iwdyZAE+sfDZBOjW/z1oF+vDqppznRZHh6Up1kHYpxCkUMlO
	Wzzoe9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIKi-0000000Akg6-3GMD;
	Tue, 20 Oct 2026 22:29:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIKi-0000000Akfz-1Oi8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 22:29:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5591D42B10;
	Tue, 20 Oct 2026 22:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D7F1F000CC;
	Tue, 20 Oct 2026 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535363;
	bh=nKzBstValFuOg3CDf7s3NznDHsW1rCQroiqS+pQQYj0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P8OsJUtFTzDA/MAstoE8U8cQfWdftq9h9+JO0l3kV7l5tR3Gt0fhKkmubMnHK10pE
	 dFufRGyjjgg1eCrYQqJi6Cid0RufaPDR7OKEWvm+9dG+ZX04Xiu40eK2Bj46KdysV2
	 jSn3fNsx2UMgSmGlug7pvYI9Sg13UwRDCOAil7qctKSrmQ2EXUsyGtNOzIvdN1fG0H
	 nWHcKsu0De4v+ds8GZo0IIEbRmfKOOINzce6mbfNWoIED9d2H81UALCSdRV1L5fEAk
	 n5pPKJvztna5o4CnjFkS4pw+qvwnAn/YGNMynXToFYC7/6z94Amf+J8gzLUam0qjBo
	 V2Twce7yv55rA==
Date: Tue, 20 Oct 2026 15:29:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 xiaoliang.yang_1@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/2] net: stmmac: Track and report the TX DMA
 threshold per queue
Message-ID: <20261020152922.4d06ad30@kernel.org>
In-Reply-To: <466cff3f-e3bb-4581-9e79-f4a980570244@bootlin.com>
References: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
	<466cff3f-e3bb-4581-9e79-f4a980570244@bootlin.com>
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

On Tue, 13 Oct 2026 14:44:43 +0200 Maxime Chevallier wrote:
> That's a nice cleanup, thanks for addressing it :)
> 
> Patch 2 belongs to net-next though, it's not a fix and it brings some user-visible
> changes in the stats.

True. Given the merge window started, tho, I'm just going to apply this
series to net-next in one go.

