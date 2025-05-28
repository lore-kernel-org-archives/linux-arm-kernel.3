Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA798C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYU8Mi90KLdCAAJJaGYDubPex399S/3mu0JP984ggbk=; b=FMzW0oGe2dNlVSFPa7wOo6R33F
	xTrJ8pqIXwV0/+Q0DUbmzxOpY3bYNk9AoPw2OFS5ove1ebmgO04dx2byw7a3rBu1Q4lhp9VEQmDrX
	O16uwkdG4Popz1e0kpjWbbxrg6zBDliT0qBHAUB0dhGT/2b6IMv/+VDtGLTLWxO+p0/4G0F3lcMrB
	ZHb55rX0GvbNt7ePmgQaMxwnTaX7x6EWuMw6D+e5uKTPGGECzT221/VzQgG5qJRuPgCpZu5lzON9G
	DVj4jZguRfb9W3DvxUnbyUDjWA63IuNfsDSVBkGGCQL1jariM51jy9XgIJSkEtC67YdKdFPMTMD8m
	c9fttemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDJV-0000000Ckjt-3KXg;
	Wed, 28 May 2025 09:43:09 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCkR-0000000CfmJ-43xs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 09:06:57 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52f298abd9eso2449991e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 02:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423213; x=1749028013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYU8Mi90KLdCAAJJaGYDubPex399S/3mu0JP984ggbk=;
        b=uRjvBCFPucFoZrWHXsEDi6Togx9TFIO/OWlsQGYauhIJkwJn/uahNvcOp4ZvFYEY4b
         EbdMj9kOxezoei1kg85GzIAifU9IdNx+pwkR7PruHPpiIJimcYwe9ceNtKryfnnjnvRA
         uDtQqAByPAIr0pPyJ+16V0/XSnGxog6/DY3s+pZ7eaALRjxiZ/B+fWi99xX1ZnOJNqto
         k8Y8ycEyEaV59MGJsftm+v0ma8Ghkg16tqZ2DFSnW1s57ApUFuvVpVQT9jFAG1xtNS9R
         IrZlKo18ExglsbwFxOw4EsIf96oETxiUdfsq9hPhpbw9StHjUoOffeGaU89eXnOoxkZV
         gzRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ePHCOTkD9+f/KhdRWevaNCMDjxAArsZN7gYtJou7ek2DYFh3SEk2U+wDqkWgzcRN5XcKky1ouAtuQFI0VxcO@lists.infradead.org
X-Gm-Message-State: AOJu0YwjoGzCOxO9Dk4cl9MXysz/AJYJkm4bcPY2bhPMFE1qGJFrK35b
	7RQynKDCIhzJfJab+sPgk0pjc1KhbE6m0iA++W/wXgwf0dt2k2iiFmL/0azjv0xv
X-Gm-Gg: ASbGncu4j9VoLCP7eUQxNHPWSMqwAytnN6fq7o3QgPlCi8j32fsOXkS0lxST1qlZnX+
	SZwckBPsn8DJROBBssLuC6Ddw+xMrtMPgk45lAk0VxqLZPlhtXtnMsKqeq1dbQplloxn3Iq8cLs
	8JilwOd9Q1DDwNIOnXVI9Ju+S72Z+6b6RTYf7vecmIGZ+lhVwKFsUmtzeLF28K/jABk9+X0AlP6
	JzJ+3vCaCILvFFo1k+fTEmWHNjfjUcuuR+hKdPrWMribLSDKsWZ8dhFEIh+W2UHtNQsi8nFwgtX
	kQhNtjDT/70t4fcZdDy6RIQR57ccXdv1WiHfIslB/y5iYmcyDXw4wDVazLrSY2uUoo69ojOa2Uf
	NaUw/JRarRXwbzA==
X-Google-Smtp-Source: AGHT+IE3yv7kdhaXEhRkMioZBiuzX1pBDAn9zHOv/gJvBoGK3NWJWJW/2DFneyKhev8jD/FpUPEI1A==
X-Received: by 2002:a05:6122:8cf:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-52f2c4d8f4emr12947416e0c.4.1748423212866;
        Wed, 28 May 2025 02:06:52 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066884495sm605191e0c.23.2025.05.28.02.06.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 02:06:52 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so2655394241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 02:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkwU6P+cWS0lHX8tahbRCwthGrIYVdEp0QQKCoFaxIKL4o8gDp6cEjxuJWc3kyGzFEY0py7BxvHipyLc10nU/q@lists.infradead.org
X-Received: by 2002:a05:6102:8006:b0:4e5:8d09:7b14 with SMTP id
 ada2fe7eead31-4e58d097d83mr5192536137.0.1748423212075; Wed, 28 May 2025
 02:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250528085453.481320-1-yangzh0906@thundersoft.com>
In-Reply-To: <20250528085453.481320-1-yangzh0906@thundersoft.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 11:06:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjR0Ki_vLYtvv1HYpZVdLqUtacG=zs4_ooC0yLnK_CvA@mail.gmail.com>
X-Gm-Features: AX0GCFv2umrJq54Eu_Z7Pa0M5hU7WaTzckrO6UyfF8NfUyYwIvRhoe3M_guovBM
Message-ID: <CAMuHMdVjR0Ki_vLYtvv1HYpZVdLqUtacG=zs4_ooC0yLnK_CvA@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] mmc: sdhci: add Black Sesame Technologies BST
 C1200 controller driver
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ge Gordon <gordon.ge@bst.ai>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Victor Shih <victor.shih@genesyslogic.com.tw>, 
	Shan-Chun Hung <shanchun1218@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Ben Chuang <ben.chuang@genesyslogic.com.tw>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_020656_012987_B86AD7A1 
