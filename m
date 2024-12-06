Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1806E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yttDIhvUtMw6e5hq3bpLC7IVE+x1nQ+E4Z0RE9OfEO0=; b=wEcvpv4pQXZ0CyEqZ0t3j/kKXi
	rupKv5In8Q4gkvTasSjyx2uZ4Zbzx8+VEMwhlEwNVYFNbhYTsmsa/1mcWZIGW8N6dsnOc0/oHdF36
	640vLsbhicqpc3Kn1QCAm15VQgUP6aW8+RZ+yuNiShHejNCRkHVC49+x5J5ske7n3RKRy5R+JkejA
	cTN/ZMFre+YzDTer9EE6MT8hVsKk0Q4UwVMJYcIqlX22IXO0mE+YdflqxEySIuCQjsnTzMuNMuUA2
	Ct7qE4QwfHdGd9vGLwFsdKErIQk0UnWrLO9D3LwH6rDZBHkZa9gbapY5I7MO1jegxRUX5JqWE5YpZ
	/FqvfOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTLV-00000000sbV-491F;
	Fri, 06 Dec 2024 08:05:54 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTKU-00000000sRx-2oHP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:04:52 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id C9AFE114013D;
	Fri,  6 Dec 2024 03:04:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Dec 2024 03:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733472288;
	 x=1733558688; bh=yttDIhvUtMw6e5hq3bpLC7IVE+x1nQ+E4Z0RE9OfEO0=; b=
	P5E0ktnWTPpmP5VDREcEAwox0Q2IDJiYo1d0BqEPgSgpM2JYP31lH96fkxtZ97tT
	uRSmk3hZN/dJuI4iBDmkeK4cCt/t+kVLy5lgb4eeYdUTvUVny3O75raQbb0i+DLi
	tSydi+qBCJcU8ImQR+BvA0vvHTdayLFjxn/1IU/PgCZoNnJFtl7s6XmGrrboJWQ6
	WrK5Z4+E8cp9D64+htGCoC0d4MAD9dXEgICSZBS+1K/hBJi9dcv1kvSKzmCyVsop
	qDSAgsdMzdJ6NdPHu/+IAUoy3+Cdj9HjjO95Cces25pddvJH1jWgCtOIEwGPUAKB
	9OounoP/dYyIIvo8Z+WLEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733472288; x=
	1733558688; bh=yttDIhvUtMw6e5hq3bpLC7IVE+x1nQ+E4Z0RE9OfEO0=; b=o
	OYHLgN4PkVIR6stnw4Ngu9j7A3ItRXm5IcUROU4qruQV8SZ4RRmpK9O0iEubqtoG
	Ds4XD5KYoyTdtl8jkE+47j9yE0xUaJsleOfe6EkIzHRGaN2Q0AnDe7EGzxVoFkbo
	5kQfnlJG/J52fB8cVf6yx1oWKVRAejKder9YaAZtLM0GBpAT4lNwyenbjeBlbLD8
	tC/F0jxXG6J+hRnAzMLq91ospsd6gZO7/Z4WH5D35RAwZj0s3sOfl7PG/DNzTf2Q
	RYln0LxZrf5+1CivaM1LIXDch3wwTbLg/ZaQiWbMLAV832sUQFt18lU/VPa+R25N
	/bBQzNXrZYn0n+VNmREig==
X-ME-Sender: <xms:ILBSZ6z164FS0fTgeLr5-wzSY2fCehSDL-7v_hDLCsxJ-9Bx4fBRJQ>
    <xme:ILBSZ2Q-tjp6tDfEtchI7p5_xOvU7IJSnDiKIXNpOxcrU4mmXbnU3MLLWaKSaP4Uy
    8b8FTJW8HIu8Bda8ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieekgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihes
    sghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehghhgvnhhnrgguihdrphhrohgtohhptghiuhgtsehn
    gihprdgtohhm
X-ME-Proxy: <xmx:ILBSZ8XANu-RSLVdm36Vpd9abv59S-x6ku57HYkblN-EqHhXOIsrww>
    <xmx:ILBSZwh-ANwu2jdedGwWBWeyEnD7Z8CMYEroseJhF_aQDq0B7JN7ow>
    <xmx:ILBSZ8CdFHkRuFR07-1-ZzGno9xBri8OX5S-vJyi8fk3MdlDMhyWaA>
    <xmx:ILBSZxJHaIG1YG60pRfFH4TwCg_2uGkGQP8l6j2wnqPzg6cvd48OYA>
    <xmx:ILBSZ826rvu48Uz0LIEXGu08Aw7fEKkVAUbVCePg4_eiRMv9OWVbJr79>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 097F52220072; Fri,  6 Dec 2024 03:04:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 06 Dec 2024 09:04:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "NXP S32 Linux Team" <s32@nxp.com>, imx@lists.linux.dev,
 "Christophe Lizzi" <clizzi@redhat.com>, "Alberto Ruiz" <aruizrui@redhat.com>,
 "Enric Balletbo" <eballetb@redhat.com>,
 "Bogdan Hamciuc" <bogdan.hamciuc@nxp.com>,
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>
Message-Id: <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
In-Reply-To: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_000451_414644_44DC3D89 
X-CRM114-Status: GOOD (  23.15  )
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

On Fri, Dec 6, 2024, at 08:09, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> RTC tracks clock time during system suspend. It can be a wakeup source
> for the S32G2/S32G3 SoC based boards.
>
> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> alive during system reset.
>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

I read through the driver and this looks all good to me, but there
are two fairly minor things I noticed:

> +	u64 rtc_hz;

I see the clock rate is a 64-bit value, which is clearly what
comes from the clk interface in the kernel

> +static u64 cycles_to_sec(u64 hz, u64 cycles)
> +{
> +	return div_u64(cycles, hz);
> +}

and you divide by the clk rate to convert the register value
to seconds (as expected)

> +	u32 delta_cnt;
> +
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
> +		return -EINVAL;

However, the range of the register value is only 32 bits,
which means there is no need to ever divide it by a 64-bit
number, and with the 32kHz clock in the binding example,
you only have about 37 hours worth of range here.

It would appear that this makes the rtc unsuitable for
storing absolute time across reboots, and only serve during
runtime, which is a limitation you should probably document.

> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> +				     u32 offset)
> +{
> +	u32 counter;
> +
> +	counter = ioread32(priv->rtc_base + offset);
> +
> +	if (counter < priv->base.cycles)
> +		return -EINVAL;

If 'counter' wraps every 37 hours, this will inevitably fail,
right? E.g. if priv->base.cycles was already at a large
32-bit number, even reading it shortly later will produce
a small value after the wraparound.

Using something like time_before() should address this,
but I think you may need a custom version that works on
32-bit numbers.

> +static int s32g_rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	s32g_enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings.
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}

This also fails if the system has been suspended for more than
37 hours, right?

One more minor comment: you are using ioread32()/iowrite32()
to access the MMIO registers, which is a bit unusual. I would
suggest changing those to the more common readl()/writel()
that do the exact same thing on arm64.

        Arnd

