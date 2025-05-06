Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB62C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWCDoJQT9MFyFtLgnPCusrmwJX5toolzN2AmOgmAr0M=; b=RtPzuPSehiYvsh9fHLd4e6xVvL
	ZtKyz57Gyzue3omTo+FPNm6ILGgO5zoeBFgW+PBGzgaovo6xMDUc36hivBzrgssyVXqgOawvIvRSo
	Kcsj6HpOhUOBhyQaBO+hyFe6oxiV2AlJkfsLn/bN5WOcmwYAwWHTiE/sDP7cfSUYned80b0HUfGhj
	yFzve+LaFgYGcQ+mWEwL5d+vlQC3BaY/c9+SBSVXqabkxVJ9jFzgNLOGd5ssmYFo9uMiGoMSc6q7i
	hmg2d5u4cVniWt2hcLXQTXTeTm8Jfv80kTt6U/3tY0W3ilTCt4V13DhkAx3a9U1JEmiHdwQ4VLuVK
	wakWhpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFSA-0000000BYO3-1xFe;
	Tue, 06 May 2025 10:23:10 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEHV-0000000BHPW-1oIs;
	Tue, 06 May 2025 09:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=MWCDoJQT9MFyFtLgnPCusrmwJX5toolzN2AmOgmAr0M=;
	b=ddM0Sm/O7xY63uIsMd/bqv3ltc6EXUQwACxI5oSi1Z79mMYzbqsB1fWndiFvfs
	SISR50SsLMZjKrwAXC6cECBp6a3ApqVmgSnXxnthA8mJSp5YQ8Hadp85FnV4cyUx
	KIsM4eaa7kUcPuJWJXeEy1YMLtwSwH1OjH4Aa9225sRcE=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnpyw80RloFadeEw--.56664S2;
	Tue, 06 May 2025 17:07:10 +0800 (CST)
Message-ID: <cce17611-edba-42a4-8755-d227eafc0648@163.com>
Date: Tue, 6 May 2025 17:07:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: dw-rockchip: Replace PERST sleep time with
 proper macro
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Damien Le Moal <dlemoal@kernel.org>, Laszlo Fiat <laszlo.fiat@proton.me>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250506073934.433176-6-cassel@kernel.org>
 <20250506073934.433176-9-cassel@kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250506073934.433176-9-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wAnpyw80RloFadeEw--.56664S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1rWw4kAw45XrW8Gw4Durg_yoWDWFgE93
	4kWr47Zr4DGrZ3Cr1jk34xJrZ0ya47Wr18WayFqFnxZF17Xr18JryrXrs0qFn8KrsxArZ3
	Kr1qvr40kFyxXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjX4S7UUUUU==
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhJFo2gZvJMH3QACsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020805_821851_5DE13B8C 
X-CRM114-Status: GOOD (  13.83  )
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



On 2025/5/6 15:39, Niklas Cassel wrote:
> Replace the PERST sleep time with the proper macro (PCIE_T_PVPERL_MS).
> No functional change.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 6a7ec3545a7f..0baf9da3ac1c 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -225,7 +225,7 @@ static int rockchip_pcie_start_link(struct dw_pcie *pci)
>   	 * We need more extra time as before, rather than setting just
>   	 * 100us as we don't know how long should the device need to reset.
>   	 */
> -	msleep(100);
> +	msleep(PCIE_T_PVPERL_MS);
>   	gpiod_set_value_cansleep(rockchip->rst_gpio, 1);
>   
>   	return 0;

Reviewed-by: Hans Zhang <18255117159@163.com>

Best regards,
Hans


