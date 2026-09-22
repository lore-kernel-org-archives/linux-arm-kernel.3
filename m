Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C06C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ghe12W3xx27L6Gp05sVA/Am+5fUdjvtLgHXnKRFlSdc=; b=WjO4it28r2QM7tXEGWUO4MDoEx
	8xKVkXL3JosfLMLfqX6KML+XFKXR65FfGlqeUkQnfjhFRJ6CRK/4BaBLiliPPV2D2hjLFZNWt+zHL
	RI8uGnRB5UUECC2IYCAFhMa89A7CozRKHqSPFJFl62NzpAsWtPwd+VAJzVZrdeuVO5Um68YhddLH2
	yCd6bl2M3HwHfP1yMHOfzU02TKRoHdliYQWktXnLqtG2NVg+fMGMFCGSG5cnoi4BoTw0DL/d86oMs
	YOYbWr6TwEZICotrYHYWRqN1rUqxuhe4qbzWH9rnlLZ3YWAnDxDyC2YuMk6gc9SYWGMKyccnmGsz5
	srqNPGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ofc-00000003ofA-374I;
	Tue, 22 Sep 2026 00:47:40 +0000
Received: from mail-m254100.xmail.ntesmail.com ([103.129.254.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ofZ-00000003oe4-1cxX;
	Tue, 22 Sep 2026 00:47:39 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ea2fa38f;
	Tue, 22 Sep 2026 08:47:32 +0800 (GMT+08:00)
Message-ID: <1d8950b4-315f-44a4-9fc8-fcb35ac33043@rock-chips.com>
Date: Tue, 22 Sep 2026 08:47:28 +0800
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
 <ee8bf4cf-b2bd-4cbd-ba8c-2e7a871203e1@rock-chips.com>
 <140e4538-d493-40a7-a682-00be091332f0@auroraos.dev>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <140e4538-d493-40a7-a682-00be091332f0@auroraos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c6950c8a03a4kunm3e415e16385fee
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZThhOVkIfH0lMSU0eQh5MS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=XAkuUZhYuUHOcfG+P85pveAV24xvDwuRb0lJU9e7eK/kScso69+2Lq8WQeGjE51x/7bQGcRZV5XUKSZhvQqRqjAxIVpPlT6qPlpRH4UrHKP0av1dYvr6KNibIhaFqZWfRuDeYuCq6kxOAicRpJGc08cUP8KbZW3wPY5JlufWAjU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Ghe12W3xx27L6Gp05sVA/Am+5fUdjvtLgHXnKRFlSdc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174737_936936_BEFAB575 
X-CRM114-Status: GOOD (  20.63  )
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

在 2026/09/22 星期二 0:13, Sergey Shtylyov 写道:
> On 9/21/26 9:36 AM, Shawn Lin wrote:
> 
> [...]
> 
>>> In rockchip_pm_add_one_domain(), there's the check (most probably for
>>> the case where the "reg" prop has an unexpected value?) which doesn't
>>
>> Agreed that check indeed makes little sense. But "most probably for the
>> case where the reg prop has an unexpected value" does not hold: an
> 
>     I tried to guess what the check in question was actually intended for
> (despite making a little sense as it is now)...
> 
>> out-of-range reg value is already rejected by the "id >= pmu->info-
>>> num_domains" check above, and num_domains equals
> 
>     I noticed. :-)
> 
>> ARRAY_SIZE(domain_info) for every SoC, so there are no holes in the
>> table that the new check could catch with the current data. AFAICT, this
> 
>     Oh, there are holes! :-)
>     If you look at (and behind) the indexed initializers of *_pm_domains[],
> you'll see that the indexes don't always start at 0, and so the arrays are
> actually sparse...

Looked more closely by each one, you're right.

> 
>> patch does not change any runtime behaviour; it only turns dead code
>> into a defensive check on the match-data tables.
> 
>     I hope you see now that this defensive check makes a bit more sense...
> 
>>> make much sense as the variable pd_info will be NULL iff pmu->info->
>>> domain_info is NULL and the variable id is 0.  What does make sense
>>> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
>>> seems to follow from the code) can't both be 0 for a valid domain...
>>
>> That means there is no bug being fixed here, should we drop the fixes tag?
> 
>     I'd like to keep it (but that's up to the maintainers, of course)...

Sure, it's  Ulf's call. Anyway, feel free to add

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
>>> Found by Linux Verification Center (linuxtesting.org) with the Svace
>>> static analysis tool.
>>>
>>> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> 
> [...]
> 
> MBR, Sergey
> 
> 


