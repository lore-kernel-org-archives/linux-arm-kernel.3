Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBB3D35172
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0mdH0OC8JwB7IJKC2+SnwcdnINdTU07hJwxXP0++6c=; b=d0lTmv8Q1EtoSjJt38gqOgesSp
	wuOf86SHgy6m04cEAJv0lIFLWsm+ldHRtfI6ZDo8n8Em8PCSjBSb6cbcTOtgXmO7C/g4s7Ji/YU1e
	u3u5hxZfVUsyRyrJj3ifLocHFgzPuEKAlp1lVB7vOyRpICk0NxWLnN4Q+La4wn432GZ2QkMNLmSlc
	MzqZRIAONPx7Ho3OTCUmjvATOxmP7a6dQZZ0+DAomkp+yBxTSZsKqGf8+2vdQ44OZwQTR5T/adjo2
	yD9RWTy4F1R/jZcM1oVBA6N/lhsEZhcZTOXQrYOdLcQ5enwDj5G6ANo92WzWQ+wj5vlRXI81rgiJ/
	DKUQe/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7soi-0000000EVdN-3HbQ;
	Wed, 01 Apr 2026 10:28:58 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sof-0000000EVcw-0HVB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:28:54 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-953a0431639so814270241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 03:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039331; x=1775644131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0mdH0OC8JwB7IJKC2+SnwcdnINdTU07hJwxXP0++6c=;
        b=Lyms9sprZ1oKCERkQ4cqB4cRMKa+fOaXTC3lf0shF1kkHsikcRavB3GWDSuoCaXsLX
         BEEXd8qY8nlHd2jH7ZyFtiG496cdD2Xyuu+dOQxHsh0Ohiqo0uXYTlyRlPZgcX3tAdqh
         VVw3IRdSVGO1KKx8FUbgVIKQ3SN9nr9whJdynvqXkMtO5eR5MBFKm9w7lC6pef5msm+A
         fgag2SFtkQm3avMwnoRByTW9wY5lLsezNS4YtSE2NXPKO1C+X8p7jk/Mb9XNZ0srvtQy
         8J3yerWf5WqU9UtoJQ5lx4qgy34/57k26LsQhHJ3KY7ARMMXnTbRpgm+kUpslWs3Ljhd
         lQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCVEYzmItCU8kv5GS/Pa6aCoSdoEfv7w5D1Uj+Kk8HStBA2OqqhWZ+E0kdN4m5+AoCr3xm7pHAns9jkdsW+8pwuw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4kzEmWhc4XYUITruWEshEvHmwe4fHUkuk14znd4OUmC8yCyIx
	6vkhUyOoDAty0FhrEYzfQMJItQqQsagYvuxAsbYFbybcnzVuVhsBFaCDao4RNmgl
X-Gm-Gg: ATEYQzy4PUDP7fiPdAYIF8YGFw+I1/sqCNhS2QQExVE+15NUkmYgvj1AWg6WG4/TjXK
	cTom6p/XYzHexaomTM6Z04etJC7vEmImZTCYhtzVDsadF2W5F4X3rBw6HYDXERhgBQOPE+CJoIH
	Yb6S5GFcCjy+K7Xhqi8bHRGR4Mic0NcsUUhd42GWudmGhwjnRq69tRhQQ3E5jU1+uM+Jvq/EJ3Y
	42FTSingIJQaSWVlenJddy9Cg3QMjCKDmLjyJaTmZEb/q2EN+Y+47P+oU0sIcbjM3ATEzvps2Aw
	4bLqD9dwyGCdqfbvpLLhzVqIgnFjQJhvRfpmLE/cyfajgCYa6mTg5FuKf84LQRmhlGojgLMLVwM
	WYLoMLwNvJ9Qo8hy6gpx4wPxA56VqBkfZUAxGXxTwdo49SYxiJ1h+w1FkAjWsi7U9xnwIWh3/E5
	aLyvGPY4RjysRPucvRUAZqwaXjAvPUi9iSG9NZlAHzKxsPth3Jo8pmLFLAAHLG
X-Received: by 2002:a05:6102:358d:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-605680dcbaemr790629137.24.1775039330817;
        Wed, 01 Apr 2026 03:28:50 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e2a0891sm13035832241.4.2026.04.01.03.28.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:28:49 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so1865117241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 03:28:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWixseeKLv1u+GOYS2sIgmacH6+ssxckUYni9rOdEXT6uQJFW3M3qxNXfKXdQ0u2yORzvV108bX1kfmdua82V7n@lists.infradead.org
X-Received: by 2002:a05:6102:f82:b0:5ff:a16b:93fc with SMTP id
 ada2fe7eead31-60567e38c48mr1019620137.15.1775039329568; Wed, 01 Apr 2026
 03:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-fix-atomic-poll-timeout-regression-v2-0-68a265e3770f@bereza.email>
 <20260401-fix-atomic-poll-timeout-regression-v2-1-68a265e3770f@bereza.email>
In-Reply-To: <20260401-fix-atomic-poll-timeout-regression-v2-1-68a265e3770f@bereza.email>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 12:28:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGHzt8nB3EGAToxZibf-O6C5xb9bcWhQQApzL3-6pcCA@mail.gmail.com>
X-Gm-Features: AQROBzBYece91B7HL1BQJzn0XhA1qYXWXsk8dwgJyg4pUS_Jz6xTvdQx5dc1VOc
Message-ID: <CAMuHMdWGHzt8nB3EGAToxZibf-O6C5xb9bcWhQQApzL3-6pcCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
To: Alex Bereza <alex@bereza.email>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, 
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_032853_140694_AE277F00 
X-CRM114-Status: GOOD (  26.85  )
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

Hi Alex,

Thanks for your patch!

On Wed, 1 Apr 2026 at 11:58, Alex Bereza <alex@bereza.email> wrote:
> Currently when calling xilinx_dma_poll_timeout with delay_us=0 and a
> condition that is never fulfilled, the CPU busy-waits for prolonged time
> and the timeout triggers only with a massive delay causing a CPU stall.
>
> This happens due to a huge underestimation of wall clock time in
> poll_timeout_us_atomic. Commit 7349a69cf312 ("iopoll: Do not use
> timekeeping in read_poll_timeout_atomic()") changed the behavior to no
> longer use ktime_get at the expense of underestimation of wall clock
> time which appears to be very large for delay_us=0. Instead of timing
> out after approximately XILINX_DMA_LOOP_COUNT microseconds, the timeout
> takes XILINX_DMA_LOOP_COUNT * 1000 * (time that the overhead of the for
> loop in poll_timeout_us_atomic takes) which is in the range of several
> minutes for XILINX_DMA_LOOP_COUNT=1000000. Fix this by using a non-zero
> value for delay_us. Use delay_us=10 to keep the delay in the hot path of
> starting DMA transfers minimal but still avoid CPU stalls in case of
> unexpected hardware failures.
>
> One-off measurement with delay_us=0 causes the cpu to busy wait around 7
> minutes in the timeout case. After applying this patch with delay_us=10
> the measured timeout was 1053428 microseconds which is roughly
> equivalent to the expected 1000000 microseconds specified in
> XILINX_DMA_LOOP_COUNT.
>
> Add a constant XILINX_DMA_POLL_DELAY_US for delay_us value.
>
> Fixes: 9495f2648287 ("dmaengine: xilinx_vdma: Use readl_poll_timeout instead of do while loop's")
> Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeout_atomic()")
>

Please no blank line between tags.

> Signed-off-by: Alex Bereza <alex@bereza.email>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

