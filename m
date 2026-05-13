Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94552CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7kN1iIudHNJUvL4pmKJBVfs8sJZ9FSxEHa1dgQM7WA=; b=Pne1pBDFV4/2Bi+l7dig+BdJk3
	1OvsKnou0PHP8K5gIomZnA8Z5wwfQ+a820hLNN4Yf8P6HK2+F60qDdmwHbZdvWMF6AN7brPVruFd1
	t9V2htjE3ml/iX3nyVuh+dJYga2ByivdekqyfInglynzDb16KXbRHz+QR8lO6ITfG7VTSiKTCAmPf
	C4ruIvsLWMcNC9XCEMVWQ1vzyV7idiL2F5qtRereBbiUqKQCxWeBTcYvj1xZXI0UHS0PufvNKbMKd
	pQm8OK4mnznlA/Vbip8qW++4sOGJlA+XkCWwBb9Qj7MqwRsDky7r6+nDdF4BiuWiJSSE3likhBhSd
	m/VPUviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9OE-00000002ceo-2SSk;
	Wed, 13 May 2026 13:12:42 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9O7-00000002cc9-06AJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:12:36 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso2371995241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677953; x=1779282753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7kN1iIudHNJUvL4pmKJBVfs8sJZ9FSxEHa1dgQM7WA=;
        b=ZGmFZC094zKcpiru2QFZOf4f5ek8M1QrtHSDZGDlkjZrHaDgaE1+BLsp7CuJc/2Ufi
         DTBPp7+C/aZ80fK3JJve9IJSLTgMcUDyGJaNxTQO2ze8UgSUgUddt5WpeCbbZGNncy6N
         c6nCygPOPax7ZN4jGXjMuDVosPRQuSfViSNF5TLt/gEMMMBhCJkAA2Q9wl/C9xg53mWW
         fXkH5q8LW/DqGYHhJ+1mAh0tFKuBeLQK9oZxmCgeDmDMfpKAseDFTm2r2OpiCeO+SG2E
         xeM1npqMfGte/zN2Up/GBs3FVz68nNvZY0uYiLhiIwzLheFxMjmAU5gafrl0wvDH0oei
         zlhQ==
X-Gm-Message-State: AOJu0Yw747BuRiLb1/UW2whByFd7vwlc2CxhGzS6NUpIrYwtiHrUQCYM
	qQ46PpHEmSEQAdPbemfBGxMBUZDrI8N2kpTGGMengENFA/YPqPkyuqB2o0MlWb1d
X-Gm-Gg: Acq92OF7/4NG0nSAjpbxpOJ0WJTjwmerG40xdpmkmCX7Mh32UhRH48p3UOXvAwJGic4
	j8HfMnW9Pj9zYi2i0ejx7cR5APEvguYm1M4EvYSDIFIrXbXUNEMOSorJPLtwAfFGNmI8jUdcMqY
	h8uwj6q7yJGAJB9ha+Fq3MFpE4kWWrzUB7rcCso2FnxC1OJCyX/nsSfQKZwii5Nh/2ic6bCg4S+
	DH4CLBUzEVoWFGz+2NRtfSIC+P0+zN0Q4C5SvXsi+oHI2HnsrM1ZYchf3LyIqlKcZXahTy2cEXH
	gl+91mP0+LU3YFpYIrXFn41rGH39Tj6H8oizl4mMFnWpBwvxIcHV9YKQPoPDLj4Z2ofSLmMGz2K
	CkGVOnE9lmaY8YIP0daQsNA5gM2DTwtbroygy5xtbgLApLgQK8g1eudIEMWY4oNvTFiQ8uG3rLz
	Vjtp+kUAomvU5t2wqrSW+mauo2AFB2tCjR5aDDKwHSD/3v20JLaW/c57660aijQG/V/Db5MWM=
X-Received: by 2002:a05:6122:7d0:b0:56d:4511:9367 with SMTP id 71dfb90a1353d-575e833b848mr1067315e0c.0.1778677953334;
        Wed, 13 May 2026 06:12:33 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6c6d4e8sm24220603e0c.11.2026.05.13.06.12.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:32 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6314a0eefb1so1647837137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:12:32 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:631:3821:2f12 with SMTP id
 ada2fe7eead31-637a90e2a7cmr951105137.16.1778677952636; Wed, 13 May 2026
 06:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
X-Gm-Features: AVHnY4LeEF2c4Mc4gMH6K1pQiwZCCHRxKdP-2WPlZmXzSxqkEXKWG-8hJyRfniI
Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061235_065341_DED18B02 
X-CRM114-Status: GOOD (  17.92  )
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

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

