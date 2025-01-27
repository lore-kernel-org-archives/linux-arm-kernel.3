Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D71DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snJzHLGLUFIgdc5a6ktVN6chVPoIl5sBLs6+wMwFcoA=; b=flqDb1rXA4ygNf2PZxGgU3AGoU
	1ySbK7kKntqTkNBGitV/bMxNNqMzc0P4R6NAzFAGSvt7Kjqg97JYBsLIEyYUscjb0l5mIvu/A69hP
	A9qvSsvBfLNVVMu2Mj3BZXQMz4FGZ1ICGEkw2prOQZmIqG53xKlX+wacBhWE6PB3NcdFNEQxKTESI
	GBV7tbFlzH+5U1/lF4lQEEbzCd+yZkf2cCSNMe9JTP80i8PzjIe3Nir35qGaJNn1uqZ3BEhCXLUZe
	9e6E7T23wakeu0EspCZvoUcnUc075hWmf8eijZoF5t+Q3ml9MuJCnlwyNc+Q/QM7wA2N28Qxe95tY
	iNlywIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSEB-00000002oKQ-1kiV;
	Mon, 27 Jan 2025 16:44:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSCo-00000002oAF-3Igh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 16:43:24 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50RGg5ok1861149
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 27 Jan 2025 10:42:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737996125;
	bh=snJzHLGLUFIgdc5a6ktVN6chVPoIl5sBLs6+wMwFcoA=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=fNFKjOdXWJ0cifidahgVl0rRh3l6sGMWgVOPOBf81Y9wcKy+xdLTZ4BYTNQ59fHXa
	 cCR+vbwihFWxo3i9zpkIdSLKMibDLu38B9ac8ik/h/PkpLLtCKS/B5sob2ntzs0TMZ
	 qKd7JDcpMFbRWWsggPlUjOkomV9k0CkaxWAim1Gk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50RGg5cA127456;
	Mon, 27 Jan 2025 10:42:05 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 10:42:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 10:42:05 -0600
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50RGg4r1125338;
	Mon, 27 Jan 2025 10:42:05 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Martin Kaiser <martin@kaiser.cx>, Herbert Xu <herbert@gondor.apana.org.au>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH] hwrng: imx-rngc - add runtime pm
In-Reply-To: <20250118160701.32624-1-martin@kaiser.cx>
References: <20250118160701.32624-1-martin@kaiser.cx>
Date: Mon, 27 Jan 2025 22:12:03 +0530
Message-ID: <87wmegi4ys.fsf@kamlesh.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_084322_869502_088EB519 
X-CRM114-Status: GOOD (  13.83  )
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

Martin Kaiser <martin@kaiser.cx> writes:
...
> @@ -169,7 +178,11 @@ static int imx_rngc_init(struct hwrng *rng)
>  {
>  	struct imx_rngc *rngc = container_of(rng, struct imx_rngc, rng);
>  	u32 cmd, ctrl;
> -	int ret;
> +	int ret, err;
> +
> +	err = pm_runtime_resume_and_get(rngc->dev);
> +	if (err)
> +		return err;
>  
>  	/* clear error */
>  	cmd = readl(rngc->base + RNGC_COMMAND);
> @@ -186,15 +199,15 @@ static int imx_rngc_init(struct hwrng *rng)
>  		ret = wait_for_completion_timeout(&rngc->rng_op_done,
>  						  msecs_to_jiffies(RNGC_SEED_TIMEOUT));
>  		if (!ret) {
> -			ret = -ETIMEDOUT;
> -			goto err;
> +			err = -ETIMEDOUT;
> +			goto out;
>  		}
>  
>  	} while (rngc->err_reg == RNGC_ERROR_STATUS_STAT_ERR);
>  
>  	if (rngc->err_reg) {
> -		ret = -EIO;
> -		goto err;
> +		err = -EIO;
> +		goto out;
>  	}
>  
>  	/*
> @@ -205,23 +218,30 @@ static int imx_rngc_init(struct hwrng *rng)
>  	ctrl |= RNGC_CTRL_AUTO_SEED;
>  	writel(ctrl, rngc->base + RNGC_CONTROL);
>  
> +	err = 0;
is this really needed? The only time control reaches here when err = 0
in below equation
	err = pm_runtime_resume_and_get(rngc->dev);
	if (err)
		return err;

or am I missing something?

Regards,
Kamlesh

> +out:
>  	/*
>  	 * if initialisation was successful, we keep the interrupt
>  	 * unmasked until imx_rngc_cleanup is called
>  	 * we mask the interrupt ourselves if we return an error
>  	 */
> -	return 0;
> +	if (err)
> +		imx_rngc_irq_mask_clear(rngc);
>  
> -err:

