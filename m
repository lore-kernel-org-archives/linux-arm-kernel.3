Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D708D6ACC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLuq++YdEMYtNk53nxLF/a+DeKLmrB6uV6hfk/PqmxE=; b=Q5blYolAvw+85La/odaBdtlGtM
	XX3MQhFofN2JYMnvdMMW46y3q89bVbV5RMmovZxNC80KTYYy2TAMrtixKNEtjXBc+xrM+Q4sxQjXe
	bQ22XlVW2aUoE6xV6odMELBMlOb1DiKU9NqV+bhMSUwfEcF/Psbv9DP0jvYVlpbZ+WhiI2RResdnp
	uNj1gay7qdgCF5pPh/bhERb8HEKn5IYGjX/gwTBEtGG/VDiHJ0UgU/HwpiDkA7Xx7HUY/hJRsQQmI
	UXSKOVT3mN/TcgKP/IRWl6llh6Ka1bLEx2/KMQW3zAZnlJ+63fGrCf8aLMkYtSEquqNOqHAhHLd4F
	LmfcD+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGGQ-0000000D1Q4-3loF;
	Wed, 27 Nov 2024 11:31:22 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGFR-0000000D1Ju-3RSC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:30:23 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D884114013B;
	Wed, 27 Nov 2024 06:30:20 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 06:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732707020;
	 x=1732793420; bh=YLuq++YdEMYtNk53nxLF/a+DeKLmrB6uV6hfk/PqmxE=; b=
	HdBnZdDev+jBlkDD3YVbHlELQfgWBIPJPIZ9wetQrERFJBqe0YPmrxbtuZLEA7TA
	Y1fKt/S1E50ZvnxuXpZch4b9sGyA6VZh2ViQK9bpIJuoMsgVLfvOsR3Ang464HET
	DA8kRj05eTQBkJUG1BhfpakX/f9cmLY1Qj8aIeCQUhjqdcIK8yoy7iEFrQ5tvMe4
	aa65CIyMofbErT7RDEFiGBX6tUC7knqkqftJAyWvVnIvK7AV6o3Mj67wuzBoXRVS
	NWTLWIvm5x1pyacW4/FEqCwThOJ+StA+qpakhqCdVYUA+BuI2Vls4GeIe3wsFOel
	SmDGaKlPZHnQuE+bC60KvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732707020; x=
	1732793420; bh=YLuq++YdEMYtNk53nxLF/a+DeKLmrB6uV6hfk/PqmxE=; b=a
	qH5CTLmVdf9VIFUGwBb03yguiiJiw2tOTVfbhza0n0tG2ztGSTFvHnltstduiMtF
	X5qpamG1a7TAyml7DJ+38o9oewEiKJQJfNn2Fa8W2NLf+ungc/VjEBMAgFVusKdJ
	l5HNsBgccFS+9iuC+af1OejA9eJdxHvvYMITWcg3590ZnkoVHjSNFYkXOeUQcy2C
	lts3a1k7zjaWZg+o+rpc8sbsLLLi3G+PXYfjrQS3RtbVsQhIg+iEWA3wOdG2ToYc
	9/YvoGyioODNWL5jfQFxjKyurxAJtey94NBedx+9JM9Dvh4VopP0xAANr94shxPZ
	L25AC7lpx29J32S9usgIQ==
X-ME-Sender: <xms:ywJHZ-gLGM5CIy6Qhpn6A_PRoc3tpsSIedxb_PRU5VHtNYrMmHPj5w>
    <xme:ywJHZ_Cdxcxojcyno2Fw0OiXfUyc4H28kpDm-CTMPlmRZ0R4wJpW7DAh9ecjJ29ZY
    vOrKI3hdPjhEZwhS_I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedtiefhffdthfeileevheehveevieeggfegieeggfel
    feduudevgeegieetfeevgfenucffohhmrghinhepfihikhhiphgvughirgdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehfvghsthgvvhgrmhesuggvnhigrdguvgdprhgtphhtthhopegvshgsvghnsehgvggrnh
    higidrtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgt
    phhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegrihhshhgv
    nhhgrdguohhnghesnhigphdrtghomh
