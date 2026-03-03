Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C987EB3649
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mjquj/FOs/2Zx2idcFz2Tunmyq43QxK3eJDgddxDoi8=; b=pN3TApSYdEKu/yrVOTV7ikjSju
	7Xffrnm86RBieKsRg75tA1KX3iKWda0Nq1/jar5dLKvUGt/tE7EdVxOhSTbpm9jJyX2hKbFtL+vl0
	qnpHTCPKLigh9Xbyy5a9kMCD1aqn0SlwZhAxNK6J21c2zH5RzMTMvgDcoKI/c1EcONMZlRtTAUUkt
	boQ6oHEjwm64DrDqkNRF2JwTlfOvMD+6Ya3VrVdQUuXXLj+eX+T85QuyB3miuGta3/cK4/e56cf95
	0E8VUYkKiyI9eZxC2nM6UzRnyErdXCXXWL0IBPioBOCd3kV4wfds6AShOhBkzhLAdV3r0p73dLLgX
	uoX0VkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxE8R-0000000EIWF-1yW0;
	Tue, 03 Mar 2026 01:01:15 +0000
Received: from mail-m3290.qiye.163.com ([220.197.32.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxE8N-0000000EIVN-395X;
	Tue, 03 Mar 2026 01:01:13 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3581f17ca;
	Tue, 3 Mar 2026 09:01:06 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Grimmauld <grimmauld@grimmauld.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Anand Moon <linux.amoon@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <560f75f3-e82c-4825-554d-5ead1ae353ee@rock-chips.com>
Date: Tue, 3 Mar 2026 09:01:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260226101032.1042-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cb136851009cckunmdf53aed31047c16
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk5OGVZJQkgeThgfSR0eQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=EJ2lQYLnZonrbwDR82koQeFF/FTrJdyirHy0znOoWno2PaizrLLmn9wiRPAorVoGNm5aMOGr51u90sWqjI18XzoPbg0uPGF/OQs5cXl1vmH5IMww5arnP+YNG7hzp0Lhr6/hR6egU1kwA2q1TjO6vH1WwFenyNGHI1NOLoA9EPw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Mjquj/FOs/2Zx2idcFz2Tunmyq43QxK3eJDgddxDoi8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170112_305741_6EBE8021 
X-CRM114-Status: GOOD (  18.58  )
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

在 2026/02/26 星期四 18:10, Anand Moon 写道:
> Rockchip DWC PCIe driver currently performs synchronous link training for
> combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> the link to be fully established, adding several milliseconds to the boot
> sequence. To optimize boot time, this change enables asynchronous probing,
> allowing link establishment to proceed in the background while the kernel
> continues probing other devices.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Cc: Grimmauld <grimmauld@grimmauld.de>
> Cc: Niklas Cassel <cassel@kernel.org>
> Tested-by: Grimmauld <grimmauld@grimmauld.de>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: update the commit message to describe the changs.
>      added tested by Grimmauld.
>      https://lore.kernel.org/all/20240809073610.2517-1-linux.amoon@gmail.com/
> v2: update the commit message to describe the changs.
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 5b17da63151d5..c31e0e9848327 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -746,6 +746,7 @@ static struct platform_driver rockchip_pcie_driver = {
>   		.name	= "rockchip-dw-pcie",
>   		.of_match_table = rockchip_pcie_of_match,
>   		.suppress_bind_attrs = true,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>   	},
>   	.probe = rockchip_pcie_probe,
>   };
> 
> base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
> 

