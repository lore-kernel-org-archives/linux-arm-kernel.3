Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACCDC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0Ut+HC9eKHgdin8LIIS2Fjeny6qwex+kr1lgIMYN8w=; b=oCw92QRf6UZXyHCaeqkyCohIGv
	dnRYdOnJ1ScCeHwRACTA3Z0JjlrNcxYkI1B1pZQJIBke8f+W7FdPoekVGu+Ony//7pXd9Igppqt35
	Ooe8qmY82KhVanv67eYTHUkg184TUgQ3jZ0eOPW6FPv8iCkeg6WQjGgk6acifW/zs3CEreMTrB3tu
	/NjrDkpW1TmJeVj8iSejulfLVfRx611xUvqvGg5HM3/omLUH4rQpBz6HwOht6feabe2rsPWQ1JbqN
	NL/GOb1Ek7w50wF+i+26zLk1uCWOXRosBpX+XV62RLKeevXMFIDSHkbk8bJSXveTLkCdQvS8/LTmK
	qSzmx9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksUM-0000000FQKm-0bxd;
	Wed, 19 Feb 2025 22:24:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksSs-0000000FPvQ-3Ax3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:22:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso2515659a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740003765; x=1740608565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Ut+HC9eKHgdin8LIIS2Fjeny6qwex+kr1lgIMYN8w=;
        b=b+/dOGe0d5vb14bKF6bLucJZIeSSSIQSDzfgTSFc8ffPVNwvEvijFaMz1q9x2ExjBU
         FjA+c7yDNHAInvN5JHg1hIwV/LTxby2+DwqwMxNeDpROcWe1UbDXw5N65IEw/PpjFFVO
         +mQH5gqIuHm24lJoKXo7JuUYwTSE2FvC0NjFLv3Q+t5q/w81UdEfOcKnRpdNQO0bkRHn
         wKyXTjuUd/QDTKfe1aFx6eQ9Ke2HZtoN1xEEonro0IEhOxJI3D7j3isYIvx/o2Og92qY
         hBDmV44OTWCD3KNvj6MT02KlhPnJLoz2P6HDYDj3c58crfHlJgK5NkWyM+QsLJi44eSN
         oWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740003765; x=1740608565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Ut+HC9eKHgdin8LIIS2Fjeny6qwex+kr1lgIMYN8w=;
        b=BoX4389R8iu084vur9h5WATzRdGZt6hPHXTWSRiMRUHnN2kEAI+SQ+0eoylulh6ZK4
         A32+2jja3GAl2vb7+0+D5GMTzRFbERyxYV6r0wphQDuVh6ONwq7q0ggZU4toYZ8J32HF
         N8RUF+Pe/JOkL5HmS8Gw0eF8n5AD1FkmcHK8klduBt/nyvCAgsDod+zjucWHgBueNYE/
         sixY3sryvCttlnskHOORykjtYC59OAlqpfwVNnbjOehYwWYWKYYA2EFU5MK8WROTTCPt
         SX6mgNqh4S5vJ4h8jBz5ygjW5grjYeXnc6vk8kWAUbdPlD+o7A0vbi1CIMz4KnXCpfDs
         ON5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1oCZo1xxhdx8NwTshjqLLce1LaCJEKCwU0CD62scPeTb6EkP4OCpgRKnU+3zNjPIBAwJlUuCuO7P+jkAeBAO4@lists.infradead.org
X-Gm-Message-State: AOJu0YwHhizdHnFm9cOQjSjYBlskdbQrnVnQanP8XgXfNl3PijNcwZhR
	/o3Gn4+938B8cIsIxMH1S6MRpYn4EKSZBa7sTSiUDabRHU55WR7x
X-Gm-Gg: ASbGnctuv7TUWDeCypbg4SVH/VV4dm3wraQ8/BmCk1jXprwogzjW4KVRR+kt2pp/Tsb
	zv/BqaISMQf4o6ID8VW9alAATLGaeMKukku2qGQk9krdLcfDIVj9iaO/T+cKHjQZcVQ/HceOTWq
	Q62jclWlEu93NP48HliINByXe77zDIBk4Un2Xk/Kdd1oxgvSnG0d4GJTjiVZRKqjnnuxZKYLO0Q
	sBAGA7LlbzFnLbwnZa0YfW1iSpdgx6brBTeXKn8tqvOEWAxBm1iezdFCJT357z+bXKPTq7sDROx
	PqrcigPWUERUZUWlFvoOQGeir74wll1peH/4bOS0RaX1
X-Google-Smtp-Source: AGHT+IHgZ/9o+/TaQRZkw3ZCR/vfHz3eRXJzfUy3azBJWNM0TELKM477HK5xLn7uBryQfbFCimYo+g==
X-Received: by 2002:a17:907:890a:b0:ab9:76d7:574c with SMTP id a640c23a62f3a-abbeda27f98mr82689866b.1.1740003764658;
        Wed, 19 Feb 2025 14:22:44 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbdf076360sm165470566b.110.2025.02.19.14.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 14:22:44 -0800 (PST)
Message-ID: <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
Date: Thu, 20 Feb 2025 00:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de,
 robh@kernel.org, shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
 shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-9-daniel.baluta@nxp.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250219192102.423850-9-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_142246_799275_EE6D994F 
X-CRM114-Status: GOOD (  17.37  )
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



On 2/19/2025 9:21 PM, Daniel Baluta wrote:
> Use the reset controller API to control the DSP on i.MX8MP. This way
> we can have a better control of the resources and avoid using a syscon
> to access the audiomix bits.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
>  drivers/remoteproc/imx_rproc.h     |  2 ++
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ea5024919c2f..631563e4f86d 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  
>  #include "imx_rproc.h"
> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
>   */
>  struct imx_dsp_rproc {
>  	struct regmap				*regmap;
> +	struct reset_control			*reset;

Maybe rename this to "stall"? There's also the DAP stuff that's actually used
to reset the core so this might be a bit confusing?

