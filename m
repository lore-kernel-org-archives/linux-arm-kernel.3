Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEADCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=; b=yIRMNdmAe1YkkpwsMt6Y3/VHMg
	LStql9XxN76XJZoiuBJhT2eM2ntK/kiZjScryB/9mqxNK1J0JPLKjbDJmudNRfZXw113l6F7vgyVz
	qykktzlWrZgiLwriWPy4UrIsGsWgdBidI9sWYYZdKYCR4qzORQ3P95U8G4JxKLJnHIDycJGjJBVVP
	KcF0sKf0T7bCAlldF7bE1qb61CZRkZUHVW9U7W8SHxg4Zo1qpfkxLKs3mGYNOncbcMJtkIaJylBgu
	xdTujTDqXXHpqH7cFgfK8l5eLLE1ca0Tyh+XN2dE3QXZh8LHKmohCen2QVLW3MWhWyzlFzpe4t/7g
	Tkw2jc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeS3-0000000GtcR-36vx;
	Thu, 27 Nov 2025 16:02:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeS1-0000000Gtc5-31ER
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:02:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297f35be2ffso15503765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259353; x=1764864153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=YFbmrSgw6cRWG+57MBYCgBfXIn3vK8e0u7zuiSyJcxZiYwJX5N4O2AfEoit1Z0uHwk
         dI/5CRMlL+wDAKceZli/7vXMVI90VIAZ+fs0d37xLegbBAzJcz8L6tFnQsQcV0FIHlg+
         Cs67VveHIcDD4KO3fWwG8wSKZYwvF2GxpQwf+eYwCPln5x7VdA1f53oUzE+oVVrb815v
         CNQSw0TAl1RE4GNFFuAhmRkJRWGUWlkvGqPWlZUh7jTba/B08FLVpu0TygpqmEU5nOge
         Qeb1fsZCIrvRDeqAFow/caeEA+pRGQrzox1/y2W8fVoEY1QLfo4YTTWqOAo1GoCci30b
         THkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259353; x=1764864153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=rQcYoKZn9KUzIEj4tUzSdW+DXuY5idmUMV1O+vMnR3tECcTWaeAHJhJbcQnYPH1lJm
         M2w7BCLn4uDH2ECKo0H3ye9N7CgcF0gbmoct7NO25kDaWFPP69QD3NSmMl3pAykpGpoO
         23hAtYih9PCS/8JsgY7J2OWdmx7Jgt0hkKO+XLUZDo9ZB7ZPz4WYwRBgndf6z5ljKdzx
         73ZktZWaUfwHZGXLsP8ztStKQLSqANiA8HeGQtx7dXh2eE2aq9iKdBUbf371kCk3iPeX
         0wkHHvzYgz7zzGJY1yN2p4B6MBvNnGeo5oi/pvrWSkS39iWkv0Sk7bnNWI3RS49+W8Qp
         T7RA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqRcKXnWCoF2vQLAnNb2JfV4xuDd5XxOqUTTwi+ElRGrKbvp3SCROzAqIlI+hZtdUmZvN5gLeTNUyXcDJzyEY@lists.infradead.org
X-Gm-Message-State: AOJu0YwcYgGXuFthIC2DLi9XTyJx3AXpGXmPrbT8/x+DCEFTdDGwKrwf
	qFtzNyTu5+M1mWl0kPWWCQwFfj3t1eyMvH8IZ9y4+nYoFFSgldna+dx1MYfIRUoQG1U=
X-Gm-Gg: ASbGncsf596rVp+qdYNM7dkncDa6TssQxUwf5zp8f47thXzjdqViSS+t6qjxq4bnGU9
	zRqziuwX14x2BBbca9NBbo8aPvqcO5vHaxGR0uaPa92x/emjCJcdS0KPgRHqHKh67gOyOBkPHsf
	UPu/rfljex9nO7r9ghMvsEVBzdDnmkTe7u+4q0BSe9dBAgYYuDHY4mUvhBkXfUVPdgowXvmQasn
	zep5sId3NFm1dmCkfRd8LDj8h4f2RNTpsoe16/mkaIlaRpEBsCPM3ubiUs/3SjD1HIYrkMyj/SI
	SQhiJ1Ux7BE2CWb97x8dHneCKUlBc+Jx1VN3hdKo2Xp78Ukttxx75/hYSrx5OdP7hN0kak5zfYT
	pO5ynhAMCx8dWD8RYTtVhlVYqtQYhTzUAiiPueBYCLlk7sGADHP9fsuSlOxf2y0txR7pNq6C8sb
	II17j6Xy+bLWswnkrrSwzaMjKh
X-Google-Smtp-Source: AGHT+IEBS49WXHa1OQkXmOSzrd/2INN0XNe3pKmNT4J9ufCzVEdO1kJQ5meC0md/PjmvEoKECkjFdA==
X-Received: by 2002:a17:903:292:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-29b6c3dc29fmr271962935ad.4.1764259352803;
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4703a9sm21523835ad.42.2025.11.27.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Date: Thu, 27 Nov 2025 09:02:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug
 in imx_dsp_rproc_add_carveout()
Message-ID: <aSh2FVTS8jGUSInR@p14s>
References: <aSf6OerBbPcxBUVt@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSf6OerBbPcxBUVt@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_080233_790160_874ED7D8 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, Nov 27, 2025 at 10:14:01AM +0300, Dan Carpenter wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index be83b5f20f15..5130a35214c9 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  			return -EINVAL;
>  
>  		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (!cpu_addr) {
> +		if (IS_ERR(cpu_addr)) {
>  			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return -ENOMEM;
> +			return PTR_ERR(cpu_addr);

Applied.

Thanks,
Mathieu

>  		}
>  
>  		/* Register memory region */
> -- 
> 2.51.0
> 

