Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4ACC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DfRGBX3mcpytWgeuQOoQcWlLUxxXP7ehgwEP8S8+jQ=; b=WEoMAQuAKYdgQEi1u7jy74PK3A
	GUdiEgkAkipNFgoFser1RnTIwJugdta7jfBN4dvYbKFpwiKI6Riwz9deTOENIgYc65S1JyJ0DY7PQ
	XFknc5C66XbjKAnED5dLplYVxBseKSiYJ7VIADk2Rbi2sZpYZyC4Xwmz+x7xX+HPnpQRuySS89Mcr
	R6AJ/EInMirJFPulE2AgMorRD8KZhteKzpHIa4zLFdZh7Uly5syP2uShj4NQVjdjUFzqWvK2BD2Dt
	JU8DitsDX3QFwEik8jY8LpfyO1nSuwoj4NZWGniMRTcNMxwDQ9JrJnrMerns3Q2iAUb0BSCGhpNHp
	YthBovaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh46n-00000001EkG-1pBG;
	Wed, 30 Jul 2025 10:32:29 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh44H-00000001ETy-08et
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 10:29:55 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71a39f93879so8447517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753871392; x=1754476192; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8DfRGBX3mcpytWgeuQOoQcWlLUxxXP7ehgwEP8S8+jQ=;
        b=A++uy+CC8/QBLX/IeNf/ZlCa4GkjrPGkZUIJu/oR9aBnsm+wK7VgensRfE5WYGaVVs
         eMuMBuz24CYxmsQp3QVZgjAMmDDXciFQOWm1Ch+AO88i9kCDKa/gUAWaF+XgjrZBchhf
         LFMMjgPLZtXBKZAjzS1EVbmEDXkNg7D58bwt8hLcKe6APIWQU3CbbJv7aQXyNNDDQ5gr
         bJapEjNRgjxIwVz24rqB0BJ5lOSPG3dP4oPQJJb7oY+/KzO8Y7o0RpGogYgSOiZiTuHA
         Mt+/9jm9i0JTWUbaGKSRLuJA5wustExdS6G43faWehggmMaeDcdfu9xkBTOw9+fOSIYf
         sS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871392; x=1754476192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DfRGBX3mcpytWgeuQOoQcWlLUxxXP7ehgwEP8S8+jQ=;
        b=Clak2lApya+JT/K/y8FdgXqx/bLnarYiDlGTNvdjrQoWL0KD+Y69DuCWBTkYUUm7Ni
         ZTTNBzD2DvMUX96jR6vUwP/KFlN81M8A7INtykBkoTp9YBqmkGGTAYp247ktzsVyDoxc
         Skn3UTqOD4F1INEoC61w9zXl6yvbfz24flcXDisFPB0SmLujbsZ068WmYhtkNEcTM/KE
         O45WOwQOCxN9LCO1euiutmslgwnf6SgaHPt+Macvmj2IycWyMSkelDAtUygXXn66j7Bl
         2U5WypbHcpmqWVdKfY7SJNCgBU0Sjywf2TvH0PB4Meyk7xltZQhsuczQnKiODM+rByXR
         VJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCX1vilY379wvoZNaRvGDoY+h/C2mNflfaDoiOwVk15FyJQlkFvuFi2qWGJZHTNiyx7tx+jOEZ+qV1z83DVSwGU5@lists.infradead.org
X-Gm-Message-State: AOJu0YwkjKQpBOgFkzX2gLG0LegI1g7PD1TCTzXJOF5RsuOmIf4O4CYe
	wY3QVVccmExcuW8h/81cUujhRqKJGmhSMcXg+hubvBR3RBpe9/3AZa8Ayr5HLOxiO95C0pGNWX2
	iP5mZXiwKyRUQGm0gHifEwkgcHliYFLFfEEUk14Vjkg==
X-Gm-Gg: ASbGncvXnq2LjVU/tV342h30/6gx93nxy8nPjZfzzJGvk05/wFDxbnB9FYQMl9jrY00
	J6kYo7+iAWkNZr1++wRuXMKs7cV++P0CYVLR3NIcEjELGI6BNqUrtcr5aKfR1jfivp0usHWPabz
	lkNFPCHTWDq2D9cipCsL96uL7J30pTeCpcvqVE4xOJyoxuP9JOfjWGW5/PQeCWLMP5574b1yC7X
	o5oB5vo48HnC/CYc5w=
X-Google-Smtp-Source: AGHT+IGFQjbmfwQ2KygX5zLfPtAfVRDoKZEoCDWpl15Tj6cbjvtyN/moXAbjn/fUqackhgtTl9hi4qXu0QdfTHnMzRw=
X-Received: by 2002:a05:690c:3686:b0:71a:2178:3e70 with SMTP id
 00721157ae682-71a4745d2abmr37909517b3.8.1753871391946; Wed, 30 Jul 2025
 03:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com> <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
In-Reply-To: <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 30 Jul 2025 12:29:13 +0200
X-Gm-Features: Ac12FXyYhnc-5Yj1CQN0T9Q5i6IKPQAs_4KsBvKN_tu1xC2bA9MW4FBogdA1snU
Message-ID: <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_032953_079722_3AA9C37A 
X-CRM114-Status: GOOD (  30.59  )
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

On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > Changes in v3:
> > >         - Added a couple of patches to adress problems on some Renesas
> > >         platforms. Thanks Geert and Tomi for helping out!
> > >         - Adressed a few comments from Saravanna and Konrad.
> > >         - Added some tested-by tags.
> >
> > I decided it was time to give this a try, so I have queued this up for
> > v6.17 via the next branch at my pmdomain tree.
> >
> > If you encounter any issues, please let me know so I can help to fix them.
>
> Thanks for your series!  Due to holidays, I only managed to test
> this very recently.
>
> Unfortunately I have an issue with unused PM Domains no longer being
> disabled on R-Car:
>   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
>     disabled.
>   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
>     sometimes not disabled.
>     At first, I noticed the IOMMU driver was not enabled in my config,
>     and enabling it did fix the issue.  However, after that I still
>     encountered the issue in a different config that does have the
>     IOMMU driver enabled...
>
> FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> of_genpd_add_provider_simple(), while all R-Car drivers use
> of_genpd_add_provider_onecell().  Perhaps there is an issue with
> the latter?  If you don't have a clue, I plan to do some more
> investigation later...

Geert, thanks for reporting!

>
> BTW, the "pending due to"-messages look weird to me.
> On R-Car M2-W (r8a7791.dtsi) I see e.g.:
>
>     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
>     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> due to e6020000.watchdog
>
> ca15-cpu0 is the PM Domain holding the first CPU core, while
> the watchdog resides in the always-on Clock Domain, and uses the
> clock-controller for PM_CLK handling.

I will have a closer look as soon as I can  to see if I can find some
potential problems.

Kind regards
Uffe

