Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3DBCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl4XbChRRX2SzAfJdIqD9LXDTYpJPDAGOZzCS282mUk=; b=0FSgI7KqVj+BRu+6PWWszRa5NT
	K/bWiIN/cVPZn3FQP9djKnctpMADtEZvQtH9mCuzMAL+aXfq8CYhKLfiv8cXUIkQ+/UJV00IYMs2X
	/kIu29Bki9Pmh/65OvNCaJAmj0HuV9+jlfzfLvIDguL283L2hdxYf+C1rik7FeWOwaYwtxvIRhtB8
	+9sDJuzoWJowhMLyY7XMGnfiWo8+7rDXFqltXsAHnos0CUHfUxTwgSdEq3utsxTgSqpU87WIYyHEk
	Wq3Ev5AlAV1lKGP3zzzcfWz4sjB+Am3WVCFGQdU6Qtopn0coJa4jldPsGgSkYDl7w/29y9YvyYND6
	1Wn+8A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdyv-0000000BjUd-1ehM;
	Sun, 03 May 2026 21:04:05 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdyt-0000000BjTu-0unm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 21:04:04 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12c8ccc7755so4951347c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777842242; x=1778447042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dl4XbChRRX2SzAfJdIqD9LXDTYpJPDAGOZzCS282mUk=;
        b=YPLDJpGyIaKLhfDiICbDM0GOh8X8HNbmMl/A+swU46sBLdaa2lgokyu/527u9/XCS4
         mulH29TKMjTOI8Ie5aT1LO18Rqk9MvdDJ0RnT/3MWYRu56IRTtfytSghVEc24Y8OLN3D
         ssy7uhf75yIhUCzooWEF3iCtegNlUQIyzo+0ySyYkg6cm8eXISKPQXqWtHBzoYqcULV7
         je3nhGaJ6XUVi6m6tbe/0XvNW4ZFoyZCH8LzTVjbd88XVst5n1Gh9qFo5eA4UFP1Pk5i
         eb/3ipSHvF/o22GqV5iDGZ1Dfv5arZLppIR0Q6B4gHU4I+tZCT3tvV+I9qS9NYtheUqw
         mYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777842242; x=1778447042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dl4XbChRRX2SzAfJdIqD9LXDTYpJPDAGOZzCS282mUk=;
        b=MqMeESyjROZPgiPrGWsjfLyamTaA5NyBM44riqCExOUgABsfaeqPgSMFuxXaAsX0ZG
         CnUSxeiJ9hNvzXu+sKZt6Mv+rjVqg+KzM8b2Qqd/gZ2BNEGLCjKstZIJq44T/8irQoM1
         QS7pv/A9j5QxttJCdmKFzRBwxU8yd46uCmOysKqFHut5izOQnsVERVEBS1IfLbwLL9ij
         40gC/i9bYZ8OJVZC14qeX6CZywb/5LzaikShql5pacLMWHUDlpL5clnwpGr3+vpVOSkb
         AkwJcMyB2s3UDzc6MdYzgDLuVsAVYN3Yr6TPgIMurbti559mxu0dTzrgdHW0CbWgri+T
         7q/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/t4icS6EpCACnKYRsynezBlkFLL7RDW+NWT7x2tlNto7lk35ULdcszdsOxt+/Qbb9O+eVzRvzX9sBcdVRmK3fl@lists.infradead.org
X-Gm-Message-State: AOJu0YzzWj0s/+FIWXlOp49nUW5+AG1n46Ra6sarFEK4I9FBrR+MDJGF
	TLE5MQp5jJUWSVwI4P/FYqZX1Ls86OvjghlpyKRpXt6inGGrqc1igOEG
X-Gm-Gg: AeBDies4fuGTBekEs3xOH2Bo9CThNuHQ+i87Vthpv1jBAWcPLOCynmIteC/IXiS8kKi
	nH38NcZrB8oh0gkVbVeGl1X1VL2CLEQnoIbfNSrMjJ8/4T4ZSqWrSPjvkLJ70+tzbkZHBysaXDJ
	ZoIHl2jmKQPSBMtlJAvTmzw6BT3lCZW0ecTyywUaWUufPEcbFOhMeLHNiyIAO/WRbgQQlX/OYub
	ye8eC4SP50JYrsdRne7BgJJfFS+sSiWXbntNywDm64qx/lYnoE1A1d9aax7QO5lg+ES+bgjXyk+
	50swWcWEEXIFrTeSeHUFTmeR6lydtboTJNF3hD9y/mp5/psAzrwN0dKh+WZO/guGDaB9yaU+1A8
	3PwtfshBdm90ZgXf1Y5PcYIiedWB/LAE0Vz9GJUlAO4GsE6cHJqjEqHTRMBVSD5rxQb1cLkBIAE
	VKZr5jmwgBbk0iB6fvCW9xBhZfllqo76uDGsgRfam8u4GuMr4nHANE+Tit8w==
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr2830188c88.21.1777842241500;
        Sun, 03 May 2026 14:04:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df827a73fsm11486445c88.1.2026.05.03.14.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:04:00 -0700 (PDT)
Date: Sun, 3 May 2026 14:03:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	alexandre.belloni@bootlin.com, andrei.simion@microchip.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 2/2] watchdog: at91sam9_wdt.h: Document WDDIS bit
 position per SoC family
Message-ID: <a5f60dc5-0aa7-4324-821a-e0c74b965f8b@roeck-us.net>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
 <20260302113310.133989-3-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302113310.133989-3-balakrishnan.s@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_140403_265922_5646701B 
X-CRM114-Status: GOOD (  17.29  )
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

On Mon, Mar 02, 2026 at 05:03:10PM +0530, Balakrishnan Sambath wrote:
> AT91_WDT_WDDIS (bit 15) applies to SAMA5/AT91SAM9261 and
> AT91_SAM9X60_WDDIS (bit 12) to SAM9X60/SAMA7G5/SAM9X75. Update
> comments to reflect this and add SAMA7G5 and SAM9X75 datasheet
> references to the file header.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/at91sam9_wdt.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 298d545df1a1..2020694f8f6f 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -3,40 +3,42 @@
>   * drivers/watchdog/at91sam9_wdt.h
>   *
>   * Copyright (C) 2007 Andrew Victor
>   * Copyright (C) 2007 Atmel Corporation.
>   * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
>   *
>   * Watchdog Timer (WDT) - System peripherals regsters.
>   * Based on AT91SAM9261 datasheet revision D.
>   * Based on SAM9X60 datasheet.
> + * Based on SAMA7G5 datasheet.
> + * Based on SAM9X75 datasheet.
>   *
>   */
>  
>  #ifndef AT91_WDT_H
>  #define AT91_WDT_H
>  
>  #include <linux/bits.h>
>  
>  #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
>  #define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
>  #define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
>  
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>  #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
>  #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
>  #define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
>  #define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> -#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
> +#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable (SAM9X60, SAMA7G5, SAM9X75) */
>  #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
>  #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> -#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> +#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable (SAMA5, AT91SAM9261) */
>  #define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
>  #define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
>  #define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
>  #define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
>  
>  #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  

