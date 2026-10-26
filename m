Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEAB606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 02:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c8VSVGPi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=33Z96V7u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=If3HWL0JukjflKpqf96xpA2ykeHffj+qfMocs+Us2t8=; b=c8VSVGPiEnyVFNbIc2bR6yb1Ba
	CE/6euflAWUSWZ8JVY/D/CmoYwknbxrwQdFd5Ksool5d11iOWIW05MXxllsZeInHjlzkWBFXoXkKV
	9JawyK3052eSS/zu4Tg62M8MH2sUjuJ3C2kYYkqeeVccf5vFmBUt7y7FpMs/hF/HBgD6HbMroLSHr
	zcUfsZQfYBPFuECcWnCYjY07Mf2WoZaNHUXgAnYpxdrEm/xL2HcWyBoaYvZDDU2C5z4U8AtvjVF3D
	8eoJ0RR8BJMpeopBa583Us6A0x0yHII/aHPPxilsWHLsU9p5AX3A0eu5K8OJnr6o3ih12cvMnw1uK
	WcpMuklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLA3A-00000001ahM-3lgk;
	Mon, 26 Oct 2026 02:03:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLA38-00000001ags-0VbZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 02:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=If3HWL0JukjflKpqf96xpA2ykeHffj+qfMocs+Us2t8=; b=33Z96V7uKHmJYA4kqMyKvxyWRr
	SY+8c0tjqz9TIfZcZAkLR+RYcIVqayY7li8Ikr5RGProVdbChN4oCS6ntcopLFVec4vA+OJrwyI0i
	y8l2KMsyuvOwaFOxT01JiT3vt+5Jsx2f1F3qJamwxvBy0A8GPlaCwFEXSk8ETBXGyKpw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLA2s-00Cjim-Ru; Mon, 26 Oct 2026 03:02:42 +0100
Date: Mon, 26 Oct 2026 03:02:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: thunderx: fix fwnode_handle leak in
 bgx_init_of_phy()
Message-ID: <bf64600f-81fa-416d-8d2d-9149e5b62a43@lunn.ch>
References: <20261025203159.455100-1-mashikiselby@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025203159.455100-1-mashikiselby@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_190258_184618_C9FD421D 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 10:31:59PM +0200, Selby Mashiki wrote:
> In bgx_init_of_phy(), device_for_each_child_node(&bgx->pdev->dev, fwn)
> breaks out of the loop without calling fwnode_handle_put(fwn) if
> to_of_node(fwn) returns NULL.
> 
> Switch the loop to device_for_each_child_node_scoped() and remove the
> manual of_node_put(node) calls so the child fwnode_handle reference is
> automatically released on all loop exit paths.
> 
> Fixes: 9d28f9491258 ("net: thunder_bgx: add a missing of_node_put")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>

Does a leaked OF node bother anybody? I would say no, so please post
this to net-next.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

	Andrew

