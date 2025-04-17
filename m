Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB45C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBbHta6iKokVfcc1bePIO7Nx8/nJkoOCsQta59zO56Q=; b=wSPTrwnbgsmY+BzF+Di4LdH/HW
	AFnB75zrv4gUNQ4Bc14MQ/MQcWiTYXuXzMYgHqBY4gvEF1pmSWISsfG0RMFDr1KjMkKMOjTAM7WX3
	ReLCrKJB5Iy0RgpZv1hxPrTjYh0o2PIYll4LXou0ci7qe9DEvuUCvI6xwTC/t7+f7QnSBoOPrNHVC
	z5RAcU2tkWnIUT/s1yEulJ56OVgb/VcTFv6TKCUHnZTrAGwIZb3EwV4QT9LCDuTXaewdwdM1j/nO1
	imQWFZ9vETFqyVKMja3JBaGp/YmdfU7ibPZ/H3Ww3uuqWe7Uol68tBpaQsau9LL3jr2/zTKzyuM77
	Xq2+N8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QEE-0000000DJWa-3TXY;
	Thu, 17 Apr 2025 14:28:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OyJ-0000000D5LM-1WGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D53285C100D;
	Thu, 17 Apr 2025 13:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24DC4CEE4;
	Thu, 17 Apr 2025 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895281;
	bh=qXwSbKoa+3CLa3KQktU6eGBwQ/lN3JxTlgMWrtWYA4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/aFT4KAzeo3foK4z0YCpKh70KkL/axv2rszxLiM/7DEfhxQfevMVARGd5oVb7ySp
	 f53s/xg3FmPkXNdnvkuSopX2+5BJ97mWX2J+VpUnX+FKBe8DLy0OMfKCwgyIKqP9Xa
	 Y944DXO1gMXLyeG8utxvdSDatJpGPMQl8xloeFrs/FwlJsQSztxK+8aPBIYJoMNhmb
	 iPmLVgWQw72SlVGGuOBq6t1nKd630l50OMaVX24lpwpdUCIAUIp+VOeCrLk/HfnqCU
	 QtwPtobCRC5i8G1j2hadf9La2MWbV7sja8SWxagGFV0YItyY2hG3osM4vanhx4qyiv
	 p+xPtSl6yGXVQ==
Date: Thu, 17 Apr 2025 15:07:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Message-ID: <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_060803_451363_B7720F95 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Sven, Hector,

...

> +/*
> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
> + * use 100ms here which should be plenty.
> + */
> +#define TRANSFER_TIMEOUT_MS	100

Please use the PASEMI prefix here. TRANSFER_TIMEOUT_MS it's not a
naming belonging to this driver.

100ms looks a bit too much to me, but if you say it works, then
it works.

> +

...

>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		/* XEN should be set when a transaction terminates, whether due to error or not */
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
> +		ret = wait_for_completion_timeout(&smbus->irq_completion,
> +						  msecs_to_jiffies(timeout));
>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
>  
> @@ -123,9 +150,35 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  		}
>  	}
>  
> +	/* Controller timeout? */
> +	if (status & SMSTA_TOM) {
> +		dev_warn(smbus->dev, "Controller timeout, status 0x%08x\n", status);
> +		return -EIO;

as before, these warnings are treated as errors. Can we just
print error?

The rest looks good.

Andi

> +	}
> +
> +	/* Peripheral timeout? */
> +	if (status & SMSTA_MTO) {
> +		dev_warn(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
> +		return -ETIME;
> +	}

...

