Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09123CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO8OiE3oPK2BXfQ71EAQVoAAmLr86e+akm6hPKvxYiw=; b=M1GwJYXeaRkNek11Wiqni2YHyc
	JDfxr5c5hFJPQKkwLCDlpt4RvbS+HgDqY54YKmZZVgNYYgQ/RRkSdb6Z3anu8uUruc2bD6Wk0nUTa
	BLXHktLilrzcE23JCloShNCC4eiDuaMPwtOdl1LptJKzmlNLGRAO/GGwnKg56Fht/j1WZ8vvp3a7L
	SYMkC4Ryppgr1T5g2Ledm+dFXr7XZl+t2tzzj4aMSIxYzE5hgodxky+UhI9te0bjZ6eLFyHaFRj59
	PlR/eKsu3hASva/NoAQ+RB+iYrwAgPyYkB4m2YvJTvd1letc2XSa0wprzm7GSupcjShQXVmDGXuG1
	nrc18TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8sl-0000000BV1t-06HI;
	Thu, 04 Sep 2025 12:16:03 +0000
Received: from mail-m49213.qiye.163.com ([45.254.49.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7fa-0000000B3Of-1lqJ;
	Thu, 04 Sep 2025 10:58:24 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 21b2ecee9;
	Thu, 4 Sep 2025 18:58:13 +0800 (GMT+08:00)
Message-ID: <b0f9d781-6b8f-49dd-bfa1-456a26d01290@rock-chips.com>
Date: Thu, 4 Sep 2025 18:58:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't contain
 invalid address
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Simon Horman <horms@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250904031222.40953-3-ziyao@disroot.org>
 <20250904103443.GH372207@horms.kernel.org>
 <aLluvYQ-i-Z9vyp7@shell.armlinux.org.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aLluvYQ-i-Z9vyp7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a991460843203abkunm7caaa1364336ff
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktCT1ZOGEtOSEJLSE0dTEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dnmK9/UPjJ1KtwkXs3RJue/a/vLG/YZOsysbscDZnwQNDQ5c4C0amKOXSiZUmTfNj8kHxAwVGhJt7sRb1ow7t8d3Ekv6iAXbCUl6eiSd+h5CO81xKVPLvWmod1zbw4ATKS+DhKoAd5OkjF+3GaDMCJC5hwrLGmZOR2S/m/p7nWI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=oO8OiE3oPK2BXfQ71EAQVoAAmLr86e+akm6hPKvxYiw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_035823_128064_191EE1D2 
X-CRM114-Status: GOOD (  14.59  )
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


On 9/4/2025 6:49 PM, Russell King (Oracle) wrote:
> On Thu, Sep 04, 2025 at 11:34:43AM +0100, Simon Horman wrote:
>> Thanks, and sorry for my early confusion about applying this patch.
>>
>> I agree that the bug you point out is addressed by this patch.
>> Although I wonder if it is cleaner not to set bsp_priv->clk_phy
>> unless there is no error, rather than setting it then resetting
>> it if there is an error.
> +1 !
>
>> More importantly, I wonder if there is another bug: does clk_set_rate need
>> to be called in the case where there is no error and bsp_priv->integrated_phy
>> is false?
> I think there's another issue:
>
> static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
> {
> ...
>          if (plat->phy_node) {
>                  bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
> ...
>
> static void rk_gmac_remove(struct platform_device *pdev)
> {
> ...
>          if (priv->plat->phy_node && bsp_priv->integrated_phy)
>                  clk_put(bsp_priv->clk_phy);
>
> So if bsp_priv->integrated_phy is false, then we get the clock but
> don't put it.

Yes! Just remove "bsp_priv->integrated_phy"


