Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShdzjtGZM9vxO89zHijgFIz+FSCJs3Ns3QmxUQPrD+U=; b=AwMVQ9M4KxVoUknqBzTyKjpEhA
	mlBHtA9246LcMLBsXYZBAs7PToTViZNX1oEOpsF+yUTq+4FosAwTNV8Zyiov+s/bizXhijH4IZUPJ
	R/yUFe1xh1NF10zGQmOC9OhDrr9U1BfNWAMiT9p+QzVGfGnAA88a+WGVnF6QBZn/Dl+QH6Vy2sPcD
	61R1mT8QKrSIEeuYoieD8jYmYLU3fOBGjaBvq2K53Kl2TW7scaMtm2ksKYc3iK9kbt+lusNji0r3B
	FJyyCldgG2BBSDrQNXm8H2Zm1monCxAll2J+/7+3maqn4G832F7mMgIfzDfbioitEIquhBGhr2J2r
	UNabL1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFNQ-0000000DqtD-1fNS;
	Wed, 11 Dec 2024 05:35:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFJh-0000000DqHy-3KRA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:31:23 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725f3594965so2152170b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733895081; x=1734499881; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ShdzjtGZM9vxO89zHijgFIz+FSCJs3Ns3QmxUQPrD+U=;
        b=hf6zyhER9e4mS8shkak1I6an1Cx/LrAzV/MhjoVzazG5ywrjQ0diU3WrKDYtWJ892j
         VYByS4avYPxpttWffTKLeMTofdALwICW3BnscQmLQ4VX+9EU6yObDvqDxNTcCW9T4a6o
         4UDVFMbg0/rUiHSihjHhfXaYtUwD5IHZmxmnEgAsI9nlxBBTLXh3FLvtnG/7PHLevOqG
         iRTmjMFzWnlqCirEjTd7ehCw8ewyy9GP1PnIPJhkfF/s5hHaQhjXqRi+WfT/34REqQEb
         W/WMEer3R4gZc+lzjVZYEIGOzF6cRb0c2u/zng9Hvn+N3+PZJV41JZd4uqT5ydxbtHma
         ya7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733895081; x=1734499881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShdzjtGZM9vxO89zHijgFIz+FSCJs3Ns3QmxUQPrD+U=;
        b=oXkKvgLsLH6MQOZLhZOII9N6KYLC+WkG+mhhhJYg6KRuh2T4bQqdriIJmI0gFSgrLQ
         F3hbGm3bw1j/UaSxAnVLPS3GikZ+6j5t+uK23OOMb00yAGsDpx8uDIDzHSUyx77V6ffE
         xVHIed1+ohq8FSh0up+mYszMZM4RmlJMomecsqCK3EIfy0ydCmoT7PwXqYbzVVt5vzcU
         yELmnzI/neja/5aWR7XYS+8qbgKBIpIMTHfv9c3wH060WrX9sgmAypmPT91yLgLUh3yy
         hkv0u+eSFSFHI+SdQSDXG0iT6oLZKhWhFmx8EaAppNys8OD9KhrtebBfGkvHquzCi+LP
         f6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9nyiD1xYdwlo6gMmAVbhece29OVgA/9Txxqq+veSj8/sH4rpbb2WyFdUAoRpTbvKGmMR3LA10bKKTYU97i4bQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzHPxRUw0Dq3bUNkaHb85V3cOitmWTrsllPZ7XVnmYhDn5sQ0YG
	BZrKE+GNp68t2KCnEARXSpCkyEGzLrx+55+U6nzB4qUQmgyBBDUJ47tQP1/59g==
X-Gm-Gg: ASbGncvpaqZUwhUbbWMMtUCNoTLcJZLwk0wkKyqqHA7DvJa/8RXiIbOrrhM1KlgJopi
	oR8e/7fh4hFgFW2NUNDrF3kRubMMlYiZpYPojDaxC8L1zEGYwzTLxoN/SvsdGE+QpyDRqk/fdSa
	jv/xEmzlHS12g66tMJnUaD8axsgJTXFAVnTzkDVRsLsHdu9j8D/+ZkYsjZRwgZfd36rYVywALRZ
	8AVFx/doXZb7xO0NKD7OV0+2W3HlGNkC5v9ncb5ZTSYZuxUYfZKzdU6u3KztjM=
X-Google-Smtp-Source: AGHT+IHlZIECQ8fR8OzlEjAgvv5+ugAv4twpl5gKRHvFmE0YNk28z5fm5WtdfPPNmIaOYwFm0uxSKg==
X-Received: by 2002:a05:6a21:9990:b0:1e1:a829:bfb6 with SMTP id adf61e73a8af0-1e1c129474emr3076160637.3.1733895080678;
        Tue, 10 Dec 2024 21:31:20 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725ec2c2b7esm4993746b3a.182.2024.12.10.21.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:31:20 -0800 (PST)
