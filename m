Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A99C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7N2KTP9Kvaj+V0lqZJH8uAKpHq0RJXEMa2R38LKU4Ow=; b=LN0yS1Fo8D204eMn3v3K98NEii
	h9jfnpjzys+w5lksERHK6JStxWC5p5g9I94THhJWv9x5owtgxmy7K4xl3h7TM7D2HG/vUGeIIvlb+
	POP+rU/jCvAf/MwYN+QwPPEXtXH5+b/Gq/C4o1+8AkUV3n+ZPaEX3ta2bTageKOnZ/gpWYLQIcH9R
	GJMZ9jE1lnQJqHFCoJXRnW2IGonk9inJNPb3aRSg/bS0PIsXiC+0V8CuVxbeNqtEk4AX1ExYLw/3Y
	FwgecEinc0hK8wHMuqnwpWiZ6zuEATF7FborBJmz4eCU3r8f/tNysadNFutPguebfqILyZl9Dfvjy
	ZphczkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Oxs-0000000D5Gw-3GLn;
	Thu, 17 Apr 2025 13:07:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OoP-0000000D3kr-2okY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 200EAA4B3A9;
	Thu, 17 Apr 2025 12:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC70C4CEEF;
	Thu, 17 Apr 2025 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744894668;
	bh=jC0ewz2A/v8CrSY20r308WeEKgKCaEyIUxe/Hk7E6J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VR3HJlu15hmEx3pclURVQi97YKgePzYYoTA2ePOiGAW/6HvipNyAy9RUECrGMMQmU
	 b7lCeIFTHxUiRMDFzvMlxtB7jzfFC5OP/8NEJm8DlFDx5cBmlXkbSvbXRyzl1atFPA
	 gdqvlxTrq/wACQK5ixXKtHAXyhlF9P1cRe52/qkvBDGY9jdguA5Kx6TJijGg2/UWPt
	 tO4l9mEtcQ7iwQ4y/TBf1nEF92o7pjBRWVm/b0lmgLqqS6bcr+A9vuHYd4IlBRrHBc
	 rYnvFVvvyXYcGM44GwzxDngKB2VyRtvDNj9ryLJv0fvfKxvQz9OMtvzqEHQ6bOFzdt
	 0E0r0U3UBbHhw==
Date: Thu, 17 Apr 2025 14:57:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Message-ID: <s67nprw4a4xu3eqgom4hu6tvabt52l3aq6hp7klnkb4mocbzeu@rsyvaykn3e2j>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_055749_770660_070C4A02 
X-CRM114-Status: GOOD (  11.33  )
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

Hi Sven,

>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 100;
> +	int ret;

can you please declare this "ret" inside the if() statement
below?

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

this is an error and it's treated as an error, can we please
print dev_err()?

Andi

> +			return -ETIME;
> +		}
>  	}

