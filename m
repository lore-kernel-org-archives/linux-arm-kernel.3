Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF04D6EBED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkrIkZIR81K+8lZR1jV0EYOCaPxA1tf+i52k5/yQXYE=; b=gbD/b4DG1mNLYiwjmGKGuhwx9H
	ufxqLSukuCeoERO4WtkB1jouIpOjgzpRt1sLFOxWVax+bq0kSqQ/Pf1G9fzLQenOvM+TgL3SRk29r
	J36TQAuqBXiBNmZzbodfxQSX2tm8xG3ot7c5rO07KP/4xtlfYiyWw6KNo2LX1outBMa98JViqKFVd
	YDWSbmD44TLTdQObw9h37Qe/qZiYdG/16eb9QCX1/9CqJ9iRj2G36DEXig1fho7u64mqpaAzALA6q
	t40jJQcnZ0aBjsoJ/IvUO6uIFDrkufEb9BOD/maSG/mmf4GJNRpLIZEpUMbMmevJHWFFeIcSnfG8w
	9dhy8viQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwLZ-0000000HBqs-4Aq1;
	Fri, 29 Nov 2024 08:27:29 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwJn-0000000HBXK-1izj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:25:41 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 207332540185;
	Fri, 29 Nov 2024 03:25:37 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 29 Nov 2024 03:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732868736;
	 x=1732955136; bh=UkrIkZIR81K+8lZR1jV0EYOCaPxA1tf+i52k5/yQXYE=; b=
	KOJA5EBNlyb8AYL5jSXpuBelBvb73YiE90Wu9UpAMctnOf83Wr1OAy1Ren4m/BV+
	NvXNTcvq4i1mSgTiixSfE1eI5cupRXteGM85a+ULO8rMY2UtiInKXnYmXb2kAGHG
	9H9SKLcsNSeqcfEnhqCPb4ypxAkhk8CPxd2UIN1mAdcQUSjofBfVmgSQZuEMOto5
	+hQIMXRwoV09NYF0hRiqDZQBz8eWRqUIOcpdhaWAZf7LOEeHG9hdxLyaCyKnNh6h
	KNlC4CVkTgsbPI0tkBo7FtLSXZJi1qFfY3W4ssHMR5WySwW5jzWTnGwtrkUeo+6Y
	3GQ2cXRER5DyBj7XC3yDhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732868736; x=
	1732955136; bh=UkrIkZIR81K+8lZR1jV0EYOCaPxA1tf+i52k5/yQXYE=; b=K
	vA6CDJrEiE6pUy3ii7u2JCcRFNVL0TYiIQJsQ7U2DC48SjUIbUlyVWO7bINl3yK3
	S5kRjCvtDyNJi9Xb402bdO2lQSraWPiOF6mmFzAJdzigD+/UgOah81r6XbL3K2O6
	MbPhMzXYuIJ0nbZeZERSj8c0+ooB2KdpwxJ1aCEJ/pcRdqgTkKUeE7IvyLLYGTJi
	Tb70HuKLscGgw200rYY7vsWMlJLfB01LoKSe9un7dLiFD7fFTCR2uSSex6DOP537
	7i0rLd1+xsh9i0pW1o8Oso2MN7gDN3xSj7UHUKOfIfz9jKS6O5GblcYivoITDRox
	b3u9Pg7mGZ3bu3HskIkQw==
X-ME-Sender: <xms:gHpJZ6w2fGfxXS9vV9zMcGq697f78hkVipzcWNWFgb5THIiGOoauCw>
    <xme:gHpJZ2Trh3-Hm_QKXfhvaQSIZuZSqFZDutp_lV3EUN7YmRRYGI3bkufTEfR0wZwUW
    -QgDdRvd-UVyL1E1vs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedvgdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvghkrdhkihgvrhhnrghnse
    grmhgurdgtohhmpdhrtghpthhtohepughrrghgrghnrdgtvhgvthhitgesrghmugdrtgho
    mhdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprh
    gtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghp
    thhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtg
    hpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgu
    hidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghhvghlgh
    grrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopegvughumhgriigvthesghhoohhg
    lhgvrdgtohhm
