Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85811CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q31x8cjhxqbSewAbnzNrJKEcVholxMrPXsRc0ZoLdcs=; b=h+DXx0JNZWDJ2c8LcPG+0eh/Nl
	zi+opY5U1+4ZlqaAlYBv5yCUJbqjohFTxAEmZxEZrKjwhZL2YTIvrP8EuN65D7mbRSI6sjnvY6xVc
	U666Z+uZW0i5dUWodSQ4CMvPDdMOJWkFDH83eMUrKerSx62vGnPKdX94a4gC2ADyF0cKQY1kKlzQf
	qeKwFUmmsaQcpqCnEO6zg2zw6lOhun+AGcnoeMBiXhzrPfXwOzrVcFCvDDA91rMZBRY8ktYROrJPd
	qfQDtTeoEmvhLYFuIPDFJUpeNQ+BRrGAAAFyG/tlfcUAAd/FKscDg/QTKdsGjtquII7StFavRKlp9
	4cCiW+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwlh-00000002Nny-3Vnk;
	Mon, 15 Sep 2025 00:08:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwle-00000002NnN-491l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EE7F43E61;
	Mon, 15 Sep 2025 00:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AA0C4CEF0;
	Mon, 15 Sep 2025 00:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757894904;
	bh=6W35ED/5B6DMe6+JEfViwGJLMbiEsNhy58ZClSAv1W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG7Up0puetanBV5R16T9Mr5YOcJLCgaxlDxjZBjU+M0rn926h86BboU2D7lC0/4S6
	 5LCgjt++UOgh1/WThZ8Q4LAQU4yjViY8zK1f9Fgm2jxbL2Rj59LNHwbjwqLssHC39/
	 dLxezNIv5NX6PfJDyd6Xj+baN3I3Tpx7VG3FXUgXlOLG1MiVwonH5wl1FE/rrzvVLL
	 E8bmf3j4k1b4jsIYIXvyUPwxF3I8hSmfOIOR2tb0C5srcGVfHI2ta2YBQVumVp9Z0r
	 AdHPjLMT17JeVft4fvJGJzfK3fT0EQMaI/rMvoi9mnuJFUxTWlwnZWR9MrdLZXnhKi
	 BTg7oKM3lhJgQ==
Date: Sun, 14 Sep 2025 19:08:23 -0500
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Mark Brown <broonie@kernel.org>, Jonas Rebmann <jre@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios
 property
Message-ID: <20250915000823.GA2282513-robh@kernel.org>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
 <20250910125611.wmyw2b4jjtxlhsqw@skbuf>
 <20250910143044.jfq5fsv2rlsrr5ku@pengutronix.de>
 <20250910144328.do6t5ilfeclm2xa4@skbuf>
 <693c3d1e-a65b-47ea-9b21-ce1d4a772066@sirena.org.uk>
 <20250910153454.ibh6w7ntxraqvftb@skbuf>
 <20250910155359.tqole7726sapvgzr@pengutronix.de>
 <20250910164231.cnrexx4ds3cdg6lu@skbuf>
 <20250910165518.bzpz5to5dtwe2z6x@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910165518.bzpz5to5dtwe2z6x@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_170827_070463_441DE04E 
X-CRM114-Status: GOOD (  25.31  )
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

On Wed, Sep 10, 2025 at 06:55:18PM +0200, Marco Felsch wrote:
> On 25-09-10, Vladimir Oltean wrote:
> > On Wed, Sep 10, 2025 at 05:53:59PM +0200, Marco Felsch wrote:
> > > IMHO silently removing the support will break designs for sure and
> > > should never be done. As said, imagine that the firmware will handle the
> > > supplies and the driver only needs to release the reset. If you silently
> > > remove the support, the device will be kept in reset-state. In field
> > > firmware updates are seldom, so you break your device by updating to a
> > > new kernel.
> > > 
> > > One could argue that the driver supported it but there was no dt-binding
> > > yet, so it was a hidden/unstable feature but I don't know the policy.
> > 
> > Ok, I didn't think about, or meet, the case where Linux is required by
> > previous boot stages to deassert the reset. It is the first time you are
> > explicitly saying this, though.
> > 
> > So we can keep and document the 'reset-gpios' support, but we need to
> > explicitly point out that if present, it does not supplant the need to
> > ensure the proper POR sequence as per AH1704.
> 
> We could do that but I think that no one should assume that the driver
> ensures this due to the missing power-supply and clock support. But this
> goes to the DT maintainers. IMHO we shouldn't mention any document
> within the binding, maybe within the commit message, since those
> documents may get removed.

We probably have lots of dead links... So what's one more possible one. 
If the information is useful, then I'd put the link there.

Rob

