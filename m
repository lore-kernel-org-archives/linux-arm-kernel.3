Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD9CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 06:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDaii2Wdk1Ox7/nqut8hlOiulSUANPWpY7ZmxRlktsA=; b=SAFXi/gEfw5pmQOVDeyLhC0LHt
	y/NtdQGoDx+9OZCzBBYr6ZB2VwZ9cMNIRykiPnfdcGjVxiZGv7dHWwauu3d+nQXVcelqX7xJRf41z
	at1rW0d14NX6BruiFce+SgD544V51rSzayKoRZDHnIAGCgQkTeRCrDBWCXMVT3cXEPJx1elSJfH3t
	Q9s7jYsOOwRDmSg4qqp8GCA6YFDGPS+YXg8e96u7FIW0/JaSjeBoaBbfDZPomU/xVu5ver2SeGgwq
	P6FmBVwNu7qYI0PeF593V4AmCmiqXig7sBPNx6XLfWGedLW2DT1ejp/V1XTiUKV77y9Qdx5QGAVwK
	Q9skwM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyP0R-00000006tdJ-0eiP;
	Tue, 16 Sep 2025 06:17:35 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyP0P-00000006tcK-0fp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 06:17:34 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ea3e7c4aef5so2209640276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 23:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758003449; x=1758608249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDaii2Wdk1Ox7/nqut8hlOiulSUANPWpY7ZmxRlktsA=;
        b=cSOuDwsItvxc/2RtD8LQ2iWhVRhmisRfQfP1XAx/aKlnR6MLrOcYPMR+apQVnAzxPd
         +LoWOgFu8ymYovZUSRcr1pyTkoPHtcpxRdWFijiXYvql3MwI6GUMZ7qAnR6LoeVYC1mu
         9E9hV9csjMvrCJ/Ffkx4KtV+BtaYTqUdytDuPWXViNjnqfV5XtOceBU+ySXvWrRV5zpy
         so6spP2OFUPZOcNVwVaPnFWDemu4HwidlCiiqMTCePo8tW3CzAKYLKja1k6eHCG9dO11
         kyGGzif2tFxh47RXmkAbGCNbvdTWNADJ62O+t3etpKZH+78kvKINEOp0G79/04YOl6YY
         rqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758003449; x=1758608249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDaii2Wdk1Ox7/nqut8hlOiulSUANPWpY7ZmxRlktsA=;
        b=Jaj/DWWAZy1oYrXpE0ZBGbs85lBzFCABIlWEc6sGW1pLTSsr2Pv6+vXaDw0vAaAOfp
         TCvmOUgrn0Jqw4sj8uED6GJYZvg+X0v7QxJ53u/moZ8dA9fuxjzWhadLYBxGU2OKlIN7
         IiLg3zbVlfhNG6rJU+LHZqWKtVszhcgxxBlMKuYhv/pj/giX5bbmAckkst8syS4ksq0D
         Dhy2jeWSB67VMQNIi6a4iJWeKXE5vshlEAMQDn4Y094zlgtG0oJTwFx9Kp98Eq18cX1y
         hitKtb8Jlux9FX9+ZBbbuTA8i0swo4Ef/YBumM9iJMmTVqRZiIXyhCpetIis+mzm2NN8
         OCsA==
X-Forwarded-Encrypted: i=1; AJvYcCWiJJgcySnJooP2XqDVYNp08b9lby0DTrHt5pFQHWbAQGPQ57uQRCltaeOkGQ7+6BHaoSxkgc9ZRce2099Wi3fp@lists.infradead.org
X-Gm-Message-State: AOJu0YxWUQosrnO+uie15b96QQl7neUFEAh7agBh0awOWKUJKbtKmjlq
	hQYNQGwodMH5jEBbTfq8K2ZDKhxOrhVLWfyLPD1gqz+NOKM+2GXBX1PfY26wfGmvnD2aJQvZbMJ
	GgL2nK36Ve7knIUF7D3rRS2xntXcZK/4=
