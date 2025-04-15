Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24FBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ5TeuXVlqIBcTKnyUPN6n6PTqhb3E+xVpAkmmqWBI8=; b=jdhvjoi5FiopoqlkYCaoI2vdGR
	QuFarLCf2Yn3wqKS4SBrSXllUNeCDnSqgf56gT1MEJ9CEDpMSXNnZ42OTNWfPb/vYJVAzzy/5+N+O
	YgDxPiBPLiyEN58SYGVd0jKyex8SfufocQSbT99U7v5sQy0CA0e1g7Wjxck0cTAPLhizwfO1pufKf
	agPQwoVifOfQE2buxhPhxboE/1b5DYdBwGJZH44J70guChghH+dRU0OfKiaGTTh0uERkdz/tVfWPQ
	/5j1OvQbYhyolxAbPF92gI5QpHEgEIiBt+hCThG2aHzZrnnan3JianlOdPw39wJwCRCuXZ0lTwvcl
	sesbL0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kBE-00000006aJd-1VtR;
	Tue, 15 Apr 2025 17:34:40 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jpG-00000006WYn-2fXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:12:00 +0000
Date: Tue, 15 Apr 2025 13:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZ5TeuXVlqIBcTKnyUPN6n6PTqhb3E+xVpAkmmqWBI8=;
	b=oFlrKFE4LAVCgIG+lnbBcjPxf379TP8S57q7VeZGqKPSLoMsXkqz8/bW4DFZwGljq48SIS
	5JGRUASghmHz8I2DS3FnnTTUgSbCY0OVjCB44yrdsBbb6gaQTdplmXNS7Pr3MbmMic8/il
	u/gK8rVWZGtJCJgA9lA6cPzx7TsCgtf3DtsLBSv1Gcjmtj3lA+cWhzUf/0ySFFQGq0uivf
	3+nDtOlNfKhzPEd1yBjoNewkC6tThMgDjJvj06zeuH71hXyaGylesqRmtdzFBQtaBWdSW/
	xuR/GbERtUk8S47AzQ2lxF5NDnBA447wq2R7byXt74R3ZcoszoXceD0TmqeMaQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Message-ID: <Z_6TV-tPU2wRdfFf@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_101158_812587_8F4AC453 
X-CRM114-Status: GOOD (  19.05  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:57PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> Add proper timeout handling for the interrupt path.
> Previously, this was only correctly done for the polling path.
> Note that we drop reg_write(smbus, REG_SMSTA, status) here which
> will be done anyway whenever the next transaction starts via
> pasemi_smb_clear.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..9b611dbdfef23e78a4ea75ac0311938d52b6ba96 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -91,32 +91,42 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 100;
> +	int ret;
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
>  		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
> +
> +		if (ret < 0) {
> +			dev_err(smbus->dev,
> +				"Completion wait failed with %d, status 0x%08x\n",
> +				ret, status);
> +			return ret;
> +		} else if (ret == 0) {
> +			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> +			return -ETIME;
> +		}
>  	} else {
>  		status = reg_read(smbus, REG_SMSTA);
>  		while (!(status & SMSTA_XEN) && timeout--) {
>  			msleep(1);
>  			status = reg_read(smbus, REG_SMSTA);
>  		}
> +
> +		if (timeout < 0) {
> +			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> +			return -ETIME;
> +		}
>  	}
>  
>  	/* Got NACK? */
>  	if (status & SMSTA_MTN)
>  		return -ENXIO;
>  
> -	if (timeout < 0) {
> -		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> -		reg_write(smbus, REG_SMSTA, status);
> -		return -ETIME;
> -	}
> -
>  	/* Clear XEN */
>  	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
>  
> 
> -- 
> 2.34.1
> 
> 

