Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF08D1BDC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z81NMGbuxUOa9XkPxAV+A5iia8KegJSMZSCO1E8CyfU=; b=G0toWtcL9/LAsEqIZpP1kgK+rl
	39EgwzB/AwRvxpyGqEzwG7JN63W6DSrP9IhqQsPvQWoC0YWk9JtokCdopu0kTjcTN1qez7v/tVNNN
	iUpFtRJ+QDowL6+OYJe/10Azeetzv2BRw5wEp+YNOvfMRzJOu8hChpOBeoBIGMJ+0MD4ZWFP8ZPkd
	z6zv1HHRMaKccO43dXXHI39DtYrbCbqwR+6uy1BXBPdPgGG4+x9iHd3eNucH1Vo+21et/1iGdD9Xf
	4yFG7RjGB5aegyUDir9fitldgYOdNxOAD08y3Nrt9euzF066S4z3i9M+/hSRBgVIHbpPN3BN/Bcla
	WUw5CJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zUJ-0000000EIp1-2eY5;
	Mon, 04 Nov 2024 15:59:31 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zRP-0000000EHY6-44eJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:56:37 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e34339d41bso37103467b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735788; x=1731340588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z81NMGbuxUOa9XkPxAV+A5iia8KegJSMZSCO1E8CyfU=;
        b=UDxIyzOwsqALtWdPx5QuVmVVa6vAOGRvusjAv1O1a+bwwDCz5tDaZcZELlvcIm+Lcd
         E8LmgfMhQ0dDbQjMzdtG/kPBL+vHLjnpdrLBY6XKisMWZfSiIXEFlCvhWDyG69UV8ZAq
         KIoVJ9uVxotX9EoUcfhbZ5CdZL1VcqAnSWlCvhj2Eq7MTFdF2I+r4+JKQ2W8Guhr9eZy
         4Mbjh+8PDxuQJCH7ySMn3yMlcOvs4RQD9FdG6USQaTyt9+sxFxkftR2A0gBlkQIyye9z
         Y6EncxpExw3ku502kqAWUIy/EfTGHXuqZzEafizio7xz5Uvrhai0XZ5Vzec5zCPbHV45
         P0tA==
X-Forwarded-Encrypted: i=1; AJvYcCWoj4rEsNkddHvQuMVSQkXQkRacSuhekxqKEhWBIdCYSkHyjAcse3DV5my13uGm7A/TeXgbIBXE+KyvUmtwXiNk@lists.infradead.org
X-Gm-Message-State: AOJu0YwVimOUOyFrlk0sa8cuydmPZWLS4eL3wYGMzG+WxqlbcKiQQleV
	DE9345zA6HK9gjv27StuSMiRcCmjTmClCCLYkHD0EilPIt7SzhSKAQesz4Pd
X-Google-Smtp-Source: AGHT+IHdLqRpVh+lwI0gNJXxVr3/1VRyimDSR7BEH5V3Zy58auRDtz6uc44IQgQVCauovyIR1Kp1vA==
X-Received: by 2002:a05:690c:2d08:b0:6e3:10e7:b418 with SMTP id 00721157ae682-6e9d8b554acmr216110107b3.46.1730735788215;
        Mon, 04 Nov 2024 07:56:28 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea94102de3sm5737907b3.52.2024.11.04.07.56.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:56:27 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea0b25695dso34696557b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXtNTwbGJ3dMjRTSnZN0erP8V8pbsDVa275cmkDuosSIjwghfW7tBmIZOXi4aMzS7OpQPqNZ4LhR1eeVcsbLop@lists.infradead.org
X-Received: by 2002:a05:690c:2d85:b0:6e3:12a3:bd36 with SMTP id
 00721157ae682-6e9d8b171cbmr233704207b3.43.1730735786661; Mon, 04 Nov 2024
 07:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20240219-add-am64-som-v7-0-0e6e95b0a05d@solid-run.com>
 <20240219-add-am64-som-v7-4-0e6e95b0a05d@solid-run.com> <CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com>
 <a65e17e9-0055-4e5a-902f-8ee2807a86df@ti.com> <299b6b75-beef-46aa-9203-b96009226677@solid-run.com>
 <cd02e760-54c6-4a92-af4e-e786d80cfbbd@ti.com> <533c54e5-d024-4fd0-b92d-0f320f25999f@solid-run.com>
