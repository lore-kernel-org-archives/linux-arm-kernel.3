Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB472C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=; b=nej0XYqvMJ30OKDCMSoIgj56dw
	+/tQk6pnEjlUWEVDluGSob4htHZgT+aQ2Le4leOuS8+z5b5TS8a4Q4ICM+D4YQbgJVeSfRYBPR2JA
	cm2QASvegKH+IaUvm0ttnUev2+v2go+6sw4vkNMBD9dXuVnrRPjC5mVZk8sqKQXELgE5qTR7EKq0z
	uREA95x50xNG/hjUV5WcUOw/ajQ/AKvgozJWnGsw9sdaTq3b7x1TOKuA80Pk2WOWB1MN5BRpunJCt
	BNEhMR7Y0WUduYxAdIAtYo+Hh8e7tpSmdjjoZl5AsnFN9Zy+TAWprpnDtLOuT7/5uLEjvnONcSXhY
	9ecMlTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd6U-00000003ejV-1IHM;
	Tue, 01 Apr 2025 15:00:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd4g-00000003eMb-0k8l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 14:58:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4430083f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743519524; x=1744124324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=;
        b=enN8VAtZKpd+j3xGvbfp+agAWRgpL0+IKjqnz2Q/QQ2TvLLq4Y7LC58NG6jwdldcwl
         0jlmpMknvuqh+cjkXqrlpAiwNskr+7hvMhFWuIwTWY7lwhNY3Eqzf41+u0OxwhMkok2j
         0rC9vmg4wW7T6Sf/8bvWx7gqH2zOJ2i9F9TOpYsIDiElVF4D7QC8uUy5N5K0mUPYrTqx
         KUxF3to5kOsU9tTTWARGrpVAngoeCG1bYewg0Jp+FtjEw9SSMVyp93gNildJNLcrxjfV
         EF2Dnof3Q822STD1uTDkn+ktsOV70m71IQcdcR4XCBWeQ6kDMb1ba32JeRBb41tOA1B6
         jHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743519524; x=1744124324;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=;
        b=vfUv935uXmzl7uKpbcohgMUicpDCV1ZAmcpzYgf/UP1IAyrsY/YkdxHJPn4NUup+sX
         E8WGdJTsBP8vRdUMBEuqRJnCmEEnwTm/4xgyBLoT9fdqShoDhZLPX2k4Unul5TTxaErL
         bExZ2NXqbV7StJxTnf0q9g2gI9yI/aoIIqNgCzEt3vHiiOQSDulMLbpStAFSpeE4paEn
         xJa2A2X4KLmGfueIJPgkNTlp2oJEFQ+3NJy94hWlBqE+HIQ34MO5UoZqZx0CBifC+S1t
         oyRWGx6gMHkZ9YBp8UBxE5FUJ9Ja4D8tP3ytclhBYv8DmLvBXOg3K0lJ7vYSHpSkGXXR
         FW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwz3qopanrSznqbX4wWhij/lYYuSEbQn/IsfLUJwVfOjr2vW+ydlE9d4LuP4O7Jc1DSeraCOIItnhMd+bRP7Ee@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo9SdhYN0d6FVhuJUl+mooVUJDCwy1V/D2GulXr46ixvDmjlAT
	oEh66hs3jlMqkby/GI1IxZh9/TcSrxqaxBJIMXlxDTPiNzLLDTDuc39KFOPeLP0=
X-Gm-Gg: ASbGnctbxdYsT0B9IxQvNKsPh88Hdaz0Os4z+dO7THFHG1SEkQEtJhMetgCdMNqMz1a
	N1jHRWTlDQnvJoBWPg6+sRrYyjyL07HbLecnqc8gfjz1j1JIhIBwgDTsnF36PRCpqudbIspfBL6
	YrtR+iXUNnm/06rn+OZECQFukTN1/LnTVmTl5zMMwxaV4XdCkXtkYugd5+4LWsTSeokL2m16rSD
	4BCjIhMrusKX2u/Oklh7wUMkL1T6XN9CNfU9b69Hrr0KlfqYEu6sFmcw8CkOVM6HfJuMM3GJGDZ
	cgF55SxbD9U6faEDmXKhWHNMX2DEltNWDtQLN60l0tNTUvs=
