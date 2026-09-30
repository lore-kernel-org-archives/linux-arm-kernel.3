Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81071CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOnsyAg/MuVmzfBYv2/LKdmOuEFogRMiJr3Cob/q6Os=; b=410t/7HGKVTaIuNVNGd1nQw8w+
	VPLNxDUuehqIuTw7kl/s4nGFnMrftaH/BSEaRerxlQOuKBI3fEo2ixHRwVDe6bwiXmaqyW/XDstKI
	JGAUJ+M1n+9q2N2GQ8+OQARbNBp6fgA6EKZ3oBcvnA5n6D6U8DzzIZr5exh4p0OaW7W34vLH6EtNb
	DimiRB880GNOfKanIyvgf82CeUFEwGp9dGxquHSKMVwkvBpU3AgFNe+nV44UlqYQ8N8Su3LuMc93/
	yIpYWvK9d1U8yV15ZW6goVWGGh5fg47VVvKn/+XQxo9waH0rYzsBxuNCV2VDnbsKucIYoFKpzshGn
	8Bby9DPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs9Z-00000005pDd-1jxX;
	Wed, 30 Sep 2026 11:07:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs9X-00000005pDS-38Mc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:07:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 374A241315
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 11:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AED01F000FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766431;
	bh=UOnsyAg/MuVmzfBYv2/LKdmOuEFogRMiJr3Cob/q6Os=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VRRvhw3/VTpR7LMyKSdM0CBwFJrTjIPGSNJuW2ZsyN2y6jfZiUqVSx7NY0mTHJpWO
	 5nPOfjl3EytXUQS1201G+zlOZZi9HuEZ4lif+ubYKdPmGeZygl8NN3ITboKG2g/FZy
	 Yyi9VC5wSdxHgTo6mqlNqIWZqEYI1+XOL4lSPqSTbC9aw5m7KdRV6s2HDSqYj7kFx+
	 NVAshSRHgluW+LPHXhHkfQ0quBh97dT89GiAAXfhGdJXXWSWdQkl52DtV6S6jGcocf
	 2kWA8UivmFxuPg8bicg+Bf+WBy9ga4ZmToaCqjq7NoTGhmG+bY9L5V9YO1A7w7TJ2K
	 TMJ7ahvhigUZg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3f77a228so372972e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:07:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByootzsiQqz7gCp0wDAljW8/W+m3lD+mhFZ4EJgv0kN9OiwwMvge35rwBTJIsmOVV/sjUygu+1HCgoGBXruDjOl@lists.infradead.org
X-Gm-Message-State: AFq9FYJ91VZJW02RQAoiUhPsIRAe6DFPU6eLJowKIEmErQh8/6Ov0Sfs
	c0ynBxvlXutjVV8E3GNHE2I4lmydab3uXJCazI0KaVj7oJ9UmY39wdjl/stZovEwJGSZq9w1s/H
	Zor7FF67yfafa9pw3HDzku0iic/4sYig=
X-Received: by 2002:a05:6512:39c6:b0:5b8:e83b:2e1b with SMTP id
 2adb3069b0e04-5ba402ccbc7mr530988e87.4.1790766429870; Wed, 30 Sep 2026
 04:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com> <179076583798.3054629.14422335928572048671@gmail.com>
In-Reply-To: <179076583798.3054629.14422335928572048671@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 13:06:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLnVh4Uqc4eWr0t+Ut9EmNrbxkV9Qa6xJL0TuLAxM1ajCA@mail.gmail.com>
X-Gm-Features: AclHuK-or11HqloWUen4cBXQxiec-MiIiyBRze0xNfafpZukVzYlj54OfVdkbzM
Message-ID: <CAD++jLnVh4Uqc4eWr0t+Ut9EmNrbxkV9Qa6xJL0TuLAxM1ajCA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 30, 2026 at 12:57=E2=80=AFPM Fil Dunsky <filipp.dunsky@gmail.co=
m> wrote:
> On Wed, Sep 30, 2026 at 12:39 PM Linus Walleij <linusw@kernel.org> wrote:

> > Is this OpenWrt fork public?
>
> Yes, it is under review in OpenWrt:
> https://github.com/openwrt/openwrt/pull/25033
> The sources are in target/linux/cortina/files/, the Ethernet part in
> drivers/net/ethernet/cortina/cs752x_ne.c (plus cs752x_fe.c,
> cs752x_sch_tm.c and drivers/net/mdio/mdio-cs75xx.c).
>
> > Actually what I'm most curious about is the packet engine, which may or
> > may not be related to drivers/net/ethernet/cortina/*
>
> As far as I can tell it is not derived from the Gemini GMAC/TOE: the
> vendor driver has no StorLink or Gemini references, and the engine is
> split into a network interface (NI) with per-port MACs, a DMA/LSO
> block, a queue manager with its buffers in the top 64 MiB of DRAM, a
> traffic manager/scheduler and a forwarding engine with packet buffers
> in on-chip XRAM, which does not map onto the gemini.c register layout.
> I have not compared the descriptor formats in detail though. The
> OpenWrt driver only uses the NI/DMA path, all forwarding in software.

OK once this is merged post the network engine under
drivers/net/ethernet/cortina/* and I will help out to review it and
get it merged.

I agree it's a good idea to merge this upstream first to offburden
OpenWrt, that was the approach taken for Gemini and IXP4xx
and those are extremely lightweight for OpenWrt to maintain
since then.

Yours,
Linus Walleij

