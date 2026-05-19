Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5664ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=; b=LIxaA9sFZhSdpsQYsOGkv8aTx9
	9c9iVDaXlrUx9VaRzGnw66Qv9Z8gchPS+zY4YIdxjWN/tq7iSyyGaIq+w7VBTITJ8kDhqnyrVGdun
	kzivw5I/6lSjcco9o+Va0CWQS6nFCxTAegcioe7Wnz6jG6siVjG2KIpaFlLzRPNxgELhP/oO6/aJ1
	Lv51egVf+u/NvVKAdH/ciFRdJYkc2cFMgOicQvg87Y4dCauq0JNKXwFnIfIz+/uPDKD0kODHBq0Zm
	Z/Q02SHtP9Ah7AmCZUgX6v0m/L/7vli86i2RZWVyGgwQ0Og+FGBNZIdxWuhUVJ++F4HvpD3ZwyD/r
	2U2pbpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL7R-00000001lk7-39sL;
	Tue, 19 May 2026 14:08:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL7O-00000001ljR-1Ylh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779199699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
	b=aE85I1IEnE4O2oKp5nl8eEC/acsQphzPp02mkMRpih+Qgiz6luAVurWKNwrEZA9F/mDk+A
	gtjR3e1/nyjAmzmv7DQR/svEgUbhietbJgZ/8gf0PTJ5xug5dE48PntoIyUFR4r2D/BWZ1
	XwgVJjx22EpZPvH4NT058JEtRzH5Ak8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-bt01eCu2MLyRLt9RQ68_HQ-1; Tue, 19 May 2026 10:06:07 -0400
X-MC-Unique: bt01eCu2MLyRLt9RQ68_HQ-1
X-Mimecast-MFC-AGG-ID: bt01eCu2MLyRLt9RQ68_HQ_1779199566
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-696133ef271so9275472eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199566; x=1779804366;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
        b=Km73EnqXXk/iffsBW0O582f+7Iva//E+idbrgx+LbNYMZtVvYZgRYLy/SFeG2lWzFO
         vrh2NecsdpYUfgxleDJejYHYeKRf5EzeMRNS9w3jBj+JyDt2OnNXOANTxkQgGRr7MNXx
         S1IrZPCMGqbtHJtDhB0Fz3NzGmjUCxXubqxE3Ml+prILg1Yk5mScl58aPT2a9XFTQ82b
         Vo6ZzuBEjoiEjiJTKsrOynqTUHMv3Lr/ks5IQ3dOfFdO5cFpax0/oNJaxXF+clWomrRZ
         GFj/rJAOyNOwxDerZLJE1tOO6qbACF8scfdmTAoUw7XgCVc/dQlTWEsP5mp5U1h2Qptx
         HDRw==
X-Forwarded-Encrypted: i=1; AFNElJ9FSejJL65yPzTxIOKG5xzoY0h95vQ31dmv+0eur+y2e8j5CyPdABO2KbDUJ+OHZHfe8d5kUwOMi/hhT6QswCtk@lists.infradead.org
X-Gm-Message-State: AOJu0YyDZioRO7GF4ByOBiLrvNA7da2UsWiXl1+3WMXA73xzYp6+j0dC
	grSKMrWiAeS8JrWekndQVazTdW37Ikt0awN53zJ9weoEx0nMqMptp1ZJRKzXSBIEl0WPwPIi1d8
	eugij/FtUqh+WHfUriR5PCqivaFtv31kSAWY0sXYLvil+99b/he6uwEhCHd37HuSgs6XO+tyUbJ
	iE
X-Gm-Gg: Acq92OHdWWO99ESu8Wbpfno8+AK+7rBgaDXMhOx00fXYrhNqMsQNqCzCmDaypDmVVGq
	LZxyC+e9H7JkSWaOC7riZTpGcFabLIGHEYspo8/IwO9Pq/2K5dnt9EEHHlRdsvYwxlq5NHGXJHS
	IZWhj1Zkk6BsehzWicTgkyh9fnOKZjXQjVtq9893rcrfJv8c59zD2RUoPo/0RU0ezi0FQiy3Qhk
	nfmHMmWPWNRa7IB2kQ2JFyK4ImGM5NXOLruGEvA8gxJXC9STKHdPECpLnn8bXRm4hIRs6RRz/e8
	ieR9G+dv6ArgItkuLG2riMYXVwZWdvhxmRAh9Mbu0vLygqmWoGaU9trDp8RzNIOd3Um/fvjoVhg
	8XKFFNtxyWQLYvTKew5G37YmB6aNVoanv3K9HagkiII5PdADYTQG7Nzfd
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d521da817mr581309eaf.55.1779199566337;
        Tue, 19 May 2026 07:06:06 -0700 (PDT)
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d521da817mr581253eaf.55.1779199565643;
        Tue, 19 May 2026 07:06:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3608bb6bsm91862306d6.6.2026.05.19.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:06:04 -0700 (PDT)
Date: Tue, 19 May 2026 10:06:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
Message-ID: <agxuSsAhreZJVYcc@redhat.com>
References: <20260518221230.19879-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260518221230.19879-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jh7iNe4kARIdxYbqkBc3j6RICvCi2Jj2iCGf0-gdyLc_1779199566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_070822_482690_BB75E978 
X-CRM114-Status: GOOD (  18.04  )
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

Hi Rosen,

On Mon, May 18, 2026 at 03:12:30PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Building the STM32MP21 and STM32MP25 clock drivers then requires direct
> linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
> that compile-test coverage.

The second one needs to be it's own separate patch, along with a Fixes
tag.

Brian

> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Makefile              | 2 +-
>  drivers/clk/stm32/clk-stm32mp21.c | 1 +
>  drivers/clk/stm32/clk-stm32mp25.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 9c3a9703ad92..0cd2223de3ca 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -150,7 +150,7 @@ obj-y					+= spacemit/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> -obj-$(CONFIG_ARCH_STM32)		+= stm32/
> +obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
>  obj-y					+= starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
> diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
> index c8a37b716bd5..3c143371c77e 100644
> --- a/drivers/clk/stm32/clk-stm32mp21.c
> +++ b/drivers/clk/stm32/clk-stm32mp21.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 52f0e8a12926..cc95fac66449 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> -- 
> 2.54.0
> 


