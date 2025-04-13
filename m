Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F76C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=; b=LXbZko6HpkcWIdMOtJ9gpitGyD
	PFm1rC6T9qsvWo+ng/tu3zYziHRP0BI/VOPMTfaKEkYhKV5HFkHuAh0y5JeFtc0LehpspSA8KMwFY
	PDPpw+BWZezeIEXByP0l+9oeXAHa05HgRDoR1FGmQc4UgjLWQoCKgOYR/RWO6nSvznGPgdadqFl+J
	4013zyv68Rfq4wEIPZKovM+EGyUgeZ9WIFLj/gJCuieRwzOlOiARXCRC/RYv1An6ystkivqkdvNm3
	Eh4udkbQsu4vf6j94bmcIWcer9IfyfHFOgtLM4EDsCUdhzEXt2kICB+SVpU0i49kl5tBtL61xCecQ
	pjDzkXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40su-0000000HQMG-3MrC;
	Sun, 13 Apr 2025 17:12:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40qF-0000000HQ0A-1Sh9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:10:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2260c91576aso28997855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564198; x=1745168998; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=;
        b=sJbs7+hrMhtlBiw7/oV1lAg0GS2fib2oWfCry3KvqBjCfx8qWItarVOHdJlKJQLeW9
         q2y+vQmQbfdaSJEeZ58HdzF5G4/mXbhvTZQULVPKR/mGDajakojNZ4kasBIstpG4nTTh
         /iGpiZrYhrJLx66bfEKqQvtqtiCr16OGonjnjFUBjOtX+0hWh5CLySTSINDTjKjB+vEL
         9jxwKYJcdKNdqVwCDZvla/TMB9FKeI5Kk0sQT+XsebodQ2/FH+B/UoWrw0xSAy+zFkbS
         8h+6LdsKqtpg/WifQuJcUzhTqEnuB4RFebueI0wkGrVdHaT2HhgdX+ui9PnsTjd4p+2N
         QvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564198; x=1745168998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=;
        b=NpeAa54V3W6MGo4+18J9fh1kyqvw/5iOGT5mKTEYu0QvDmCPQBiUSfer6E71+ICi5N
         GDNQbR87O9CB3NoLdLKAketv9Ffykqf/C5+EKbgyPz1UHR7tp2SkREBUpzobrqJckMyG
         I2a4oOUo1O6rTOlyyeaYtpa23Ig2Ds/liYHW2sff4Qqg64DXF2AIPl6BdxxjuE3mdQBf
         /H62gAIHnJZmVlnpq6KaTg/numoc+jVUn9hUCKS3eUBpZdPe73spHrGDaW3qoqZav7Cm
         5Syx/qSaK+rSrODGQAnwuxO66teVgNuHRyHq5/D86/RV//vOTFBmVjk99c7zKUzN3oPc
         xVDg==
X-Gm-Message-State: AOJu0YxAyeMHb73uz6MGAE7bcaBAv+1vWoIa8rGv37NrT5vZBS4z1uH7
	iA+Fj2TzDhOLy6zXCms7Lu6jqTDYKXeYDyM4aFShi6sdU0LLdahDH572vSPOPw==
X-Gm-Gg: ASbGncv7DSF/l11ksefMGpQBEHPSv/n6HDsgsQNVPaqmraQc9pXthYoFSmvuG7Wm6B8
	yuW/C+S7DjI6Gi47b5FY2XAvElYjYFNpZNZb0+/zC0pJQasAjIGYfxYBIFU8K7ONMBmjZ0PBveC
	7oE7aII2pMifIogxicvMCqYiMnvbPnSWcxe9yrJ4mZmQEoOMr26jGNg8WyBwZi3c4i4beVOusSL
	hjrvqxoTaglvIcg3TetUOvFXo9okoLVbdiAeRznpGM68RXEMmYKMSQvd6FdFpTCCkE9HOAOCCos
	f8ToOWrXqTUyq7H5RU8JIECV32VPH10u61pWI/g2tsn4NqA4y6ka
X-Google-Smtp-Source: AGHT+IEM5JXPlHa/46KPcgwjfAGRbntfwPEeRwa0pOWka95ljamo2KjNfPBab6Whg2HZjCAf5af8bg==
X-Received: by 2002:a17:902:f650:b0:223:37ec:63d3 with SMTP id d9443c01a7336-22bea4adeecmr130822495ad.18.1744564198505;
        Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c40sm84845325ad.127.2025.04.13.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:39:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 07/13] PCI: apple: Move away from INTMSK{SET,CLR} for
 INTx and private interrupts
Message-ID: <sbudn32sbw6d3z7n2yomlzdsbtumckw4o576zfe5nlvwpt22j4@hf2zpld7tvcb>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-8-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_100959_401161_24F05809 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, Apr 01, 2025 at 10:17:07AM +0100, Marc Zyngier wrote:
> T602x seems to have dropped the rather useful SET/CLR accessors
> to the masking register.
> 
> Instead, let's use the mask register directly, and wrap it with
> a brand new spinlock. No, this isn't moving in the right direction.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6d3aa186d9c5f..6b04bf0b41dcc 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -142,6 +142,7 @@ struct apple_pcie {
>  };
>  
>  struct apple_pcie_port {
> +	raw_spinlock_t		lock;
>  	struct apple_pcie	*pcie;
>  	struct device_node	*np;
>  	void __iomem		*base;
> @@ -261,14 +262,16 @@ static void apple_port_irq_mask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKSET);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_set(BIT(data->hwirq), port->base + PORT_INTMSK);
>  }
>  
>  static void apple_port_irq_unmask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKCLR);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_clear(BIT(data->hwirq), port->base + PORT_INTMSK);
>  }
>  
>  static bool hwirq_is_intx(unsigned int hwirq)
> @@ -387,7 +390,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
>  		return -ENOMEM;
>  
>  	/* Disable all interrupts */
> -	writel_relaxed(~0, port->base + PORT_INTMSKSET);
> +	writel_relaxed(~0, port->base + PORT_INTMSK);
>  	writel_relaxed(~0, port->base + PORT_INTSTAT);
>  
>  	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
> @@ -537,6 +540,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	port->pcie = pcie;
>  	port->np = np;
>  
> +	raw_spin_lock_init(&port->lock);
> +
>  	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
>  	if (IS_ERR(port->base))
>  		return PTR_ERR(port->base);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

