Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F28606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rwxsl/eC;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=JcYUNmGU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=urfEyyHn5kTPStI4ZHijB5qvt2eSMg21ywUW0EWxMho=; b=Rwxsl/eCEc6FoW
	Wo0kkey1sdq0Rhep5velM7onAIx/zU7yWvo2Ph1uC25GyOn5IY59GMvr5CUyEi3gpbFtQMX+2a4Pe
	fYKiu+Vg/+gstWeje7APlutpha5fQScKYoiSaN33ZgeO/nyV0o4/2X7jW32Z5QKJiON160LoW4ltE
	nAfe4Zz84vv8mqGnn8gT+HhXuWy2qSMonXj6XkfIdFC491MzG3W/QXjbOpm6dotqhDfzvhRi9A+f8
	k93Rk5nFAYj3PZ5tehEBc2WXMAXJCYF6uafZtxZK8rzOGfoJToir2N6ENwNq5wgRlQye7TnymHXgk
	Fuzoew+Y0AHh0cIzEJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAPy-00000001c9b-0YVU;
	Mon, 26 Oct 2026 02:26:34 +0000
Received: from mail-m1063.netease.com ([154.81.10.63])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAPv-00000001c8l-00k8;
	Mon, 26 Oct 2026 02:26:32 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 524c7990e;
	Mon, 26 Oct 2026 10:26:27 +0800 (GMT+08:00)
Message-ID: <78564cbc-8faa-4392-ab66-2a1395fdca4e@rock-chips.com>
Date: Mon, 26 Oct 2026 10:26:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Remove redundant dev_err()
To: Diederik de Haas <diederik@cknow-tech.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
References: <20261021101533.609118-1-diederik@cknow-tech.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261021101533.609118-1-diederik@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17607d42803a4kunm445aa2303d8aee
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUhCS1YaQh9PHk5LQh
	0YHxlWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JcYUNmGUGamMX0H4edPTX5buUkXYPXtzWNZJzuHFd2cO8Zvt2/2GQlk2tcILYDNXTCofCO2xjK3aRQhgmlyWPSA+CVjG9pvEvwbP3R0qUDmNF7iOLfUaaigRZOrSbL2fVRjdZ4PAwHFI6XI/ULrph+sqGPCExHf1KWV2SXip0NM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=urfEyyHn5kTPStI4ZHijB5qvt2eSMg21ywUW0EWxMho=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_192631_255403_7E4F6C2A 
X-CRM114-Status: GOOD (  14.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/10/21 星期三 18:14, Diederik de Haas 写道:
> The devm_request_threaded_irq() function already automatically logs
> detailed error messages on failure since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> So remove the now-redundant driver-specific dev_err() calls.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks.

> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 14976861f8ef..a4dbfc52c2f1 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -718,10 +718,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   	ret = devm_request_threaded_irq(dev, irq, NULL,
>   					rockchip_pcie_rc_sys_irq_thread,
>   					IRQF_ONESHOT, "pcie-sys-rc", rockchip);
> -	if (ret) {
> -		dev_err(dev, "failed to request PCIe sys IRQ\n");
> +	if (ret)
>   		return ret;
> -	}
>   
>   	/* LTSSM enable control mode */
>   	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
> @@ -764,10 +762,8 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>   	ret = devm_request_threaded_irq(dev, irq, NULL,
>   					rockchip_pcie_ep_sys_irq_thread,
>   					IRQF_ONESHOT, "pcie-sys-ep", rockchip);
> -	if (ret) {
> -		dev_err(dev, "failed to request PCIe sys IRQ\n");
> +	if (ret)
>   		return ret;
> -	}
>   
>   	/*
>   	 * LTSSM enable control mode, and automatically delay link training on


