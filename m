Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69054C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 19:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQ/A6Z/tfJAyyuEuq3GPaZ2RlFk7bKMtA3pFQ9fdJF8=; b=U/7K5iSmRp/VIczwqx21e+UiEp
	4hvdx6FlyA35hiaNXeXsLmITYo7I5wpE6SWRlzqsATytrKx2Et27jlKnrG9WIQBBKHO5QAFFK3Iii
	A7ZxbA/JPkNXcGoZwJ5Zi7BPBrIeLOHE5CZ8aoAIfQ8BVGeUqIKtTON7zpup5j08Kaq8uajulMOdW
	+sWWhZe76iGGmB2brij7GyFnZNsiAC94pbNTFxK02ez+XszwU/EPYzPJFlPqLIDPfA/NbU2iptD0a
	TdgQifXcKGIKz25dtKCKOw3t0TE99O+JmqirNeIKjmIz3UAJR/o0/I/KyLBOvdpw9O8pCcUFcbyDd
	+WFkjNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkjG-0000000GbT1-2QK6;
	Wed, 07 May 2025 19:46:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkhJ-0000000GbKO-2Pc2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 19:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA1C443B2E;
	Wed,  7 May 2025 19:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B39BC4CEE2;
	Wed,  7 May 2025 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746647092;
	bh=q4hIvtoNu1oOGcAKyK/6LoLwv0LjCdfMt4xNiihRoZs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qPlzZc0VbmcBh/IBRlviaOz38xt5NO496/SGC3ggUSWMOx+oBrVl2jObCeavNvfQ+
	 R2Yi7Nlm9rfbJgoaXwyCKj2+ORCv6v0HaZJ0vqGuwN7Es/6uNpXxzd6A98Oqag6/4Q
	 KLKfNStxTE+v7NgktYd/xEvLRGaIYYxg8sv8f65ld+ldjyPrDGSxRLJDlxz/jXV73e
	 fgZWLjaXcVfUI2r95d5TaZJEvSNNaR5PzP6cwA0c9orH+RhqEOdelSyuxSVp3PCvp2
	 O4B+hWoqwNALx3co7BWGW3jVCf/SnTxgH2PwTHEn19aVaECO8D2/8vMdJ6+gFGt4gf
	 D5t4O/WiNTw+g==
Message-ID: <8513c30f597f757a199e4f9a565b0bf5@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aBprHfQ7Afx1cxPe@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com> <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com> <aBprHfQ7Afx1cxPe@apocalypse>
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided by RP1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, Masahiro
  Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>
Date: Wed, 07 May 2025 12:44:50 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_124453_637416_97200423 
X-CRM114-Status: GOOD (  18.27  )
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

Quoting Andrea della Porta (2025-05-06 13:03:41)
> Hi Stephen,
>=20
> On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > clock generators and PLLs that drives the sub-peripherals.
> > Add the driver to support the clock providers.
>=20
> Since subsequent patches in the set depends on this one and as the next
> merge window is approaching, assuming there are no blockers can I kindly =
ask
> if you can merge it on your tree for the upcoming pull request?
>=20
> This patch should apply cleanly to your clk-next branch except for some f=
uzz
> lines on MAINTAINERS. Please let me know if you want me to adjust it.
>=20

I need to take the dt-binding header as well so it compiles. What's the
plan there? Do you want me to provide a branch with the clk driver and
binding header? Or do you want to send a PR to clk tree with the clk
driver and the binding header and then base your DTS patches on the
binding header and send that to the soc maintainers? I'm also happy to
give a Reviewed-by tag if that works for you and then you can just take
it through the soc tree.