X-Google-Smtp-Source: AGHT+IHmaBSITLZ/nWSNzRwiZLgYFNFiImcV/f5eO9VLZjha2iCbgxMcIRSjTXFGC5eZY6835gq0pA==
X-Received: by 2002:a5d:64c9:0:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c120e3b98mr9530355f8f.30.1743519524130;
        Tue, 01 Apr 2025 07:58:44 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a991sm14273812f8f.49.2025.04.01.07.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 07:58:43 -0700 (PDT)
Message-ID: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Date: Tue, 1 Apr 2025 15:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
To: Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250327113803.1452108-10-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_075846_225627_9F459A0E 
X-CRM114-Status: GOOD (  36.10  )
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



On 27/03/2025 11:38 am, Leo Yan wrote:
> CoreSight drivers enable pclk and atclk conditionally.  For example,
> pclk is only enabled in the static probe, while atclk is an optional
> clock that it is enabled for both dynamic and static probes, if it is
> present.  In the current CoreSight drivers, these two clocks are
> initialized separately.  This causes complex and duplicate codes.
> 
> This patch consolidates clock enabling into a central place.  It renames
> coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
> encapsulates clock initialization logic:
> 
>   - If a clock is initialized successfully, its clock pointer is assigned
>     to the double pointer passed as an argument.
>   - If pclk is skipped for an AMBA device, or if atclk is not found, the
>     corresponding double pointer is set to NULL.  The function returns
>     Success (0) to guide callers can proceed with no error.
>   - Otherwise, an error number is returned for failures.
> 
> CoreSight drivers are refined so that clocks are initialized in one go.
> As a result, driver data no longer needs to be allocated separately in
> the static and dynamic probes.  Moved the allocation into a low-level
> function to avoid code duplication.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 30 ++++++++++--------------------
>   drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 +++++++++++------------------
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++----
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-replicator.c | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 ++++++++++--------------------
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++++------
>   include/linux/coresight.h                          | 38 +++++++++++++++++++++++++++-----------
>   10 files changed, 81 insertions(+), 106 deletions(-)
> 
[...]
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 26eb4a61b992..cf3fbbc0076a 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -471,25 +471,41 @@ static inline bool is_coresight_device(void __iomem *base)
>   }
>   
>   /*
> - * Attempt to find and enable "APB clock" for the given device
> + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> + * for the given device.
>    *
> - * Returns:
> + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> + * skip to get and enable the pclk for an AMBA device.
>    *
> - * clk   - Clock is found and enabled
> - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> - * ERROR - Clock is found but failed to enable
> + * atclk is an optional clock, it will be only enabled when it is existed.
> + * Otherwise, a NULL pointer will be returned to caller.
> + *
> + * Returns: '0' on Success; Error code otherwise.
>    */
> -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> +static inline int coresight_get_enable_clocks(struct device *dev,
> +					      struct clk **pclk,
> +					      struct clk **atclk)

This function has grown a bit now, probably best to remove it from the 
header and export it instead.

>   {
> -	struct clk *pclk = NULL;
> +	WARN_ON(!pclk);
>   
>   	if (!dev_is_amba(dev)) {
> -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -		if (IS_ERR(pclk))
> -			pclk = devm_clk_get_enabled(dev, "apb");
> +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(*pclk))
> +			*pclk = devm_clk_get_enabled(dev, "apb");
> +		if (IS_ERR(*pclk))
> +			return PTR_ERR(*pclk);
> +	} else {
> +		/* Don't enable pclk for an AMBA device */
> +		*pclk = NULL;

Now the "apb" clock won't be enabled for amba devices. I'm assuming 
that's fine if the clock was always called "apb_pclk" for them, but the 
commit that added the new clock name didn't specify any special casing 
either.

Can we have a comment that says it's deliberate? But the more I think 
about it the more I'm confused why CTCU needed a different clock name to 
be defined, when all the other Coresight devices use "apb_pclk".

>   	}
>   
> -	return pclk;
> +	if (atclk) {
> +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +		if (IS_ERR(*atclk))
> +			return PTR_ERR(*atclk);
> +	}
> +
> +	return 0;
>   }
>   
>   #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))


