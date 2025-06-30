Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187B8C83037
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=; b=vuLAvcHQPxU0x957pWt5rH5zE/
	YJR0M/3KzrGd+1KjE4PyN/jGRtQNWZ0FIh1rhdijZahaDnbuFg4kwT04lo2Eh4SF/KkSHfhyXNnDH
	E6ZjgrubY2EZwxmBdCT5q7dqjspX/Wfq609DMqU9QHF3Yk1Vjov8Lf97/M8uSAeSxHiQSJfnsREPD
	k+6p5Pd4swY0a6kFmgIXhqikxTfiStH21vD8EU+jeFRV95l6N+KOaoyu0WA0GXgX1tujadHHsgE+b
	avpxCuvrRpre6M5H5M/7oBylw7DoINQqcVUuy/xgDY9ve8lvOE4ragPVjeCIesbQ9I9Jhpw/8xW45
	Tcdqj9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1V-000000039dU-24Ao;
	Mon, 30 Jun 2025 18:14:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHo6-000000030Wz-1mzV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 16:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=; b=KnWcYElfccm+19bwyZACB2bHiy
	LT28m8a1vFptK/QoShOLbOZRlxTlsotICjnp13p0kWoMfKa8Q40h/BS66nvmsyZYwkoB8c9FxM7P6
	McLb2rxImm2v7hSWHu3+6fy2t+RKuoWngOauoduatCLeKbf/qjnpv5EqFKFsJNX33oryvzL5ax5g9
	FCscm2K9iw/pvaG0DDPCbVERBK+uuibl65S9RJVyIyHwp3U4KdeGV8CFAbz75ra9OWS6WinYPluj8
	Sx1wHTQHHG7Tn6LS04aEw1TwvIw/NzoWOHwPCMkYJlIbDSNnEzFXlmkDP1mJWZzw+5C9Spb7n/kx9
	/9m5ZCaA==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHo3-00000006ohd-1ltp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 16:56:37 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so2076765a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302592; x=1751907392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=;
        b=qiaffNzKSEA9KWkZTyUPqHrPHP6UgYBnybkneMLSmhl8yErcB+/uASraj8FWG9u3eX
         mmPePeJ1IIFczeWon8jK47LM2k66tnj+d8gLk8T/O7oEZe+NI8ir8P4xkBJd8r8b9L5X
         AXl86XWKzpdWiqFduGy23I3DOF5ZsruFYrBT0tzxBuDhQMbxwP69Sqgqkp8zazoy0o/r
         a+uoqDFVgiPkZpOPpaXZ+IckBb3Ttj8RVHqI19/uPjFFIcCO5hHAwb57+d/4QCswdAra
         Nj6ZBjApcQuOpmY5Hj71hTa3g/EpGIJBj/YA+o/96qiug1pXUTWSWLpLd+JFHVT2Kpno
         8NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302592; x=1751907392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=;
        b=OoC5VajeaBltnWF7G2DQxUKBi27S4W/BWoyCsfAgF3UBfBL0SFCVHMVZgHEtB2DTf4
         k93ygq9Q9gFhoQ9fPulAQbRKLiUQfTzl440hwHKE6Ujr2psxhFssOoechgPF8c1R/SAx
         eb9/azQR/gXtuIdhGYaSeA6ITitO7tk5XlG648a+ImFafbmUIvAWJ6gb4IU/P2y5xkFO
         P3ORHbHwPviBtzq7Tri7XcSfbR5PO9NNQawErJlEd8GxkcA7lhZRcbM+V9CPYOgA9bNG
         gXGLMC2Z+Uj96xltXEUPPMWN3ilwI3WH6CcrdQqCVhdGAf7GMURpSw6Si44wYPuiN91q
         yUZg==
X-Forwarded-Encrypted: i=1; AJvYcCV3N9sv2Ow5OYhRttJ0AHN8HcBAEjYs4Eyb2S9cOr+gt7akirLfvOKpcjixZ0thgCoDyS5N5sNJtBG228I4qJc1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6WMqIhIzp7AZfwoLSiSbsEDu82rFW9Bsxu3APgqAI2jGBnBZv
	NezOLHToM36AUnmJACWNcVbJc/YWDfjfCFSOO6AQdvYMLreMs2pG/kJvjt7aZGewimc=
X-Gm-Gg: ASbGncu745qyn5UuQGy6F60cgC16noYgVnKf4XruM/TTAxPt+djtBARfIL7+j8Wti+J
	a0FuAMN3qImQiUNtiFdcRApDht4HlfeU7ZCwSHhsejwyJxjAkXoDPHmu9V8DYKzF9aD2FfiWbC1
	tck/Z/SM2ZNVVHwfMYerN9qg+tfTRtyJdoY3KrPxQ6aGk8g9BTfhP44xrrXdjTP1T/C0r0S/l01
	Vl/zsIubS9gnBsMPZ+j1nv6DcPXOncCIoEEIZyWetMGtykTt/7ufpSpyedrq06FGKudYFiVvB5Q
	wmCs7kVtosGZx/Hx1UugNdwzcMbls1Y5TuneCDF7DjHe9vaBrm7mNiXXwBuK/mBUTA==
X-Google-Smtp-Source: AGHT+IGWDgD+VJi4svWBlq3PHDkqo771atH5H1zxELbsknAHDzHX9IJdZF8QLWZ//OrPu/7q7cX3qA==
X-Received: by 2002:a17:90a:d2ce:b0:312:1ae9:1533 with SMTP id 98e67ed59e1d1-318c911beaamr17432196a91.1.1751302592257;
        Mon, 30 Jun 2025 09:56:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3274:25ba:45cc:d85d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fd6a9sm9115056a91.40.2025.06.30.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:56:31 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:56:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGLBvXtSRlaKujqM@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618062644.3895785-3-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_175635_599411_6AA0F71C 
X-CRM114-Status: GOOD (  21.08  )
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

On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report an error "ELF class is not set".
> 
> Remove the DSP IRAM and DRAM segment in coredump list, because after
> stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 9b9cddb224b0..9e7efb77b6e5 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
>  					   att->size, da, NULL, NULL, "dsp_mem");
>  
> -		if (mem)
> -			rproc_coredump_add_segment(rproc, da, att->size);
> -		else
> +		if (!mem)

Flag rproc->recovery_disabled is never set to true, meaning that since this
driver was introduced, some kind of recovery was available.

I worry that your work will introduce regression for other users.  Daniel and
Iuliana, once again have to ask you to look at this patchset.

Thanks,
Mathieu

>  			return -ENOMEM;
>  
>  		rproc_add_carveout(rproc, mem);
> @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		goto err_detach_domains;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> +
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.34.1
> 

