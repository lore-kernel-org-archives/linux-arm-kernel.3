Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D10E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjFjYpSxXBJz9M1hdmG3iiPhNXo18zA2UB8YwR16DTw=; b=d9ytE4XwWh87kOISBfBKwpZZwI
	iLIJBYhQimE4xQF4Oqa79CooejrF+I6W391JF7J8WzrnSfko11Rz2W9ni+Arsp4ks8x/B5sbHtEcc
	VzQd1AZRnXsGJhPDIbD5pzbka916e6II/IZxvRiXH5zPEk/p26m+RdTJzz2bHinEd5RVr1q6jnUMI
	63SD2o41u9ehFXyIfKgfFGgFyLVpAoWv+b0Vo8f5pfyFa4wyRi6ODP66JsRQTOWikejjloG6ivVjj
	teZmGp1zitOKwDEmzgG/uIT0+/ot8d8+0itNArAkUmpXZbRAyq2D9tNvxrWCZA6yuMxyBNubRcxPC
	t/Y2jJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBrd-00000004up2-3pdb;
	Fri, 13 Dec 2024 20:02:17 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBqY-00000004uQb-1V82
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 20:01:11 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so19308336d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1734120067; x=1734724867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjFjYpSxXBJz9M1hdmG3iiPhNXo18zA2UB8YwR16DTw=;
        b=ZznwfE8nhMNKn88jRH6E6iqeCagm5oFSwTpfVCNktv0zSahPQv1Klc8DXsCKZD8sbR
         PQU/mL3cm9zGEWrhrLsx2yN15CiPo9W+o3H+D4onCBpjQlzJFMAtzjuglhel+Z6fKFmw
         4ZBy/SZuEqDl7Cf/6iEskovEBD43SW4Ta9cN5ea6B7H9t2n8du2t1j+wXSWxhxJLVr0h
         /LcmTfq6wcYw9I5ysASNMlXjowNQCFYzf4YSIdaQnYPfJxE1svZYCSLvkQl3SfKG/kv1
         IsivQQ0V4rbSIB/dkeDqbJ02W22OrgfCsp9F30rG8LExW4ZYeK8eic+KXN/FzZosg4qM
         SkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734120067; x=1734724867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjFjYpSxXBJz9M1hdmG3iiPhNXo18zA2UB8YwR16DTw=;
        b=ZRW46RTqxcK9+tOCgEZuujzHR3FexplMI8DtqNpmc0eOcrsuRSNbdmxtQshANMVQV3
         riACRVVcVq9WYAD1SWHitVy/aA97ZWG5QG9uj9jaH4PtXp6eCAo2wrx9YYDifPMLyTV5
         GhSVNgCvr0shs/nVMcDQVDoLrSAF3djCq9qJjvvfh2FgSx5BTutF96t8MVTpzir2VO16
         RUz1uqyWvCWI8QkxssgZWZ3ERJ2tFngV9KcicUtRE+/uMLicQnJa6pHNNgBEaMw3F6pm
         0V3jMor3WyLADGp8gmcO6EMrJl2t3hNIFxpx3ca+j3VGZUQvrTb8YlZ8CgOwjGzaLXmY
         tw7A==
X-Forwarded-Encrypted: i=1; AJvYcCWfDOQ4XJPzG+V/5gWYjSsKcDIhQKbM+NkF631S4NWWiCVneog2Xlnn5ko6om6e6Cnydh7wWlLkcuu2qSn/PwIb@lists.infradead.org
X-Gm-Message-State: AOJu0YyvMt3JP2KW4mFOjnvTwpr4NuAv28U7GCKdhRTKz1W9BeenWOkX
	EY+mfSorvKL7FvTLDcmI/p6tROTFhKKXdVDI9av+WyBOXDxW40i7atv6TlJXMxNFHgjGGgi87gH
	n+LqVGyXt6pjTiRYsaVSP2uTVVDrBZvoEnrvQOzLgA/bfXN+wo9Y=
X-Gm-Gg: ASbGncvRasJrIWyJprynJOFFN55byWsPUU2mDvjtsa+1diXhB9sKaS2lIUz7M9WuuFQ
	mFdOxjm/FHXwaPbr2P1nm9wiqsWs1+Tq4yF8unw==
X-Google-Smtp-Source: AGHT+IEywBNIbwjppPoVSQ/XELBsV0fF8sTiDrKGwA9AnZLBRibm/aOssHinTtzowKOKfn5HmY+4fB4H6J+nE2ZGRjI=
X-Received: by 2002:a17:90b:2242:b0:2ee:ba0c:1726 with SMTP id
 98e67ed59e1d1-2f2901b253dmr5268444a91.34.1734119680395; Fri, 13 Dec 2024
 11:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 13 Dec 2024 20:54:29 +0100
Message-ID: <CA+HBbNG0k24fO5OG42jw-7trWbT3iVTdo6Hh=55s1MaTh28p-A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/9] net: lan969x: add RGMII support
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>, 
	jacob.e.keller@intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_120110_439970_D202360F 
X-CRM114-Status: GOOD (  31.89  )
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

