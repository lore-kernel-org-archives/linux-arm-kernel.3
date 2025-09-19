Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04148CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 06:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkV81nju0TPvNncudyLCXK6ByPHFzfyoX04Ft1zWdlI=; b=iffYTc77+4sA4FDANb76kMuVMu
	Dx057JhnuLy/LgU1nNqC4G7izBfnIr2cAXq8EPvG4D7SoO6RLSLom5LyupD8ggsUoRbKVeROccQyh
	zM2TS9ln4XohLxEfA6gbOVdcN4x1Yam/NTOTB98TH0ZxrnJcXCSWHTz91zntA5aQHctU3Pbl0z4dN
	hluD0VnLsjbiHqjGRhwwYp1bSxehTCbsER1z/39X9e88GpNfDlPks1YxXspj7r8PAKeH4e+tS5YCw
	q0NFA36JXZMzBHyy3QVkb2j++JuSZwDClQTcScMgMAF2RiwuzjaIpwrPfyx4mwsXfoqaUhMkKTNov
	qKFnB+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzUzJ-00000001yqv-1923;
	Fri, 19 Sep 2025 06:52:57 +0000
Received: from mail-vs1-f54.google.com ([209.85.217.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzUzE-00000001ypg-2rIj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 06:52:54 +0000
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-52e532e8198so341225137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 23:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758264771; x=1758869571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkV81nju0TPvNncudyLCXK6ByPHFzfyoX04Ft1zWdlI=;
        b=Ye+kRVGp8BlMwSdz3szM6izVl4uCQAAmwpCOoKJhCwH0b5i6AmB2KHFUnYJUbF9G1/
         pr2Pcg0hPI2MpHtf0vxy5+94wx0btDz5vCU8HTWgd0umMGBlSdKEGgY1yX2hYwN1KpuO
         fuLtBWDjMeonlzFoIKj4Uk1kf08VqzS/hQQtw20tK4hRNt0AvmCBSMP9gjOMHoKrd+OB
         evZmLoZTeZgsrd/nxWx/b7JCvrIVuBkA4fJt0Md5b1T0JFwUDwlxtY2pu5DsII/D0/Tf
         VQ12+Jrrt5Rb1gnNt7GmetLXaUyn12TIMaH+gXOPK+ZxjMS2RTgrbgmVQX87NBpzatnt
         qGuw==
X-Forwarded-Encrypted: i=1; AJvYcCVQujQAw2Sg1y3SrS+HnupIYBNJl5zl34x/gBpXv20icwdO1qfxa1cBsmtDnMnU+qWBeYSOP1p/WSn5FE4/ZUD2@lists.infradead.org
X-Gm-Message-State: AOJu0YzFrN33NeeliQaa1uOEADSnm4nJNyP0QSMGuNg7x6c1J5MCqB/d
	8mLLODV2Ixh2ttspVMxiAFq8EuR06m/CLeJ2lRcbiG3dnwMz5Rfjl81IpFoYepsE
X-Gm-Gg: ASbGncu6n3GcW4U9F7/JQGjVndPeW9uYu0T/jjVvjH1X99MSEloX5sJm0r55h5hysPr
	jY5cCBOi3lT1+1pGPRcbNtAK6vU4m1lIUazJjMjnCEgF9c/zX6FrmS4XgRiikvzjjEr6jz0UcOq
	pNYfdWMdDZ9XqXbVseKFtml1VWugkbega969wi0vls68lHvHeEDKbpDls0qeoIeIs50nj+xEmXq
	urz3JhxKWZYLkdqP/85XVWnpUWEyXznGXBaxQ/ApWKqGSG86gFZDTGsDoA82ViP07y1yoMFkHZu
	puojzMnVpynsAx7/HNyRMIupY+nOI580suqpE4FHIK96sRCfpDqPKhOVg3CCFVXoIeHLonwbOAw
	jxU1ns5KDzB5JIAeWRXlecQymD+ehfZ98GdUGY08ChLYbCbOPkCj1I0quFX6G
X-Google-Smtp-Source: AGHT+IGk9F9EFWOR05A+5a2yZBXWP7d5IaYuS74vOO58xQ32rwi++z6xHOnLMotu1z9cMzuRPWfNBw==
X-Received: by 2002:a05:6102:6895:b0:534:24ad:358a with SMTP id ada2fe7eead31-588d8df5b9emr561590137.6.1758264770844;
        Thu, 18 Sep 2025 23:52:50 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e7df150esm755878241.19.2025.09.18.23.52.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 23:52:49 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-58574b47548so340017137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 23:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwFbDr5J6PJYXz+OYgu1AT/pHWqHV+zFpJIVncEfw7wJXKGZP8KtUFVnsDZkKReMerVIv3rDD+EF2CJOxIXivM@lists.infradead.org
X-Received: by 2002:a05:6102:cd4:b0:519:534a:6c24 with SMTP id
 ada2fe7eead31-588f87db47cmr602651137.34.1758264769029; Thu, 18 Sep 2025
 23:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com> <86ikhg13m1.wl-maz@kernel.org>
In-Reply-To: <86ikhg13m1.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 08:52:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
X-Gm-Features: AS18NWD_Pkgqx7xjtQzxa7XmXgry72f3hJO1WXd7ew0O-6Nznr1kYzKT4iwfWdQ
Message-ID: <CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Marc Zyngier <maz@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_235252_727847_AD3B7FA7 
X-CRM114-Status: GOOD (  22.79  )
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

Hi Marc,

On Thu, 18 Sept 2025 at 12:01, Marc Zyngier <maz@kernel.org> wrote:
> On Thu, 18 Sep 2025 07:27:26 +0100,
> Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> > +             /*
> > +              * The ARM GIC-720AE - View 1
> > +              *
> > +              * see
> > +              *      r19uh0244ej0052-r-carx5h.pdf
> > +              *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > +              *       - sheet [RT]
> > +              *        - line 619
> > +              */
> > +             gic: interrupt-controller@39000000 {
> > +                     compatible = "arm,gic-v3";
> > +                     #interrupt-cells = <3>;
> > +                     #address-cells = <0>;
> > +                     interrupt-controller;
> > +                     reg = <0 0x39000000 0 0x20000>,
> > +                           <0 0x39080000 0 0x800000>;
> > +                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
>
> I already asked for:
>
> - this comment to be dropped, as it serves zero purpose to the common
>   mortal

What about using a different comment instead?

    /* Linux must use I/F Region 1 */

I.e. replace "View 1" by the above.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