X-ME-Proxy: <xmx:gHpJZ8Vp6xl2hBMEgs2JSWypxmN9xxYmWwNzFSblFLDZFN8EUfh2dQ>
    <xmx:gHpJZwhzwiakrGGJbbDZG8Imk_TNKMahRje9dVx4IHugJXrAOPy2JA>
    <xmx:gHpJZ8Dux2uk2NHsdgnCz72FSpxTT8sKEDntUWZQhKhF583xg70uoQ>
    <xmx:gHpJZxLEh56i6QWMewaXnEKyWFaDZW1L95TcX5p_WawB0jy13PKZdw>
    <xmx:gHpJZ0bFHq3GtzEGICp5Hv6ON-0xSNRqOAEy56UGsSJCvhRVmkh2DDD8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09DC32220071; Fri, 29 Nov 2024 03:25:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 09:25:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herve Codina" <herve.codina@bootlin.com>,
 "Michal Kubecek" <mkubecek@suse.cz>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Simon Horman" <horms@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>,
 "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Lars Povlsen" <lars.povlsen@microchip.com>,
 "Steen Hegelund" <Steen.Hegelund@microchip.com>,
 "Daniel Machon" <daniel.machon@microchip.com>,
 UNGLinuxDriver@microchip.com, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Horatiu Vultur" <horatiu.vultur@microchip.com>,
 "Andrew Lunn" <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Allan Nielsen" <allan.nielsen@microchip.com>,
 "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Message-Id: <1a895f7c-bbfc-483d-b36b-921788b07b36@app.fastmail.com>
In-Reply-To: <20241129091013.029fced3@bootlin.com>
References: <20241010063611.788527-1-herve.codina@bootlin.com>
 <20241010063611.788527-2-herve.codina@bootlin.com>
 <dywwnh7ns47ffndsttstpcsw44avxjvzcddmceha7xavqjdi77@cqdgmpdtywol>
 <20241129091013.029fced3@bootlin.com>
Subject: Re: [PATCH v9 1/6] misc: Add support for LAN966x PCI device
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_002540_115934_9452590A 
X-CRM114-Status: GOOD (  17.93  )
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

On Fri, Nov 29, 2024, at 09:10, Herve Codina wrote:
> Hi Michal,
> On Thu, 28 Nov 2024 20:42:53 +0100
> Michal Kubecek <mkubecek@suse.cz> wrote:
>> > --- a/drivers/misc/Kconfig
>> > +++ b/drivers/misc/Kconfig
>> > @@ -610,6 +610,30 @@ config MARVELL_CN10K_DPI
>> >  	  To compile this driver as a module, choose M here: the module
>> >  	  will be called mrvl_cn10k_dpi.
>> >  
>> > +config MCHP_LAN966X_PCI
>> > +	tristate "Microchip LAN966x PCIe Support"
>> > +	depends on PCI
>> > +	select OF
>> > +	select OF_OVERLAY  
>> 
>> Are these "select" statements what we want? When configuring current
>> mainline snapshot, I accidentally enabled this driver and ended up
>> flooded with an enormous amount of new config options, most of which
>> didn't make much sense on x86_64. It took quite long to investigate why.
>> 
>> Couldn't we rather use
>> 
>> 	depends on PCI && OF && OF_OVERLAY
>> 
>> like other drivers?

Agreed.

I would write in two lines as

        depends on PCI
        depends on OF_OVERLAY

since OF_OVERLAY already depends on OF, that can be left out.
The effect is the same as your variant though.
 
>
> I don't have a strong opinion on this 'select' vs 'depends on' for those
> symbols.
>
> I used select because the dependency is not obvious for a user that just
> want the driver for the LAN966x PCI device.

The general rules for picking one over the other are:

- use 'select' for symbols that can not be enabled manually
- prefer 'depends on' for user-visible options
- do whatever other driver do for the same symbol, to avoid
  dependency loops.

     Arnd

