Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C85EC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 00:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4re5PQvpoiSUMkMH5+LC/XgtaMh83lF3Lx0UPHLfTU=; b=3nlaJCVwt2J8/DL9G11PFIb75l
	umm7kjXEvOrGLoKFhGlC4eaff6ENzEGSmLZkHDi5bHFrzmXcu+oC7oRdjvLWDp3qsEiMJcrDfD+G/
	cjF95deOU2WYHv8V/GyITtenJ81/jGzNqBd97oHClBbQ+LnblkU2HY1IOEuiKgUVP36O8bFNM2n0L
	rYSrNqnERQWIVIcuPwXBI6xqTk4cu7uYI1r4oU/MjMB1KRXGIZDaSofrCbr0LHHwXn528DYxlupPn
	9oWVKkE+xy9i9TuRfJa3ZlixGKg5LjVsR891u3FVAT/2hVkzGge//h5w3sFiZAhLitu1vOIXCnfb0
	zbP4UZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3cu-0000000Abia-1NRH;
	Thu, 20 Mar 2025 00:19:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3bB-0000000AbUz-1gfc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 00:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD8185C101A;
	Thu, 20 Mar 2025 00:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB01CC4CEE4;
	Thu, 20 Mar 2025 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742429844;
	bh=2y/dJ4wHb2mrgocbKn8ljT/pAiya0DW13gSxj/rI8uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3SqfcKxCqyPMWOJ9NSQgdINsa8TSI+AC7nYUeOzvewHqrjYbPtrCfZqG8vF4llvd
	 VStA0W9qBho0AXDAlUqtgpDNjrPn2s4989Ep5n92bGGDBD3wkS7SpVPcgXDSN2gXnT
	 YxMNGFCLb6tMir0ZgRn0cMuZvHTa31OY0nb9BbZbfctJzDnZFFqmXnoUHXG8qy5tVd
	 FM7wP8tueJ8HyI8tpLFcPuU9cy6HA4poytqqiXVIhy5klZEjNGc6K+VWVLuEgx4sgV
	 1GFNx6GOZW5Bww9hVt5eLJFOh3Og7UczOlJ6fraJC4Hot7PvuZb1zgoaJ/kL/kRZX+
	 sYYjiUchVfQDg==
Date: Thu, 20 Mar 2025 01:17:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/4] i2c: pasemi: Improve error recovery
Message-ID: <mp77oombs4xgr6sjj44ne7muybfrwejgehzv5xupeanh6udui3@ymgfesctindh>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_171725_521849_4B212EAD 
X-CRM114-Status: GOOD (  21.09  )
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

On Sat, Feb 22, 2025 at 01:38:34PM +0000, Sven Peter via B4 Relay wrote:
> The hardware (supposedly) has a 25ms timeout for clock stretching
> and the driver uses 100ms which should be plenty.

Can we add this lines as a comment to the define you are adding?

> The error
> reocvery itself is however lacking.

...

> -static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> +static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  {
>  	unsigned int status;
> +	int timeout = TRANSFER_TIMEOUT_MS;
>  
>  	status = reg_read(smbus, REG_SMSTA);
> +
> +	/* First wait for the bus to go idle */
> +	while ((status & (SMSTA_XIP | SMSTA_JAM)) && timeout--) {
> +		msleep(1);

Please, use usleep_range for 1 millisecond timeout.

> +		status = reg_read(smbus, REG_SMSTA);
> +	}

You could use here readx_poll_timeout() here.

> +
> +	if (timeout < 0) {
> +		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);

if it's an error, please use an error.

> +		return -EIO;
> +	}
> +
> +	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
> +	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
> +		!(status & SMSTA_MTE))

Please, fixe the alignment here.

> +		pasemi_reset(smbus);
> +
> +	/* Clear the flags */
>  	reg_write(smbus, REG_SMSTA, status);
> +
> +	return 0;
>  }
>  
>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
> -	int timeout = 100;
> +	int timeout = TRANSFER_TIMEOUT_MS;
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		/* XEN should be set when a transaction terminates, whether due to error or not */
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(timeout));

what happens if the timeout expires?

>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
>  	} else {

...

>  	struct pasemi_smbus *smbus = adapter->algo_data;
>  	int ret, i;
>  
> -	pasemi_smb_clear(smbus);
> +	if (pasemi_smb_clear(smbus))
> +		return -EIO;

Can we use

	ret = ...
	if (ret)
		return ret;

This way we return whatever comes from pasemi_smb_clear().

>  
>  	ret = 0;

This way we can remove this line, as well.

Andi

