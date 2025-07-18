Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F09C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT+RZ7WEBbWIWW/Jed62+BDDdP8o1iduIJiqKrv6b/A=; b=4PQbctzwZb5/6KJvmyLqi036fd
	7h3Ova3Q8RCF7aAoXPt1Od3p2MpD+w4mYOAzvxZWEwthfv8sEsaqN8k9bYr3JytPqWfk76u9ZFlyr
	dFadfFM+iA/am/esyXLaln2aYXfTkaEdl1NnS/0UP7aIgfm2xreKQ872+2Mi01cmvTS34L0WzEG+a
	nyTQKBy/D1P3okMSRnJg3bTtKPqTOBSxGMd71uXkBPEoXV0W3u83Kcv6V4cYodYp2srdPpi2sVLwZ
	UbW7zXAtG+OsClBrVJ/lcSQfZ78kVl3qwXpfS3yG7cHpVNUlEti1GyLflQwvYrkf2dPLiGzqd8Q5V
	C/3t0U/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaYh-0000000BWU5-2DXK;
	Fri, 18 Jul 2025 02:10:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaKw-0000000BUfX-0PpI;
	Fri, 18 Jul 2025 01:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XT+RZ7WEBbWIWW/Jed62+BDDdP8o1iduIJiqKrv6b/A=; b=IGxiXJJ6F4fSHq7yFafjvWmxTn
	O1PUGGu2IfVD0EnZPbLsUgrWHEcsa7GpcXIvyNA3Do+FDlm1uENQadhLztjGNAqOsAQNIqVib8/QF
	yDDijC2kX9GrYVA3aatt+GYLnsDckiFxH4iCQAm89v4T1ZKEmrOJe+NhbZYFLFCvYRQKoruQ0nhK1
	p0eI7uXV03XG2W0afVPi2jdcqqAtMG14sJy7pOYbx1WpqG6+sXFVYEY973lcoicDChDb4waaaGzyb
	sL18653jxPmmxFjzjqM2Ptel6tIBT5hps7lzJpqEXEJ1ceKeQxjXenRfY3pWIBFbZcmYRQgkCgOfJ
	e32Yi9LQ==;
Received: from mail-m81206.xmail.ntesmail.com ([156.224.81.206])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaKp-0000000AOjJ-1Mr1;
	Fri, 18 Jul 2025 01:56:32 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c6a85541;
	Fri, 18 Jul 2025 09:55:50 +0800 (GMT+08:00)
Message-ID: <ac48d142-7aec-4fdd-92a4-6f9bc10a7928@rock-chips.com>
Date: Fri, 18 Jul 2025 09:55:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Hugh Cole-Baker <sigmaris@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9MTFYZQxgYGB1CTE5MSkJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a981b3eb22b09cckunm9ba9285b1f9de7b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46MSo4AzE3P1ZNATguNxEY
	TQJPCzNVSlVKTE5JQ0tITE5JS09JVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1DS0g3Bg++
DKIM-Signature: a=rsa-sha256;
	b=i6J9wKv2sF8hty+9HcYY7Grx2KFg7v7tdWpFM6j9VKKFMuYavSInJCeIrPUv3bfq9gU0krIP8YR6oB3JncO+CDd/Q55N7THricQKXBdmc+SZmxD/2LnpW/U9kJDPnyAwOwoPH7+gpU2c5Zgu8QcWkSAyv/TCol6SpwigDy7FZB0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XT+RZ7WEBbWIWW/Jed62+BDDdP8o1iduIJiqKrv6b/A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025628_899199_A4DC0477 
X-CRM114-Status: GOOD (  28.24  )
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

Hi Geraldo,

在 2025/06/11 星期三 3:05, Geraldo Nascimento 写道:
> After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> N10 through trial-and-error debugging, I finally got positive results
> with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> Samsung PM981a SSD.
> 
> The NIC was connected to a M.2->PCIe x4 riser card and it would get
> stuck on Polling.Compliance, without breaking electrical idle on the
> Host RX side. The Samsung PM981a SSD is directly connected to M.2
> connector and that SSD is known to be quirky (OEM... no support)
> and non-functional on the RK3399 platform.
> 
> The Samsung SSD was even worse than the NIC - it would get stuck on
> Detect.Active like a bricked card, even though it was fully functional
> via USB adapter.
> 
> It seems both devices benefit from retrying Link Training if - big if
> here - PERST# is not toggled during retry.
> 

