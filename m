Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24437CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jVGUoZl7QKW/jrUqmLdcQ17BKW7CKZzyHqO+L1oBJKU=; b=pSTESu75bNCAeuX7yanxUdriND
	GBf8TpbjhbqJdijRXzzLR8NAeqdlNiLQa+0RlzuYhptDYP+FnCitb1VErXh0sWuW+Zu98VPF0hpHw
	teKGVcOtkRVqFT0BF+44Yczaon6h9d2lnAXKEnPaaHVSDaeqn6/HZop4BVJNkWQWSYX/TlJlwC6Al
	fhY08jYpB7CB1BVQd4N1GhSzTbyoSnGR3GVcMuLS76ViFmcFbKHEiFEup0jjGvAZPpsUKjauwR2Yt
	Hv6cBMxl3PFh6wK+kszi2dnLiq1FcsmhbKU/o1HZmnpm7nJxHwYLmsqsCsHoLxhncXxb4j1x3nh0L
	ITKp04sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4sn-00000009wXV-3Oae;
	Fri, 12 Sep 2025 14:36:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4sl-00000009wVM-0XOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:36:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-56a04f7691aso2729488e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687769; x=1758292569; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jVGUoZl7QKW/jrUqmLdcQ17BKW7CKZzyHqO+L1oBJKU=;
        b=vrUlGkoF7G0kfIQAeliaDXm5L2nWf5q9j5tTfNAX/o+tSsMYgMn4Kq7eBRCt8odrCd
         ltHvY9gmm5ttO08qcxEVFgUymeVAbY+oUaFzASYWvkxoAMOPUNLlvWbDTUqclmC87/YX
         DI85kGSsbBkhQNxOJA51WJXj/tWeK1vscCn2i0Wsb26qAIZu/+7f9wXUMmuzphvE+A+A
         uyulbEB3WnxiWkLSq8roArH+jPZQN9tq4Z7/kjWnZwY7LochipiQ5myVTa4qCEPtkZ2x
         1ioPlC+ESEq6RPyg8o53FfbXp2tPn26hoyUAMvDz3vc0+NXhZg/mbGgmkRfEXWNIEZds
         XPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687769; x=1758292569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVGUoZl7QKW/jrUqmLdcQ17BKW7CKZzyHqO+L1oBJKU=;
        b=YlJTkoA+aInxH5mtb3bDPfAe1W9CkyzhZ7jOHzpx8FKch7VR5Z42M8+y5az+x5PZDk
         Sh9tg3qE64MBQRI9jPGuS3vDI0+Q2M8BKzUgYqLVOlqHAtEZF5BZ3IYBLXgEog4znAGt
         uLc0RyG0c2Wz+KPWe9Z9sq5GvUggvd5asCSh4hDpG/4DDmqFznBDqKI4h+WZtLFyf4s6
         2jbipsZwa+OGexcZh2xZnMXnnsvcPLQ3oCk5i3XtN439XOqfwaDP0124AkVPLHqIXpql
         epnoS0REaRW883xKg3xlcal/16+/ssrRiSbgBFKr0VzzZvR+EtksuewySi3sozDTT9eD
         jYTw==
X-Forwarded-Encrypted: i=1; AJvYcCUD0i5FsF2sNrdm7b9YwwenzgP82Rf1R0WSg5dHvAU7SmheHwFBCPOI4vxwM3b0grnDBcV3IQXIwNdGmDpPBkLu@lists.infradead.org
X-Gm-Message-State: AOJu0YwAhi1TxTAtl6za9djNgdGmL2/UJYN5BgMZAkTUkcvePv1HOFAx
	jdtfj5W9e2ftwAZlGFyDRe3JTK3MDbvmOugPPMq5xWU1x2rcZXN60V4iZ0Sl5uX946c=
X-Gm-Gg: ASbGnctjOIOLMoWqf5maE00wKNF5aSVCa7imyRKWePO0mabCvXmq3gPtqW6QofZs3iG
	ZehPz09jV+kP8IWK09RX0cZeoncq3XLlVdO2A8nD2HWvb4Rag4VZWttFgrIh/623V5zDhTeU9os
	36rr4CY1K5v/plmhEzJADtdSUQvOE/o7FFTVsDxE61Od82dREMqOmI1gWNvarhA9auVxZQj6ZiX
	fRipsB+EgEetyUHpkFQYMj1SAB0GHsXg87laPq/pjxmJlNU1p6Kvd3C1UeQ/unAqLsyVvcdD8n/
	8RAWannnMEP+6WUG8Z0ImGYkwmU1hz0gm59hYg5bD/cHtX+Kjr3oXgKEqgP5Z+VBex392Qd4s2z
	jG1+N7tb5FiX8AJWW6emUoWNut/DLRbgBkC+kFhyk25aMAJd6R4q3oO5HLpT0ayyF6g==
