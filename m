Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13304C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=; b=zSA9TX9Ckz1KTAV7HzjLYm+LVr
	kbtxqp3nS5I8QjbvpPos9zn0jCP7kqxxnjCC8ROHSnBUtKJ1mUd5NhuQ8HsJxpUCUS32HSQDgot8N
	Uboo6DxsYaoMGGatvm+zq6KGWlI1+0lXGshnVG73FdygP+u6BpGHhN6k3guoiQrYw2q9j711W/01G
	ZO7wpJ1Ui40lgOlmxH8ZwWsDzSwS2kYj0QFZBI5yLHeRPBvW+tfVlxaKwT7dy6hv2AsZR14snqQw1
	1wMoo/SW6b5vR3P77jQ+InXTdI5tAVLcSm3zCnm8uYLb42i+4S7HgCO8iC0F74xLU8kqUgWAuWO3X
	ho0+LVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3pg-0000000DFBC-41k8;
	Thu, 23 Jan 2025 20:29:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3nb-0000000DEf8-1yXe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:27:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so9147945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 12:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664054; x=1738268854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=;
        b=BzX6g18iex08ke97g0xyKqLsj4oDFftrDtCTs1Tp8eYXzo3M7eeWy3WkaL38ZWRnAW
         6sZfSVk1WLMkxBH+t0RGJc+zSRIMTjcRUllMyD+r1uBiCvezF8l0mU3o8lq6sTH11Ya5
         4aSiCBDZBKmr6JT1aigtfPIXeU1vd1FOEUHoYVavA2KHCGYV7nrmKcfVFDAxiQYgJckW
         tglshozZeAVcl8jJURw2WplqnUPIFT8YTt4M8Ls7iI0mmt7siyluSs4jj/ukbqcwZ9Rt
         okm5J0eOXF5SlBLjDq0D57oJHZGGN68KCxoezZNV3B2t1gN7Q09Xgc4QsDHP1x4RqRcK
         /mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664054; x=1738268854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=;
        b=IHL3zHlqPRgaiEr0by3543LEXWEyJxeA2l82092x7Z4V16pAlN1maaq3i7oPFE8z3H
         3GMGh+b5hUtirl2k3wAJmqtcgL7lLFZAeCclC8xgY8JyI6zIp7PsQD8Tl2P+DBxGe0uZ
         YePLjaS6YZvnudG1J/sSWhUHRsyM+bstMxq90OIArz5mW3+U3yGr6Decfac1HlratEaY
         IiRUws2R/afV79Ahqq2xeh2yHAI7ud/h6U9Yk7T92VbnoGtdnFvij7MfvuPnmjAnDUb3
         PPio8jhMmQPoEKfmssxdJKkU/HuDlO1vK6NRfMcfOo4IsoVMVjOCMS/YlkuNgmprXj3+
         kRpg==
X-Forwarded-Encrypted: i=1; AJvYcCWgrj8khPuS9m4rYTSPp8URV5U+7FaXVbeP/gzn219PqvOat1EC3drVEIy+W8jXRkVLUNBNSae06Z1pS9TeEGo/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXo4uB+df+aXIoQpQZA/ealVMsS6SssrFzwiRnUNFTK6NZw/o/
	7uI6yhRZFD/nayT4hGKSQTiTH7fc73FT8HVUy5yjdWiwNwmJTZta
X-Gm-Gg: ASbGncu11ewXl8FEgzvaemQLMaCLSd8GGgX4ZkWYm8lR6lSLm2sbIqHHnVp6Q+Y6/fI
	uE6Lss8j/bvmTtL63MpPvgsQoppDIlHLaFzgbgm18fqXXZyDzhfEhPBZCxQWwsNZjESTHXFkP37
	DyMYM4eTITk42wylpWO7hU2U6D5vm1zGjchb14m/Dhg5LNfdy/vAq6PY0vOQiTqMWb1u1z6BGWD
	1+ulKB9SsPNGpp+M0i0l4ztPLo4zGDimS8HRDLu2T13MZ/ya4BF9ja8H2RYZqMh80Z4PWKYQ4Vx
	CGWecc6eLkLkOU0zc3mkRZaVS1z5+nGpmvriJjUgrbs=
X-Google-Smtp-Source: AGHT+IELmIj4TMdtO6F0JzBvp13pItF/CqH7DVKu4Caf20C2VuLCa8NuLXlr21iKRQntmJ/EV7Urrw==
X-Received: by 2002:a05:600c:3c82:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-438913e024emr291117265e9.16.1737664053774;
        Thu, 23 Jan 2025 12:27:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507e0csm2624815e9.20.2025.01.23.12.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:27:33 -0800 (PST)
Date: Thu, 23 Jan 2025 20:27:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Anastasia Belova <abelova@astralinux.ru>, Emilio =?UTF-8?B?TMOzcGV6?=
 <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250123202732.5f7eb52b@pumpkin>
In-Reply-To: <20250123005556.57b2331d@minigeek.lan>
References: <20250120084719.63116-1-abelova@astralinux.ru>
	<20250122225805.2ba6a062@pumpkin>
	<20250123005556.57b2331d@minigeek.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_122735_517673_49BB9CB3 
X-CRM114-Status: GOOD (  41.97  )
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

On Thu, 23 Jan 2025 00:55:56 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

> On Wed, 22 Jan 2025 22:58:05 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> Hi,
> 
> please note that this is all practically irrelevant:
> - PLL4 is PLL_PERIPH0, which is meant to be fixed to 960MHz. Linux
>   would not change this frequency.
> - the Allwinner A80 is both old and quite rare/obscure: the most
>   prominent board (Cubieboard4) was broken for a while and nobody
>   noticed
> - this "allwinner,sun9i-a80-pll4-clk" clock is not used by any DT
>   in the kernel, so it's effectively dead code
> 
> But just for sports:

Doesn't surprise me ...

> 
> > On Mon, 20 Jan 2025 11:47:16 +0300
> > Anastasia Belova <abelova@astralinux.ru> wrote:
> >   
> > > If n = 255, the result of multiplication of n and 24000000
> > > may not fit int type. Add explicit casting to prevent overflow.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.    
> > 
> > You need to read and understand the code before writing any patches.
> > The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
> > So can be done before the multiply.  
> 
> Well, normally you would try to multiply first, then divide, to avoid
> losing precision. In this case it's fine, since it's just dividing by 2
> or 4, and 24E6 is dividable by both, so no loss. But the formula in the
> data sheet is written as "24MHz*N/(Input_div+1)/(Output_div+1)", which
> matches the code (somewhat).

That PLL can generate all sorts of frequencies due to the multiply
and divide (as well as the shift).
The code was clearly sub-optimal for arbitrary frequencies :-)
 
> So I think it's indeed better to divide first here, to avoid using
> heavy library based 64-bit mul/div algorithms, just for this one corner
> case, but it would need a comment, to point to the problem and avoid
> people "fixing it back".
> 
> > Since req->rate is 'signed long' and the value is a frequency it is  
> 
> struct factors_request.rate is "unsigned long"
> 
> > only just possible that it exceeds 31 bits (and will be wrong on 32bit
> > builds - but sun-9 might be 64bit only?)  
> 
> The A80 has Cortex-A7 cores, so it's 32-bit only. The SoC can address
> more than 4GB, but that's not relevant here.

I couldn't decide whether the code was for 32bit or not.
Using 'long' is pretty dubious almost everywhere.
I'm sure it is a hangover from people worried about int being 16bit.
But that has never been true for linux (or pretty much any unix since
the early 1980s).

>  
> > In any case it would be sensible to force an unsigned divide.
> > So perhaps:
> > 	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
> > 	...
> > 	req->rate = ((24000000ul >> p) / (m + 1)) * n;  
> 
> Yeah, I don't think we need the "long" qualifier, but this looks like
> indeed the best solution, just with an added comment.

Maybe just mention it only need to generate 96MHz.

> And we probably
> want to change the type of "p" and "m" to u8 on the way, to match the
> struct and make them unsigned as well.

Make them unsigned, but not u8.
The u8 would get promoted to signed int before any arithmetic.

	David

> 
> Cheers,
> Andre
>  
> 
> > 
> > David
> >   
> > > 
> > > Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> > > Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> > > ---
> > >  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> > > index d93c7a53c6c0..70fbd7390d96 100644
> > > --- a/drivers/clk/sunxi/clk-sun9i-core.c
> > > +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> > > @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
> > >  	else if (n < 12)
> > >  		n = 12;
> > >  
> > > -	req->rate = ((24000000 * n) >> p) / (m + 1);
> > > +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
> > >  	req->n = n;
> > >  	req->m = m;
> > >  	req->p = p;    
> > 
> >   
> 