I didn't see this error before especially given RTL8111 NIC is widelly
used by customers.

Could you help tried this?
[1] apply your patch 3 first
[2] apply below changes

--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -314,7 +314,7 @@ static int rockchip_pcie_host_init_port(struct 
rockchip_pcie *rockchip)
         rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
                             PCIE_CLIENT_CONFIG);

-       msleep(PCIE_T_PVPERL_MS);
+       msleep(500);
         gpiod_set_value_cansleep(rockchip->perst_gpio, 1);

         msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -322,7 +322,7 @@ static int rockchip_pcie_host_init_port(struct 
rockchip_pcie *rockchip)
         /* 500ms timeout value should be enough for Gen1/2 training */
         err = readl_poll_timeout(rockchip->apb_base + 
PCIE_CLIENT_BASIC_STATUS1,
                                  status, PCIE_LINK_UP(status), 20,
-                                500 * USEC_PER_MSEC);
+                                5000 * USEC_PER_MSEC);
         if (err) {
                 dev_err(dev, "PCIe link training gen1 timeout!\n");
                 goto err_power_off_phy;
@@ -951,6 +951,8 @@ static int rockchip_pcie_probe(struct 
platform_device *pdev)
         if (err)
                 return err;

+       gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
+
         err = rockchip_pcie_set_vpcie(rockchip);
         if (err) {
                 dev_err(dev, "failed to set vpcie regulator\n");


> For retry to work, flow must be exactly as handled by present patch,
> that is, we must cut power, disable the clocks, then re-enable
> both clocks and power regulators and go through initialization
> without touching PERST#. Then quirky devices are able to sucessfully
> enumerate.
> 
> No functional change intended for already working devices.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>   drivers/pci/controller/pcie-rockchip-host.c | 47 ++++++++++++++++++---
>   1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 2a1071cd3241..67b3b379d277 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -338,11 +338,14 @@ static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
>   static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>   {
>   	struct device *dev = rockchip->dev;
> -	int err, i = MAX_LANE_NUM;
> +	int err, i = MAX_LANE_NUM, is_reinit = 0;
>   	u32 status;
>   
> -	gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> +	if (!is_reinit) {
> +		gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> +	}
>   
> +reinit:
>   	err = rockchip_pcie_init_port(rockchip);
>   	if (err)
>   		return err;
> @@ -369,16 +372,46 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>   	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
>   			    PCIE_CLIENT_CONFIG);
>   
> -	msleep(PCIE_T_PVPERL_MS);
> -	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
> -
> -	msleep(PCIE_T_RRS_READY_MS);
> +	if (!is_reinit) {
> +		msleep(PCIE_T_PVPERL_MS);
> +		gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
> +		msleep(PCIE_T_RRS_READY_MS);
> +	}
>   
>   	/* 500ms timeout value should be enough for Gen1/2 training */
>   	err = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_BASIC_STATUS1,
>   				 status, PCIE_LINK_UP(status), 20,
>   				 500 * USEC_PER_MSEC);
> -	if (err) {
> +
> +	if (err && !is_reinit) {
> +		while (i--)
> +			phy_power_off(rockchip->phys[i]);
> +		i = MAX_LANE_NUM;
> +		while (i--)
> +			phy_exit(rockchip->phys[i]);
> +		i = MAX_LANE_NUM;
> +		is_reinit = 1;
> +		dev_dbg(dev, "Will reinit PCIe without toggling PERST#");
> +		if (!IS_ERR(rockchip->vpcie12v))
> +			regulator_disable(rockchip->vpcie12v);
> +		if (!IS_ERR(rockchip->vpcie3v3))
> +			regulator_disable(rockchip->vpcie3v3);
> +		regulator_disable(rockchip->vpcie1v8);
> +		regulator_disable(rockchip->vpcie0v9);
> +		rockchip_pcie_disable_clocks(rockchip);
> +		err = rockchip_pcie_enable_clocks(rockchip);
> +		if (err)
> +			return err;
> +		err = rockchip_pcie_set_vpcie(rockchip);
> +		if (err) {
> +			dev_err(dev, "failed to set vpcie regulator\n");
> +			rockchip_pcie_disable_clocks(rockchip);
> +			return err;
> +		}
> +		goto reinit;
> +	}
> +
> +	else if (err) {
>   		dev_err(dev, "PCIe link training gen1 timeout!\n");
>   		goto err_power_off_phy;
>   	}


