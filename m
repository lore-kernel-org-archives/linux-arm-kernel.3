Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE82C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr7Tfc01vfHuBtZDbQIwiPabXFzT1mWwxVomhbQ8jNg=; b=iVWMIY1FO1YdFPXhZ/DM9h99IT
	BoMMA6l5vNphMCNXbN0TRaqaNT0uzaeK/OKOQWSyxgdAYMM/rHiGWfLXuYg/qnat7r8LlrZVgq2NG
	NdxMcfk5W5rA+KzbgFtz+bWs5y9hcB/H+DB3ru2VG+egbnrHfnw6HR4CoRjE3gOYn4kDTTZ0NNwEZ
	/jsF3Rv9nH7tS+ROSEpAZL5iUOrNPSTUtXQ8Su2q4pSUxb0+aQB/WzFNa0mOYHY43DDNima6zmW8I
	5Nq4i87FJCRrGRIaK3qSu9RORNWO2Tzcz36qg5Zx/AZhhCUfqWdLnAlGBcBljTh2RKnNbH7xVrVeR
	zOSq5QZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2kS-00000005Zkq-292A;
	Tue, 24 Jun 2025 12:27:36 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2UG-00000005VT4-0tdo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:10:53 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-532dbe71e4eso926376e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767050; x=1751371850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mr7Tfc01vfHuBtZDbQIwiPabXFzT1mWwxVomhbQ8jNg=;
        b=RGRExGp0Fz+UfOK9/piCE8hXt6W2vRp8vDKoSZWiB0a7Ads9zMrG0/dyFek54LiTv1
         CkxuIJ0h1LyQAsQRUl2KcdHNX5Jbm4o3NLlRgJH8Oj+zQtPMm3x1s9tT5tdI2VGKVBZd
         ubt56cP4fFlNxZmvECwi2cqHTkKNt7k/mvYnfNNjgPBNuPq2m1cO0PQHpROe0avdpmUu
         1twK3JhR0WdL/Z3DZyM8UX6JOahT1sCHJsrLmHU9oClYpdapDWQk+zN0kJatRvUpFCAC
         GnPN8+lbHT6WYplxCAo2vuS0uzdLApwv7I1mgZ23H/etBmQkcEo2zSipXGvmP5ABWWB5
         Qzwg==
X-Forwarded-Encrypted: i=1; AJvYcCUMDWwQyQWeWa+trTdHtaPuLpj9BEUJoxS4Q1B0IRcmZnlnCoSXilGg/ByvD+W6wz0E9hIW/C9QhFWScZ7HcZC1@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJXX7kzFm+lZV8wh98USMGV/Wtwq1sJoYukqQifwb6ojduk+o
	gfO7It/vGuogByRvPQuv3lN1pPE0THvEWR/lTJgB/aojt4TBhtmjREeVIB/PR6wt
X-Gm-Gg: ASbGncu/Nfh9qFBHzZw54ZEBblqoEJve6yWWTze66PHg5IuujgTlcCPCd0kFeGKu25b
	8QPS4F8LHCTMMrrPKAQut6gcvhi3EyW7L7AGXugar9vm1FOsCgt2GPmMvO4zcwDKH2j29QtCFG7
	zV5t1Dc6in1YaZrvE0cxTkX6wEMTkgoaKyb3DKfO7YXlGiyZNBHtG9T5trvszRLK8Rxnd5fRucx
	b8meG/fCrLDvW0EWuvhda9Ti8vJ3lStMV0AUEIi0fkgBMxnbMME9SSBkcT7jK8t92wyO0koLXN+
	HM6zGjBQAwBZDz26RyB6HbUj8lRRTp+9yAPJ/A44YwUsKiFBsoyH8EWINv0HXAK8kQm3xoPpWuh
	yMRo2YKB3hDXYbA68Ie64IL8b
X-Google-Smtp-Source: AGHT+IG+MK1annWWacGPjmirNVvKYTy8YamXA/jHsb+n1Xe6mssvy5t6ksr/6QZ6HjKdkYXVVrSiiQ==
X-Received: by 2002:a05:6122:2517:b0:531:236f:1283 with SMTP id 71dfb90a1353d-531ad823953mr9351904e0c.10.1750767049751;
        Tue, 24 Jun 2025 05:10:49 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab37e01bsm1540320e0c.41.2025.06.24.05.10.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:10:48 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e9c6b44477so2502468137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHBxoCTymtzDhx374Pf9qpp47SIVvhhMfb2W4PC8UC4tfsyF1yleftrtkwaxN9zbgweyduTghrthdX3MmoWdtm@lists.infradead.org
X-Received: by 2002:a05:6102:8016:b0:4df:9e8b:8cad with SMTP id
 ada2fe7eead31-4e9c2c6dcb7mr9458493137.22.1750767048099; Tue, 24 Jun 2025
 05:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com> <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
 <CAPDyKFpXcpwkacnYqWz2vxaTd7pW5bSRa2F063BryFxVNEAmPA@mail.gmail.com> <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jun 2025 14:10:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVit2WtjmFUHctBjndAo33Dibsg-GrOyFj98==gxk5rEw@mail.gmail.com>
X-Gm-Features: Ac12FXypYh-k6otCqY6pCtpIjWF0CfZNia3ZUPKNyrqASzd2JswYUEhHL-kiM-Y
Message-ID: <CAMuHMdVit2WtjmFUHctBjndAo33Dibsg-GrOyFj98==gxk5rEw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Saravana Kannan <saravanak@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_051052_256228_2217A930 
X-CRM114-Status: GOOD (  39.99  )
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

On Mon, 23 Jun 2025 at 17:06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 23 Jun 2025 at 16:21, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 19 Jun 2025 at 13:40, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > rcar_gen4_sysc_pd_init() is an early_initcall, which I guess is the
> > > reason for these problems, as the genpd_provider_bus has not been
> > > registered that early (it's done at core_initcall)
> > >
> > > Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
> > > a postcore/arch_initcall?
> >
> > I did some investigation around this and found that both
> > drivers/pmdomain/renesas/rcar-gen4-sysc.c and
> > drivers/pmdomain/renesas/rcar-sysc.c are registering their genpd
> > providers at the early_initcall() level.
> >
> > I was trying to find (by browsing renesas DTSes and looking into
> > drivers) if there is any consumers that actually relies on this, but
> > so far the earliest consumer I have found is the
> > drivers/irqchip/irq-renesas-irqc.c, but that's at postcore_initcall().
> > Of course, it's difficult to say if my analysis is complete as there
> > are a lot of platform variants and I didn't check them all.
> >
> > Maybe we should just give it a try and move both two drivers above to
> > postcore_initcall and see if it works (assuming the irq-renesas-irqc
> > supports -EPROBE_DEFER correctly too).
> >
> > If this doesn't work, I think we need to find a way to allow deferring
> > the call to device_add() in of_genpd_provider_add*() for genpd
> > provider's devices.
>
> Commit dcc09fd143bb97c2 ("soc: renesas: rcar-sysc: Add DT support for
> SYSC PM domains") explains:
>
>    "Initialization is done from an early_initcall(), to make sure the PM
>     Domains are initialized before secondary CPU bringup."
>
> but that matters only for arm32 systems (R-Car Gen1 and Gen2).
> Arm64 systems (R-Car Gen3 and Gen4) use PSCI for CPU PM Domain control.

[...]

> As expected, there is no impact on R-Car H3 ES2.0.
> I will test on R-Car V4M tomorrow, but expect no issues.

R-Car V4M is fine, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

