Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=; b=KIfJSWyzH/5i8iDmi2dFVFhjia
	1NR2neE//j2q5dclNhEogu8XaC++Z1FFyLfGd3aaVGysppscZS3yTjNMSvO3OGwp8YjVjksbanrPw
	WdaPam1M8SQuXWcOzi4Pp+OYBkX63RrJk0XaK8k18PAuN6E4YKcOp0tlNnlAHAuVN9RA1TJZxd32L
	v23LZE4hGgWZrpGkfAkIy4wvpy750jnuGgMy56tZWHVxoLNOhEyHWKKrOa5lCiMPKt+mexugg+qu5
	epggUG35sgiqH2zDgLPkzvc/1CFvW0YMiCyAm9XaRTBwA8k/CwzBlz8d7Ko0NKvAL1xKgNoiis8N0
	N3vFloVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZU-00000001exi-0bic;
	Mon, 07 Apr 2025 18:51:48 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qAR-00000001Lui-2W1S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:21:53 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so5688396d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744046510; x=1744651310; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
        b=E/B54GKUBjjAOaC2u+YdO4mbkf942uftOCd5PWtGkKE2HlTExmOk9E4qRL5HyrTWku
         RrqWvEuih7114La+qWIMZDp3XozdxX3ePZkaZiwu7I3ufl1e5S1CHEnEiGy4EuUL3cyA
         eAAIPZ2LfQJ7ZMFifkJpnCpxD3udTAAkCo/ifFslJ0/CRXJk7fVUNsq40SSEC36EGemu
         5l14zhaMf0PHsr2a+AboZZo0HgatsrGHV65jwF+goACESvZ53XZecBwXwYzN9/o7AAnM
         mhSgOrERORCL5SWO46PPgv7p2mg/Zi9NB21IZeSAPG/2+21JowRoiwlIg28N3TYzmLiN
         lAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046510; x=1744651310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
        b=Mdn/AiA1+hEPbcwWHyxRg2IBgoACL4FqO+FMUx11FMipKSrTQ086UZqU9AeiyoB0C3
         gh8Z/c7pIkMDPKktVNEYgAbYqD9q/Eynd1Gcsnt1oUx3Ty9nRK/Gy9UTqUuP9iGlleKV
         MxQS9If2mOsVVte9yxrk74XLBDsWExkCeDVbnGqYQkK+CpSgZavvPjf/Tv7E9099SsUl
         XpJsAkkugejcOE1vH+kpfT70F+jwz7RrwjRhsdkMVXKzuFqmAGHJllE61AjR0k1DmJps
         oGN2T3mYYObtEw9lQ8TE/KRS02pxaBplMtLx3gcc1mGDeUyjFLj/BAEH4tiDJZo5SsPA
         JWEA==
X-Forwarded-Encrypted: i=1; AJvYcCUMmBK3D5sd6YeCL9SjbBHAu89GPUuf4I8F0g8M87dqf0+wRCj7LDcx9ecgU5UBilai4YtJsZH/Z0m8BVSGak9b@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvwpyf9lRPiy53aKhFW9RXKb1cuvuu2gq3Ao8/smZqZ08B9kVd
	MdQI+apcaZQp+z/DInuzWe+bQIk7cQGpvp2y6i2XHWNRALhBjYpZIxKeLv0HVuW9HKVdhjGjS5q
	cNODyW649Zdg5lt3hxKYqN746NVs=
X-Gm-Gg: ASbGncuV6AZZUhXAuW0SQAHT+Nu6hg9KwDUxYEGfymleOfc2gS68Gdw8I8X1v9gLQCi
	KREU1vBcZZB6xcrGSDtkE9yJY05nC+3u5ZGgCfWRyQdfYyboVP+3o9zorhDOCQriHXU8itWH57v
	GwKFteggNmrLxunvEhcXgl+OEDFtHu0wGm4wE=
X-Google-Smtp-Source: AGHT+IE7oF7zYUiFClD9j+MaUG+QMzWikeMa5fdbd6jkjTVPOvWSr5tLM3OX7RIKBrrUgH1CqT/Ky1y9rQ5HCbtZCIc=
X-Received: by 2002:a0c:c688:0:b0:6ed:18cd:956d with SMTP id
 6a1803df08f44-6f0d25479aamr4072856d6.22.1744046510291; Mon, 07 Apr 2025
 10:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390> <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com> <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
