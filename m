Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E1ED41C23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8zv/+EtvPDl4iLKTrR8mENbJ+nooaSf7+TWV4HSKjU=; b=rGs6ZcEUqXcwINlHbQXrvPMk12
	tYBKYuFN80rgW509Ecl/upy3XwlJXfWT63AJwS8KddQSxAxCF3y7ZnQWASipRFoFEZJSzfW7zxaFq
	YYeIKJpuU/ZHvzLsXTCNDg7b6CZbiMPSuJD/8+W3GidIBcMZWMM2jRTDNW/p3mP8VwsmnS8voRAOj
	n/lM54R7dJdBOD5pGCPGbYDXRiEp4/QDNu4f7XjLcfxlOdjiYmBTYPIfvV4cGCpf1/vw6QBLoKqB3
	J2nMEryRRjuh6NrqQtaiysYWQwSVUNQMrTsco2g8XQqYbXN+yrLQlAagkYvq3ddLLrQCH34uIXFbl
	817dksyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9hM-00000006FVY-0XGf;
	Wed, 13 Nov 2024 09:30:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9eu-00000006F3n-0sYb;
	Wed, 13 Nov 2024 09:27:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539eb97f26aso6514960e87.2;
        Wed, 13 Nov 2024 01:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731490050; x=1732094850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w8zv/+EtvPDl4iLKTrR8mENbJ+nooaSf7+TWV4HSKjU=;
        b=IskDvYtwyNuM69uEOUGH/V1vB45rhJ60HptymJrZadxfRL9Quc0AL6/xVeQ9i4+p3V
         UQvlcVtuoxLqMKw2CA7zg2VzK7Yg7MwQoPxc5ngypI02WQmSWMLHxe31SVKcoKdSPzk3
         sX4WfhTczaRo6AhqVBAsRd2RsG2mtELervI+fpYs1eLM35c8bZ0EgIveAQ/8UIwi7Yhx
         LRgzZME8jy1/4bpvnektcHTZS7U9Yv+7ihEHZ0GZ/LNfgzd/ZSjpwCFpisgtPs2csycU
         +2HCepoHWqiANBJHsWslWgT2oRmqAU9mGns2LLQeIDcBOIgk8nEPKZ3cad5NOygkZNDs
         W+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731490050; x=1732094850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8zv/+EtvPDl4iLKTrR8mENbJ+nooaSf7+TWV4HSKjU=;
        b=gKVHK91KM0LUuKPYmgSf2+jFJI6475zH/b44/75EpCtYD1kGnDDlZz0Rtt9gmK+7sf
         h2DgXlvCBTIIMH/p539vFJCby4bH3F1VT9H1QFUJXTa5GGcfBCpx43LB9DmKtpPQCNvA
         UyL7QHLxno6Kb5V11wb0XkmZgwFLmga1oqMfBt19qv8a4aC9QrdkWSSj/rzqyLGXTmjh
         V3d6CEAGn7hcl/bZfWoy6OxpVdJfGltqM3e7nGv0eaPPgMuPMK3EKRPHXawid6Ugi0Za
         nmFuptrQvE8AnLksFOTtgIg+dt0V9+Q+x/sJHdMyR4vcRzwnep/if1vZGWT0rPHP8U8q
         uQdg==
X-Forwarded-Encrypted: i=1; AJvYcCWfrcWYXy6exHvB2KzvQBh+RprKzbplALiPmaQNXG6w2k0yxZoazOX3M7CWii8JxQY3diShB5g1YbEOIJm7K/A=@lists.infradead.org, AJvYcCXnsAzsWYbXwsdU/VzwQtZK2L1ykRGZEZZHO9XPw/Lii2V5qkLnsCLX0/Jgs4KJAHxxx8N9Vn4g6WU4taHQpvRB@lists.infradead.org
X-Gm-Message-State: AOJu0YwFzijcrbPoMSPg8lPIT7FA5+jh7UmuH+mO2eQHCDpqxpfs9Wco
	1aTGenNxiA8SdOAkAstrWsP6j491fIaqdsjBE7HMirdg1XbPbLjF
X-Google-Smtp-Source: AGHT+IH4kaf5AxpGoCViV0kDdMWdOuK9r53gscvJr87yYf1RYZoMo9AThmQkuPHpTA8VhgJ/CpG7gg==
X-Received: by 2002:a05:6512:3d90:b0:539:e6bf:ca97 with SMTP id 2adb3069b0e04-53d9a411b22mr3111468e87.32.1731490049525;
        Wed, 13 Nov 2024 01:27:29 -0800 (PST)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9d65sm2162105e87.216.2024.11.13.01.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 01:27:27 -0800 (PST)
Message-ID: <e086b522-1406-4bd0-9f47-5a5c16905495@gmail.com>
Date: Wed, 13 Nov 2024 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] PCI: mediatek-gen3: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>,
 angelogioacchino.delregno@collabora.com, kw@linux.com
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_012732_288975_8122C87A 
X-CRM114-Status: GOOD (  13.62  )
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



On 11/11/2024 02:09, Yang Li wrote:
> This patch removes an redundant semicolon.
> 
> ./drivers/pci/controller/pcie-mediatek-gen3.c:414:2-3: Unneeded
> semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11789
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f333afb92a21..be52e3a123ab 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -411,7 +411,7 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   		if (pcie->num_lanes > 1)
>   			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
>   					  GENMASK(fls(pcie->num_lanes >> 2), 0));
> -	};
> +	}
>   	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>   
>   	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */


