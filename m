Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68273FED3C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxbBEAEmkzXg8sufmQelLSZfpgBcx3HXgkzS292cULs=; b=nVEFgOZcxleS9A8jJApgbXpTEJ
	qSvRXS2wWh8PjJM1GkYcfsRJlAvdRR7Xv8epbzkUrFBx1KIWp/nd//V03am7HcZ3tbILPzRL2OvGJ
	ZswBjAO+VBLTO4QT851WLlB+z7cmKJeDxKspxkSFG+V5/7/InQTIKvjIdYeK9eR/EMekFzy1d0MRo
	+FYE03E3rnVunJ8QygWb5NiAQHDfa2eztLJ8F8JooJzgju06PtuTG81Nvn+faFmMRjyiSZ2Tui7JS
	je3bSSTLLq4g1seryJJpiUhJh7NkadYGB0Ap6aAry6dnXXdbVqlkLJ5FU830hDHh2mr+03rtmWBm1
	OH/eTECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGt0-0000000DH1V-0xIN;
	Fri, 24 Apr 2026 13:48:02 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGsx-0000000DH16-3eb9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:48:00 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso8556181a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038477; x=1777643277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxbBEAEmkzXg8sufmQelLSZfpgBcx3HXgkzS292cULs=;
        b=hl+MRv2+JWlrNDdhyrTcL0n1HA5f2ZTvJKnBJshnE7KfIsfUHjT3qLh5HPeFWv0Oh8
         ea9CWKRxT1nL4u9xcVxIHSy9ajO7qlADILQjAqPPvXKHHX4idf5pRwVfGvKt+cY+PW+l
         kJdUpSk5fp+uq6MWOtkhiyV7PCyygizpwJXiqn+qnykDuNxGjtEE9uNKURrUJqXf+VB0
         nQu4j0oRRjJBsek8f8Nqn0dizUK95csLX5qRt3t+0zXmr9KSVUj52giOwsnODHITBrH8
         tufnL9aZBmjAiMVuHL651XjuU8GBVoWA5M7rkhNX3VfRZPAjiUHc7qVw+B+7GDlt3coP
         +qRg==
X-Gm-Message-State: AOJu0YwIacQgk20E+35qC4ORs9itZaS+OmCkmj7B2JGOEfgAMCrkGWM5
	Qe85Jp4mmqWrGQfSbN2MJfd1MtE+P+7Ai5MBKOuAX8125fr2/fn+LOKTghNchNETpwA=
X-Gm-Gg: AeBDievb2X/V2oNcKVtAkStL82jgZzV3Eutu+dvOw9miIr0pxP+Z0gNcchHV9jriP9A
	6TSrSvTaqZ/4BwQTkJwag3ShaWtYn/B0Mw42WcMfxek9KmewViprDBRfkjQQPVRAll8qHI78Njc
	TC+qMu0Xv/VTUfFIb5J5OhXxRHHpkbCZCiqxANvcYLKP+xTUWNyUsFWLCccjS1znC+sEakE3uJz
	o8iZbKicUAephDkVQ5REYTgpLsqNgVY6Yz8vIkQqIWN3LuVWL+y5zv5cCACjNCwok/2WUxT3AAe
	WzbL2tEFW7s9wQpSUfEh1lLLUzSUEK+G51RsIUBUlcM2St6ZVfva+JoiuAENOQKY2sxCWXCL6G5
	M2WgHbPYyGDocd/b76gIe1dkxTqb0a1wGY0jgqXxNdTA3YlBACcF0oIJ8P0gvWZG9c1CxbvSJIb
	IJvE3sSiqXdnVhH7CI6nN1cqLJqUNiMu4VtH8rxoWNokomFbxP/B8lRVGAxS3vxl7S3WTz31Qew
	KQseocVrw==
X-Received: by 2002:a17:907:3e99:b0:b9c:9dcb:36c6 with SMTP id a640c23a62f3a-ba41b2e4b11mr1472211066b.47.1777038476855;
        Fri, 24 Apr 2026 06:47:56 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451ae5f2dsm763042066b.21.2026.04.24.06.47.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso8556133a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
X-Received: by 2002:a17:906:f593:b0:ba5:234:13cb with SMTP id
 a640c23a62f3a-ba502347802mr1522477166b.4.1777038475099; Fri, 24 Apr 2026
 06:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
X-Gm-Features: AQROBzCeSX9qxN5yqtzC3-PAZZnXar2rEL_AsOuEwJq4ANARfzjj6L8MVrx53_Q
Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: renesas: r8a7740: Describe coresight on
 R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_064759_941712_D13DEDCE 
X-CRM114-Status: GOOD (  16.37  )
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

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile A1. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

