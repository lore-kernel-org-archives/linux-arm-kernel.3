Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85718C9831F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLR8QFqcweNoBabCI2gmZkdvhDevgWUn23kxeWcLmUE=; b=XlUBih8+bHtjGLJ0bnS1fSv32r
	g8HYKaGHLNCa+3t5tmgyPsqXkV5ZCJSJlrsSLLpBeK3kcDIA8M8rwz70HBzCJaW3JW1EfEbEeCFmA
	uTf+0bys9g8fTKOgOJXx2saZ0h1yhwIzcL4Fabjzgaw7sG2zoF/T02+zdpkwz8bGxTuKF+jgTJ4rM
	WUkKfhDy/Z5ZEyVJnFkR0BhMBZTE3v51Nt8RoWwJiiqvCyXQq9tZValO9QEUS0U4ahX4VE9iwIgv+
	Zwzj2f6u8+qXkCeRoIWlCAKpt4IL3Nx6kFiljVepHaYo9K2I0QR/v++y+zGFvR1GvgkQEBRhBoeSp
	PI/XrvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pwR-0000000C84G-0TJW;
	Thu, 24 Sep 2026 20:21:15 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pwJ-0000000C82d-36M7;
	Thu, 24 Sep 2026 20:21:14 +0000
Received: from [192.168.2.104] (91.78.17.141) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 24 Sep
 2026 23:20:57 +0300
Message-ID: <dda8d4cb-1c3e-4f6e-8d20-14e453effda2@auroraos.dev>
Date: Thu, 24 Sep 2026 23:20:57 +0300
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
 <d07cb609-ca44-46aa-bd56-2554846399f6@auroraos.dev>
 <CAPx+jO-c_w55jO9i_Db459Ya+9yV3nT3akQcaPxr0qb7TqSejQ@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <CAPx+jO-c_w55jO9i_Db459Ya+9yV3nT3akQcaPxr0qb7TqSejQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [91.78.17.141]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_132107_784037_29B2B150 
X-CRM114-Status: GOOD (  19.68  )
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

On 9/24/26 11:48 AM, Ulf Hansson wrote:

[...]

>>>> In rockchip_pm_add_one_domain(), there's the check (most probably for
>>>> the case where the "reg" prop has an unexpected value?) which doesn't
>>>> make much sense as the variable pd_info will be NULL iff pmu->info->
>>>> domain_info is NULL and the variable id is 0.  What does make sense
>>>> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
>>>> seems to follow from the code) can't both be 0 for a valid domain...
>>>>
>>>> Found by Linux Verification Center (linuxtesting.org) with the Svace
>>>> static analysis tool.
>>>>
>>>> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
>>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
>>>
>>> Applied for next, but without the fixes tag, thanks!

   One detail I've just remembered about: if the patch won't be backported to
the stable kernels, it would be easier to just check rockchip_domain_info::name
for NULL instead of the {pwr,req}_mask fields checked by the patch; this field
seems to always be set for all domains the driver cares about, it just was added
in 5.14-rc1 (I think), see this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0a69452e03564c5eaf99f729de398cd94ee90851

>>> Note, that I am dropping the fixes tag because if there was a real
>>> problem, we would require yet another fix on top to get the

   The problem can (probably) happen iff a device tree has a domain # in
the "reg" property that the driver doesn't care about -- in this case the
.{pwr,req}_mask fields (and .name as well) will both be 0 (since IIRC a
C compiler should set not explicitly initialized entried to 0). My patch
was intended for checking for the domain #s that the driver doesn't care
about (and so doesn't init in the *_pm_domains[] definitions, not for the
validity of the domains it does care about; try looking at at e.g.
include/dt-bindings/power/px30-power.h and you'll see that the "valid"
domains start at 5 (and the domain #s are not even contiguous as e.g.
PX30_PD_{CRYPTO,DDR} indices remain uninitialized)...

>>> corresponding domain declaration to be correct. Yet, the patch is
>>> useful as is!  >>>>    I'm not sure I understand you. The patch should hopefully be
>> enough to detect the undefined entries (implicitly init'ed with
>> all 0s). What fix for the domain definitions do you have in mind,
>> turning the arrays into lookup tables by adding a domain ID as a
>> field to *struct* rockchip_domain_info?
> 
> Apologize if I was vague, but you kind of point out what I just said.
> 
> The patch helps us to *detect* incorrect entries. If it turns out we
> find one, we need to fix that entry.

   No, the intent was not to detect the improperly initialized entries but
to verify the supplied DT is correct; I suppose this was the intention of
the original (bogus) check in rockchip_pm_add_one_domain()...

> Kind regards
> Uffe

MBR, Sergey


