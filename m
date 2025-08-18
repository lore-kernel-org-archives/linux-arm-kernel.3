Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E2ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsgBw0jCb6w00Tew/2kEPPc7DZ1CJpSeSzBPZVy1z1c=; b=d1cpRPkgBYBpqpOKZrTh9OFzZE
	HH923ZQXUhEKbcH3WrpLpW0bT5LU3WHgFwWNG8+zdAwyILHwmgto2kKkHs416O0W9gSc3v4rVcc+g
	inEmMLM7V6NOawSUm8Eu5FbTAX1WYQSoFuDbMD7McGJYHq9FJPiYwFWAaZKVZk9tidIa/EBelCW5R
	sTrEQJ2P5/JZ5h7WYgvZKHcD1jaIFy5r3VjJYKbGCt7taWfOWIpyN8pLHYIACApFFBv5g/1R8aOVg
	nTUiYtaThFCgZHw6COwgEwLUZyFtbgpRvHj2WGhqJXjrDUKAIPgm+9VShgy41lyHHyBcLCM2blqQg
	a8yEiSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07R-00000007avW-38Ko;
	Mon, 18 Aug 2025 13:41:49 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unxQS-00000007BKg-3nA9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 10:49:18 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71d608e34b4so31770097b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514155; x=1756118955; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsgBw0jCb6w00Tew/2kEPPc7DZ1CJpSeSzBPZVy1z1c=;
        b=o24JetiYvrsIZNpq6lqfoYkUBP8zkVODeLQGmT9inq4mOBvTPb+EVE8QFxVrF3hRRQ
         6JCzfB8vdUTvIgU1/8D5c7uwVR3DxXSHBSE77QhjOgTJC9zaXGlTGqFcvb0NPNg4RuJ2
         qWQRrGQVpZgOqsoQjXSw3CgLAPvBBYneFxRWIMzfoXX61LfXWUKYUnfp4lf3eRyasUAo
         nutlqp87+Tp9QjId1rXJwzzCp6BS4gN8MkVfuieDSLNsRGD97QdbEf1t2qZBZf1jPUnR
         QqHgcOxCjIDnNQsxmDcYkzlZb25S1r3Tmf4jbbH81V5/rEJuMxJ4V+AUs+lOj3xQ8UuW
         aojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514155; x=1756118955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsgBw0jCb6w00Tew/2kEPPc7DZ1CJpSeSzBPZVy1z1c=;
        b=b3QABWCvzMWk6BniuH1TEXEVq+IUF3xLiDKFy2g+/rmZef/PEPfvcRuQmfAYF5wja2
         L8dllPhF+cGefar1wW8Q7XndlaoIVzOC/UoQspCFcU7SYVsYizqM2q1ZxUisCsWgCRlW
         gn294eqAk3rJqbN+Nf1nSI5xJHQGHkJ+gOuD8u78J01PyyPRDwzvNYNBHPtzDE2z3PfT
         IjkpEAxbNVSxGaxy8zuPBWNzOCiQOtO7M69wW56gBiHTQjOD0dBRUPwXNkN4gYBWQO3Q
         H/+O9xH15iCwnvUmneV+1vIUQ/GE1ZasVKFQekAXpfJtjTl+yIblK1dGlGImJ8SRuHFV
         Jm1A==
X-Forwarded-Encrypted: i=1; AJvYcCXml+Xw1eblBBIi7FSHUcIshc0JddDbJDsp1sC0fU7SWDLvbFZEwdYvRz9RlPGJ3PPTBHxf34MDDawJSUf6HVDS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyot925u2JzkIaLT4xTMHgCoNbXfo8tFBrpKnOGoKRz/XVNUW8b
	Bgpv1jEfNOD04p2m+/M1WPB7CZ2qgk60kPvks4Qfx8F/qFCE89a8qeMrENBLxK5vZjuAqAbJdt6
	+hcDNA3orb9wFyL9wBuYvNwWm6B4hD/RWoAhLv7R82g==
X-Gm-Gg: ASbGnctg5MOZwQZoqOZ1u14rKb7OwiSxatGUSYfnq9rSFhONZjql387U/6ib1uM2rNR
	VMXlchlw4DZcaXrSPLZF5jGQyWoLnb1noEpeXqzMdKdPFoVrh7fn0g19M7MIxr6fBpa0nLYVN+0
	9bY4ZkbRfM2gkSN85C5sGTKLdxE5IAwLANb5nHU6zf38tEn7KedmT4FTvnmK66TVEjJZPIb63Ri
	f+UEK6n
X-Google-Smtp-Source: AGHT+IEQ5PAJ4E2MJ+RFp/vP7SFnTECMSFB5weGhPlm12BRaWfgE5t1lY9Zr2miit8j/tOc4AIdQ75NrG+fq+kHyFjI=
X-Received: by 2002:a05:690c:f82:b0:71c:1754:269b with SMTP id
 00721157ae682-71e6ddeae92mr122547007b3.27.1755514155297; Mon, 18 Aug 2025
 03:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com> <20250812123110.2090460-6-yangzh0906@thundersoft.com>
