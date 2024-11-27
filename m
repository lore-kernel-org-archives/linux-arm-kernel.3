Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438D5D6D247
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ym7l4wP9jm33rMK8hq7Dojc9huneQPkXTHv2AKyJM8=; b=HViEz8fZF4LWQ2hRSRnRlrPCZV
	7UpRYLn6awlgfZYT5MquGSDhLawPW1ZAgRoKJyc1Iz0NIKl1/1M4b5ui+6WsRCVNW4DMLgXsdRx0Y
	LT6NhEEcyiQ+lkPcYIrMbXapEOb2vE48/Ly07zzYxvAHnbPYnPlCutgcYWIPLipnLSCq3mmiMjO9Y
	lOqh+wv8ZE1gwkV71dsXsJb2HpKGyqbXM1B5r7UDIaWMwpVtPqc5coo9o9/hR8mDDl6Pwo0OREVlC
	+VRCeI0ppiCHrB68uXhSd+4rVbdWy8ficF1mXGYBKCnAATTiPm9Qk2L2Qt4DohGILpZch02uGta2f
	xRqHFn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGREm-0000000EFpV-33Za;
	Wed, 27 Nov 2024 23:14:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGRDo-0000000EFn6-14cQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 23:13:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso82692a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 15:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732749203; x=1733354003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ym7l4wP9jm33rMK8hq7Dojc9huneQPkXTHv2AKyJM8=;
        b=Miy8XN5cqBoLTrr8NzZ+rVP988ipFTQJV4hqj5jSoDFsIIl+pwPfXWnFpLbwHZ+Llj
         CfA600JohWCwqGx600sGpvdU1Xa8TJcPTPGOSERdHCe9/Sa/euZWWwPA/RJgSAGTPvHj
         v7aSuU/ed4pdsHADKagcI+SNg2hXjVbHU4qTTnl8e7oCKhGDhDMDZRfZPlp6cikDsQZm
         rfC5WGZvSQN0d4CaAADlJjLX+KG9JQSPf/vcGdGa6bJSPtul7Qwd2kri5AowR8dymzDU
         EX2x7Z/6CiUMJDdCnGB7/FzXQGUdJwmANejH+l9UtB/K6h/Pl0NczYgm7sc9HVv/oPzT
         QlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732749203; x=1733354003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ym7l4wP9jm33rMK8hq7Dojc9huneQPkXTHv2AKyJM8=;
        b=nmjKacsLqbqX5lhdTFtqBqAb3yTDO2ghxha4VoXfFyoWxSPrxdO3HrliuIikW0XzUU
         8g32wCvSNQoIgRhWVRZi/kTGMRgWT5hldMOflHs8RncY7/c7G3nAtYxIAod9Tykx1ilP
         yXfRC3hvC/8AGnpcU1JVr3GS8do5tifMHMWcg3DIDz4A/kvddbAdDdo+QgNtuGsEyWUa
         XxTES8+mTNz8qXbmtB5e3GuZld5/08bU8EjvRfmamwvO3aYVMtCYsKVbEpvhN/CiBMS6
         jrnhseoBw2paIhEc2N6Cc4zumwLnvpH1KqwhFFOQbzfXoea4PZMZ00lbnfbtxSkRdfY6
         9/tw==
X-Forwarded-Encrypted: i=1; AJvYcCW4t5fhnlwSZVCqm+0DF1AzirDMVwelf32PZJmujq6VJ14CXzwWTDJEUafG8qNan2Ovt227JhTO7S/tIR2ct7uz@lists.infradead.org
X-Gm-Message-State: AOJu0YyaD0PD9Zo8qhy51swonn7k3nTsZz6ZOAt3+SMnyesDDHVmokC5
	NZ5zsfKLQHiWRLADPwJzkD3P/wppLWHdD/bzv5fP14X00KR2bxOy
X-Gm-Gg: ASbGncvxElxeAOUjTXPMt95UecKXNQJqwTev1612TY4DqUNT+9WyiBkJNs+GzOXlkZb
	uHUkwfgKAbCRQfbybpqppblKlGRvfOpnycYPtrDfgEwkxKPou5bcywdVsYJE/ziinGHQxNzdIkY
	Ge6fXwd0KsEPhEpzIYv4W8AGguoz5v1+WrdV1JT2ncG0X0wIJ+VSL5CDqv/wTckf6I3tCro11I2
	sOVOKINp4QlY9v36ZIWjiW1md8mOIKlsJF7SoO//8TbFRLIO0UcSCt2/u+HUPQ=
X-Google-Smtp-Source: AGHT+IE5q1S2MINZEvwdh0rBuph7heoy1wo1HGVrVW7vPzA/G9lPkX+dnmrQTdS6lAjOf0bFbomyig==
X-Received: by 2002:a05:6a20:a111:b0:1db:ff57:562b with SMTP id adf61e73a8af0-1e0e0b88dffmr10479085637.31.1732749203191;
        Wed, 27 Nov 2024 15:13:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176121asm114591b3a.39.2024.11.27.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 15:13:22 -0800 (PST)
Date: Wed, 27 Nov 2024 15:13:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de,
	linus.walleij@linaro.org, esben@geanix.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
Message-ID: <85db9cc6-f1c2-4159-a826-f90b97b59a89@roeck-us.net>
References: <20241127190605.1367157-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_151324_297841_B646F71A 
X-CRM114-Status: GOOD (  22.24  )
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

On Wed, Nov 27, 2024 at 04:06:05PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
> 
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
> 
> Fix it by selecting CONFIG_PINCTRL as before.
> 
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
> 
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
> 
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
> 
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v1:
> - Reintroduce "select PINCTRL" as a minimal fix for 6.13-rc.
> 
>  arch/arm/mach-imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index e4fe059cd861..dc47b2312127 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -6,6 +6,7 @@ menuconfig ARCH_MXC
>  	select CLKSRC_IMX_GPT
>  	select GENERIC_IRQ_CHIP
>  	select GPIOLIB
> +	select PINCTRL
>  	select PM_OPP if PM
>  	select SOC_BUS
>  	select SRAM
> -- 
> 2.34.1
> 

