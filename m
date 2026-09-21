Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEDEC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLpwACqn9YN+hnHNFYXY6u+qLT2vyykvPNkreQhWJbE=; b=sZ2+8rtP4SyKCNkim8cjJrmyMh
	0Er63yM51RPxjQQRDBey1tAnJN6peag7dTyQ/PnU/JljJmI9lnljtyxWTPLoI8dSRnCG3O/yQ0j25
	ri59l8NqYZrA6kPfJZ30tcIEF2OAU5HaA5KeBDmG8gKT5PivLsNgEReeDyf7JmOdi3rwb8ScHLJVx
	c20pH8eOvKpptf+Ktq9MiH4IVMlMkd3wd11vTOeHFS+8vifrttO+FWS4AQs5QAjxvt0Ra178d5tDR
	0xTExzz4bbT2kssC7rmEAi8y3QAZYk8h9SaTw8Z7waaIhD+JltZgxcTAz1W15Vt72RkwIcfsVZnFw
	/wtakstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xdl-000000012iF-41t4;
	Mon, 21 Sep 2026 06:36:37 +0000
Received: from mail-m83103.xmail.ntesmail.com ([156.224.83.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xdi-000000012g6-07yU;
	Mon, 21 Sep 2026 06:36:36 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e87e853c;
	Mon, 21 Sep 2026 14:36:26 +0800 (GMT+08:00)
Message-ID: <ee8bf4cf-b2bd-4cbd-ba8c-2e7a871203e1@rock-chips.com>
Date: Mon, 21 Sep 2026 14:36:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Caesar Wang <wxt@rock-chips.com>,
 Kevin Hilman <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pmdomain: rockchip: fix domain check in
 rockchip_pm_add_one_domain()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Ulf Hansson <ulfh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c2ae1f1d03a4kunm8c2b5e35309363
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhhJVksdTE1CHxlISk9CGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kMQEIk5wm+g8UmyBDt3/0JnReaXCZVItYbM0nLAQDOdsl62qdaAqKGEa9njMr3zell849z8plW8LVvvLMDQK3kvxBFs+652EswyGO8aFqRiabnIN5D6z0jKvhXzwjbhkJJ+T9Ml3JCJMH/1VArRIWJMeOR2AnWpZRHzw0brBHAo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=bLpwACqn9YN+hnHNFYXY6u+qLT2vyykvPNkreQhWJbE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233634_340200_97CE32FE 
X-CRM114-Status: GOOD (  21.07  )
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

Hi Sergey,

在 2026/09/21 星期一 1:59, Sergey Shtylyov 写道:
> In rockchip_pm_add_one_domain(), there's the check (most probably for
> the case where the "reg" prop has an unexpected value?) which doesn't

Agreed that check indeed makes little sense. But "most probably for the
case where the reg prop has an unexpected value" does not hold: an 
out-of-range reg value is already rejected by the "id >= pmu->info-
 >num_domains" check above, and num_domains equals
ARRAY_SIZE(domain_info) for every SoC, so there are no holes in the
table that the new check could catch with the current data. AFAICT, this 
patch does not change any runtime behaviour; it only turns dead code
into a defensive check on the match-data tables.


> make much sense as the variable pd_info will be NULL iff pmu->info->
> domain_info is NULL and the variable id is 0.  What does make sense
> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
> seems to follow from the code) can't both be 0 for a valid domain...
> 

That means there is no bug being fixed here, should we drop the fixes tag?

> Found by Linux Verification Center (linuxtesting.org) with the Svace
> static analysis tool.
> 
> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> 
> ---
> This patch is against the fixes branch of Ulf Hansson's linux-pm.git repo.
> 
>   drivers/pmdomain/rockchip/pm-domains.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index ba66ae719428..69792e2b215b 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -809,7 +809,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>   		return 0;
>   
>   	pd_info = &pmu->info->domain_info[id];
> -	if (!pd_info) {
> +	if (!pd_info->pwr_mask && !pd_info->req_mask) {
>   		dev_err(pmu->dev, "%pOFn: undefined domain id %d\n",
>   			node, id);
>   		return -EINVAL;