In-Reply-To: <20250812123110.2090460-6-yangzh0906@thundersoft.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:48:39 +0200
X-Gm-Features: Ac12FXxjKi3b8yfDU1lEnhhcDgUF2rL-OaQszzKJu25a5rk-Ae9QC1wQeMPNpMc
Message-ID: <CAPDyKFon7Q2UHOJbbVtPTHvqxYeOJr8HK5BOk6TAJaph8FcwvQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] mmc: sdhci: add Black Sesame Technologies BST
 C1200 controller driver
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	adrian.hunter@intel.com, robin.murphy@arm.com, ding.wang@bst.ai, 
	gordon.ge@bst.ai, bst-upstream@bstai.top, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, soc@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_034916_952705_B6C091AF 
X-CRM114-Status: GOOD (  43.51  )
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

On Tue, 12 Aug 2025 at 14:31, Albert Yang <yangzh0906@thundersoft.com> wrote:
>
> Add SDHCI controller driver for Black Sesame Technologies C1200 SoC.
>
> This driver supports the DWCMSHC SDHCI controller with BST-specific
> enhancements including:
> - Custom clock management and tuning
> - Power management support
> - BST-specific register configurations
> - Support for eMMC and SD card interfaces
> - Hardware limitation workaround for 32-bit DMA addressing
>
> The driver addresses specific hardware constraints where:
> - System memory uses 64-bit bus, eMMC controller uses 32-bit bus
> - eMMC controller cannot access memory through SMMU due to hardware bug
> - All system DRAM is configured outside 4GB boundary (ZONE_DMA32)
> - Uses SRAM-based bounce buffer within 32-bit address space
>
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>



> ---
> Change for v3:
> Code improvements based on review feedback:
> - Simplified dwcmshc_priv structure by removing unused fields
> - Improved helper functions with better encapsulation
> - Used devm_platform_ioremap_resource() for resource management
> - Updated Kconfig description and alphabetical ordering
> - clarify documentation on hardware limitations and bounce buffer
> approach
> - remove duplicate sdhci_writew SDHCI_CLOCK_CONTROL
>
> Changes for v2:
> 1.  Dependency Simplification :
>    - Removed COMMON_CLK dependency from Kconfig (MMC_SDHCI_BST)
>    - Add ARCH_BST || COMPILE_TEST dependency from Kconfig (MMC_SDHCI_BST)
>
> 2.  Resource Management Improvements :
>    - Replaced temporary ioremap with persistent mapping
>      * Mapped CRM registers once during probe instead of per-access
>      * Added proper cleanup in remove callback
>    - Refactored bounce buffer allocation:
>      * Simplified error handling and memory management
>      * Removed unnecessary DMA configuration layers
>
> 3.  Code Cleanup & Optimization :
>    - Pruned unused headers and legacy vendor debug code
>    - Removed deprecated sdhci_bst_print_vendor() export
>    - Converted internal functions to static scope
>    - Standardized naming conventions:
>      * Renamed DRIVER_NAME to match kernel standards
>      * Changed default_max_freq to DEFAULT_MAX_FREQ
>    - Optimized clock configuration routines
>
> 4.  Hardware Integration Fixes :
>    - Fixed register access macros for EMMC_CTRL
>      * Added proper offset calculation via SDHCI_VENDOR_PTR_R
>    - Corrected device tree compatibility string to:
>      "bst,c1200-dwcmshc-sdhci"
>
> 5.  Error Handling Enhancements :
>    - Added robust ioremap error checking
>    - Improved bounce buffer allocation failure handling
>    - Streamlined probe/remove flow
>
> 6.  Maintainability :
>    - Updated MODULE_DESCRIPTION and AUTHOR fields
>    - Added explanatory comments for hardware limitations
>    - Removed redundant multi-host setup infrastructure
>
> 7. fix build warnings from lkp
>   | Reported-by: kernel test robot <lkp@intel.com>
>   | Closes:
>   https://lore.kernel.org/oe-kbuild-all/202505290615.GZzN5rNL-lkp@intel.com/
> ---
>  drivers/mmc/host/Kconfig              |  14 +
>  drivers/mmc/host/Makefile             |   1 +
>  drivers/mmc/host/sdhci-of-bst-c1200.c | 510 ++++++++++++++++++++++++++
>  3 files changed, 525 insertions(+)
>  create mode 100644 drivers/mmc/host/sdhci-of-bst-c1200.c
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index c3f0f41a426d..fb057c46949b 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -429,6 +429,20 @@ config MMC_SDHCI_BCM_KONA
>
>           If you have a controller with this interface, say Y or M here.
>
> +config MMC_SDHCI_BST
> +       tristate "SDHCI support for Black Sesame Technologies BST C1200 controller"
> +       depends on ARCH_BST || COMPILE_TEST
> +       depends on MMC_SDHCI_PLTFM
> +       depends on OF
> +       help
> +         This selects the Secure Digital Host Controller Interface (SDHCI)
> +         for Black Sesame Technologies BST C1200 SoC. The controller is
> +         based on Synopsys DesignWare Cores Mobile Storage Controller but
> +         requires platform-specific workarounds for hardware limitations.
> +
> +         If you have a controller with this interface, say Y or M here.
> +         If unsure, say N.
> +
>  config MMC_SDHCI_F_SDH30
>         tristate "SDHCI support for Fujitsu Semiconductor F_SDH30"
>         depends on MMC_SDHCI_PLTFM
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 75bafc7b162b..bb5df05c3174 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_MMC_MXS)         += mxs-mmc.o
>  obj-$(CONFIG_MMC_SDHCI)                += sdhci.o
>  obj-$(CONFIG_MMC_SDHCI_UHS2)   += sdhci-uhs2.o
>  obj-$(CONFIG_MMC_SDHCI_PCI)    += sdhci-pci.o
> +obj-$(CONFIG_MMC_SDHCI_BST)            += sdhci-of-bst-c1200.o
>  sdhci-pci-y                    += sdhci-pci-core.o sdhci-pci-o2micro.o sdhci-pci-arasan.o \
>                                    sdhci-pci-dwc-mshc.o sdhci-pci-gli.o
>  obj-$(CONFIG_MMC_SDHCI_ACPI)   += sdhci-acpi.o
> diff --git a/drivers/mmc/host/sdhci-of-bst-c1200.c b/drivers/mmc/host/sdhci-of-bst-c1200.c
> new file mode 100644
> index 000000000000..6d2ba4232306
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-bst-c1200.c

