Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5735C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDQjd7e1dEINU3xXqkIWXUzUoOcvOxZ9G/ybcyRrH1s=; b=qlA6ME1fo5wGt2HZ2xq0MYZrjx
	tGdKDBixLbvkKur3x1QKaW1bMnUssuF+6+HiAmeGLXqMu4NJbE5fqr7Alv37IkqKIaUFj+7jkU6l6
	e8kfYPEHuzqEyHMDVTdXwU9HV2+WHxwpJ+/XWtJri7d1LiI2vaWwrloM/cLxu8U2tYQz/f0F5cp2p
	HYMs0fJP7BU9AxGjuLg0FTdpoUc8/0GHkinroVklvDylTbJzxS2BFcX1pKDEYzru9i6VoH8q2LLHN
	dXk4TwdPYXUEqqUeut4X7WuzmEI0vQl6FMMafF15T8HooI0t/lgQ/l4h8o7+tOAiFETHC3fT7HaXI
	bLSSl3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk24e-00000000tby-2r9P;
	Thu, 07 Aug 2025 14:58:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk227-00000000tKi-03FI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 14:55:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so622754f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754578553; x=1755183353; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CDQjd7e1dEINU3xXqkIWXUzUoOcvOxZ9G/ybcyRrH1s=;
        b=b8zUi6n+RTgTq+y8iRoO6w+yZh/X15n3uExDb3Nhlw9atHquD6TIH1w88WztI3PL0X
         i3z+CSDnbOnihPUsUex/9ZMsamdJJ4E5eDITaPfawtZDQrEPhMi4K1Wp3RBjkVrLkbV1
         COxECOa8f58lGJNyhfJCKNcQqEDHLOOxtcP576dg+4pTAKNSGZLC50TSVcDfVLjPtPDI
         75DxOzal1q85ulOiYHZsmSkDtKzMQ5AYMNuUhH9NVAoMeqv9/zNOwioP5wwwF+Q9mhAV
         Zvxu9FAEC+6F7/IKoX7/6TxJlNuTGWw9oNgnFDWIGpmfiQaWeD52vLqor81dsNzfKRg+
         TZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578553; x=1755183353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDQjd7e1dEINU3xXqkIWXUzUoOcvOxZ9G/ybcyRrH1s=;
        b=gcQJg/s9iFo02Wh5iqYWs4q2jb3PGTrya61rifTJniXRSb6sArsyeVFSUu/u5Gdrwe
         2j7qj74gGJ6yrBDffCvD6gdnWRR26reibILYONqsh43CO3FiqwLjRi2m979YqIMtkaq5
         05kkr6wJMdsho8JEL/+GLndkbJz/BhZI22Iibh4zumFpCgOBdKNfly23o/OfjldbVsAk
         iAh6OyNxCNi/6mPqwtZ8HEdI1EILZDGKFwk86XpZD6mIEZWjO+8PSA2kkpSe7Lodwfbs
         c4YwPFg/rcWiVKDZ2dN+WRKM6kuoNWxkdsts5H4Mp9nsaxyLbIPNMZ2VVRYzcPngoxuy
         QWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUN1JqqqYX7RPvUhcLKxtfRWSy0QHNrWpQs/9AJ1vyfZ1XyY3y1JYuzglu/n0DD9TcsgXEfLmjmlLIVrKDOVtJG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8zb07ADTtmU6GjUt30POxEPlKKuOLGcDCTit5Utnn2JkSox5v
	QcQECLTC07LRJXouOy4npWW3ttni/PFDGARHS0zHxVrWVrGIX5oUuT95KNhwcwSwvwwg7UvbBks
	KA8NZ
X-Gm-Gg: ASbGncvPWwH4AZAav2ExzK1wlkBfNbwCfv73NzjE1nGRheiMsFHxCdy5qlrFH2O6HiX
	xPnw4HYSw+PBh92FgoBHwBI9x0f8GkaILuKWgs/vRhEju57Da+UcWxn86uQRnp4vDT9LAobnGaZ
	+O9nHfL6WkQ7z4cf4+pDh2U4Z47i9qMypeXeQvmcLZWffI0cRDIdzMJ6z8d54uyDSw9eVkWNVYR
	L3qsgZTis5Q+EFFJz57tY+veBbEIg2YUsyZvIbqjvF/s+tk/SNSWi51Zp3Cnqh/wrAzru2Hewis
	0aFbiC3TzMxHFvtYuak7LxplCw0t1C62hOGG0ghV4vkmcnM5w694XhmA+zjQtkbdkQOB4wdxn4X
	6gFHKy/t4zR6/chimgfmUIE829lZE2iLu
X-Google-Smtp-Source: AGHT+IF6NY9gxXA7JqfnA4KnwXRga6feyk2kpV11UBsAGyAtweNaW4JjSHV3HQL5tmgX7CEyEe756w==
X-Received: by 2002:a05:6000:1a86:b0:3a5:8a09:70b7 with SMTP id ffacd0b85a97d-3b8f41d4363mr5608855f8f.38.1754578553343;
        Thu, 07 Aug 2025 07:55:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8fc6ef28esm2353171f8f.60.2025.08.07.07.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 07:55:52 -0700 (PDT)
Date: Thu, 7 Aug 2025 17:55:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] irqchip/gic-v5: Delete a stray tab
Message-ID: <3a1aa279-718f-4e45-add0-05727ba41706@suswa.mountain>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
 <670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_075555_060150_6F64CD80 
X-CRM114-Status: GOOD (  19.34  )
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

Sorry, I screwed up the over letter so it was sent as a different
thread.  These three patches are still required.  Lorenzo reviewed
and tested them.

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Tested-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

regards,
dan carpenter

On Thu, Jul 17, 2025 at 01:45:24PM -0500, Dan Carpenter wrote:
> This line is indented one tab too far.  Delete the tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: no change
> 
>  drivers/irqchip/irq-gic-v5-irs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index f845415f9143..ad1435a858a4 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -568,7 +568,7 @@ static void __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
>  			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_NO_READ_ALLOC)	|
>  			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_NON_CACHE)		|
>  			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_NON_CACHE);
> -			irs_data->flags |= IRS_FLAGS_NON_COHERENT;
> +		irs_data->flags |= IRS_FLAGS_NON_COHERENT;
>  	} else {
>  		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_WRITE_ALLOC)	|
>  			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_READ_ALLOC)	|
> -- 
> 2.47.2

