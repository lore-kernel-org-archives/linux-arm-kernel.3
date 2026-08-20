Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9575C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzDGLOhyyHOVxqLci+NY5sFlFPDajvKknZysF/tnk9w=; b=AdymcUqz3jgpuQxkz/TyhLXJhJ
	JpX3LnR3qwXSZXwQI9chl/54bfwD/wPfafFV5rChWyr6W/Qj+5IJbOEwF9XRUyQ1u5pnyMIQDybRi
	rYUz6A0pvrlOBQcUcKLJZezw2gE1+oDIEigFQtAyFDtNgMUXmeHN7TQ8XNR9VY50k7AixhK3LYY4D
	u8tsoK6DgJFS9vclySpy7795Lyw9C7O/teoZnAPz/m6naXPNv+oDY/Ck8Hw6YTBfalW4y66p0I6Rm
	+BAkrMDdnUiuum2pAmwiaKc8XYWakt4mq6bZvlzPD2wLhB3EghmB9ItkRCAGu79lbXvjaCWEZPHGe
	hyPMaAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx32R-0000000BdH4-2dj1;
	Thu, 20 Aug 2026 13:42:35 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx32O-0000000BdGi-3BoE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:42:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1891777a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 06:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787233352; x=1787838152; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZzDGLOhyyHOVxqLci+NY5sFlFPDajvKknZysF/tnk9w=;
        b=WrT158F11CTw3+2aSCW1lVYM5jP8urZvF/vEs2ZQTBBQLLNV+2uiO8wn2kCXNGn+u1
         tKUELAMp1pJqSt5FvHa0/tZeK1gQi1WhPlwQj4ujhljCgQ/O75amN5RM+fH7NH4rqQfa
         yHBrZaS2ZCnlw9TJvb1P10kO7j467h5Z3NinKHCT0oTW4apuNjqBUeBTTLUCwwpvPpDR
         9vs/TFIMCJ74TA3qsSDqpF+cSmfJUNlAz5HEiu5rfFKOITSyHOUmhX8NCSbhVoLlbNz9
         PbH9fLsofIVETilCMB+wzd55+1vfVP4hJ6YvyrwN0fpwMjBhkDmWMzOGlWu9OtKZK9RW
         w9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787233352; x=1787838152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzDGLOhyyHOVxqLci+NY5sFlFPDajvKknZysF/tnk9w=;
        b=OLT6L1V7iWp2cO7bb3+vEA0A3lGU/AY9x0Qibxt21s2kMfZKp5kjgLmv+aajRqmLIO
         GyENrakc84D/PDKHTMz6hcYahYQ/f8BsxQGoP4oJvYCQLQAscrfI6BBKjbSFPUoYMhWH
         Y96k+3UiiNjZUOtsC1yoF9GRhZcCtN56j/BHj6x9QKgTQmsCysuOR0GvKTvCXUq5UuxN
         vCavxah7D1P/y44/zrqK9ygEmUvY+fhZ64ATvig+4YRAouDDOupHLB++6yahS3Vbjl+F
         KdnbuiqPBmofFsh1D9DHUnBm2zwWOfa4jfV2A9Tzaa93IUvBQjFo0VSWc5uqzeiq9CLr
         +i6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpy8zAJXJ4Mx6Ud1xXSYtLa9GRtGN8gPN+zt1v7mgkeMnf19iWp7xWGOuKuy8VuZsqqBSBOMfB7Prf/DDdNmiyS@lists.infradead.org
X-Gm-Message-State: AOJu0YwbWzQDu3EMX4U5s+BjhMlqdBvdOmXiq4w0qI55QJRtZEWBYx04
	ZsQTk9Ly446Bnj5SFYemlh/2gOJzKTr8qwHiQ0gGRd0Rr1UAFQWTCXoh
X-Gm-Gg: AR+sD109O/9R875HteSWYjqZfKDNvetHg2sS3BfTYqgQppWxJnMeEOw2gF8gNmDkceJ
	oMZSbA8AowN/Reo0Trc3hyi8GP/drNaQA1J65O+Mj2HUII0yxaweebTPzmAx/sFs9LlG6+NiHzb
	B+2K92v7JPu6u8NVqItAQtM++0UM4XoypICemnUJHHbXkWm39qtEHzhU474GWZqaC47+TxxkI1k
	pf8rXEWzuFuZdeMLKs5aty0E4MkryAt24asZhEBnR63FXrrx4JE33PRMDL6T7Vz3aU69OXSkr08
	iotoB53pubjISxJGHMwKDgcVMgEMwQT6ypc5Ytv9et/J+YWfA70PJgbg6FylQEA8uOX9P9lJTCN
	m9ztYw9MhFnlcPuML+G4pUYx/CSGkfG8j+Y7FXjsg654s+SWFhYiK5SIXR4mg3fI/yTNcrgAc9q
	23w4VS4FoGFRrzxsECO5a+rEzNRZ+JqgcNgAQXbYFowCi1DE3cHrQ85mquht3xJgQOJhwBihkws
	Q==
X-Received: by 2002:a05:6a21:748e:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3cd0127962amr27198270637.18.1787233351830;
        Thu, 20 Aug 2026 06:42:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm27937690eec.14.2026.08.20.06.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:42:31 -0700 (PDT)
Date: Thu, 20 Aug 2026 06:42:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-watchdog@vger.kernel.org, xt.hu@cqplus1.com,
	wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: sunplus: fix sp_wdt_restart spin loop and
 timeout
Message-ID: <d37eef21-a877-4500-a280-493e98c68701@roeck-us.net>
References: <20260820125304.1583383-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820125304.1583383-1-ag@ffroot.co.za>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_064232_807684_4110E1BB 
X-CRM114-Status: GOOD (  21.13  )
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

On Thu, Aug 20, 2026 at 02:53:04PM +0200, Andrew Gaylard wrote:
> sp_wdt_restart() returns immediately after writing WDT_RESUME. The
> kernel continues executing and the watchdog kthread could pet the
> watchdog before the short timeout expired, preventing reset.

Is this observed behavior or just an assumption ?

> 
> Add a spin loop so no other CPU can pet the watchdog while waiting for
> the reset. Set the restart timeout to ~1.5s.

I understand the first part, but why delay the reset by 1.5s ?
That is a functional change which needs an explanation.

Guenter

> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
> ---
>  drivers/watchdog/sunplus_wdt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
> index e5212f3d2e24..b44dcc307634 100644
> --- a/drivers/watchdog/sunplus_wdt.c
> +++ b/drivers/watchdog/sunplus_wdt.c
> @@ -61,10 +61,16 @@ static int sp_wdt_restart(struct watchdog_device *wdev,
>  
>  	writel(WDT_STOP, base + WDT_CTRL);
>  	writel(WDT_UNLOCK, base + WDT_CTRL);
> -	writel(0x0001, base + WDT_CNT);
> +	writel(0x20F5, base + WDT_CNT);	/* ~1.5s at 90kHz */
>  	writel(WDT_LOCK, base + WDT_CTRL);
>  	writel(WDT_RESUME, base + WDT_CTRL);
>  
> +	/* Spin until the watchdog resets us. This prevents any other CPU
> +	 * from petting the watchdog.
> +	 */
> +	while (1)
> +		cpu_relax();
> +
>  	return 0;
>  }
>  
> -- 
> 2.53.0
> 
> 

