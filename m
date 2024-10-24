Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC11DCE8E7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ECOF/H9PFUFioRUiy+IGZiwk0mnHr5Ag/WOy+Iwjhg=; b=vtAFmvnKaBBv1w78zHhWcpUgV1
	G+PoDpYhtlZmfCwHcdKNQqduL6FJjmGcd7rg2LPXly1J+4O/QhGFbtuXB8rtzYV582J8EV7flc71p
	K2KMuL/gyUnDO1tgLL21PvgIbP6AsZCx/LBA3fWJTybncbz8QyNU34V66n+D54Z6EFfUV4kVSsl8r
	i6ueFtUAu6LQhP3Dzt7RNoSAIjbt2og0E6qrARTsJ5ZI9v5szvqIK2aSl7DLywiToeW1lL5Nt5de+
	5VBRMs7pSj/WTmxj7d9/Q4VVrSJUPm7A5/RfcM4JZlzwGQ07Nckre+vo7ErllMiBHHq8jbHd0IYkF
	nMgRV2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yk0-00000000hjd-1zRw;
	Thu, 24 Oct 2024 14:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ygp-00000000gvN-3bEP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 14:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6ECOF/H9PFUFioRUiy+IGZiwk0mnHr5Ag/WOy+Iwjhg=; b=eUrzEfishmkCdsWjBvLhbw7Zgj
	YyIzSr0ZBXa9trQvZk1jCEcKwcrmXUIeUR6GYJx4rBzF5mYYkYNStLqD5Kmpsn8BQRgmDUiOFbrg4
	BGr/wUH81DETJhn8LA9Ej9RthEstfpNYbHdbbhIVzGBaIofJyB+pGiLV57YLjUyEBSEKFw5sW0WUe
	bC0tymBc0JGfufWUTqn75KkKkgc/FQF5U/wrTZ8W8RZI0mAyXFvYgXi5yK2pnrMTONMS5QBFJuK4h
	TaOJQXILBQcHrcopjyXzg9znqYo76AkpigcF7sdk4C77xcKuhg8X8ErCS2cDLCIlBYhtSnFriRrke
	/m7PFq2A==;
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ygm-00000008gAW-3sN6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:19:50 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3d97b8274so9490877b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779584; x=1730384384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ECOF/H9PFUFioRUiy+IGZiwk0mnHr5Ag/WOy+Iwjhg=;
        b=YcNdDm2OKxhpB9Bu1KyTJyHKF9kvZOUeOJ054797JVz4JTYrKxoz0sdXYhtEQHqNqE
         4ofsOeV31x/DnsHqGbWtxhok/vCO6OAy8PUK349OsO6lFgMqZQOhDzRnTJAwpesmwKF3
         82Ef/oQ49LiwmJMyjs6Hc/fIFEeD3hQvXYXzPPrynvAXFnrhlb7uhYz1vIJa1R/skT/d
         vqmf1L4m4q3J3vbrA9x5EC+KwFzcMGXlm+kmNkM/o4ACyncRsQu8BycG72or9qNI2geD
         cVBX7EbubIcew+/SJmBe9oVpRuduFpjAGnzNWLUhbcvsUkkpX+iVSfg1QfNeQRjj6qBd
         y/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXUoQz+FhChc56VXrNxgItQ9wiwFjF6RL0FW6k4sLC+jtW2qxYi7VCfzSlfuIdjcc1DT+nAKXes/k3bHscTVYg4@lists.infradead.org
X-Gm-Message-State: AOJu0YytPfpx34UDcgbJXIY6Otnuyi4VsppB/a+zhZnI4xfgHkxWmlbu
	r+1MU7PIPz1Xkqqe3rZJGvLpG+ioJhyM+MNZFb1hbQioGBbfBOxTDyMCEvyg
X-Google-Smtp-Source: AGHT+IFu42XQ6zTBbETPrEOxE79diVMNazmZzkypo/RWTR+Cy6a5tSLQSFy/+3J4OqpffObQ12YR/Q==
X-Received: by 2002:a05:690c:9b08:b0:6e5:625c:5ad8 with SMTP id 00721157ae682-6e7f0fd8187mr75571787b3.37.1729779584547;
        Thu, 24 Oct 2024 07:19:44 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e7f7edf574sm6945917b3.106.2024.10.24.07.19.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:19:43 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5ef7527deso11332787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeTRhJGK4LxHLrYYU6YB/oz25qnMZgBFxJZVEPz7rG4rZ7STsx/Jjik05XJaa1/eKQmjB2d6LQGyy6jv6yFZgz@lists.infradead.org
X-Received: by 2002:a05:690c:93:b0:6e5:a431:af41 with SMTP id
 00721157ae682-6e7f0fdab91mr62498077b3.38.1729779583362; Thu, 24 Oct 2024
 07:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:19:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgZ1_wJN-rcjy1V=DRcUgEXQp3Qh1ZUTiv1cF8ywi2VA@mail.gmail.com>
Message-ID: <CAMuHMdWgZ1_wJN-rcjy1V=DRcUgEXQp3Qh1ZUTiv1cF8ywi2VA@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] clk: renesas: r9a08g045: Add power domain for RTC
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
X-CRM114-CacheID: sfid-20241024_151949_088440_04E40B52 
X-CRM114-Status: GOOD (  22.08  )
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

On Sat, Oct 19, 2024 at 10:47=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RTC and VBATTB don't share the MSTOP control bit (but only the bus
> clock and the reset signal). As the MSTOP control is modeled though power
> domains add power domain support for the RTC device available on the
> Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none; this patch is new

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13...

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -304,6 +304,9 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a=
08g045_pm_domains[] =3D {
>         DEF_PD("vbat",          R9A08G045_PD_VBAT,
>                                 DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8))=
,
>                                 RZG2L_PD_F_ALWAYS_ON),
> +       DEF_PD("rtc",           R9A08G045_PD_RTC,
> +                               DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7))=
,
> +                               RZG2L_PD_F_NONE),

... with s/RZG2L_PD_F_NONE/0/ due to "[PATCH v4 2/4] clk: renesas:
rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones".

>  };

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

