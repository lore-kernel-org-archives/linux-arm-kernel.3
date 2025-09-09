Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E64CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=; b=dE4xwvVVgpps+IzxMWnVNe5jlh
	y+6JiCBeU6OQy4U2nbH+M5o4Na6aC/8/j7CUYwQCm75qnVEhrd0rKwzIsE98rrCEmVxU0jul5l372
	jYHX9gptYMShwzSRyoA6wNWfc2UrfkbvNdR2KnfRtLDMEtqJg//33KxhZXqOjuaNiK9v2sE0tMwaR
	EWGH80AJbhnXU7+GLhcFLWppZ7FN9UJsD2tOpNQ0FJa3a9yUKU2EQ1OS7Dq1rNMhyRAj+dL2+07Pp
	GCsDcodnMq5sdhCieuD7G/WywTBKymbtj4slCdciDh7lh6khzC/STsW3MNWVfemWpUHB5XBDJKaRu
	OrldSV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30C-00000009OMW-1gNZ;
	Tue, 09 Sep 2025 18:23:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30B-00000009OLw-1yMr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 18:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=; b=QouBvABOOv4CKBL5e8+ji3jtPE
	YuX21VUIOkqI/9GDEYzI95/puQnn8kQWTRjOu9zqFDZsuUFi1OQGwZSkQTjksYEbWovuYqM5qXbc2
	/BeLTtRfuEJndaLRoBMeaXE2hkTahFDGjaNcCMwu8vJwy/Mur6D6H6YjHbL9eRUPd3LjlzvIINDOh
	QnCtLxynh37xmDHKkxy2uvvn5BVxVJDGoJOCFUnwqBQr2/pedRTQRTGZNwHzijplzgyoVRUEkdxIX
	JssWw/EDLDCCHAGybZAMwFuh96zJZbEVPkGi7/7TFRTPZT9R2AGsEyb75/wIKN0ynuXONUAI0QDdq
	wDfxbpIQ==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw10f-00000005QSw-21Y6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:15:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso3848811a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757434555; x=1758039355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=;
        b=oy00fwCaWM4wVcTnFHbr5f4hxFYr0ECwDEhgapfwmMAEdZejsF1OHTs38IsMURDDES
         uvR4iRFNjLSqlHZdFUw+sjwpyy1qx5IopYYl+DE7XmpwzcE/XmKuXN/o+nalMeBoak+t
         u1zXXPaRF00PKsm7QpBfCXzIiu8otDtfGZnwrgrpraq6GTC+SCIxq8K5LYBAynACio3G
         /IcYoYuCBgL0dkkkBWD9vvSCrROBJHeDj4yc8Xoa0PVpAvovhg6wueSSPn3Y9kQg7Int
         bFpRxn4xTBTsuCb10wFxOT6i8q79jDAboTGrnuTdKzbzZglb2ecmBBQXty2a8+o17BOn
         y+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434555; x=1758039355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=;
        b=U8Bv5GaY8U2O9rEuZMOHVEHmuXhIDEm9CQIUL42d1SuPHLRiOioj8EXdmfAOoWdJxr
         yo+EgDNdbQyTLvS/fF3HgCVBYA/A2MQpFuXnzjrYXCzGGL5UuePae+Zmn9uWfOJysH5s
         qJ2D6NEht45LkPTSSmRYvs4lg0qGvxtdIRV/lAzX2nli5U3rGN2tPw3X9DE3RE397kHp
         clrI2mo8MRJRohZ4XrvhvpgXb8JBp7vI64A/8DnD/ozM/fuPR6QtOcbRc2yiTbznasIz
         c+HcgZXSV+r9+0YGYmd2lPoRZSI6z3Ah8uhV0fUaWGvurLt4bALU3/I6EbYfq7hulkaT
         yGig==
