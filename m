Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15238606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jshesQbZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=byp2i7pb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fU2ChYjBPo4nvLGQJzBPlznzncMEQQvQBt25dnNrUZA=; b=jshesQbZA0gxUMPAZnV86q1JWj
	CLpkWRPa+WZwmYmiZefcKPnYessZgy1BRSzCF+X4A6iEs8L9mi1ovcIchLwdBemZvcXKkcjrsOZy9
	mEquHPWg3Yz1vHql8tTBE4gpL/SW0e0bUFDDMzW9i9xOu9IvvYV7Bw1Msi1LMCYGtXeba0I79+TY7
	tAXGtXjcOJfsaaAAnAFk0GewIbwTBaXES9JY0hSq2ZE/O8iyFIjrbkduihGFchL34FIrzMwiIqh3B
	2IoqiMNcacx02bxzjveLLqHEe9hN8Bu7mee6PDrMTincKryG+IGzp2csSi3195XbH1RKNH5Zuiubu
	JlvD+9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQu0-00000004AvV-0Led;
	Wed, 04 Nov 2026 02:39:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQty-00000004Av4-0hg2;
	Wed, 04 Nov 2026 02:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fU2ChYjBPo4nvLGQJzBPlznzncMEQQvQBt25dnNrUZA=; b=byp2i7pbwSpJjX7Rve32SDJOEe
	DNPA3fxdUxb94g17nXBBVarGELm75stL4Y52Jw7LARakl6h11TZNGbVVhlNGtkJtfowWzmSmLp+Bf
	4haX3JtFT2RcdcaRWt06zePifYhNUkGzei6pMmD5Lb3WFA12zL+CO5JQCpxSCCWUuyHI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOQtj-00EDr5-Rq; Wed, 04 Nov 2026 03:38:47 +0100
Date: Wed, 4 Nov 2026 03:38:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 4/6] net: phy: mediatek: split Airoha code to
 dedicated source
Message-ID: <5cc94032-60b6-4154-bf19-26fce16e738c@lunn.ch>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-5-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103221439.30502-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_183902_231151_8C0F6359 
X-CRM114-Status: GOOD (  12.93  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:14:35PM +0100, Christian Marangi wrote:
> In preparation for Airoha PHYs software calibration support, split the
> Airoha code to dedicated source following Mediatek naming pattern of
> "ge-soc".
> 
> This is to tidy things up and not overload the mediatek driver of specific
> Airoha code and ship a bigger PHY kernel module with dead code.
> 
> Move the shared LEDs function to mtk-phy-lib to permit the split instead of
> duplicating the code.
> 
> Also add myself as MAINTAINER of the now new airoha-ge-soc driver.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

