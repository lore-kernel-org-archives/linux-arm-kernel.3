Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742CBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=; b=N+HWeB0GOxvWA5iDnYogdqTTja
	UbL6dWlGtTLu8cxdBimJ7mjxuIogqLFxv1Hh32hlIWoF0AyuqxwXdO3RMzOu/ETFQOkQMdCnzKDQN
	/3fVJVGsltXHFgMdkhVK7whVYitApoqwXKYy5ej4ML3wx7LKXvgfT3+actccQNs8LnigwpTBX+6i/
	oCBGWyrfQMMCD9AfMj4ZjVOuZV4/XUikMdj1Er+1+iynP+D0/QapOH2S3Mu3zUtWnSdsuwkfFBWp5
	KND7HSo3w0Dy2wecgGJrzcuf8CXrS5pwpkdrb7LZXgNbCGjTN6aTw0yCUxxnxlKk0u5xyUf17BB7d
	zj8nx4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVmz-0000000BWgm-20Jv;
	Tue, 03 Jun 2025 17:51:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVko-0000000BWOV-2k5Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:48:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234b9dfb842so56029735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748972929; x=1749577729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
        b=iTQvRbBjfBvtXm6H+xZs8zpoY/FMMYwry+MhD/C8pCUivG/4Jh5wFXUR2u3gRW1cZT
         ycm/N362FLKWBUn84snF6KFD4k+q4ap8a6ddn2Rkie4r/nCGNc6o5jV5aLvp7pTliN4h
         eI9iY1kjPPTYSr+w102okDEnPVZBaUD9NZO+CBGzCnXebtcCyxxe7II+K1cJR3TuF+FJ
         sHg0ouZlCMkbNGnVrmyCNytGF80DOhAtB8K3YMI5IGTRJJxJn7KChsDz0ssG13/AFeIX
         qv3/zxj7RcfZKpalVfBBu4AYWAQwkbu1BC+6C8UDqQYK/qtbIi6za29Qc+fKzymlUw5Q
         yjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748972929; x=1749577729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
        b=JU16oOI5pz7jLogQM+NiofqILQyPgUHre9yZg2R54/cQEDtL0ZoMXEYM5unsvKwuUq
         tk9L6cM3QVIxN2ylIOOrTcUHqmWdegC5zPyUoX6nmKWpmkVR2KNwJWwjAcz5Fg+myfVW
         O6Zst86i+Eih+ghDUhTrSHeYCuRInuASx/gi2BD5ORYmO41md1B80+pDBwrvIy2fXjGI
         K8wA2896PqIFI1v9Svp1IEn6UbdLu4XVXTaAf6NMgi4MzM824jOENtWHrl5Dj4Syrgj0
         eNROW/1KDTFcKw/kNgxuC25xi4ADd/PzfzsgoPbiY1EFhSY3J7GuWtaKPjzRntt9F8YX
         JmAw==
X-Forwarded-Encrypted: i=1; AJvYcCV1LDsZi5LqmS4Q/6/wzCWEKWcyzAdU+2t+6sevafCyvLnbTg7L85qyOlPuZ6IBWFdIZlzrFd7pGgxi4DdyX9V9@lists.infradead.org
X-Gm-Message-State: AOJu0YyhoGYVTo4nzioGObQ6bSu2sXRBYOqajPw/0zFWhOsdqJ0aVBg6
	MfNbTelcBKMcT/J/oxwDxdJ1y2FZxSDs5BBG8QvYedVX6219XGmjQDppbdkR2oMYvA==
X-Gm-Gg: ASbGncufNgRPaJfotzcm3xCm/PvpOVdc5YO7+cJ2tly3MdJx6f3VhShxMOFtfKPR3OP
	rU+3vpn3pw6H7ojJMaoH8oG3imgCWR8beg1os85a1pjAuYapy6rQ7vsYQEQuoV8DUZ/oaKHptCQ
	L1jOfV2ShL5o4kYOxqswZOdZ1G5AjLiu8+TIXN8pdjw3P9mGd6lPMKINpWduRmJNA0+wstx/2JT
	2WrgkUYnC5oBXALfGKOz7+zMOmRlUAtB5OFC8AhncaTsI+2jMN4TS1PZUmV9tAkO3okpWxit7x0
	m3Xl5cn5Dq/LBqU1nnepvlIff3mVowxSd6TklqKQp8WaEVgcwNnmRmNSzgceuyNwJdc6iNU4v6K
	c/zuylNOUfaHcKCNA2oGLETM6kRw=
X-Google-Smtp-Source: AGHT+IFw/hM9KjB2+YIvlfPv7TCR6YjgHHZTSPyy4qbS7jSH9/Uc2dPgZocX8nOAauHg/zfpx7Iegw==
X-Received: by 2002:a17:903:234f:b0:234:98eb:8eda with SMTP id d9443c01a7336-2355f762d1amr220323805ad.28.1748972928721;
        Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc95fcsm89801555ad.11.2025.06.03.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:48:44 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Message-ID: <aD81fLvQQOBd7cot@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_104850_692980_F7AAEB4E 
X-CRM114-Status: GOOD (  21.48  )
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

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/scx200_hrt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
> index c3536fffbe9a..5a99801a1657 100644
> --- a/drivers/clocksource/scx200_hrt.c
> +++ b/drivers/clocksource/scx200_hrt.c
> @@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
>  	.mask		= CLOCKSOURCE_MASK(32),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>  	/* mult, shift are set based on mhz27 flag */
> +	.owner		= THIS_MODULE,
>  };
>  
>  static int __init init_hrt_clocksource(void)
> -- 
> 2.43.0
> 

