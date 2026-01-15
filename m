Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9DBD4116B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1p2XoRu+N3MN1gMwzSh5wyB5gfaCBHLjeZ1kZTlyHmo=; b=nvMER04A//P7SvBCmLsEdABpgm
	TfKp7pmHv/sBhP4jUowHa+g7p1D6fWHgwmWGQiIMOSq/1CMs5yQXCc82RbGNewU3gUK62c2VlD/2V
	vFEpwMNWBkiEQay5j3h/tnCCUIRRG+rryJUz1tLwG40ugR1aHfYDMYvZjAASOayjFBznotJaSRwx5
	WCFqM3G+DSDoJ7Xnq78Jw/PcqljMOWxHKaf2FFlrVXg182KHsIV/sObZLIburhqZ7kVCQjYpp7Olu
	k3O/G5NtbuolKWgHo41bDqREbTYw7emEAwX5zn9+KxTba79bmrCxwRIE/Gbcy8fjQvpi5VWSBV0Yn
	xoQYTtqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKmB-0000000CARp-1Mco;
	Thu, 15 Jan 2026 10:40:27 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKm9-0000000CARV-0V4s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:40:26 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f5905e60eso483219241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473623; x=1769078423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p2XoRu+N3MN1gMwzSh5wyB5gfaCBHLjeZ1kZTlyHmo=;
        b=WydX88PHlFPHLho3uGSN4vrX2BmJCFsJS0KkQWc5XuwsHM7xFVaja0Zi+F7hJgQZe0
         pwUoK2sY1MFjlPzcQkRaaGDxtP0hWucoHe56zzGLY1p8DBmOID0V3UMuBmtsxUVRnd4n
         xlIGjiksrt8Kj2Dnqfg/E+44phgKavwp/KxxbFo/hSaWMKNtyI2z/v8nimRRLaLLZpYf
         rwjD/+tYpueI2ETuW1LxqP96/aunjLcSiyaC0f3rS/vrNt6tFwXK6x8uluFONXgDXSZ/
         MJx0No51t0VlofsNqHe831oDr1EhdjD8O7AOIR7jCmg7JFTAcArQPrCJkL2oy7oYapdB
         Ko7w==
X-Forwarded-Encrypted: i=1; AJvYcCVPcBMTNnfy1dwiGJDvybh6/o72JpBxO19jha5AIgpM/97phnz7b5+qchIIqZuJcv27iC/WBgX3iI8P8H22F+yC@lists.infradead.org
X-Gm-Message-State: AOJu0YzrEt3Vjr+E9qFLRg1iYKN2sckiI6VqXiJY/l5E2MYHSgmOvd/i
	65VygUllMS7qogCYKICy4d98HWYPLSE+2uJr3h5Nc181kTQT6lUkF7dCsB21T78Jo1w=
X-Gm-Gg: AY/fxX5mQ+0awyYw2r7mxgu35+Gv4Gg4XoYunxm8Y8z8bURMerIWlkLGPuG1dMrczHo
	1gPUwk24FCTUn779Ydeyku92f1YEkyA1wUkoaJuJCXj9gVg5qjpZgIUu6mAmOiDIQkYdmX0V5Jx
	Nj/UruKpIlnM/t86fIF2AmG+UrZm4RDpSNWR5KNmOph64KDbGuadz6jn9Q5hnE0e1BK57aVNF2z
	rlLfxmaxIDOJgBMppRVykp+A/4mACojDBoZq/3+d4W8/Fr3l2VxM1bDhQZZHyvyO7hguKsT91Hj
	ncmpIqPnekrS2gmwpHypITKo23xXXSpQR2zC1GbnP6EloGXuAW+6HKro+6UOIXUYV8MVj+XBjc9
	5/jKo7u2A2K5F264RqtKkMApMY8xNR7IYABwp/6hCHAJ4U3+Zk3OTKhDHG44AYe+zAtIGufqbMT
	eqQAyFWtddaYVH6BfreGh1usHd7IDTo+vVOIbRk51lXPEYL59Cxq9F
X-Received: by 2002:a05:6102:3754:b0:5f1:6c5d:9b28 with SMTP id ada2fe7eead31-5f17f44450dmr2524459137.15.1768467575899;
        Thu, 15 Jan 2026 00:59:35 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a34acsm24823931241.10.2026.01.15.00.59.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:59:35 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56376c3e866so533213e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:59:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp8W2qUmlmaOI+dCEXEKoB5DqfK90wA9uboUMQtYK8fg3Ior7BSm7jvDX7iobJzVwPHejdmWCKfcTY2BADbXgr@lists.infradead.org
X-Received: by 2002:a05:6102:4b83:b0:5f1:4fb8:6b92 with SMTP id
 ada2fe7eead31-5f17f58c046mr2296699137.22.1768467196661; Thu, 15 Jan 2026
 00:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
 <20251230080115.2120612-4-zhenglifeng1@huawei.com> <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
 <aWZriVlQZ5jRx2o4@arm.com> <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
 <41b7398c-b1a4-4b87-b6f9-07eacf4f4752@huawei.com> <CAMuHMdUuTrF=eN5tMsjmOfWuuT9r7aCOTS7=YP6+KrSdNrhEpw@mail.gmail.com>
In-Reply-To: <CAMuHMdUuTrF=eN5tMsjmOfWuuT9r7aCOTS7=YP6+KrSdNrhEpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 09:53:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxZ5bbkDqib7jyG50YEnKX=KuHs-svMX7-o2SPz8WF6g@mail.gmail.com>
X-Gm-Features: AZwV_QiQCjp_xx6Rd7qqH4UVq_yR09vqEc-Jt_NOVYext6gLSj5FqsRdjfyRE28
Message-ID: <CAMuHMdVxZ5bbkDqib7jyG50YEnKX=KuHs-svMX7-o2SPz8WF6g@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: Beata Michalska <beata.michalska@arm.com>, catalin.marinas@arm.com, will@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_024025_169424_55176663 
X-CRM114-Status: GOOD (  24.40  )
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

On Thu, 15 Jan 2026 at 09:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 15 Jan 2026 at 03:25, zhenglifeng (A) <zhenglifeng1@huawei.com> wrote:
> > On 2026/1/14 21:54, Geert Uytterhoeven wrote:
> > > The confusing part is in the (absence of) logging.
> > > If AMU is not supported, freq_counters_valid() uses:
> > >
> > >      pr_debug("CPU%d: counters are not supported.\n", cpu);
> > >
> > > which is typically not printed, unless DEBUG is enabled.
> > >
> > > If freq_counters_valid() failed, the new cpuhp_topology_online() uses:
> > >
> > >     pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> > >
> > > which is always printed.
> > >
> > > Given freq_counters_valid() already prints a (debug) message, I think
> > > the pr_warn() should just be removed.  Do you agree, or is there still
> > > another incorrect check that should prevent getting this far?
> >
> > I'm OK with removing it.
>
> OK, I will send a patch.

https://lore.kernel.org/a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

