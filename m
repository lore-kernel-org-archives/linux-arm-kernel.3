Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E608D46951
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykTbvmHT9/WGpPskvmRNezx6+t+3FtJHW4PlWu+Aw8o=; b=RHi+MICoh2djKHoj1lZE3t3lMY
	Pa02iMBWjePomg2sF78KOXK/JSOX+8ChxwITqbKzXDdf7/x4PNM+dFpuHdFO1Dyjg7AFVmJtu+u1v
	57IbOAr9AHHZiO4o1IA9GeMVa1w4yE89crQMPft2SS5cyHtOU0SEOQ29u9PqMJQBGd0BHCH/xilUm
	4bFb1wgZ3ryijgP8l+XR2Gj9OY1v39pDT0jZQNcsOY60XCiOyIcdezuF6qo9fcMSvP6lK/nGVz7Et
	uUk5QP+Jho4In/lI3mEgOnKUM2xc+XJrqFa4jvHcintzarnpS4BhVx0ZGGdpsv/nyldvS4ESrgLOB
	ett7yzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibNa-00000005p5u-3V9D;
	Wed, 21 Jan 2026 16:48:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibNX-00000005p4b-0yS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:48:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so369305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769014100; x=1769618900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykTbvmHT9/WGpPskvmRNezx6+t+3FtJHW4PlWu+Aw8o=;
        b=SMmO5TF1nLxodLG0+IgDoRoZkw5lYj2mdlBy8O6NnyzcDpyDWVnuKn7QkSECqOvdzI
         ofoIsYnUEUO/94lA5qzeAFi5RvY1xf4EWBV7FBu8j/LSh7XOj3kUHYr8QRwj/Da3xCOo
         kXoAM7NTbHZgxroXBdUAn1d0sWQIlH/UKB8ck8BF/ZLgVz7sq8TPfI3LRz23xgbvBDsx
         wW15Qu6JCWFHcL2Tqe59WasWEfrEBFVMETRl11/4MqvYbWriYv/zyyGFDnIh7PfQqhhd
         BgJiMrxd5osNLmrm/tbCcEzAzhJ6x7UjyuC9WjoSCS1+sQKszR7U+e0LYNTu+es5oVQ2
         n+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014100; x=1769618900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykTbvmHT9/WGpPskvmRNezx6+t+3FtJHW4PlWu+Aw8o=;
        b=M+65lgen0a+Na0gX6OKfR2QIAWXeA9gCPo9+Rbe0pMopRqmL7jzatB6S8iprrBFtiC
         euhJo1Dm9z1Ug6a1ie74+plmTFDCZIs5QDJP+oBsDXE5IrLUbMZJl1sk5ld6UcFN1OEE
         cwL/8AeuYOpEpKh/6XjOjkCYSyijgdaGPG7D3s6F1M6Et11oeTB3XzeNOfIETZqiM0+L
         8Wb4b4IyiXlOmXqrKs8YWjMqp5lZ382r/3nL//+IfLGQsDWxtEzCGyfMpQo34TgUoOHJ
         vXm9m0+HShxc5+m0y3+EAVlbUhSmC4eN8/Q1LdjjI8nGcHIArLtTL25U/FVr2x4XydGQ
         37ug==
X-Forwarded-Encrypted: i=1; AJvYcCWsVubzgPGs5E72ki13W+K2ZGxw2uSiDfbf28X43qiLtoHiB9UcAOhLmL7obcTrVTSVNuq0+u7LQE9zkhlaZRp1@lists.infradead.org
X-Gm-Message-State: AOJu0YwvixSCEtrsp20G9Vn5A3M3oTCrEvtMnOr/EPvUXkx/vBrHD7AQ
	BiJQPvrN13RdWe9tblAXR1dqS2+pzKunCNONHnaDavgiqgPN1dFmbdryJVzWO1IuBj4=
X-Gm-Gg: AZuq6aK61zRfwk68gR5J1jOPbUi216biZgKj8w6o8xOGEVlF41/sDCK71vhtJTOE9KZ
	GnYYb8Cm4wgEor44z7UOEQVAtsR49MecSvoAEkzDK60EDOSx8UX0n+aSAo/q0jHMUQjBocilg/x
	UcvZjifl8DjFC13kQ5JUlGOUNb1EN9GN07pecOYzoqoSAosWKabdo2gf/fbXBJ2DTTpxM22l7v1
	M39hhZUIjOPhon7d8Xg3/QKs1M5VsuGi9mIuy8/Hu2JUlET6ekkWZQMDsA2zUf9udZstTDrQJLX
	B5qINA4VkKPIv3wkMYZwNPxwp5RTNBM2HDh/KqKOu0wB2e89MJjzSr8pchsJ33Wfh9YspdAxjzs
	YdrrFpmBNSUGR4popcWb8Yk7G9QkSu/zsU0IhuTrT9F2Xec56airntQNp0OmrchesaS8n5tePCy
	eEOG74jSmaFESJdOkjE6qVotayjj/pzuHPA7ye3TySU8Elnuhqw5FtJRlKDeWig0s=
X-Received: by 2002:a05:600c:4587:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-4801ea340d1mr232570525e9.0.1769014100219;
        Wed, 21 Jan 2026 08:48:20 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede? ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-480424b64a8sm28528915e9.3.2026.01.21.08.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:48:19 -0800 (PST)
Message-ID: <529bb029-cae6-4c83-bbbf-7f7ea2637431@linaro.org>
Date: Wed, 21 Jan 2026 17:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] thermal: broadcom: Use clamp to simplify
 bcm2835_thermal_temp2adc
To: Thorsten Blum <thorsten.blum@linux.dev>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260105121308.1761-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20260105121308.1761-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084823_276379_AC8ABBAE 
X-CRM114-Status: GOOD (  10.71  )
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

On 1/5/26 13:13, Thorsten Blum wrote:
> Use clamp() to simplify bcm2835_thermal_temp2adc() and improve its
> readability. Explicitly cast BIT() to int to prevent a signedness error.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/thermal/broadcom/bcm2835_thermal.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
> index 685a5aee5e0d..c5105dfc6ec9 100644
> --- a/drivers/thermal/broadcom/bcm2835_thermal.c

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

