Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F388C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=; b=Y3+DX53HnIrpKo/mMfpviV8QwB
	8HJSiEbs67ESt/3OJeEtXojLeLUeqmEyGGrNiNz/1MwPF860LqWt0bh++iKlMIgDRrc8u2QTOV7S7
	PfsW/f1OvvtopM9B8+gcQSMZ62HXPYnfauDW7lp1cO3UFqTi1AaTMM/7fFeLx9EbAFcVoRTrXHHcK
	uxN03Wg8lnxaIDK+oUG31ijhEQ/UEdlwAUmAj3XiJX+GcwuEPAbUgbyEw8QU6Z54HEm7SnrK3Nvwq
	DAU1slcQ8amglATu54rKs14EjEzbvX1ZEUZWdjWcHDODoHSskYdQf/6J9w8dqW2Kr+FNqUfrQu4QA
	t8jNg6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oAo-0000000FJ9M-2Juo;
	Wed, 02 Sep 2026 16:50:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oAm-0000000FJ8n-24gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:50:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d9db539a54so12376365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788367851; x=1788972651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=p9kGLucVrIeVVJPKPnLDJM9Q3QeMJL7BWRiVe84HbKAhNbC9gGvHu4Bf1hA7G4Zbwv
         5Uw9WWkNdNSF4nSsALHo3mWVNt7VpWIwjuW0JpCZFiyKSv0hWznJz/pf+fg/G00TYPvW
         smQa7CZAjno77FnhVg/JTWLGYBCekfZk5KToXrTWVND9yO6zR6EeghmamyQIRlyg9Z8h
         hKQ1WlMY8MgfvP3vDRF4JNKLJUWvAxlBGaFrok7eaarYZTsC6cYNJvw9MW7ytahnk0wx
         mb+BpWTy5qMLKoxcwYTQjXd5ftvGCvOBz/EeYeVwcgzP2AZhtzFL0iSldoUB1T+7Msj4
         Kh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367851; x=1788972651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=K7n2zdH6LGApUI9kYoiESOlrb1a8+lUwAsEZyuUyzdu54IoLZ1UUOFPtJWNo0nAd0e
         45uRfn6zIMFCUXNSa4n4ymCZxWKueFBJGzpz2HEjYhepFTyZwgRZVkZXkS+2Pva9ypyv
         wqIv8H8mlLeFjRXk2ZhjDc033U64WDOhQMYIsBjdWRFfhzwhj0zveupbqr5vBHEkB9cn
         mHLU/0q37RarLVbe27AxNFK9sOXOUhTP1FTRZnXJaY+jHE5lGwAz5f+KF/JXL4Neu8Qn
         nK+yYBcYUAJCE3eC7WSbtWNGsFBf1P8Nkabln9TRqvn1tYq9yi4c+N71kOeifdg8ADUF
         qRZw==
X-Forwarded-Encrypted: i=1; AKwUvBwWRwVpnV4/o8O43e2J+Cqn6qy/lJWlV9Ft9RxWvL3rw8OShmvvw3us7/7oBouXkxlgbagqMCXuE60e6p9pK0Bk@lists.infradead.org
X-Gm-Message-State: AFuF++n32k83+4iXwzxQRRpJ2nLBcwvQlyBDrirAVJZFubY4ltRs4fLV
	Z8eGApcj6534n4PMdqoPYwUTO604E0z5V3pIoB/sBgCu7PUlc0EzJbxZcaDVUHBoIrg=
X-Gm-Gg: AYBFou3jIBMOGPGNxWqIx8pkTXqk53x/ai8HjdIjbGxZaHc9/jReIiF1j4CCvzenV46
	E+kiEnvGuTs0HthbTfnKcCKwpDkBiqVZmTafqhJqCgoPcBxltAi2+WlbHGQiu+6MHl40MwdcyQs
	lYcU+Qb1cNnfaj+1G67/WBHzmxFKutiIYvJNEz861qfCrbd+hq0mFPPtxNiTBgIY0fVKEyBbRTc
	r8gaQfVNTetdSRTmRL88SRQnucKQGyJjHwpJfe6OytcU9JO/uzsiLVolrCl3HXxY0ZFPozQlkft
	zrPlj37tkQQgXzfMXF9YuoT8+CQqWmnPkYvs4QRgHtnaLLitL8A6CVIHJ0+hCeJtOrEUzJ3+ECW
	8OuqhcrKk/ywTTKzeRPncF7aej6uijXEfmaclRNrBiyJFet9sNnNGnt4FzPr1VLSVwUnXRLJVXD
	DKjWY4DIE5x84MmCrNOfd2LGlOJShwcc8ilDDoVqjlQ1TtA5TyD297Od8i1JTkMRt8
X-Received: by 2002:a17:90a:d604:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39aee16a169mr9561954a91.24.1788367850624;
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07ac1174sm341938a91.0.2026.09.02.09.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:50:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp: acquire runtime PM before adding
 carveouts
Message-ID: <aphT5wHTNcGvbkjq@p14s>
References: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_095052_557042_DE0F8634 
X-CRM114-Status: GOOD (  19.98  )
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

On Sun, Aug 30, 2026 at 09:33:10PM +0800, Pengpeng Hou wrote:
> The prepare callback publishes DSP carveouts before acquiring the
> runtime-PM reference that establishes required clocks and mailbox state.
> A PM failure therefore leaves the prepare transaction partially
> published.
> 
> Acquire runtime PM first and drop that reference if carveout
> construction fails, so a failed prepare does not add resources before
> its hardware prerequisite.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index fd60c67ba8a9f..96d619daf3f5b 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -726,14 +726,17 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = imx_dsp_rproc_add_carveout(priv);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
> +		pm_runtime_put_sync(dev);
>  		return ret;
>  	}
>  
> -	pm_runtime_get_sync(dev);
> -

Applied.

Thanks,
Mathieu

>  	return 0;
>  }
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> -- 
> 2.50.1
> 

