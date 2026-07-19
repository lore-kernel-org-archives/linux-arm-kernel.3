Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560FAC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=; b=eM9mgziD6MajqVZxxZE8qLlbFF
	3OmieWYQsVD0SF7Dro1XIGqTLeJAQ4n67Ol9OF40wyYtaWkw2Vmj7ayJ7R/lHsWkBfJYvsJRGni9I
	LYBhVoBbqDan4gXn8j7lc/445JkAnlzJeIDXusb/r4ylzIvDvjCZIBhiHt9rdytkuPkCSLyZovYk5
	fCb4f2tweCgo8WNWZeWOAxpCP/r9Gl3KBAW8qhV1DxG/ZSrDgNvgxqZxp0eOiD9XNsYFpvWFAPdJq
	w0lYGl0j9JThvDu8iI8tVki0N/P+Y8xyPQnXfPtUcGc4C/zoL6Pk85NChAJiIF+IxR2Z9Vl0l6nZV
	MzgEmKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlLha-00000004oMr-0vhJ;
	Sun, 19 Jul 2026 07:12:42 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlLhY-00000004oMC-1JKF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 07:12:41 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-81e8c68c0cdso12533587b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 00:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784445159; cv=none;
        d=google.com; s=arc-20260327;
        b=Iwh6eldmBFzdBkObxTpv/VrJqk+pImIn7kGAZanxlBIvt52Sx7dglwe6RGya5JFRM2
         QiYSx3TYEeKvtDnWQN62r1DDheujM4RbudUFFSQvAjbtDsNCQkfU0ilkYGmc6aVRciBg
         KaH25vWyKPLnkG4w4AUpdkO6MGJeAbgHe8C5oC5PtI2GEcklcDCZZGiG3r4bADrhmqIq
         wbfHZo05kqF/NTMnCXK35oYt6tEyoVCqpJxoNU1xghRgNgJgQ4AC2OMGtb7f2SuuQUof
         RpTP59aMKQ1UOXh3otiOcnlyy/SkAgZgqI9Ex/sMhCJzJ1pC9ooVUPefrZINW4fm6Y0R
         LqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        fh=Eeb0XsXH57U5z5uh/liOjhMT7OsMPoXp5WO68QxCwHA=;
        b=pIxIdHXYuxbuVkreTbKRw3jKlhJdME5TRRnc6k1MwT/NBr2ZGj75NpfyjPGXzti+tH
         mRX1NWQNrOcw/F9NfAyZ31wZfMPoikbCXa7Xo33cPbH8X7PKKoBKqCsbwLehClpv0oNs
         Cb2G9S/2QDJqwvn3PbRZ/GrXPrAah8+UoAH6ovJQTv8SR+p2w7uPhOYAGtT+78vIARnE
         BGFcgSj563XTRIDAbYQVL5vwHd+lf0MWNLSWvdLkd0SLimKz93zIxlXznL9tR104MDXf
         LS+cG+lelId/5fVoxee0wT8XoJhmFpAJ1gassNjToR0oFUlQV1RVEioZHwAWTzt86JDn
         gRBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784445159; x=1785049959; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        b=YmWDgDWiv+DDmRUyWh5KFIJ3D8sDDCJXvRDRCGPldNrD5PcuuoQdpaeyampdhJqinR
         Kvi+L3m55zlJdUQPYfzXhr/H1nzIVsbraJbF/CWWv4It1Tp7XtxoqMCEKZQBqJywL3f8
         VkokxpYMB8cmn4C14UAEsHeWb93DzTzLmcI7dhV0gXLoiRkzWz1MRaA9XsR1cPHg01nt
         WZwa1pe6a05N6ciUq9FJ8bfXddXmzZkhDAze3ibH+lUpLfhmE1Pe1kjGerxnYjr2Lwrq
         OYI+Vyq7FKvAzcJZ3ZAa6yZvXVTsLcFdIha/GqCfg+HIl0R9vP0nGaLQzB3rDRkkMnwe
         9ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784445159; x=1785049959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        b=pqRvV7KdQgcloENcur1+b6xBpaKZu/C/KkXX6txVtLgBbKQ+HVvy5n08ebU9yiGwb1
         Z0+ZO1uRNuq/q7g0L+h79WtYFBxgRZFtKcrZUEIub9SAWxOvyVv29Lo4/KEO8oTz517X
         0y0g1KfL/wwkNVSKywE6nmbvOAdYUNbzMp0qmBFWUzeJOnHTSariS3oIoNeEAipK2maV
         u41QEJFsJ/5KrfUmqAUM1fnCT9OFVzWk/2fqvn/epjNV21Xu0BfATeBtvVXKtHfJ0lG3
         SHpkt+8WIjLIF5lPYqNdcVpKI0W1+7B4sYOqWSiFASfWH+CkongGm/dmLnTzyvxTOW7b
         qCCw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm3Ny3PyEFvHWcx3rRKY3Q/ib+cEQokTqYj0X2eFdSmzCoJAMChkgC0dVkPaXl99iveGegiAgrQfmii7Sk1Ll+@lists.infradead.org
