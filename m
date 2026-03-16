Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FC7F013CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZ5ZL3YahQ5LgPO6RUkICWxC/OTnvmWLlmCP38xXSZI=; b=oIxVstdZdcOxEqLPMACxh86rEH
	U7qxiRWmeA4tpGtqWOONvAYn81nj2L5vCCDIkRRG+ZiMoiRMcpF3VLaAgLsTfPTaPacZVQ3L0neme
	KX6+xXP+p/9UEGJOuyGWbcqQ3tceXTqc5PmqcRqkC4treAilST6hqN77Kr6TEHrSkFHJPXzdZSvyf
	CpSDUTF6Fiodp6PuZOYZoP+Xb4D+tiK5NfB+tvL0rwyXLz5xqDsJalIfyUkAv+X6edVUaUx/Avx9W
	KKAXTuQTzeT1VzIeGB2D963uIpWXVGqwfVYkaQUGmng+ED4HingvGHde29QPs0eoRpip07JilAwJE
	Ey+/jM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23AH-00000003Xhk-3t6H;
	Mon, 16 Mar 2026 08:19:05 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23AF-00000003XgX-1uHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:19:04 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94aca174532so901826241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649142; x=1774253942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ5ZL3YahQ5LgPO6RUkICWxC/OTnvmWLlmCP38xXSZI=;
        b=HEMtNfy2Zv/5p5Vw+/Mv7HdxVXgM6xXc9vrI+kfOMRP0oK/q5nxgPOzyWvmtknNgNj
         o1QAmVBr4Q21yXrNCNTlg2fiQK9aIWEqLx/DbOShL0JfVFhfoH8s8SlvTSJj3gTA5Bzv
         4V1fy1zoCs6ijGdEokyEExFQl1pgYGRnEs6Y+qBdbFyRmcDilkM+KdEbU6+Tbw0Uos2H
         gaIslWEYVjKj7/cRHUYR/FjN18mi0oa1X5ZnUj/paH2d58a0F0WfV36TvqBAAbd80jHk
         enrMrDLrKGz83wAkbrn7JgA7f6MC46BpiCVdbcr1k87aFefKlPu9T6VagzuGhRxO7/ab
         Txeg==
X-Forwarded-Encrypted: i=1; AJvYcCU6J/UaHyyCrR5sLQMNFx3UAZM7UWX3cjwnbUQc4unlG37GZNLAd/9xBEbPkIddhWCDCmwsd1l+pM8jkqK50KaY@lists.infradead.org
X-Gm-Message-State: AOJu0YzFoTifuBzzNkY8OzVb7Ilm0JQSYRmP5D+QOiRyESr2Pu2FvdUh
	49W2YLXuujAVd7WvSuyk87iOakbMYwX28oj1T5yf9oMopypJvr602NKjszYJWCEU
X-Gm-Gg: ATEYQzxz0yBecBmWFEq5JlITQ49qIicPOTxxYrkOrGftVDaJi55E3GKpTZ6mm1jxMg+
	p7vmpFDJVdNCU7y58ShgdsVWIY55ITb8K3N5/bRqyG2rr0UVHsjkAq3NGQeSKJXkgF19RRQ5g8R
	WyftkUWQ3LZQAfedTB6tbpQ9DXKh5piK3jDjsiCHVluJasCKPCGYGBB98Vjk3C8N9FaJgUpetTC
	rO5eN1J6z6Ck2ukMHT96RrwN3gsZpvIl6kKNkJgFspf0gp3cor14TFxFHvZqBld8qX14GGqslQs
	O9HGdIJWwFt91yTidQMcvNz4s1YHdUogmeTOPC1qmpr1KpogTL5ayA2mC87wgUo80XvzGHWzvVB
	VOEa35gjIPIs9TA+U8bueeEkPKOxhUhEpye0v5flIy8uIIK47EepMGY7xsDeflFv5Sqy/Wd96K+
	3ijgosnSoo/0t1dMZVL7VGUeLzse/M01fQTWEQM+T+jBhT1yIl0vXe+/QtrfTP
X-Received: by 2002:a05:6102:c8e:b0:5ff:a4e0:1939 with SMTP id ada2fe7eead31-6020e1ad281mr4607936137.7.1773649141768;
        Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601dea9fa96sm6225296137.9.2026.03.16.01.19.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffc6a96665so1047482137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4aOg0/3DYGhL5DF1xoKPNqPeoUH1DGJb7ka1A1I4lk/eOZiHUGAxGgnd+4x+XsOvlN8HYqCYWcyOCeEfizyqF@lists.infradead.org
X-Received: by 2002:a05:6102:952:b0:601:f82c:57e7 with SMTP id
 ada2fe7eead31-6020e5f1888mr4295849137.37.1773649141135; Mon, 16 Mar 2026
 01:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org>
In-Reply-To: <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:18:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
X-Gm-Features: AaiRm52ybkgfdE7QGE94nAnXy7mmjQuKiyvylh7pzD-F9X6Hn2BIVpsA-3r677g
Message-ID: <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_011903_516682_9C74003A 
X-CRM114-Status: GOOD (  17.96  )
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

On Sat, 14 Mar 2026 at 12:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 13/03/2026 12:13, Geert Uytterhoeven wrote:
> > The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >
> >   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
>
> Also nothing explains me what is this, IOW, why this is not RC1. Pull
> request email has place at the beginning where you explain such things
> and I can easily locate or understand the base.

Let's readd the part you cut, which is also present in the cover letter:

> > Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

