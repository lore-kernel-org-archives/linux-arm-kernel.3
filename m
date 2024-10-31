Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293B6D767DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYbrKwbw3BAA3+t49U7pyQ6oV5144cNwkG87g9CyP+o=; b=UoZdzwjE0f0K0MVVGVK9VyHrqG
	OGQS01Ba7MnttyTwRG4+VAg724K4H3YWHQcqQUjL+FFwcCSIRG7NC84WX9B2Gb8h4AWT48d51jy+E
	Ni6PKW/dXYZi+TnwQNqtMrQbKZJK4Omr3t3zVTHsLmsalUI1jbRulFSHo7hHpvFAWSP2V+iQ/4Ne4
	DPuR4ERsw7sZsrPUQCOcooj4U1KVy6E3eMFQ8feLLfiMrnhEfe6x0u+r5W2y/P4Zf7ZjskSNYi20U
	xvMAewnTcZxW5xWip2awu8+NOhaK3NMP1Jsq0zfRk63kJFkhVXStUSj31zgeaxfrLIchm5kxxq+al
	x/vRKMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XmG-0000000492V-07kC;
	Thu, 31 Oct 2024 16:12:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X9E-000000040G4-0p76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:31:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d518f9abcso740259f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730388702; x=1730993502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYbrKwbw3BAA3+t49U7pyQ6oV5144cNwkG87g9CyP+o=;
        b=vF7Bo1k+2XJyUkFwN33R5JyNdv2K8oT4puDWUVhE3SqbLCim0KtuOHlFsTC0Jt1z0B
         LL86csA+X53pXd3QXPx7UsTnJMm96FxfD1Bf2JdrEjBczdT23vSfAQMPlhGWwgyco0Fs
         6lYXpWGsrgOT4ISDl+V6CF2Iwm0NHBiJqOUCMjAjnZn3VmHFg5YFKtknZ6l3jDTWeGOS
         /KP3oRSd/yo7Skux80C6NkX+TWPDqVeYLiDGygcwJEdTU+wLbkj8/diebm1E//5RziJa
         BXxLLViDFvIYAlEGNxBNFpHXcOqwFD4tzlGaVDHEbkGaxA22pzCxJTlIqTnCCBKxGhug
         o+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388702; x=1730993502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYbrKwbw3BAA3+t49U7pyQ6oV5144cNwkG87g9CyP+o=;
        b=QOxHfUfBevbRLPacRtdGOrCesJPW3xNRmwygeSip5R2lS4ezkYmxrRzw6Xgwv6nC9J
         7TrjF0MBjk1E3zAqpDOBASwteAE6tLiVK6VigJOjo/71tRHaHm2lnPcl9cZI67+C7CFb
         zBnDbYS17uZ5bmdFB6z3IogeGUL/CLdgmkhwQN2RcGe37BYxmfBn2CqhF6gr+6tRclbT
         AtS30S6QqhMuIZ7vcnkdMVn5fA7HhWKAJcOAYIX1gXTVxRjJz+E9gTtGAVlWRfkCr5BZ
         HE3R7SMBfVwX9xJ9OCH8D8zgVz4d0L1i1FiYanzwiFJypiWhyyTIJVH0aAQJr7A9Cvm8
         ErBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI2bWcfoBlst73S+VOf8vgReWJtCEtJOrkxQDTEr3zBydYIeWJ+TUHWBCoBOjA8nt9dhsB1kfsLJ2jft5zmxuh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0VUAcOpxl/XMCM0f/bOh2dGLZCyRQvAyPE8CKRt2abNFwaJk0
	IpFgIOz6kpxgItOMNx4eWdhLWgxa9uAyjxyOWzFnqIaaoj6SGJm2cXL61BGY87Y=
X-Google-Smtp-Source: AGHT+IHq4BAfihy45utt2HuZFBKUWEdxRO+WgQHNsFD7CYtEQlEJVW+AsKh3p9Kl295OkYT0fhfpzg==
X-Received: by 2002:a5d:49c2:0:b0:37d:39c1:4d3 with SMTP id ffacd0b85a97d-380610f2ea6mr15001892f8f.6.1730388702331;
        Thu, 31 Oct 2024 08:31:42 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4a46sm2481206f8f.41.2024.10.31.08.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 08:31:41 -0700 (PDT)
Message-ID: <9a2c9541-8b88-43af-84a9-7b39d3251ac6@linaro.org>
Date: Thu, 31 Oct 2024 15:31:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] scsi: ufs: exynos: Add
 EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: ebiggers@kernel.org, andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
 <20241031150033.3440894-7-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241031150033.3440894-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_083144_275777_6049FCB3 
X-CRM114-Status: GOOD (  18.06  )
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



On 10/31/24 3:00 PM, Peter Griffin wrote:
> The values calculated in exynos_ufs_specify_phy_time_attr() are only
> used in exynos_ufs_config_phy_time_attr() which is only called if the
> EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag is not set.
> 
> Add a check for this flag to exynos_ufs_specify_phy_time_attr() and
> return for platforms that don't set it.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> v3: update commit message (Tudor)
> ---
>  drivers/ufs/host/ufs-exynos.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 2c2fed691b95..0ac940690a15 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -541,6 +541,9 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
>  	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
>  	struct ufs_phy_time_cfg *t_cfg = &ufs->t_cfg;
>  
> +	if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)
> +		return;
> +
>  	t_cfg->tx_linereset_p =
>  		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
>  	t_cfg->tx_linereset_n =

