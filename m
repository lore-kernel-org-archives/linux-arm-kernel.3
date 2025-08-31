Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F340CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 14:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZYLdktZ4EPO06YD32v1q0DpK8GiNv05c9EBnf+HoCw=; b=EY3aV3SfjLMaQ4bqcx/YeHsLTK
	e08tJhAc7JaaanotPlQY7B69cKqXz0w37h5sYyOaBJg9Ec0yGCW7W5kE9rWWfA+z5O/sPZzxftMAy
	vnZz+FX4WyDy0thZx6xSkrnqn7cdCv01/8YlajqFFZ2RmBfQIBChXb9Vp0ZZxN4bPgXTPQYngxYRJ
	4ENxMCn2acl2bYqr764lOAsh8QyWIKdAulIwN1aP/B1ZE9FhNc6S60RK/Y8cC0CVJCHziUaTWe69N
	SFCtuH6t2mpV0PbRtlAzyKPxzYxrYnNbs3W7FrcAAMjp1Kqc8Uh7Z+xJYwSqaaSh1ySNY5JvCLc4G
	7CtMs20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiqp-0000000AGuP-2ARp;
	Sun, 31 Aug 2025 14:16:11 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usio7-0000000AGdy-0Svw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 14:13:25 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7e86faa158fso369458585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756649602; x=1757254402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cZYLdktZ4EPO06YD32v1q0DpK8GiNv05c9EBnf+HoCw=;
        b=UNq4uf0MjoKsRAyU5IVwIU6VPtjdbLd277XD3G2QuYc+Tz/b7SgKVUV96rg/RM6CSL
         ivdTQH+cRpUBLJx+WpArCNeQyprG3721WVJEp9rBnhbrs4GDVMSIVIL2xThXsvijQylG
         uqo01BQVoMwPkZyO610FXVMSIyY/kpgeZzezOMe8mj+EYCu+no9Jzi5XtotnRtuugS6R
         779vfDSC2ARCX/VUu2mbtQrSdDhysCGHlkDfNSdxUhgFhVMtIVynHT1sZZTvW4M5pD0B
         o7SOiiWp+wpzRAk4iRCnOpWr7n76sJ6SYXRVt8nGFREOAn9R5MunhMfq+TMzva3IFBjc
         pUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756649602; x=1757254402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZYLdktZ4EPO06YD32v1q0DpK8GiNv05c9EBnf+HoCw=;
        b=EUtbk0OZDbtpQivSlEPZO6vjsJ5RMgHTNhE1QQU7gm4deJAo0kZ6IUTPwQGVZW8Uek
         P/lQB+JLMcZwO+2vd7UUfS7PwJFPIsr2QTH9HNIOMiF86r+L+fB1P+AY6cR3Jo3cU/Yn
         UHOoFl28AiUeVGNO7GxtSywn85RU78g/2vtakJaGcZBkbVU/jlDsh8YOiVi7bL8tzTu/
         wQ514jxfFAFZgBL8E+lCBU6WNjS+FgCWJUiSXC5K2wQOBtZbOlnZcZzs6y53iKYC4y2z
         S0KA3yXCnehUrBoz7xcL8RA+sbBsSUXFk4zuhazasumj3A1DH47jVdL90e84wjUzzOcb
         pUPA==
X-Forwarded-Encrypted: i=1; AJvYcCU/u1A4GS4c8ZxvaokRDu8EPVtRp9XZRQSmvIMTnJhdh27o36Tju4WdbdJ3NTFugmvZR5Jfvs9pOYboJwdwphG+@lists.infradead.org
X-Gm-Message-State: AOJu0YxUDk99X9KDcm2ueWmsFnH9BUoxqpR2nzdHCa7/sG0Xopjuzrvn
	Ta9SdlTwPl6adnmcOcO+jp4v9VluRj5joXavpOFNuuMp0Ca0KO2Y/0DRkayCEI+RkA==
X-Gm-Gg: ASbGnct6CEktWovAFsjjQS9ZpBF3MJO05UWZGnqhLWwrV/1QLRa69d2MnW/US7bCFfU
	32MWCSskMCTEERwx+pKBvo1QRLSaco0HxFnRl3EZZXkxq83BCXYgNon8NalJ0opdlWmjBFZOGr5
	teiKKGTbglKl7jUwFlNm8UuUW+kB9hljOgrTwl79VldJp8uinlI+Pj7Cvj5XaKEjoJhx+L1t5dP
	/VlJBAwh7pAnOHK5HyWxOrfSrvEKAqiVKdqFlzldhQ1cQHKyks16qme+gGi0mv4iib7ZEHmMfgh
	vMCgb7W0gXMHDvCkrhbb813bwR8WC2G++lsP4DACduuVR1C7fGHrpDM+YmM8SAKVBV4TkuaHIdf
	I15cELml+fEqUdThRZ/gF6AdVb1zlgQ==
X-Google-Smtp-Source: AGHT+IE8Mqej1JDZrtuPz7sl66EYUl3Vb5Z2gtzRXa0W+3TefhnO3F5sshyISi1xvDod49i2QcLnew==
X-Received: by 2002:a05:620a:172a:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ff26f9fd08mr460588985a.4.1756649601956;
        Sun, 31 Aug 2025 07:13:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::f777])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc1484a7a8sm512990985a.43.2025.08.31.07.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 07:13:21 -0700 (PDT)
Date: Sun, 31 Aug 2025 10:13:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: ohci: s3c2410: Drop support for S3C2410
 systems
Message-ID: <188881e4-09a7-49fb-8128-ea7ee85147a2@rowland.harvard.edu>
References: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_071323_421541_734443E6 
X-CRM114-Status: GOOD (  23.16  )
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

On Sun, Aug 31, 2025 at 02:22:23PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> The driver (named s3c2410) is still being used via platform code for
> S3C64xx platforms.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> 1. Commit subject (Alan).
> ---
>  drivers/usb/host/ohci-s3c2410.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
> index 66d970854357..e623e24d3f8e 100644
> --- a/drivers/usb/host/ohci-s3c2410.c
> +++ b/drivers/usb/host/ohci-s3c2410.c
> @@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
>  	.resume		= ohci_hcd_s3c2410_drv_resume,
>  };
>  
> -static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
> -	{ .compatible = "samsung,s3c2410-ohci" },
> -	{ /* sentinel */ }
> -};
> -
> -MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
> -
>  static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.probe		= ohci_hcd_s3c2410_probe,
>  	.remove		= ohci_hcd_s3c2410_remove,
> @@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.driver		= {
>  		.name	= "s3c2410-ohci",
>  		.pm	= &ohci_hcd_s3c2410_pm_ops,
> -		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
>  	},
>  };
>  
> -- 
> 2.48.1
> 

