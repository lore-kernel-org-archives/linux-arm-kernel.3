Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C725E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=; b=S5hYT4/9vYxkuiJfw4bYVwnv+k
	5yESdsOBeZmkmai7H0Vt8eXjlMm5AlsBrM+y86Y2DyVkJtii5XAhKb7DtvQ+gZsDoMfOClLOGmzm+
	SlyREQ5JHgBNlLnjJ+BQaOdZtqFvv3jBxfeJKqM1hzh01sCi8CDOBh8VrwVNrFQzmlVquNsP2KVu6
	lpcKjLdc/3/YvKMGFispWT1yRKutNefsf0iu2MLz1VRT7TCMbfnmYIQsuJ+rvSpcdyVC5zyx0Uvls
	R42FPF1xwIXgZL6p23ybdwznsLVUJfMNBW8SfMBT4SbNTvIvZ0RgPDHY6ZakslZpjBXjzpuEbRPN7
	fzcu2PrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJewz-00000002giq-03S0;
	Fri, 06 Dec 2024 20:29:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJevx-00000002ga1-3HZV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:28:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e96a285eso1396338f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 12:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733516895; x=1734121695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=;
        b=gvEvuxSIPZrKl8yhTNybmgjGk3sLLFKJBXIxNaW9SfLad4OTlZKZEH+o9GpTNOqfxA
         uOQ6prjIgkgE5duCt53UZgl4yf5gnbHoVZ/3a4E9EhLqjUuFsZdizEMqtqzNGkF9okzL
         QvYdXLq7rb5DG6LK/209MVp2j2IciJPC/U+TRYVCRAUGw4dzXesz7SbybxNi5lDnkaYH
         WS9yRoZav/W+POAYyXv8WrVqlaLhO9v7wq+FH53IKByqkXj8x+MsAeET7Qdq9EmsU/JH
         9vF2AH/WvN5n3vi+BNfMsitiaxvAZCkmUiZZm6VcRYaCuVi1yjT/yCXZuvtOFs6liVDT
         xMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733516895; x=1734121695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=;
        b=WilpP+CUcVUfFcOqRzI4vyIoP0xhiBgLmhejJ8E9ZC/FRK9kxzSZL6DA+eebENvgsx
         pltTVPukZigUsMA6Bi5v1S+LJxgPx+IkLQVFQ82PMR4upo69I13+uanYY2CxmentRMv2
         lhDwyZtaz6QJpeB08TKAkQnHtdF3E8dHchyejOCEkVj3G6oGiFxy1q8ikuOeMrkU+Req
         AZL1Gmu87V++KUTvHMkM4235dSanFWmRYy58WyMJz7XvZTuImYHl66gh+z9KIlG9E8sR
         ckIvwZQGum+t45uT6w8LGazTYl36b6T74QKYv1EBxvnSMhgMrego8/p/X0JXI5kG5TC8
         cJDg==
X-Forwarded-Encrypted: i=1; AJvYcCUvA7NVcocApxbd+zqcBxyHOdPt0so/f8aP3jjsbBy9UqvLlAWYj73ZMpHXIexIOVPFPc5/HWnUH0aFb3kKmtMc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsr8XrKCAZOoo2GH24GLsBAjL7yvIoRJDUwe4W+ayMiB3mGVJc
	3an+PzNfsuled0nco7WfiVE1AYTuwRtQRUtWpCMNjVe8lC+LM2L5SVh7+Cb3whEn77yhtiRxm3N
	k
X-Gm-Gg: ASbGnctxy2NCnOlo6WQ54XfHkueIu435uJ0TSwp7abYypmdSGYz5HyP5SvzHsG5WcWn
	sy1o5nkFubJGPdOIRkMQdkEL5COYfbfiAZr2kT7ZiP+QacJL5JAUwGC5wMnUjLYK2QHjRhgZZqQ
	w8UqlQjPtq+mtIE45BoOG22qSGlB9y0zGd6voLOhbvhWYCbcuby2cy2PWqhyyA2ADm4mAflKoan
	b3vlENxuN6+wg/S52378hUFloP06X79+bbO3kg4ZnrLsWoXnjTnXyU=
X-Google-Smtp-Source: AGHT+IGekqBUH4G61NmWpwsXhLA6y8516RqskqF/tq8JR1N/a6IKQ5CbI54DTrqFonQGIY9zzCX1sg==
X-Received: by 2002:a5d:5f8c:0:b0:385:f38e:c0c3 with SMTP id ffacd0b85a97d-3862b33eda1mr3932008f8f.6.1733516895327;
        Fri, 06 Dec 2024 12:28:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d26a3sm67425945e9.1.2024.12.06.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 12:28:14 -0800 (PST)
Date: Fri, 6 Dec 2024 23:28:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <7fe840af-d56d-4cb6-8d82-d42631409b2a@stanley.mountain>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173908.3148794-3-etienne.carriere@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_122817_876840_9CCBEB3F 
X-CRM114-Status: GOOD (  18.47  )
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

On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 09ccd6cea7f2..7bbb2ee55f4f 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -61,13 +61,20 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	struct scmi_clk *clk = to_scmi_clk(hw);
>  
>  	/*
> -	 * We can't figure out what rate it will be, so just return the
> +	 * In case we can't figure out what rate it will be when the clock
> +	 * describes a list of discrete rates, then just return the
>  	 * rate back to the caller. scmi_clk_recalc_rate() will be called
>  	 * after the rate is set and we'll know what rate the clock is
>  	 * running at then.
>  	 */
> -	if (clk->info->rate_discrete)
> +	if (clk->info->rate_discrete) {
> +		ftmp = rate;

No need for this assignment.

> +		if (scmi_proto_clk_ops->round_rate &&
> +		    !scmi_proto_clk_ops->round_rate(clk->ph, clk->id, &ftmp))
> +			return ftmp;
> +
>  		return rate;
> +	}
>  
>  	fmin = clk->info->range.min_rate;
>  	fmax = clk->info->range.max_rate;

regards,
dan carpenter

