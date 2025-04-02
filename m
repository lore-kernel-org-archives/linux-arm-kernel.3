Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6E2C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNpsgBqjJ9UNRLTVKNe5wOYMfZoRUBD/vq55ueB1bPY=; b=nH8RB2sQnB6zYsBrxgj8PTecC9
	hU73WYwWQBCkI++x2klnpJW0kZAu0the1xycHdN8pVkY35NnYiTW71nclJ9mIMMsxMFiTUAbnr++9
	LQN7hWaylrX5XoBJM9/9cP6P+q11Mz7L8+aD/hHpRlVVSt0zmZT3fShl8khoi164F81Fel+lhfWnt
	WuBPmq72jGDCox9/qNCvPEAgFMGZfUfkVM85KdGwDua1Qo3C5sq/4J3dKmwfGxicdN0e9rCRsbUij
	4eIMhElW22BiBEncEJ9gJMeHHNPvXfQ/+eKoc/RtknSaRuLQdiGmxAfW7T1MhK2sBjR5JVpgFcZsD
	8cNeBMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzt9m-00000005UQM-20PV;
	Wed, 02 Apr 2025 08:09:06 +0000
Received: from mail-m32116.qiye.163.com ([220.197.32.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzt80-00000005U78-38VN;
	Wed, 02 Apr 2025 08:07:18 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10721275b;
	Wed, 2 Apr 2025 16:06:59 +0800 (GMT+08:00)
Message-ID: <e340a408-2e21-1bca-7267-46b84690f66f@rock-chips.com>
Date: Wed, 2 Apr 2025 16:06:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kwilczynski@kernel.org>, linux-pci@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
To: Jensen Huang <jensenhuang@friendlyarm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Anand Moon <linux.amoon@gmail.com>
References: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh0aQ1YdTE4aSB1IGhhPQkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95f58a0bdb09cckunm10721275b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46SDo*HTIBCw49PC8JDjEi
	PQsaFE1VSlVKTE9ITkNKSUlKTkxKVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlMSkk3Bg++
DKIM-Signature: a=rsa-sha256;
	b=ezHqbO70EDBQxmzrLCl8NxYSVUIU6/oSSOrrNjkXlFPkG0MhWO2zqfrPwMD+crfahb9VQ1m3kShzgfpQbI8wgdNEnAHGAtsDOuLtpEIdG+1QMvlGT+S5LhC/FOXk1qrMY7NsgRhBCxRrvsvg0BnAuJl1ih/3WP2Qg3lLjEQY2yE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tNpsgBqjJ9UNRLTVKNe5wOYMfZoRUBD/vq55ueB1bPY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_010717_262575_9099B82B 
X-CRM114-Status: GOOD (  16.25  )
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

在 2025/03/28 星期五 18:58, Jensen Huang 写道:
> The order of rockchip_pci_core_rsts follows the previous comments suggesting
> to avoid reordering. However, reset_control_bulk_deassert() applies resets in
> reverse, which may lead to the link downgrading to 2.5 GT/s.
> 
> This patch restores the deassert order and comments for core_rsts, introduced in
> commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").
> 
> Tested on NanoPC-T4 with Samsung 970 Pro.

Acked-by:  Shawn Lin <shawn.lin@rock-chips.com>

> 
> Fixes: 18715931a5c0 ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
> ---
>   drivers/pci/controller/pcie-rockchip.h | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 11def598534b..4f63a03d535c 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -320,11 +320,15 @@ static const char * const rockchip_pci_pm_rsts[] = {
>   	"aclk",
>   };
>   
> +/*
> + * Please don't reorder the deassert sequence of the following
> + * four reset pins.
> + */
>   static const char * const rockchip_pci_core_rsts[] = {
> -	"mgmt-sticky",
> -	"core",
> -	"mgmt",
>   	"pipe",
> +	"mgmt",
> +	"core",
> +	"mgmt-sticky",
>   };
>   
>   struct rockchip_pcie {

