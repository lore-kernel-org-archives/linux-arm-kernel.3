Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF4FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0sU8UuAz6zX29kmBzzz54CB+mIZrBU5m5rlPw1QPe4=; b=WTWabE/r/d58jpj4B4wwWUVuQI
	LddozQoGP6p17aANk0zy4AEuNHtfZ1Kl2PwxyUEna08DC3xVqgWE51zvXlTY+rJmH8gsKxJa6R8hK
	wcZbW/WCarL44jTyZUdmho/oi5loC1OpuMCIjCFfFvP0KNv5O3U2h0xORSudmAi7wJpY+xW6UDG6f
	x37okutIjnP4a6GWp0M4az0ireVVVLsKTdBoZDoQjc9Q4uk2vWZ9C8gjB2yAYch4zmH7oa4y9sNOM
	s5D8dnk+hw3wzT6rcCUgpZlw1b1zsSJvfDcT8yV53PJ8UbJLc2fTjjmQ8dF1F/bj8hmnnXi686Puz
	rI4WAcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipNO-0000000DqmE-1XkZ;
	Fri, 14 Feb 2025 06:40:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipLw-0000000DqYu-227t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:39:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so260088366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739515147; x=1740119947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0sU8UuAz6zX29kmBzzz54CB+mIZrBU5m5rlPw1QPe4=;
        b=n0cA18ZRU7ZiLHug4ES68MFu1FJ9ijt2007FTL9X+gvwYEvCGTVl11fbpKTz5a15+q
         nRGdc42B/Rh3t72vCPNkoHf21M8I8Qljv/vN3tGrOWcvDGIErTPaIwuBrF1nws/X1ItT
         Z7+Zptj31oSt4PZyWypjFc/85WFFYWVJYdncFJwOw32auXgrB07+ItjbusG983sDH6WF
         p4C/q/rUc4ppKHEH+W8P5shbYe5wGO+qGWGfhCW8+XNsThMnBvCuvZeTPf+8JsyvjezO
         ZX+h05zq5hXB/dQKJ3JymleFfmifqKJcNyfnmKAFHxFjTYnyM32Cz1M/A8vwjf+YudUa
         NgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739515147; x=1740119947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0sU8UuAz6zX29kmBzzz54CB+mIZrBU5m5rlPw1QPe4=;
        b=NJd4dh73nmAdLBgKZwJxpjcwu9Honj0D6eJOSesY0We+6SvrAZ8zmMuX5cXIzyIxA1
         UXEdcGLJfnS7yEZqR0E5IXZj39aoajO9pEu+xzj3zYLlh1Q/VB0jq3OBzIuJbSDJ6RT0
         wRQSYqNTHU/p3NUv2Q40PaStZ0cn/s/RGfHrCN0ECF/IcM2QWkn1bbw3BcwLcxCt5gEI
         H5+sJUot8bhpchv8PlK0di+r9VPdT8mvS/un/74xNu5hJD/hfC3jtyr9/XcVeRA6qIo2
         N0OF+hv8jfJAPy+6S5iWrvSozxbUPyqxXAUfjXD3qnLMLHBWWknWphDwGwKuXhnZ8GIA
         V3hw==
X-Forwarded-Encrypted: i=1; AJvYcCXOKSncDIP6ON4/7K9RKeq13xWbb2IitIZkx2I6DLu83sIPoxw39iHTVl/IRB4x+9jCA3hxpCYiEylPyf2R8ruq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8pK4rJXI+ohFjRBUv9mHjWwoJDb7ljbJTcnNDiYRm2cB9B5oT
	YpXjZzCNFvRR+quhlLv9CkhWrNacql7oXxqN/zSncKCkkVdXTGjnem3+GNj1FkY=
X-Gm-Gg: ASbGncsMlJLcgAT0NPnIJVKlKYd9QHXUGhwihRvzVgWJf8fyOLrFZpUAySwXlNP/MqR
	AslJyeZYT4AYgezn13tQzLTuUZJVRzx9RpW4UCjfp1eiu7lhtEwfaKS6CxoRKgyg5QPLRVnwOZ5
	IyVfCRrs8KFDOgIhs04YCdW+IBMQd61poUD+kz5kiqW9ajxvQ9Ci4kuM67Mgf+KJklj4S7UzG9N
	Jo2QjxcAQewMJAh2NPPUZ0DwQeSEGxxV4Rdv9jmSiUQcy6xNx1F0rm699H247X15cZXx83kE2l3
	deSHPIjvQNuYbvkONo5deWfu
X-Google-Smtp-Source: AGHT+IF1d6cYVnJi5xW59uL3+6NvNiwx8uIujRV1yuXHWDc54Fra2mr4R1Bhi8JKR7ZMNqzyULR9og==
X-Received: by 2002:a17:907:d26:b0:ab7:da56:af95 with SMTP id a640c23a62f3a-ab7f336e7b4mr907392566b.2.1739515146641;
        Thu, 13 Feb 2025 22:39:06 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231f36sm276066166b.33.2025.02.13.22.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:39:06 -0800 (PST)
Message-ID: <cf0a5ab5-265f-4429-8c11-8b669f00bc70@linaro.org>
Date: Fri, 14 Feb 2025 06:39:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
 <20250213204044.660-3-wachiturroxd150@gmail.com>
 <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_223908_528259_76FFBBCE 
X-CRM114-Status: GOOD (  18.38  )
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

Hi, Sam,

On 2/14/25 12:08 AM, Sam Protsenko wrote:
> On Thu, Feb 13, 2025 at 2:41 PM Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>>
>> Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
>> Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
>> configuration port.
>>
>> The difference from other new port configuration data is that fifo_depth
>> is only specified in fifo-depth in DT.
>>
> 
> In the code below I can see this bit:
> 
>     /* If not specified in DT, defaults to 64 */
>     .fifo_depth     = 64,
> 
> Is that intentional or is it some leftover that was meant to be
> removed before the submission? From s3c64xx_spi_probe() it looks like
> the "fifo-depth" DT property is ignored if .fifo_depth is set in the
> port_config:

fifo-depth in port config is intended for IPs where all their instances
use the same FIFO depth. fifo-depth from DT is ignored because the
compatible knows better than what developers may in DT in this case, it
is intentional.

> 
>     if (sdd->port_conf->fifo_depth)
>         sdd->fifo_depth = sdd->port_conf->fifo_depth;
>     else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
> &sdd->fifo_depth))
>         sdd->fifo_depth = FIFO_DEPTH(sdd);
> 
> Btw, wouldn't it be reasonable to flip this probe() code the other way

No, please. IPs that have instances with different FIFO depths shall
rely only on DT to specify their FIFO depths.

Cheers,
ta