X-ME-Proxy: <xmx:ywJHZ2E3qmzeci5Eq22yWxTdtIijiLONNqq-lGZSkz7dYWHoz_Ig5Q>
    <xmx:ywJHZ3QmiqJi-uIBi1awqKF5Uvdn4LC6kLCyAgmLARkg4aQXCttmyA>
    <xmx:ywJHZ7xbkpoFbJKvURCphY35123mN9i-5AJEVAhkWXkWLrAwi0nh1Q>
    <xmx:ywJHZ16T8mi2o_0ZjyaCWCyho8CnO1XdOpVFuOIH_oJ3NuQoqIx8wA>
    <xmx:zAJHZ7BpNBWOuHZW1CyS4omKmSBo-FKJzW6EnrRSnPHb_jJu8Xw-1j4_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 79DEB2220071; Wed, 27 Nov 2024 06:30:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 12:29:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rasmus Villemoes" <ravi@prevas.dk>
Cc: "Fabio Estevam" <festevam@gmail.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, "Russell King" <linux@armlinux.org.uk>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Dong Aisheng" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
In-Reply-To: <87ldx5htm3.fsf@prevas.dk>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
 <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
 <87ttbthwdu.fsf@prevas.dk>
 <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
 <87ldx5htm3.fsf@prevas.dk>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_033022_473850_DC5C2B24 
X-CRM114-Status: GOOD (  25.55  )
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

On Wed, Nov 27, 2024, at 11:13, Rasmus Villemoes wrote:
> On Wed, Nov 27 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Wed, Nov 27, 2024, at 10:13, Rasmus Villemoes wrote:
>>> On Tue, Nov 26 2024, Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Please never use imply. Even if you think it's the right
>> thing in a particular case, it will come back to bite you
>> later.
>
> Could you elaborate?
>
>> See also https://en.wikipedia.org/wiki/COMEFROM ;-)
>
> Yes yes, we've probably all seen that at some point and chuckled, but I
> fail to see why imply would be worse than select.

There are multiple problems here that I conflated, let
me try to explain better:

- The patch here replaces a hard 'select' with a softer 'default'
  for the i.MX drivers. Both variants are used in multiple
  pinctrl drivers, and there are sensible arguments to go
  one way or another. However, mixing 'select' and 'default'
  on a given platform would be wrong, and my point here is
  that mixing 'imply' and 'default' on a single platform is
  just as wrong, specifically because of the COMEFROM issue:
  even if it all works as intended, a reader will have a hard
  time figuring out why exactly it works like this, and this
  likely leads to bugs in the future.

- In the more common cases I've seen, the use of 'imply' is
  itself a bug, usually developers pick it because there is a
  hard dependency between two drivers, but using 'select'
  causes build issues, either from broken Kconfig constraints
  or from link failures. I tend to find out about them when
  a randconfig build still runs into the link failure and
  the 'imply' just made it less likely to happen.

>> I would prefer we completely kill off that keyword from the Kconfig
>> language and replace it with the reverse 'default'. In this
>> particular case, having 'default ARCH_IMX' in 'PINCTRL'
>> would of course not be a great idea,
>
> Just to be clear, it would be 'default y if ARCH_MXC', not 'default
> ARCH_IMX', right?

Either one, the two statements have the same effect in this case
since both ARCH_IMX and PINCTRL are 'bool' symbols.

Overall, my best advice here is still to not change the way
i.MX pinctrl works at all, but just fix Layerscape to not depend
on i.MX. The reason for the 'select' here is clearly that the
i.MX machines would fail to boot without pinctrl, and changing
that because of Layerscape seems backwards.

On the other hand, removing all 'select PINCTRL' and instead
using 'default' consistently may be a good idea for the
long run, especially if we want to do the same for clk, irqchip,
timer, regulator etc. At the moment, we have an arbitrary
cutoff where some subsystems are always considered essential,
while others are always considered optional and some are in
the middle even if turning them off still makes the system
unusable.

       Arnd

