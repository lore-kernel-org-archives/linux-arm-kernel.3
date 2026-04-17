Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11303F43682
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUvDMgT2JDILnPFp/rQMG5xa0/FbaPkssLGIWBPbYgo=; b=vcbzeiB+BtXrFHo55ZtcN24aJM
	quD9cJFo1MvIa3g555xHZ1wG8nnXvIHzFCjmQMSSw0Hk5Cd3iIo9+RDScPG3IXFcK3z4edIG1ND5j
	NP7/HJ+HpbRNJF8F+QN3AWCWNl0XDn0gH9UbfX70Bva60JZutblPBkp0W5wtUgohiHaEejPo0FTiY
	B/uSM5a+aZEZ11cE9aRJBhleeKZRL0aViBg+/jNWBGHmKW57VWbZElpHGhs3xAZvsEnQQk545BWJb
	/EJj0O+I+yb4v00JVlHETmcXIO5YYVBns1YdJqlL+yow+wU67BMZMoI8vbAA4JdXCVf1UrRcbelB2
	m2WvrbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDf3U-00000003ixM-04tE;
	Fri, 17 Apr 2026 09:00:04 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDf3R-00000003iwT-0V3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 09:00:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D3DE1D001E3;
	Fri, 17 Apr 2026 04:59:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 17 Apr 2026 04:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776416398;
	 x=1776502798; bh=UUvDMgT2JDILnPFp/rQMG5xa0/FbaPkssLGIWBPbYgo=; b=
	JS/UeliMctoAoIjBE3RhNUS3edBlWLZsyGRgrONFKmz/CiVVFMhHNtetfjM6JtYQ
	vhFE5tdjK6uy+zuwU2ldiI2TlC18ZZ2YZLLNoJXI6zYYalxRAVDM6HW395y87Q/7
	Z1+QaKK3TyTsy7wq1vzXIGQBct7+ddSpDmH7EY5xfyxY/EM+MlqAcwaDNnnK104I
	H8e5gK1lbaSN9/AtAogtApuHRZsCPUEbWWOn5L3j3UBP1BwK4nc8OK43a1iDW8xE
	5wZNs8Ayo/84JGwpCUxJjcTOg7lYQOoXiQbSg6ZVNSDQ76sMI/UXv4v+tSmuMpIZ
	uOBsqxQ3NsYY+gSbaH79cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776416398; x=
	1776502798; bh=UUvDMgT2JDILnPFp/rQMG5xa0/FbaPkssLGIWBPbYgo=; b=W
	aSxT0XqmNdL6YS4/HeSJP2lsDApkXf0O9c9SWzPy8SFX8ZhYhTmisvLzDa0MuAJ2
	7BrehUxkn7QsZTwGuhl/upRnMcM1UAWrVkvI7LYFJS7ImyG9wHlXkET/m53wU0D3
	w03IvFqGs6GlgwRv9/BqT453wti6jJIcNrtCysHJmiIYr/0vmFOyEquKD1a62oSc
	tGhyIZd49KLpeSTvYuk8YQp737LnM6FujUyMG5UVPvuZEqiVugDCDnzfRfz14HiS
	11DN5i/IoZTW9PHHqOcmJ8yb+3W/ZFP5HBRKl4DiWsYaNIeqGr9jWybv6aNzRUek
	EU0bgjIorrZ1l0HPF/Hfg==
X-ME-Sender: <xms:jfbhaVCKzv6Y5_tboWvdprRfSdNQOWe4XLA7ZKJagNGj88goJ1BCPQ>
    <xme:jfbhaeWXg8sJufOIzqIVXDXeu0gK5r2qqDylP8NBILdyki6WdieNCo7Zvi9XKJnla
    C5hyto0XjpqfpjHIR9It9u_IpqRGicpVy0ZzLliu9Vi79O125Tk4DI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegleegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghp
    thhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhushhtihhn
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jfbhaZkiRndjPCwU6sql-kOX10LyujavQxQBoN4M6zLknn8cqvafOA>
    <xmx:jfbhaTMbcbJ58fLah-LqrDOHtB4mfjWZqP9VFCwxbPoEjLUNh71LCg>
    <xmx:jfbhabofCGG5zweFeXghmctJU7-N5LHnIIR6i8bI2NG8mg3lhLoa1Q>
    <xmx:jfbhacs0yuhPrjhyheW8S6qyVgAWvGv4Ym_2dYXv7pkkkmN5CH0_zg>
    <xmx:jvbhaTPSJ6wafZHNswkUf5Vf0rZBdqmkwoEVH7znV98AIPrNVgrTg05d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C1056700065; Fri, 17 Apr 2026 04:59:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AkOrUqlAGQ43
Date: Fri, 17 Apr 2026 10:59:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Russell King" <linux@armlinux.org.uk>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 soc@lists.linux.dev, linux-serial@vger.kernel.org
Message-Id: <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
In-Reply-To: <20260416-send-v4-7-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-7-e19d02b944ec@gmail.com>
Subject: Re: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_020001_641183_42F2BAA9 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu, Apr 16, 2026, at 22:19, Stefan D=C3=B6singer wrote:
>
> The reason why I add the serial1=3Duart1 alias is to keep console=3Dtt=
yAMA1
> stable regardless of the other enabled UARTs. UART0, as the name
> implies, has a lower MMIO address, but uart1 is the one that usually h=
as
> the boot output and console.

I'm not sure I'm following here. You generally want to either make
sure the alias matches whatever number is printed on the product
if there are multiple numbered ports, or you just use 'serial0'
as the only alias if there is only one port.

> +	aliases {
> +		serial1 =3D &uart1;
> +	};

Either way, the alias should go into the board specific file, not
the general SoC file, as a board might be using a different
set of UARTs.

> +
> +		/* The UART clock defaults to 26 mhz. It will be replaced when the =
zx29 clock
> +		 * framework is added.
> +		 */
> +		uartclk: uartclk: clock-26000000 {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <26000000>;
> +		};
> +
> +		uart1: serial@1408000 {
> +			compatible =3D "arm,pl011", "arm,primecell";
> +			arm,primecell-periphid =3D <0x001feffe>;
> +			reg =3D <0x01408000 0x1000>;
> +			interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&uartclk>;
> +			clock-names =3D "apb_pclk";
> +		};

Since you know the addresses of the other uart instances, I would
suggest you add all of them at the same time.

       Arnd

