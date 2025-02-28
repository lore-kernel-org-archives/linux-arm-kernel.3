Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196ECC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xi+7sGpT69/lANgMUWz8/8EU1lRH971cs0FJlKGXLWE=; b=KUI26oD+JBg3BZsueOjyvBaDCy
	1N6dhxkAnXlnmzJ0TRQIYQUfhL2/MxUsSpTMgPWpyPHyomzyc+OhrOuEQ9BWECix/tvgPAWMp6hPY
	5dmRALDyPCFzo9kLM5jxAUeEd8DBbJaUCPUN7dBt+nGQjoYe0fHIMsofKL2i9UTgFBJjMSU6Fu6ng
	EJCxA2CYgAgpDxyfHc/FXXBTHSpZ9F4MYId9AxVg/4S7yi7ot0eA+Y2BAYdJ5xmWkW4vWSErpQ9c2
	GrFIJL6HMWaNCmhd9y1X2VAD7r07bMf0//kKCuq9cLOOKuE3lE2MCQf5Fhcy7NKHmyBdDCXD+UVGt
	bwLyeXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwi4-0000000ANSx-2hHK;
	Fri, 28 Feb 2025 09:31:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwgU-0000000AMs9-38ji
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:29:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abbac134a19so287794066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 01:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740734969; x=1741339769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xi+7sGpT69/lANgMUWz8/8EU1lRH971cs0FJlKGXLWE=;
        b=cF+SqXvWxtzJyZoD+ugv6csO08abJkz2MzLhcu2Y5xCRir+SsdwrIh6dfRxChYBkEe
         pTAhxRV6IO4Dpy2Xo6DbSvlf7RmcdEDrT7IqbcJJ+fCfpOk0zeNUJsZr0AT+C/dhm7sl
         YK1u1YCnfHgDkc5amgsQPY61SoFn4dowFYwkQ3ppl8JzHVpRbBXvdt3iCFgJlPGhHzf1
         hJIDBJ1Un1Ct2N+brk8TE5byd06dwQVP9hU4AgbhTQiq5LOErWsMKgvA4dMauzz09S56
         V9x0zb1XxaA5fSbMOu9v10noAMkFAqNJxDOBbWIcU7hl9VKRALrdulbaoMWrrVqVGgbu
         WvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740734969; x=1741339769;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi+7sGpT69/lANgMUWz8/8EU1lRH971cs0FJlKGXLWE=;
        b=EutD9pTZF/JfaXWCPlozVmG2SpZQBekq0Gdi+WqpJAS7IhZg08GjgZ7/96Z2vwc83f
         TMZA+rLe5ftjgSDQLBeAZbtRicCrzgMsGI8xIF/3dN8/abE9PgJzgP0pSnUUiVdPijmm
         QYMnwSpBdui3I763PcyxErTtUg/vX/+Om6l2Qtay15zIVRbXNI5FPu2oobTZpcJ6ibgb
         46iivvwFdjaDWqxdkSYWkOszGIdR3ejQ0ZnsGBB5LXvuc8Q59i6KtbkAPjKkrRmqA4nN
         C9ixWp5h3IMrcXPyal0/9CqAPqHXmF3uv2HHxzE3suUWU/47IIPf9M00NIA35QudFZwh
         g8mg==
X-Forwarded-Encrypted: i=1; AJvYcCW3rTrYgaurjtHgqq4Fr795vb8LO3KslZeV6BTtR3MImxCC+QHx4FZrUIApDnx5zx5tW/xoesOwRCtGkEC3Xcpc@lists.infradead.org
X-Gm-Message-State: AOJu0YwxczDFS3nuxHDtN8AOLcjbwHdEzep2RfQFSlXiNwYd4mhSKMWm
	m6q7JarhQdphmDYS8VKYd+5K6F5JAKT/7YIfrSefLKVt671qKt8oOC1lAsWiYi8=
