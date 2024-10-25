Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F553D0C612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djva4KOP4v9Rg26S81bBmAQ/5dEE1/x6R+NZGGRbJmc=; b=uxmsMsUtujhToc4b9xbuyr6FaU
	sjNR+EKnD1HLL74nUzqaTrhwIkyA8uYs0zCT8TUB4wD7mIUhAVTHpL9fBz4mpzQet9Jndq/Qy4sPM
	ivsZoDIGzXdeCiqA1oUkaPp60EbubcXmXjur3pe2AXEmi8hQZRv2n5rRr8LpZhgfcsgrkDZ2GIOPg
	HdaS4xQMpgvPm4DrVyf4UwyNHUg0jMlU0lLtBhXlymgrYi4FkbP8b6BomxB/voazYOKSCjIQRyCX0
	SVfahjxJJFGQPfPTJXnugQiC3D8tyM3w5sBccBWk5QPnCyz8FUhq7yeSt0NdDCr68k97V7QDtvpxa
	3cXkz/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KvF-00000003vPB-1hnC;
	Fri, 25 Oct 2024 14:04:13 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kkc-00000003t41-3pJ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:53:16 +0000
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso2143904276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864392; x=1730469192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djva4KOP4v9Rg26S81bBmAQ/5dEE1/x6R+NZGGRbJmc=;
        b=qSJgz0zIcixl5HU1+k6hvh8K1w+exo7Z67HuQgeQnbykU5fRLAG1aEP5+Gekfcq8yh
         XmJ4QM/WiXspOmt3eiFN9AdZzSXdb/JLH1jB+kzo7E9JlNyVZCmk+ESNtxsm597FG78q
         5t8bi96M4wugYOExlQ9mdOUHLOMyoIWKldO2nQ514/8qc7BwLrlWcdqTpkmHipxkPfpF
         0Z6gt58YQECR5AsZzxBCp7Aqf6EDplISPHMAh1cyWgo7Xk3LDgJ+Kj+jqV+xpHEPZ0HD
         RdOjTlCnichKKNPyjAzz6XlMHQ35faaQ0E3O5iXeKrKpfEdkq7TZ/gAch0u8uIECbQbo
         ZCMA==
X-Forwarded-Encrypted: i=1; AJvYcCXyKCkY3yTcZkuaBPTqx9hO3Kh/cQ6tEv3YSSajDFJ/tLNfHISqj2rV8Z/Ue2jfEI6aiPQ55TRGuxy3eJztTniY@lists.infradead.org
X-Gm-Message-State: AOJu0YyNJbR0WKVXlFa/NkqYqrZdUYW0DDB9MajNasLBeyxbTW9Y2Ac0
	Hj2OMmy2W/EzFFxzoS6jRFNfCvldohUu/PdQFQWEz6QdEM8YbRHoguuoLitD
X-Google-Smtp-Source: AGHT+IEKAP3EscCO/+AKOTiaIei1NntrEy5MDwnW+wb5bYjeknh5s+FgQLKdMnWLDncRepFMVsfEYA==
X-Received: by 2002:a05:690c:6084:b0:6e3:2e50:8c0c with SMTP id 00721157ae682-6e866332cd0mr66057927b3.41.1729864392292;
        Fri, 25 Oct 2024 06:53:12 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c19d42sm2840957b3.71.2024.10.25.06.53.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 06:53:11 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e3e4f65dso23888747b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:53:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+EB7IfgXamKDsGg41pElv5Rj+2EhrrnAnb1gLzNdDNKwEUZpseUeAbqCz+WVKEKHXpK7UK0XbkDXZn4BnV/h2@lists.infradead.org
X-Received: by 2002:a05:690c:6610:b0:6e2:1527:446b with SMTP id
 00721157ae682-6e85814e730mr59897987b3.3.1729864390657; Fri, 25 Oct 2024
 06:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241023210313.1390767-1-Frank.Li@nxp.com>
In-Reply-To: <20241023210313.1390767-1-Frank.Li@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2024 15:52:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
Message-ID: <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix
 coexistence of output-low and output-high in GPIO
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_065315_006330_BF0F734C 
X-CRM114-Status: GOOD (  28.14  )
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

Hi Frank,

On Wed, Oct 23, 2024 at 11:07=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
> Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> tree overlays. Since /delete-property/ is not supported in the overlays,
> setting 'output-low' results in both properties being present. The
> workaround is to disable these hogs and create new ones with 'output-low'
> as needed.
>
> Fix below CHECK_DTBS warning:
> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb=
-hub-hog:
>    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high=
': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
>        is valid under each of {'required': ['output-low']}, {'required': =
['output-high']
>
> Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR ov=
erlay")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Alex:
>         I have not hardware to run it. I check dtb output is correct.
> ---
>  .../imx8mn-tqma8mqnl-mba8mx-usbotg.dtso       | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg=
.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> index 96db07fc9bece..1f2a0fe70a0a2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> @@ -29,12 +29,37 @@ usb_dr_connector: endpoint {
>         };
>  };
>
> +/*
> + * rst_usb_hub_hog and sel_usb_hub_hog have property 'output-high',
> + * dt overlay don't support /delete-property/. Both 'output-low' and
> + * 'output-high' will be exist under hog nodes if overlay file set
> + * 'output-low'. Workaround is disable these hog and create new hog with
> + * 'output-low'.
> + */
> +
>  &rst_usb_hub_hog {
> -       output-low;
> +       status =3D "disabled";
> +};
> +
> +&expander0 {
> +       rst-usb-low-hub-hog {
> +               gpio-hog;
> +               gpios =3D <13 0>;
> +               output-low;
> +               line-name =3D "RST_USB_HUB#";
> +       };
>  };
>
>  &sel_usb_hub_hog {
> -       output-low;
> +       status =3D "disabled";
> +};
> +
> +&gpio2 {
> +       sel-usb-low-hub-hog {
> +               gpio-hog;
> +               gpios =3D <1 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
>  };
>
>  &usbotg1 {

Note that after this, there is still

    /delete-property/ disable-over-current;

left, which does not actually remove the property.

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