On Fri, Dec 13, 2024 at 2:41=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> =3D=3D Description:
>
> This series is the fourth of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
>
> The upstreaming efforts is split into multiple series (might change a
> bit as we go along):
>
>         1) Prepare the Sparx5 driver for lan969x (merged)
>
>         2) Add support for lan969x (same basic features as Sparx5
>            provides excl. FDMA and VCAP, merged).
>
>         3) Add lan969x VCAP functionality (merged).
>
>     --> 4) Add RGMII support.
>
>         5) Add FDMA support.
>
> =3D=3D RGMII support:
>
> The lan969x switch device includes two RGMII port interfaces (port 28
> and 29) supporting data speeds of 1 Gbps, 100 Mbps and 10 Mbps.
>
> =3D=3D Patch breakdown:
>
> Patch #1 does some preparation work.
>
> Patch #2 adds new function: is_port_rgmii() to the match data ops.
>
> Patch #3 uses the is_port_rgmii() in a number of places.
>
> Patch #4 makes sure that we do not configure an RGMII device as a
>          low-speed device, when doing a port config.
>
> Patch #5 makes sure we only return the PCS if the port mode requires
>          it.
>
> Patch #6 adds checks for RGMII PHY modes in sparx5_verify_speeds().
>
> Patch #7 adds registers required to configure RGMII.
>
> Patch #8 adds RGMII implementation.
>
> Patch #9 documents RGMII delays in the dt-bindings.
>
> Details are in the commit description of the individual patches
>
> To: UNGLinuxDriver@microchip.com
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Lars Povlsen <lars.povlsen@microchip.com>
> To: Steen Hegelund <Steen.Hegelund@microchip.com>
> To: Horatiu Vultur <horatiu.vultur@microchip.com>
> To: Russell King <linux@armlinux.org.uk>
> To: jacob.e.keller@intel.com
> To: robh@kernel.org
> To: krzk+dt@kernel.org
> To: conor+dt@kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: robert.marko@sartura.hr
>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Tested-by: Robert Marko <robert.marko@sartura.hr>

> ---
> Changes in v4:
>
> - Split patch #4 in v3 into two patches, where the new patch #5 handles
>   PCS selection, by returning the PCS only for ports that require it.
>
> - Got rid of the '|' symbol for {rx,tx}-internal-delay-ps property
>   description in the dt-bindings (patch #9).
>
> - Link to v3: https://lore.kernel.org/r/20241118-sparx5-lan969x-switch-dr=
iver-4-v3-0-3cefee5e7e3a@microchip.com
>
> Changes in v3:
>
> v2 was kindly tested by Robert Marko. Not carrying the tag to v3 since
> we have changes to the handling of the delays.
>
> - Modified lan969x_rgmii_delay_config() to not apply any MAC delay when
>   the {rx,tx}-internal-delay-ps properties are missing or set to 0
>   (patch #7).
>
> - Removed 'required' constraint from {rx-tx}-internal-delay-ps
>   properties. Also added description and default value (Patch #8).
>
> - Link to v2: https://lore.kernel.org/r/20241113-sparx5-lan969x-switch-dr=
iver-4-v2-0-0db98ac096d1@microchip.com
>
> Changes in v2:
>
>   Most changes are in patch #7. RGMII implementation has been moved to
>   it's own file lan969x_rgmii.c.
>
>   Details:
>
>     - Use ETH_P_8021Q and ETH_P_8021AD instead of the Sparx5 provided
>       equivalents (patch #7).
>     - Configure MAC delays through "{rx,tx}-internal-delay-ps"
>       properties (patch #7).
>     - Add selectors for all the phase shifts that the hardware supports
>       (instead of only 2.0 ns, patch #7).
>     - Add selectors for all the port speeds (instead of only 1000 mbps.)
>     - Document RGMII delays in dt-bindings.
>
>   - Link to v1: https://lore.kernel.org/r/20241106-sparx5-lan969x-switch-=
driver-4-v1-0-f7f7316436bd@microchip.com
>
> ---
> Daniel Machon (9):
>       net: sparx5: do some preparation work
>       net: sparx5: add function for RGMII port check
>       net: sparx5: use is_port_rgmii() throughout
>       net: sparx5: skip low-speed configuration when port is RGMII
>       net: sparx5: only return PCS for modes that require it
>       net: sparx5: verify RGMII speeds
>       net: lan969x: add RGMII registers
>       net: lan969x: add RGMII implementation
>       dt-bindings: net: sparx5: document RGMII delays
>
>  .../bindings/net/microchip,sparx5-switch.yaml      |  18 ++
>  drivers/net/ethernet/microchip/sparx5/Makefile     |   3 +-
>  .../ethernet/microchip/sparx5/lan969x/lan969x.c    |   5 +
>  .../ethernet/microchip/sparx5/lan969x/lan969x.h    |  10 +
>  .../microchip/sparx5/lan969x/lan969x_rgmii.c       | 224 +++++++++++++++=
++++++
>  .../net/ethernet/microchip/sparx5/sparx5_main.c    |  29 ++-
>  .../net/ethernet/microchip/sparx5/sparx5_main.h    |   3 +
>  .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++
>  .../net/ethernet/microchip/sparx5/sparx5_phylink.c |  14 +-
>  .../net/ethernet/microchip/sparx5/sparx5_port.c    |  57 ++++--
>  .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
>  11 files changed, 484 insertions(+), 29 deletions(-)
> ---
> base-commit: 2c27c7663390d28bc71e97500eb68e0ce2a7223f
> change-id: 20241104-sparx5-lan969x-switch-driver-4-d59b7820485a
>
> Best regards,
> --
> Daniel Machon <daniel.machon@microchip.com>
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

