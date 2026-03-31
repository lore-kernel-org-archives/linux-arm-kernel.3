Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B8910F92F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=; b=WZJ+k0AOZrIQMGqZyzQSjRBIka
	HQIgcUo3y8XbOmMc6HOd0vBboI/OsWMWVZgtuBqLFui8OoMYBu2vOPkikmkBZe2cKY1azHWlS4JUR
	QsOkIhILZcohEB+/ZWe/ObPUI6YslkuvdZC9jPD36i4CJ8ks7nWFVJAVhr+VLJcEbI2F3VSTsxJQd
	FMWHOrPAj5tACsoNZn87a21YaPotXPyyCpyQA86GuoK+MQ4X7fyd+MLVtGg9HhBb8seJVKKZvp13d
	kU2TutHfAAfhFtAhRyuOUP9sIBtiCoAKlfHZvUFa9UF21VVHm9pj3v5sD/8dQGktSMtNWv9ewyTLm
	um0+o9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyW-0000000DUJQ-0H8M;
	Tue, 31 Mar 2026 19:42:08 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyT-0000000DUIU-1A7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:06 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-89cc84c7768so74301706d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 12:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774986123; cv=none;
        d=google.com; s=arc-20240605;
        b=Wb1cpyVSqhahh6oyPxUst1fVoy/cRv0+JB0GsJXp9Ysr7Y4oRnQzghK1xv0xUrhqAd
         RPXLQcp/7osh+cxHDxIZr6YSblSMz8lRTClATIIoMM0lZXb5F4QlnSJwxk1bUEIVxpDC
         tFpVr1N9oaC5sUcLeraB5CVInshBnSYHs/CcyLGpZw794xvoeTnxQk05HbqOyb1tqaA8
         AIL7EGfdiKuTvEw7icRQ2hwryzEWj8y6H6ijr7SDUn48c9wfZeYwwtRN/mJbTKNu90/o
         lpLuNv8+7j/3gJOMs7mXX4fJiLgogZcsG0TknAzSX4xvwjEoF9zvkBbCDipvR2kncLPc
         K3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=;
        fh=vth4TEzaWf6/hn9ohg7N73laMf8Vppnm9F9K4CN1qdA=;
        b=O+D4k3xLtscicsdGED73ETXx/Ms5/tZ2ZIwkFwJz1LgfhqjrGrsTaz5Y0BaRln9tfk
         MitXnMOSxPQVhDJMRetJsmhWAVkIQBswIqPTYvixcabL8jKtwSaHbSJkegCle1zcccRc
         skzHB6SD5U5P6kUYcVITH51Hd44mD0AkaOoJcu7K8xRWNvnfE/+heipkuU5x1gi0flnK
         lj2COLhGR1Qfz1YAgSZu661ULZmdQrKKOH8IyHbL0ogcMWGKoTe56HsCkBZabGrLiXjV
         TQUv5ld7I5GqE7T/Kuqr3l0qxPk1hfiZlydwfw5t5lAICxxX1AwUNC0HYW14NLtrnm0F
         TBgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1774986123; x=1775590923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=;
        b=EAxT18u80rBgpqKU0iOWoKjCxE0D4Oa0TWOInYO88epTgDlXvPLuLwzGVBB3xwjpRg
         6Tw9s/0yiLRVcLr572KtoUpCNcjUGZoO9o/d/3sTbNhnDeSEzZJiHo+YL6j9jaA+Ycol
         VgQ+fW/KcxU6HzeHX5Kp/LNl9wllnmO2w4LiHEFGhX9Yph0egzvDZAk1X0zDZV2VZJIh
         Ji40rwbZ5hJuBcFFyVdZExf54NFDGFMFbLx7Mo2FD7bWJ8JNIPWGmdjUCFiEj/wMlbVK
         nlwuX+LyNSwzAnyQRBsUxp5QyP7+gl0TkPRoYX5gKTd/b247YLkGuMr9R3AUpPNg2988
         SoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986123; x=1775590923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=;
        b=SIJIw9df4TTY6HK7kOk7NV1VBzT/obNXgZWsuy6lTJQyXiF0KXJd+JcAZ7IHI7h9U5
         CmWswn3K0PiTZms4Gu9y65xoF+CYQ8B6pKNQiTDnTXl3UmliNOZxsjI+ix0noXZL1JOx
         PI2bgSUZhdrWRY80CHywGmYNhsbrEMv5WNgjY64CDcLjCVktTF/dqdvCJxGKdpLSoI6X
         TA4ZzHihcng29fONE77zLmS4yJRcvOrthSMoHXo6g80VRHh7YqSXvGqncc7t2sntJqm9
         itUZt9PQXbbVxhJ7CqZG91KCnUdjeIi9SeFwrd+WVB4l/Ty460ICXFt0FI/5x4Gaj7At
         yIBw==