[...]

> +/**
> + * sdhci_bst_timeout - Set timeout value for commands
> + * @host: SDHCI host controller
> + * @cmd: MMC command
> + *
> + * Sets the timeout control register to maximum value (0xE).
> + */
> +static void sdhci_bst_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> +{
> +       sdhci_writeb(host, 0xE, SDHCI_TIMEOUT_CONTROL);
> +}
> +
> +/**
> + * sdhci_bst_set_power - Set power mode and voltage
> + * @host: SDHCI host controller
> + * @mode: Power mode to set
> + * @vdd: Voltage to set
> + *
> + * Sets power mode and voltage, also configures MBIU control register.
> + */
> +static void sdhci_bst_set_power(struct sdhci_host *host, unsigned char mode,
> +                               unsigned short vdd)
> +{
> +       sdhci_set_power(host, mode, vdd);
> +       sdhci_writeb(host, 0xF, SDHCI_POWER_CONTROL);
> +       sdhci_writew(host,
> +                    (sdhci_readw(host, MBIU_CTRL) & (~0xf)) | BURST_EN,
> +                    MBIU_CTRL);
> +}
> +
> +/**
> + * bst_sdhci_execute_tuning - Execute tuning procedure
> + * @host: SDHCI host controller
> + * @opcode: Opcode to use for tuning
> + *
> + * Performs tuning procedure by trying different values and selecting the best one.
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +static int bst_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       unsigned int clk = 0, timeout;
> +       int ret = 0, error;
> +       int start0 = -1, end0 = -1, best = 0;
> +       int start1 = -1, end1 = -1, flag = 0;
> +       int i;
> +
> +       pltfm_host = sdhci_priv(host);
> +
> +       for (i = 0; i < SDHCI_TUNING_COUNT; i++) {
> +               /* Protected write */
> +               bst_crm_write(pltfm_host, REG_WR_PROTECT, REG_WR_PROTECT_KEY);
> +               /* Write tuning value */
> +               bst_crm_write(pltfm_host, DELAY_CHAIN_SEL, (1ul << i) - 1);
> +
> +               timeout = 20;
> +               while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL)) &
> +                       SDHCI_CLOCK_INT_STABLE)) {
> +                       if (timeout == 0) {
> +                               dev_err(mmc_dev(host->mmc), "Internal clock never stabilised\n");
> +                               return -EBUSY;
> +                       }
> +                       timeout--;
> +                       usleep_range(1000, 1100);
> +               }

Please convert into using some of the readx_poll_timeout functions
instead of the loop above. Moreover, please add defines to specify the
period/timeout.

