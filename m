Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046E9D339AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLLFa6WS4xfeiEtOHxziXZIgc98NLKWXcmokIkVFE5s=; b=wfQ+43rxG5dB/HDww4HWPPvExi
	XsrWl68+HLIrEA0tIU/8RDDXCZ3rE1aeH9Qdv9zH++YM7KPlINP4ToaL16bjB1oqgz/xzxAfoadz/
	90lem0oClTKk+5wA28cyz49d9yAnOAQiCTUUYHjk+vNvMV68qGtjqZ+z63nmszA5J9W5XP7JeSI8t
	TDsz2J203pDqShxpiWn4ecDHZx3fP4vUcRTx6RBkkC3e81zPDxL6QpTH6NP6ZNGKVOvSJuYSKDkP2
	IeZQ+hmSMKj9/Qxx01/c8AX4zy3TbOo8hUTpWVu25uJEZpTof+q9TFy7Z+W3UFHXHXm5903+VbGlC
	BwS6vV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGE-0000000BmF5-1Kac;
	Mon, 28 Oct 2024 18:14:38 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tzz-0000000BjCf-15mZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:57:52 +0000
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2918664a3fso3960175276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138269; x=1730743069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLLFa6WS4xfeiEtOHxziXZIgc98NLKWXcmokIkVFE5s=;
        b=pT4Q4fFQmn7zqzpz/7kpPZDkK0GNDAJsmToc0CZI1gbhLCP1kp9ayzXQYEDQFA5Mkv
         WwKg9WpHOEI6mgHhDkQyypbRzmcpoAOXojHLEDVqpvi3FhP70fK+HzWhwFMGslACpsVP
         q/fcfQByqFA6c7bkJtlZyHOTM2IWGG54ehBPiNQ+gIjrotyGeQv/m0nyXkgMCbBkrIu7
         f+paRjZSUYdBt5t8uYZvfWugt44NWxoojAtCx9Dt1SeN6FazLheb3xXITZqN8kproEz+
         bqx1mT8R3tPUHO0XKN3ZJ7e1xZyIOorJnt1kFQCwXn79fcCNg7ShgouglFiq7sElOxl+
         4Etw==
X-Forwarded-Encrypted: i=1; AJvYcCWytm5KEkkxLFXtA/PvWpb84k7RtUpUQIhTYpcgfTccPOJklqq9BSaO+Uuf3AUDE+98JNG1S1IyU/ygG0+dpIjb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9re+cx6KQgLlbBwIR4JoF7hLJx+VuD4oOBn+81wXBACRdvgft
	+W0LNQ2Wc/we7r01OaO8DCtUNfyvGgNvTNzsE/VX65xEXSbQWaQXjzMVPWhc
X-Google-Smtp-Source: AGHT+IFjxvc7DTDxO3eS+Ns3+VXvRgh8FL3bxcChuNmtOud1Ip3U0G8xY6rpZ1n0V4+D910v4XEk/A==
X-Received: by 2002:a05:6902:2e13:b0:e29:27db:a1ac with SMTP id 3f1490d57ef6-e30bc6d909emr704404276.17.1730138268845;
        Mon, 28 Oct 2024 10:57:48 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e307a03bf78sm1510495276.57.2024.10.28.10.57.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 10:57:48 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e35bf59cf6so53666907b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:57:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVR//NAYRrAyPQhN4YKFBVIc/zQ+YAOa1agi6SX2mWgO1QKEOMgjT/vWlAp0H4JgbaOX/gR6jVSyNST/Zy5oOF2@lists.infradead.org
X-Received: by 2002:a05:690c:9a06:b0:6e3:1d8c:1224 with SMTP id
 00721157ae682-6ea22e5e851mr6027417b3.20.1730138268189; Mon, 28 Oct 2024
 10:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240219-add-am64-som-v7-0-0e6e95b0a05d@solid-run.com>
 <20240219-add-am64-som-v7-4-0e6e95b0a05d@solid-run.com> <CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com>
 <a65e17e9-0055-4e5a-902f-8ee2807a86df@ti.com> <299b6b75-beef-46aa-9203-b96009226677@solid-run.com>