X-Google-Smtp-Source: AGHT+IEsSVAtYO0GTF2dOCpPZHkcGM8bs2rKRqzsbq84UASkP3MlDRwNQk3IdJUJ/J8IxFpxvDpQOQ==
X-Received: by 2002:ac2:51d0:0:b0:55f:3ae4:fe55 with SMTP id 2adb3069b0e04-5705be234camr1238974e87.4.1757687767437;
        Fri, 12 Sep 2025 07:36:07 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e64fa7192sm1199028e87.124.2025.09.12.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:36:07 -0700 (PDT)
Date: Fri, 12 Sep 2025 17:36:05 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-mmc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
	adrian.hunter@intel.com, victor.shih@genesyslogic.com.tw,
	ben.chuang@genesyslogic.com.tw, geert+renesas@glider.be,
	angelogioacchino.delregno@collabora.com, dlan@gentoo.org,
	arnd@arndb.de, zhoubinbin@loongson.cn,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/4] enable ROCKCHIP_PM_DOMAINS
Message-ID: <aMQv1V49xa_MThGq@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912143036.2844523-1-mikko.rapeli@linaro.org>
 <20250912142735.2843958-1-mikko.rapeli@linaro.org>
 <20250912142253.2843018-1-mikko.rapeli@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_073611_227514_CEFFFB75 
X-CRM114-Status: GOOD (  33.06  )
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

Hi,

Sorry I did not use scripts/get_maintainers.pl correctly after
changes were moving from one susbsystem to another based on review
comments but I hope correct maintainers and lists have received
the patches now.

Cheers,

-Mikko

On Fri, Sep 12, 2025 at 05:22:49PM +0300, Mikko Rapeli wrote:
> Hi,
> 
> MMC_DW_ROCKCHIP needs ROCKCHIP_PM_DOMAINS before MMC is detected
> on Rockchip rk3399 rockpi4b and similar devices. Make this dependency
> more visible, or the default with ARCH_ROCKCHIP if possible.
> 
> v3: use "default ARCH_ROCKCHIP" in ROCKCHIP_PM_DOMAINS as suggested
>     by Arnd Bergmann <arnd@arndb.de>, enable more MMC drivers for
>     COMPILE_TEST and remove MMC_LOONGSON2 which doesn't link,
>     remove PM dependency as suggested by
>     Geert Uytterhoeven <geert@linux-m68k.org>
> 
> v2: changed from "depend on" in MMC driver to "select" as default
>     on ARCH_ROCKCHIP as suggested by Ulf and Heiko
>     https://marc.info/?i=20250912084112.2795848-1-mikko.rapeli%20()%20linaro%20!%20org
> 
> v1: https://lore.kernel.org/linux-mmc/20250911144313.2774171-1-mikko.rapeli@linaro.org/
> 
> Mikko Rapeli (4):
>   pmdomain: rockchip: enable ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP
>   mmc: add COMPILE_TEST to multiple drivers
>   mmc: remove COMPILE_TEST from MMC_LOONGSON2
>   ARM: rockchip: remove REGULATOR conditional to PM
> 
>  arch/arm/mach-rockchip/Kconfig    |  2 +-
>  drivers/mmc/host/Kconfig          | 10 +++++-----
>  drivers/pmdomain/rockchip/Kconfig |  1 +
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> -- 
> 2.34.1
> 

