Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32616F8A155
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=; b=XK2kpeqEipTDO0yNTnmsp25ei/
	h1UYADJUIEvIJ0zQI9IvxxRxIsYr0QybwedP0pfWPc6OBmQqeF4po5Z5j2nUsMId8ciyKi7hyOplZ
	2x6DRqTV3xzzJujNvLb8L8Fzd6YDkiT+6z1uFzPll1PUlaVkTTRIiwu23/9OMNqG/WdUELjqiNEO+
	3qm4pF05LOHwSfBN+1oLwyw5zh57gmNJzDlJa3JFQnpDCaAlTLM82uo5dB8KNo1E7B2PgwSj8rvy2
	kIePXs6UUc9JKUPdIsEiu2Cw1ZdMKrvy7+qn5RoBgrK37wvcPQElo8ZG4Cb50m98GgYStjHU5E7lL
	U7P9iwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDK06-00000002JUg-1O9R;
	Thu, 16 Apr 2026 10:31:10 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDK03-00000002JTX-0QHV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 10:31:08 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-409de4132b5so4996388fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 03:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335466; x=1776940266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=;
        b=DcFs8qzfjeKSBZDqNl35yyINo3HNlNokCZ6IiW8RGbr9dVqkm74XGu3KNdEv9wgl0m
         fMrQFrkLOhs+4ekSjxOA+rpzyLb6zZSacwy4cy6FcD9lrHZ/rOsuJHy3hu9NoUaLRqj1
         sIBBMVpyl8oAceTUYGw1SWJjXAOdl62ACwPGZDDM0mui68TirlQbAuDP1POqXs+ZhwmB
         M8M7A23aaVZxmMRUaxMgThhsmhBeHhD1EI5mdIZMZ5M/GQF200peylx04QHgtBEa5A6k
         weuigMpAMjle0RUVjOxJ+5wbJKOK4E/HGHaajAS/GMGgyjHZDuioo5R+JndAlUd1NH9v
         TvXA==
X-Forwarded-Encrypted: i=1; AFNElJ9+RTPzPug7kbRdPzkcoFnjqB52NzIxMJ7YfXTBXvyKGmnom2UFgqN2DK7LSUMGEeed8sgxZuPdUt2TiBMEIDZ2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi4SHmoJCHPCuTJVvK5w2iAZV5ewScbgMXLMAip2bzUlcTt7m+
	pmAbriNPdfctGPMUO+Xa9gxf8C2Yy/mtc5PSyKTz+SrUBnCAj62qkW/wDnXCqQXz
X-Gm-Gg: AeBDieuAgSJoSatDG/ti1NSHYBEu0HMRBRe05W/K2DdGu6QdEfQFlbu8oFlOFCafref
	BWV3sM2SxBddC9C9ZUAUloORD/6sVU2JPGqK6Yvpe9vDSgnEZuucwxEUmMV3WlLcGIiXI+Y35XY
	ex34z3doCb2duocD6ivv2iOPomquxXbUzdN0xJ6nPcG9GMqiLFGzgkaPvYkgvSdJRdhRj31P6Q9
	ThRPyy7IHYg2QOulW6KeZcTg2JggoVnCwVIwkeOmdgVCYI6wfwHrGCueSoN8ktvoi4dy3oBHg/Z
	xj0FiuT4DcUBc1pEqIe4BkMnUSaGenEM8mnC5nWk5fTCZ9n4Qe5r4vKRBXtAaEDSTMppfxEFxZT
	yZurouSFkFSoIYpa8qT/+0hzgZAQXNii0K2gqxXdx+SVpCPk9JzxmOsI/C7D2BE4SWMj21kVe2A
	mIQy7X0LrNggx39dtOX1Hw26ccHFjhj8ajeTS7SrtxYWi3Y4wSl4YA1y5EjTsKbfOVZ3oOebU=
X-Received: by 2002:a05:6870:45aa:b0:41c:6512:8419 with SMTP id 586e51a60fabf-423e10dbd2cmr13853094fac.28.1776335465805;
        Thu, 16 Apr 2026 03:31:05 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-426896a12a4sm3515552fac.16.2026.04.16.03.31.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:31:05 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so6941045a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 03:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Hu/5+HShFaLhfX0obR46W+uPrxg4IAWC8Y2oxBv12f1b+umrZW67RIK2LX6CU5D+rqxLuun8j+L1zAzGx/CRE@lists.infradead.org
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr11966750137.3.1776335071251; Thu, 16 Apr 2026
 03:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.794680738@kernel.org>
In-Reply-To: <20260410120318.794680738@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
X-Gm-Features: AQROBzDRGGELVSySTko37h6zEj8YoV3p6pwZDCVQUlUW6sZbw_W5mbJzFIh35nQ
Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
Subject: Re: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_033107_139381_B2294EF9 
X-CRM114-Status: GOOD (  36.06  )
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

Hi Thomas,

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> get_cycles() is the historical access to a fine grained time source, but it
> is a suboptimal choice for two reasons:
>
>    - get_cycles() is not guaranteed to be supported and functional on all
>      systems/platforms. If not supported or not functional it returns 0,
>      which makes benchmarking moot.
>
>    - get_cycles() returns the raw counter value of whatever the
>      architecture platform provides. The original x86 Time Stamp Counter
>      (TSC) was despite its name tied to the actual CPU core frequency.
>      That's not longer the case. So the counter value is only meaningful
>      when the CPU operates at the same frequency as the TSC or the value is
>      adjusted to the actual CPU frequency. Other architectures and
>      platforms provide similar disjunct counters via get_cycles(), so the
>      result is operations per BOGO-cycles, which is not really meaningful.
>
> Use ktime_get() instead which provides nanosecond timestamps with the
> granularity of the underlying hardware counter, which is not different to
> the variety of get_cycles() implementations.
>
> This provides at least understandable metrics, i.e. operations/nanoseconds,
> and is available on all platforms. As with get_cycles() the result might
> have to be put into relation with the CPU operating frequency, but that's
> not any different.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Thanks for your patch!

> --- a/lib/interval_tree_test.c
> +++ b/lib/interval_tree_test.c
> @@ -65,13 +65,13 @@ static void init(void)
>  static int basic_check(void)
>  {
>         int i, j;
> -       cycles_t time1, time2, time;
> +       ktime_t time1, time2, time;
>
>         printk(KERN_ALERT "interval tree insert/remove");
>
>         init();
>
> -       time1 = get_cycles();
> +       time1 = ktime_get();
>
>         for (i = 0; i < perf_loops; i++) {
>                 for (j = 0; j < nnodes; j++)
> @@ -80,11 +80,11 @@ static int basic_check(void)
>                         interval_tree_remove(nodes + j, &root);
>         }
>
> -       time2 = get_cycles();
> +       time2 = ktime_get();
>         time = time2 - time1;
>
>         time = div_u64(time, perf_loops);
> -       printk(" -> %llu cycles\n", (unsigned long long)time);
> +       printk(" -> %llu nsecs\n", (unsigned long long)time);

While cycles_t was unsigned long or long long, ktime_t is always s64,
so "%lld", and the cast can be dropped (everywhere).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

