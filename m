Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42A210F9311
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 01:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84tddcSLoInqnr4qLcDW/JZ/jewF+U0Wxnidmb7LaMs=; b=I4QNnFtvWWxLwH/PIcMyzFmDCH
	V0AWiGLuCKI3sLVtkXP/mgUlrDwZLL++xfzFzJtUSrtqlo+xkkJ1ko74JpqElmEJ9C7mjDz9h1v+i
	+pOc5+UmTu4rVuecp5SzcymJkNXngnkf6QjfKA0w2ryIKFlWpa474Qecup+/hifpj/AIjq2nfIizA
	HytMUZmeARJRIizoew81QrjpisNsnDtACeZ+Zr5t2J7dmEW+7rjw2ngDBYd27url6r0xM+LsUWidY
	Rvd3nFJipJE8yTdSXg7ic3/H1fUkAbeMyNnmh0DWHI2m4AhP/Y1AjSx+1gxZazAiq7bWZwDMUkQNq
	sYjsPWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7kDn-0000000Dmit-0ZLv;
	Wed, 01 Apr 2026 01:18:15 +0000
Received: from mail-m32107.qiye.163.com ([220.197.32.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7kDg-0000000Dmht-43Wl;
	Wed, 01 Apr 2026 01:18:10 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 39100b138;
	Wed, 1 Apr 2026 09:17:48 +0800 (GMT+08:00)
Message-ID: <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
Date: Wed, 1 Apr 2026 09:17:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, ulf.hansson@linaro.org, heiko@sntech.de
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
To: Daniel Bozeman <daniel@orb.net>
References: <20260331180223.1682283-1-daniel@orb.net>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260331180223.1682283-1-daniel@orb.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d469e3dd509cckunmbd42e9a8f80c51
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5OTFYeQ0pNTkpCH08dS05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NoDHYN/y933X4usXs+vkbBkTesgf6cA+1duQalmTmx8Gn1TlLa2iKxI9gxB2vzmj/EpBNVcqd2LwvQdVxfUI7IitMgL0RgSAQD273Zo83qkzWNQeo8Zr2LzW2FU09PAtpMH7/oXcg/HAIEyH9Ioq942sWk7KYCzlTLjwk6dyDZA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=84tddcSLoInqnr4qLcDW/JZ/jewF+U0Wxnidmb7LaMs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_181809_553053_A2FA462F 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Daniel,

在 2026/04/01 星期三 2:02, Daniel Bozeman 写道:
> Idle-only power domains (pwr_mask == 0) cannot actually be powered
> on or off. rockchip_do_pmu_set_power_domain() already returns early
> for these domains, but rockchip_pd_power() still attempts QoS save
> and idle requests before reaching that check.
> 
> On RK3528, the idle-only domains (PD_RKVENC, PD_VO, PD_VPU) have
> QoS registers that may be inaccessible when the generic power domain
> framework attempts to power them off, leading to synchronous external
> aborts.
> 

Is it the real abort happened on your RK3528 board? I am trying to
understand the problem first. Even with idle-only powerdomain, the code
also save the QoS registers before set idle to the powerdomain, so
how the QoS registers become inaccessible?

> Return early from rockchip_pd_power() when pwr_mask is zero, matching
> the existing guard in rockchip_do_pmu_set_power_domain().
> 
> Fixes: 1fe767a56c32 ("soc: rockchip: power-domain: allow domains only handling idle requests")
> Signed-off-by: Daniel Bozeman <daniel@orb.net>
> ---
>   drivers/pmdomain/rockchip/pm-domains.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index 490bbb1d1d..2eecae092a 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -640,6 +640,9 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
>   	if (rockchip_pmu_domain_is_on(pd) == power_on)
>   		return 0;
>   
> +	if (pd->info->pwr_mask == 0)
> +		return 0;
> +
>   	ret = clk_bulk_enable(pd->num_clks, pd->clks);
>   	if (ret < 0) {
>   		dev_err(pmu->dev, "failed to enable clocks\n");
> 
> base-commit: bc330699801d3b4f99110365512caed5adcfaca3