On Fri, Sep 12, 2025 at 05:27:35PM +0300, Mikko Rapeli wrote:
> On rk3399 based rockpi4b, mounting rootfs from mmc fails unless
> ROCKCHIP_PM_DOMAINS is enabled. Accoriding to
> Heiko Stübner <heiko@sntech.de> all SoCs since 2012 have power
> domains so the support should be enabled by default
> on both arm and arm64.
> 
> Failing boot without CONFIG_ROCKCHIP_PM_DOMAINS=y:
> 
> https://ledge.validation.linaro.org/scheduler/job/119268
> 
> /dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
> /dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
> /dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
> /dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
> /dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
> /dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
> dw-apb-uart ff1a0000.serial: forbid DMA for kernel console
> root '/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e' doesn't exist or does not contain a /dev.
> rk_gmac-dwmac fe300000.ethernet: deferred probe timeout, ignoring dependency
> rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -110
> rk_iommu ff650800.iommu: deferred probe timeout, ignoring dependency
> rk_iommu ff650800.iommu: probe with driver rk_iommu failed with error -110
> dwmmc_rockchip fe320000.mmc: deferred probe timeout, ignoring dependency
> rockchip-typec-phy ff7c0000.phy: deferred probe timeout, ignoring dependency
> dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -110
> rockchip-typec-phy ff7c0000.phy: probe with driver rockchip-typec-phy failed with error -110
> rockchip-typec-phy ff800000.phy: deferred probe timeout, ignoring dependency
> rockchip-typec-phy ff800000.phy: probe with driver rockchip-typec-phy failed with error -110
> rk_iommu ff660480.iommu: deferred probe timeout, ignoring dependency
> rk_iommu ff660480.iommu: probe with driver rk_iommu failed with error -110
> rk_iommu ff8f3f00.iommu: deferred probe timeout, ignoring dependency
> rk_iommu ff8f3f00.iommu: probe with driver rk_iommu failed with error -110
> rk_iommu ff903f00.iommu: deferred probe timeout, ignoring dependency
> rk_iommu ff903f00.iommu: probe with driver rk_iommu failed with error -110
> rk_iommu ff914000.iommu: deferred probe timeout, ignoring dependency
> rk_iommu ff914000.iommu: probe with driver rk_iommu failed with error -110
> rk_iommu ff924000.iommu: deferred probe timeout, ignoring dependency
> rk_iommu ff924000.iommu: probe with driver rk_iommu failed with error -110
> platform fe800000.usb: deferred probe pending: platform: wait for supplier /phy@ff7c0000/usb3-port
> sdhci-arasan fe330000.mmc: deferred probe timeout, ignoring dependency
> platform fe900000.usb: deferred probe pending: platform: wait for supplier /phy@ff800000/usb3-port
> sdhci-arasan fe330000.mmc: probe with driver sdhci-arasan failed with error -110
> platform ff1d0000.spi: deferred probe pending: (reason unknown)
> platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error
> 
> Working boot with CONFIG_ROCKCHIP_PM_DOMAINS=y:
> 
> https://ledge.validation.linaro.org/scheduler/job/119272
> 
> dwmmc_rockchip fe320000.mmc: IDMAC supports 32-bit address mode.
> dwmmc_rockchip fe320000.mmc: Using internal DMA controller.
> dwmmc_rockchip fe320000.mmc: Version ID is 270a
> dwmmc_rockchip fe320000.mmc: DW MMC controller at irq 45,32 bit host data width,256 deep fifo
> dwmmc_rockchip fe320000.mmc: Got CD GPIO
> ff1a0000.serial: ttyS2 at MMIO 0xff1a0000 (irq = 44, base_baud = 1500000) is a 16550A
> printk: legacy console [ttyS2] enabled
> mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> dw_wdt ff848000.watchdog: No valid TOPs array specified
> mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
> mmc0: CQHCI version 5.10
> rk_gmac-dwmac fe300000.ethernet: IRQ eth_wake_irq not found
> mmc1: new high speed SDHC card at address aaaa
> fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
> fan53555-regulator 0-0041: FAN53555 Option[8] Rev[1] Detected!
> rk_gmac-dwmac fe300000.ethernet: IRQ eth_lpi not found
> mmcblk1: mmc1:aaaa SC16G 14.8 GiB
> rk_gmac-dwmac fe300000.ethernet: IRQ sfty not found
> GPT:Primary header thinks Alt. header is not at the end of the disk.
> rk_gmac-dwmac fe300000.ethernet: Deprecated MDIO bus assumption used
> GPT:1978417 != 31116287
> rk_gmac-dwmac fe300000.ethernet: PTP uses main clock
> GPT:Alternate GPT header not at the end of the disk.
> rk_gmac-dwmac fe300000.ethernet: clock input or output? (input).
> GPT:1978417 != 31116287
> rk_gmac-dwmac fe300000.ethernet: TX delay(0x28).
> GPT: Use GNU Parted to correct GPT errors.
> rk_gmac-dwmac fe300000.ethernet: RX delay(0x11).
>  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Suggested-by: Heiko Stübner <heiko@sntech.de>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  drivers/pmdomain/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchip/Kconfig
> index 218d43186e5b9..17f2e6fe86b6f 100644
> --- a/drivers/pmdomain/rockchip/Kconfig
> +++ b/drivers/pmdomain/rockchip/Kconfig
> @@ -3,6 +3,7 @@ if ARCH_ROCKCHIP || COMPILE_TEST
>  
>  config ROCKCHIP_PM_DOMAINS
>  	bool "Rockchip generic power domain"
> +	default ARCH_ROCKCHIP
>  	depends on PM
>  	depends on HAVE_ARM_SMCCC_DISCOVERY
>  	depends on REGULATOR
> -- 
> 2.34.1
> 

On Fri, Sep 12, 2025 at 05:30:36PM +0300, Mikko Rapeli wrote:
> PM is explicitly enabled in lines just below so
> REGULATOR can be too.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  arch/arm/mach-rockchip/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
> index b7855cc665e94..c90193dd39283 100644
> --- a/arch/arm/mach-rockchip/Kconfig
> +++ b/arch/arm/mach-rockchip/Kconfig
> @@ -13,7 +13,7 @@ config ARCH_ROCKCHIP
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
>  	select DW_APB_TIMER_OF
> -	select REGULATOR if PM
> +	select REGULATOR
>  	select ROCKCHIP_TIMER
>  	select ARM_GLOBAL_TIMER
>  	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> -- 
> 2.34.1
> 


