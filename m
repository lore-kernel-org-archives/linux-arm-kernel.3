Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736D5CA5FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i56GTaGC/9+4V5YZ5iJPhAgIdFBtU7C0Akhyek3/LY=; b=E6PZB5wRGerbMMQJi62wzhW3ZQ
	g3XjM3h5IXU38UW3/O9XIWG1t/D0Vv/g1eHnY/Q8gD3nL/eb3F06BOUrU7RDovmRklBI2ee2Jcoid
	lEPcogr8e1IXc9AoRwlUiaQthnoTt1iqIEoiSVt8KYVcsdUxXVor0V/WrJaWZmtCRR6/IC5u9Y/Lz
	O+4P58b39w/ulZvp6vAGlJk/CmR2Lq5FDZjLirDzCbSXhAy8lK4WTnU9nhMztmjn2hKc/TdgvxERU
	maHSB8TVCpzF79iH1en+ww33r8HIwvhNL305UqlndlierCpTGqbDLfZpuX9diUY17CoacyOapPaof
	dcLw3jNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMAJ-0000000EyMW-1OkA;
	Mon, 09 Feb 2026 07:58:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMAG-0000000EyLw-1Qe8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 07:58:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBF3FC250FF;
	Mon,  9 Feb 2026 07:50:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E43686074B;
	Mon,  9 Feb 2026 07:50:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36883119D14CA;
	Mon,  9 Feb 2026 08:50:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770623442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8i56GTaGC/9+4V5YZ5iJPhAgIdFBtU7C0Akhyek3/LY=;
	b=2PrvtuiDY6gwTtoHPX1LiFaakxuI+sc52SUFwWRWHLSbLs1lFfcIXKcjtFyt92kfYmDe1H
	N/NFH/orRCnrW2cbOy1t4qx+hrAoRV88T3XYIrlfiWc4qj34Ib9NxWNHSKv3CN4Qle8BT/
	XeO1CYtdVM7PItm4Pg1OQuTe9Q5I4cQtyM+JPPY0sQafefaoVf/sW3QPF1J4SRzhtwCqv+
	SEgk5KZl93jdSPvWu7VqAJ31XX5d8l3gEwU792jRZaNgfdpmt3zIrDvF6Qbdc4hobV/LnJ
	VjV5cfcrJJ/+xfdkYDBRjGS5N27mT+iua0aUGJ9CqPaqiF2wKO8YIEv3TM8b4Q==
Date: Mon, 9 Feb 2026 08:50:35 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: qiang.zhao@nxp.com, chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix error check for
 devm_ioremap_resource() in qmc_qe_init_resources()
Message-ID: <20260209085035.1d7db80a@bootlin.com>
In-Reply-To: <20260209015904.871269-1-nichen@iscas.ac.cn>
References: <20260209015904.871269-1-nichen@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_235836_525266_8CB82B07 
X-CRM114-Status: GOOD (  16.04  )
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

Hi Chen,

On Mon,  9 Feb 2026 09:59:04 +0800
Chen Ni <nichen@iscas.ac.cn> wrote:

> Fix wrong variable used for error checking after devm_ioremap_resource()
> call. The function checks qmc->scc_pram instead of qmc->dpram, which
> could lead to incorrect error handling.
> 
> Fixes: eb680d563089 ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/soc/fsl/qe/qmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index c4587b32a59b..672adff8e35f 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1790,8 +1790,8 @@ static int qmc_qe_init_resources(struct qmc *qmc, struct platform_device *pdev)
>  		return -EINVAL;
>  	qmc->dpram_offset = res->start - qe_muram_dma(qe_muram_addr(0));
>  	qmc->dpram = devm_ioremap_resource(qmc->dev, res);
> -	if (IS_ERR(qmc->scc_pram))
> -		return PTR_ERR(qmc->scc_pram);
> +	if (IS_ERR(qmc->dpram))
> +		return PTR_ERR(qmc->dpram);
>  
>  	return 0;
>  }

Yes, indeed.

Thanks for the fix.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

