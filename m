Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EDDFCB615
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6XDLuG2g5D0dtVulOb92ZhTkqEZkXM/BQ7MGxoQVFU=; b=WkduKsgO07ApimQz4lbkCGvT3+
	PckLqDpRNTIERKTYVs9SER/mLfgFMKvM0+063H8xspcMau94ZAfHO16Et1tO6ypeGG/DAr9LZKjuR
	flB3QjZ6eQPLgM0uK/T4Ipt3STMEuQOURIkJlRsFP10smnHl1/GblVfWCkDAGIO3XOnSDZfph0++v
	BHrHKJDSLf07+Bmg9xMxN9UmFegEw6qaFvQZnJX1SwLHNZklvCPPt4dONYdLN+57LfyneWbbziluh
	B3yGTtKlaHWmUE9r0DfXQyttvafP4TLvTG3hxzdHDcYGINY4r7zE3jDkjDBA1SHmOFbY3mOEUInE7
	MYCRXe3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX0d-000000041Gs-29Sc;
	Fri, 06 Mar 2026 15:22:35 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX0a-000000041G6-2MrK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:22:34 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1271257ae53so11323452c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772810551; x=1773415351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6XDLuG2g5D0dtVulOb92ZhTkqEZkXM/BQ7MGxoQVFU=;
        b=nb1WESQj9i0Gj7lNg4helJp9EHf5iVGOgvdspK7LpOqC/ChGaRai9ANd56O6TLUquR
         BitEpwmREZIBzr1qQ+7zTmzjC03JJwmNYJTdx8n6MZAzzJnXjuavEStPQqtYIqeVbs8x
         EyJ4kCCRKOC+2ckPHbwZgHrKsxhz0NPnUu2qqyR/TBTHnI/lJj3V3kF2CsJRPuZCL5oP
         Vgyv3Yk7+GRREDilJjtQ7kQwBHwqSWgpSq5Y4GyoeaqW+ZtbuTDZtpniFkBelfw+oiLy
         5MWW3L5RuBSMgrC/bCDq8QKua6Ld8S2vckFt9pBY21DiTKtuOhM6JKRFiSrjWnZkoBo0
         ibWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810551; x=1773415351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6XDLuG2g5D0dtVulOb92ZhTkqEZkXM/BQ7MGxoQVFU=;
        b=U4DtNLsd/yl14R3dJXVs6HfNIiSa+ufLSaUEvCiQsacm78wqn57zAXG7kLKzEzVRuM
         hIhawcVzGokLmNN2eR5umair2g0bMfTqnz0C4Hs3ADUukYTPtygFZTU7yRpmgRCqmXbR
         3vGWyEYNIROhx/GNtaZk/2tRYV2fx//dJGMlovvD++Oe7/tHeh/fGcKbbqrDRKIGn5RH
         uTj6NfbAz0abzbEGOrdMv2YAkQ6oY5VBuMzvqUcmSb9zgh3IL9dPF5yQHS8dR31w0mRk
         4O4efvBpZzG6MaGYv7a21f93gChhgQa0lmB1zU3C5//B6rD85XBr9iIc2IfnEYmBYVAj
         Dkvg==
X-Forwarded-Encrypted: i=1; AJvYcCUInUFO10z1l1M46n/+a0ZjfI5vGJXvlIoCIbZyv4/Srf0/VGrLkYB8ouZ/y52NCu/2whyJVhfW2AVPfpLWVCEq@lists.infradead.org
X-Gm-Message-State: AOJu0YydXIGjULYjV+IHw0yJFgg5VM7r8dbuQ49XsRfBjuQZO3A37MPR
	Gfmy7UIFBRljXFLBJeVcQxgOUAcFEv+zG/KBd6F8HEjWtSr4FG1lLg61oHCYMmFK
X-Gm-Gg: ATEYQzzRAyP421ZOmC5qKEI2xs2q98BwdQ4FZy6FHnKA4oLLtI91j2pdQXCeQsAtPkh
	Ez36IewwTjcisSSkZO72o+mgjawxEsLyFKbz01uWGXCKruU2EVX2OtC8tOD/l4ciRrMkgF6X74D
	2Khx06rEuk/jACtd8kzdmm/BGWH/qpaWGDh7R3grXCR/x5Z8DBate8dZVVrnvfxJvbDQzu7K2iH
	joq/WlHXRpK876DmDeLKn4S+mg+Pq3X2ux6YQufxLOikVswazHMiFlPUA11KX1xSgmq2Iimm3Is
	LqHaH17uVXLpcWYXviYJqEOG0Tf0w+4GIy1m4sVRc74aigTknoIobM1j5/NVez1xsr5zz6njAzE
	JpJAJtoQ8Zp4ZaiwPeJrhxIEIniNB+iM/v//h9Ip2OpC1Z/8E3YUdEOyS90CcXQwKe9i0nSSlaL
	HLtw/Ta5F/8iP4B5sTwGZOmZPZKbF169Kxs8iUSdigMLvRzur5ZooPRMHYSW/65DKHhMeQ+Yvn
X-Received: by 2002:a05:7022:e28:b0:11b:9d52:9102 with SMTP id a92af1059eb24-128c2d9b28cmr1184560c88.6.1772810551074;
        Fri, 06 Mar 2026 07:22:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f5a102sm1441985c88.13.2026.03.06.07.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:22:30 -0800 (PST)
Message-ID: <b4629b96-2e5b-45b7-a72c-dc090a5c15b4@roeck-us.net>
Date: Fri, 6 Mar 2026 07:22:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
To: Billy Tsai <billy_tsai@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_072232_609897_036F22E1 
X-CRM114-Status: GOOD (  16.37  )
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

On 3/5/26 22:44, Billy Tsai wrote:
> Ensure proper association of driver data by setting and retrieving
> the platform device's driver data during probe and remove.
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
> index 44e1ecba205d..0c03d272279a 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -490,6 +490,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>   	if (IS_ERR(chip))
>   		return PTR_ERR(chip);
>   
> +	platform_set_drvdata(pdev, chip);
>   	pwmchip_set_drvdata(chip, priv);
>   	chip->ops = &aspeed_pwm_ops;
>   
> @@ -519,7 +520,8 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>   
>   static void aspeed_pwm_tach_remove(struct platform_device *pdev)
>   {
> -	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
> +	struct pwm_chip *chip = platform_get_drvdata(pdev);
> +	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
>   
>   	reset_control_assert(priv->reset);
>   }
> 

The probe function registers aspeed_pwm_tach_reset_assert() with
devm_add_action_or_reset(). Why is the remove function needed in
the first place ? It seems redundant to me, and even buggy since
it asserts reset before its users (pwm and hwmon) are disabled/removed.

Thanks,
Guenter


