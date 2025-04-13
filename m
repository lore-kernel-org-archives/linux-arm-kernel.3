Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557FC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvo1AqLyr+P74wryzNC2MhPCbinbOghs0H5a0GVjRKI=; b=N3ax7ERwRP5xd+pJ+5RTnb9n4h
	dbf17VCxT+yXD/sQYPH9zBeGi7G1ZviD+jfXv1pT6/UfNlC4vrx0RSllb+MeR5U8U9JpG2c361CrE
	QVgMRACf/8UKPeP7zWLdkUi7AdqouDX77R7mlAuST3qWIDXyqz7NSvgXXWqm6HCzoXhCAlOeVTZnh
	JnyPng4fCgH8GK44zKLdQLztZKeDp76oyCTKtCsdew/MKAl7e2FWar1XCe40hT9WIdw+h6uCe7wbO
	r2YET3hNqAh4ej3/rkqz8d5Jjjd4qsxJQ8kOkBPHH3ztXCgniAX9Hr5SIHtgRfYrOceomTlS4QTbf
	fA/EUijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u411i-0000000HRFX-3Zj9;
	Sun, 13 Apr 2025 17:21:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40xl-0000000HQun-0q8t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:17:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso293638b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564664; x=1745169464; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tvo1AqLyr+P74wryzNC2MhPCbinbOghs0H5a0GVjRKI=;
        b=Yvi6/cA2x17r/4scUCASjeUEG7/2CqiMTnew/7VvHSVNzDmyMFHn0biqzqPirDCpn9
         BlzRfsLIX0XICmErVy8scSfVYIvaKGiclRvodh4ADYphzlMETsw87T0ZOnC7e85Mk6ZO
         A7magVITYgzg7DUAwPjp+8YJfksce1Sw9D0qJvOZw5a+u7ZGBNyLAe2DxJ897S+stSkA
         PS0oRYqHwoZqPWnSc5wxP4nALtimDcYBCLbjaMyOQHvlxLYJ/ykFN4bfBAtTuc5aI5Ql
         CF80R6wK6jFvb0udN9Vb1MAjFwsYR3D4NA3PAkXtvxbZLQgane+5VUqDMqFHU5CY1j/m
         yoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564664; x=1745169464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvo1AqLyr+P74wryzNC2MhPCbinbOghs0H5a0GVjRKI=;
        b=Fqb3cT7+lliNVAFOLM618X4+xvwyfnCO6ZXPoeTiW5AB5U7JKqb8uIaw381KDT5adC
         kDWmgE17cyt9vnBAS3Z77rpmXZK+3Eqm4r0K60jnmi76w25wnuOqnneWtp8coayfkj3o
         Keuy8FPdMs/80RVCyURKOXIpX36ceuv1CA0R0JEiNolDVcDGCqhLLAB+1+JpdoyVanLp
         C3zti8mZd/o+wl5O5eRdnPQCmYwgyg9VWCV/cEtogEjS/cMqi5hV5OBVBN5gnstUYoYA
         SCV2wEVPROzdkCQFb2SWDSxkLt3jlMOOdOyNWt7M0sQ0nzkbGVw+fe5UJWhXBZWmVsO1
         zMMw==
X-Gm-Message-State: AOJu0YxzFMU8qyzWBs/Rr8dQWRNUECh7UmjFdpORdGychsbattS6K3L1
	rdO/DDg01CwDuYg+S7Rx2W0ATfvjoWfaPSZj0jrKbdZNFRh0j4scbRm1N/3yKQ==
X-Gm-Gg: ASbGncuI3Ek4m6aB1F3ds76t8fCcNTa4pOBJz7xOhgS5/A8/UqpQA1Rx2YlJO19PnTa
	KGMyrYRMjrhECy/lG/OzZ7rmhRBSQKcTa++M6DEgxKA36I12q3XjLu6NX4Mx7xzTXDpvJsm/VkB
	xiuU2K4IC8ZFMzLcxqKjq403xt8i8LJoEK18VZQ5ZScdkZmo6Z88pSaFSh70MUd7tLf8VnOaoP0
	ReO0b0AwouwFKWCdeGB1Dkaorh1TRdRQXX93/dnPMA5rw5/5i3w+N8tkM7KxpptEnBq8L0wOrO+
	AozNIU81YuJUdWH8VVT0QJUxvEa6TWzphFegZrIU/0Vc9P4wJ/JJZ8IAEPZ+Dgg=
X-Google-Smtp-Source: AGHT+IGEF9tHk5qwg4OxLxK6w9YLSpLNHAhgJxvCUsO1Pirx8TGENW/hAM/zxwUCHFP7Xw61cGiCug==
X-Received: by 2002:a05:6a20:9f07:b0:1f5:a577:dd1b with SMTP id adf61e73a8af0-2017978f12cmr13438249637.1.1744564664334;
        Sun, 13 Apr 2025 10:17:44 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a325sm6721497a12.60.2025.04.13.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:17:43 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:47:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 11/13] PCI: apple: Use gpiod_set_value_cansleep in
 probe flow
Message-ID: <gljevi2izxszizvwm4yzpbzraxhjf47vm2lg7jrmm6d3ae62xu@cbqtbvw7miah>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-12-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-12-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_101745_238796_0BF8E5F5 
X-CRM114-Status: GOOD (  18.04  )
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

On Tue, Apr 01, 2025 at 10:17:11AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> We're allowed to sleep here, so tell the GPIO core by using
> gpiod_set_value_cansleep instead of gpiod_set_value.
> 
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index c00ec0781fabc..505adf64bd66d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -562,7 +562,7 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	rmw_set(PORT_APPCLK_EN, port->base + PORT_APPCLK);
>  
>  	/* Assert PERST# before setting up the clock */
> -	gpiod_set_value(reset, 1);
> +	gpiod_set_value_cansleep(reset, 1);
>  
>  	ret = apple_pcie_setup_refclk(pcie, port);
>  	if (ret < 0)
> @@ -573,7 +573,7 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  
>  	/* Deassert PERST# */
>  	rmw_set(PORT_PERST_OFF, port->base + PORT_PERST);
> -	gpiod_set_value(reset, 0);
> +	gpiod_set_value_cansleep(reset, 0);
>  
>  	/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
>  	msleep(100);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

