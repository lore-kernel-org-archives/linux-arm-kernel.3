Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A4BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7Pf4Tw/xl4ZzOJcSTeUWy9hR8fh3hnPuV5B7YmZsKc=; b=rmfrXR10AorBdyj52LGW1+1dgs
	vXwmWw7Q1zWmjmIjkH3jHhCnQ2p8YPetPzra9MZ7not0J4RoPuQmnlWjaArhuB2V22W76y3uHCXjr
	EdfeIGFxJtPG/HRQTa0IcCG4ba1BU+muhwPYh+vPqH+7qbYBCdov5gGkzQ4+VJECAAvUNP8GJxqK1
	aGHrFTCEfhI0EO9XPBkZm6FFoGbDMvel/wH9FX2SNP73UYuMaGpF8lcOAVZoiECRughTeDoaY2upy
	ug0rcuP2Qxftf97Cx8LBn7XZvSC2ZO9p++kfDNZLYXtBR1XK4KaV2bTZfKhrSue0pSUtm4VtyocCU
	ck12Qd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlEv-00000003b7k-2xha;
	Mon, 23 Jun 2025 17:45:53 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi2w-000000031lL-3PvT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:21:21 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so3683728276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750688477; x=1751293277; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U7Pf4Tw/xl4ZzOJcSTeUWy9hR8fh3hnPuV5B7YmZsKc=;
        b=dkwO0mmEIWlZhEHhUF/dXvJG1A2ujZ/WUm9YGT0Hl4td3SmOdP/dBpZC+0yvIf33xj
         7Oj04RQe5zKuCSkupCWcOcZ6xx4yANiPqL5n7pCUvzzlCpChmVFVaE6q0kLwDCFAMBmR
         F6PUyOM9OdDgguGkOGTvKtwx5r0WrhPSoG83G/MKU6daL/jIieBqTZvQgaSPhkpZlTDg
         Uc2Qloi4Px2AmdYzXRZMn8I/U+mNQNw2ajNGSvjCVSY/YrsZ9YRjAzLI9uZQKib1/bMO
         sAo9P14cO15kiMKGZKa6B/DtNfZZEtBFW0pbrga0qgzZTrNv7g8sDGM8NvYdPRWBBpPg
         TQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688477; x=1751293277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7Pf4Tw/xl4ZzOJcSTeUWy9hR8fh3hnPuV5B7YmZsKc=;
        b=ArJACaq2MeNUmYlaa1HJ3XmUArM++6clWXXaJsJOFKh9AWWI0l78IMBhFo7axKi8Mb
         OPWsFLyrs4qKUWdLgqpX0NyleAZBGQrC1AozEarKW1BFU03Hai2x31L15cPHKaUqBO+n
         NZIdACylY7lEk4dz7syU/EyIY2uyf0U+IEKsez+vqCAGC0zZaTIcQyoHeEJDBu4KqSBM
         WsyAxbW/4DsXTAzcIeIXrccsduJLrcU1go6OmsvSLWhXpFw7NQc5nydRonCsiasBq9XZ
         9k0LHA+pR/fJmXfHmrsWXphy1xq0H+VAbBfbnnbc4EfTM/6ygVLKIi/uK5SHXxOGJYzP
         szbw==
X-Forwarded-Encrypted: i=1; AJvYcCWzVNn5KdzmPUr3QUgvqWuRROduOvez2rWlztzJPW2c1ALUnDSczVtQd3ebu1PjrYBX8pWEQY2sbjaMIn1Bo6En@lists.infradead.org
X-Gm-Message-State: AOJu0YwyipGgqD2MD6GfkkVimWZod+4FFBm29NrDJWMFuHLNRHszW4wT
	RQPDbyDRM1btQF8Ylu3KXutGuz5eO0XzaIa91Jme633BN/Rmj+lEA3dt8/zwlnpDkAxeCW8Hagz
	Vj5H4aIjf53v0R7Ow/0UhWTFtG72kMEMutQC5oD35ng==
