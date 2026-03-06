Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77349FCB61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ExyNVSWsZEiPhZCTeAKx/MrxZrOY+AoCmCT2YcRTRo=; b=xhuWQU7Ev8dpk0Ix5amE/0Jh1J
	yWysSqnQsbuLTjvcwxp/Ao4ctiomJzcEWX574Yem1juZXys3HV80wux8/b6WF+U0AogV4yB6ByU5E
	j1CQ2pvZSQqHMYBjrdZmX5L0zhPPsfyh/RqRmmn7ELE6jXTEyJgtblxlS5GmC337KbEw9RxB5zfb6
	S/u763N1BrVgFZXif6i7fNNOrWeRMObdiy1zoxLdjIySjc2XoEnF/UG5G/JhGeWFriewN2SRpvp1G
	j7QNWt9MLdhArABMOW93re7rfskqUAcIaStGcuXSOorCAK2Rxe2EmyI0BXGnmH0jrz82qymPhwgUc
	PSa0Fa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXnY-000000047jJ-08Ju;
	Fri, 06 Mar 2026 16:13:08 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXnV-000000047im-1z7B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:13:06 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2be19f05d7dso805882eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 08:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772813584; x=1773418384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ExyNVSWsZEiPhZCTeAKx/MrxZrOY+AoCmCT2YcRTRo=;
        b=gHqEHWYiJVUI8hXrm8ENIWRO2zhcjsa2awjG+/JLXefxUr/0RpLb/deGyZyjU/CGkw
         fGswi5zJmAxTtxbtInkrpyDBvTiphWQO430cMYtBmxK4ZmjZbZ6gBbusYdZ6cGtT4ENs
         G+6nasx/IdvdKCeoO+Hm9EVf54HiCxoZK8AkKw0saDGgQJ0hfzLDjXokC1os6/dJMdvc
         fSNQSn+OEVpLdjaqv4SBZx1+rorDc6n7Pz1nDvyEdbEFZKKny02QBPKx9jAMbNat9rrF
         bnQAjusF7VjDB0oxIV2Y/+bZzjD4YJPftIrqQpF12TWdva2HF+nPc4I4B2gozP/ZR2Hb
         DXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813584; x=1773418384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ExyNVSWsZEiPhZCTeAKx/MrxZrOY+AoCmCT2YcRTRo=;
        b=aK/tgQXBWGP/DioLddrPqWiLbiIiY80XZf5TZzV0QPDp55/kFA3QAM+zP0i8vE9IlU
         ogVn5j7Kz0oI2hOlJLuGnOIEwzpZDrUbApBjEJH/AfqH+5l3Ccsi/DU1JaPScTj7wgIM
         mrwQk2fhUnTumyIiPeOXPrIL321AFBrlS+svUFhAZs+79KsznALLINR25UL98ZGKAQ06
         +7O8Lt4p7U6Rxc0kmrT7UeVsShiMktflcnPS3AaszgNDlTo2ZNJWe361tEBbjag9tjtO
         /tqZCI6FDeUxcXKWm8Yxmt2KaqXkOJzatTD9dwYhBh/4js9TPCGGb/oKC9gTW50ODeU5
         df4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTYXqMd7839M3ftrzK4pyeq8EDIhKiMYjT4rVLr+EGTmMd1J9xW/xhnsGkQzdWtrCDK2JlPHI2yvtKI2mysT36@lists.infradead.org
X-Gm-Message-State: AOJu0YwyDncvomdliu6eDvsp4hOcvh7Jao/psxWdgcv2UZ4OkHNsTwk4
	cbLyOuf8SQ2ve65333Uu1FTv6tBqQtPoNuxHjYvOkNlO4sFateJvnlXVQa6GZg==
X-Gm-Gg: ATEYQzxfgcowfDRPQbuj2xg5mGaWbAGneBsbOAx8enfbNSMnnnh22ZxEm60TryMkE0n
	t3uswbOtfU0sMe88uEJ+aRQGsKwq22Yegomkc8FyDI7Y8x9NE6pxHY4NtirQZuhY6BryDKwvXNj
	4AQqgNONjGngNX8dyAH/qB0sq5raIei/QeKFu92jDlobwkqHvUIM/nOKiHWdwocyhy60/1jE2ma
	57zo1pAbKqzWhEW46Si9aoaoEa5eH5lqSklXVf5U75KBe4tURf+YezqfFJ1aZlNgIJJRGxxk/R3
	mOPBCXnmHGDpRvEkVSwA/gWVPhCHxWIEhWubfuRxSPG+KZOW7b5XAc/I8s/gTY7YA6vVA3aE3nM
	FpxsnOiiV0zWAQVvdV7bJKCbdpX/9BqwVnWS0e/Vk6yCm0ZVd0jf+pCUKAx1odn8vGKwUqrVJpx
	YYsukRwfuzKDbrR0/yBnOvE7tN8JiEUET7zRlO
X-Received: by 2002:a05:7300:320a:b0:2b7:fdb6:ccf2 with SMTP id 5a478bee46e88-2be4de99574mr1150793eec.13.1772813584166;
        Fri, 06 Mar 2026 08:13:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94823esm1578036eec.20.2026.03.06.08.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:13:03 -0800 (PST)
Date: Fri, 6 Mar 2026 08:13:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
Message-ID: <e6c06c88-d2cd-4501-8a15-b89ba5a36e5f@roeck-us.net>
References: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_081305_517648_629239E6 
X-CRM114-Status: GOOD (  19.71  )
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

On Fri, Mar 06, 2026 at 02:44:31PM +0800, Billy Tsai wrote:
> Ensure proper association of driver data by setting and retrieving
> the platform device's driver data during probe and remove.
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
> index 44e1ecba205d..0c03d272279a 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -490,6 +490,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip))
>  		return PTR_ERR(chip);
>  
> +	platform_set_drvdata(pdev, chip);
>  	pwmchip_set_drvdata(chip, priv);
>  	chip->ops = &aspeed_pwm_ops;
>  
> @@ -519,7 +520,8 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>  
>  static void aspeed_pwm_tach_remove(struct platform_device *pdev)
>  {
> -	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
> +	struct pwm_chip *chip = platform_get_drvdata(pdev);
> +	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
>  
>  	reset_control_assert(priv->reset);

AI review has the same (and more) concerns. Here is what it has to say:

Does asserting the reset here place the hardware into reset while the sysfs
interfaces are still active?

Since probe uses devm_pwmchip_add() and
devm_hwmon_device_register_with_info(), those devices are unregistered
during devres cleanup, which happens after this remove function returns. If
userspace accesses the devices before devres cleanup finishes, it could
access an IP block that is in reset and cause a system hang.

Also, since probe already registers a devres action
(devm_add_action_or_reset()) to call aspeed_pwm_tach_reset_assert(),
this explicit assert appears to be redundant. Can the remove function be
dropped entirely?

This isn't a bug, but probe calls of_platform_populate() without a
corresponding of_platform_depopulate(). Using
devm_of_platform_populate() in probe would fix the leak and allow
deleting this remove function.

I think all those points are valid.

Thanks,
Guenter

