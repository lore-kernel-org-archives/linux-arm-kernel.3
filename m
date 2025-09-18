Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEFFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohjdE7vsdp2mFA+MExTFcCWgNEkrk5a/T8KfjfgAz0o=; b=mq8EkCVKgr9lC8x68bin3XYPmu
	EliTdNGEn4TYZOBKm/s4cGIj12Hv4NSebw+bHqyLpCw49SN6TyVEjSHsUNm8C8ic0lXvi9Ya6CjWH
	X4vdzcjtsmf6Y6aG5zN4w9eK4C/t+L/mgnlHDmeqslJ7v2zx6oxS37ObKC9QDL8f3zPl/obvsLeFu
	9ERhC/A+1n6VQc0og8P5aABV2C33Rq6b2Yvjzv/W6yM1W8COWLTAgNNqAh9aIStAABR5wn8Xw3aNW
	liwQxXqqLS1DcA8SlieCOfC5F73KN3ai3AM8rvS2czzDUXalFPA8Ipt2cxOocAFNI1A0I3HUTP8yO
	9Nui9XZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGXa-00000000NB2-3B22;
	Thu, 18 Sep 2025 15:27:22 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGXZ-00000000NAQ-0qok
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:27:22 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-71d5fb5e34cso11529307b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758209240; x=1758814040; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ohjdE7vsdp2mFA+MExTFcCWgNEkrk5a/T8KfjfgAz0o=;
        b=h3h01O4xjiLTeh3H39eDA3W8ejMPEpjXKE3/0/5zZcVLWA0PvA7vPB/REtfCmF4QyK
         /rPju1UGtio9Pv3C5X6oe4wXYS5ZNoZH5bJ7/GYxYyXEYjhHzZVEsq5kGGvIX1NKjHH9
         ow9IBlpEG75GZFjdJw/ucmQk+lWrKGVAuBaBLJMHKiGcDoQSDU3av424ZAe1e54ZT15I
         x12XT4QKFE8LMBQUJYMfDtF5Nh+9WwDjtQiZKJxu89BtiToIGSlMqwTm8jyWGXl4GY3i
         JrSsrWn0DOoALamd3bhFJniulPYUg+39PyDAoQGdMw+UyjW+LbYKwTLSE9lsr2fD+kgB
         iEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209240; x=1758814040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohjdE7vsdp2mFA+MExTFcCWgNEkrk5a/T8KfjfgAz0o=;
        b=JmWSr4KIQ86MsveRG+97h0+D7EvbIJwvkrHAbXJfdqT/2C6XCUmwbcOPpgV3qormSg
         Leih5gyZeSiIkD0LiTO/KsBis7DEecADAD2np9cWcfxJVXaA7WDOh4HDvpnYx3ycyHuo
         P7kLI36SUTt3OWcVMxoaG8sDgTG6X+ma/2fQCNfqHqyrQGGOdu/elGO1UilgBlgPsnpd
         qiGDTPfWmZ7H9qVDuV4vjUcjdMbG8lcsehtyY61o/Z+p8O9wq9X0jjSr//xPB9AXP/71
         zLA42XySAtajkJL93uvV6VHTt4D9DfJ8FULq60g/yC3lBtghhjH3MNk6pe+YzLPtnjQA
         WfwA==
X-Forwarded-Encrypted: i=1; AJvYcCWhzvuicBsxIrk7gS0sZEZS2gWZhtxtLgx2scEhFdNY4KMhIwLaFnjenHuAZ/LwEwIj0tinD3DIBSAISmzBNi7Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxkRFmPWLBjd6VCRSPsgfHdQxwg0IRNeRjE0J9/9OsMyM6TtR+2
	lFvyg4TeryHp8k3nNSmbU0JTnposntXJ4FwT4aqqW3zi/OO2a715yiy0+gbMwPm8jzem1wf6Une
	vCukacefcBi6Bg9BiOoVrUTijK71OC9BbaYiasYVHHQ==
X-Gm-Gg: ASbGncvm0p3WRbgN1JFJajeixz/BnO/mCXBhFdDGca2V22/SEHNbnWaIYhDXKFAbFeg
	WGBMElh9lRGc+Yf1B6M8IhF0KerUaUnnwhUF8r0cJzhnZ4GDV+j64las93nPpX/HNJEL/ArmcUb
	OAM5cWiGxE/tnRQGv/05O9ylmbx25twaaHfIp2jca+I7l0+5wIyIdmADs8mdBLVCZiCRInNlRX9
	kU7+pTZ9QitJXuONDAbSdvNjcQ=
