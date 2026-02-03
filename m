Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28CEE6E809
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxpkLSU3/SN94Y1LrIF/NsSI8rqnDYsojgY4sdRUp2I=; b=skDFtitSbaosWKhnKOQOI60xrP
	U1A5LNVkszHuZV0fHGjdh/1ngZ9tRZESFiCWCv5tjzr+WPjsFUxD7WwOrAJbpiJvxRj3x9SBZZF6c
	30/fL4BS/OHtxrAyMCz8HxJywtPgsKV++0VPuXAaLJXO3lT7GNpvYdjVv/AYs8YTNaQxhWYhXO3N9
	Sqq4/+FITe9OqmPSceTPoVTIMDfUzGyRGDImlXq0NOPMj9/6JcQ1RKtaTWA3Wk5RMbj02tIufVHA4
	GO2gSAQh1W0zgW3hoE7CWeUlmCaWV7S2nbp3NZzZnSTWvLNpYRnSmjyQqrXd3Rq4jOF+MRopgOy5K
	BERxwHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEAJ-00000006VVL-3wz1;
	Tue, 03 Feb 2026 11:01:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEAH-00000006VUy-1hVN;
	Tue, 03 Feb 2026 11:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26E80418F4;
	Tue,  3 Feb 2026 11:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDDAC116D0;
	Tue,  3 Feb 2026 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770116507;
	bh=GxpkLSU3/SN94Y1LrIF/NsSI8rqnDYsojgY4sdRUp2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnD+miHlZT1H1O7EyTAriS6D9q3++oVAdq5nasJG2G9lDCGirpsI+QAOzFpBKyw04
	 K9YTRelPpexx8rtE3OW2S9DvIF/8ItfzHa4R5++LHCKbKj3hV53Uiht+XOnQVpCspY
	 lHlpnu5f4whFXGXanWqsFW1VTkAAhA7cm+BTLCk4d0QQZfffgMjYOBaT6IehZ/SiSy
	 1Edxsw1WDgQMa2HDbCDXi2nNnDz1kdGBj0PXX0/TJAhPXRjgHz0KnT1V6miG14Oh0R
	 UO+V+Q75pKRVJzpLScYsi8XVp0mWYqYhGFphXiogzRjOrvkKFgsgFy3bWytJzUOrVL
	 H0IJKB/v8cQ2g==
Date: Tue, 3 Feb 2026 12:01:41 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Grimmauld <grimmauld@grimmauld.de>, mani@kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <aYHVlS1nbCMMyF04@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
 <aXyHITrZ89Mmn8_J@ryzen>
 <CANAwSgTQ-cdyzd2WjHMYCY33p7um3CpjMeTzRO7vcd0fTF6X9Q@mail.gmail.com>
 <aYB0ctHF1ZeIIzbq@ryzen>
 <CANAwSgSR7AYCvMXSo5UskTF3LJToOnPV9JE4XBAUzrCbWGKD_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgSR7AYCvMXSo5UskTF3LJToOnPV9JE4XBAUzrCbWGKD_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_030149_538240_50B56F76 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Feb 02, 2026 at 11:35:48PM +0530, Anand Moon wrote:
> On Mon, 2 Feb 2026 at 15:25, Niklas Cassel <cassel@kernel.org> wrote:
> >
> > On Sat, Jan 31, 2026 at 03:08:42PM +0530, Anand Moon wrote:
> > > >
> > > I’ve attempted to reproduce the warning but was unable to trigger it locally.
> > >
> > > I have tested with the built-in module
> > > CONFIG_R8169=y
> > > CONFIG_R8169_LEDS=y
> > >
> > > As well as the module
> > > CONFIG_R8169=m
> > > CONFIG_R8169_LEDS=y
> > >
> >
> > I'm running with:
> > CONFIG_R8169=y
> > CONFIG_PHYLIB=y
> > CONFIG_REALTEK_PHY=y
> > CONFIG_REALTEK_PHY_HWMON=y
> >
> I feel CONFIG_R8169 should not be built into the kernel image.
> Since the driver is registered via module_pci_driver(rtl8169_pci_driver),
> it is intended to be loaded as a module. In addition, this driver
> requires external firmware
> during initialization, which could make a built‑in configuration problematic.
> Keeping it modular ensures proper firmware loading and avoids
> early‑boot failures.

For what it is worth, I strongly disagree that you should not be allowed
to build something as built-in just because the driver is registered using
module_pci_driver().

In order to use NFS root, and to avoid the hassle of using an initramfs,
having the driver as built-in is a logical option.
Anyway, this is currently working fine with my setup today, and is
unrelated to the phylib splat that I have reported in this thread.

I know that the R8169 driver tries to load a firmware blob, I used to have
an initramfs just to be able to load this firmware blob, but I found out
that the driver probes and works perfectly fine even without the loading
any firmware, therefore I no longer use an initramfs.
Again, this is working perfectly fine today, and the R8169 loading or not
loading any firmware is unrealated to the phylib splat.

(Just for clarity, I don't think that the phylib splat should stop this
patch from being accepted.)


Kind regards,
Niklas

