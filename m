Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C464C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZWRyIOR12XjpCq7KOfvCBwF2aNqp5fB96/2KD4sI4w=; b=yfr9b6xNrTnA85vJIPjhODjJ2P
	zTMODXJuVyVJge5naLnuosgHxTgzIgZFujgj+4rwDGyy9fCk6q7YcC10IKEHMOX0pFL2fbL6arQis
	FBGouh0P8Q/4ppjYMD/BF8X1PNkDaVfoG24KPuUQZ4s+u7GgPRG1F1xLg5lsWI+yIZw2py+H4R9eO
	zANgHmO92MX9yaupkNad9X1MxmPnnZMI/N4AhKLNQW/i3uczMJfv5plo9EnLxxZ6rYje4ItWWEJgg
	fG9wpB4tmM1MlV0HcUdqGemea/lxCA5y5OBlgpqjjPcpbqJ5TNs2y7tROwfMVbioXFdXvOZaaf0p/
	I4p5jynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDUd-00000002cEM-3SCS;
	Tue, 22 Jul 2025 13:57:19 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCf3-00000002VZH-37h2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 13:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753189442; x=1784725442;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M9Vw3KUZFsgEmCfhOhsRP4t6JpAYCh+PJDWJBaOwz3A=;
  b=DtJw39HNieyEtkXKlIPyFEneErTH9dMLtRujXhCZOUxrR5/Kv5b1g6D4
   A6kPnjWiiuCKECBKLjraN6fkFLj6waDeTsy97hspOU5IpWIB+75xqdHxa
   dVrGhUQfXCLx26J/v5u8aDiH0tK+uyjTQGLuJVbTDUFZ5YQMBUNefx9ng
   aPpwfzWNVtbKQvqdcjDAHVxHr0xZmHjWtR/yM7RI6PLBGkoL7agti2Txb
   cgy26OtD53+EFkJQD/2TvpjnmnDtOHflcC/2SlmIdgOykH7YdZD7niSBn
   q3VWYXK+RDEy7uK5qv3AR2YwaVM10JnlHURM7inoLf6r1AaTPnLwzFYAG
   w==;
X-CSE-ConnectionGUID: QgIkcwKYSlyHMF1gb5YBog==
X-CSE-MsgGUID: h7/HuO63SJKv4srk5o4U+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66868860"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="66868860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 06:04:01 -0700
X-CSE-ConnectionGUID: s9F4wQS3SoOdr768O6l/2w==
X-CSE-MsgGUID: a83p41ZBQmuPngQa5/7AJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159209027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 06:03:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Jul 2025 16:03:48 +0300 (EEST)
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
    neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
    maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
    simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, 
    Hans de Goede <hdegoede@redhat.com>, sven@kernel.org, alyssa@rosenzweig.io, 
    neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
    dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
    platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-fbdev@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v2 01/15] platform/x86: dell-uart-backlight: Use blacklight
 power constant
In-Reply-To: <90d816ba-aaf3-4b7b-9c52-72613be5b85a@suse.de>
Message-ID: <19aaca56-6784-209c-3076-cc63f733a021@linux.intel.com>
References: <20250715122643.137027-1-tzimmermann@suse.de> <20250715122643.137027-2-tzimmermann@suse.de> <c380d3a4-2a99-cf52-0952-ee916b6c9676@linux.intel.com> <90d816ba-aaf3-4b7b-9c52-72613be5b85a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-860532718-1753189428=:920"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_060401_831802_CC0C689F 
X-CRM114-Status: GOOD (  20.17  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-860532718-1753189428=:920
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Jul 2025, Thomas Zimmermann wrote:

> Hi
>=20
> Am 21.07.25 um 13:43 schrieb Ilpo J=C3=A4rvinen:
> > On Tue, 15 Jul 2025, Thomas Zimmermann wrote:
> >=20
> > > The backlight subsystem has gotten its own power constants. Replace
> > > FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > >   drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c
> > > b/drivers/platform/x86/dell/dell-uart-backlight.c
> > > index 8f868f845350..f323a667dc2d 100644
> > > --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> > > +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> > > @@ -305,7 +305,7 @@ static int dell_uart_bl_serdev_probe(struct
> > > serdev_device *serdev)
> > >   =09dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, res=
p +
> > > RESP_DATA);
> > >     =09/* Initialize bl_power to a known value */
> > > -=09ret =3D dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> > > +=09ret =3D dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
> > >   =09if (ret)
> > >   =09=09return ret;
> > Hi Thomas,
> >=20
> > Do you expect this entire series to go in this cycle through some other
> > tree than pdx86? If not, I'll take this through pdx86 tree in this cycl=
e.
>=20
> I don't know when the series will get merged, but it might still take a b=
it.
> Please take this patch through your tree. Good to have it off the list.

Thanks.

Applied it to the review-ilpo-next branch.

--=20
 i.

--8323328-860532718-1753189428=:920--