X-Forwarded-Encrypted: i=1; AJvYcCXIP8sOpQfc+4Zhp9KXuKyc3CPprE+8i9oU9VeCl2BnmJY7vWbDpLSCS0shA2Et6iOqL9u1LRsvDbxl0VM9DDf+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhq6NPvMA7XehNxy/0NPA7f5gwa6+Zhl15C8uzUKFfLEgZF+1M
	Yy4jcIuKqy+JpG3EHRPObGbYPFfQ8Z/IIhl4roSQ0uWx0WLJkIXWYKbH+Ew9wHUw1hYo7qr6A2x
	Ss3u8P8QDy1umpVqgYw1ODValcf5DEMye2Yk50EaybA==
X-Gm-Gg: ATEYQzzkDKYTJ8+T9/oupOLWlR9tycH+rwEUSANsJBVjK+rdy3iBYKNxBE0SSh50LQE
	nVGzUBjBwLYUfzEc2ojJCmbgPESUlFES0OsEtOjsMEYrEjA8NmqMXdCkZx7MyGLYrjlfUo5WW8Z
	l+JyZoCmAP/CNGsM72QgA6fSzE8F8khzuX/rY/a+f/RCgkRksl8RYdX/S/24OyQLFhSw2V6t4wi
	nfWQanQMbgT5lo/PJ2hx4uTWAig3Z+U8MuZnexMQjO7M1Nx2eyAlE+R9lzHDs5aIgC9ixNLFCBk
	wujJLWBpvlQkfapEPu3FRVQ3pqFTsEOdWViHL9T+J0vcGa1uqX3XYh/Wn7qLqBFijD4+1ws=
X-Received: by 2002:ad4:4eef:0:b0:89a:116b:e67c with SMTP id
 6a1803df08f44-8a43a464ea6mr12862136d6.45.1774986123445; Tue, 31 Mar 2026
 12:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260310031002.3921234-1-dennis@ausil.us> <20260310031002.3921234-4-dennis@ausil.us>
 <CALWfF7KD1=U-gC4wC9M49kEYD3ijcfr+XSmMeh_-zAvjO2JVoQ@mail.gmail.com>
 <CAABkxwtz7KjVJpSzYhUWGyEym5k4d3NJq65OS_E3NCnrNUBTZw@mail.gmail.com> <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
In-Reply-To: <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 31 Mar 2026 14:41:50 -0500
X-Gm-Features: AQROBzAJGaJIP3nK18K6kC_9mEp5NIzQoY1iqunk6Z7DDcVgaVEtYTtM-9GKruU
Message-ID: <CAABkxwsD_59G3YrpMdUi7D1fVHruSuDHn9-gQAZbwTdxGBHaBA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Alexey Charkov <alchark@gmail.com>
Cc: Jimmy Hon <honyuenkwun@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>, 
	Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124205_334018_22A7A2B8 
X-CRM114-Status: GOOD (  28.60  )
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

On Wed, Mar 11, 2026 at 9:26=E2=80=AFAM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Wed, Mar 11, 2026 at 5:29=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> =
wrote:
> >
> > On Tue, Mar 10, 2026 at 7:20=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.co=
m> wrote:
> > >
> > > <snip>
> > > > +
> > > > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > > > +               compatible =3D "regulator-fixed";
> > > > +               enable-active-high;
> > > > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > > > +               pinctrl-names =3D "default";
> > > > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > > > +               regulator-always-on;
> > > > +               regulator-boot-on;
> > > regulator-always-on and regulator-boot-on does not seem right.
> > >
> > > Why were these added? The vendor did not have them.
> > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65d=
a2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5=
-pro.dts#L216-L226
> > >
> > > Was this mistakenly taken from the regulator usb 20 which is powering
> > > the onboard usb2.0 hub?
> > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65d=
a2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5=
-pro.dts#L111-L119
> >
> > It may have been a missreading of the schematic, but it was added to
> > get power to the USB3 port. before I added it devices plugged into the
> > USB 3 port would not power on
>
> Hi Dennis,
>
> The schematic says that this regulator supplies the VBUS voltage for
> the USB3 part of your Type-A OTG connector. If you make it always-on,
> you'll likely lose the possibility to use this port in device mode
> (which you would need e.g. for flashing images over a USB cable in
> U-boot which also takes device tree sources from Linux via
> devicetree-rebasing).
>
> You also link it up as the PHY supply of the USB2 controller, which
> doesn't describe the actual hardware.
>
> Please see if you'd rather define a connector node for your Type-A
> port, and list this regulator as its VBUS supply explicitly. I've
> recently submitted a patch [1] to make the "onboard_usb_dev" driver
> take care of enabling VBUS in exactly this type of situations (it's in
> usb-testing now and will hopefully hit -next sometime soon). If you
> need an example for its use, please refer to [2].
>
> Best regards,
> Alexey
>
> [1] https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@fli=
pper.net/
> [2] https://github.com/flipperdevices/flipper-linux-kernel/blob/2f814cdf0=
7f50e901fc1b1328213e76460864c20/arch/arm64/boot/dts/rockchip/rk3576-flipper=
-one-rev-f0b0c1.dts#L303-L328

Sorry for the delay, I am taking a look at it now. Please let me know
when it lands in -next. In the meantime, I believe what I have is in
good shape and is working well here. I am happy to make a change once
support lands upstream.

Dennis

