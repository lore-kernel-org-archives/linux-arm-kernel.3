Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAB5FD0651
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kw91T1sbd5zqvcmRC0YUZSdSvhwThMs3p0iH62bWwM=; b=M+qhrDZaJKivhHhm+C0CCktbSC
	5BGIbh7xHA0bg1Nb6F4tqElGvkwPZu2YDeDVDphfbJu7DVHdDUjKJSxjpAo+1Vm3OOwzoVUmNI7U9
	EQOcrk8pqIOtPwNXI2QhZvbVBYyaXiCkFTBeaLZlgFpAklmMoLuMv8Y2qCPEL6cCwKTwmp4rYUM92
	B1iiI/foiT5r4ohXKlcJIPTJIWwz3mCYsLiAH56Z3GhiMaLOpKt5ocjt+7KM9QMPtKvOJn8v8UO5c
	AvP9sdNzwot3xtXRcLyuT7VNSx6jfsHdYefaJcRDkb/qumXxBzMgj2TfvaYhnU9WW2DBSBAlHJyYh
	OSRVXQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KVr-0000000Bheg-01ef;
	Wed, 11 Mar 2026 14:26:15 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KVo-0000000Bhdk-1013
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:26:13 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509101189f1so36835991cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 07:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773239170; cv=none;
        d=google.com; s=arc-20240605;
        b=GOXU6wORifqh/lb6+/3p8KqeJZDAwQDem/ycwByacjW5539bvTMUP2kkus7zH1xfe/
         KlqN52v91zJmKo6AfzhSWia4QgjCKvpQ1DPEeo4VPUeHk+8afXpl1w8q8kp8QBsvvKlt
         rjb3Qf+ypLNNanCbe4tFWsVEY3mndTPe5+3d4RxsC+9AhmY/I2cMfWSttVPgkWnqFVo9
         Dl3yf1FNfbc+Ighuo3KudLwURKEu2RD7MJ8T82MMkuiHz6Pu3z1JS7OYTx3C3OapCaxU
         s0aOcxrOG0Fp5oPG6qAx17sk709E60JhmyKf+MQZdP485zd5i5GMkDcY0IvJhFA+WJt3
         URQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/kw91T1sbd5zqvcmRC0YUZSdSvhwThMs3p0iH62bWwM=;
        fh=1xzbRqscoTILfdYf453rNIeskZQhvPJnJgrx8ALoGY4=;
        b=fhg4P4iTEXwH5Dih/t2IUe4F4OeVHsw8xF9EpPJmB2aXsNhQ8reri5x0DLzRpMSaLd
         YiXyhim1lWbDDJl4rp7x7/NEL6mRm3hIRewF/m5THAyypzMOsFg+9ANgTsmpWSdAPrEq
         XyUjfNwDGuWsshUcqWtHlJWuxftzgbPBXa0unBemkiQw3RhpNxi3gwXivZKwCDQ2aTTu
         +Kh28bryNAIUUxkPXr/wBbjPdL4DIdgSmW+GmeaCypbpgf0IAT3k9k2BLA/LIlisFp4R
         w1eb8jE4NBR0tjvaELl/Ol6wgC4HBuDOWMuy9UAc+CLNCpnkRCttMv1suh0OefhMlP44
         jG0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239170; x=1773843970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kw91T1sbd5zqvcmRC0YUZSdSvhwThMs3p0iH62bWwM=;
        b=bLkgxLRXTY+WlCvq6zNPfHe5othM/kfyrY9y8i38dnhowf/rVuOO7uR568s56ibY4O
         zlKJrVXDWcOjfz+vwa3SFkbDToNhyeALB4YotpesD6b46HCSy151Nu1xv49MM1q0pWOm
         u8siiaf4YNhdDrx9KbhU0KG9EMhTLUuME5sra+ciJWcJE84hcUezi2t2cDk+JEEg/7Db
         xY+IXpdtvn66aiKJDmbxk3erJxwy9pDOyKmctcw6oSQOpWCI8hiSRVv5o1NDKQCbdl+D
         CtQ6uPX1yrrbVJpKlolTdPThRG0XWj95v6EECa3t8cUWfk0p+Ysey7BBvCHj6uKniL7w
         EWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239170; x=1773843970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kw91T1sbd5zqvcmRC0YUZSdSvhwThMs3p0iH62bWwM=;
        b=BUwg+hdCdTv5cIn+ZiBr4yYuTZISn2yFy8B72YOcmhal1PKFNO1kkjJPWQnWB7CTDi
         yy7WKDwyKzkor/Iro76s0Pb2mxR+4WIlAhHFmIf7Z8sgnJX/KxOkewiulbRdiXwM4lUU
         7XQm5cUsd/blVHZJuh9I9z+g8Byxt3dUWBhl/46y6vHAE1mGkU7i9Y04qDQMWkgXFhTI
         Zu8ljJ4ip6qRwCPYXGX00kvxap80oRY2ghMf5/GXfv363fyISkHXaCZbzCQnsDqIqcGL
         6nnWoiyymXh8N92kyURoZUzUPiaS9XF1bNMadRinBhLfdTKaRAqWMPia32gmLS5QJ/76
         E27g==
