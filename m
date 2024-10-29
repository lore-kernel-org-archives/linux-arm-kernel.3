Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F891D2AB30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M/KQdGIkDYfM7K25gdQMNQDVUPshojJzAQojc78QCM=; b=420Bu578ErizG1lXUltBApltT8
	5rBs12t+xWhfcy8pxc2n9TAHPhT3CYpgHjGkns8aO0r+FrMrrxREUzwdxChZ7gDml4H2iivo2MEqG
	ADi21GBMVn29+jzJSUQbiCrjZ/NFt46TiSs7MBepsNHI/eikrBemnG2LfEnq971oLD76KLJiftoPe
	jA9kUqIrtPzEnNKAu7u/qva2G5NQk+1Jf1o31qtQkJHBgvvaurxCIWLgya4BvSlASvbta9XyrGM1M
	QysrCw6dcgDzBwPtL7GdiFiJdw/H+QZYicXh6B8u34VeUmY2hlzi5wTqhJcMyusD5WAt2EYVgGiIr
	IUl8SPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l6I-0000000EMoT-3aPr;
	Tue, 29 Oct 2024 12:13:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kWL-0000000EFeb-1mVI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 11:36:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so50926855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730201779; x=1730806579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+M/KQdGIkDYfM7K25gdQMNQDVUPshojJzAQojc78QCM=;
        b=egZdmo57lXvTxPx0H+ysAmC9UYkz2iTC/apBTQe83bVa70xcO4QH+DDkGNbY86xhny
         Pw890elS8Rz5T1jANA3Rq7LS2kixFodD54yPu7dvUHbz7RKltRAsMX2GJkP0bHW/ZIPV
         aGCeERh0AjloE7pypgPzKX3fA2ZCLgZwcZA0DUqD+gWka2q+AU+JYnHp8PHytiYYN8ZB
         KTSRTc4s13WIg64fwcM1oZX5A2bKxjZZEZHNjJFL0HwT59VUtaiVZghyRa7tAC0K+N2X
         mkdR1581WCkrc61kdssN++lrgL0gbHx7DtaEHny9kikdv9z5gLAR1z7C8/9QURHkCDUE
         a3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730201779; x=1730806579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+M/KQdGIkDYfM7K25gdQMNQDVUPshojJzAQojc78QCM=;
        b=Wm9sxXlUvUReUj0tzf+JWKJ8CC7k7JjPRAxXsa50bwL0ZeOzUNNq9CTCMBtSr+R3Hg
         9RiqLrrUJSQNqsdvAFMF2tbKti7h786vBj6HFUNe5PQZdCfYhCSNDDXovFJ9zmsCZmRu
         tR9/pfgCPJHtlfmtdbccpXYqU7/vs4kiQDb5C5yLebjoot6nUIPrKW39zO9hEmpyg5qT
         wpAsLoiGdrIA6Pb6gltc1FF2ZqYYvJGLG9xQQxxHUAbbhxWzsUuqU8U/yF3gIuaC2psu
         HfdTchcRW25FRiuKtAdUK0yQeTXhWQ90kGCQm+M7tp9rKMmMbms/wPMmKPN8R4lio0wb
         qQCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxqQ5ip9Cz9uFBRLOkDxeTRgQpli3IStsHiqR11IzGgK/wPTvbl4KC77FMvArp4zMxRbZbh/SiIjeffAglEtR/@lists.infradead.org
X-Gm-Message-State: AOJu0YwzrhdDCWXrENtJT+JwCS/t+i9NcRHBwdEiOansH0hSpSNbMDLt
	9jXTsFvFhwRf7eSa5Wxzju+2tEuFLwUclzD+crwfonpbWIIBDRT4+hexH4945Pc=
X-Google-Smtp-Source: AGHT+IEOBrGtnrhp04p9oamxv3IoUL1pQg8omLS9eVTdrvSsB1a4sDi6dykLX3HF4VOaaj5ki/bCvw==
X-Received: by 2002:a05:600c:4e8e:b0:431:3b53:105e with SMTP id 5b1f17b1804b1-4319aca5995mr92471355e9.9.1730201779516;
        Tue, 29 Oct 2024 04:36:19 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360d32bsm141307985e9.46.2024.10.29.04.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 04:36:19 -0700 (PDT)
Message-ID: <0bbd2514-ff51-4b0c-b3ad-547e4937d9f4@linaro.org>
Date: Tue, 29 Oct 2024 11:36:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: atmel: add at25sf321 entry
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241029-spi-nor-v2-1-e166c3900e19@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241029-spi-nor-v2-1-e166c3900e19@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_043621_513974_0AA687FB 
X-CRM114-Status: GOOD (  21.44  )
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



On 10/29/24 11:23 AM, Marcus Folkesson wrote:
> Add entry for the at25sf321 32Mbit SPI flash.
> 
> This flash is populated on a custom board and was tested at
> 10MHz frequency using the "ti,da830-spi" SPI controller.
> 

no sfdp for this one?

> Link:
> https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/partname
> at25sf321
> 
> root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/jedec_id
> 1f8701
> 
> root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/manufacturer
> atmel
> 

xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp?
or hexdump -Cv if you prefer

> root# cat /sys/kernel/debug/spi-nor/spi1.1/capabilities
> Supported read modes by the flash
>  1S-1S-1S
>   opcode        0x03
>   mode cycles   0
>   dummy cycles  0
>  1S-1S-1S (fast read)
>   opcode        0x0b
>   mode cycles   0
>   dummy cycles  8
> 
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode        0x0
> 
> root# cat /sys/kernel/debug/spi-nor/spi1.1/params
> name            at25sf321
> id              1f 87 01
> size            4.00 MiB
> write size      1
> page size       256
> address nbytes  3
> flags           HAS_16BIT_SR
> 
> opcodes
>  read           0x0b
>   dummy cycles  8
>  erase          0x20
>  program        0x02
>  8D extension   none
> 
> protocols
>  read           1S-1S-1S
>  write          1S-1S-1S
>  register       1S-1S-1S
> 
> erase commands
>  20 (4.00 KiB) [0]
>  d8 (64.0 KiB) [1]
>  c7 (4.00 MiB)
> 
> sector map
>  region (in hex)   | erase mask | flags
>  ------------------+------------+----------
>  00000000-003fffff |     [01  ] |
> ---
> Changes in v2:
> - Change from at25sf321b to at25sf321
> - Link to v1: https://lore.kernel.org/r/20241018-spi-nor-v1-1-d725bfb701ec@gmail.com
> ---
>  drivers/mtd/spi-nor/atmel.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 45d1153a04a07b7c61f46b117311b24ab695038f..8285a16b253d54ae8c4a5302850244d2248aa755 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -238,6 +238,11 @@ static const struct flash_info atmel_nor_parts[] = {
>  		.flags = SPI_NOR_HAS_LOCK,
>  		.no_sfdp_flags = SECT_4K,
>  		.fixups = &at25fs_nor_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x87, 0x01),
> +		.name = "at25sf321",
> +		.size = SZ_4M,
> +		.no_sfdp_flags = SECT_4K,

it seems this flash supports dual and quad reads. Do you care to
add/test these modes?

you'll need mtd-utils

>  	},
>  };
>  
> 
> ---
> base-commit: 200289db261f0c8131a5756133e9d30966289c3b
> change-id: 20241018-spi-nor-dc29698dea0f
> 
> Best regards,

