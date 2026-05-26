Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF6CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=; b=m6rTGSfbJLMkQp53SB9jDTzhvB
	TDT1PL8Bnlbx9nFrG9A0gjmAv5mcLIrav9K3bImothTJ0RSnyGRc2VczEEKVvVHop8mPkInPJecFj
	HAR+6euhRDsY/nDsZZWafGmDiPjJxIG+NJ5RuFLKGHH8Z7U34f7hzkEr8J+qpliZbw215WTuabmWc
	ECdAyN/aLV6GGkUicWjqkMWOKKEDVO7EKvrzLvfmSxjF5DWIj7jO4qfXXbrSJb1ED21qEMy+nYQ8p
	ttrE2cGdUO4Nb6Wi0lC2TdZSLgvPUTi2lXpDRa+ZjenVdRaS5iYX/4c6RXqmbXEig/Npbb6oomIhH
	UWMmR6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsuW-00000002BQH-2hFD;
	Tue, 26 May 2026 14:37:36 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsuU-00000002BPX-12Ts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:37:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso8705063a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779806252; x=1780411052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=;
        b=HH+IPZalNeyPOUf6DFPAYrR6Wb2wWO/odX137yqm6yqDw/Q9KLv02xuInUk8sWFdnS
         v9RyW1R4sS+i86YoW+p5bpCeKsYRW3RYs//qxHfvEmOBseyOcsRvDN0H5mOUeQkil4Yq
         Mn4yVC5pwJ72o8yH0B+R0bh8wQW03NjcptjEDUvomBoWog4BabR6oebOaD17alaKn1iy
         HCQvs4MdxIm5SRS5dz005JEHLkMpuSlOEnaJQBoTQIhwFyd29QwdMiBfDBQwigIywUj6
         +kishCT9khSP8fMLJFX/niVVLf8oVScxYk75boxnD7LUqcu+Us1hGWcEz4CEw+a2vHNw
         79tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806252; x=1780411052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=;
        b=ahgF+LJOmFXLRfwD/VEfsT7Zzdkk+3dIDB/acF/WI0kLYnMlGq9LcoiJdlh1qlR/S7
         LjLJammDht5nIX8mmopKjqP0jQKhqY3SEPtDsNTG8TqF2E4PssxMO55kEaNvuygcXlC/
         I1Ya0Ngn+WQhi4fIOZBQubXhsYyn4p3aIApUvXRZ15F4qjd0ZIYyVE1gzk8mCptwztEq
         MHosculBB0myUNRHMSVUcv59mG049m2aNonFjtHqPvvgSpbg/HxogdJrruAuUSo2qQEC
         kO/9YxQ8L0TCXAfx+IDelHNXwqfMyQddz2iO836iUskRiKITqRqxzJypbXwNsJgvZQcb
         dcwA==
X-Forwarded-Encrypted: i=1; AFNElJ9a114xHq5UfVvNr/lHXdsef6Gm+FBXZYU1qmMTwr5KQc0ZHC7KNxTnCWY3uXQj6Ohhr/UC9QgID88bqFAIjRVy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw75NT3sSvjCIdZH5vU4rHyt7ZiUoMHyMWIQImW264ctLYAfryN
	lmAzY/3jFX8+bkUbb108lB8KNTipudZyQ4+mkTyfjIfrOTKZtxxqcj1FqCq1ERTL4nA=
X-Gm-Gg: Acq92OG4pEw8X4IP4p3Nec3Lb3x6qAEN7gtR72QJTHqMSEX9Zfl5HTvxeoimGAzMdkr
	JGRZaO74mlplo3IYIYbNI/acT56WYNvp/abSpO/Ugo5oqj4bOJgGtsfDrtlooZZ7/xVURVDPlrA
	KT3uJGno+LjGbPY1gCFT6OE8ENNENq2gek0UGqXx+J3pptyLm2SIkHi0JRMI1Q5jNQepmCF6Im8
	96/6caHZdgWeiKB6iEVMRbSwXrPkqo0EWD1qrmIW2C4Kh8slN9tqEwRZPxhRyifumx/gq6YjTKn
	TQT9tZVkQBIAmcX+cbXxSvTHBJV8gBiD1KqwJ3dm0fGzAkfnCNV+RbIyoDMRRI+np15zuRQ5xln
	f6p2WEUTh1UATaHnyK6XKc4eA/ljnGFGKKXr0+nJWuvFkVT0VoTM3xp55q9AjKgUbU1BMU7Kdqi
	36RKx+czn4K+vcJ1vi/WiF7BlJTS4asEtjU5h8tw==
X-Received: by 2002:a05:6a21:38d:b0:3b3:2703:11c with SMTP id adf61e73a8af0-3b328f4a929mr19843539637.37.1779806252410;
        Tue, 26 May 2026 07:37:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c09c:6784:4cd5:a34d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm14900919b3a.54.2026.05.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:37:31 -0700 (PDT)
Date: Tue, 26 May 2026 08:37:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: daniel.baluta@nxp.com, Frank.Li@nxp.com, andersson@kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, peng.fan@nxp.com,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Use device node name as
 processor name
Message-ID: <ahWwKB0i1pjrr9RH@p14s>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
 <20260508032016.27716-1-Jiafei.Pan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508032016.27716-1-Jiafei.Pan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_073734_307607_38A9DC67 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, May 08, 2026 at 11:20:16AM +0800, Jiafei Pan wrote:
> As currently there are maybe multiple remote processors, so change from
> using fixed name to using device node name as remote processor name in
> order to make them can be distinguished by through of name in sys
> filesystem.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
> Fixes sine v1:
> * Update patch subject to aligin prefix name with existing patches
> 
>  drivers/remoteproc/imx_rproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e8d239bef5c9..38713f6f1c50 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	unsigned long cpus_bits;
>  	int ret;
>  
> -	/* set some other name then imx */
> -	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> +	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
>  				 NULL, sizeof(*priv));
>  	if (!rproc)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 