> +
> +               ret = mmc_send_tuning(host->mmc, opcode, &error);
> +               if (ret != 0) {
> +                       flag = 1;
> +               } else {
> +                       if (flag == 0) {
> +                               if (start0 == -1)
> +                                       start0 = i;
> +                               end0 = i;
> +                       } else {
> +                               if (start1 == -1)
> +                                       start1 = i;
> +                               end1 = i;
> +                       }
> +               }
> +       }
> +
> +       /* Calculate best tuning value */
> +       if (end0 - start0 >= end1 - start1)
> +               best = ((end0 - start0) >> 1) + start0;
> +       else
> +               best = ((end1 - start1) >> 1) + start1;
> +
> +       if (best < 0)
> +               best = 0;
> +
> +       bst_crm_write(pltfm_host, DELAY_CHAIN_SEL, (1ul << best) - 1);
> +       timeout = 20;
> +
> +       while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL)) &
> +               SDHCI_CLOCK_INT_STABLE)) {
> +               if (timeout == 0) {
> +                       dev_err(mmc_dev(host->mmc), "Internal clock never stabilised\n");
> +                       return -EBUSY;
> +               }
> +               timeout--;
> +               usleep_range(1000, 1100);
> +       }

Ditto.

> +
> +       return 0;
> +}
> +

[...]

> +
> +static int bst_sdhci_reallocate_bounce_buffer(struct sdhci_host *host)
> +{
> +       struct mmc_host *mmc = host->mmc;
> +       unsigned int max_blocks;
> +       unsigned int bounce_size;
> +       int ret;
> +
> +       /*
> +        * Cap the bounce buffer at 32KB. Using a bigger bounce buffer
> +        * has diminishing returns, this is probably because SD/MMC
> +        * cards are usually optimized to handle this size of requests.
> +        */
> +       bounce_size = SZ_32K;
> +       /*
> +        * Adjust downwards to maximum request size if this is less
> +        * than our segment size, else hammer down the maximum
> +        * request size to the maximum buffer size.
> +        */
> +       if (mmc->max_req_size < bounce_size)
> +               bounce_size = mmc->max_req_size;
> +       max_blocks = bounce_size / 512;
> +
> +       ret = of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
> +       if (ret) {
> +               dev_err(mmc_dev(mmc), "Failed to initialize reserved memory\n");
> +               return ret;
> +       }
> +
> +       host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
> +                                                &host->bounce_addr, GFP_KERNEL);
> +       if (!host->bounce_buffer)
> +               return -ENOMEM;
> +
> +       host->bounce_buffer_size = bounce_size;
> +
> +       /* Lie about this since we're bouncing */
> +       mmc->max_segs = max_blocks;
> +       mmc->max_seg_size = bounce_size;
> +       mmc->max_req_size = bounce_size;
> +
> +       return 0;
> +}
> +
> +static int dwcmshc_probe(struct platform_device *pdev)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       struct sdhci_host *host;
> +       struct dwcmshc_priv *priv;
> +       int err;
> +
> +       host = sdhci_pltfm_init(pdev, &sdhci_dwcmshc_pdata,
> +                               sizeof(struct dwcmshc_priv));
> +       if (IS_ERR(host))
> +               return PTR_ERR(host);
> +
> +       pltfm_host = sdhci_priv(host);
> +       priv = sdhci_pltfm_priv(pltfm_host);
> +
> +       err = mmc_of_parse(host->mmc);
> +       if (err)
> +               goto err;
> +
> +       sdhci_get_of_property(pdev);
> +
> +       /* Get CRM registers from the second reg entry */
> +       priv->crm_reg_base = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(priv->crm_reg_base)) {
> +               err = PTR_ERR(priv->crm_reg_base);
> +               goto err;
> +       }
> +
> +       err = sdhci_add_host(host);
> +       if (err)
> +               goto err;
> +
> +       /*
> +        * Silicon constraints for BST C1200:
> +        * - System RAM base is 0x800000000 (above 32-bit addressable range)
> +        * - The eMMC controller DMA engine is limited to 32-bit addressing
> +        * - SMMU cannot be used on this path due to hardware design flaws
> +        * - These are fixed in silicon and cannot be changed in software
> +        *
> +        * Bus/controller mapping:
> +        * - No registers are available to reprogram the address mapping
> +        * - The 32-bit DMA limit is a hard constraint of the controller IP
> +        *
> +        * Given these constraints, an SRAM-based bounce buffer in the 32-bit
> +        * address space is required to enable eMMC DMA on this platform.
> +        */
> +       err = bst_sdhci_reallocate_bounce_buffer(host);
> +       if (err) {
> +               dev_err(&pdev->dev, "Failed to allocate bounce buffer: %d\n", err);
> +               goto err_remove_host;
> +       }

FYI, I will be awaiting a confirmation from Arnd to be with the above
hack, before I queue this up.

> +
> +       return 0;
> +
> +err_remove_host:
> +       sdhci_remove_host(host, 1);
> +err:
> +       sdhci_pltfm_free(pdev);
> +       return err;
> +}
> +

[...]

Kind regards
Uffe

