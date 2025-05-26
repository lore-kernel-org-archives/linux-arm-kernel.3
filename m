Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5D2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=; b=rjcBdMWFHxv5ACc/Dydft4vyss
	bIcvM9Xu2WQXYWlyriY6J5dq12uT6br2F5Da7oBZNAvhuOLNUPR+jKHyWtwPLGwc1HOeQvqxdEGz+
	9p5WA7dIvjGKCNEB1s7ALhdgenj4rMc+hSxLziNhvzzSVLchYEjnyPPs45u1UdHDL6wcZoxR5LeaV
	V3s8SOCCx3Rz9fTlQVGB8PIumSybHBq/EZWgHxx4EV8uhzNP9ayIskDTC+Zn2/GK6QYtyoLdBy6S3
	Dt8ik5aTuQN420adyRyqTmvLfGVVWTXp1ejXX5wLg51QhmFPgtEMyunZkfKsnUaWtbseYivuMDlXn
	qq4FMmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdAi-00000009PZa-0ASg;
	Mon, 26 May 2025 19:07:40 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJd8Z-00000009PRB-19bj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 19:05:28 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c55500d08cso229752785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 12:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748286326; x=1748891126; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=;
        b=IWC3J80KHM3FmibaDKV1Unf7z1Pf2RoFJ+zyEKcE5dxAawa6LbVm8vCNo9r4UrZ42o
         ZYCB1vU2SAwxE1BLc/VdE6geap5WSSs0/BE2Ly92zzPuKzAO5SJidI4U5pBHGpaGo2HC
         F9a141ruXFdrhbQ0jPxJh68zkRHkZwanDcFVjJw+zIbQWRLZ7LX2/KwS925d+L1diAR3
         fSbSof/rGYW5TdfHZLmAazoyOLRixsSOnjDXtKtQkshAWd2yd8PeV4hAL64pwbG6Y3ZO
         SvQiZTLOvi4EbiBHNnppzvvUSNwbt4zTaYjWhunP+tGRoBbnWgzipTHbo7b0HyMrglaq
         00KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748286326; x=1748891126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=;
        b=hMRov6ui83xagUCGqGOCKP2IltCGaNzZe8IfeJOB64pY7z9GPek3PboehuASN0XpRu
         nJG70G+x5dWeVPWghGsZ2UhyFMRvE/49SmKrPuL7W3Qj+yKS7Egm4PvBjUSU1ip4njmL
         AA84+iIxwSO0r3UJSjbnlqbJwGSTfUTVo3w7m5l1UDdG4EUXtRp6fll9L+SCvfbSJIGu
         zIPuV7F9epExGgxGmdKzdMIBZVCT1xxbuOoaGtAK8nFis6f+wv4dMwwH2dXKFuxqwwr9
         212vJPDNelA2HDIzk2oHeNiB7HFyj604n30TKw5oIW2B+vsds+5YXYfHJUAMH7Dih1Yz
         5fLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQQiKfVcquDSYj8t7KtjO0w7CKrSenanN2sVuhzowqmfYo1ohAsEz8axJd6OpP9O4eZmUKgPZOZEMozzoHL5g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+W79arEaQ1pyH7HYjAoByZ+3YO3cG3EKz4HXyT3nY2p5L9cKR
	eHgOxLovRqYFxkeytScLr0n3/iMsuh+UTxK628QKAXUb0HRO59/difdDOWu6HIYe0Z3RuA7qBlB
	ZH2la+1iGgUq9eLFoj2iY5AskacCKSek=
X-Gm-Gg: ASbGnctT4jZ2+aBrJkWytz3wY66N5f5Jv6BOuXd6fkMZJ5H3ufaDgf+c/jNFJdWcWb2
	+YNHXbAqqYGdYa0t/+V8+el5FnG3hWs6u0VbKb++MHpLabh+v1M5Hl/ST8/Sdq1PZ1ENGLLq64B
	57Jm0pjDQ49sPtOrtPzLJrEDWBYGXPv5yVDHfu+ogenIHe
X-Google-Smtp-Source: AGHT+IEzr1D0xPyVVTqgXnkaxzNsP6OY+ZVcUjK4Q6hjbSAkhccfV9zIJl49kHyZ9kmtGtW7FN9E3h5L1m5LIHvS+oA=
X-Received: by 2002:a05:620a:4505:b0:7c5:a55b:fa6c with SMTP id
 af79cd13be357-7ceecc2b525mr1410143685a.38.1748286326033; Mon, 26 May 2025
 12:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com> <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
 <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
In-Reply-To: <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 13:05:14 -0600
X-Gm-Features: AX0GCFufJmB1WnNeY40vi62AOOmldrFuv3uM6nfuatEvw8W1yQgwUxsIUPzPUZI
Message-ID: <CADvTj4qvu+FCP1AzMx6xFsFXVuo=6s0UBCLSt7_ok3War09BNA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_120527_317521_AC95D7F2 
X-CRM114-Status: GOOD (  20.42  )
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

On Mon, May 26, 2025 at 8:14=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 09:04:40AM +0100, Russell King (Oracle) wrote:
> > On Sun, May 25, 2025 at 06:29:22PM -0600, James Hilliard wrote:
> > > +   if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> > > +           const char *phy_name =3D (val & AC300_KEY) ? "ac300" : "a=
c200";
> > > +           int index =3D of_property_match_string(dev->of_node, "phy=
-names", phy_name);
> > > +           if (index < 0) {
> > > +                   dev_err(dev, "PHY name not found in device tree\n=
");
> > > +                   return -EINVAL;
> > > +           }
> > > +
> > > +           plat_dat->phy_node =3D of_parse_phandle(dev->of_node, "ph=
ys", index);
> > > +           if (!plat_dat->phy_node) {
> > > +                   dev_err(dev, "Failed to get PHY node from phys pr=
operty\n");
> > > +                   return -EINVAL;
> > > +           }
> > > +   }
> >
> > 1. You are re-using the drivers/phy binding for ethernet PHYs driven by
> >    phylib here.
> > 2. You need to update
> >    Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> >    in a separate patch.
>
> A real user, i.e. a patch to a .dts file, would also be good.

That will be added that down the line, for now I added an example in the do=
cs:
https://lore.kernel.org/netdev/20250526182939.2593553-3-james.hilliard1@gma=
il.com/

Currently there's a few other drivers needed to fully bring up the h616 ema=
c1
with AC200/AC300 PHY's such as PWM driver support.

i.e. this(which will also need a few additional patches for the H616
PWM variant):
https://lore.kernel.org/all/20250427142500.151925-3-privatesub2@gmail.com/

I'm currently doing most of the PHY initialization in u-boot to simplify te=
sting
of the efuse based PHY selection logic in the kernel. I'm sending this
separately as a number of subsequent drivers for kernel side PHY
initialization will be dependent upon specific PHY's being discovered at
runtime via the ac300 efuse bit.

I've currently verified this works on AC200 and AC300 boards by checking
that the appropriate phy address is used(address 0 on AC300 and address 1
on AC200).

>
>   Andrew

