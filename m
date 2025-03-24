Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77795C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFIRmNQe7n7uEi96DoOu2jHTdAOyT40YGGUa5QoKur8=; b=D3ausNthtxsjHfxzeZvKFBT5Zu
	OpJcaESsXo3RP4ZpjqhM4ahiUOsCCBlOpa7wgGOeN/7GWVAk5n4nSTQPmpqaELR2mDyNZZLWEjmc8
	a/BPJJQnzOvQ3Luyc1yeRoP4gZvFRmnbJUqScsEoHs7Khk0uGQuoiblkQv6SSleqcGHjYL+lRZaT8
	DbJXJvBbnE+p0w+L1B3VqDv4rKQPi1Gns//FOcXwIrkl2fnbAhJa4MCRn1B+hQGfVqIGhGWEt+Qwf
	2ssrFfbSyqABK2Uv++IsWju5lqSvaj4h8P5squpJ0epVVaakCMhC9YFRyfX7gSQG2lsb0x7+hBEO0
	AiH5nPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcbY-00000002V10-1QPl;
	Mon, 24 Mar 2025 07:52:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcZG-00000002UkI-2wNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:49:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2279915e06eso19829335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802593; x=1743407393; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NFIRmNQe7n7uEi96DoOu2jHTdAOyT40YGGUa5QoKur8=;
        b=R5ZncKF81cKPnOR+b+TJSh2fDIkWFBRWY53S+NBgsqElePIjaJe3DJ/PLNBy1BSK2o
         aoCpZ52FeGhXcz66rGuTx9R7tpNIfb3cMtG9QTy1u7pFSle29O/mqKcMZGyD3hP1vNH9
         KfKMJK+4mpzE00F4jy8h5pUqg2pC9Blua+yryPs7r3M1oI0OuTnj+J2O02uAKNORTuol
         RPK58et9kpJOuTpDJSK/57huzkmA0FYKseAJiCUjwDTce8c0vjV6mZNHny+lcWxn+as1
         BNhB2Yd5YHVLRHq0GARk3KlBah2S4GmdDgflobWnJ86bVR6qCfkxwGfu9BMkpyNxKfK5
         ESUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802593; x=1743407393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFIRmNQe7n7uEi96DoOu2jHTdAOyT40YGGUa5QoKur8=;
        b=wT1WewiLk/YTniaFw22kQq21Vg6xUKKqV7Hi+wQH4htQZKpq6kRYNgbBB2e6g7IrrB
         E1UUTZdy5HRLv9Z1RQtHpm6Dggh2+rQmxU0ucWFjRHLZUMsuBDPPB/ti6aC92UW3SZd1
         FvFCo6RI2D6fza6fVah8BoWnuOYqCBiB1qZKNN/E+q9dQw+qh7m/zATGwrPwfEdnutHD
         8TjBfqi/utEQnBv3MjTPbM8H4k0VeUzaX6rGJJ3oUG+DB2gj36r1mQvuUnNwa/ckVQS8
         pG9Kw2MTUDpwLvH3pnpuwKdDMwmxY9xSQ/5Y/1BShvK/15A9mrQJKqC10fBxnSXbq/z2
         OyJA==
X-Forwarded-Encrypted: i=1; AJvYcCUqRxGb1h1vZ0bUEkNZV4G8rBZC6y/aVrJIz34E3HxWKvbglseI0RrTPQcIfHETYZLLRkNC7yhgmB8le0M/8snp@lists.infradead.org
X-Gm-Message-State: AOJu0YyN9HrbdvRT0a84zj4VdgeSyCrNr817Al9Jxm6jIN1EMOhVeJw4
	UL/fjUTKpz14Kyom/S9PJAj0kOuQgqjPx6dOOCLTD3xxONjRObx5evo5k8Ne3Q==
