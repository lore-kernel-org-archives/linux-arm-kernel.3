Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A499C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zb65VUFaC3xu3xLyC+q/Y9QOfFVKsDX4tlUv2crmwV4=; b=2sZZuTns9HcepgeEqR99PRMyUt
	99NUifO9QXQTKCIlspFiWHMJMyeV82PDDysGA9MguEZJcFmHIugMx7Yg/5Ai0fwuK3a0uXkTJE9zs
	lN4EFcV12fq0TYBJnr5jjOIt2h482+MDXm72P/48pAD16dHA8M0NCiFf8Pyrf+crMO7BRVuf9JoYm
	eUdchj9An4pDT0rLxTOpsGnSijQpCBZlVOb8A8NKs0YzgPGVzNu79AOwQaliax+wzmE1RRkj3EbyT
	cd0B59aIHSWQQvVmxgy6sLMO0C8ZxCDOVscJ1X6M0PrGoBrMKXoLeQt822TTb2ix6ueqWXjSl8Hig
	XKKmYQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSJ9-00000008Hun-3mGY;
	Mon, 26 May 2025 07:31:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSGu-00000008Hii-1BY7;
	Mon, 26 May 2025 07:29:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 660DC43A5B;
	Mon, 26 May 2025 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zb65VUFaC3xu3xLyC+q/Y9QOfFVKsDX4tlUv2crmwV4=;
	b=aSAlUf7tUiqHJzsn2lhfPhYcFFkRTUFbo52Dzwpirmygk7yx5FN1GVXM+mtTsyXon7Hw59
	UhADCs4R8i5USXcp3P9cicdaSkNxGVnviZuHEEptLEPU2Yf1o/XTXUbdayMB7gwWnXJHc/
	Mi/bPmlTXYsIjwLDHW/28NPYlY7jGkM6B1uzzRWk0nh5empIZx4bY9tBtamH/PhY0xBYL1
	zOScoSD9Nj61yNkJnybofqFa8Om4iv0jExy2kTwQCnd/YjHiSgxqimbdyLMY4gssdniLnP
	bJ/+aOO/p+dQyK/lGM5d/q2Ao9FNdsJgnT+03SgDIVYioh4dchkjwjNxjylGsg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,  Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Zhang Rui <rui.zhang@intel.com>,  Lukasz
 Luba <lukasz.luba@arm.com>,  Support Opensource
 <support.opensource@diasemi.com>,  Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Niklas
 =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,  Geert
 Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org,  linux-pm@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-renesas-soc@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: Constify struct thermal_zone_device_ops
In-Reply-To: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
	(Christophe JAILLET's message of "Sun, 25 May 2025 11:40:04 +0200")
References: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 09:29:16 +0200
Message-ID: <87v7pn3k4z.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhjrghilhhlvghtseifrghnrgguohhordhfrhdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehruhhirdiihhgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhukhgrshiirdhlu
 hgsrgesrghrmhdrtghomhdprhgtphhtthhopehsuhhpphhorhhtrdhophgvnhhsohhurhgtvgesughirghsvghmihdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_002920_456349_BE7B0A41 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

Hello,

On 25/05/2025 at 11:40:04 +02, Christophe JAILLET <christophe.jaillet@wanad=
oo.fr> wrote:

> 'struct thermal_zone_device_ops' are not modified in these drivers.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text	   data	    bss	    dec	    hex	filename
>   28116	   5168	    128	  33412	   8284	drivers/thermal/armada_thermal.o
>
> After:
> =3D=3D=3D=3D=3D
>    text	   data	    bss	    dec	    hex	filename
>   28244	   5040	    128	  33412	   8284	drivers/thermal/armada_thermal.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/thermal/armada_thermal.c                        | 2 +-

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com> # For Armada

Thanks,
Miqu=C3=A8l