X-Google-Smtp-Source: AGHT+IEQCrv2rBD0HZ5Ef3kA7d83Z57qpN7uwi/iH7ea1Nc2x95VmWRF+4zmzOqyCpcnKa543iKVkH+EZRR/L9nuveg=
X-Received: by 2002:a05:690c:6588:b0:734:61f:2b1b with SMTP id
 00721157ae682-7396eafa4acmr29231447b3.0.1758209239669; Thu, 18 Sep 2025
 08:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <CAPDyKFoi9KcsP5k84cSxuXNuMHmcf3a8emfOc6hMjGm_0FMk8w@mail.gmail.com> <2162077.CQOukoFCf9@workhorse>
In-Reply-To: <2162077.CQOukoFCf9@workhorse>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:26:43 +0200
X-Gm-Features: AS18NWAglY0uDqlAxTVI2SesnRFzqdlGAX0p_bWMYckBiLfd4yldGayxKumI5X4
Message-ID: <CAPDyKFqXVt5rF++GGTRxv6+S-2FevvdMVmJefvfqXkZ2iam1Rg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] MT8196 GPU Frequency/Power Control Support
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
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_082721_263970_E687B58B 
X-CRM114-Status: GOOD (  44.72  )
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

On Wed, 17 Sept 2025 at 17:45, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 17 September 2025 15:28:59 Central European Summer Time Ulf Hansson wrote:
> > On Wed, 17 Sept 2025 at 14:23, Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > This series introduces two new drivers to accomplish controlling the
> > > frequency and power of the Mali GPU on MediaTek MT8196 SoCs.
> > >
> > > The reason why it's not as straightforward as with other SoCs is that
> > > the MT8196 has quite complex glue logic in order to squeeze the maximum
> > > amount of performance possible out of the silicon. There's an additional
> > > MCU running a specialised firmware, which communicates with the
> > > application processor through a mailbox and some SRAM, and is in charge
> > > of controlling the regulators, the PLL clocks, and the power gating of
> > > the GPU, all while also being in charge of any DVFS control.
> > >
> > > This set of drivers is enough to communicate desired OPP index limits to
> > > the aforementioned MCU, referred to as "GPUEB" from here on out. The
> > > GPUEB is still free to lower the effective frequency if the GPU has no
> > > jobs going on at all, even when a higher OPP is set. There's also
> > > several more powerful OPPs it seemingly refuses to apply. The downstream
> > > chromeos kernel also doesn't reach the frequencies of those OPPs, so we
> > > assume this is expected.
> > >
> > > The frequency control driver lives in panthor's subdirectory, as it
> > > needs to pass panthor some data. I've kept the tie-in parts generic
> > > enough however to not make this a complete hack; mediatek_mfg (the
> > > frequency control driver) registers itself as a "devfreq provider" with
> > > panthor, and panthor picks it up during its probe function (or defers if
> > > mediatek_mfg is not ready yet, after adding a device link first).
> > >
> > > It's now generic enough to where I'll ponder about moving the devfreq
> > > provider stuff into a header in include/, and moving mediatek_mfg into
> > > the drivers/soc/ subdirectory, but there were enough changes so far to
> > > warrant a v3 without a move or further struct renames added, so that I
> > > can get feedback on this approach.
> > >
> > > The mailbox driver is a fairly bog-standard common mailbox framework
> > > driver, just specific to the firmware that runs on the GPUEB.
> >
> > I had a brief look at the series and it seems to me that the devfreq
> > thing here, may not be the perfect fit.
> >
> > Rather than using a new binding  (#performance-domain-cells) to model
> > a performance domain provider using devfreq, I think it could be more
> > straightforward to model this using the common #power-domain-cells
> > binding instead. As a power-domain provider then, which would be
> > capable of scaling performance too. Both genpd and the OPP core
> > already support this, though via performance-states (as indexes).
> >
> > In fact, this looks very similar to what we have implemented for the
> > Arm SCMI performance domain.
> >
> > If you have a look at the below, I think it should give you an idea of
> > the pieces.
> > drivers/pmdomain/arm/scmi_perf_domain.c
> > drivers/firmware/arm_scmi/perf.c
> > Documentation/devicetree/bindings/firmware/arm,scmi.yaml (protocol@13
> > is the performance protocol).
> >
> > That said, I don't have a strong opinion, but just wanted to share my
> > thoughts on your approach.
>
> Yeah, I found out about the pmdomain set_performance_state callback
> a few days ago. I've not looked into it much so far because not
> unlike a veterinarian on a cattle ranch, I was elbow-deep in v3's
> guts already and didn't want to pivot to something different before
> pushing it out, but I'll look into it more seriously now.

:-)

>
> Even if it means I have to get rid of my fun array binary search
> and rely on the opp core to do its linear time linked list
> traversal. :'( (But moving OPP core to use XArrays instead is a
> concern for the future.)

Sure!

>
> I've also been avoiding it because I didn't know how much
> additional functionality we'll add later, but I've talked with
> Angelo about it an hour ago and he agrees that I should go down
> the pmdomain route for the current functionality.
>
> Thank you for the hints!

Np! I am glad to help!

I will try my best to continue to review/comment on these things, if
you need it.

Kind regards
Uffe

