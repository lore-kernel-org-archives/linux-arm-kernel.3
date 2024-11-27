Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4FD609B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmC2c7plcJ/Mcl0oI9qLJf0fBVn5qTuymhUmLJnrAcM=; b=n2NdbEnXrfVN/zb/6ra4xTY4f6
	KW3Xjs+2NtwrpL1ltYGDo4tPGx05NWH8cIQ4PyYeY5wVN2pt5IuhRd+HhnH29K62wWTLowhLcPrJ1
	kzUHY8LjJCwFjBx4/ubfPLU0wTnrYwMt9+XSoOqEn3lkwhvGM04Ir+VYw8/4uABpXQI/IJBPUdFbw
	vEo0EetiUoitlCHyhVNyIXJU6p/W/Svu48OUgEJJ0KZ5OpyJp8Nifhr8c1KQHksLWZ0yI1PMdzxjD
	Fr6fe1H8ctt5ZRFyy1pkDTJjNzQZVTXJrvbRVLOc25/qQXngiKrIyy2+iaQXz4CttcJxlQjbzFRHA
	HW12KarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGED5-0000000Cgp3-0fgm;
	Wed, 27 Nov 2024 09:19:47 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEC5-0000000CgcT-051W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:18:47 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E6561140109;
	Wed, 27 Nov 2024 04:18:43 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 04:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732699123;
	 x=1732785523; bh=NmC2c7plcJ/Mcl0oI9qLJf0fBVn5qTuymhUmLJnrAcM=; b=
	VYYICIuhcr1RrCllVZyR2YbQ0PgOx+geAUXce8CI0J3fbZezFJ93/XLQt3FGunzy
	v1PJblTLjQVb/h552gYJMNAH7TI3cbJT7Dl4o1th9kF0Z4gCbL++Jjhqpn6RsuvT
	o7IYVDHkej5QI0xazXxb4FJQQvm4KHvaLgaNwU++9Hld4r58nbbP7Zh3B62P8+xm
	UGqZHmr3fdg76gbK4f3xyrhakNOwnyHDE5cPrXFLS4aNfli2X3gjQNeXiE9xJ+Gl
	yx2yWaVJ2EJ7Q7FuuMd7RY/WFnasVgGuck5JgwdZDH+CQ/xnMENL9RcDUv1Gjbxn
	l0YpS9yuYbCs7e26/Emm9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732699123; x=
	1732785523; bh=NmC2c7plcJ/Mcl0oI9qLJf0fBVn5qTuymhUmLJnrAcM=; b=5
	IgfRStxFNKyuB7MoNhqkXbiufLh+IR1dk3i/74JBBBcsVJAOS/nmiBwBEWCowuye
	DgunWuc/GeDzWnwaDIloBrvweejeoDVzlIndP6YLOHRLtayoErRsMb7h715cKoIo
	16sQQZM4Kn7ZJNFsMm+t5n4nfW967x2tqaj0WLQWuYuH1sEpy6ICS72viIl5R+xr
	SRTEtn54CuLOXLWGWew61p0LFLQKCk8MCXjM+O4toZ1jhSYs34s4mv2AuG7matjW
	Tyy11MH5V0fQOSh45SDaA4KpbwRnagOtb/lECqdr+XRBj3+ktwx69h+J5MJtFVCE
	ufxZzJ8VZCV0o6Cg4Tqog==
X-ME-Sender: <xms:8uNGZ9Mtgrqb2LkM244MsGDBs9Rl_V-TBnWIL1Oqt2Gx4VCQCld5gQ>
    <xme:8uNGZ_8wE99PlwDfeeVEBaSWYgPOMbQPIUzRrxqk2GxyG0B3ZJ9eGLBLmGtFhpKfR
    SkXgAuFCIeRlLX-rYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgddtvdcutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:8uNGZ8ROpX2q3OtfE72XbxFI0aL82nkiXoTd5HzDtwOzkdoAF0xj_g>
    <xmx:8uNGZ5sNut3DB1CZzCOK7Ih2lufowaCSjOxFBOK5s_kUOaM8sc7LHQ>
    <xmx:8uNGZ1fRmMFjJjVZ-W4IeKD-tkDxTpHAyaF0yio5FD55la85LtLbAA>
    <xmx:8uNGZ13oP6kVKpMw69eUHbOnKf6WTrhnIMF3y16nXc1BgQG2CIxscw>
    <xmx:8-NGZ18J36QH__qlyXQkxwUal2SoIWWWQhF9-r1HKjk55N3gCvIY2xat>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B51022220071; Wed, 27 Nov 2024 04:18:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 10:18:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rasmus Villemoes" <ravi@prevas.dk>, "Fabio Estevam" <festevam@gmail.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, "Russell King" <linux@armlinux.org.uk>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Dong Aisheng" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
In-Reply-To: <87ttbthwdu.fsf@prevas.dk>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
 <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
 <87ttbthwdu.fsf@prevas.dk>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_011845_763573_E29C4CE0 
X-CRM114-Status: GOOD (  19.10  )
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

On Wed, Nov 27, 2024, at 10:13, Rasmus Villemoes wrote:
> On Tue, Nov 26 2024, Fabio Estevam <festevam@gmail.com> wrote:
>>> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
>>> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
>>> problem for good - I see CONFIG_ARCH_MXC in other configurations as
>>> well.
>>
>> Good point. I can send a v2 adding CONFIG_PINCTRL=y to the other defconfigs.
>>
>
> Instead of doing that, isn't this exactly what the 'imply' keyword is
> for?
>
> - weak reverse dependencies: "imply" <symbol> ["if" <expr>]
>
>   This is similar to "select" as it enforces a lower limit on another
>   symbol except that the "implied" symbol's value may still be set to n
>   from a direct dependency or with a visible prompt.
>
>
> So how about adding 'imply PINCTRL' in lieu of the previous 'select
> PINCTRL'? And that would also better match the intention of the patch in
> question (namely that the user needs to take explicit action to disable
> PINCTRL).

Please never use imply. Even if you think it's the right
thing in a particular case, it will come back to bite you
later.

See also https://en.wikipedia.org/wiki/COMEFROM ;-)

I would prefer we completely kill off that keyword from the Kconfig
language and replace it with the reverse 'default'. In this
particular case, having 'default ARCH_IMX' in 'PINCTRL'
would of course not be a great idea, but for the exact same
reason, the 'imply' is wrong here.

       Arnd

