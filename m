Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CF0EEF30D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xR/ODl/LLpv8qzPXxQC2I5D7gVivJZJFQgXB+mbpQQ=; b=n7nQxWYrvEbN49ZVc7T/j6EXgG
	6eSccLYB1FZe3HQsM1cKvCjPKXt+xSj1zu23e8PfOpHVrzkOkVIBauNziHeBrHW98dPDMw7PMfZ4I
	vYW+HIKqkT7g2WUE6raU4DLiutkawk3djbR/wf34kh7zqO9nMr27CwK79ts8zf7NmnSV1mtLabCzc
	rsLa0Mw2gN1l+/1tfmYdiqkn7VwQPWagWGyc1bUI0INgntpXA+8W5oe5O9OmnEOosQp6PwF+P9TWP
	UywcYNY09me0Y3LBAEgokCcozr/bnnn4dSOVxMHUzygde+zTb+puQdPZGr828HsvlkLZ25ZjGVsEw
	kjEUlD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2Xr-000000012jA-3lkB;
	Thu, 05 Mar 2026 06:50:51 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2Xp-000000012iC-3AlH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:50:51 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-899fac9caabso61061486d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:50:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772693448; cv=none;
        d=google.com; s=arc-20240605;
        b=BRw46B9qwy6MgNCDZz3I1cxdUH2gpc6qJK7OHJpPb3C1rhf5u4SUlxMal0dFhwX1ty
         1v6H4MrBUh4GwElInBekJ33R/SXP+/JoNfraPzNE9dTpMrjis8jFlHnmpcECtg0Ze4MN
         KbekIjSOIqZTjr2GJgaxfjAWLTUNk3DcVqLP8sRqKSinFQbZcxnFPko9uKiHExt4EC7Y
         Oj1r4Ewh5UnMUrfU724b+35QlZfXwyXCK6LUobTnFYDucQlKzw9/xjA7oFBrd/szIE4r
         I21c2QSK3oynF2lbs0nKEIc4I5Z8iATaNc1svqiIPgqZW5zJ9GTz5+qPm5WUT0a3dHg9
         D16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7xR/ODl/LLpv8qzPXxQC2I5D7gVivJZJFQgXB+mbpQQ=;
        fh=mqTCEwfWNmY/8gqfXNZd5DoDO+oy2gf9ngv5DZT8Oko=;
        b=KFIEBZj/T8LYVDytDhxiGxyMojkI6CWLSGjegpSvTtKVItTRSUURdn47cwCF6fu2pw
         ZBhkEMVLdAKxEsuuwCRcHTfcKKdCO3IC/0dTparpxxucUOUFcPY4nwibaesBBJzWph0O
         dvgS2N6LNTpAUTQMtf1NU5e5hEWQ1wjK7JgVRm8zCaT9cj1F8d3NAxtg3F9ggbArYUkF
         huZO2SABdf2t1OZW4+LPD2IJtWZpI2bUTh/vLoD/fNCrZ/uCEUp+0ilMnwcQgAlv2ay1
         h+5oxX8vGdUXlWnWVa4qg4zVicyZ4zwaNvOOAFggVcMMDTevLJdnkakZLb2yl9Q+VMAQ
         lyfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772693448; x=1773298248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xR/ODl/LLpv8qzPXxQC2I5D7gVivJZJFQgXB+mbpQQ=;
        b=ZWFn/C9CETl/O6NkT9kHbd9F2STa4rH4BaOEOGnpFSLusHxqF9RfJdQ7hsADFjgrGN
         g6SswAtFQxXTcs5Pjqt8AQ/h42ZVK42TOy5SOvxjXxVDOPWBKfrHf+GGevbgvQPxS7QV
         Dr7HOg2qOc+cFV60ge8oZi99rH0UB7c4CNiKnwNpuKEgejN+6+sfM40kZY+RXna3iur5
         4+8vGhON6FgZlCK4rdOmRVdjDc7sonWxEOGazbWQrgjraJyEIl3ri72+xPEMWpQoEtN/
         tUI3EVCOWyIjn7G3AN5XgCaMkpB/JAvbNqEpGgYOV3fq0GJIrInfkycd/VYbXtu9BMdN
         ltHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772693448; x=1773298248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7xR/ODl/LLpv8qzPXxQC2I5D7gVivJZJFQgXB+mbpQQ=;
        b=tBnesKpw8x1/5izLNpvvz2xlNhVYuFtqDhGHMC6ikmxL9SkQ1vUu24Ja9sIjFIROAu
         mKjZOwREvQgoZFy2ZK8wRs1L5ly1n+jcreDuTuvmXN2Lbf/yGaQUpSuSDB/jdURBgxF6
         7GlvWYX+OxGgAaa9p0/4wz0Hi+IAsmdvzyKh+169qFKs5yQMDPGQ18YsuotD6R6XtFNb
         QxoQHhMPzLjDqcgKDKLXouxCWhLuk/sIbaJ6GyREyx9Q+hH91zzhxr1GRaxiOJtG5eey
         TbY33+eb6J+QeiQlNQnRLpgXerVbtPovJzGPa/mXo2QWvJHrETATbq1xWPSeUqEIStUc
         +xTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjDImeDaKQnLpVVmKfN/smaUJJ7WhVg1xSdr5Wi9yvOZq/8BcD1Y31HeAvB43WNWiohNLc0FFf4U00vftXGW6/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5qMNV5rp3veCCzVSybLeDeDKnOpaJjDVmSSn0j3GPu+S29Sn+
	OYjYdYUeRItd9phlHe16QGKdMMx+PtVGz3oHTZyJ+dU56AeehdN/QAce0nAuJpbzvfcgni4uGOF
	/encOFrB/6IMqGEpwPj4LUu37seqXWaScHfxHG9K7R+EWkEgwU2e7cm32gbuzwRX1Bw==
