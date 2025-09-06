Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFEDCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2dacLMHesVeGl4p77HhpBS8AGnv2nwxLYHHxCHq1SY=; b=N8QWQsmgjBasFvdTSV+bt2chke
	cMxW08RXP/6Yzcl8xfsWSjrobAob0j7xhkghY0+Dr9O9gbMWqp6WcXRxGp2eyoGONBEBCBTeNgCnO
	5m5vFTW1+2e9qbbTpRyAidEFAfM2maZEWrii2hkiTXHfJ+AtdN5/HaxA7vKdmA8fQy5oO7hEpaI8L
	6Bm0W/LQZroR6vc6d/zzNVkv+6C/4lvbZP/Akbbzaaso5QpMSVH3zrfAku4SO86zFQ/+poxBoyUko
	4zMDRpv3cLNjL7Xh48tm4+UbnBt6ViembPYfXSuZMYrq0MhbY6zF7sy0flTRpFb/pdweJoS6Qabpo
	jrBwDzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxm6-00000008GVv-3JEB;
	Sat, 06 Sep 2025 18:36:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxjG-00000008G8W-3nlE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:33:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b804ed966so12632795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183616; x=1757788416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2dacLMHesVeGl4p77HhpBS8AGnv2nwxLYHHxCHq1SY=;
        b=H8ETcLamMXQVoqehB73EHVmGIwXKBxlol5N8l7zMOezRMizmxarXOAUtBlBJErWVbO
         6N4MhF5Tx+3axpSSu3WVXuTdkRHS4fbGbaYl8saO4EbSpb/lTOs3gVztcb72qPT26i/P
         jQd8BS4InV0rq9f5CgTXdrS0Sy/4J2gB1UCPvKbUkIns5wGmox6i8yUTLngJX+yn6+3M
         K1hHuW8JVNg5erurYABXf9RVFdqBu+2eStv+QToYsgUoxeeHWtsd2SwbM/PRhB86QRF/
         gzzNmCoVxkkrM7VreqJdb26HAyQLCeiitNzxwAGs4JCTxuoYyHZ1UoNaJ9gZGzXmbuuq
         8Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183616; x=1757788416;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2dacLMHesVeGl4p77HhpBS8AGnv2nwxLYHHxCHq1SY=;
        b=KFWoUR+ktKjSgBpmusIudYv22XGmBetSuqhI8re8L1TddzNT6j68z/WZnfsD2hxD+N
         a/rY9VSWlpnqXPGL7o9PxIzwiYsfzfv4ZL6Ao5upAP5bNHWdu4q14j9B9dy1qIiFZP/U
         ROjuVc9p/e5fXwPMQwdAilQ1wqMEo14kTlpJG/iRU1gDE/pr28gDa0BHgeb/wQ9P0u/c
         Wo3itJw0DHXOh2qeUp5c3isWfnoxmc1EtuMpUtnvnVbJC0pcqa5L/QP8S5Gh6R4IR+uF
         CtmKt9eO0JQbP3R9DWzGDPKrWzqe8Q4tKefIzawIt8Ezy90jYM8nJP00q4quST8IhJ6S
         Oq5w==
X-Forwarded-Encrypted: i=1; AJvYcCVcc0yXexQxT6giCqVGRy+QRe1cVEHCcfgpPTYirEqAMfgvirWFNcfA+rjhSpti0fZuJ1titdbp3yjjc4D0ODjk@lists.infradead.org
X-Gm-Message-State: AOJu0YxwB0IDHFCJCv/G7LTWpo7n9q4a5gMANQjjXKVKJPNQv1yememU
	v2XcF3bFSXZ6s6lyJODMbXPW03WD1eAZKH8ojWl/Oi7tZMjJBif+b/F8ng/HDpxEOsI=
X-Gm-Gg: ASbGncsrhpaK0s3nxiBERJXzqpXjck5OyHrbZhlZzdoqP1+oLyP7pnfqc8YJLzBhSzL
	c1L+8sTg50sUoErZkMMfL+XU6nFno4E8WD6C5nDWOQQ49VobyaSttnvrEFdGSJkT0ogzoIYhUDf
	AIsPYQVHt0I+7WFDBltuDALnbwsHLl4Di3BQnhAsyRmn9kBAshuzu2qjArtOOD25htXRxyTy/js
	AXzBC1wEVsH3wwRjhrNyQjZ0o1By9WGtGCsDQ6UJiUIDabAMXCsSm/NbsARraXeXY5N85nUs0H4
	Q+x2SEPGNaUkEFgzLAWYpP93oxwaVYEH0CA0AJACbh944jP36tWUnTwF0kjYiBdyNF0aXTZ5KWc
	OoSsYb4pNnf0zM2ssdLLv8ETymJ/wnR8=
X-Google-Smtp-Source: AGHT+IGJjXq+GA3SNmlqdifWOdhyu4Jyj/O0xGG3Pw4SHbwmcu2TdRqEXRwOHNVuP3i3mg9xuay+UA==
X-Received: by 2002:a05:6000:4211:b0:3ce:f0a5:d597 with SMTP id ffacd0b85a97d-3e64c1c34aamr1979332f8f.47.1757183616501;
        Sat, 06 Sep 2025 11:33:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e177488999sm9978705f8f.36.2025.09.06.11.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:33:35 -0700 (PDT)
Message-ID: <212df54b-b3b8-454e-8d4b-e79bd9b69349@tuxon.dev>
Date: Sat, 6 Sep 2025 21:33:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 01/32] clk: at91: pmc: add macros for clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113339_084887_B2111986 
X-CRM114-Status: GOOD (  17.32  )
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

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/pmc.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 4fb29ca111f7..0b721a65b77f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -15,6 +15,12 @@
>   
>   #include <dt-bindings/clock/at91.h>
>   
> +#define AT91_CLK_PD_NAME(n, i) ((struct clk_parent_data){ \
> +	.hw = NULL, .name = (n), .fw_name = (n), .index = (i), \

It's been a while since I worked on this. Looking again at it, having .name
and .fw_name filled with the same data may not be valid all the time.

Moreover, investigating it further I found that we cannot use struct
clk_parent_data::fw_name and struct clk_parent_data::index as the clocks
for these SoCs are registered with CLK_OF_REGISTER() and have no struct
device associated such that dev_or_parent_of_node() (called with
__clk_register()) to return a struct device_node pointer and associated
fw_name code to work properly.

It should have been something like:

#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
}

> +})
> +
> +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })

Could you please update this one, something like:

#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ \
	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
}

Thank you,
Claudiu



> +
>   extern spinlock_t pmc_pcr_lock;
>   
>   struct pmc_data {


