Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1CFD376A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=; b=qCWNRv4Ax5be4dxhIDOPGRwAJP
	KLxQXQcyqR7skjOEdkMla7fdzQIU184VfW0swCXYKxNGIX9AQSKvWTmk+lWMiBKUfi4i52/XMZMP/
	hNKMXJrEE6OnNvJcHk19kJsB8gYt769xySdBzZaG4AqjDXGpnKYmrqL4bHlQX1HaThIpaR2C6QG44
	qLzXXO0ZuoLGITJIQOxCHeVehWMerdLDs2ynnjxkZbIfTDNvuvK0KHvkwxfGeUXbIJco+xznTG9uY
	w0V7yarzBWzKP7rmdtyRgLGYAUVc+10QKw02PXM0/ThK6aW6C3msm7ZWHyJKz45uHHdgPuj/0iL/R
	kH4Wz+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHwY-00000004Y0X-2Eky;
	Wed, 25 Feb 2026 16:40:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHwW-00000004Xz7-0zyh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:40:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-483487335c2so62027335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772037654; x=1772642454; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=;
        b=R8XKdt4ZWiFRYdGq0YNG0+BY91lQxjX2cj1qQPGQohwpFTFxBM0zJRrp3SXP2CYqgg
         TzdPDt5vjD2aKS0MkjjZtyTgQ8i9GoYxpA2i8mRd2d0JAGTBs7IaBC1ovWV+0DVaFPxk
         daMcnrz2912FZqyp+4ccgRvYacHF+cFR4ySAaKr9XL+aBVngQgR7gfuv1zpGegAvW/u2
         6nih16rwJnKHibJOiRrmf65SVD/PZgtEnfDaujnjTSA9nSTidfUG9+yS+55q1MZ2ToZc
         zuA3T9sp9cqb7lqYAlS7A0EdYrwb4KGcvzITvPlY/XHLpfhh8kINJczQ/gO2k9psfarv
         IE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037654; x=1772642454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=;
        b=OO6LNke2mYyendCYpLoiBJyUtcFsUVxAQyyzS+3Zf+TbHwl6a+wod+OiQhq1W4qdY2
         pUyNOc02pCipa6Orf1N5Itt9hcO1xittn3U/MkBpgPKzz8oWIysYuMG7K2jiWP40Erus
         AymFLnKb+Re2rXNvCPtrtPzOAv9tX7PD41LL2fLJqMA9xiTzmfEM6o+/jVuMcLLAIKTh
         3OgI46ZhihUjkY9EzBse30TwsVjUfWAtuP74QejJ6234URJjVRWtyJzY2orzj0PkrORM
         atmoiyuCkgdGRGszYoOwqxRVVLmABwsRWkCDu84ABYXVj7ymNcf+r5HBOp3MKw/k4Nwd
         TR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcI3DP3l81/uaT90nvULD+qQhlQQTQtXCvRsQNZkGRtutkP6VwohWJjPD/nerxxuPeqx0WNyWf2Vymp1Pe7Jt+@lists.infradead.org
X-Gm-Message-State: AOJu0YxyVKLTzZ5OAtrtZYnJe+e+MT9kK37ufjw+VP4po7La+ik8sNth
	PIQRrMULF+leBbKz7UlFdAk2/zZw81dXaPbWv3uqtH1rL5yuzCyHegCj
X-Gm-Gg: ATEYQzxx9rclYtySSxid2TT/oAtylr1vO/AhqOTZ5p/nwksZwlXhPhs/u8UX4LJnGmW
	eKeVTXKBxPTjmRVMBHWbQqhFx4wW5Iaou1RDA6f+PloB781gsfHBSQLIT519ci+csfEMOifYzGa
	hAO5AnQxpS4S4LH1yYIMh6GAO5C/ticfNwLAn5YGEH83fvNELpiwB/qZfYjHuHOu/iYoaWtO4KH
	C9Ou7FLQ33C3Hfe2G+r0QDbB0CS9iRpML0sXAVB+ke1gCb/h4j810nw2rCjQc0Q3HptMgpf5OhD
	E2fQLU3WfDWADHxvExGG4uJoVkOxstfrKg1J2dXpFOn4COiaSAxULdOImTBRl83BL4J7JsdYHdJ
	h0CFneU4gIrlLcIlKBZa+i7A4Q5f9LxVbtiMd5fPpKXqgFSnMMwh8YncFoNfJlIZ9Va8RcGLvJl
	pOMlleKLzZe+DvmpPV1+OmvPjyK8QpxxiOMNZkkcTkU0XpKUau1vtJLC+Oq2Q1SDlEp6YntEt+6
	eiv/1tGVi4B3l1pEJRmCw==
X-Received: by 2002:a05:600c:638d:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-483a95f5a62mr252604165e9.29.1772037653504;
        Wed, 25 Feb 2026 08:40:53 -0800 (PST)
Received: from [10.0.1.128] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6854c7sm183843845e9.0.2026.02.25.08.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 08:40:52 -0800 (PST)
Message-ID: <4307232b-1df1-412c-8105-d9eab181b493@gmail.com>
Date: Wed, 25 Feb 2026 17:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform
 prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_084056_297586_3B7C345B 
X-CRM114-Status: GOOD (  21.71  )
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



On 2/8/26 12:30, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
> 
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
> 
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
> 
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
> 
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  
>  		err = of_reserved_mem_region_to_resource(np, i++, &res);
>  		if (err)
> -			return 0;
> +			break;
>  
>  		/*
>  		 * Ignore the first memory region which will be used vdev buffer.
> 
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260208-imx-rproc-fix-843dd1031b5b
> 
> Best regards,

Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>