X-Forwarded-Encrypted: i=1; AJvYcCXMyEvC8oLU5sNEeCQziZ/SIvMwJ5Al0sqO6qel+mxvpie543FT/R0gkgEEfH8RFfs9FCm/C2cW4yZMRK2ly3jj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+k1fo+eCWmJUEB0E0JNgGn5Qrdmu9EEZofSUvdtWVhZTgdj8/
	oViGOPOV0kH82A27BWtxH2zGwCBj6ZxuTDy+lDAx69jiLAWE99CyWoCXg/qUK94M1dU=
X-Gm-Gg: ASbGncv3S7dC7CPDvd/Y4+RZOG7MkdVv9yMyp2OD5bxYWN7DfPYtXlV6vasWC5THwN3
	TUlklIEdmXiqOGlSyevCOHzXIY4FbfOAaguDdUVXEWyZ3vx3N4+Mm8eB0oVOTJudcwbitAGhS/i
	m0DaiMHAwuGa6uShS7sn8DILzYVhtouVwGCTptJnvp+0FGYon4X17x33G3hu0aeh1Db8lDzuxEz
	hvwFlGAZYvgEkLr3+doOnSLLswrOI8IRlYTAUUYLyjsbhGp5UFPTzLtKDFoqsS0JBQzCYGWmw7y
	OpcnH/fjKGOqfFSaOFnPfO+1h1WSzGwkIeSrufkyKBKFr/aOjz4R1ufgqbE6MqhtJzG36Z1xkvh
	z+G821as/dx1rohGkvz5jv+oGfwKU5ZAOcueOIhSiZpOgb7ViczcGlSeFj0sT+FfSIpgiJPNzhf
	/inWXUgmpqx2GE/F+iUEvjBjpbJaeZYFYgC9Q=
X-Google-Smtp-Source: AGHT+IH55jBXQuGrRFWB7QFDwp0aHH2LNHjhqhfqYbAFcay2HL31leHRvKu+CE2zXWHS10Yrl/LklQ==
X-Received: by 2002:a17:902:e884:b0:248:811e:f873 with SMTP id d9443c01a7336-25170f37b15mr169800035ad.36.1757434554322;
        Tue, 09 Sep 2025 09:15:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e31e:18ea:d6c1:d90e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27def96esm2062685ad.55.2025.09.09.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:15:53 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:15:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMBStih6Wi_isn2N@p14s>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_171557_672646_E9BFF808 
X-CRM114-Status: GOOD (  22.75  )
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

On Mon, Sep 08, 2025 at 09:07:39PM +0800, Peng Fan wrote:
> With the switch-case in imx_rproc_{start,stop}{} removed, simplify
> the code logic by removing 'goto'. The last switch-case in
> imx_rproc_detect_mode() are no longer needed and can be removed.
> 
> This cleanup improves code readability and aligns with the new ops-based
> design.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5fa729f4286f6ac939357c32fef41d7d97e5f860..ed8395b097d07d02e5323550ff497819f9b95ad6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -323,14 +323,11 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	if (dcfg->ops && dcfg->ops->start) {
> +	if (dcfg->ops && dcfg->ops->start)
>  		ret = dcfg->ops->start(rproc);
> -		goto start_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;


Here I would simply refactor this to:

        if (!dcfg->ops || !dcfg->ops_start)
                return -EONOTSUPP;

Otherwise this patchset is going in the right direction.

Thanks,
Mathieu

>  
> -start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>  
> @@ -380,14 +377,11 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	if (dcfg->ops && dcfg->ops->stop) {
> +	if (dcfg->ops && dcfg->ops->stop)
>  		ret = dcfg->ops->stop(rproc);
> -		goto stop_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;
>  
> -stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -1000,13 +994,8 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
>  
> -	switch (dcfg->method) {
> -	case IMX_RPROC_NONE:
> +	if (dcfg->method == IMX_RPROC_NONE)
>  		priv->rproc->state = RPROC_DETACHED;
> -		return 0;
> -	default:
> -		break;
> -	}
>  
>  	return 0;
>  }
> 
> -- 
> 2.37.1
> 

