Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C7AC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=; b=MxgFax6WRXO6O84wfxUqRQdqBS
	bQulhDHbCtiJ4q56xxs3guuJ3U8xumvgYCvAk0BkS60QzYtjsj/MXAJqrFeQvIcrHDd4TDw/Atabu
	3o2l2VHsu+pnAtIp2mrNs96oBZs6Wl359xPzqPH+6QdHFgxJSjg3qb9tcUtsASzG0wG0T5WUiMU4R
	l152UAvucbV+qBFO0tf9UiKtpmWExLu/kh46Pf+Vx3ZzyQkBB5esNCuRNVQO7WeCyn6asd55tU4eR
	vDOzdPw3272CzBpgO2SSYtDX9k9KTsmAWmN39qBoUyQjkrMHpKgCUdnDxpofiUc639C23CLFLruPq
	v/QA8tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBKI-0000000CRof-0QAX;
	Wed, 28 May 2025 07:35:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBI9-0000000CRTQ-03Ps;
	Wed, 28 May 2025 07:33:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad51ef2424bso870952466b.0;
        Wed, 28 May 2025 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748417615; x=1749022415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=;
        b=EOJqZt2lp0gCtFM7n4t72Gvm3SmjOlMoIJ+sCQ+GyuApqGwvFXTESjt/cTkm0Y/qeH
         ASUJqPS2oz8UAIA06pHkA+1eybeTyldoyA+YcdChUX5Njns0ZSW2fALq5Qtk4yJTTwg+
         GcbnVFqN+82M/f+ym99+iuoW99m1+dAkxLRuSOwBoxI6MSHSmYntrw7F3XY2hMrty1G+
         XTvbU4sp1uBGH5xrq20FkyyEYIrLlafG1IruzAlatQ9hPO3knacVf+JQfQQDeLe+bP6R
         8WidR9KVude3oVXrXQABwD8f1HhkXWsp91R1BQCxOMNkM7RN2yMnTkcBG2V+UUEjOHXl
         X2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417615; x=1749022415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6onlswMv8qjmQeq9ualmjWop3GYnwDgj7aBf1pQHqQo=;
        b=YplYb0yxsq0AAsOl1Btmfh8eIl7NgEZ5/HYFxnPvvIKXxSP+FpdQqubDMFptbk+MQD
         BZbVYQAEg1fJ56FHVVHcUvW2/uXKx5Hr70ojIeYKzDrCq4auisdv26Y7+IxnNuahnom6
         jd0tfcOFGZrJDhZTLwrNTZWg5HTWBgHM34hdFw5GZQj9gFTtHucPoiKQhDfhuzbDN+or
         6GjrXv5OEa1cXgU8bmQLlAsDy1CpO6l52w/KRJWi910ttbVzJZjXzjE0IZnNYbajmix8
         UJUwlQl2amZ6OzqW6H2IPSIgkPadYbRwJonu8hU4ChFOp3wVigkHpJC/3RyR1fE2Zcgo
         P3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVjjz297wScxa1dopBy+dPPAEdvbXyQlQOSxQCXj0QsdX6YEp5RjYty/6LcylXbgy3bIW9n/sQfFR0Qq2ZQx2LgfQ==@lists.infradead.org, AJvYcCWAGnlhhfzPfDhpkZjSL1DVW0E1+z6sbsPXnJkfgwQmVMJ4Jyp/qKfPfF+u2QO6lyMLiseWNpAgEEbJGIM0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2bL/s5/xezL6w5xyc8kShD82TgDu1ObYtSK3ev/RUKeDsuTP3
	9M4ZGCboi7jZBjd7hfTQndIXPji88mJ6ixTcbHQZfM8YEnw7aGTW21AS/ltRdZpXWPj1Ar6y6PI
	Vi5dbB8WG/9ixO0IB/P/L6fPhzQ3FRBc=
X-Gm-Gg: ASbGnct/ODIVNvJMxpnazJtDFe8xatpHz3T11u+yiJh1t6MBDrZzBUipH+JKkZStZ8Z
	6KohdoONtAOeHrnG4Yqf2jEycDU+cnODtnsEuKPyIAXpjO5pzU0roMRgF8W5Sustj+DRVjafBtV
	1JGCxBrWX94xIbHPCYZ6fXiXawGM4k5mE=
X-Google-Smtp-Source: AGHT+IF1fHMff8y//YavCY6qV37Mp44tGyDZLCVJ94/lgd4evp/huakNGNFGIncJfZaxREzO0BTmn3RMxhTEPInRqyk=
X-Received: by 2002:a17:907:7252:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ad85b120626mr1097477166b.9.1748417614813; Wed, 28 May 2025
 00:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250522172535.302064-1-linux.amoon@gmail.com> <174802762618.2701053.17389702773465611504.robh@kernel.org>
In-Reply-To: <174802762618.2701053.17389702773465611504.robh@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 May 2025 13:03:17 +0530
X-Gm-Features: AX0GCFuQMy8n1ZwrrUkMQP3W0riMpGcHItsAis2ldicF1OXrte5AN2N1gNz0rP4
Message-ID: <CANAwSgQFbhG-VPwSsEZcMZq3VE8n14trr4uXp8MoMW3ML+vHDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and
 reset properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Wayne Schroeder <raz@chewies.net>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_003337_057761_C0E0555B 
X-CRM114-Status: GOOD (  27.15  )
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

Hi Rob,

On Sat, 24 May 2025 at 00:46, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 22 May 2025 22:55:31 +0530, Anand Moon wrote:
> > Add missing reset-gpios property to the USB 2.0 hub node to
> > ensure proper reset handling. Also update the vdd-supply for
> > both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> > for consistent power management.
> >
> > Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset o=
n odroid n2")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v3: dropped remove of usb2_phy1.
> > v2: remove usb2_phy1 phy-supply since now it's managed by
> > the hub reset control.
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 5cdb2c77c4c3d36bdee83d9231649941157f82=
04
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/amlogic=
/' for 20250522172535.302064-1-linux.amoon@gmail.com:
>
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: usb@ffe09000 (=
amlogic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexe=
s: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
>         from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-=
g12a-usb-ctrl.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: usb@ffe09000 (amlog=
ic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexes: '^=
pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
>         from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-=
g12a-usb-ctrl.yaml#
>
Ok I am able to reproduce this, it seem the issue is with second patch

Currently, I am in the process of debugging the onboard_usb_dev.c driver.
It appears that the driver is not correctly parsing the perr-hub node and
is exiting prematurely. I=E2=80=99ve been able to partially identify the ro=
ot cause,
but I haven=E2=80=99t yet found a proper solution.

alarm@odroid-n2plus:~$ lsmod | grep onboard
onboard_usb_dev        20480  0
alarm@odroid-n2plus:~$

Thanks
-Anand

