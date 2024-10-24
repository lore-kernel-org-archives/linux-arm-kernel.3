Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C32CCE8E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+Mz6xZlUTUGeIwHcP14gw58OClKa4+sO2EvtfsAcwI=; b=qYruT+vg4PhO78YD4TYKG41unj
	F4CwvFbA2IdNEqMjYk47kPr+BV9w0ggtcA//9TJEWZsJnXoIivKD6Ce3KToOcFvRR7v87LfE51Dhy
	TlOVCrEuURbBg/FFD2/ZyRdFyeCBfgjR72YQORpYe5lZgRelEze3derl58uLramc8lmIEEdbwk0xu
	JDzGndDt2O1MJxt/npL/Q4WKejyOjgaOvvBF6Y+y+/p6HC0I6NLtNW1hFXM82MT0RQJ07FFEV0X6k
	5Khda/VkokrDwK3HGt/jZe5oVilL763DPAJN2d2kZk59uxnwnAAfwgzXJEtLEZsfsfSSo0K6eetdE
	Y468fT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yzZ-00000000lu2-0OH9;
	Thu, 24 Oct 2024 14:39:13 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yk7-00000000hmN-1QrP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:23:17 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11260167b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779794; x=1730384594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+Mz6xZlUTUGeIwHcP14gw58OClKa4+sO2EvtfsAcwI=;
        b=tdTclwIh9Vn9qdddi8bkRJI7SuQON8PAyJ9CJ1FO5eko7Y5PWz/dXB1SHWMDnURyb+
         Yvh/TIQCzpgE8MQh60WSwirV4Sgk+rd17XKjK3athjZLtRqVsuPwYFdXzuTHsLvn4CNJ
         qEiI6H+QFfGpTYirFiKb3mxxsvfqRS6/s6uU6jA/adND6WSs88WxnFrabCvssTPUudCN
         egacsNeOrgPgl3nVZkH8OuUvugS71G9dn0d87KoRPslmRoVHOkeEZOtmxtTCCDlbA8e9
         J9SiyragLIABGJCpHySOctycJPdTz6xPyadEL+vNtR7VoOzoevstW1Wm+Dxd/Enkoie3
         JBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZfJxuG0NLNXqlqf0mcjBnoM4s2cVcdxrOjL16piGFpnr9om0HApm72XFBdQGiTPQSc9wEKbM0nSHe1d/LnMCm@lists.infradead.org
X-Gm-Message-State: AOJu0YzD165G8CJwkiP7joe4GabiBSmnHHD/yE4j1pCF1pdxOgX/nF9y
	rcBJQMgkFQMYj0eNFOCLUIJWlXDmFTtH0m78UZTRUJ+GIyQAYBIdXpOcckzJ
X-Google-Smtp-Source: AGHT+IHV7BV3nRS3P1mK5pNxDpmrE68+82nQt8BYcK37LglIXHyJ01gwFlArlIXd0BiMgzMyc7vSog==
X-Received: by 2002:a05:690c:f06:b0:6e7:e493:2da8 with SMTP id 00721157ae682-6e86630a103mr19958107b3.36.1729779792403;
        Thu, 24 Oct 2024 07:23:12 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085d4sm19928637b3.121.2024.10.24.07.23.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:23:12 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11259427b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgzGFGuKF9j2mEivTQ8iC3cQezsbspnN8RcqNLsMJ2lpnK1A6wr3ByHAyVXKl/LYYF2QbAIpvySvbkdDsi6b3E@lists.infradead.org
X-Received: by 2002:a05:690c:6f8c:b0:672:e1f2:feef with SMTP id
 00721157ae682-6e866332642mr27085757b3.43.1729779791878; Thu, 24 Oct 2024
 07:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:22:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWuwNx9u_VSQ3R2TbkrX=c_QLdQrk+=Ve81PFAsF9b9A@mail.gmail.com>
Message-ID: <CAMuHMdXWuwNx9u_VSQ3R2TbkrX=c_QLdQrk+=Ve81PFAsF9b9A@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_072315_404315_D1014774 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Claudiu,

On Sat, Oct 19, 2024 at 10:48=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the VBATTB controller. It provides the clock for RTC.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - added assigned-clocks, assigned-clock-parents properties
> - set vbattb_xtal status =3D "okay"
> - collected tags

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -346,6 +347,18 @@ mux {
>         };
>  };
>
> +&vbattb {
> +       assigned-clocks =3D <&vbattb VBATTB_MUX>;
> +       assigned-clock-parents =3D <&vbattb VBATTB_XC>;
> +       quartz-load-femtofarads =3D <12500>;
> +       status =3D "okay";
> +};
> +
> +&vbattb_xtal {
> +       clock-frequency =3D <32768>;
> +       status =3D "okay";

With status not disabled in r9a08g045.dtsi, this line should not be needed.

> +};
> +
>  &wdt0 {
>         timeout-sec =3D <60>;
>         status =3D "okay";

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