X-CRM114-Status: GOOD (  28.58  )
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

Hi Albert,

On Wed, 28 May 2025 at 10:55, Albert Yang <yangzh0906@thundersoft.com> wrote:
> Add a driver for the DesignWare Mobile Storage Host Controller (DWCMSHC)
> SDHCI controller found in Black Sesame Technologies C1200 SoCs.
>
> The driver provides specialized clock configuration, tuning, voltage
> switching, and power management for the BST DWCMSHC controller. It also
> includes support for eMMC boot and memory-mapped I/O for CRM registers.
>
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

Thanks for your patch!

> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1112,3 +1112,14 @@ config MMC_LITEX
>           module will be called litex_mmc.
>
>           If unsure, say N.
> +
> +config MMC_SDHCI_BST
> +       tristate "SDHCI OF support for the BST DWC MSHC"

depends on ARCH_BST || COMPILE_TEST

> +       depends on MMC_SDHCI_PLTFM
> +       depends on OF
> +       depends on COMMON_CLK
> +       help
> +         This selects Synopsys DesignWare Cores Mobile Storage Controller
> +         support.
> +         If you have a controller with this interface, say Y or M here.
> +         If unsure, say N.

> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-bst-c1200.c

> +#define SDEMMC_CRM_BCLK_DIV_CTRL       0x08
> +#define SDEMMC_CRM_RX_CLK_CTRL         0x14
> +#define SDEMMC_CRM_TIMER_DIV_CTRL      0x0C
> +#define SDEMMC_CRM_VOL_CTRL            0x1C
> +#define DRIVER_NAME                    "sdhci_bst"
> +#define BST_VOL_STABLE_ON              (0x1 << 7)
> +#define SDHCI_DUMP_BST(f, x...)                \
> +       pr_info("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ##x)
> +#define SD_3_3V                                0
> +#define SD_1_8V                                1
> +#define default_max_freq               200000ul
> +
> +void sdhci_bst_print_vendor(struct sdhci_host *host)
> +{
> +       SDHCI_DUMP_BST("============ SDHCI VENDOR REGISTER DUMP ===========\n");
> +
> +       SDHCI_DUMP_BST("VER_ID:  0x%08x | VER_TPYE:  0x%08x\n",
> +                      sdhci_readl(host, SDHC_MHSC_VER_ID_R),
> +                      sdhci_readl(host, SDHC_MHSC_VER_TPYE_R));
> +       SDHCI_DUMP_BST("MHSC_CTRL:  0x%08x | MBIU_CTRL:  0x%08x\n",
> +                      sdhci_readw(host, SDHC_MHSC_CTRL_R),
> +                      sdhci_readw(host, SDHC_MBIU_CTRL_R));
> +       SDHCI_DUMP_BST("EMMC_CTRL:  0x%08x | BOOT_CTRL: 0x%08x\n",
> +                      sdhci_readl(host, SDHC_EMMC_CTRL_R),
> +                      sdhci_readw(host, SDHC_BOOT_CTRL_R));
> +       SDHCI_DUMP_BST("GP_IN:   0x%08x | GP_OUT: 0x%08x\n",
> +                      sdhci_readl(host, SDHC_GP_IN_R),
> +                      sdhci_readb(host, SDHC_GP_OUT_R));
> +       SDHCI_DUMP_BST("AT_CTRL:     0x%08x | AT_STAT:  0x%08x\n",
> +                      sdhci_readb(host, SDHC_AT_CTRL_R),
> +                      sdhci_readb(host, SDHC_AT_STAT_R));
> +}
> +EXPORT_SYMBOL_GPL(sdhci_bst_print_vendor);

Why do you need this?

> +
> +static u32 bst_read_phys_bst(u32 phys_addr)
> +{
> +       u32 phys_addr_page = phys_addr & 0xFFFFE000;
> +       u32 phys_offset = phys_addr & 0x00001FFF;
> +       u32 map_size = phys_offset + sizeof(u32);
> +       u32 ret = 0xDEADBEEF;
> +       void *mem_mapped = ioremap(phys_addr_page, map_size);
> +
> +       if (mem_mapped) {
> +               ret = (u32)ioread32(((u8 *)mem_mapped) + phys_offset);
> +               iounmap(mem_mapped);
> +       }

Please do not ioremap()/iounmap() for each register read...

> +
> +       return ret;
> +}
> +
> +static void bst_write_phys_bst(u32 phys_addr, u32 value)
> +{
> +       u32 phys_addr_page = phys_addr & 0xFFFFE000;
> +       u32 phys_offset = phys_addr & 0x00001FFF;
> +       u32 map_size = phys_offset + sizeof(u32);
> +       void *mem_mapped = ioremap(phys_addr_page, map_size);
> +
> +       if (mem_mapped) {
> +               iowrite32(value, ((u8 *)mem_mapped) + phys_offset);
> +               iounmap(mem_mapped);
> +       }

or write...

> +}

Aborting review.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

