Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C810C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuhVsWURTGQqLbCa+ZsvE6k2JhaWqwZQfokIeNuPVSA=; b=kiwDlUgpi6+6oe1GqL7gidxlEk
	0Ujcev4AqVCmVxKZbLJiWEDFLpZ57Fputj2H4c68dGXDHF9aroUrgdj8IJsqI3e8Zkrw8b70T2LN/
	GgXxSF47axSck/MxgYZBL33QQAkT6FItsFlwv6wbVR5Mqk+RJrhdL0mobXRz14f4GYylIuRB+vK6B
	WjIR6yAoEDt58KvIJ6McFG+r4n9XvLGDdLqElQMp/7bSs/YHXSgLhHB/jd1UUB59dJ2yVDkzfbXBX
	fbK7hpE/8ZqrUb9tsomdqUelJLd9LbzThlt8nBNz8DN3ht8mhKIOIl5Wryk5GPqTXLs0w93PhnZLb
	Sl5+Zc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsiD-00000005PRi-3T80;
	Wed, 02 Apr 2025 07:40:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsgR-00000005PAr-2HfM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:38:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3011737dda0so8163379a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743579526; x=1744184326; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuhVsWURTGQqLbCa+ZsvE6k2JhaWqwZQfokIeNuPVSA=;
        b=sRAsu3f9W1Nd+zQs9Ri0cIg4cOUKpoO1un8saVKBvWyVsJ2FR6zawMLhrYUGPci2Ni
         XVhjMcTM8wHFr+h+MTOz7pyZkT3WunCFByl1zR2tjrS/e8RWTqnVy+UfBgWjOVG1GoPE
         M1LqsF5ZxsYweP5oGLxb7WnqZc5qRukjdw0z6XpRW8DJuinFHKhSTJbORFCKHRkEjg0h
         /+m4EfpC1zL9Yp6QujnDSHDLguY1BQKKfy+psNKWT8agVPEV1U5PyBwt5eAN3r5im69K
         AxoB+DT81W4FTzXuvYDm+y07Tf8UoZ2bq2XqLBTjWVR/jHA4f0uZ4Of5H7F8PGSzDl7y
         EDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579526; x=1744184326;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vuhVsWURTGQqLbCa+ZsvE6k2JhaWqwZQfokIeNuPVSA=;
        b=PiOUHRFAJHGPl91eL71fzFjGJ5Nyz0Ozy1VheopcLaYm0PD9+Tp7HblOkDbYG1rlxg
         IUMd75jcMfowj6u8VJ+Egd/QkMDdidkBRLxxWzsu6e10SCvDoiEEqB+fPX6Kln67lSae
         EAEZkp1YWT8ZoivmCNfj2aN8gqfM/3YekLWMxR8nuQ5BsS3Zd4Cv0in1vgfVHNg8Ih1o
         GAsPYkacU08yHPQkDtNeASMHilQ9MXJW9R7e9k9ARQbyJMX2oCl9hYzFZ6X7gJ0ukxxp
         QY8b+vPIfRmu0qCO1kvAMmiUhpqtS3Tn64kcSCYOHPk+kwW8+7Tq5r0Tk50MixdE+8sm
         /cmA==
X-Forwarded-Encrypted: i=1; AJvYcCV8iGllZvL1I/ZA8XgQ4Fj9kMuB8mc1RCDH3P/PE3ve2fJhI3lmyaO3QmBSaolJmxiO4aCvJe2LeBSJo3GI1UzE@lists.infradead.org
X-Gm-Message-State: AOJu0YwmOAlQwO6ZP6+gHQQtOIUMCVSOcco1cJLH9VDGq/QMsE7l5xRd
	4M8Kt3JS2ztn/9GGiblb/vtxeoUCRaCKwCB8jbcNKpSpDfgaIXuvN9/1Jm2/xQ==
X-Gm-Gg: ASbGnctB5LdFHHZit45c/W2/4watM/bkoMQOn/62H8eEwRFoxa4wHGxIHTLftvR+rJi
	TRHRzWljcCPzQ7BkJMz8/MPBl7qjPZmpLU33retqWzv5xu5gXWSgX39CeE+ZZOFYxlIU5HlDMkv
	RcTRyIefluOKKUhouSYUG9FXEDvdUxDQTg0MNyW8jq31tSPCtHC/7hMwXKD/saGD4hgNnEUKZl8
	yyQAdbygcmZsOnVEyv81aNkuCxAwf2I3q2cWkdPmad2muEVUIO4kMGthauS7ypT+fcTQ90pMClV
	t+Q30lKhofvTOIeNNM3i6dPhk3+7NTk1+cZss1lFx336nCa9H+9HVQHl
X-Google-Smtp-Source: AGHT+IF/7JLOnTBt7sTuUCzKIzyp13ILW7ME93j7xy76GBcFDkBNPwoJUw6bHXzPuMt5qY2XMOErwg==
X-Received: by 2002:a17:90b:33cb:b0:2ff:5e4e:864 with SMTP id 98e67ed59e1d1-3053215db23mr23337578a91.25.1743579526389;
        Wed, 02 Apr 2025 00:38:46 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f83c9bcsm875695a91.17.2025.04.02.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:38:45 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:08:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pcie-xilinx: Support reset GPIO for PERST#
Message-ID: <mf376dulqqzvyqgdakeglc7ol4r2dmsr4hiafvdwve42qfkauj@vcyuf4k3fbmz>
References: <20250325071832.21229-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f2f40822-7953-4b0b-896f-3a325392c185@emailsignatures365.codetwo.com>
 <20250325071832.21229-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325071832.21229-3-mike.looijmans@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_003847_586829_EAA415DA 
X-CRM114-Status: GOOD (  21.30  )
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

On Tue, Mar 25, 2025 at 08:18:27AM +0100, Mike Looijmans wrote:
> Support providing the PERST# reset signal through a devicetree binding.
> Thus the system no longer relies on external components to perform the
> bus reset.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
> Changes in v2:
> Split into "reset GPIO" and "wait for link" patches
> Handle GPIO defer and/or errors
> 
>  drivers/pci/controller/pcie-xilinx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
> index 2e59b91f43e0..e191ab95d669 100644
> --- a/drivers/pci/controller/pcie-xilinx.c
> +++ b/drivers/pci/controller/pcie-xilinx.c
> @@ -18,6 +18,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
> +#include <linux/of_gpio.h>

Correct header is:

#include <linux/gpio/consumer.h>

>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_irq.h>
> @@ -577,11 +578,17 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct xilinx_pcie *pcie;
>  	struct pci_host_bridge *bridge;
> +	struct gpio_desc *perst_gpio;
>  	int err;
>  
>  	if (!dev->of_node)
>  		return -ENODEV;
>  
> +	perst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(perst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(perst_gpio),
> +				     "reset-gpios request failed\n");

'Failed to request reset GPIO'

> +
>  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
>  	if (!bridge)
>  		return -ENODEV;
> @@ -596,6 +603,13 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	if (perst_gpio) {
> +		usleep_range(10, 20); /* Assert the reset for ~10 us */

Delay should be PCIE_T_PVPERL_MS.

> +		gpiod_set_value_cansleep(perst_gpio, 0);
> +		/* Initial delay to provide endpoint time to restart */

s/restart/initialize

- Mani

-- 
மணிவண்ணன் சதாசிவம்

