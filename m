Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F870C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 22:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=; b=Hb7AIsvx6Q6GpQcl+KMrsDTFMZ
	J5vKSE3HW20PhJGfVskrcnWAL37VFB9u9AnZalhUXWqyqMIQ2ol6QYxQgURNm5GNYt58zQFjr9Vjv
	V7V0nyPyxe2U9W/jKWTLamkLFxeC6DQ7ztKleCjpAOVfPZm3s0aLsj7WkLYQDwXt8P/gWvjTuadMX
	ItY50VsOuZT6+CjpmAs56J2+4y7kHCOxQcu1U7a0cZDGeTy0Qp1dBKtFEoQLoO+GNyerfcx95fD3Q
	KSbF3dBFWTS6dc7i86JTjFbpCjkHe/PiCT/odxUxD346zJDkXwRn3DbuMq3y6VqqE+qCmYQjr1VxW
	an9YBSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajh3-0000000BN7j-17ol;
	Wed, 22 Jan 2025 22:59:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajfl-0000000BMzF-2YEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 22:58:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361f796586so2780085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 14:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737586687; x=1738191487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=;
        b=DCGWKUnXPX6Z2XgdL+7T/Aux3+cfwYIXdHQwrqqSW8zaX2n7tGta70nU4rv+onzqS8
         NI3ax6szDNZiqCVtu2SMw8BwNTdRz5iC+Pcg3rH8vTZZ/B0iYFTOPsBSMajLrGQY45E/
         AkxJGSmhZtL2QcxK5Y9AoleSQdx8AvmCVwj2SYorq0xLyPFjEtlliHh8K3yt37jtH0j9
         xEogZGAypLMYFqN8QYkmSsc061G2rEM8XT0boAQXhFFRr+wztGUDA/NXhsKgx4SMDQ1/
         OINiaddSnseGvs3TYFNvpKN7UqrKAjeNiQ1vXVvYd362+fVWwOlUjFois9fi1HZ2e4Pd
         3gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586687; x=1738191487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=;
        b=JkGdAq9b+zTYXFyjsUFlm2kvdWP/PPHSuMTh5DQY5Rm+GfrcfhoOUwOm/5JZaZQeWn
         voOBfzaZcb+MqwHWLydoj07j8dDtklb/V3AiyAGlxWmQhMZNqoQgLDGs0qZWUsuI6RVo
         WUeeFsVeX5V7NSZXGwLLvI6r+w2ceSZLFJG4JV8rsV5bhug3r3+qSUWlCvdgcVHN5WrH
         JQDci9f7u2NT4sZgWoHMwJgHlZCnGDhyuJRu4C581dapfozHBvWfBW/HVdSDd5iECCUk
         LPr1nU6jOIddHKRyq/jSJ8TvXPQu6L8rC1mpigAJLFtHurNqwl+T5NBlqJAj0CasHEDB
         Ga/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLDXjLVr2rEcPzkc5Y+hp3zjWQ5I6lwB5HHyIkI/gJInKlT24SqcyTqQ1EtnhOyyyK/d0lmIUxWJhU+Y+1khxt@lists.infradead.org
X-Gm-Message-State: AOJu0YyVqdWmp7b1/dNJ4d3pAJqZAAZUv+7sSInmb7ZuOz4E0/vcJqkn
	Q5HWy2mHSltDEULAGLiEUztqmvjMh5J0X9elhpyPYnPMk/PSItFf
X-Gm-Gg: ASbGncuU9PkTlhZtumY/f+dWL32UwNUc9RbWfqwOcJHm7Ktb1djZXps/kWxCZkZakU9
	eGuGZAqt2XSr59k2FVwCXaXspweuCPCCam78aEttwqWaJwCEtozBx0FaSTYUtVYc5yjcS21WP/r
	bmWDPHuZPjlNTsc/k5AtIevBJfwZBuE5hEhM4I1eQZPBnFLEeEpRc/AZS4Qm/17OFwLApbzMCDu
	JXhsoRzTrV4ftT3KXL0uYWD5MKCEq9Lv86ynbsl7gt8bcmLqlTODPNDlZhw5FQeh5Ec+5dOyE99
	ZNntDdDnknwEX37Qlwfkv3PcJZ7VJC83
X-Google-Smtp-Source: AGHT+IEQnQhWcYcYLwtPUsp3QOoc70eLrq7vJCaIVuPYRH/ywGliFi/4zTlOAPB9XOacsMLy93f4rg==
X-Received: by 2002:a05:6000:1f88:b0:385:fd31:ca23 with SMTP id ffacd0b85a97d-38bf57a7797mr24374385f8f.40.1737586687462;
        Wed, 22 Jan 2025 14:58:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df412sm40115765e9.36.2025.01.22.14.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:58:06 -0800 (PST)
Date: Wed, 22 Jan 2025 22:58:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard
 <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250122225805.2ba6a062@pumpkin>
In-Reply-To: <20250120084719.63116-1-abelova@astralinux.ru>
References: <20250120084719.63116-1-abelova@astralinux.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_145809_652355_D27395A4 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, 20 Jan 2025 11:47:16 +0300
Anastasia Belova <abelova@astralinux.ru> wrote:

> If n = 255, the result of multiplication of n and 24000000
> may not fit int type. Add explicit casting to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

You need to read and understand the code before writing any patches.
The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
So can be done before the multiply.
Since req->rate is 'signed long' and the value is a frequency it is
only just possible that it exceeds 31 bits (and will be wrong on 32bit
builds - but sun-9 might be 64bit only?)

In any case it would be sensible to force an unsigned divide.
So perhaps:
	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
	...
	req->rate = ((24000000ul >> p) / (m + 1)) * n;

David

> 
> Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> index d93c7a53c6c0..70fbd7390d96 100644
> --- a/drivers/clk/sunxi/clk-sun9i-core.c
> +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  	else if (n < 12)
>  		n = 12;
>  
> -	req->rate = ((24000000 * n) >> p) / (m + 1);
> +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
>  	req->n = n;
>  	req->m = m;
>  	req->p = p;


