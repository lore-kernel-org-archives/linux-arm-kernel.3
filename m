Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00691C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WooKxSWp5+7w/ZcuqR2kzT/R011tLmNtXUvNvyQbLxE=; b=EaanUANCvl39kxa0OZacbZr5GI
	PB7fSe8/uDgV6mz3FIInFbNkI5oeDDNnO/uDwHnm7FER1uLQqALp8CCPg4wL3W/xd8kaZ4uECPzSn
	JZE4K3KlBrjq4LS/WplMFOfj/qZXdOpca+FdbDm2q0btb67HcuSFsUnHsl2syv3AGKrKlJLCa59JZ
	QTfvsdgtzM6zK+VgN6wardSiWykBy8QWxlnb3DLiWlhVHTbSucEnUgA4MTicjvyXZ9165iz/nQLj6
	3v93mme+1yPI9nMZ4fqjidhRQx6SCr84uQIbQAizdld9NAwl86x8pf9MEiF1sJD/QKIHY0zJj/Gwb
	BUxBmwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9izf-0000000B1fs-37xK;
	Thu, 24 Sep 2026 12:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ize-0000000B1fm-2ozx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 12:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WooKxSWp5+7w/ZcuqR2kzT/R011tLmNtXUvNvyQbLxE=; b=Cy3j6JzpAd8Cpb2+8JnIuONEYF
	c27/VSdmzkxDGCIiO4eVdtMUP2vsLCkVhOpE6jiHEWSM1ivMYhejKcLBC9Xjkkm6No2QC0lzjaXVl
	jAwQXqv5C/i9nSLO7F/LFdUcZBQgybfxjRpb5dhRexMVkrYw3rM7ooDF+CVqtRwaJYvTXR5i2lM/x
	on7ZNEiX8XewwpYzj7I+QmfE/+KEETAjHTGdll6j3wT+NoFKJrLvc2A6m7zKSeG9zEP1Spqk3GvwI
	JuWyrqPh9qSyTpXGr1zU5HtAFRPbmCw08x6C7O0RTVGn9CVFC4bsYRa7cXkmtPHB7mnaI2DO5lEKk
	z8AAkPAw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9izb-0000000Fzmg-2X2z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WooKxSWp5+7w/ZcuqR2kzT/R011tLmNtXUvNvyQbLxE=; b=1wKXFamb0XGKIsLJQ81FM0af36
	yr1BhcmXo+KunorNssde+pcUZTWF4bD0w6lYX16pq5M+RUzAIk7aQTojBm6GLBDX9xX4SlhwfYhjj
	UNqD5KDprVcoKlJPtYZoI2Rb5Tz9nh1hyXvw1hbQDDCJY2u7lgkLUH4xFD7If3hrboJM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9izS-006zgF-SY; Thu, 24 Sep 2026 14:55:54 +0200
Date: Thu, 24 Sep 2026 14:55:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay step
 configurable
Message-ID: <c2de8c6b-807c-4308-90b5-cfe40c73fd0f@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
 <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
 <1j4iff9gig.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j4iff9gig.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_135603_779504_661B50F7 
X-CRM114-Status: GOOD (  12.89  )
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

On Thu, Sep 24, 2026 at 10:53:59AM +0200, Jerome Brunet wrote:
> On jeu. 24 sept. 2026 at 04:30, Andrew Lunn <andrew@lunn.ch> wrote:
> 
> >> +	 * Correcting them would break the DT ABI of the published DTs.
> >> +	 */
> >> +	.txdly_step_ps = 100,
> >> +	.rxdly_step_ps = 100,
> >
> > Could you be a bit more specific about what published means?
> 
> DTs like those ones:
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts?h=v7.3-rc4#n88
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts?h=v7.3-rc4#n87
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts?h=v7.3-rc4#n106

In tree. That is fine.

I was initially thinking it might be out of tree. Those we don't care
about.

  Andrew

