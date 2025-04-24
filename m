Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBKsUW/EPfANNhvxLG05JedW2Qch1UwPCKwOdSUXq7M=; b=tRZ1kiZHWVkdcd
	IKJikanzGwXTEkd0q9Fsg6gtWwSoDRrE9wv/MTruILSF3jt7id2OhJIgGohIWD9+z1m6dEQPdzAKL
	klcP8EJsbnHrcFx4vzv/nh6XOGaIrtOzNJDpiieIYRaEy2ekN8ihmU2RVk2xEVMkjwoQjg2h1cvJD
	3Et33eOL2Y3XvQ39w2Al+X8c2IIynwxSg3cRkp1N/4v6cRFWzWkycRT807kLvTzwFudxmHlG7I5nL
	A+st64MZzcTown2FIjQRweosErFuOwseZ5XheUvlM8m2jC8ZpUN1c51JLMRBh8+zw+F+oN3I0xLvs
	xA24VSPnErm5AMvdb1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82r4-0000000FHol-28bm;
	Thu, 24 Apr 2025 20:07:30 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81t8-0000000F7Q5-0oFu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 19:05:35 +0000
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so14881151fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 12:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745521531; x=1746126331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBKsUW/EPfANNhvxLG05JedW2Qch1UwPCKwOdSUXq7M=;
        b=wbQwBSpSNk2HG16rS8k5I17O+toRV4sFqBdXr+gKqMLRJ+dZMxnjCT8lxVB7GEc314
         5O9JQPYi4GqTd14jqG3VDKnzKaZ9YyC5Mt4Hg/0IZNXliW+bVPLkqgX0VChplwDub/tK
         Ubt6lacoIHk967bSTXMF/1dolbh1E4yATybaxhforTXTWte6NqXv9UKNe2IEhTtkMZIP
         kx0uBN6+za3CzEgzPCXk3EmR8gBRDvHfRkmrfrXAH7lfNBDV0Bb1BY6q/K0gG8W1AEhq
         BnIpn9mBgsrtyrusX7vClyzAYTL/sfaHjquvNdbE69zJ6VI6GrwxdoGOLYJ8ysnHUjrv
         f7sA==
X-Forwarded-Encrypted: i=1; AJvYcCV4azBUqkl1tBM3SNnxvz0Hdg0l9J963Au5eJoYIUrABzMKhN+rjBBFQJ8X816ZA0MHK6laL/mTgYsCC5xSU6mW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7PP3BO+sSra68OFk5HupCr0Zu0ONkjsLQh+OFpbHB9wl/ddpN
	zz0DfkHKB9WYPnrYHn6P/hFqi6CQIUiD8f0O3D0+ZnFHUGBReuPc88f0ndJX
X-Gm-Gg: ASbGncsSPJeQC6HAq8z1CtRNLVbawN3cGEijeJ0auEF+cPMRgvWpxaXGQ/mH3swZTgX
	7BE6L67MmncycUgCj+pxQd47ROyBCQvlIWla6NPdIDQ+Gs5lShaBnZT0vkYjXGQf345PW3JtFg1
	it6ixI2THRm+EnGWu19Bq4LtBIuMLci+9x6w2cXGZZrp2eKt5j4oqS3Vj+N/if6aXjT5NHfsQf1
	qufbTsTQqJ5ZmbeVx0h2g+VOhJt5LSpXZ4CXdCZBPWmqrtj+IH1kvz4I1TqNdu561h349uCNiAP
	n5bDoI167ZPgqydMMairzdMTTvuUywb8ya/n8K/NEmYTPC7HZHngrG0qIG59ZhL2lrHc3JSbJf6
	DwrH2WxsC
X-Google-Smtp-Source: AGHT+IHUr+RFyIzdrLT3l7/FUz5z81QrtXzw7w4uwbd7yzlSYXeCKmlXGogBeF+ig6qs9bX6WTKSpA==
X-Received: by 2002:a2e:bcc2:0:b0:30d:b3f3:bcc6 with SMTP id 38308e7fff4ca-318a82eb928mr3148291fa.21.1745521530644;
        Thu, 24 Apr 2025 12:05:30 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a8370sm3729691fa.74.2025.04.24.12.05.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 12:05:30 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso15657201fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 12:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0CY4N8LHye8zWKSG5BjbznT6Ce+8b14GgvrxY78LOA57BwRgdN9KzSWWktKUx057BL0HDVHVJ2/6QFJ5UgrTC@lists.infradead.org
X-Received: by 2002:a2e:bc83:0:b0:30c:2d44:c212 with SMTP id
 38308e7fff4ca-318a7ef5782mr3267911fa.9.1745521530295; Thu, 24 Apr 2025
 12:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch> <20250424150037.0f09a867@donnerap.manchester.arm.com>
 <4643958.LvFx2qVVIh@jernej-laptop> <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
In-Reply-To: <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 03:05:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
X-Gm-Features: ATxdqUHHFIvGhKguImv0eKl6AhZd0EW8z8xCFHbw-GoYUR64Hf9zgUT_-m4qJRA
Message-ID: <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_120534_227893_A9336CE1 
X-CRM114-Status: GOOD (  20.97  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 25, 2025 at 3:02=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > In my experience, vendor DT has proper delays specified, just 7 instead=
 of
> > 700, for example. What they get wrong, or better said, don't care, is p=
hy
> > mode. It's always set to rgmii because phy driver most of the time igno=
res
> > this value and phy IC just uses mode set using resistors. Proper way he=
re
> > would be to check schematic and set phy mode according to that. This me=
thod
> > always works, except for one board, which had resistors set wrong and
> > phy mode configured over phy driver was actually fix for it.
>
> What PHY driver is this? If it is ignoring the mode, it is broken.
>
> We have had problems in the past in this respect. A PHY driver which
> ignored the RGMII modes, and strapping was used. That 'worked' until
> somebody built a board with broken strapping and added code to respect
> the RGMII mode, overriding the strapping. It made that board work, but
> broke lots of others which had the wrong RGMII mode....
>
> If we have this again, i would like to know so we can try to get in
> front of the problem, before we have lots of broken boards...

I think the incident you are referring to is exactly the one that Jernej
mentioned.

And regarding the bad PHY driver, it could simply be that the PHY driver
was not built or not loaded, hence the kernel falling back to the generic
one, which of course doesn't know how to set the modes.

ChenYu

