Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C60CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNbtJkl9CbiQnQE9KMMi2+OI3EANu4Z2H3R0mQsMgOs=; b=luWbPPCo9w5qP06hpJca900ntd
	BR8sAaS+6wGUu+tbHADd6rF7o+UucXc3q2q8Z3CxHfV/8gPQ//FVHKq18KKQrYgFWzomYPBTD1ZL6
	XeZ5YH52Ag5W+LenWJJs10zpe9x2raBW0orrlGwMcrhS079x89gYTZeJfiJSTfhKwdgRHTXmUaDxR
	tQbhVGVSFbNoFw2fXpwxzi3zUFJ4Obo/0tMXkfcJJy+4geE6S1X72vArg8LOPuBmLQqdFt/9+OLFk
	vCV+KR1mMmMMxzwqhdgADJ+OYetf7d/mk/UhXUwKH+BzzOzk7XnwYI0tvqdjhliC5rSDsZJ6K2W/G
	GSprGz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsv-00000000kgp-3bFB;
	Thu, 21 Aug 2025 22:35:53 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7KH-0000000HPfk-3ZN3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:35:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-324fb2bb058so540696a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790541; x=1756395341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNbtJkl9CbiQnQE9KMMi2+OI3EANu4Z2H3R0mQsMgOs=;
        b=aRrs9+kED/EO7B5V8usMFt3ChglO+NaDdS7T53jPkXwAv0w+uDr8yTnwjh7Vv/YuoU
         p8adqROGrGTgGfIglIwoULJMxA7f1JPe/kOKkPuOYg7OKrG8DXOMSvfI9skjJCys1KO1
         /EcnDuRsJzJhsqnTEeC0lpf4RDQFwpaUT5ZaQd8eldyJJO3YuJFpMPTc2GJ57W37mVti
         AvyN/GmObos34gdW6/TGkpsWtNzc70n37kgDdUnTiMtkNbYpXiKirEItei/+BnanIcaq
         5T9/XMluPCy4pLhpAAs5NQA53MZk96mn9Nb1PRoJljcHy0HAdKOMoCXcgF4JRKUSgc8N
         A8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790541; x=1756395341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNbtJkl9CbiQnQE9KMMi2+OI3EANu4Z2H3R0mQsMgOs=;
        b=NmvgubVigfbMz7clak5rbpsJl8z7NMWwJSc/MKflKTZbdXG634i6PkhQqTvFkxFaJd
         nQLAIg2DhBXosDKQQ3I8pDREc0aZomX0OV1gtnkh3jLbWNczUu7y4NBqTRx2kJCngAUG
         Yz29jea3PQv66AJDYxD6DDKEwdbqOjXE62acuEZNSvNxsLYlAukAcxnrCvYE1NcppkvH
         m0ss7fsViOrjOhGjC8tYszpEf+VTg4IrZUuscuCpTFAYr129nHjgVZzaT/UfEhl/IcWO
         3soDKkKV1AjaNIBXxkya0ij4xTJsUVANsXEdd2eC6sAb8peL7F88jo9Ptz0XG17FMW8y
         9lQg==
X-Forwarded-Encrypted: i=1; AJvYcCWthEI29olWIciD42SOS39xWy+xK0ZmvYtaEFc2BWBaaQYxRpB5IKOgiM3ZJLhNz+6xS1etMatlzhlW14nu+mYL@lists.infradead.org
X-Gm-Message-State: AOJu0YyDcl9laGmSMm/wk/7wZkvcYJZ4cVPuG/V9ktmMCPtbtrya5R3r
	5Sdj6gBztJ4Yu30o/vbqYDPw5Ixx8Kq07uyc9MF0N/UEEETCj7ezXxug
X-Gm-Gg: ASbGncvx1/WTnpUkGWm1lWzLTMZkUxjiObRu0oq2xWJj6Tonx9cKtVE+6CmAd63SPbi
	S3+ycF2qR2+9MErS8QiB/o9S6m5K0o21xFUAUvFSttJek3dezt+btrGC4olk3YBJk49KcTdXTH/
	ijkLo2+5tbs/tLLiQ5CcS0tOposfpZ6F6QC+4B94gzy5GUtNOYLM6ub+83OGIhcMtfKES2Xw3aN
	6WQW/M7vYg5aNvTMEuuVQdv6YxuuE/blJFsZl+fIdUchyEiQHngpnArSrxMwr3eRaLNXpatmkp5
	/TSR31hU8XrSu9zcBFqWinyT32mXTHIIE6g7cMdNY1hSSlRAoLQH3K0nBmG7cjEcrmWvuQs/Ucg
	ur9VT+V8Qnj8xH7E6oK2NN1GFZvfgjSpgksw=
X-Google-Smtp-Source: AGHT+IHFGccMI4lnf99eQXSJ79WIr7CQog+uTRFdduTinDQOubPQFn2xjjcR2aWXeoHOPY0FZODa3w==
X-Received: by 2002:a17:90b:3dcf:b0:311:b413:f5e1 with SMTP id 98e67ed59e1d1-324ed15b898mr4012790a91.32.1755790540864;
        Thu, 21 Aug 2025 08:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325123e7879sm98778a91.1.2025.08.21.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:40 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:35:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Message-ID: <ee1907af-108a-421f-8f99-fa04261ca351@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836@epcas2p4.samsung.com>
 <20250818021826.623830-5-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-5-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_083541_888963_30D663F6 
X-CRM114-Status: GOOD (  16.06  )
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

On Mon, Aug 18, 2025 at 11:18:25AM +0900, Sangwook Shin wrote:
> Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit WTCNT.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index d983cbcb975c..915d3c88565a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -357,7 +357,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
>  	.cnt_en_bit = 8,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -		  QUIRK_HAS_DBGACK_BIT,
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
> @@ -370,7 +370,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
>  	.cnt_en_bit = 8,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -		  QUIRK_HAS_DBGACK_BIT,
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct of_device_id s3c2410_wdt_match[] = {
> -- 
> 2.25.1
> 

