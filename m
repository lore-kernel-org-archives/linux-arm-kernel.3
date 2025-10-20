Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0E9CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2WAqcTO2AOLyIz/FH6din/Z+AHju6tvGlNEoLz/PUw=; b=GxGuDEBwodXizrxjCLm7gRy9Jl
	t5geNX6K1Q58ohyD3s3tkhCnG+xvaUERi3XfxbOXuQDWZfd9z5gi1QhyvZ3ugyv3VOKVkrr9htfTk
	0y/dgEOqn7Gd/n10guVHn2ww/hDxV5rgOksF4AxRWWzmRpvXoLtCFiRRikycG0kuYfj8EFC1o/Rrk
	8nzZiZOn3T/30aH1ZvsQNphxP7tt6g+bk07JkXo5uKmDY7ORLJx47dNIK7TTyLxrLn1XeoiTVUeVN
	CX43HW93rIN3Fndnx0Ya8N+lEaNYxarrLWKKzRNlSyka27RYk+vaMA6zcZ+SeygfDqCK10QTxTUpK
	ckVqzZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvjl-0000000Eo65-1xpD;
	Mon, 20 Oct 2025 19:40:09 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvji-0000000Eo51-2AH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:40:07 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b54f55a290cso733448166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989204; x=1761594004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M2WAqcTO2AOLyIz/FH6din/Z+AHju6tvGlNEoLz/PUw=;
        b=NWHnTCslRSLl7p4udeZ1hlHHAzZYSeJJ63UHPfhbgTH7dg4RRp6I6MjZWsIQa+uEDs
         xy9DDH58LUszCaP+l3AaCN4HBfvJo98A/Ure+MQCg0i+BvH5zOwHmCPcyrw5C2CzBPUg
         PleCWKaveaOvjZmY/E4YXVv9dcsbSHJrxAR3LHlk8LTfndIfKfu3wbSpkFeVvB5T0A/2
         CTvN1wOaHMwaJmKbWzQXEtqixJ4yNFy2yZXtjVgbJT33GHRfB7OPUiFUg9j8PyImnCLM
         UCKYCaseUhWB7LFPgiIbO58/GtdHgtjdIBvoB6X5wXVFKgWdmMUQLmW+yKaKps4Az09u
         3W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989204; x=1761594004;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2WAqcTO2AOLyIz/FH6din/Z+AHju6tvGlNEoLz/PUw=;
        b=g8CNxWXKUspRkHcPhYk7b8kI29LSrXxibOV/N845+dTdgxPh9nQ5kuewEBRQ+eN5FW
         cFDqQqptge9yeNz316VLZi98of9k/MyMzVRVWoi2ZOY1YllG/3Tek2Wu+VTvEQ3BDH7C
         7MbB2iApNSWRQJfluVLDwTwrQSPkYarTQO0plc3UJ1tQfbGW3g65BDYotG3QkHB4hlII
         qHks4RnP4KnJ0wocNMhwqA3m3vyb0s52Zo978TvoYYJSzcJwu6FfvVK2rg0t3sXSZaxZ
         bbjKZ+F8mrLFzlcPzJQhioZ5Rd04cWipko1iBCxnm7424hV+jLKf4awc5p9M/sZ+f/+y
         Zwuw==
X-Forwarded-Encrypted: i=1; AJvYcCWKrlCJNV/oXuc2dz3xrV0w15+BPEfQ3yqKlAE77rq25WqRsjWejosB8Rx/KjqJctXYIvzL9VmPG6R10+rZRtP2@lists.infradead.org
X-Gm-Message-State: AOJu0YyzcTkqDrCWk0/h//28S9JfSaLWOz6XvwNGYMUUullC5wKERSA4
	lWt4Q82jJUH5cSVP4A23rzckplJaB78uIlnWd+T49IpKwVStDfWUkluTS/Y04KYh7zw=
X-Gm-Gg: ASbGncsLj57ZMuFQPkLnER/DwbEgtFwvubgrvmyhHTrY9VB3/IJb9IpHmFcBnHqJGDD
	Lf5lBZCiT9zW8XTHdg+ScYYnxfMy1aEUx8gPsx/DmnkjZSCjZWoQS22tKpnNqThR4TDo5VW404t
	OAzhg+oUIex93KjqrrqxnX1uZSeV4w8L9ngQ3CyxNL0LTsrdl4Sft0gdGIMWSBuEGaWGr6pUd0f
	iaCfq30B8A+4JqDlkfUuETLFy6IEmExiGyh8D7ZlLXgbNVJIWTBlYwRuckDjVYUFgDdOLj6gs8N
	+sHZrPnMqMToTuO8Q8zHhCYX+Y7/pv6vCy335QHTxTYuVpxloaGKnSfOGClLQ0WjMwQYgo+yQ4m
	zHkI3YsIUeFb3/4rqJH10k7J2uiwr4CjD4VCyFY8vxI26Jr+HtPmKl3UwyQ7C2aNadT6PDNFIFq
	oMsqSp+Z91
X-Google-Smtp-Source: AGHT+IF09RobC4gyw0AbqaF6/r2W5otyzw0fU6nmn3OYfhjdCkVeH+7JcW4ecWr0aHOx3GqX12KTnQ==
X-Received: by 2002:a17:906:7316:b0:b3e:580a:184f with SMTP id a640c23a62f3a-b6472d5bc18mr1594908766b.4.1760989204253;
        Mon, 20 Oct 2025 12:40:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0362fbsm880048666b.39.2025.10.20.12.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:40:03 -0700 (PDT)
Message-ID: <0e64be2c-4ef5-4731-a503-65fcb45835a1@tuxon.dev>
Date: Mon, 20 Oct 2025 22:40:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 01/31] clk: at91: pmc: add macros for clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <0221c90ab3025c8e72fcdcf54c685da058c0fe4d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <0221c90ab3025c8e72fcdcf54c685da058c0fe4d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124006_565403_21CE0DFF 
X-CRM114-Status: GOOD (  13.09  )
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

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/pmc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 5daa32c4cf25..4a416d227c50 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -15,6 +15,14 @@
>  
>  #include <dt-bindings/clock/at91.h>
>  
> +#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
> +	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
> +})
> +
> +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){\

Missing one space here -------------------------------^

> +	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
> +})
> +
>  extern spinlock_t pmc_pcr_lock;
>  
>  struct pmc_data {


