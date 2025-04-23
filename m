Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13DCC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QkUHWrrRsbgwVuGJvlBbxO6cfRY8uSV95tNc6tCSZw=; b=Gtif+1yQnpk60DpMfNdIVtzOA/
	jQCy+Qb+kQKcSoMVTZbUpbe/qZeLNkPTlFOIlHzgpL6ZkO9gQZLYOdcgI+uKYnfDwl2a+i9OvksUf
	kN1jYqJt30Ygpaj7n6UP8uMxXgsdonHGlW22wjhk0dj8ERLNtgMT6owoiXyG7pDImNYhyTK3Cxfah
	d+DYiASES4y8SR8+Cx3SJy3pCphRV7NqEZqm6ae74gz+Cq7QrJrorCwdPF+INpVobQH8AD6YgWQw/
	VzOjEfkO7PJuChadBfdLJsEXngUyZNSh6ZYjyxWf1swesXjmEQS3W2+TVBcDbOJQLcNWtXiZCNpWe
	fnKSWcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OXc-00000008wAL-0UtV;
	Wed, 23 Apr 2025 01:04:44 +0000
Received: from mail-m32100.qiye.163.com ([220.197.32.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OTl-00000008vYH-1XQW;
	Wed, 23 Apr 2025 01:00:47 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 12c84bfa6;
	Wed, 23 Apr 2025 09:00:33 +0800 (GMT+08:00)
Message-ID: <4c00fce8-f148-c222-e0c1-e932f04bead0@rock-chips.com>
Date: Wed, 23 Apr 2025 09:00:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, Dragan Simic <dsimic@manjaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Fix function call sequence in
 rockchip_pcie_phy_deinit
To: Diederik de Haas <didi.debian@cknow.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
References: <20250417142138.1377451-1-didi.debian@cknow.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250417142138.1377451-1-didi.debian@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhhMSVYdH0NJTU9LT0hJQ0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9660292c4d09cckunm12c84bfa6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxA6MQw4NjJDS0g4KRBOPgkr
	DzoKCQ1VSlVKTE9OSExLS0hPTExOVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlITUg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=h9tOvoj3hPT5WazN6NPH16KOTyYFb7W7Mubm3RWn2bfWOK9GADUVp15NwbrISzsiN+Ip3ufHh/zwQ9bg/lWixhRSBE8+fi4aPKJ9olJJKjTihi2IQ/+CTPJ5ZK5i1glMnRlWWDqGR5hDO9PVZPupk4VWVLnyNDff0BAlxu0rAIc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2QkUHWrrRsbgwVuGJvlBbxO6cfRY8uSV95tNc6tCSZw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_180045_862387_1DF11689 
X-CRM114-Status: GOOD (  13.45  )
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

在 2025/04/17 星期四 22:21, Diederik de Haas 写道:
> The documentation for the phy_power_off() function explicitly says
> 
>    Must be called before phy_exit().
> 
> So let's follow that instruction.

Thanks for this fixing.

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> Cc: stable@vger.kernel.org	# v5.15+
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index c624b7ebd118..4f92639650e3 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -410,8 +410,8 @@ static int rockchip_pcie_phy_init(struct rockchip_pcie *rockchip)
>   
>   static void rockchip_pcie_phy_deinit(struct rockchip_pcie *rockchip)
>   {
> -	phy_exit(rockchip->phy);
>   	phy_power_off(rockchip->phy);
> +	phy_exit(rockchip->phy);
>   }
>   
>   static const struct dw_pcie_ops dw_pcie_ops = {

