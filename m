Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FF1D6CFA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XN4B5DCK0dBB222GFaDnpJxzaLb0lnsfXuQUUNsyrak=; b=hN1vq437Dz+9SFNiCbthG5WG8Q
	OgV5zxgDBKA5seYXqSZ2P8B6MqrT6TZODvrIoH25k12lh6geUfN99Z43d+jGcaeHx+/o6yKhZ4iqL
	BSJkPMSIipuYyEDzewhw18NaliITg7Y+N2VFbF7/RK3du7gRW5/TNqK2Hza3kZkk10Yjktm3rp24Y
	NeyszY/7tn+24bLfufbAVvd6z8VEQTHoQk71ZPppf9/Iuv987Wc+UWtmFHoEJyQgh6MzX+JriOGBC
	j1aRH+3MALTcOJrc7axpufLPJqenn9ZeTa1iUYQgPcngqAmbtKfFgNHLxBtgB6Oxq4kEL6hyuYSyS
	F9InCcWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizno-00000007fL3-22JL;
	Thu, 22 Jan 2026 18:53:08 +0000
Received: from polaris.svanheule.net ([84.16.241.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viznm-00000007fJl-16bz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:53:07 +0000
Received: from [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d] (2a02-1812-162c-8f00-19d9-5e35-1cd7-5d5d.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id AD3656CF57C;
	Thu, 22 Jan 2026 19:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1769107980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XN4B5DCK0dBB222GFaDnpJxzaLb0lnsfXuQUUNsyrak=;
	b=scWXGvmNainY1kQ77gLARjznXHp6TO+wM6m+tn1/+83ESV/HT6d1twjbe2ueHYcn1LskEI
	zCr4pexsV9ktEqIDhFMO2pRHYvqeI7AHUV7/yHj+EkGt2iP49UTW/3ueGTDHwboGX3dvSZ
	h14cTdHbs8+iEL5vkbS2Z80FBJK2hYZ/UMIhrYxEBV9i2JMKWw7pzbF2wFBU4hBbfE8M9x
	AstzPZbmUZjsJWC48dlWh1KuePneV3+CR4beym6x8oIAxl+pXz+0lc6YdJEt/hKuVdTMmL
	PF4hyJpcpvSr/gPWmCLK6jCr4eOBp4C4GPP+C3WgHnHGgI2ru28Cs7B8/8OaHQ==
Message-ID: <25fb1bb85424e9d27348a51ce5bb1fe727d363ed.camel@svanheule.net>
Subject: Re: [PATCH v8 02/10] mfd: nxp-siul2: add support for NXP SIUL2
From: Sander Vanheule <sander@svanheule.net>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chester Lin	
 <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, Ghennadi
 Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore
 <larisa.grigore@nxp.com>, Lee Jones	 <lee@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer	 <s.hauer@pengutronix.de>, Fabio
 Estevam <festevam@gmail.com>, Dong Aisheng	 <aisheng.dong@nxp.com>, Jacky
 Bai <ping.bai@nxp.com>, Greg Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi
 <clizzi@redhat.com>, 	devicetree@vger.kernel.org, Enric Balletbo
 <eballetb@redhat.com>, Eric Chanudet	 <echanude@redhat.com>,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, 	linux-kernel@vger.kernel.org, NXP S32 Linux
 Team <s32@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 22 Jan 2026 19:52:57 +0100
In-Reply-To: <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
	 <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_105306_677732_FC6E67DE 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Khristine,

On Tue, 2026-01-20 at 13:59 +0200, Khristine Andreea Barbulescu wrote:
> +static const struct regmap_config nxp_siul2_regmap_pgpdo_conf =3D {
> +	.val_bits =3D 16,
> +	.val_format_endian =3D REGMAP_ENDIAN_LITTLE,
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 2,
> +	.cache_type =3D REGCACHE_FLAT,
> +	.use_raw_spinlock =3D true,
> +};

I see you are using REGCACHE_FLAT ...

> +		if (tmp_conf.cache_type !=3D REGCACHE_NONE)
> +			tmp_conf.num_reg_defaults_raw =3D
> +				1 + tmp_conf.max_register /
> tmp_conf.reg_stride;

... and initialize the cache defaults from hardware.

This series predates the addition of REGCACHE_FLAT_S in v6.19 with commit
9c7f7262bc1a ("regmap: add flat cache with sparse validity"), but I think
switching to the sparse flat cache would allow you to drop this. Then the c=
ache
will just be initialized on the first hardware access instead of at regmap =
init.


Best,
Sander

