Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC60CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZjE+aJ4X+OqBxNEC4kYnyi3sOPxXey2hjWtTIRy3TE=; b=esYU9TLqIAS8WQw46wVIpBASGW
	Io+Q6hZqI1F5lmtFe/NJJM3UYdNvL1H+PgpdAY+pym/F9rIdCLrlG/texpwu9AQydNjFp1QRqlS5p
	3ZylEW3ZQepuItZWwdQYtMaU9BbqGRj3qC5rKk5AVZhRyJMhSOaUJTgu0b6hb6O5CinGvc/Li4IRl
	Fr1AIESthlTankY1mPtOe5flrz1WXwURwaH6nwHhG/Y/gF7K28h4P9jJ001pssOOBz5f9eVVwhk+i
	RvXnmLOY/jtJh21GSUffWX23i4uBPED7LDG0q2K4jFYWdywdKXf03997hI+rmC4Zn2bLMOYdksNuq
	dLzGnnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCd0p-0000000Bdbw-2SHE;
	Fri, 02 Oct 2026 13:09:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCd0m-0000000BdbG-1cBY;
	Fri, 02 Oct 2026 13:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KZjE+aJ4X+OqBxNEC4kYnyi3sOPxXey2hjWtTIRy3TE=; b=RpXcwATKgD3GA4eeikau6CnLBO
	LdPpjqfIww+7LsNxanj8VUZB2FMcGjB4rARfcJQkjXWsPTEiSIOrm/3YOZ3+Qh6RsK9xIIpcQSt/+
	H14XV958hnXmFOXE8863UqZRTEVM90dgQKX0D86ZcgZN1eL19Ik7Y6VxRMnw8qdf/2mUnz4vfo+zZ
	uQNlGT+vrbDkruJaH1x7hs/FBHmVGcz+V6GBFbEpDAQCcSBeKGmL2/GtpPExqLkslJanwA3FaZ2zl
	5RcHS9axOUEI9SdfAx/UEwaldv6TgsNpcR3/3JX2dOCX6trTZqpdkYqeIvQrADIKv4j3OOufIY6Hg
	SrGJwHlw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>, Johan Jonker <jbx6244@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>
Subject: Re: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
Date: Fri, 02 Oct 2026 15:09:10 +0200
Message-ID: <7009090.MHq7AAxBmi@diego>
In-Reply-To: <545b78a0-159b-4ebd-9e2a-47d519c98bf9@gmail.com>
References: <20260829-cpu-v1-1-33dca576db92@gmail.com> <2667576.VLH7GnMWUR@diego>
 <545b78a0-159b-4ebd-9e2a-47d519c98bf9@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_060916_642945_8C148D9C 
X-CRM114-Status: GOOD (  17.69  )
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

Hi Johan,

Am Sonntag, 30. August 2026, 13:17:15 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Johan Jonker:
> On 8/29/26 23:59, Heiko St=C3=BCbner wrote:
> > Am Samstag, 29. August 2026, 01:40:57 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Johan Jonker via B4 Relay:
> >> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> >>
> >> RK3066a CPU1 fails to come online. Fix by using
> >> a similar mailbox construction as in use with
> >> other Rockchip SoCs.
> >=20
>=20
> > "RK3066 CPU1 fails to come online with recent kernels....[rest]" or so
>=20
> Not recent..
>=20
> > and also please use the line length up a resonable length like around 7=
0> to 75 characters.
> >=20
> > Also, is it known, why that happens - i.e. what changed?
>=20
>=20
> What loader chain did you use then?
>=20
> This guessing!!!:
> From TRM: RK PX2/rk3066a supports to boot from internal bootrom or embedd=
ed SRAM
> Currently rk3066 U-boot doesn't remap, so we end up in ROM code waiting f=
or deadbeaf:
>=20
> void main(void)
> {
>         deadbeaf =3D 1;
>         if ( !(__mrc(15, 0, 0, 0, 5) & 0xF) )
>         {
>                 __set_CPSR(0xD2u);
>                 __set_CPSR(0xD3u);
>                 DELAY_write(24);
>                 CRU_CLKSEL();
>                 DELAY(10000);
>                 MAIN_LOOP1x4();
>                 DNL_LOOP();
>                 while ( 1 )
>                         ;
>         }
>         __set_CPSR(0xD3u);
>         while ( deadbeaf !=3D 0xDEADBEAF )
>                 __wfe();
>         secondary_startup();
> }
>=20
> Can't put a precise time tag on it since when.
> Let us lead by what current available open source loaders solutions can d=
o.
> Please advise here.
> How far does a fixes tag have to go back?

So ... found time to test a bit:
=2D Both my Marsboard (RK3066) and Radxa Rock (RK3188) currently have a
  u-boot that is really old ... 2017.09 / 2017.11 to be exact.
=2D Both boards can bring up the other cores just fine
=2D It seems there the remap was still enabled:
  https://git.u-boot-project.org/u-boot/u-boot/-/blob/v2017.11/arch/arm/mac=
h-rockchip/rk3188-board.c?ref_type=3Dtags#L31
=2D You cannot require people to update their bootloader, only work around
  old versions.

Right now you end up with a meshup of different parts.
In the old codepath, sram_addr+4 contains the kernel-start-address, which
now gets overwritten, breaking older loaders.

So the way forward would be:
=2D add code that disables remap on both rk3066+rk3188, hopefully resulting
  in the same behaviour indepent of the loader used
=2D change to use the bootrom path for all socs in rockchip_boot_secondary()
  so just remove the conditional around it
=2D drop the rockchip_smp_prepare_sram() part, as it's not needed anymore


Heiko



