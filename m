Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9603DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqxADw0mM/35GjV5ECvP4wRGY3fCb1JBuXcZqTu8EFw=; b=U2yPEuL3B3cDy18m7JAyE3Xmao
	QwM3GJaFqXCoPJszgsb6vDQ6ls/EyTC8mi/oUMVI6ztwE2HrjNnRnEu+tz42xRQMPIjuXdVKV/n6r
	yrdoLDXCOKr37fLX5yndIrmk0mCMcuc1Fzomj+iB/tFyTxMhwaFRdZWgsYlgB7BfHBNdQz7wV/P/A
	ZGbRVQD1zB44WEV+pGEXe9lRYQVg4cuNVXYEuzGJAjYrW1Ai+KyTgsIAXcsOnfkiTenOaTELnROUV
	JwpMxHlYFI4Zi9g5eqbuzh9AN4HuGJ9kywKLRSMjniIQ9cVsXYkfOjDOFsyk8gCW9i2p7d4Yz6mRp
	5wJhJ5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7vb-00000006aa7-3pdY;
	Wed, 12 Feb 2025 08:17:03 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7uA-00000006aUA-3iEg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:15:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab7cb1154abso358982666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348133; x=1739952933; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqxADw0mM/35GjV5ECvP4wRGY3fCb1JBuXcZqTu8EFw=;
        b=q9964mnOtzd6mY/4OyX9PkqdtnC2/5v1yqFX5EsuvsOqJwAGMQ24S4p+Sh5dF2QmQm
         hVIUCiZ8ZefLk0sGVukMRY2exN3t6Hhgx0PmSl34uPQ8heZ2Gq9g9hrq4j47vun2uqO4
         Wva4eKdW6F2r2WyDQIvJchXXtf4waKigaAXjM2z0M8ap5vDbz6D0EVsoo5LFiXiv6uKy
         JDjb45RTighGvy/xq9kuUAA4aHsdvxE26cx36bXyavf/RtYYprE4V/ooo8MXIZqq/vBU
         0TsckAIZgD8CR7AVpNOlgAKn4a5Ga93Ps5nzKNwZS1gAEv5uzQOUzHo1IWrWzbH922Zb
         KaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348133; x=1739952933;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqxADw0mM/35GjV5ECvP4wRGY3fCb1JBuXcZqTu8EFw=;
        b=B+AbQ6hfFvTvPJZEjVZbkqH3BAIfWlNsPQGjGzujQlQbTBqN/KbxP3pqij4sd83iRi
         /Wtrz1ySy7VnXBOZv/oJr0htziIwuQsiVBgaVjF0MqAVPv49Ps0Hjkb2d1o8khi+Ks/k
         OXuQpeQGfND7XEnD5HRj2U8cDyjjlrAzUoV5NqwLkhJJi7DtkRSApK3qxVKN+Uf2UEcw
         edrFLI0yoKNk23WDy9fu2zWOW4frinify7dG5h+ok6zjHmU3S/6g7MavomNxoPfb3sqr
         OSe663hU/JOqVE1TdQMRbaw4AXCto0sWuYAiXgiSkTuJRfaA4ieq7NyDhbYRlqBl5C+k
         t3cw==
X-Forwarded-Encrypted: i=1; AJvYcCWRrT9eX0ZRS2bmE5Pyu2p+LBSvDX1sp/6eBN3qnc4PeGpm4zilEQhksswN8NqZOLQ10AKGmqcmZcgLwrqGCuLX@lists.infradead.org
X-Gm-Message-State: AOJu0YzdMlFEOFlNxvmW9ZcuG8w9Lb+UDni2UEGFbs/Py7knedfiCfX0
	NgKFWWezpOqCl5YNt3rDLIK+6UF7q4EF+Di9thY6/ac35sqJas6fSkYnu7Lxcn0=
X-Gm-Gg: ASbGncuBmoQis+dEHNvsBM/9XAAPoj9GmrrFpb3A2/7/qSumvq4E6TKcUkIDc6G+tCb
	biWBgyYk+cWGzSrG7ams7cfJb25RV33vOuXlUxI59R0QygsxfzBVsOHo3KtpZRBt5gyUYlBrYG2
	Qx5fuoZHkihuPwnqHEpc11dnHalTa6X4Pll9Lf845cGkgpfuHc5Hgfgv6HMtDmmfFdPUxURs3o2
	JLj34b7lkg0O3uHFOb237hysCPHWy9Nd5UZJwPN2Ez5LbmirRXob+0sI3Lmi9Viz3QIElNvI/df
	gRnuZLehQbVObmighqovh9fz
X-Google-Smtp-Source: AGHT+IEbwR6Lyd/Au1yiix8z7N9e//5C4qN6OPaROOH+JFMvGJ7S7t8yx7MVhrpHdvoBh0/u2cudOA==
X-Received: by 2002:a05:6402:13cc:b0:5dc:caab:9447 with SMTP id 4fb4d7f45d1cf-5deadd9d336mr5364745a12.18.1739348132467;
        Wed, 12 Feb 2025 00:15:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de44e4bc17sm9802856a12.70.2025.02.12.00.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:15:31 -0800 (PST)
Message-ID: <833f642e-a4f5-46ad-8854-0e85598d1be7@tuxon.dev>
Date: Wed, 12 Feb 2025 10:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] ARM: at91: PM: Add Backup mode for SAMA7D65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <76a89f1ae5e9c4d337c2a28e4b1d0e5cef63e5fe.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <76a89f1ae5e9c4d337c2a28e4b1d0e5cef63e5fe.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_001535_092879_E2D2A7ED 
X-CRM114-Status: GOOD (  19.79  )
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

Hi, Ryan,

On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add config check that enables Backup mode for SAMA7D65 SoC.
> 
> Add SHDWC_SR read to clear the status bits once finished exiting low
> power modes.

Can you please also explain why? From [1]:

"The text should be written in such detail so that when read weeks, months
or even years later, it can give the reader the needed details to grasp the
reasoning for **why** the patch was created."


[1] https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html


> This is only for SAMA7D65 SoCs.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/mach-at91/pm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 1eec68e92f8d8..55cab31ce1ecb 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -707,6 +707,9 @@ static int at91_pm_enter(suspend_state_t state)
>  static void at91_pm_end(void)
>  {
>  	at91_pm_config_ws(soc_pm.data.mode, false);
> +
> +	if (IS_ENABLED(CONFIG_SOC_SAMA7D65))
> +		readl(soc_pm.data.shdwc + 0x08);

Can you please add a comment near explaining what 0x08 offset means (search
for "SHDWC.MR" in this file for an example)?

Is this cleanup needed only for backup mode or for all of them. If only for
backup you can move it in at91_pm_suspend() after fncpy().

Thank you,
Claudiu

>  }
>  
>  
> @@ -1065,7 +1068,8 @@ static int __init at91_pm_backup_init(void)
>  	int ret = -ENODEV, located = 0;
>  
>  	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2) &&
> -	    !IS_ENABLED(CONFIG_SOC_SAMA7G5))
> +	    !IS_ENABLED(CONFIG_SOC_SAMA7G5) &&
> +	    !IS_ENABLED(CONFIG_SOC_SAMA7D65))
>  		return -EPERM;
>  
>  	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))


