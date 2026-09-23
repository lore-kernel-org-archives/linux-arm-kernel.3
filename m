Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C907CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aiZWmdegDEMLNwfdudkcT4ZX/9vMQLrUpbAYbBQ6lw=; b=JoG2xSOuE8HtlGRHFWaTYPLYXR
	A8X5W8Jgq31meBViuxCBGlfgucO8nuDES58Zd8CnsL7fKg/d9eccPOAgz7wxzNqKAyfEQn+xT+RsB
	ICIe06ep9SHwqfLhkw0FX4Z6sm2XeD2wp9MbnNev8vg1krDyNxE2xJ2WY2IRxSJcU72zbnvDWzf94
	sz3ivfJ78M57CyEYx2mkKvRzKZQE9uQ8J9KP2uSzQzGaODJGujB5xHRmEF2XdaYouffJKPOSMCLyv
	fN6W7kd9aIW2nfYF4/aeockbPk/MTF3VnTiDyYOxqYjMnCrW1UBxn+80apCx2oTnDfBq8dWzUrCba
	nCeIR2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tpk-00000009Une-1uCg;
	Wed, 23 Sep 2026 20:44:52 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tph-00000009Un5-3blv;
	Wed, 23 Sep 2026 20:44:51 +0000
Received: from [192.168.2.104] (91.78.46.39) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 23 Sep
 2026 23:44:46 +0300
Message-ID: <eae7ec74-5b90-4258-9576-159c700bd8f4@auroraos.dev>
Date: Wed, 23 Sep 2026 23:44:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: rockchip: fix domain check in
 rockchip_pm_add_one_domain()
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
CC: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-pm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>, Caesar Wang
	<wxt@rock-chips.com>, Kevin Hilman <khilman@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
 <CAPx+jO-Ph038WJQ4gMH93XzoMC09+meht=yT9JQBAnTD6HzGEg@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <CAPx+jO-Ph038WJQ4gMH93XzoMC09+meht=yT9JQBAnTD6HzGEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [91.78.46.39]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_134449_905990_C365056F 
X-CRM114-Status: GOOD (  12.11  )
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

On 9/23/26 3:14 PM, Ulf Hansson wrote:
[...]

>> In rockchip_pm_add_one_domain(), there's the check (most probably for
>> the case where the "reg" prop has an unexpected value?) which doesn't
>> make much sense as the variable pd_info will be NULL iff pmu->info->
>> domain_info is NULL and the variable id is 0.  What does make sense
>> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
>> seems to follow from the code) can't both be 0 for a valid domain...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace
>> static analysis tool.
>>
>> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> 
> Applied for next, but without the fixes tag, thanks!
> 
> Note, that I am dropping the fixes tag because if there was a real
> problem, we would require yet another fix on top to get the
> corresponding domain declaration to be correct. Yet, the patch is
> useful as is!

   I was thinking of doing a more elaborate description but if you
considered it good enough, OK... :-)

> Kind regards
> Uffe
[...]

MBR, Sergey


