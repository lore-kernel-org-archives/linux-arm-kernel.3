Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1EFCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKUaFCacTQWmQr8n2TjbN4DQwtg9kdMWdI+WTObxrBA=; b=z10eLNcq7fROEI5QaxndmZkC5n
	OlFt65jnLpKvQltDdi0jBudiVQu7V116qIBETsF/2ui1GilWZRvmnGFAkE1WXq4r7uqMM8l4FI6sn
	WnySK1CrrjX76LqIZs6bxYS8RHhMGN023/euHqOc7VaNWK5wUH4BE4MUKHGsgpwjJPftakIihTwms
	UxVRpieabXm/aUVPolebgNhbDGWxI4TzGcO1+l7t8giErr2tAxUGOxS5TSP/REQPJZaiFz2nJzKPq
	bcpmJUC4Q5PoXo87YUB1JFbgBrNtXMnj1is0+ZSD4RwM68uJcyNzhtXQvfzdEMNurjO9k+twFihGj
	bJLWwbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHTr-0000000F04s-0p9B;
	Tue, 16 Jun 2026 00:16:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHTp-0000000F043-0pbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781568987;
	bh=RKUaFCacTQWmQr8n2TjbN4DQwtg9kdMWdI+WTObxrBA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QMI/IHg3RKAmtHyfDwCfFr6Xt61lvSz8XYsLBaduQrmlCR0nvKeNRPKERL7At5v5D
	 7wlsCeyvSZikD3A4Xf1uDOqKm8vYDdBxzT5KOolMb1Wyv/m4M2YVa6HCeCkuC+xXIg
	 VrX6sz3C/qUV20c3y31b8DjA/MDIS9QMX6MeUOhQ02e//CGxBoEGqtQ60b6HdmE6vF
	 RFtbmNbJVI2RRKD3cmRv/BtpOP/JwvlTNyq+VCjbDr1RUM9MuJ854wQ6TAcn9wbAxH
	 UrdOf5/kdPd2QeLEm8zgemaE5lm8mxMCmLp0L9LLlY/pgAT2O6dcG3yBkBUCL4kwAY
	 AGcXesseuwIoQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE1786001B;
	Tue, 16 Jun 2026 08:16:24 +0800 (AWST)
Message-ID: <e5822b82e99f8c2f81deecfeaea2192b223dfbec.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com,
 linux-aspeed@lists.ozlabs.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	anirudhsriniv@gmail.com
Date: Tue, 16 Jun 2026 09:46:24 +0930
In-Reply-To: <CAFi2wKanAH+ekKz3eVtdiz=pjEvmKwSh1XhE-Xo7p=CCiSWpEw@mail.gmail.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
	 <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
	 <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au>
	 <CAFi2wKYzUDY5Gis9GaHdqeYdv-orHB+gWfLXkJBgbxfbnRgorA@mail.gmail.com>
	 <CAFi2wKanAH+ekKz3eVtdiz=pjEvmKwSh1XhE-Xo7p=CCiSWpEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_171637_440973_96E01298 
X-CRM114-Status: GOOD (  20.56  )
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

On Fri, 2026-06-12 at 11:21 +0200, Gr=C3=A9goire Layet wrote:
> Hello Andrew,
>=20
> Anirudh Srinivasan and I have found that IPMI over KCS using the
> PCI worked with the stock ASPEED bmc driver (the bmc driver in the V1)
> but not with the trimmed-down version in the V2. I have apparently remove=
d
> a bit too much from the V2 , but that's not what I want to focus on.

Sure.

>=20
> This brings back the question of where we should put the registers
> configuration,
> considering that two different functionalities depend on it.
>=20
> > It is also possible to put the SCU initialisation on the
> > 8250_aspeed_vuart driver
> > directly. This could be activated with a specific flag added to VUART n=
odes
> > ('pcie2vuart' for example) on the DeviceTree.

The concept sounds reasonable to me. There's probably some bikeshedding
to do on the devicetree property though.

>=20
> Similarly to this idea, we could include have the necessary configuration=
 in the
> 'kcs_bmc_aspeed' driver. This could be activated using a similar flag
> ,such as 'pci2lpc'
> or 'pci2kcs' directly. However, this would result in a lot of code
> duplication for most
> of the configuration.

Can you outline the duplication you're concerned about? I think it's a
matter of resolving the SCU syscon to its regmap, then performing the
necessary accesses?

>=20
> The issue for me is that, two drivers configuring the same registers
> is not a good idea.

I think it's not as bad as you make it out to be. The SCU's regmap
protects updates to individual registers under a lock, so concurrent
modification isn't a concern. The hardware design choices make all of
this slightly awkward for any related software design. As an
alternative you could implement a mini subsystem that relevant drivers
could call through to set the bits, but I currently think that's
unnecessary work.

Andrew