Date: Wed, 11 Dec 2024 11:01:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Enumerate endpoints based on
 dll_link_up irq in the combined sys irq
Message-ID: <20241211053104.7sgo5bmmjnolwvhh@thinkpad>
References: <20241127145041.3531400-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241127145041.3531400-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_213121_892186_515BB54A 
X-CRM114-Status: GOOD (  30.49  )
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

On Wed, Nov 27, 2024 at 03:50:42PM +0100, Niklas Cassel wrote:
> Most boards using the pcie-dw-rockchip PCIe controller lack standard
> hotplug support.
> 
> Thus, when an endpoint is attached to the SoC, users have to rescan the bus
> manually to enumerate the device. This can be avoided by using the
> 'dll_link_up' interrupt in the combined system interrupt 'sys'.
> 
> Once the 'dll_link_up' irq is received, the bus underneath the host bridge
> is scanned to enumerate PCIe endpoint devices.
> 
> This commit implements the same functionality that was implemented in the
> DWC based pcie-qcom driver in commit 4581403f6792 ("PCI: qcom: Enumerate
> endpoints based on Link up event in 'global_irq' interrupt").
> 
> The Root Complex specific device tree binding for pcie-dw-rockchip already
> has the 'sys' interrupt marked as required, so there is no need to update
> the device tree binding. This also means that we can request the 'sys' IRQ
> unconditionally.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 62 +++++++++++++++++--
>  1 file changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 1170e1107508..ce4b511bff9b 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -389,6 +389,34 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>  	.stop_link = rockchip_pcie_stop_link,
>  };
>  
> +static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
> +{
> +	struct rockchip_pcie *rockchip = arg;
> +	struct dw_pcie *pci = &rockchip->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	struct device *dev = pci->dev;
> +	u32 reg, val;
> +
> +	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
> +	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
> +
> +	dev_dbg(dev, "PCIE_CLIENT_INTR_STATUS_MISC: %#x\n", reg);
> +	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
> +
> +	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
> +		val = rockchip_pcie_get_ltssm(rockchip);
> +		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
> +			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> +			/* Rescan the bus to enumerate endpoint devices */
> +			pci_lock_rescan_remove();
> +			pci_rescan_bus(pp->bridge->bus);
> +			pci_unlock_rescan_remove();
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>  {
>  	struct rockchip_pcie *rockchip = arg;
> @@ -418,14 +446,31 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
> +static int rockchip_pcie_configure_rc(struct platform_device *pdev,
> +				      struct rockchip_pcie *rockchip)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct dw_pcie_rp *pp;
> +	int irq, ret;
>  	u32 val;
>  
>  	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_HOST))
>  		return -ENODEV;
>  
> +	irq = platform_get_irq_byname(pdev, "sys");
> +	if (irq < 0) {
> +		dev_err(dev, "missing sys IRQ resource\n");
> +		return irq;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					rockchip_pcie_rc_sys_irq_thread,
> +					IRQF_ONESHOT, "pcie-sys-rc", rockchip);
> +	if (ret) {
> +		dev_err(dev, "failed to request PCIe sys IRQ\n");
> +		return ret;
> +	}
> +
>  	/* LTSSM enable control mode */
>  	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
> @@ -436,7 +481,16 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
>  
> -	return dw_pcie_host_init(pp);
> +	ret = dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize host\n");
> +		return ret;
> +	}
> +
> +	/* unmask DLL up/down indicator */
> +	rockchip_pcie_writel_apb(rockchip, 0x20000, PCIE_CLIENT_INTR_MASK_MISC);
> +
> +	return ret;
>  }
>  
>  static int rockchip_pcie_configure_ep(struct platform_device *pdev,
> @@ -457,7 +511,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>  
>  	ret = devm_request_threaded_irq(dev, irq, NULL,
>  					rockchip_pcie_ep_sys_irq_thread,
> -					IRQF_ONESHOT, "pcie-sys", rockchip);
> +					IRQF_ONESHOT, "pcie-sys-ep", rockchip);
>  	if (ret) {
>  		dev_err(dev, "failed to request PCIe sys IRQ\n");
>  		return ret;
> @@ -553,7 +607,7 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  
>  	switch (data->mode) {
>  	case DW_PCIE_RC_TYPE:
> -		ret = rockchip_pcie_configure_rc(rockchip);
> +		ret = rockchip_pcie_configure_rc(pdev, rockchip);
>  		if (ret)
>  			goto deinit_clk;
>  		break;
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

