Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC36C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifWQ8YaMc5CQm1ni9DW+Z7Yqh55h/cFdZBqgsTVphkY=; b=RCoqtX0PK3E6fUXrthP8gTysdE
	MN+SYx/mcmt8lTp/lavBqKqrvqHn7jv5EoM3DLUvFqShob7UhyDB32uBymympl+p34xMh5AJq0hVc
	HVrrvbGP+b61v8QXPU1D/VsaNOWTmjSObRy27+zikZQhzOJY4tdXxkImiciC4vXTNAxk0Ar0kAp0v
	72IJ81Y3WbdOHgChMZo6ZfdnnTyqXs+NuSR3dJDOKydu2owPxjvLR8ezLnjCJs9XtbHEJwNyE3ACq
	/8LGv0oonSkdfYqOsWwnlaiARAnPug8Zgk0ipEHrtZzkdfO2oCk8xGJJaXBic4HlYRPoe9TTY8J67
	lYE6RQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qf4-00000009Pqa-2yZZ;
	Wed, 16 Sep 2026 14:30:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qf0-00000009PoV-2Kw1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:30:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 450961A08AB;
	Wed, 16 Sep 2026 14:30:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1645860337;
	Wed, 16 Sep 2026 14:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C273711C7B024;
	Wed, 16 Sep 2026 16:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789569045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifWQ8YaMc5CQm1ni9DW+Z7Yqh55h/cFdZBqgsTVphkY=;
	b=PAFHXDgagaMbICkI8pF/F5Nz5W1gjfLrs/YkppCqVP1pMYNSPxgzDNoh7q+DYhGicdwrYf
	PT5MKU1C05LYJEvG7c2FAjeCDXZt49uyTEXYiGNsgQEZUIFo9Gn3dNx1y9W9wkLfU/7aPb
	vzohVysiTuf4GVtby1VsmN8oKU9d8Q7ZUe89SyFGWHWqfmxt14PRsnXT7ywBVYdGwH5OlH
	jqCvJ05G71TC8RvUYP+fNsTf78dwavvp6emdYAP1L54EDJ9LaoeEcGMIrOf0hq9e7O2q6s
	lH0l7yhmzYU7wIfR98nbme6zK7TkBj3xK17AW9YJl4T1VYqxyZnDThae3cpVdw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 16:30:37 +0200
Message-Id: <DLGTA297W2SP.36MAJCYAC9O2X@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Cc: "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
 <20260916091543.GA277833@francesco-nb>
 <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
 <20260916114350.GB284106@francesco-nb>
In-Reply-To: <20260916114350.GB284106@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073055_066522_704F7DF0 
X-CRM114-Status: GOOD (  35.78  )
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

On Wed Sep 16, 2026 at 1:43 PM CEST, Francesco Dolcini wrote:
> On Wed, Sep 16, 2026 at 01:19:08PM +0200, Luca Ceresoli wrote:
>> On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
>> > Hello Luca,
>> >
>> > On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
>> >> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format=
. The
>> >> > format reported by the downstream panel or bridge describes the dis=
play
>> >> > input, but it does not describe how the LCDIF data pins are physica=
lly
>> >> > wired on the board.
>> >> >
>> >> > These can differ. For example, a 16-bit LCDIF bus can be connected =
to a
>> >> > 24-bit display by wiring the available color bits to the correspond=
ing
>> >> > display inputs. In that case, using the display's 24-bit format to
>> >> > configure LCDIF selects the wrong data-bus mode and changes the ass=
ignment
>> >> > of color bits on the LCD_DATA pins.
>> >> >
>> >> > Read the optional bus-width endpoint property from the LCDIF output=
 port
>> >> > and use it to select the media bus format used to configure LCDIF. =
This
>> >> > allows the LCDIF bus mode to describe the physical interface
>> >> > independently of the downstream display format.
>> >> >
>> >> > When the optional property is absent, or it has an invalid value, c=
ontinue
>> >> > using the format reported by the downstream display device, preserv=
ing
>> >> > the existing behavior. The code is not validating the DT for
>> >> > correctness and just fall back to the previous behavior in case of
>> >> > errors.
>> >>
>> >> Why? Generally speaking errors are better spotted immediately, not ig=
nored
>> >> silently.
>> >
>> > My understanding is that the C driver code should not validate the DT
>> > and that this is the general recommendation when parsing properties fr=
om
>> > the DT.
>> >
>> > The DT checker is going to spot errors in the DT even earlier and in a
>> > static way.
>>
>> Drivers typically check for invalid values.
>>
>> And people writing their private dts can do mistakes and not run the sta=
tic
>> checks. Bad on their side, sure, but having a runtime error would be use=
ful
>> there.
>
> Understood. I would personally not do it. I can add the required error
> checking code. No other DRM maintainer/reviewer commented so far, so I
> am taking this as a request.
>
> What should I do in case there is an invalid value? Fail or have a
> warning message?

Just fail. You are in the probe path, so it's OK.

>> Also consider potential regressions. Say someone has an invalid value in
>> their product, say bus-width =3D <15>, which works because the default 1=
8
>> which gets used as a fallback happens to be the correct value for their
>> hardware. Some years later we implement the new bus-width =3D <15>, and =
then
>> that user upgrades to a newer kernel and their display won't work becaus=
e
>> it will start using that incorrect bus-witch =3D <15>. Better stopping t=
his
>> before it starts, IMO.
>
> I do not see this situation honestly, if you have a wrong value, e.g. 15
> bits, before this patch is ignored, and after this patch is also
> ignored ...

There is no problem with the code in this patch alone.

The problem is when in two years in the future we do implement 15
bits. (That's an example to explain the principle, I don't expect it to
happen with this driver.) But imagine in the future we add:

	switch (bus_width) {
    +	case 15:
    +		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB555_1X15;
    +		break;
	case 16:
		mxsfb->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
		break;

At that point the device in the wild with the incorrect 'bus-width =3D <15>=
'
will start using RGB555 and fail, because they really have a 18 bit panel
which worked thanks to the automagic "if DT is wrong, let's go with the
default". That's a regression for that device.

Reporting an error from day 0 means 'bus-width =3D <15>' will be blocked, t=
he
device won't probe and the mistake in the device tree gets fixed before
shipping.

I hope it's clearer now.

Cheers,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