X-Gm-Gg: ASbGncuD2wlKv8Wm4Ji8uXO4TqyYgZjBEsyprMv3OefrYZzztHBYsejhMGOdVGr6/JU
	56rrY7MYBPwJKfYGD+cjy4gbbARFwDdC666wxFS0vsR3pCYJfVQJjwTI1ERZGyS4KdOiHgNTamD
	1IMrwEBhOTfwiLaF20bKX7AlraYYOCzfu3oLQiVp2u76rVoCCTBU077KQeRn1mfibJzMLs0dg/A
	X/sfk7DDOuKdR8Oa8ZCrT2bgAHv/zOUk4AUAjYGzRPYY0+XH3nv+ruJeHTqm1hmCgSMtoK87p06
	HKa8DaYy8Pg1sdluKzXbrlfMEN7ekhoYi5oYCzq1lYwDe8s368UtNTCP
X-Google-Smtp-Source: AGHT+IFjqUyRiTKVWJF50KZXuILNEfC9bh/Fh8RLdQLup8g1ZfgW4ZYU2YulBex/PqxtrdUJC77Ijg==
X-Received: by 2002:a05:6a00:2295:b0:730:9502:d564 with SMTP id d2e1a72fcca58-739059a64c5mr17595506b3a.14.1742802593070;
        Mon, 24 Mar 2025 00:49:53 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611bd23sm7430118b3a.96.2025.03.24.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:49:51 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:19:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pcie-xilinx: Support reset GPIO and wait for link-up
 status
Message-ID: <vazbdawfo4jnct4rdokknxwvknespcf33jzrmobsnecbxnrbjn@kbvxvhrow4fn>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c4ab15e9-561e-402d-bf39-9e852485e4fa@emailsignatures365.codetwo.com>
 <20250314145933.27902-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314145933.27902-1-mike.looijmans@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_004954_744571_CCD40687 
X-CRM114-Status: GOOD (  31.01  )
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

On Fri, Mar 14, 2025 at 03:59:02PM +0100, Mike Looijmans wrote:
> Support providing the PERST reset signal through a devicetree binding.

Where is the bindings change?

> Thus the system no longer relies on external components to perform the
> bus reset.
> 

There is a similar series for the CPM controller:
https://lore.kernel.org/linux-pci/20250318092648.2298280-1-sai.krishna.musham@amd.com/

Please take a look for reference.

> When the driver loads, the transceiver may still be in the state of
> setting up a link. Wait for that to complete before continuing. This
> fixes that the PCIe core does not work when loading the PL bitstream
> from userspace. There's only milliseconds between the FPGA boot and the
> core initializing in that case, and the link won't be up yet. The design
> works when the FPGA was programmed in the bootloader, as that will give
> the system hundreds of milliseconds to boot.
> 
> As the PCIe spec mentions about 120 ms time to establish a link, we'll
> allow up to 200ms before giving up.
> 

This should be a separate change/patch.

> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/pci/controller/pcie-xilinx.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
> index 0b534f73a942..cd09deba0ddc 100644
> --- a/drivers/pci/controller/pcie-xilinx.c
> +++ b/drivers/pci/controller/pcie-xilinx.c
> @@ -15,8 +15,10 @@
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/iopoll.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_irq.h>
> @@ -126,6 +128,14 @@ static inline bool xilinx_pcie_link_up(struct xilinx_pcie *pcie)
>  		XILINX_PCIE_REG_PSCR_LNKUP) ? 1 : 0;
>  }
>  
> +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
> +{
> +	u32 val;
> +
> +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
> +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2000, 200000);
> +}
> +
>  /**
>   * xilinx_pcie_clear_err_interrupts - Clear Error Interrupts
>   * @pcie: PCIe port information
> @@ -492,8 +502,21 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_pcie *pcie)
>  static void xilinx_pcie_init_port(struct xilinx_pcie *pcie)
>  {
>  	struct device *dev = pcie->dev;
> +	struct gpio_desc *perst_gpio;
> +
> +	perst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(perst_gpio)) {
> +		dev_err(dev, "gpio request failed: %d\n", PTR_ERR(perst_gpio));
> +		perst_gpio = NULL;

No. If the GPIO is defined in DT and there is a problem in acquiring it, you
should return the error.

> +	}
> +
> +	if (perst_gpio) {

This check is not needed as gpiod_set_value_cansleep() can accept NULL.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