X-Gm-Gg: ASbGncuKS4rC+ey8+4fImzW/CzmH07vb3GtPeTRBV1+VN59E0qdQL1ys2imLXjmtOJR
	a35x7OlG7zntLunkWSodcVdkhcXhh4omVCEGsBK7NECDdZ81afqWLiraY7WvapAoY2W6r0njp9f
	Xw6v/YYulWUtmR+EhrsM80d1g2VfAQPjgThmu4hvARYA1D
X-Google-Smtp-Source: AGHT+IHOeZZKYswcD2+7mNFNITMikJvufzmGWdphs9OZVOVEegSi+TQx3Mqq1zDy67QaE2m9d/2OADaGrEZ0W8PZuM8=
X-Received: by 2002:a05:6902:70b:b0:e7f:263e:6c40 with SMTP id
 3f1490d57ef6-e842bc884dcmr16607791276.16.1750688477207; Mon, 23 Jun 2025
 07:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com> <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
In-Reply-To: <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Jun 2025 16:20:41 +0200
X-Gm-Features: AX0GCFtl7MtxcE4vyAd4TW4aP7KiFQbKSRPzfdkRqmmetdjmZM6hCv3ubI_yHWQ
Message-ID: <CAPDyKFpXcpwkacnYqWz2vxaTd7pW5bSRa2F063BryFxVNEAmPA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_072118_861026_4955AC11 
X-CRM114-Status: GOOD (  34.57  )
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

On Thu, 19 Jun 2025 at 13:40, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 13 Jun 2025 at 12:33, Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> >
> > Hi Ulf,
> >
> > On 23/05/2025 16:39, Ulf Hansson wrote:
> > > Changes in v2:
> > >       - Well, quite a lot as I discovered various problems when doing
> > >       additional testing of corner-case. I suggest re-review from scratch,
> > >       even if I decided to keep some reviewed-by tags.
> > >       - Added patches to allow some drivers that needs to align or opt-out
> > >       from the new common behaviour in genpd.
> > >
> > > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > > powered-off before all of its consumer devices have been probed. This series
> > > intends to fix this problem.
> > >
> > > We have been discussing these issues at LKML and at various Linux-conferences
> > > in the past. I have therefore tried to include the people I can recall being
> > > involved, but I may have forgotten some (my apologies), feel free to loop them
> > > in.
> > >
> > > I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> > > Let me know if you want me to share this code too.
> > >
> > > Please help review and test!
> >
> > I tested this Renesas white-hawk board, and it hangs at boot. With
> > earlycon, I captured with/without boot logs, attached.
> >
> > The hang case doesn't look very healthy with all these: "kobject:
> > '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is
> > being called."
>
> Tomi, thanks a lot for helping out with testing!
>
> rcar_gen4_sysc_pd_init() calls pm_genpd_init() and
> of_genpd_add_provider_onecell().
>
> rcar_gen4_sysc_pd_init() is an early_initcall, which I guess is the
> reason for these problems, as the genpd_provider_bus has not been
> registered that early (it's done at core_initcall)
>
> Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
> a postcore/arch_initcall?

I did some investigation around this and found that both
drivers/pmdomain/renesas/rcar-gen4-sysc.c and
drivers/pmdomain/renesas/rcar-sysc.c are registering their genpd
providers at the early_initcall() level.

I was trying to find (by browsing renesas DTSes and looking into
drivers) if there is any consumers that actually relies on this, but
so far the earliest consumer I have found is the
drivers/irqchip/irq-renesas-irqc.c, but that's at postcore_initcall().
Of course, it's difficult to say if my analysis is complete as there
are a lot of platform variants and I didn't check them all.

Maybe we should just give it a try and move both two drivers above to
postcore_initcall and see if it works (assuming the irq-renesas-irqc
supports -EPROBE_DEFER correctly too).

If this doesn't work, I think we need to find a way to allow deferring
the call to device_add() in of_genpd_provider_add*() for genpd
provider's devices.

Kind regards
Uffe

