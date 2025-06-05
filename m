Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25847C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkpL8b/AS9RsSObYgLJmIHBt5nNILWA82P2+A8mQBU8=; b=2fuZj4bOMYC8UuTaU4+dXE6Agu
	fypGynGObC/gPAZgla+XccskAwl4DwOnBqtJIuh4n/57b6MDmx7kUtUtSousjSfqq5V5xiwHAS5Vy
	WwhKIUOhpGJKRRZkSsRHNcqXg5PlMVZYrUMN4nxNT0rFuWjGeCKSWsY6QLGU9nubEsJVFkEFaX9eG
	vWYkbdIKTWP3G1SpB0ZNwi9Iwq51z+ivTekjARomN8crGiBvumKWIH92rGNbjqv8CE22/6ktZFBLJ
	b3En1RU+Isa6lWpELARA91Fv+Do+rwmhjsmPwtmxfLcgjj7q2EFh/IdkGQNLttWTTrXcPL3n6N7T8
	Sn77QBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBS4-0000000Fkor-3qb2;
	Thu, 05 Jun 2025 14:20:16 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBMo-0000000FkLm-0OO4;
	Thu, 05 Jun 2025 14:14:51 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a56cc0def0so15575561cf.3;
        Thu, 05 Jun 2025 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749132889; x=1749737689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkpL8b/AS9RsSObYgLJmIHBt5nNILWA82P2+A8mQBU8=;
        b=TShuCVEaTMTt1XXFA8D6JAGBONsiOD/fI4LXg+a8VCoi8mNMCcsk077xUVlrzvmXPx
         Ej74uTCav5bC48hnjj/1R7SNlG/Z5e6hHWGEbWXXjfevR2Wekz165yO5t/3JnkTec5/M
         wp4X26oJJR710FDrk9l8NwbldX4BIBbn/RWkPFF7So/u9OT2CNC9jI5RaAV6CL3sPaVy
         fj96nUt/QxOi89S0qDP9evRY0K2JSlOQZOY1poDelk0qBHCLqZ3CF+0DzSj8Ph7F9dri
         zLICwg2NR7rbD+TPZX1k75zHSliqh52Nm2WFp9GKTyXp3ClXufTwSt6m9z58WqQox/8x
         QkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749132889; x=1749737689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkpL8b/AS9RsSObYgLJmIHBt5nNILWA82P2+A8mQBU8=;
        b=CcNSnoiJPv7jI+PsHcQlKh2qncOKXMw8xaJjKgGtLBneUeANX2EPpFjhlRpQyatqUa
         1OKzP5oeym4obQ+rD1MIEzJY2ySwP+oE4XkT8NCXTunDv5/O2DxIp3vQgEFHu/DcxX8Q
         HCYZsdLv0qhdz+DUoXRn4P6jxF6weQiG5t2UsXpf6ivI5WoElF70/pYJMJm7yjfVtR+0
         pzPq47dg+obAi8XDOZ7Ps7+RMqoDfJgN2iPsSnLx2Eo48uXzJE6alYrfeJzI38hRZIv5
         04Ovrx8YeLr58KA5axWRvPFpNsVLZoBgQrNIM/zFdDbI27T5+KFKpMFKXsoiIDPONtjz
         AJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUbV4v9+up7dLnvlzTe5CqGoqHQFNaSibSRGyT/MweCvc+57orzLCutrzJYxaywAWP7UpIyGuhzsDQHOQuMIn0=@lists.infradead.org, AJvYcCX6yzUFnOXB8kwt0kf5G41ntdWb18aEpDWd4z/uUOQwRYqBwAOs4llp1Bd+3Wz2UycKggKnh+/K7umr8ZwynyKy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp1vEHPwP6oGMeDZgHq+kJUUzdP0DGnd5+g4v/kTx8VdCHAj6Y
	6opqrRzldckwxBkKAz+0A8FXUS7yZP2jvZq5lXJml42ABPQyRrisSF/etKoGS/bWmsA7c2ecvto
	EWoVQVoJL1JsDfuNgGEKya/yKMSjkCEU=
X-Gm-Gg: ASbGnctQPw9GC13foYK+Cvd3oGuS/MfPCBbXO/xjjJ630Ij2Jmt4iyF3RkUZjIFFDHh
	2RYadIbyRtiCxHRjXsuw14OxWNE+Mz8RRlTx9RtPWnFZ0pGKVWV3vRkYC8d8HxOVF+mGIg7JpPI
	6+IJ5GPOX6FadKOj97HPMJsGxjrh7f+9cYAFM38wMyOqp/
X-Google-Smtp-Source: AGHT+IGa9rjNtqi2gcZ+Jy9RBTcGFMFtkIHolkdkm7GT5pfvGPDtmpQYLeHP/w7YNZqumqgJlkxOAca7Kn7xJSgw5Xg=
X-Received: by 2002:a05:622a:2597:b0:477:ea0:1b27 with SMTP id
 d75a77b69052e-4a5a585940emr88797861cf.26.1749132888682; Thu, 05 Jun 2025
 07:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
 <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com>
In-Reply-To: <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 18:14:41 +0400
X-Gm-Features: AX0GCFsmALQLaM1XKsOi1NqcR0aDewH5t0oKv8VcCgYbI3soKcm6cUbwmVeg7L0
Message-ID: <CABjd4YxfG3WZxRL3ihQLtdVdp_3Hq=TKKrZJktJ_C5i+xCM2Ag@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_071450_137095_E74DD05D 
X-CRM114-Status: GOOD (  19.55  )
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

On Thu, Jun 5, 2025 at 10:32=E2=80=AFAM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Thu, Jun 5, 2025 at 6:43=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com> =
wrote:
> >
> > >
> > > +&sdio {
> > > +       bus-width =3D <4>;
> > > +       cap-sdio-irq;
> > > +       disable-wp;
> > > +       keep-power-in-suspend;
> > > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > > +       no-sd;
> > > +       no-mmc;
> > > +       non-removable;
> > > +       sd-uhs-sdr50;
> > > +       sd-uhs-sdr104;
> > > +       vmmc-supply =3D <&vcc_3v3_s3>;
> > > +       vqmmc-supply =3D <&vcc_1v8_s3>;
> > > +       wakeup-source;
> > > +       status =3D "okay";
> > > +};
> >
> > When you enable the sdio node on your v1.2 board with the broadcom
> > chip (using SYN43752), does the btsdio.ko bind to the device and
> > create an extra rfkill bluetooth node?
>
> Good question, I didn't have it enabled in my build:
>
> # CONFIG_BT_HCIBTSDIO is not set
>
> Let me add it and report back.

So I've rebuilt it with btsdio.ko module enabled. As I boot the
system, WiFi (via SDIO) and Bluetooth (via UART) drivers get probed
and load their respective firmwares. btsdio.ko doesn't get
auto-loaded. If I load it manually after booting, it doesn't bind to
anything and doesn't create any extra rfkill nodes.

Is there anything else I need to check or look out for?

Best regards,
Alexey

> > If so, you'll want to blacklist the SYN43752 chip in the btsdio.ko.
> > Similar to https://github.com/jimmyhon/linux/commit/81c14dc2dea2ceaea8d=
390188b352d32e278abc8
> > The original logic was introduced in
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/bluetooth/btsdio.c?id=3Db4cdaba274247c9c841c6a682c08fa91fb3aa549
>
> I will check, thank you for the pointers!
>
> Best regards,
> Alexey

