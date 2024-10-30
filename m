Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A639D5CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rULvNichQesAS+BgmPl/sd0NpNj1EoASQ5iS96a/gGA=; b=IDpTc5+vuuEG1tVIW8ay0jK99I
	9d1/LuVG4+tUwiV8T5lLPCagU2Bub3v588qY7kHrJuHvvTN4vOjzsLe1L+tUaCMV/dURQjmfb2Hq6
	MhSdheIvaF2ebyoISdQ2FNeK9Vqz4wd1rD78BYBcZVLlbyyQE0xbAJkJuR+N79yZP2OfJM0nzyoMR
	9MUo5AJDDZ7aX9t7Dl6FtY8YpDlWOzg1I/ToSBFQdKdLj2BBY0GOThp/x9SbwwdXUgP+WQCTFOP5i
	AB0nCskXBAX+obVLT15XWsPf9AwyJ2FGszdDWHGLRF11Gxf6mfYWAMA/aZCzCJS+pmgia6PwIfe8j
	LElwvDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ADc-00000000m2J-27F7;
	Wed, 30 Oct 2024 15:02:44 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ABV-00000000kvh-0De7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:00:34 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-84fd057a973so1745461241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730300431; x=1730905231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rULvNichQesAS+BgmPl/sd0NpNj1EoASQ5iS96a/gGA=;
        b=UWObOpLs85jpWnKbHW+YbvNfhfO29z4ub4recvfQGCkpZ3PbSO3T0ZRC6HvXKCTvFp
         63820ba3wA37OTVuAgVr5yNpVkLjhkNpTkATpeQNBbaqeYomY+4KTsNGneI5s8nyWh73
         PDP6tR67rcBsq0nZliExtOarc8O2jit6QobMSf1Iq/LWvqneKW58jEvH9bZJm1/sTHe1
         IHqWYNhm6k+RkNeuy2p3WVR78vqdJOFOkgOCJx4tyAaP/SpLb3WDdkQxDQpm5Eph52Ld
         /Chn0Ccjit9N8gpriFw84eEhLs8cB+Leqsf2JjkRJA2EKetskl7dg6p0ppZDi1iXwUXw
         nB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300431; x=1730905231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rULvNichQesAS+BgmPl/sd0NpNj1EoASQ5iS96a/gGA=;
        b=j1wLsaihqlJdIV4yyFnZEcXrBCOUhIGPRc+xksqoJEtRkJPsqkj2cFGshTXhM6O3g2
         8WGhJ5n0hJshJm1gbIt1Rn59U6P5HCM5lhE8FSK78sdtIEWw1539sH8eHAM5CvLxVEeQ
         1n35IEA52t+MLyhItwsJfkzBEDyK6BeSQgMKqZ7X0Q6xG6/UXppYM4yUzIXvMXOJJ2BA
         f/sG6BG5eOqVpve/5BtwdCkOjK/blS5mjiTablOZT4z8qyi59es5WaZFCKlo+CZNDL7J
         FGARBVKs0+8XlptvRX/QfgJSo8nlJ93vs6trvgzW77Mq51I9cXKrjHwQTxL756bwYlql
         CwBw==
X-Forwarded-Encrypted: i=1; AJvYcCXMCL5xGgJCYTPxeQCwm+Mn0KHwDYVb436/D+igLTeHfvg+5VqAH9rMxB4gVZttjZSXIMEI6q582H2CmVT8aKoo@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ9wHn99D4GwZFSjFm36mawvhk4gptSMuc95OXMFTSvUHNYgar
	7hBCPEWR2IXEn5YRGM34D82+8fvRN7RAjmJOd8pyBB/12BzDxUSrQtlVNm0sQEPZ2MG/JHOm4Aq
	YNTjmj2ibeLM64va2fIBSl8RALAk=
X-Google-Smtp-Source: AGHT+IGQPAOAvrDdaWqZtP3lATUixCSPGWfj+d5lffyZ2v6OC+36VZ5Z0Mp2NekS6Gn1XXBZCpriDdcwWyKIc08XnTQ=
X-Received: by 2002:a05:6102:6c9:b0:497:6bb5:398a with SMTP id
 ada2fe7eead31-4a8cfb5d0c6mr12909664137.7.1730300431163; Wed, 30 Oct 2024
 08:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
In-Reply-To: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 30 Oct 2024 10:00:03 -0500
Message-ID: <CAOCHtYgRD_HTD1F-5+CQ3H1PK3Lbhb-ZdyqDYp3wN2wRK5vOUA@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_080033_118666_48D2836B 
X-CRM114-Status: GOOD (  13.68  )
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

On Tue, Oct 29, 2024 at 12:18=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi all,
>
> During the last few months, booting kernels on BeagleBone Black
> sometimes fails with:
>
>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
>      davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
> driver SMSC LAN8710/LAN8720
>      soc_device_match(cpsw_soc_devices): no match
>      cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
>      ...
>      am335x-phy-driver 47401300.usb-phy: dummy supplies not allowed
> for exclusive requests (id=3Dvbus)
>     +cpsw-125mhz-clkctrl:0014:0: failed to disable
>      am335x-phy-driver 47401b00.usb-phy: using DT
> '/ocp/target-module@47400000/usb-phy@1b00' for 'reset' GPIO lookup
>      ...
>      cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
>     -SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
> (mii_bus:phy_addr=3D4a101000.mdio:00, irq=3DPOLL)
>     -cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
> flow control off
>     -Sending DHCP requests ., OK
>     -IP-Config: Complete:
>     -[...]
>     +cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@=
1000/ethernet-phy@0"
> not found on slave 0
>     +[HANG]
>
> Adding debug prints to smsc_phy_probe() makes the issue go away, so it
> must be timing related.
>
> Adding specific debug prints in the failure case gives:
>
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: phy_probe:3613:
> genphy_read_abilities() failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
>
> and later:
>
>     Generic PHY 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     Generic PHY 4a101000.mdio:00: phy_probe:3609:
> genphy_read_abilities failed -EIO
>     cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@=
1000/ethernet-phy@0"
> not found on slave 0

Hey Geert,

What revision of the board do you have, Bx, Cx, etc.

Only C3 has the new PCB with the phy 'reset' gpio line.

https://openbeagle.org/beagleboard/beaglebone-black/-/blob/master/BBB_SCH.p=
df?ref_type=3Dheads

For pre-C3 boards, removing "C24" has fixed a large percentage of my
boards in my ci test farm, while it's not a perfect fix as some still
fail..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

