Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A953BCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95UeH5Wrdj2nWFDACiTCmJA7K9iWHeQl32Wj8GxRyR4=; b=XAcXAL6bcaQsm9N+RE1K0f1h3O
	okJ/2acvK9fbAkq7n4tuUKniaQipOv/OxQQeZ2A2Yk+H7Xm4nqp/ymqPCvNkqNGnOR2KzWWJjGgDX
	Tbuf2eETKIJ2ntsvVQMo5bpZfHh82p2KLbAvQdaKGYRdO+F5Tia8Th/H2ojmLM9KQ1s6TA+XW1YHD
	CGjA2t+vlwcmlfxnY8WpMMCVPbT8iFsHB56u3rdPS2i7kIhI5k/7Q2WUGZ8Dda/cMuKt9Wm6ViH/t
	o3wkfyXMgYNgPmnpv6eooyQSBYPt/pQWvKGHDGIV7sAttWHW+1tGvEvSKRLe5yhWFrzNcPFUSb1AD
	hPluNeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ni6-0000000AX39-2A38;
	Thu, 25 Sep 2025 15:16:42 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ni3-0000000AX0j-3Tcd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:16:40 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso402217241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813398; x=1759418198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95UeH5Wrdj2nWFDACiTCmJA7K9iWHeQl32Wj8GxRyR4=;
        b=Vaj3Xs+C35Eh7zQaCi4oVo9fzjtWC/7tQFUf5jpvNsNCLe80MLqNj7TOBgE4zOB0aA
         tC3dqqvjF+V6xSiMR5se8PCu0aocfkDUW6WO9sRJUp52DTfiL21iAPyBPDBByFruMuOS
         8ZKUvmfpfsO9R1Kl+Jj2vNpzsbr5ERnxFI1l4wyrwx78Qd2zmzGxHtHzVQFSWBVsEV3c
         uXIFpkmqEIq+qg4nJRY4IPC3sZ7dW6bmlqViqBVz3LDeqyrGDmaUhdfWxYCN5QYE/M8s
         3HSUBy+q9odakmOVkxHoWvSLJ0lbRSpUTZt2lxneVlxwH5Zie/1W4r2w7GnujM3F9XAq
         fSEg==
X-Forwarded-Encrypted: i=1; AJvYcCXVqACPxyZRUsh45CYy0vFuhRRslWE9HD33gqrQ2NbiF6CpADy65sgOTrDmIVHogBrGS9A+TgB8+M/lj19rClYC@lists.infradead.org
X-Gm-Message-State: AOJu0YyLOjFn/mNfW9QwqzccykeuXMmh+fViSvhsAJAG3N7mtPZCWXe9
	BO4yGrr8DaGMmlh+WNkYkluW/bpWmzVnI/zYqgPhsUJLDrtvES0N3XrxEkZV726o
X-Gm-Gg: ASbGnctVawJ2TgQTa8VWB0LZQEV1sxGT40z926Dmz/hhauv323r2rm0o1TSmbxS+sy6
	rWHgyqSKB19rHm9gDuXLSYmiztD3/2697eXz3ndxJre8iE2olLmDRO3lBH1y7dv9JG1T7mC8rew
	JwuBut+k11XfWPMnspa+yS4hN0rqtBBTcqloBI2ZEkmYqAOqSlVtTkgmGcVDkXeeAVbdwnAXOxa
	i+XWop/3ygMcq5ptqGAaLcjvHyYaqxAwM2jIhuEaO7PeETvc6JUr8j7mPq/Lnu9Ir9Z0+cdpnfG
	PzAGHKAliOH5tyukJ9W077o1Q7/BuLt+oc/sGj6LSVvzaVXSblBq8BKT5D7senW37dhfMr9nMoY
	kJV3fb/rWMGpVyhE++6fMWPtLpUIyQ96SgMdcHjjecPt+buxNCx3bD47JanZ4
X-Google-Smtp-Source: AGHT+IEzC3HdgJHsph5rb87JWgzS4AKwHqHrWHXGSC11fByhtp1SCar1Lci5hC/6ik3vbynFVKcEuA==
X-Received: by 2002:a05:6122:ca2:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-54bea25c24amr1751624e0c.16.1758813397745;
        Thu, 25 Sep 2025 08:16:37 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54beddbb84bsm434040e0c.21.2025.09.25.08.16.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:16:37 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-52e6037a484so324238137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:16:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+eirV9fbKqUK4SC5radDdrvPQ6lMCOwQLZZqNSukP4UIAu82MO47FFFFTJpr5qguIP8qjg7KFwTMFt4xDGvPB@lists.infradead.org
X-Received: by 2002:a05:6102:d90:b0:59c:5e29:dd8f with SMTP id
 ada2fe7eead31-5acce75ae4fmr1755148137.26.1758813393977; Thu, 25 Sep 2025
 08:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org> <aNVbEvSRCpQSXT4W@shikoro>
In-Reply-To: <aNVbEvSRCpQSXT4W@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 17:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9N-Q4uJXMKg095LD-mFvZv_yU_5jppZM6TZ3xh08zpw@mail.gmail.com>
X-Gm-Features: AS18NWDEqoQdloQzIjh0wjgWDVcokcQ2jeIfuog0D3JY4DANF_f6TtXyGtHRpVI
Message-ID: <CAMuHMdV9N-Q4uJXMKg095LD-mFvZv_yU_5jppZM6TZ3xh08zpw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_081639_868063_B281D788 
X-CRM114-Status: GOOD (  20.29  )
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

Hi Wolfram,

On Thu, 25 Sept 2025 at 17:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Sun, Sep 07, 2025 at 06:10:53PM +0200, Marek Vasut wrote:
> > Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> > Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> > been tested.
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> As the dependencies are in, can we have this patch in -next now, pretty
> please? :)

Only after v6.18-rc1...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