X-Forwarded-Encrypted: i=1; AJvYcCWiG4sCyLZYNhQXCG+o34momXH3CdwmzCkeFVlPMWqDyB2/PcvSz64E4eNExnspBCFgd9yOFQP3hL2uKukEK7rp@lists.infradead.org
X-Gm-Message-State: AOJu0YyJCubMOrb2WSKTYnPYXFqPLKp46p+CzaiFfwx5YDEUvhcS3e2I
	2qakqtz2+Ae8vftv22C+iQX2L/dyGcupZpYTtQQeOXxsDfuyf0IWRw0CAQzjz4mLO6jaza1k3BK
	t/66/c+jlcPZrVHeCczHjwvKhbXoO4rs=
X-Gm-Gg: ATEYQzzmQSxemJZl8PZ2XoQBSfZjV8vhmKU6/NMYyOAp/YWmiBIM6A5jAP17wpB2KI/
	8U1nwrqWXx0AZXOWDZREsp47ckfdnT4bw6xc0z2M95OoKOMM162QFMQyn2NFtGRFx5AuNElxFpV
	IWwMtM4qEKbPbAmUsk4rOeohlFwtkGj5QjtGj7z1iXCblbJ3Xf6C9nyDrpsOf1ZTZ+gS7YPUWbE
	x2HGlWA48o45dZt7LdzkDr40SXr/vLxg50dYPm4yb96mpYVK4FEZWZxjmD9ckx+znkWKco06u2E
	YfAL9eQ=
X-Received: by 2002:a05:622a:1181:b0:509:1cf9:ea15 with SMTP id
 d75a77b69052e-5093a1ce568mr34244731cf.56.1773239170496; Wed, 11 Mar 2026
 07:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260310031002.3921234-1-dennis@ausil.us> <20260310031002.3921234-4-dennis@ausil.us>
 <CALWfF7KD1=U-gC4wC9M49kEYD3ijcfr+XSmMeh_-zAvjO2JVoQ@mail.gmail.com> <CAABkxwtz7KjVJpSzYhUWGyEym5k4d3NJq65OS_E3NCnrNUBTZw@mail.gmail.com>
In-Reply-To: <CAABkxwtz7KjVJpSzYhUWGyEym5k4d3NJq65OS_E3NCnrNUBTZw@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Mar 2026 18:25:58 +0400
X-Gm-Features: AaiRm521OUVT7JY43-r19xBDa8sAqMr83aUZi0b84YOkyBHEnTztidYE-1zQZhA
Message-ID: <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Dennis Gilmore <dennis@ausil.us>
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
X-CRM114-CacheID: sfid-20260311_072612_299435_AAE84B64 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, Mar 11, 2026 at 5:29=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> On Tue, Mar 10, 2026 at 7:20=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com>=
 wrote:
> >
> > <snip>
> > > +
> > > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > > +               compatible =3D "regulator-fixed";
> > > +               enable-active-high;
> > > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > > +               regulator-always-on;
> > > +               regulator-boot-on;
> > regulator-always-on and regulator-boot-on does not seem right.
> >
> > Why were these added? The vendor did not have them.
> > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2=
b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-p=
ro.dts#L216-L226
> >
> > Was this mistakenly taken from the regulator usb 20 which is powering
> > the onboard usb2.0 hub?
> > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2=
b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-p=
ro.dts#L111-L119
>
> It may have been a missreading of the schematic, but it was added to
> get power to the USB3 port. before I added it devices plugged into the
> USB 3 port would not power on

Hi Dennis,

The schematic says that this regulator supplies the VBUS voltage for
the USB3 part of your Type-A OTG connector. If you make it always-on,
you'll likely lose the possibility to use this port in device mode
(which you would need e.g. for flashing images over a USB cable in
U-boot which also takes device tree sources from Linux via
devicetree-rebasing).

You also link it up as the PHY supply of the USB2 controller, which
doesn't describe the actual hardware.

Please see if you'd rather define a connector node for your Type-A
port, and list this regulator as its VBUS supply explicitly. I've
recently submitted a patch [1] to make the "onboard_usb_dev" driver
take care of enabling VBUS in exactly this type of situations (it's in
usb-testing now and will hopefully hit -next sometime soon). If you
need an example for its use, please refer to [2].

Best regards,
Alexey

[1] https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipp=
er.net/
[2] https://github.com/flipperdevices/flipper-linux-kernel/blob/2f814cdf07f=
50e901fc1b1328213e76460864c20/arch/arm64/boot/dts/rockchip/rk3576-flipper-o=
ne-rev-f0b0c1.dts#L303-L328