X-Gm-Gg: ASbGncuFkgTy2H4e52TJBwQz2kdf7igb2s9Oz2qzGQ3PsGSMnliU3VxkNEW/pV/r/qj
	YLw+TB2oZ8MoyZntjD+8/oAbLOeZBnlPETJ4sGWnLfkb1pQtJtCsEnOle+smxSypMg1Qu8rw3u8
	J00cSDT+HmZUQxNgfbSbGQ8sgUWOVl0ZWebrASIQPd7kbJfEtQ/ldXuNWMEkXTtRAtxCGnw41Ev
	/V0yNSlP47mbDPCMZGlspgVU3P6UpFftOJzRl4Sba4Gz1reO1SAKRImYuPkBwazkEHJ7lqC
X-Google-Smtp-Source: AGHT+IF+Xiqik1tR0vXGQ+PFRyD1S4moq1IqD/LOHDIbRGhH8BmE3q7KjrCrPnOYGKNgwkeY1K1KRVmqmymVnMlyYJM=
X-Received: by 2002:a05:6902:610c:b0:e9d:77de:c50a with SMTP id
 3f1490d57ef6-ea3d9a4e64dmr13041781276.17.1758003448858; Mon, 15 Sep 2025
 23:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com> <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
 <24083992.6Emhk5qWAg@workhorse>
In-Reply-To: <24083992.6Emhk5qWAg@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 23:17:18 -0700
X-Gm-Features: AS18NWCXWyl_YVRXpDa8LQOU9lM5ZjkiSFaFNztoIDgFSKKxEgJ3VR2PFYeYjBk
Message-ID: <CAPaKu7QKUnTx-jRYfHEUJx_3bkgQ_=vEC=siTOigtQAnu4NxcQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq providers
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_231733_246079_1DFEF6AF 
X-CRM114-Status: GOOD (  58.51  )
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

On Mon, Sep 15, 2025 at 6:34=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Saturday, 13 September 2025 00:53:50 Central European Summer Time Chia=
-I Wu wrote:
> > On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > <snipped>
> > > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/=
drm/panthor/panthor_devfreq.h
> > > index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516=
929edb565a1f13443fb 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> > > @@ -8,6 +8,7 @@
> > >
> > >  struct devfreq;
> > >  struct thermal_cooling_device;
> > > +struct platform_device;
> > >
> > >  struct panthor_device;
> > >
> > > @@ -43,6 +44,19 @@ struct panthor_devfreq {
> > >         spinlock_t lock;
> > >  };
> > >
> > > +struct panthor_devfreq_provider {
> > > +       /** @dev: device pointer to the provider device */
> > > +       struct device *dev;
> > > +       /**
> > > +        * @init: the provider's init callback that allocates a
> > > +        * &struct panthor_devfreq, adds it to panthor, and adds a de=
vfreq
> > > +        * device to panthor. Will be called during panthor's probe.
> > > +        */
> > > +       int (*init)(struct panthor_device *ptdev, struct device *dev)=
;
> > > +
> > > +       struct list_head node;
> > > +};
> > On mt8196, we have performance-domains to replace several other
> > properties: clocks, *-supply, power-domains, operating-points-v2.
> > There are also quirks, such as GPU_SHADER_PRESENT should be masked by
> > GF_REG_SHADER_PRESENT. It feels like that the scope of
> > panthor_devfreq_provider is more broader, and at least the naming is
> > not right.
>
> True, though I'm still not entirely sure whether mtk_mfg needs to do
> the GF_REG_SHADER_PRESENT thing. It's entirely possible this is just
> an efuse value the GPUEB reads and then puts in SRAM for us, and we
> could simply read this efuse cell ourselves. Among a list of questions
> about the hardware we're sending to MediaTek, whether this is an efuse
> cell and where it is placed is one of them.
>
> If it turns out to be the case that we can simply read an efuse in
> panthor in the other mt8196 integration code, then we can keep
> mtk_mfg basically entirely focused on the devfreq-y part. I'd really
> prefer this solution.
>
> However, assuming we can't go down this path either because this is
> not how the hardware works, or because MediaTek never replies, or
> because someone doesn't like reading efuses in panthor, I think
> generalising "devfreq_provider" to "performance_controller" or
> something like that would be a good move.
Yeah, let's see what MTK has to say on shader core mask.

