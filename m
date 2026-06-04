Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7056CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/rC1fo+bW1nAFIVdIH1ju8UCCu+wCVbA2zMBO1aJME=; b=cCE/L7ayVW5hk6/A/X/myvqjPu
	0WY28TuYIc6PImyYgRIOM2tKdbJ45mGtAZj5FTtPZLB2xG27/AnlsENVPVvj4V3e6fHqdq3386WhI
	gjxKwtXtVA/BcbK0mzQWsWDkYLdkVYcMof4dmwSaPV7ryPjXvNZzXxBbOlhJftKz75iSsJMYYHHEF
	F2ac/N90VMpP1GjUht73FlZVya7psDjawV1lsbYyaAeziC49sZsYXwu1vAQp1YTt4UEO1qqPe6thf
	jnL/0e4SKB83F7t9PdMbkpBoR2/pIjXFwiHZRLofm86ogvTLx41RgpBAE+KH9Huw33nqClTS0YwJk
	8uX1KFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2wB-0000000GLQA-1lwM;
	Thu, 04 Jun 2026 07:56:23 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2w9-0000000GLPV-21Pf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:56:23 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so645293a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559779; x=1781164579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/rC1fo+bW1nAFIVdIH1ju8UCCu+wCVbA2zMBO1aJME=;
        b=ZgEAAUXpKLEzL9gzcxp+7TJsIaSj1LN4VUvPhnSWFutFV34lMxJVQQKhwpkDSW9bNc
         mRl2JCF3JrzTjtIzqKscNauOyeOIA4CIqF7GvVFnS+SXCkP8hDNCQgq4Z5NJtcBHt8Yc
         tP1gLtx7RXrck8lv5Hy3cdXlaRWTVLUkH4d7tEfCvROsGi07sZjtL0M8x36KKSPzzvHG
         RvwuD62gIoULqAuHFLWPDDoY6VGpeoR/8N7/lq9cBtEZkTAja/W9/0JrIlWQHJyAkhWE
         BSp16SKczdMS+pBGl3QqxOlNRaOgrPRsJXJ2cES/N9FMfXIuy2ecuFCzgalGCU8gbLkP
         fpfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6XvT4QJ0erOe/SiLl3RhDh4KPQilnYzi41NzFlWuIt28RYEDYt80adAkOdwxsz03IqNjT7l6OGnB5y9t97av/@lists.infradead.org
X-Gm-Message-State: AOJu0YzzNZjGh1HU/KoCbbKrNk+n1a7y6FNXwN79nKTvGMu1Z9tbRZlH
	VpuOBGxbYshS3Yi8cheBtdaNvH+hxppwZVj5/rpFR3G3pdIJYcustxVdqKfWOinFoB4=
X-Gm-Gg: Acq92OG0c2PguWmbJCQGa7i6C71+tphr9mv0E4OYkdSrTtMZrrQ7c8ePXrg/8PMHtg3
	v/KRQFrmczLKb3zWgnW1+0XlSdhyGo50yV04PUhenw094CgBKCdGZQ+1UcSDau+USINnawAOewm
	itxUtDujS2FwVyFNGxIRYTOf2hvYcGN4/JQ8chhOc2NemQRFTRa0i9BlZnHMKbWEpxndk0GgTjx
	g4mQztdPGzD0YBAD+5W7q5PGjRl0wqoQ3NGlZjp3r/y9532xroS1NuLkUovofDpSeoqbcc0hyct
	MqcXidXdHuLQ5UZtAL/OcRwWS+zA5/pS7tjZAuLyaSUoGaK9CcUy/DseJOFWkgYCwrxeGpQpnFq
	JG1F92i6lyPtGuG9ctkRSsvY2kBEVLh9TE0u9uO5Rb1YncPjSEM+obUMAUHUw9idYrYlAyYllnN
	82Ccj/ppnw39Q+RkqsSgY++LHOJHA59zhid3h0ubK9IuUnuWrB+ZR/K/tbL0zWLOU5896tpmf0i
	+6+adzGZw==
X-Received: by 2002:a05:6402:3492:b0:684:17b5:da63 with SMTP id 4fb4d7f45d1cf-68e7070f16amr3323476a12.9.1780559779325;
        Thu, 04 Jun 2026 00:56:19 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f358sm2150939a12.6.2026.06.04.00.56.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 00:56:18 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68f1e28f258so674614a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+aE25/QT+Il1YzLUk2llFQ5P0gSSbW43qEhZovSrwyEOqUZ87hRzgq3Ns34wtUbJYWbonARFdbnpc7SKpOgYvJ@lists.infradead.org
X-Received: by 2002:a17:907:7748:b0:bf1:8faf:d94e with SMTP id
 a640c23a62f3a-bf18fb047c0mr166351166b.40.1780559777705; Thu, 04 Jun 2026
 00:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260603213726.1025094-1-heiko@sntech.de>
In-Reply-To: <20260603213726.1025094-1-heiko@sntech.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 09:56:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
X-Gm-Features: AVHnY4IvkoGavCb3kflRroLCR9W-9Zf0z8gdDvwCFWuBrY3WYcj_OOUKtkUAgL4
Message-ID: <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: don't COMPILE_TEST builds on M68K
To: Heiko Stuebner <heiko@sntech.de>
Cc: rosenp@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005621_529634_73C50726 
X-CRM114-Status: GOOD (  21.86  )
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

Hi Heiko,

On Wed, 3 Jun 2026 at 23:37, Heiko Stuebner <heiko@sntech.de> wrote:
> Rockchip clock drivers use hash-tables with enums as inputs.
>
> M68K does interesting things in its __hash_32() implementation, casting
> that u32 input to an u16 and therefore triggering warnings like:
>
>    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
>      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (18720 becomes 8720)
>      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (1e8e8 becomes e8e8)
>
> As M68K should never ever need Rockchip clock drivers, simply disable
> compile-tests for M68K.
>
> Fixes: 7edfb7fb58ee ("clk: rockchip: allow COMPILE_TEST builds")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Thanks for your patch!

> --- a/drivers/clk/rockchip/Kconfig
> +++ b/drivers/clk/rockchip/Kconfig
> @@ -4,6 +4,7 @@
>  config COMMON_CLK_ROCKCHIP
>         bool "Rockchip clock controller common support"
>         depends on ARCH_ROCKCHIP || COMPILE_TEST
> +       depends on !M68K
>         default ARCH_ROCKCHIP
>         help
>           Say y here to enable common clock controller for Rockchip platforms.

Obviously this is the wrong fix ;-)

I have sent a better one, fixing the issue for every user:
"[PATCH] m68k: hash: Use lower_16_bits() helper"
https://lore.kernel.org/b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

