Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3499C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciqB0EMUWYtSXZvJr4v072Tk0l7xHOtHqREC+ibJzyU=; b=UV8jZK+4K7rJmjr0oUUuVbE9sO
	Jw2tk9VemxbaBsctJEGTVSvbtxVaKA3irqol+bmzTGpWd0iayGyejqVf+JxYnIbHqeObj96a6OoaP
	5p/bEWMCgQe5/hMr2ZLnlV3oIwC+/bMIUf9omh9ibHjC3aCXeHVunDFYf3ucDizHcgo+L+GuX8tvv
	G9XPPGBkPpSo3i6eAKnJ/J03LEFRA6SU28bHiBeEE2FAOnW2CuO56LM7uPBVLsq8DLcVoaD9L7DKh
	YzcX0DqxyKfgUXeoH/ee3TkVo5CZb5IDeUnNwgnj6INIWFUuPs2Lf2yR2VcBxm/dPtsvZwMA3sosU
	0OFsxinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gdr-00000002nIV-1tGD;
	Mon, 21 Sep 2026 16:13:19 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gdn-00000002nH9-3w6u;
	Mon, 21 Sep 2026 16:13:17 +0000
Received: from [192.168.2.104] (91.79.36.28) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 21 Sep
 2026 19:13:04 +0300
Message-ID: <140e4538-d493-40a7-a682-00be091332f0@auroraos.dev>
Date: Mon, 21 Sep 2026 19:13:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: rockchip: fix domain check in
 rockchip_pm_add_one_domain()
To: Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, <linux-pm@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>
CC: Caesar Wang <wxt@rock-chips.com>, Kevin Hilman <khilman@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
 <ee8bf4cf-b2bd-4cbd-ba8c-2e7a871203e1@rock-chips.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <ee8bf4cf-b2bd-4cbd-ba8c-2e7a871203e1@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [91.79.36.28]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_091315_981390_BB6C98DC 
X-CRM114-Status: GOOD (  14.34  )
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

On 9/21/26 9:36 AM, Shawn Lin wrote:

[...]

>> In rockchip_pm_add_one_domain(), there's the check (most probably for
>> the case where the "reg" prop has an unexpected value?) which doesn't
> 
> Agreed that check indeed makes little sense. But "most probably for the
> case where the reg prop has an unexpected value" does not hold: an

   I tried to guess what the check in question was actually intended for
(despite making a little sense as it is now)...

> out-of-range reg value is already rejected by the "id >= pmu->info-
>>num_domains" check above, and num_domains equals

   I noticed. :-)

> ARRAY_SIZE(domain_info) for every SoC, so there are no holes in the
> table that the new check could catch with the current data. AFAICT, this

   Oh, there are holes! :-)
   If you look at (and behind) the indexed initializers of *_pm_domains[],
you'll see that the indexes don't always start at 0, and so the arrays are
actually sparse...

> patch does not change any runtime behaviour; it only turns dead code
> into a defensive check on the match-data tables.

   I hope you see now that this defensive check makes a bit more sense...

>> make much sense as the variable pd_info will be NULL iff pmu->info->
>> domain_info is NULL and the variable id is 0.  What does make sense
>> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
>> seems to follow from the code) can't both be 0 for a valid domain...
> 
> That means there is no bug being fixed here, should we drop the fixes tag?

   I'd like to keep it (but that's up to the maintainers, of course)...

>> Found by Linux Verification Center (linuxtesting.org) with the Svace
>> static analysis tool.
>>
>> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

[...]

MBR, Sergey