Another thing is that panthor still requires a "core" clk. Is it also
required on mt8196?

>
> In a way, the fused off core mask is part of the vague domain of
> "performance", and it'll also allow us to extend it with other
> things relevant to performance control in different vendor integration
> logic designs. I'm thinking memory bandwidth control and job scheduling
> preferences. E.g. if the interconnect tells us one core is spending a
> lot of time waiting on the interconnect, maybe because a different
> piece of the SoC that's active shares the same path on the
> interconnect, we could then communicate a scheduling preference for
> the other cores that have bandwidth headroom even if they are busier
> in compute. Maybe this doesn't make sense though because interconnect
> designs are fully switched these days or panthor's scheduler will
> already figure this out from job completion times.
>
> If any other SoC vendor or people working on hardware of those vendors
> want to chime in and say whether they've got any other uses for
> communicating more than just devfreq from glue logic to panthor, then
> this would be a great time to do it, so that we can get this interface
> right from the beginning.
>
> > Another issue is I am not sure if we need to expose panthor_device
> > internals to the provider. mtk_mfg accesses very few fields of
> > panthor_device. It seems we can make the two less coupled.
> >
> > I might change my view as mtk_mfg evolves and requires tigher
> > integration with panthor. But as is, I might prefer for mtk_mfg to
> > live under drivers/soc/mediatek and provide a header for panthor to
> > use in soc-specific path.
>
> I'm not very confident it's possible to cleanly decouple them without
> inventing a bunch of very panthor-and-mfg specific interfaces that
> masquerade as general solutions in the process. It'd also mean I'd
> have to duplicate all of `panthor_devfreq_get_dev_status` instead of
> just being able to reuse it, unless that is also exposed in said
> header file, which would need a better justification than "well there
> is one other user of it and we're trying to couple it more loosely".
>
> I know that it's almost independent, but unfortunately, even a tiny
> dependency between the two will mean that mediatek_mfg will need to
> know about panthor.
>
> Other things needed from panthor are the pdevfreq->gov_data, and
> the panthor struct device* itself, as well as stuff like "fast_rate"
> in the panthor_device struct.
>
> In the future, we may want to expand this driver with governors
> beyond SIMPLE_ONDEMAND, based on the job completion duration targets
> we can communicate to the GPUEB. That may either make the driver
> more tightly coupled or more loosely coupled, I don't really know
> yet.
>
> One advantage of looking to completely decouple them (though again,
> I doubt that's possible at the moment without questionable refactors)
> could be that we could also support panfrost devices that need this.
There is also tyr, although I don't follow its status.

I can see the concern over "very panthor-and-mfg specific interfaces
that masquerade as general solutions" or "questionable refactors". But
I also don't like, for example, how mtk_mfg_init_devfreq inits
panthor_devfreq manually. Beyond initialization, the remaining
coupling comes from that we need panthor to provide get_dev_status
callback for devfreq_dev_profile, and we need mtk_mfg to provide
target and get_cur_freq callbacks. That seems like something solvable
too.

I really appreciate the work and I don't want to block it by vague
concerns. If others have no preference, we should start with what we
have.
>
> >
> >
> > > +
> > >
> > >  int panthor_devfreq_init(struct panthor_device *ptdev);
> > >
> > > @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *d=
ev,
> > >
> > >  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)=
;
> > >
> > > +int panthor_devfreq_register_provider(struct panthor_devfreq_provide=
r *prov);
> > > +
> > >  #endif /* __PANTHOR_DEVFREQ_H__ */
> > >
> > > --
> > > 2.51.0
> > >
> >
>
>
>
>