X-Gm-Gg: ASbGncuiIq0Ffh1g3Z98j50XQBySjyLrbYXmd0zTUwSw8Qqo9yh/spnVNoGNkzia7E/
	eG4+K3in+pckX/zX0dqXsrPUbXjHiKRU8UkQTrKc0hJpVQ/e5R8z/CfkpAICMI+WKlj+5/D5qWc
	tAcq4yBTTz3k6frdMGDC+e07mfBMw4purscN01OgqiWLMur2iZzOttNUeUT/WZXToLRMZebVzaD
	EpJ2NCZ9IOhNYCezlonv1gWp7EbrRvNv/3awY0rhLJpA63p7lZ2UNmQZwAI93/Jy6VLnt4vDdcG
	EnWW1/hqvLfryeKkqoh7+/6glChbg0AbSBc=
X-Google-Smtp-Source: AGHT+IEfVyttsNVaqFTwGlRNWn1VvhncC0bqlOAdRmlzfyt8y60wXR2u9ff1D1N8THUpzyw8SfSlkA==
X-Received: by 2002:a17:906:c149:b0:abc:a40:4194 with SMTP id a640c23a62f3a-abf25da22ddmr260249766b.8.1740734968478;
        Fri, 28 Feb 2025 01:29:28 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7bb85asm258530166b.162.2025.02.28.01.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:29:27 -0800 (PST)
Message-ID: <109244f2-89af-4e08-9723-db6c6b0b26d1@tuxon.dev>
Date: Fri, 28 Feb 2025 11:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: soc: atmel: fix the args passed to AT91_SOC
 for sam9x7 SoC
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 varshini.rajendran@microchip.com, javier.carrasco.cruz@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
References: <20250220055302.284558-1-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250220055302.284558-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_012930_971581_2B36CCA5 
X-CRM114-Status: GOOD (  21.81  )
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

Hi, Manikandan,

On 20.02.2025 07:53, Manikandan Muralidharan wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Fix the arguments passed to the AT91_SOC for sam9x7 SoC
> updating the SoC revision is skipped since the DBGU Chip ID Register
> in sam9x7 SoC does not store the current version of the device.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> [manikandan.m@microchip.com: update CIDR Macros, skip updating the SoC
> revision]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - update the version_mask to 0 for sam9x7 SoC to skip upating the SoC revision
> - add AT91_CIDR_VALUE_MASK to mask bits 0 to 30 as per the datasheet
> - update the SAM9X7_CIDR_MATCH macro
> ---
>  drivers/soc/atmel/soc.c | 42 +++++++++++++++++++++++------------------
>  drivers/soc/atmel/soc.h |  4 ++--
>  2 files changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
> index 298b542dd1c0..3e0b8ba4f8ba 100644
> --- a/drivers/soc/atmel/soc.c
> +++ b/drivers/soc/atmel/soc.c
> @@ -26,6 +26,7 @@
>  #define AT91_CIDR_VERSION_MASK_SAMA7G5	GENMASK(3, 0)
>  #define AT91_CIDR_EXT			BIT(31)
>  #define AT91_CIDR_MATCH_MASK		GENMASK(30, 5)
> +#define AT91_CIDR_VALUE_MASK		GENMASK(30, 0)

I would keep it as AT91_CIDR_MASK_SAM9X7 to match with the already existing
AT91_CIDR_MASK_SAMA7G5

