Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106D5C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XN2yiAXGrs4j4CPQfUE6cOAJN86qtVnsMhnJLeMqjm8=; b=BB4a8XJ4jduSnDN+Fm6KZiNJlc
	4R3xjzIFmOHdErF2W95FCPKQVqcBHCko3DJvpNa/L161B3mLp/yGsZOFoLKsAEXDlMsaR24ncBIyC
	hAo83jpfoFFoUt9d4t20Req1omstppcGl2COxpr8mWJPQOoEHfLVAMjBJ3yg+prYhjXjNjMNm2djU
	iV0FFRSByRoIMjQYrb4aEW70cMLFRMVx3sD53g4Wj3qAKHrR2xNjBdx1s47QxNjJTaa0WnJ6XC+HO
	cDUnNUuxCv0STL4O92n6czIC2gUHyqpz1AG4itKuvaIAWKc6cGFKE2EGLZckLftFopnWgZKRqh21r
	BiZBooMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visSI-00000006veP-3JUT;
	Thu, 22 Jan 2026 11:02:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visSH-00000006veF-0xrm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 11:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XN2yiAXGrs4j4CPQfUE6cOAJN86qtVnsMhnJLeMqjm8=; b=APsuxDdSEOqe0qyZMFvxgKY0oi
	pSx6cmcAaGzgTR9gY1aBML/6hzitTTl2TXv0Ei9TbNAigTQKBbZZLUO1MXY/aLwRr07fOymrEj3fs
	3CCb+JTxAkjqqBedYg+sKsQpKdKL3odwgEWUGEm3wMnjqiuiea3A9/iZ5lxjtEhBhdDOFftMHdGHB
	cfPz81oubpYTvBkVcmPlqLh2bUj738nw7cYx7XqjHxfplMENEqI7AJcjY4pAWxizes7eNyV90ZRhE
	DtzGW5ohw7eHxlwOlF3DnpFOkTSx4UsLwBM8EQqjfVaPgccGYNuTcOnBm/fSTjY6exi8P8wqjIrAJ
	RGNm4yfA==;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visSA-00000000CC1-1EfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:02:21 +0000
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5f526c39718so770349137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079736; x=1769684536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN2yiAXGrs4j4CPQfUE6cOAJN86qtVnsMhnJLeMqjm8=;
        b=nkFWj66mnkMNK7BU/zxQghkcrc1z8x2oncfH9CHgYLGdVOHRSM2gfHCzsb/eGGsFQo
         HRcFMdwQZUqoxwbECAJZLdwBvdg5LVcVIww7+FzaRs/RfduCX9LCFt2RfrCHCGGdeS3t
         sBbfa74uEEsesm7ZliwmBkrSyu8PkSBqy71bMRPEX2fDfAcBxw4p34wyAiWltdsHEQAV
         rAd4ZmanJX7uTkGgU3two+Zrvpf0f2Xb2j696Mc6fJ1JCZwOzPExxGZzpdFd7jV5GT2P
         lkC7zzay5YdhiRa6OmK9zGj2E9x0CsS+k11YNFqkz+hh5RzSKunLfSqR05i2jhRd/BI1
         gg6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUHY4l5Rx+0SRze4DVnWhcwBkj+dy5yiyKqjmlWHqjkA3Wof+o4y4+hb6hn3njF/tKzoTvy67im2T8m0E6Enf0@lists.infradead.org
X-Gm-Message-State: AOJu0YwISRF456OgkpI2ZR35XwOe2x4Rsgxe/aq1B3mH7kmaBMSrBcmd
	qoP1ND2FprWGfd2l9tV9OpRFPSJbdXEHWVMHyBC4cFIgOPxNuqHX/MkQA0XXAC3/
X-Gm-Gg: AZuq6aIJmCMNgT/0iC/0Dc1hOds+c7Y8NbLpBJ7Y1Uq1yGyiv2FQuQnT1hD0LtIgp7c
	vxE3ED1mBi/9uN0h41F5fOt3gs4kOJ6fiwQ9Y6eih1DhT4KZbJhIMZSCrmkN+v+g3pAIk3kiQyW
	OjDo2Z96TUxFMkWHPGYw/NCsRZSPje5YVhEQrtPvsfqdJ6Ua9iLV/qWUASzSXlX+4KwBXiN4y6W
	2YDh3bxK2D5RLnDWdK9zb8RDc4z55BYLtgb0a5UJwWpFHdFPQPzXaxfKOJkN2ipLTDzb/nbFUEs
	0MxCMStxgbqpeoUXPb2v5sz9Xm8qgJ9zbDKBzYN3c6UL+ilR6+l189z53Pj4JmXkZDaEFkLM3S/
	fPn/cpv61rJTSDjMxrj4hTv/vP9PrgNqd8dPS64cTaMP+lYKi1KfqlxPI7f/f948nRU4FzXopAR
	NXpfR+dBqiCQWEPkHaLnAXKGUIy6LFQ2HvPl9oUxBISUV00gM1
X-Received: by 2002:a05:6102:3f0d:b0:5f1:c4f0:21f9 with SMTP id ada2fe7eead31-5f50a87e2bdmr2788490137.5.1769079735996;
        Thu, 22 Jan 2026 03:02:15 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6e5ed53sm5502627137.13.2026.01.22.03.02.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:02:15 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94130b88642so555593241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:02:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUj7m5d6Ji61iPlNd3vRFsPXtnbyTy3hFW8hCc/Q6aOywTLUbYAkZ8KxKcu/ExUNK189uqzXvi4HvMI4YYXHyGD@lists.infradead.org
X-Received: by 2002:a05:6102:508c:b0:5ee:a7e9:f14f with SMTP id
 ada2fe7eead31-5f50a9d42afmr3220059137.28.1769079734911; Thu, 22 Jan 2026
 03:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20260118080304.2646387-1-thierry.reding@gmail.com> <20260122-hidden-goat-of-excellence-a43b9f@quoll>
In-Reply-To: <20260122-hidden-goat-of-excellence-a43b9f@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 12:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
X-Gm-Features: AZwV_QhoOgi0chLJd-7T2xDzJCkVV-FejdTMGfxiem0V0-g6G9b9g8xnxTjocjU
Message-ID: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_110219_810083_5FF412EF 
X-CRM114-Status: GOOD (  23.98  )
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

Hi Krzysztof,

On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
> >
> > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> >
> >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
> >
> > Thanks,
> > Thierry
> >
> > ----------------------------------------------------------------
> > dt-bindings: Changes for v6.20-rc1
> >
> > This series updates various DT bindings for Tegra architecture,
> > primarily focusing on schema validation fixes and new feature
> > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > legacy warnings for Tegra30/132 display and VI interfaces.
>
> Same comment as was for Geert, I am surprised to see DT bindings as
> separate pull and I see drivers were alerady merged, so I will defer
> entire Tegra pull to Arnd.

The soc tree used to have a separate branch for dt-bindings.
Hence several soc submaintainers still use that split for their PRs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

