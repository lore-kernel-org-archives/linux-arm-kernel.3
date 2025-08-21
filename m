Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3788CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZMkN5YvHpJeNte42wZOPpEqbuPgRtmnzX3DDrAk664=; b=EXLVEI5BFsEiP2u76iyh87hQKO
	mqVPS9hXWk6mwap0ME9c0nibdJfZpxORvvDeZEHntLnCnK+aZfH2CSQ6tCmnffZ8dnasESeI06W+m
	khJUmdEavVIn1tVOc411/fdZdqytpjOc05go+mktDFCq3aFrnfTlbMjxs8vHRcBqJ6ZAygqvA9W5j
	Q4bjHEAUqluAwKdjtb4df+tKbeLCN4C0bhAlbEeZ0nAlsRCxEiurAQLdjrtYamYM7r1QfIUm90GGp
	FoNqRnOARoiKqojmSNecJFaTxY4tJxc8HFH+/X1JqYy1LSyjpG5UqyvJGaUxjoDs7kDDd+1Gaza3d
	jKqW8jmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDst-00000000kf5-46nd;
	Thu, 21 Aug 2025 22:35:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7JQ-0000000HPWG-3fE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:34:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2449788923eso8905055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790488; x=1756395288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZMkN5YvHpJeNte42wZOPpEqbuPgRtmnzX3DDrAk664=;
        b=InVQl4dRunp4mCFGUg9ZRAvLAtgdw+h0XRlCSMM0Oo1KCobTOQfzTtQ90nJXuDkSI0
         zORoQB1JYTgRu0d2Pu9M/h3xZfyUe90zmvSDgc/AIZWoi5DjE0NBT5DNmCZeELYX8sxs
         X5r/YR0Filcow6/UxODUS8PnUsqsT2D4mI+Pd6/1yxjYuWeAal/Um7f3/dIhcvjlqOFP
         SX/aIOmUvbIxCzSqqiEnoxaRk35epa7jheV5rStu2fndZJWtIDvr1ZEHGeVuanmb530n
         rTdHnAnogDdNg61SMua94YNK+dMltSjqQujjUAz5x4SeCVJXA/mjAzDcD3s6dxx5dBdk
         /b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790488; x=1756395288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZMkN5YvHpJeNte42wZOPpEqbuPgRtmnzX3DDrAk664=;
        b=GdO4cSFRmlqnBdMehUSoBq7WpHZVVixxtyvwgWrCRed93/nsZZnFqefykPVFO3jX3C
         x2XRQFOGEnCcV6e3lq4qvUjTJndJMSC6/yiKLjUr/FVon+GfBJd+CHzHxLiKmqBov/2N
         oxYCk+f346vih/f61Gki5MhX5xuDiVv0JLOZwcROrTmkzeX2Jq7aB+mNKuFbjdEWDtOK
         RiPkWmoYKP2wsYiBKeeaB5jXOSuHwZtkbzPld57fsJBb7+pgtlvn5d+keR2ZBNXXbN/c
         ee3T8jTENFggOUONpp8jgkaVsTKbDp48F8OqdxvclDr7Rfbx9WQjv4iJ++oIE44B23Gj
         UV9g==
X-Forwarded-Encrypted: i=1; AJvYcCVLiPRKcNwf65SYFfISBOt3jsX3h0BLvqeJit4036bU0c7l8UpY28iQHIQ+QP+Ze5v0niOXhNMhftn5tCHfHlTx@lists.infradead.org
X-Gm-Message-State: AOJu0YyUz2zIZKf1iVY95NY6llprH12fQI2PRen4d6VZNh91q4sE3IDi
	1tFF9wOcDU1HeVO5dHUQfJARqZ203mdk9CBvwkO8hrS75Rm1+Mp2NxAx
X-Gm-Gg: ASbGncuB+ROpNWCjamd1el2inlZrr67NHCDytYbfPGoanNXwat+gkqrOAvvTAf5fPp3
	00YKQGecmD+i8lHyXIbRofaMWdX2JVQgJUsG5noGLPp/FTasBOS/QaLKvpD9KPF10ASETpmobVh
	zoYkCTiSr6dWuy87QUFWr3u7MAuaFoU9Oyni0GP3XPwnKNDYcJYf97Y9o3ayCCDU8zV2OATuRu3
	zXRI/WoiOpYaApbld/h2PntQ1uchzaa6e+SD4i22r+vrOGDlB9iQh3FESWRgcQonUrwajKjEL/v
	ploW/3xYGui1AGKghgkD2z9nFHkSGwlq5hOufLfhBwMVGyKm5oRQ3+Ck9Xm0h9M582IWMxcA8Sx
	eXeIziF8LqjBe9Q9qEREadNUtu8b71w2fG1H49qdNClooqA==
X-Google-Smtp-Source: AGHT+IGy7lLN0XbKBJzGbkOJWP5hCwPYT0HFzGwRoCFGoJH3tmocfSIP7t5zy9AEvNNLlOYoQuCGcg==
X-Received: by 2002:a17:902:f54c:b0:240:11cd:8502 with SMTP id d9443c01a7336-245fec04caamr35159015ad.13.1755790487983;
        Thu, 21 Aug 2025 08:34:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c745dsm58574395ad.73.2025.08.21.08.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:34:47 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:34:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Message-ID: <f7f009c8-3f7b-4493-9120-d45d42a8c5e9@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
 <20250818021826.623830-3-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_083448_911452_2CB6E99F 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Aug 18, 2025 at 11:18:23AM +0900, Sangwook Shin wrote:
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation process
> has been adjusted.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 95f7207e390a..1e8cf0299713 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/math64.h>
>  
>  #define S3C2410_WTCON		0x00
>  #define S3C2410_WTDAT		0x04
> @@ -410,9 +411,14 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>  {
>  	const unsigned long freq = s3c2410wdt_get_freq(wdt);
> +	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> +			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +	u64 t_max = div64_ul(n_max, freq);
>  
> -	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> -				       / S3C2410_WTCON_MAXDIV);
> +	if (t_max > UINT_MAX)
> +		t_max = UINT_MAX;
> +
> +	return t_max;
>  }
>  
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> -- 
> 2.25.1
> 
> 