In-Reply-To: <533c54e5-d024-4fd0-b92d-0f320f25999f@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Nov 2024 16:56:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWY0J7uooeRbUGwjkeCLd2UVyN9dtDWUkg5pJ3sAULdsQ@mail.gmail.com>
Message-ID: <CAMuHMdWY0J7uooeRbUGwjkeCLd2UVyN9dtDWUkg5pJ3sAULdsQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: ti: hummingboard-t: add overlays for
 m.2 pci-e and usb-3
To: Josua Mayer <josua@solid-run.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_075632_536898_67AB4D55 
X-CRM114-Status: GOOD (  32.11  )
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

Hi Josua,

On Wed, Oct 30, 2024 at 1:18=E2=80=AFPM Josua Mayer <josua@solid-run.com> w=
rote:
> Am 28.10.24 um 19:44 schrieb Vignesh Raghavendra:
> > On 28/10/24 22:49, Josua Mayer wrote:
> >> Am 28.10.24 um 16:31 schrieb Vignesh Raghavendra:
> >>> On 25/10/24 19:27, Geert Uytterhoeven wrote:
> >>>> On Mon, Feb 19, 2024 at 4:05=E2=80=AFPM Josua Mayer <josua@solid-run=
.com> wrote:
> >>>>> HummingBoard-T features two M.2 connectors labeled "M1" and "M2".
> >>>>> The single SerDes lane of the SoC can be routed to either M1 pci-e
> >>>>> signals, or M2 usb-3 signals by a gpio-controlled mux.
> >>>>>
> >>>>> Add overlays for each configuration.
> >>>>>
> >>>>> Signed-off-by: Josua Mayer <josua@solid-run.com>

> >>>>> --- /dev/null
> >>>>> +++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso

> >>>>> +&usbss0 {
> >>>>> +       /delete-property/ ti,usb2-only;
> >>>> /delete-property/ (and /delete-node/) to delete something in the bas=
e DTS
> >>>> does not work.
> >> My understanding is that flags are equivalent to boolean, i.e:
> >>
> >> ti,usb2-only =3D <true>;
> >> ti,usb2-only;
> >>
> >> are equivalent.
> >>
> >> If so, can we assign <false> within the overlay?

> Is there any chance of reassigning <false> and making an argument
> that this should be fixed?

In theory, it can be done, if (1) all code that checks boolean
properties would use of_property_read_bool() instead of
of_property_present(), and (2) of_property_read_bool() would be changed
to actually read the boolean value instead of just checking for the
presence of the property.  And of course we have to do that in all
software that uses DT (i.e. not just Linux).
See [1][2][3] below for caveats.

Using a similar solution for /delete-node/ is more complex, but still
feasible, by setting its "status" property to "disabled" . I think
that can be made to work if all DT core code that looks up nodes would
just ignore any node that has a disabled status. I.e. callers would
no longer see disabled nodes at all.

> I find it frustrating that overlays can't override boolean properties,
> and for consistency reasons I would otherwise change both
> pcie and usb3 overlays to standalone dts.

OK.

[1] The example in Documentation/devicetree/bindings/sound/rt5651.txt has:

        realtek,dmic-en =3D "true";
        realtek,in2-diff =3D "false";

    Obviously the second line doesn't really work with the current
    code, but fortunately there are no actual users of that (in
    upstream DTS).
    Note: "realtek,in2-diff" is a typo for "realtek,in2-differential".

[2] The example in Documentation/devicetree/bindings/sound/pcm3060.txt has:

        ti,out-single-ended =3D "true";

    Again, this is an open invitation for replacing "true" by "false".
    Fortunately there are no such users (in upstream DTS).

[3] arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi has:

        gpmc,device-nand =3D "true";

    But "gpmc,device-nand" does not exist. Oh, it is under removal:
    https://lore.kernel.org/all/20241009-gpmc-omap-dtbx-v2-2-fc68124a090a@k=
ernel.org/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

