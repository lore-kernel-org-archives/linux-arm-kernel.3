Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EAFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+SZvW/F4GOHW6PySXy0XMzRT2W7+eZbjrzSkalzGFo=; b=wK1XrHqpFNbD8nnaK6JW9cxzai
	m7ZEA2q59uyJR9+6p3XBArzRmoErPS4xskMQSIzmKRCio3d1dtI9fZvYV9/JeqmwjpjnoFiRUQpGR
	TSyQLgo/2x5RuMVhjTb/+hAvGNlLOj/FNMVkInBkGX97P/sYTblf39ZuA8knjCTUbdD2GyzfVEucf
	wBei5yAhMau+/tev/FYWU3WpnASt82PEJYg1zDifNABYzaNtGWR6QwNqXsGUwrV4LFgwuPJMlcvsG
	IekeBvJ+qonW42aT9UmR3kwek1IOXodRoF9Vhwoab/hgtU8n/HZ0b6nGrHO2RMRUMVYAzRQrl9iFy
	OSA7RRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIIW-0000000Gama-2DSP;
	Mon, 27 Apr 2026 09:30:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIIT-0000000Galk-3utb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:30:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so973775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777282231; x=1777887031; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+SZvW/F4GOHW6PySXy0XMzRT2W7+eZbjrzSkalzGFo=;
        b=tDkKsLYFVJuDo43sLnKUR3fZbH+/LaCnlq5AHS79rTP76OVVcDqodIcnRh8rLrzyCx
         GpvPeR0tXoAjws8CTdz8uxf1GQpYaRASy3enzrAxQ2LQKemCaNu+RuyQN8C2EBCXVP6P
         i/B3hbA2CM6gpI5hxW+EobvyfbgwosacQgjINKiFwzi2aHE/EozTmQzhL+97VXrRfftz
         wvoRI5w/aDU7VGywJ1DnKCtCYr9ue62AUfpNUrDi5GQKWhw08B8IoQOJQ6DGfKBAzcGH
         V0ikKhSaXq9/k8i2JiZq0G6HzhuAPp9Ky4UvmXfIH7wTtbuEAZlZAHx1lPOuZXORQ0MT
         3fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282231; x=1777887031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+SZvW/F4GOHW6PySXy0XMzRT2W7+eZbjrzSkalzGFo=;
        b=qy4ENt0hXa5vFcIrM8BHWN6vSecZ8Xm75taruA192y79YCDquAYvgsWO2Y28NonlWd
         W7z2kkLH/7DosRO7oejNHcZHF9H3M4lTKKIiYtpETfrGJxKkGrgKgJghPi0S0Q4jjlpM
         NqN4Z+bo8v+4hc7nLFkKQ6sYBeaOcHa0rfSJ2S/ajyGTbBtKCpqbcM+Racl4YOaCDtFF
         mZpGUnerupcmJGtS9moewG3EsLbHe8IfJZ5LjaU18J1MuDp4bciV3zFiSwKJ9uLYSfZJ
         x83AGM6Qo6RrWagDBt5dn5UPfGJ+EzCeajL8l8Jze49AYn6E5c+dZKVhJ95c2rcBynqk
         Zb3w==
X-Forwarded-Encrypted: i=1; AFNElJ9vY+2J9rsH2a1InlcQA5TxcRAFBygUulP/mvjCx0grCE+sukHVReHQye+Ud3wlo7z0Z5/4Nub9/OJGq0hoGsbD@lists.infradead.org
X-Gm-Message-State: AOJu0YyLhVbwYSWERe5e8CvXaDfgSkOvrgDDYXgW31urFXHsLR4DwRRT
	H5nG7SWi70msRPm4XSWd1EwLMy6umJhXm5R3ONsrereuO9nYlWIccTncgGET+UqMDg==
X-Gm-Gg: AeBDiesArs7j13NhnwUNSihGPDggHvMzXyfIeJMdB2ZQKmkPcTr+fkfA+mswicySzii
	afMHrHrBoXEy+gdWNkxoGtHFganVZFFmeFN5yxQLU6aBDUnFqO/aQAi1bxv8u7JnuWyLWRKDWvx
	lYaFVAjyxLZ6QcjeFpnaKhQ23OCm2Y+1DFO9zlp547V4OjMnd+ulQ31K320iGHt486NAgHSs2nn
	7q9q2Q2J410Rn+0HhdUuxODpLeB2LfGJNMth/q0A/2rDnS2rSiOQ/BxrRkx1mPN3qRRXqg63g1/
	7C4qb/W5l4O5r1kwS5/+36yPMMUut/egJwT8SibsJ9Ap17eCYaCR2OeppM/v0AObTFDQqhDPYyB
	VXR0Ham7vkWHlYIU6x8j7AOg36fsupYFROZi0hztikOgIoArqN2ZtGPwFrJGQCiLrFF3HGdpatB
	FSdx8sfCLbCWEW8J4elpk07dPqrS+BilaXKJJ6dY3RP4SabHTWc9N5QUwz+gC+/8XwqUgf1X9we
	lZ9idZu8MMNkntLOFY=
X-Received: by 2002:a05:600c:8a0c:20b0:48a:5d55:c194 with SMTP id 5b1f17b1804b1-48a5d55c46fmr1545e9.7.1777282230673;
        Mon, 27 Apr 2026 02:30:30 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a0b60sm231015525e9.17.2026.04.27.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:30:30 -0700 (PDT)
Date: Mon, 27 Apr 2026 09:30:17 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH 3/8] firmware: arm_ffa: Align RxTx buffer size before
 mapping
Message-ID: <ae8sqehR7yQFheuj@google.com>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
 <20260423-ffa_fixes-v1-3-61189661affe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-ffa_fixes-v1-3-61189661affe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_023034_014321_19788C5F 
X-CRM114-Status: GOOD (  20.25  )
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

On Thu, Apr 23, 2026 at 06:22:53PM +0100, Sudeep Holla wrote:
> Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during
> RXTX_MAP") advertises PAGE_ALIGN(rxtx_bufsz) to firmware when mapping the
> buffers but the driver continues to stores the minimum FF-A buffer size
> in drv_info->rxtx_bufsz which is used elsewhere in the driver.

Hello Sudeep,

> 
> Align the size before storing it so that the allocation, validation and
> FFA_RXTX_MAP all use the same buffer size.
> 

Thanks for fixing this,
Reviewed-by: Sebastian Ene <sebastianene@google.com>.

> Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> Cc: Sebastian Ene <sebastianene@google.com>
> Link: https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_ffa/driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index e6a051b20cb7..4dec7ca52f8c 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2063,6 +2063,7 @@ static int __init ffa_init(void)
>  			rxtx_bufsz = SZ_4K;
>  	}
>  
> +	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
>  	drv_info->rxtx_bufsz = rxtx_bufsz;
>  	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
>  	if (!drv_info->rx_buffer) {
> @@ -2078,7 +2079,7 @@ static int __init ffa_init(void)
>  
>  	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
>  			   virt_to_phys(drv_info->rx_buffer),
> -			   PAGE_ALIGN(rxtx_bufsz) / FFA_PAGE_SIZE);
> +			   rxtx_bufsz / FFA_PAGE_SIZE);
>  	if (ret) {
>  		pr_err("failed to register FFA RxTx buffers\n");
>  		goto free_pages;
> 
> -- 
> 2.43.0
> 

