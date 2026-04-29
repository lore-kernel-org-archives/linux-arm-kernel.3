Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B7BFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlgSQf9TVaIeapbi36V5Bh/+HrPzPP7kpOmKArKJl0Y=; b=Oc1211vTO//duwfOUFqn8HGrru
	WrSBleZIMCIfaQHbFh6t5SrYtxancz8I2U6jlO3ZKn2iL2Pzl6DiokSC0x51ts7e9NTvTCGtQfzbU
	jggTUGVCSB2A8vXuZyo3BQFNw43X4rC9HJW77/+0QMddL/5j9eHf3wvwwGgSGSqy1l9Lot3U8TzKX
	lrIq0P9TflD0717YOc5YbLHy6BakTUcRBDGZ55fIoJ8m7Spy/rickfhKI3djrkzfPkELPpbxVDFWy
	8FBX+tP3MBQ2HqT6l+mP1szgh00Nkq/v2UuWAomXNTv5Om6hbbxP4kyFz/PPJDIKl4LOIT0unsnkD
	Gx/N2xJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1sE-00000003QlU-0Pmd;
	Wed, 29 Apr 2026 10:10:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1sC-00000003QlM-2jQO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 10:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JlgSQf9TVaIeapbi36V5Bh/+HrPzPP7kpOmKArKJl0Y=; b=iw0LumrSzVufKBDzTJ7rKxmNUi
	ikC4KJssKiPWcFl8ZByQGpv5WdhaJQQWG+RZKnBtYDUPUTdqXwVN5sCjTJcJlnd04C8GS3J31EhR2
	4MeKX/WmJxmP9ySp7mFGA1Izhh5RB3FPt+UFxwLRLgOd+QxD2EHrU5/guGO1IGSUPmFautFA2VwWn
	jEu+lhBk8SvGGdmOYHVEiRLOzByYoMaAOEBsIvDr3RKOuIJB52jp5mw2nTPbaJe98iVIVAfPQovP0
	Yt8ydddEYjh04POJKLLbx+KpE+uq7jJI2mRFOTI3/kmfPmYFSbzyVD23vhfiF7sFGgwDSj1H1v7xF
	Z+3mIXWg==;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1s9-000000054kL-2Plj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 10:10:27 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so6615668241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 03:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457423; x=1778062223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlgSQf9TVaIeapbi36V5Bh/+HrPzPP7kpOmKArKJl0Y=;
        b=Hak4uSQMX/HLEutAY05ugruHFYwf+dPic/dZ0+zk6EuMsQeTLQ9RDLuGTchSLWRJCg
         Iz4lqVXiye0NRZ9U38HAaarKYzL/PoHQywanEns3Yqg/okC6DIKZtEAqPVXIRbfdL9vH
         RRjYi0m6wp+vaAMnB8csiiwTETVOTiwFmgjqOwWiZ70jXxlaDpsCl2ZkJWYUvUN8SSbv
         X3ZKqs98bNUzQOOvJRmWdewRHyFFVTK0Cxzt2U0h/jkrvhlbNGQZX7NVu95BUMrQTNvu
         mKAuc0uXHJBvtwWepSNDs2Rdd38cIRkNply2I60BwNIw5HvP2pRl7po3QxpoUwB5yTEt
         vQLg==
X-Gm-Message-State: AOJu0YyqAKF/L+0AkxAcrX1IZuIMmDj642FhOWc8VKiWAgjiVi+lpcFg
	BzucEZxzEw6NNQYvNqGoAqDYPVwhbCzvhLttwOIlxhkfsVc0I+TMqfC7tlgZb5SPCv4=
X-Gm-Gg: AeBDievdb5DkLjwoDAxOzKAQ3O1KwGifqQ1FaO49i1lt7B13DEqlYoRDW1I+UamT45h
	XFq6DUxlEXH63QTIApn38w0BFylF+7uWbeP4o5oH3HjOvArvcDmeP6RXZyNRmQCVvxSyQUNItqG
	+oF9/CD7lXMLZnX5Y0C1XD43Bo8I9BfHDrcSr/nW/Dg5gNElSMSUDgx6hAkigZIMg7cSnv36y4O
	B/NB28ye/0PhiBc+aoZC2kf5wXO1fSvUEDzg86TZQifN5AcV9PXUZugmHn4qSHn3T9FfUOEJxe0
	LdI7FoiGSDoS/QuBMhbbI6ISj0LYl/buuLx3VQj4ojDE0RWsUq/QlCsXZefLesBAgZVeCKlA4QB
	Pb8du9lRU1xJcJ02OpySsTtNUYgGU4NHkpGBsbKU/ryFxP4Pp0UeS087upqhHHSKzlWlJ3Igz6J
	O5DZ47c8eapRP4HlEGfoHxRTouPC3Kg91SkobszslsHwKpPAWnBNgqDp4h+my/c6Or17ImrI8P2
	Z18pM54pA==
X-Received: by 2002:a05:6102:8345:20b0:606:49d:1861 with SMTP id ada2fe7eead31-6280b1e6ae1mr2691127137.27.1777457423167;
        Wed, 29 Apr 2026 03:10:23 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62984335909sm782260137.8.2026.04.29.03.10.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:10:23 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-953c5738c03so6797600241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 03:10:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5808:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6280a4a8859mr3233756137.16.1777457422707; Wed, 29 Apr 2026
 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 12:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
X-Gm-Features: AVHnY4JG2nQR3icySEfGRtnnQzDT9zHNQTQkbpTpvtHZyLM3-S0niXuSWkJz0jc
Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_111025_728939_A95A298D 
X-CRM114-Status: GOOD (  24.50  )
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

Hi Marek,

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support the Renesas R-Car R8A779MD M3Le SoC. This SoC is
> similar to R-Car R8A77965 M3-N SoC, except the HDMI port@1 is
> not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -564,6 +564,30 @@ static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
>         .dsi_clk_mask = BIT(0),
>  };
>
> +static const struct rcar_du_device_info rcar_du_r8a779md_info = {

Assuming for this review we do need a new compatible value...

> +       .gen = 3,
> +       .features = RCAR_DU_FEATURE_CRTC_IRQ
> +                 | RCAR_DU_FEATURE_CRTC_CLOCK
> +                 | RCAR_DU_FEATURE_VSP1_SOURCE
> +                 | RCAR_DU_FEATURE_INTERLACED
> +                 | RCAR_DU_FEATURE_TVM_SYNC,
> +       .channels_mask = BIT(1) | BIT(0),

 "BIT(3) | BIT(0)", given R-Car M3Le dropped DU1, not DU3?

> +       .routes = {
> +               /* R8A779MD has one RGB output and one LVDS output. */
> +               [RCAR_DU_OUTPUT_DPAD0] = {
> +                       .possible_crtcs = BIT(1),
> +                       .port = 0,
> +               },
> +               [RCAR_DU_OUTPUT_LVDS0] = {
> +                       .possible_crtcs = BIT(0),
> +                       .port = 2,
> +               },
> +       },
> +       .num_lvds = 1,
> +       .num_rpf = 5,
> +       .dpll_mask = BIT(1),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>         { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>         { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },

I also don't know where "M3Le does not support 4K output." (which is
a VSP2 limitation) is to be handled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

