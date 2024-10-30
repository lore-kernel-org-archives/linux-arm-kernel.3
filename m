Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A0D3A667
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwQhJkDhRGyNYzUhzrUe8VLzlsZC7UDKp+wauW+M1cA=; b=w4SVKHP5y+YbOTEnCe7kgaVIta
	TdNeoerSz53YVr6HKOpa0KJTG5nPRBJ4GDwE8sscKUM8ZbCMgo7mPwgRX5GYW8CFck411necD/wVO
	bgJkIRLAzLaTIAT01N+w/tEgfDjFj/8QF0uK4+Nn9RuN1+tMzP1oGCvUaOKzGT1exuSssU7kCJOP9
	chFlUjGMaZJXXOI2ZJJu99/ePUvkek4THzlFbB1ljdSGnugvyW3H+ZRa2cpjod+Tfv7kaMPEBIZEP
	yrsq2GSh2oOcvlPXooiG8Mn0W5krZ3kGQoTYl1cOTf1maELM8WnRoHsD2Orwy++I89Gh+KpUGd5h6
	xl5rk7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t64Wc-0000000HLEt-3WuZ;
	Wed, 30 Oct 2024 08:57:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t64Uz-0000000HL5F-32BT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 08:56:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so62007175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730278576; x=1730883376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwQhJkDhRGyNYzUhzrUe8VLzlsZC7UDKp+wauW+M1cA=;
        b=MSbiQ92PJGqgYtDHIM399WwE6+zCVeeUd+S0c3UDnj/jRfE8ed1w/ScFRd6fqji85X
         ErcjFvWfgxvhPn6I6ZPpMAnJwlJzJFF2lhIGUrm5HOHZQko4NSEvxh23D8NtG7zuEtNd
         zKpOmWXY7tTlhT5L8bQzwsS1mQW7PbFM7HYSQRcUe3OenDUiMxp3sf16+1rLqRHjot86
         QgLfCJ7ejp6Vng2A4c309acD7vvtDGJkGO8J8Y7UrFJRjD32mxBLrTUifa4mgfNd9N+0
         NOZkwLEON+DXmSC0H46iy77I06WfuefiRiBWyyL4e8TKOezXoLN0BGVrNIt7zmlMOco2
         /F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730278576; x=1730883376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwQhJkDhRGyNYzUhzrUe8VLzlsZC7UDKp+wauW+M1cA=;
        b=u1X7PbovFK21UD4LtKFIwWgHf8S31IELJCgwmZVFoPoNr2zlS50QlsFvxKfoIGztw9
         5A7LydfBqtx3z1hSOIieTnWNPPDiczCqGoeSI9EuRt3z0JJMoshm/da1VMxfrM7FrJ7Z
         d2KB5zkQxRTE8o29Mg6HNWFNRiPSkZ+LZEpvLVsr9v2xZj+5j2yCu60I1aWb4p4kaCCV
         78z0SF15WTZ04SdsfCsX+eTDrko90A5K6DBI+T6v7w1acadinE7a3WQ/oDLAVwi+3VYM
         QhA2UT5HS6wKxvcAXrrDq8K+lIdSNTVIoQxVg1D2tvLVKlkp2Uvjqfvit58lD4elhzg9
         N9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWzgwNLRox3bX9jrz2jrMMoipaY27NXRDlEDLO1dKVNSCPXYNN0OSQUYGzMdBsGoNijjoZWT3nfzNVCqaSP7pik@lists.infradead.org
X-Gm-Message-State: AOJu0YwfZTOwT90wM/uOWy17sQWuCl7h2jjECHZ6fvtm/c6TdLbsi4JG
	2+m2p5d0ByDdLrpCccPURKM96Wl+r7Do8JJaNNkGKL0zs+sfCcrDhGQF/40oWio=
X-Google-Smtp-Source: AGHT+IHMAWPWqhusmSGEG8xKoTYKcseUAUiA+2AO0mWI+eaxCx/6d+Nl2JonxwY2qbCw2Xe3p7M++g==
X-Received: by 2002:a05:600c:3d05:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-4319acb8f59mr131260055e9.21.1730278575803;
        Wed, 30 Oct 2024 01:56:15 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132fbsm14824903f8f.4.2024.10.30.01.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 01:56:15 -0700 (PDT)
Message-ID: <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
Date: Wed, 30 Oct 2024 08:56:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] scsi: ufs: exynos: Add
 EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-5-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-5-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_015617_811424_C4E023BF 
X-CRM114-Status: GOOD (  19.38  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> The values calculated in exynos_ufs_specify_phy_time_attr() are only used
> in exynos_ufs_config_phy_time_attr() and exynos_ufs_config_phy_cap_attr()

all values set in exynos_ufs_specify_phy_time_attr() are used *only* in
exynos_ufs_config_phy_time_attr(). Or did I miss something?

> if EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag is not set.

yep, wonderful.

> 
> Add a check for this flag to exynos_ufs_specify_phy_time_attr() and
> return for platforms that don't set it.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/ufs/host/ufs-exynos.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index d685d3e93ea1..a1a2fdcb8a40 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -546,6 +546,9 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
>  	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
>  	struct ufs_phy_time_cfg *t_cfg = &ufs->t_cfg;
>  
> +	if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)
> +		return;
> +
>  	t_cfg->tx_linereset_p =
>  		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
>  	t_cfg->tx_linereset_n =

tx_linereset_n, rx_hibern8_wait is set but not used anywhere. Can we
remove it? Not related to this patch though.