In-Reply-To: <299b6b75-beef-46aa-9203-b96009226677@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Oct 2024 18:57:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW6p-xp96rXqt_dhSNkJSmyQCrh+EOmHv9vgiAWyioMOQ@mail.gmail.com>
Message-ID: <CAMuHMdW6p-xp96rXqt_dhSNkJSmyQCrh+EOmHv9vgiAWyioMOQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241028_105751_321893_0A5EFAEA 
X-CRM114-Status: GOOD (  27.62  )
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

On Mon, Oct 28, 2024 at 6:19=E2=80=AFPM Josua Mayer <josua@solid-run.com> w=
rote:
> Am 28.10.24 um 16:31 schrieb Vignesh Raghavendra:
> > On 25/10/24 19:27, Geert Uytterhoeven wrote:
> >> On Mon, Feb 19, 2024 at 4:05=E2=80=AFPM Josua Mayer <josua@solid-run.c=
om> wrote:
> >>> HummingBoard-T features two M.2 connectors labeled "M1" and "M2".
> >>> The single SerDes lane of the SoC can be routed to either M1 pci-e
> >>> signals, or M2 usb-3 signals by a gpio-controlled mux.
> >>>
> >>> Add overlays for each configuration.
> >>>
> >>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >> Thanks for your patch, which is now commit bbef42084cc170cb ("arm64:
> >> dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3") in v6.=
9.
> >>
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso
> >>> @@ -0,0 +1,44 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * Copyright (C) 2023 Josua Mayer <josua@solid-run.com>
> >>> + *
> >>> + * Overlay for SolidRun AM642 HummingBoard-T to enable USB-3.1.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include <dt-bindings/phy/phy.h>
> >>> +
> >>> +#include "k3-serdes.h"
> >>> +
> >>> +&serdes0 {
> >>> +       #address-cells =3D <1>;
> >>> +       #size-cells =3D <0>;
> >>> +
> >>> +       serdes0_link: phy@0 {
> >>> +               reg =3D <0>;
> >>> +               cdns,num-lanes =3D <1>;
> >>> +               cdns,phy-type =3D <PHY_TYPE_USB3>;
> >>> +               #phy-cells =3D <0>;
> >>> +               resets =3D <&serdes_wiz0 1>;
> >>> +       };
> >>> +};
> >>> +
> >>> +&serdes_ln_ctrl {
> >>> +       idle-states =3D <AM64_SERDES0_LANE0_USB>;
> >>> +};
> >>> +
> >>> +&serdes_mux {
> >>> +       idle-state =3D <0>;
> >>> +};
> >>> +
> >>> +&usbss0 {
> >>> +       /delete-property/ ti,usb2-only;
> >> /delete-property/ (and /delete-node/) to delete something in the base =
DTS
> >> does not work.
>
> My understanding is that flags are equivalent to boolean, i.e:
>
> ti,usb2-only =3D <true>;
> ti,usb2-only;
>
> are equivalent.
>
> If so, can we assign <false> within the overlay?

Unfortunately not. My first thought was "it depends on the actual code
in the driver", but that turns out to be wrong:

    static inline bool of_property_read_bool(const struct device_node *np,
                                             const char *propname)
    {
            const struct property *prop =3D of_find_property(np, propname, =
NULL);

            return prop ? true : false;
    }

    static inline bool of_property_present(const struct device_node
*np, const char *propname)
    {
            return of_property_read_bool(np, propname);
    }

So both methods just check if the property is present, and do not use
its value, when present (i.e. the former does not "read" the bool).

drivers/usb/cdns3/cdns3-ti.c uses device_property_read_bool:

    static inline bool device_property_read_bool(const struct device *dev,
                                                 const char *propname)
    {
            return device_property_present(dev, propname);
    }

so (at least for DT) that should map to the above.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

