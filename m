Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCECF8D75F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9gNtLdocXB8kWkdIM6h2vfikY0DRDzC2RZHuEpWRyQ=; b=3IYIwptgKgYOkrRqyx2TMOjQFZ
	tRACRe7rkrFCKz7WDmd6Et9Bw/3tj71ieo+RzJsLzb7CKJBFfEp+aymMp2f//C68RvIV6o8ybeoVN
	ya44WNWCkVOpshrpiI2tPfZeP0pymqTpOKySPv5AjrGTto1veza/Gkl0NJgHYTwL2T4ki/BjmITQU
	i5zF9f1cPMoJMM2pfxUfAYgwsCB3p5km8Z2JiWnuQA4wHjeE4QzrqetrpiEMkGgZhO1/ricIWXBh3
	uXrmoZajAynDlMZp//7IhHZ/2rewCifyYlns5wl/DXoFpPMz8u34HobfUjWj9KZvAw6OPvBx8n9x/
	Gvid9DZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPN3-00000002ekg-0Gj8;
	Thu, 16 Apr 2026 16:15:13 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPN0-00000002ejz-122A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 16:15:11 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5674d8be45eso2579889e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 09:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776356107; x=1776960907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9gNtLdocXB8kWkdIM6h2vfikY0DRDzC2RZHuEpWRyQ=;
        b=Iyir4mwpN8VII389pKavRZ115Z/cl8XtDkNNVlPW53+ggDK/iGVaPwJo0yBIp6Ribs
         ebz3Uxb7VAkUNQqiePsoGHfMHHctSsNc5f8yKUYtAOVhx48MaRTP9dXExaTE4JEu71GO
         FcZZQK7UOystW/BDIfTqQMej3AIATpj3lvZDU3NYfsHO/XntMXt8l79uFv4Glyu+/Awm
         2hArjFwjdGBAAaW9j9H6BxFt28lveKmvaVrSLsB4rqyChmTLWB3rUy5ovhA5+TegHgwU
         kbFT4Dyqa1Nl0ZE1SC7yESa0cjrlSt4oCseQ0oqKq24+6ZBuUO0ACzkX0kKGDnulxmbM
         29OA==
X-Forwarded-Encrypted: i=1; AFNElJ94E1QmT/Qs/LJt5kgi1cgqqGcJ0A99gqqYxiFxGN65vB+jjPfXYJwXn4AS3ORaH0dhYcjYGnkyLalmyJqaa/GR@lists.infradead.org
X-Gm-Message-State: AOJu0YzuJ0ZOS2DxkmOWN2aPxbjQUBmYEkEeUrcwmlNXA7ky0SMXAFFZ
	GamSNHR2WQHACJMrX2IsygvdVAeKV6byiEEPR3W9OgWdfNwFxW/RELXpYyL6XJCY
X-Gm-Gg: AeBDietiR7TbMth26Puelov3PQhfTyWc+d6AC85LKB86BQXxxzI7XdRjJcG90xBlVnp
	1pvU0rCj60Dgnx6bzoJzVuIm3QsiE7eWBBUksNK0zlOgydBwhLV3ImsIq6Bs0pYqP+2nnS6eCGv
	XhFf9LOZ7rARYO/OoLgywxbXcAmmZZ6uqsN1ZqPRBtxEFCeJ3uWWv0VsuLLFRe7J1PmHfxyLPHF
	Sp2DZj0Twhy9DWzLpD1Xnb5v4sAZo04wqR75cJsC+H0SKZJaOf9AfAtFChIkZGZAAXgEcfNzwjD
	98rexiIaFnurhu9XoJmaBrzdjAnsp2dTcPg3d0TEu1HllEnhncrjKMMNPJakjPcE5En4HsPrwOC
	TWuD/bqec4/1woK81sK2JAx87y92Amd4kAfO6pXFLIwCCNu0DLesXJ1r7+G9Gi8bsP9uLhoM7Sm
	nLywi7GuxAYZO7uX4uRxwXiSeVLdJP8x0QLI+MLCeCi2zVZKW5lHE3xVGq1i27c/kam+u7Uh0Wa
	ruGCExN7qBhvQ==
X-Received: by 2002:a05:6122:1815:b0:56e:f1c7:cdbf with SMTP id 71dfb90a1353d-56f3bca6071mr11693500e0c.9.1776356107145;
        Thu, 16 Apr 2026 09:15:07 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95888170a74sm213131241.0.2026.04.16.09.15.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 09:15:06 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5673804da95so3347017e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 09:15:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HzmbacOnK+b0+jiTOepMHWRLtcY0GuJMyHGfCocyzu8rWNHIZGUr6Dyrnj95A3D3qAsQwCpX3F9ruoVYEWweH@lists.infradead.org
X-Received: by 2002:a05:6123:10b:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-56f73003aadmr7479196e0c.10.1776356105740; Thu, 16 Apr 2026
 09:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
In-Reply-To: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 18:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwTQKrWx2rj9ex=a1wcVc_GVN6ii0Tk61-BHgT8wB7mw@mail.gmail.com>
X-Gm-Features: AQROBzDtvYul6C2R0_nVVRWBmwsQihnizqmUiq_xTAHZz4o6U9w2tkR5DOBzIv8
Message-ID: <CAMuHMdVwTQKrWx2rj9ex=a1wcVc_GVN6ii0Tk61-BHgT8wB7mw@mail.gmail.com>
Subject: Re: [PATCH] arm64/hwcap: Include kernel-hwcap.h in list of generated files
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_091510_318346_5929912B 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, 13 Apr 2026 at 17:46, Mark Brown <broonie@kernel.org> wrote:
> When adding generation for the kernel internal constants for hwcaps the
> generated file was not explicitly flagged as such in the build system,
> causing it to be regenerated on each build. This wasn't obvious when the
> series the change was included in was developed since it was all about
> changes that trigger rebuilds anyway.
>
> Fixes: abed23c3c44f5 (arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps)
> Reported-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Just noticed the issue, bisected it, and found a link to the fix...

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

