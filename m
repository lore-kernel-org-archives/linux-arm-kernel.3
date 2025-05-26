Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D02C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=; b=PrXHNUMobb5Hcv+KMMT9dWGVaf
	Walh3S8+U8FdtaDIugMapxG/O6zFmzIp07SZvn2xmlzNkWT84WtQ5hziaw1HwUNybz3BWf8dtvBl9
	Q9k1uMrT1sIETOUvNgpBhtlwYWDvX2GVOQnU7VM/64OysCLnfAreb5tW10H/cix75ETZtq1VFP+yk
	ANHK+jU0NgxgtoSyP/8zCb7u3ajFJ4j3YncQiJHUCQ2r1NLwsfMiTKIk0ydc150Neo8vyf/sU87r+
	qLwVn8goHecB1MOkrSoJWsQA5mf3CyBO7bVJ/CHmk+cHsqbD86DucadCykDrM40bL0MK8dEkedx01
	TgQaqRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfg2-00000009YjO-2Rwj;
	Mon, 26 May 2025 21:48:10 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfdv-00000009YcC-3ewj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 21:46:01 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-86feb84877aso619439241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748295959; x=1748900759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=;
        b=F0PsgNON8CdXY7o5UF83L/HoyjqbYNPGEjHyN+vjsUz1ai1Tfh9kIW91kSCRRSjRJO
         TQgH25rmKUiaCDa0VLwc3EfVc4XY8p9z71/+Tqi0gbixG/fPUCh6N5eWcEFNrRjZ0b5f
         cYNUDSDo9SHi9ukN4Efv+WO6m/x3oPgkLw8Vh0fjW1xb9XNieI8ljReGQrg++oGjDbak
         QCo7x59/9uH0B+b/rYcYXZKWG/kkSriYqBjOW831XSgANwa6IARtlLNUNOmaQhJE6Ro3
         9LcbcBK23sbXx2R3LEIwpcbHvkxdN38h+7XQI/+NJV+jl9T5G3d7qrJZDR4cDygQ3JD/
         GJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748295959; x=1748900759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=;
        b=axfoewBPnkGvpo/jJqKvRn5Ia4Z2MQRCPUS7BkOCQDTdvZEP8JshovVG4OYSvgaSdA
         OzikLrLb+K93mhU1QaDQ0Bx4JM9bjpkXlGm6lYxCn88fVQ6KgS5kYD1YTDT4vLFMyv6X
         KMIT9HC5R24OvcrTBQQK5BcVABpB4XET/BN+oBsIjRoLHeCkbBifW5RAOMW1LYxs3F/x
         pSDzeIzG0e+TidGyFB9AlbdEL4h+fmSPUpZbyaMzv+Uit/MSk9OE1xe3Qf15DNg2kwGu
         sp6c24wU1qks/DcE7M/u0xYmCkiLjXgy5dwmytf9RwWB0I7hrVWXfkqhlE4r7GFxiXed
         k/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFGP30tbPdJcg4Cgc0S0tAD9t/CuTYQ8MOduc8Qo+QV4IAcVrK3YjcEohuxzq+r+56LT0Zpsp94ziMew9hi8LQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCHAQQeVEtkUOdlel/3nouwlMY+dz/ScLojm4IFipMtadVbhhJ
	d3eycsWR8R6Zn2/SqNdxDYMRsseOx8yJtZONaf5L47ORkpcvHBlwYhsEnLZ2OD6iHQbg3UhfHus
	rLXN/SIXjnkn770n+LbBqXGfAxqsYR3E=
X-Gm-Gg: ASbGncsVTbDzklQJXCDXDFtdbGd08yn0U80vCQF5ryop943swHWCbUBZE+2ZB//05lq
	WC6uZqRPqV+hZoW8Uyl63ETVNWLs0kjGZspWizao0uxcoaATVmRWJF7+QXlCu4iD6EyRIuYsOxR
	tK/DCu4We9L2WuH8RGFgl3yGHHASMSQyfz+A==
X-Google-Smtp-Source: AGHT+IFotR6RyxU/ifwJ8AmbTwSsnUIU6QL7qlKuPNmt94jWJ9smNJz+SAYTONBfXHAq+tKlLbtbIPgWrf25oFYgN6o=
X-Received: by 2002:a05:6102:5244:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4e42415fc45mr7977719137.17.1748295958811; Mon, 26 May 2025
 14:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com> <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
 <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com> <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
In-Reply-To: <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:45:45 -0600
X-Gm-Features: AX0GCFuEfLkt9AfTQ9ECVkRYk1pIwbklJGqsNyxbFKVvoc0OdxtNfymBf0iJQt4
Message-ID: <CADvTj4pt48o0wm-69WfkOtp0c-aP64DSwPFo=znY2Hk_N2ft1w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_144559_911379_12D30C58 
X-CRM114-Status: GOOD (  20.62  )
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

On Mon, May 26, 2025 at 3:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > The normal way to do this is phy_find_first().
> >
> > Sure, but there are problems with that approach here.
> >
> > The initialization sequences are rather different and the devices
> > won't be visible on the mdio bus until after they are initialized.
> >
> > The resets will be specific to either the AC200 or AC300 so we
> > need to choose the correct PHY based on the efuse value rather
> > than a mdio bus scan to avoid a circular dependency essentially.
> >
> > AC200: i2c based reset/init sequence
> > AC300: mdio based reset/init sequence
>
> O.K. so you need to post more, so we get to see the complete
> problem/solution. It seems to me, AC200 and AC300 are not compatible,
> so should have different compatible strings. That might be part of the
> solution. But it is too early to say.

They will need to use different reset drivers but the mac part is
largely the same AFAIU. The mdio part is similar after initialization
as well I think.

These are the vendor docs(I only found chinese version so far) that
have some more details on the AC200 and AC300 EPHY's:
http://file.whycan.com/files/202304/V85x/Linux_EMAC_%e5%bc%80%e5%8f%91%e6%8=
c%87%e5%8d%97.pdf

Translated important sections:

For AC200:
ARM communicates with AC200 through TWI, initializes EPHY, and then
MAC accesses the MDIO bus.
EPHY, PWM module provides an internal 25M clock to EPHY.

For AC300:
ARM communicates with AC300 through MDIO bus, initializes EPHY, and
then MAC accesses EPHY through MDIO bus. PWM module provides an
internal
25M clock to EPHY.

So the MAC to EPHY connection is more or less the same AFAIU,
but the initialization is quite different.

>
>         Andrew
>