In-Reply-To: <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 19:21:38 +0200
X-Gm-Features: ATxdqUFVoaO2wEB2GhdEUNwWwPj2cMvxUNhs7goYdYdDae4Y74aVkceCOkA0pWY
Message-ID: <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, upstream@airoha.com, 
	Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Clark Wang <xiaoning.wang@nxp.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Madalin Bucur <madalin.bucur@nxp.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <michal.simek@amd.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>, 
	Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_102151_641120_60BD1A31 
X-CRM114-Status: GOOD (  48.62  )
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

Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:46, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
> > <sean.anderson@linux.dev> ha scritto:
> >>
> >> On 4/7/25 12:27, Kory Maincent wrote:
> >> > On Thu,  3 Apr 2025 14:18:54 -0400
> >> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >> >
> >> >> This series adds support for creating PCSs as devices on a bus with a
> >> >> driver (patch 3). As initial users,
> >> >>
> >> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >> >>   the Xilinx PCS) (patches 9-10).
> >> >>
> >> >> The last few patches add device links for pcs-handle to improve boot times,
> >> >> and add compatibles for all Lynx PCSs.
> >> >>
> >> >> Care has been taken to ensure backwards-compatibility. The main source
> >> >> of this is that many PCS devices lack compatibles and get detected as
> >> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> >> the devicetree to add appropriate compatibles.
> >> >
> >> > I don't dive into your patch series and I don't know if you have heard about it
> >> > but Christian Marangi is currently working on fwnode for PCS:
> >> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >> >
> >> > Maybe you should sync with him!
> >>
> >> I saw that series and made some comments. He is CC'd on this one.
> >>
> >> I think this approach has two advantages:
> >>
> >> - It completely solves the problem of the PCS being unregistered while the netdev
> >>   (or whatever) is up
> >> - I have designed the interface to make it easy to convert existing
> >>   drivers that may not be able to use the "standard" probing process
> >>   (because they have to support other devicetree structures for
> >>   backwards-compatibility).
> >>
> >
> > I notice this and it's my fault for taking too long to post v2 of the PCS patch.
> > There was also this idea of entering the wrapper hell but I scrapped that early
> > as I really feel it's a workaround to the current problem present for
> > PCS handling.
>
> It's no workaround. The fundamental problem is that drivers can become
> unbound at any time, and we cannot make consumers drop their references.
> Every subsystem must deal with this reality, or suffer from
> user-after-free bugs. See [1-3] for discussion of this problem in
> relation to PCSs and PHYs, and [4] for more discussion of my approach.
>
> [1] https://lore.kernel.org/netdev/YV7Kp2k8VvN7J0fY@shell.armlinux.org.uk/
> [2] https://lore.kernel.org/netdev/20220816163701.1578850-1-sean.anderson@seco.com/
> [3] https://lore.kernel.org/netdev/9747f8ef-66b3-0870-cbc0-c1783896b30d@seco.com/
> [3] https://lpc.events/event/17/contributions/1627/
>
> > And the real problem IMHO is that currently PCS handling is fragile and with too
> > many assumptions. With Daniel we also discussed backwards-compatibility.
> > (mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
> > that slipped in before it was correctly complained that things were
> > taking a bad path)
> >
> > We feel v2 permits correct support of old implementations.
> > The ""legacy"" implementation pose the assumption that PCS is never removed
> > (unless the MAC driver is removed)
> > That fits v2 where a MAC has to initially provide a list of PCS to
> > phylink instance.
>
> And what happens when the driver is unbound from the device and suddenly
> a PCS on that list is free'd memory but is in active use by a netdev?
>

driver bug for not correctly implementing the removal task.

The approach is remove as provider and call phylink removal phase
under rtnl lock.
We tested this with unbind, that is actually the main problem we are
trying to address
and works correctly.

> > With this implementation, a MAC can manually parse whatever PCS node structure
> > is in place and fill the PCS.
> >
> > As really the "late" removal/addition of a PCS can only be supported with fwnode
> > implementation as dedicated PCS driver will make use of that.
>
> I agree that a "cells" approach would require this, but
>
> - There are no in-tree examples of where this is necessary
> - I think this would be easy to add when necessary
>

There are no in-tree cause only now we are starting to support
complex configuration with multiple PCS placed outside the MAC.

I feel it's better to define a standard API for them now before
we permit even more MAC driver to implement custom property
and have to address tons of workaround for compatibility.

> > I honestly hope we can skip having to enter the wrapper hell.
>
> Unfortunately, this is required by the kernel driver model :l
>
> > Anyway I also see you made REALLY GOOD documentation.
>
> Thanks. One of my peeves is subsystems that have zero docs...
>
> > Would be ideal to
> > collaborate for that. Anyway it's up to net maintainers on what path to follow.
> >
> > Just my 2 cent on the PCS topic.
>
> --Sean

