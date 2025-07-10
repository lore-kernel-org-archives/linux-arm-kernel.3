Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3908C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=; b=nPKCD8epyx4dy1T+Ylf9iL83vC
	GkQ6NU7DV51Urc4ScSBO4ov+IHj+J5ziLwlAR6IaoRzfajdi8YXGE6QMQRd40iR8/Or9Go+gR4yZe
	dgl1CLcFifgfHcAOj28W0z6WdvaQCMDh8hxWNCyg+lElmTnutpeuI12Z7EfYB1tv08KOpwaRSqn2E
	Xia8a8EpMFg+4Ie1AdMfls4Pb5NuQlFsmDhM6bzpIQDDjY/onPkGSAGljfVMv17nSdqgyJf23w2kd
	y0vtC1scL31BCc5+0BtIFr8vMQzs7sH5rLK6EkpBM//L0P1O79wJC5dMclomQ4PWsosk/vyyVI9dL
	5JXpEgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuoG-0000000CXy8-2tuh;
	Thu, 10 Jul 2025 17:11:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsaF-0000000CAe2-0eCB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:49:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235ea292956so11763485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158950; x=1752763750; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=;
        b=ZMAGtIIXL5zu73V+bFvVE/19HzjIn6uxfw+H2qSxT51EFdbYa/XIvDZ5JVUAJreZ0k
         4nJn2uF0BHPJ1eXEjdHXB/RQKrMF80v+azYbVq9makqjtWg/1wmuxBUCMtzch4Kmeo/Q
         cNY/CH1u0gTx/7TqnXXB+4dcP0CvCDG3Sd2qJG5w405n1qTc7mTWRS/AVLISZl7UTrO4
         S+5vRBvq0SiYK1Qdizb/guvqQxttixVEBSekvtHRzzON6bEuaAKcnrZROu1m/8u4+J4Q
         D2LBegkeYlUc2tXnO9+x+7CU6hvqRGt3BQJAILEZs+Q12CA612eom64C5aqSUn9CBQCL
         MwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158950; x=1752763750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=;
        b=S+YaSc1DbXsnKnjXClHdT8ByVInIbW+zvQ/VyjzbAKLByU056fFFXNV2MyuNuB7yTe
         kxeV+AgOf3cMcSzdU1qhwoPwgLneHjpxDED2bTeIxvKkI0UMXhIvI7xU6W0h3bbKIGm2
         BF7vVzxcRaZC7zfdXzTtxgLg/5km1RZRUL/dYI2pbAibaTC/YN755SUPhXDcEzqCQggb
         knbQtiw77h59DQcFNezDS7aCFmltQ4zpg6HNo/0CmlLtC59p8OBQqav0hRgva539ot1c
         pHYBTcqmjGmk4iQFhqcxPbS8ICfjWFWci8GLCEq3lLZZ2WFtQnzTTwaGc6PRJdDV2QAD
         Xzrg==
X-Forwarded-Encrypted: i=1; AJvYcCX2B/eqpg6ZHtjEkRr0QQ4IBfDRj9WB2956pm0BHs02RfhY2ZmAJpxgJbMRvXb3g9Quk7TNuRfDYikyMUM+GXA1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6b1kD5bNdYHDBO3yb0cu+7z4GV2Q1/J2EPAJybV0JGXlbeME0
	qhndMHCieQX9Wf73h13Oqf/oZen5opFxWluWYVzdrvAuMHb71CkyCmiUUwtd6qOZuzE=
X-Gm-Gg: ASbGncvIQW8ZFs1gEpUGwNom/XbizDGBxZZkkN14ZVV9hLISrnVn+SF5GBEAmlhT0i1
	G3+GZXTbSQhR/1R8KgcgTPgmwrJ/hppkWQ8BAEa+iVR8ooKJU7oFVG4DipOQdAiOVKQpOOKUBpm
	haTYYns8rp3uUMBqHBlYtjMHq2Cm5E4etc8gdaSqQndttpZU6UpDdBV2BlUn3iY/Pdk69DBCrw2
	/EKbCOhjLIq1nmG3Ds7KsJxacEuhb2dssIW2//Ubz6jhtDpaJKJX5vQR4jvkewlNe/yNk+0NcGc
	Ddn2og9JNrA+MfxR8gCI5EfGtOwr0YX2uFUSStR/4KyZ6z6coHfyIdfVx3rGbDBs
X-Google-Smtp-Source: AGHT+IHLOaTbeIxYAUR/yv9JVTQenD6oK2Ov/QMFGUQSqoTLIPq/eEsamfgUWhDnHyTHM/izk94ISw==
X-Received: by 2002:a17:902:e84a:b0:235:eb71:a386 with SMTP id d9443c01a7336-23de48b620bmr42210185ad.50.1752158950381;
        Thu, 10 Jul 2025 07:49:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c1:4dff:9df5:b97c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c301a8862sm5390817a91.37.2025.07.10.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:49:09 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:49:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aG_S4xA1uwbwVimP@p14s>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704052529.1040602-3-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_074911_194918_B863072B 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, Jul 04, 2025 at 01:25:29PM +0800, Shengjiu Wang wrote:
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report error "ELF class is not set".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ba764fc55686..6e78a01755c7 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1205,6 +1205,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		goto err_detach_domains;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> +

The previous patch is small enough that this should be folded in it.

Thanks,
Mathieu

>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.34.1
> 

