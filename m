Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A283C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM+Vm1sxzlwErSkujNdEr6GDSE2t0p0EBV3tSTtUlbs=; b=pCIMHZ94j9T5UWJbd2lAlMWyPj
	TLELbyuigdsW7Wvkn/aFrMHNK0uer/7UYcT6KkUlnQRZdH04ncIyRl0GOt/yJIYBUd0xEPqrKXv3w
	rx+1SC5ShPX0ytCliNwApgXl/Ijx3o4e4IcDpinu0BXVHVXJmIA5ruP5mAj+CvPiiUUORl2vqVAFV
	0m/JgHv//xqhHcsm25cEgbJ5OeMWNr8rOSH4E39ZpDlUGb1TG60xniYEv4AA3vXIezSCLGOGbBEY3
	/kpQLm+OjItQWeZzPOyX5SXid7m4N/2qcBzyR3npKF+cMW6BC4jqXQaCYbDnFBFs3Tql/lGu8bozD
	HQogC7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLPgE-000000044bg-33E0;
	Sat, 31 May 2025 17:07:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLPe5-000000044D8-0F62
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 17:05:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2350fc2591dso19423385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748711120; x=1749315920; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lM+Vm1sxzlwErSkujNdEr6GDSE2t0p0EBV3tSTtUlbs=;
        b=GWCl7QtUEkvHTbXSbWcIyJnMVVS9G8wmgOOqvsFa/Sw3UXhlWzjSfL8glXC4dhi2BO
         9JVTNIY8VBTRWBtUKlO3/eb0kcUksHwn8kuUrUBkKzFQLwe/kyMxR1wxZP8KZiJ7MqbS
         Z3ZkMh45w0bq1SWtHkTfABs19Pt30YbbUxQsnokw/4VfaOfTMnf/0eptcGqhNXaW3Hnf
         Ou+cRX7OHSGzMAD/TtLZYaHnym/WAVqooliym1h6mGUwSYKKV9z9pJ+fu21LH1930X30
         NVxaTSHVbaQ9K2TYfCkt3TkgHJRjDweXow7XntalGoc0N0Jm2FRU0iQKfauC0RU1wHdX
         vu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748711120; x=1749315920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lM+Vm1sxzlwErSkujNdEr6GDSE2t0p0EBV3tSTtUlbs=;
        b=F4WEhmt21xnwpq++iKCWxnyVAyozs7nMJ0+IEfKRITTi+JEouQZF6u4qxaFSAxbA6X
         CvMfbyXGDrduSDLXDTp0b7FbX7QLQi6wgPHKJamdGMr5xXtFZgg/SPAlIPoWrNogwoXb
         EEL9hC2MQ3StRK3qsjg+dQiTjN/ehTBqil71BOMqXHUO9ZDD6hwwAg8AW9HbcMY9KnIE
         +DYC8ZgLpvOm3onwnlqe+pZytUf8GC+N7pkxTPxVAzuz20Jn5djLGw/4XnfsE+KX7rAn
         Bf5vqsMTebJkNa5EAWjLjOWKH9rTJ5WiMQpQVVl8iySB3fSFov5r0q+ETO+5EgLeAtgX
         A6VA==
X-Forwarded-Encrypted: i=1; AJvYcCVzxEYQBH6YvEQVzYCRh2lEmDByALZjFkwTPxXkF17TnDO1a7dQDtIn/mPLpbiRwG/sW0LCWj6N0Nya3jHOxsQr@lists.infradead.org
X-Gm-Message-State: AOJu0YxQd6OWBp84W3IOaC7t01mEu2OY7TASFW73mDnt7ilCkWqnuOY4
	/6Y44L4UFaI8AoGqwWqH/JT8Y51DKUfnI77K7NWjvGB3vhPtmARQb7fm26SSAK39jHHk8Zxt7PF
	oLzI=
X-Gm-Gg: ASbGncsIMPXzUaurG3aNUiIdgeaOdnFALo4G3OgPsiQA/nKnHjzIj29lwUTs2rxWDJG
	FmwwgjeYjlUlCaK/o5cx7oSNqJsBCUI5sIsOn/2NMyDe4vlfQqkJkHj8d8O6HaL9icFpLUxNyyr
	CjGJjlcuHSc0qTgy48KDYbGKVIjwytfbdaHhlqZ+OsSeYAInfJbAVHy9wdc6rVyZ53kHLs/Kq//
	Gslf9mCbvV+sJAR1kd5xZAixqpRhEuRuiyP7TE3H6lpyaLbiAmyWgsAa56fxrqwlvXB4yidUGTB
	Nj7RFW/1KrNV7Qg4qcJlM6eAFbsg0zFV7+bzMZbJlyEVn7WhqrH97w5BBQQyZA==
X-Google-Smtp-Source: AGHT+IFdEaiMsq9p/fY62ZuESsu9h6XTS78Q7H6VtGsbnxe3keQhoidzBkD/oQVVVD2Dr/Suvz582Q==
X-Received: by 2002:a17:902:e74f:b0:234:9fe1:8fc6 with SMTP id d9443c01a7336-234f6a08ab9mr185502615ad.18.1748711119638;
        Sat, 31 May 2025 10:05:19 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd38e0sm44835625ad.138.2025.05.31.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:05:19 -0700 (PDT)
Date: Sat, 31 May 2025 22:35:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: shao.mingyin@zte.com.cn
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, michal.simek@amd.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn, 
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, xie.ludan@zte.com.cn
Subject: Re: [PATCH] PCI: xilinx-xdma: Use =?utf-8?Q?devm=5Fplatform=5Fior?=
 =?utf-8?B?ZW1hcF9yZXNvdXJjZV9ieW5hbWXCoMKg?=
Message-ID: <i4qf2oycket7gkvyd3tfdzub32xlx27oydcporfb6thc4yosbq@grgbbjgymvgw>
References: <20250403154654546Uoj1gN_pronbxhSLPEIUn@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403154654546Uoj1gN_pronbxhSLPEIUn@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_100521_113867_46FD7595 
X-CRM114-Status: GOOD (  16.23  )
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

On Thu, Apr 03, 2025 at 03:46:54PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Xie Ludan <xie.ludan@zte.com.cn>
> 
> Introduce devm_platform_ioremap_resource_byname() to simplify
> resource retrieval and mapping.This new function consolidates
> platform_get_resource_byname() and devm_ioremap_resource() into a single
> call, improving code readability and reducing API call overhead.
> 
> Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/pci/controller/pcie-xilinx-dma-pl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> index dd117f07fc95..238deec3b948 100644
> --- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
> +++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> @@ -753,8 +753,7 @@ static int xilinx_pl_dma_pcie_parse_dt(struct pl_dma_pcie *port,
> 
>  	if (port->variant->version == QDMA) {
>  		port->cfg_base = port->cfg->win;
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "breg");
> -		port->reg_base = devm_ioremap_resource(dev, res);
> +		port->reg_base = devm_platform_ioremap_resource_byname(pdev, "breg");

This patch is entirely wrong as 'res' is used below. Please do not send buggy
cleanup patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

