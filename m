Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0961BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgOjCtbQGBrweVM88K0nxcsUl5DkIty1+EqPf4mT7VY=; b=NJXPVu7Gc6RybORTRVMpkIhGS8
	UAhJ24/iMVMuQ6Ux/oUIMBZd4n8RkRlszHZ/00/Co8fxhST+qPSeY87XTozMRwOYM1e59FXZ6KeTg
	d9NINMm84KKW33PUDBk8HJBsNOfOyb6ZQJSSZpCIE+Ynx2KZuCmHiPTetlz2iYYwOJjxeHknBJ/gI
	ZF/1XhLOuQ0rkNDWvxg0OACQOa6Nz4Cfw0e5o1nRoXLtvWPdXxwb+XRjK+X/zW8nSD9OH4G6GFfvV
	nL+Kk1RIFS7drHXgPgkjMTlmrEI/LYOdL6UttEWtX8ZezdCwMxuK2dwCp5zm9C3d4iZOBHvzOZfrJ
	Nzryr8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLpZ-00000001uLN-3od1;
	Tue, 19 May 2026 14:54:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLpX-00000001uKh-01pU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kgOjCtbQGBrweVM88K0nxcsUl5DkIty1+EqPf4mT7VY=;
	b=g9uHXDXsCAiz1Iq6J+zKPtjQA3rbPxcFndO8AhPwZQ7lachODOIkUHbjB52Wjf9WvffO66
	KoTGJi8eqkqClLcvLCIdoypdrvqCJOUhjQC0IO4l3Te9RgxWsr/2hQHyqDFK/DKBDWjke6
	kUXlWOxjCfpWA3pyPDd5vd0z/9jH87w=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-_R3pTxVmM46uWtTnmrQtpQ-1; Tue, 19 May 2026 10:53:56 -0400
X-MC-Unique: _R3pTxVmM46uWtTnmrQtpQ-1
X-Mimecast-MFC-AGG-ID: _R3pTxVmM46uWtTnmrQtpQ_1779202436
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5104b861649so155427901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202436; x=1779807236;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgOjCtbQGBrweVM88K0nxcsUl5DkIty1+EqPf4mT7VY=;
        b=kXfk/Z0jfWDHajMi8Y3qP7DXAjvPRKPHq2UFvGpUx85xyJ03vRl32BIY95d+RVT9jp
         Rrb3xXmoTfcUehsHOV2+Oxz8hKmelIh7FjxsfIIXPlQszOp/cQjQBgotq0FEaiVVhO6E
         QSWTeh4MwsiGQcVXu+YXEL78a8ny559VhxsSvy6n1uq3Ap60joMqlBb41iv68MfO8fMy
         33Fxrg3s6jkQT9D26vXhRA0MqNakkreLcpIVcrPQX6OZRs0i1BsinwEWtX23UCa/EYzP
         sB1iNPueH+fvSKHsIRl3F8XUoThlH1uOt5AhnkEEp26mr0JDurGQ14ICkeDDmSCZ7D1L
         S8rw==
X-Forwarded-Encrypted: i=1; AFNElJ9NnvdgmIXBKizEAiGLgigk48Pouj52e69mZ08rk/zYNDhiIGQYbrGaKh51PopkVRNFu8+Nw3oPsRHHk9RQj599@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh0Gn1TMVXvvXn8TIu8re9NqtxuAHU28Wngstrjfv8sLwWnbk5
	/uVin1iQAiUG7v7pkgtdbg+iAIu9omEOrEwi5gikTA6XFfeS7UMfuiaHHVGfqtcfWDuH4hWyAeM
	MWZEMNtUg4cii+aup1GSIQJWOLmAckWi9bEoRRswIqhqnt7eIp2KWPZyc5/Xjbiu9IwBkBAGwdf
	vGcIzss4zE
X-Gm-Gg: Acq92OGFAtKqFEOQ1qyv0Yi2CVfziFdjmoMsgPmbOEluUmtyUEn1SNUGY72vsblrWMY
	KTrC9IIaCmb1a3OnHO3JWvCs7SHuMG48HNecQO9KyljcVTLbZxLAnbTdl9jtH/sEB8rG1ZkZvkX
	UzaWYvfkvi5Hmh9vGmuoVi4caCW5DLSwswY4wCEwhgNRnzqqIko7F0SQDe03f0Ad84/aL5uaT/r
	WS6mhXmuVCfNNBxtvxBzms79HMzQo8Qeh0X+J00KYYZrLWIvDqqxsvzRmy5ZyPhejXp+6JNkHgn
	tRjpkowpQsRPZ5XDXQtRzpqBMCZg7d2enokeqY2cWRm1mjRFZPCEKWtrjV/0YmnaVsRbW+lB6UI
	3Gj69A/7YEvAKMMwgkyHpn9VzUwh7Vpfe/3+sI5uPVZEwyZOGbNx17fEY
X-Received: by 2002:a05:622a:5908:b0:50d:736a:6259 with SMTP id d75a77b69052e-51659fbe97cmr273640411cf.3.1779202435791;
        Tue, 19 May 2026 07:53:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5908:b0:50d:736a:6259 with SMTP id d75a77b69052e-51659fbe97cmr273639801cf.3.1779202435169;
        Tue, 19 May 2026 07:53:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164568a275sm165644671cf.5.2026.05.19.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:53:54 -0700 (PDT)
Date: Tue, 19 May 2026 10:53:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field
 width and fractional calc
Message-ID: <agx5gTfaByMNjkX4@redhat.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
 <20260513055626.1070533-3-a0987203069@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260513055626.1070533-3-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WYrEkHAfuFR_j15xtUV-jHnMdoqJmzrylwbtxeP8oM8_1779202436
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_075359_177601_7173B8A4 
X-CRM114-Status: GOOD (  20.61  )
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

Hi Joey,

On Wed, May 13, 2026 at 01:56:25PM +0800, Joey Lu wrote:
> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
> The hardware fractional field occupies bits [31:8] (24 bits), so the
> mask must be GENMASK(31, 8).
> 
> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
> mask the old divisor is wrong; replace the arithmetic with a proper
> 24-bit fixed-point rounding to 3 decimal places:
> 
>   n_frac = n * 1000 + (x * 1000 + 500) >> 24
> 
> The +500 term provides round-to-nearest before the right shift.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> index bfedd45bd04b..7e6b30d20c01 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -48,7 +48,7 @@
>  #define PLL_CTL1_PD		BIT(0)
>  #define PLL_CTL1_BP		BIT(1)
>  #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>  #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>  
>  #define INDIV_MIN		1
> @@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>  		pll_freq = div_u64(pll_freq, m * p);
>  	} else {
>  		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
                                           ^^^^^^^^^^^^^^^^^^^^^
You should be able to use DIV_ROUND_CLOSEST_ULL() here.

Brian


> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>  	}
>  	return pll_freq;
>  }
> -- 
> 2.43.0
> 