X-Gm-Gg: ATEYQzx2UtdT3srFoZPnlSCYQnNuBTIf3ShCBS39R8X+KBLcOj+0xVgxQkf2k8JD7dR
	vWT+R3UaxBgtJWwZYDo+Y+olg3HZpKy6orm/bMCZM63ajCKUXkE1tFXwCNZmq2jZE/6/RDAA0JR
	En5lJAL+0QsX8DcvnMri5sosuqWZVHQTgdrn692X+iZuqflTmSiuP7bJQecp5AKZUduiAuH3973
	QZDus2tdxhYGAOwWAXDc5Z14oEHti/VOJ5IDAWeIn/ZBqkrmL8q40HPQSOEGsfgmpGqfm9McjLO
	LidZTPvWd9NWavVP5juulMJrHiEsojYE215ICa4NlLA1EQ53nI9J0sczF4/VHeJyFJJOEaI=
X-Received: by 2002:a05:6214:d89:b0:89a:90e:3a1b with SMTP id
 6a1803df08f44-89a19af74b3mr66467296d6.25.1772693447983; Wed, 04 Mar 2026
 22:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20260228205418.2944620-1-dennis@ausil.us> <20260228205418.2944620-3-dennis@ausil.us>
 <CALWfF7LZV07x7zAgufE_aa58s7x6e_ODAM2LgZqjbEakDticpA@mail.gmail.com>
 <CAABkxwsJ2ZnytCcHEvXWzNkjwzNThoTR23FAeHJLdf4JjXJEMg@mail.gmail.com> <CALWfF7+gdNqSgzk4uAnVRkG8vT9FwJDV46VXpb26hd7BzdaGcw@mail.gmail.com>
In-Reply-To: <CALWfF7+gdNqSgzk4uAnVRkG8vT9FwJDV46VXpb26hd7BzdaGcw@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Thu, 5 Mar 2026 00:50:36 -0600
X-Gm-Features: AaiRm53rLf9JFsOMPcs6Gcb8I80gESnZp0sJGMhEniGuj0Hsfu1GrQDeh7FJtCU
Message-ID: <CAABkxwtG2e5LpjS-sScmn46DY3eXd6tyNCc1oNHKqoaO+PVwuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_225049_816455_76363A0A 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Mar 3, 2026 at 9:45=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> wr=
ote:
>
> On Tue, Mar 3, 2026 at 1:43=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> w=
rote:
> >
> > On Mon, Mar 2, 2026 at 11:57=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.co=
m> wrote:
> > >
> > > Hi Dennis,
> > >
> > > Some curiosities below,
> > >
> > > On Sat, Feb 28, 2026 at 2:54=E2=80=AFPM <dennis@ausil.us> wrote:
> > > <snip>
> > > > +
> > > > +       /* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> > > > +       /delete-node/ pwm-leds;
> > > <snip>
> > > > +
> > > > +       gpio-leds {
> > > > +               compatible =3D "gpio-leds";
> > > > +               pinctrl-names =3D "default";
> > > > +               pinctrl-0 =3D <&leds_rgb>;
> > > > +
> > > > +               blue-led {
> > > > +                       color =3D <LED_COLOR_ID_BLUE>;
> > > > +                       function =3D LED_FUNCTION_STATUS;
> > > > +                       gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> > > How come you decided gpio-leds instead of pwm-leds for this? GPIO1 C6
> > > is muxed with PWM15_IR_M2
> >
> > the downstream dts uses gpio-leds  the GPIO comes from the schematic
> It should be fine to upgrade to pwm-leds when adding into mainline.
> The Orange 5 Plus did.
> In the downstream DTS, they used gpio-led for the green led
> https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2b7=
b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus=
.dts#L31-L36
> But in the mainline kernel, it was converted to use pwm-led.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts?id=3D236d225e1ee72=
a28aa7c2b1e39894e4390bbf51c
>
> Jimmy

Is there a reason the blue led was not converted from GPIO to PWM, and
only the green led was?

Dennis