>  #define AT91_CIDR_MASK_SAMA7G5		GENMASK(27, 5)
>  
>  static const struct at91_soc socs[] __initconst = {
> @@ -102,26 +103,26 @@ static const struct at91_soc socs[] __initconst = {
>  		 "sam9x60 8MiB SDRAM SiP", "sam9x60"),
>  #endif
>  #ifdef CONFIG_SOC_SAM9X7
> -	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> -		 AT91_CIDR_VERSION_MASK, SAM9X70_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X70_EXID_MATCH,
>  		 "sam9x70", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> -		 AT91_CIDR_VERSION_MASK, SAM9X72_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X72_EXID_MATCH,
>  		 "sam9x72", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X75_EXID_MATCH,
>  		 "sam9x75", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1M_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X75_D1M_EXID_MATCH,
>  		 "sam9x75 16MB DDR2 SiP", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D5M_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X75_D5M_EXID_MATCH,
>  		 "sam9x75 64MB DDR2 SiP", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1G_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X75_D1G_EXID_MATCH,
>  		 "sam9x75 125MB DDR3L SiP ", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D2G_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
> +		 0, SAM9X75_D2G_EXID_MATCH,
>  		 "sam9x75 250MB DDR3L SiP", "sam9x7"),
>  #endif
>  #ifdef CONFIG_SOC_SAMA5
> @@ -370,8 +371,10 @@ struct soc_device * __init at91_soc_init(const struct at91_soc *socs)
>  
>  	soc_dev_attr->family = soc->family;
>  	soc_dev_attr->soc_id = soc->name;
> -	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%X",
> -					   AT91_CIDR_VERSION(cidr, soc->version_mask));
> +	if (soc->version_mask)
> +		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%X",
> +						   AT91_CIDR_VERSION(cidr, soc->version_mask));
> +
>  	soc_dev = soc_device_register(soc_dev_attr);
>  	if (IS_ERR(soc_dev)) {
>  		kfree(soc_dev_attr->revision);
> @@ -382,8 +385,11 @@ struct soc_device * __init at91_soc_init(const struct at91_soc *socs)
>  
>  	if (soc->family)
>  		pr_info("Detected SoC family: %s\n", soc->family);
> -	pr_info("Detected SoC: %s, revision %X\n", soc->name,
> -		AT91_CIDR_VERSION(cidr, soc->version_mask));
> +	if (soc->version_mask)
> +		pr_info("Detected SoC: %s, revision %X\n", soc->name,
> +			AT91_CIDR_VERSION(cidr, soc->version_mask));
> +	else
> +		pr_info("Detected SoC: %s\n", soc->name);

I'll update it as while applying as follows. Please check and let me know
if all good with you:

@@ -386,8 +389,10 @@ struct soc_device * __init at91_soc_init(const struct
at91_soc *socs)

        if (soc->family)
                pr_info("Detected SoC family: %s\n", soc->family);
-       pr_info("Detected SoC: %s, revision %X\n", soc->name,
-               AT91_CIDR_VERSION(cidr, soc->version_mask));
+       pr_info("Detected SoC: %s", soc->name);
+       if (soc->version_mask)
+               pr_info(", revision %X", AT91_CIDR_VERSION(cidr,
soc->version_mask));
+       pr_info("\n");


Thank you,
Claudiu

>  
>  	return soc_dev;
>  }
> diff --git a/drivers/soc/atmel/soc.h b/drivers/soc/atmel/soc.h
> index 2c78e54255f7..2503a80856bc 100644
> --- a/drivers/soc/atmel/soc.h
> +++ b/drivers/soc/atmel/soc.h
> @@ -44,7 +44,7 @@ at91_soc_init(const struct at91_soc *socs);
>  #define AT91SAM9X5_CIDR_MATCH		0x019a05a0
>  #define AT91SAM9N12_CIDR_MATCH		0x019a07a0
>  #define SAM9X60_CIDR_MATCH		0x019b35a0
> -#define SAM9X7_CIDR_MATCH		0x09750020
> +#define SAM9X7_CIDR_MATCH		0x09750030
>  #define SAMA7G5_CIDR_MATCH		0x00162100
>  
>  #define AT91SAM9M11_EXID_MATCH		0x00000001
> @@ -69,11 +69,11 @@ at91_soc_init(const struct at91_soc *socs);
>  
>  #define SAM9X70_EXID_MATCH		0x00000005
>  #define SAM9X72_EXID_MATCH		0x00000004
> +#define SAM9X75_EXID_MATCH		0x00000000
>  #define SAM9X75_D1G_EXID_MATCH		0x00000018
>  #define SAM9X75_D2G_EXID_MATCH		0x00000020
>  #define SAM9X75_D1M_EXID_MATCH		0x00000003
>  #define SAM9X75_D5M_EXID_MATCH		0x00000010
> -#define SAM9X75_EXID_MATCH		0x00000000
>  
>  #define SAMA7G51_EXID_MATCH		0x3
>  #define SAMA7G52_EXID_MATCH		0x2