X-Gm-Message-State: AOJu0YwejI+cy7a6JBMeXinF218D7/rOz0iWry7vIHMUOK7Su1Ln4YKf
	K2p9d368N7kXC40vIYUtDtsRO/vxIk5hm7KHGegphneu0dKhf5kpRhoA2Tc9pt22lcwzb4nAd93
	jmDv8Ru68wLIiUo/RnmUhtxMKk4bcws4=
X-Gm-Gg: AfdE7cnB5PFK7lWQQlvf9NZtzInqWUkAXoGg0V+jX+Cgu9Gwm2YggrpW3miLlKok2K8
	XoWMDYuCFxQP4NVwsXPa1nW14//TV2ZFQOqqwmElbL3h86lTajOlDIDXIJAKtJ0wdQbNcVcTPAy
	os5z7XAoaeonD9+zr4I+Wmv+yl3Xj39P4U4agswQBSOl0V2XGNlhJFifZ047LmvdYHyiEE+qSJ+
	oZpPktnGmV0/cuT8KTwiDSx9rfgftOiMAz9Nh46txluVHHmYLocxDYdNLFwWsxg8lAjALcW4QTR
	tyBnugeRHbWKDS4KveYkAVqnwj2wUlE=
X-Received: by 2002:a05:690c:83:b0:81e:6c2c:3ffc with SMTP id
 00721157ae682-81ef2629e3bmr32786207b3.6.1784445158857; Sun, 19 Jul 2026
 00:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-5-royalnet026@gmail.com>
 <alwKdkNsMi9L4ZiY@venus>
In-Reply-To: <alwKdkNsMi9L4ZiY@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 19 Jul 2026 09:12:27 +0200
X-Gm-Features: AUfX_mx_RiwSU3kUGsytx0X-0-rCnuMvcdXhkd-AchBz93x27nuKFpMthFPgCLs
Message-ID: <CAEWPSH7wGBatr7zUp07Ekz-_-9MWaFv1wYFHrawGUvV+U09meQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_001240_388956_38DA75D3 
X-CRM114-Status: GOOD (  28.49  )
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

Hi Sebastian,

Thanks -- both make sense and both are done for v4:

The card is renamed to "RK3588 HDMI-IN".
The card definition moved into rk3588-extra.dtsi as
hdmi_receiver_sound, disabled by default, mirroring the hdmi1_sound
node that already lives in that file -- and the Orange Pi 5 Plus dts
now only flips it (and i2s7_8ch) to "okay".

I'll hold v4 until Dmitry's testing round on the driver side so
everything lands in one respin.

Igor

On Sun, Jul 19, 2026 at 1:32=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jul 18, 2026 at 10:57:28AM +0200, Igor Paunovic wrote:
> > Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
> > interface dedicated to HDMI RX, through a simple-audio-card with the
> > receiver as bitclock and frame master. Together with the audio
> > capture support in the snps_hdmirx driver this exposes a capture-only
> > ALSA card fed by the HDMI input.
> >
> > Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> > follows the source sample rate and stays in sync via the FIFO-level
> > clock tracking in the driver.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > ---
> > New in v3.
> >
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 9950d11..d5840e1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -37,6 +37,22 @@
> >               };
> >       };
> >
> > +     hdmiin-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,name =3D "rockchip,hdmiin";
>
> The name is exposed to userspace and visible to the user (e.g.
> in alsamixer), but also used by Alsa UCM2. I suggest to use
> "RK3588 HDMI-IN".
>
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> > +             simple-audio-card,frame-master =3D <&hdmiin_codec>;
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s7_8ch>;
> > +             };
> > +
> > +             hdmiin_codec: simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi_receiver 0>;
> > +             };
> > +     };
> > +
>
> Move the whole card definition to rk3588-extra.dtsi with a new label
> (e.g. hdmi_receiver_sound) and add status =3D "disabled"; Then just do
>
> &hdmi_receiver_sound {
>     status =3D "okay";
> };
>
> in the Orange Pi 5+ DT, i.e. just like the soundcards for HDMI
> output. This reduces a lot of duplication as the soundcard is the
> same on all boards considering there is a dedicated I2S channel for
> it. It's disabled by default as some boards do not route the HDMI
> receiver at all.
>
> Greetings,
>
> -- Sebastian
>
> >       ir-receiver {
> >               compatible =3D "gpio-ir-receiver";
> >               gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> > @@ -247,6 +263,10 @@
> >       status =3D "okay";
> >  };
> >
> > +&i2s7_8ch {
> > +     status =3D "okay";
> > +};
> > +
> >  &led_blue_gpio {
> >       gpios =3D <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
> >       status =3D "okay";
> > --
> > 2.53.0
> >

