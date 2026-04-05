Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC724E9D826
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+3GpbRroDEsaYbjyzLr+o1XWCEL4kj4mK45WwiU6FI=; b=G+mI+1cf1sSbn/BbTQdB5o2paC
	A6U8OU+Q1Ev7p2eoVlIABF/p0Tg4g9MR/+rfe7ZIiKqvKQCMWn8LgQA875y3D2k+AdFuW9l5KLx/d
	We8kuc+sK6+biMuzvURr3S2cTogPYcASgAxXNZ8wLMzDa2dp+pep91o7ELi719QJjk3rjxgHv3vVu
	tCsAck//29mGeBbK+NG4UClM8N+vAFTxtISgZfz61GMCSUyAllesvQtfqDsoMKu3dZGwogRak+QxX
	WYQbr+nmUx30D2nMoR4umOcFo1jbpRXIsDj8ZoB7EqoVnYAqy70V648p8Y9khPs/eeGvTTgtbSedY
	WjYfZM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Wue-00000004Yds-29j2;
	Sun, 05 Apr 2026 23:29:52 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Wub-00000004Yd5-2ca8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 23:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: Cc:
 References: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1775431787;
 bh=j+3GpbRroDEsaYbjyzLr+o1XWCEL4kj4mK45WwiU6FI=;
 b=ERIz7F8wsX5P/sme0ipvxYAa1OOzZmPjJ7AKgr/3m0uwN93OL5Av7Xpo4FKdqc7OR0Ifzl+bm
 xWy7IUmRZ21cKh7ZMadTIxL0M0vMo7kZ47FeTZR84EOVT4Zy9GUjAoaVwCI45Q0LyTH6QKktBDp
 eTTO4iXOV5QMNGAm9jm/HNRidsAHVnndRzue853afcgK9bt6zvbEAcb+TGo417u2mSY1OZIRnQC
 DSyDbP1HxjMBOMyu40tLfBpH8Octki4n2LsjnuKX9GYzpKud7kA3lwKInEL+RrJ+4uf+kMhGVJ5
 M84K9Z593N0XG/N6fqk++/sFs8TCuntJsCCmclQvui/g==
X-Forward-Email-ID: 69d2f061e23c9321167a0c52
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.68
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <693c6c27-6ff2-4ab0-994f-3821e5ffcec8@kwiboo.se>
Date: Mon, 6 Apr 2026 01:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
To: Shawn Lin <shawn.lin@rock-chips.com>, Daniel Bozeman <daniel@orb.net>,
 "finley.xiao@rock-chips.com" <finley.xiao@rock-chips.com>
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
 <adAwtiaU-32qjRRE@claude-dev>
 <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
Content-Language: en-US
Cc: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_162949_972900_8B0712C5 
X-CRM114-Status: GOOD (  23.62  )
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

Hi,

On 4/4/2026 1:40 PM, Shawn Lin wrote:
> + Jonas
> 
> 在 2026/04/04 星期六 5:27, Daniel Bozeman 写道:
>> I ran both tests you requested:
>>
>> Test 1: Added pr_err to rockchip_pd_power_on/off to identify
>> the crashing domain. With patch 2 only (skip EPROBE_DEFER),
>> the crash occurs on PD_VO:
> 
> Thanks for fing the PD_VO, and I'm still requesting more docs internally
> to check what's going on. I see there are several qos nodes under PD_VO,
> but I'm not sure if they all belong to PD_VO and even not sure if their
> registers are define correctly.
> 
> Perhaps, could you help dig more by removing the qos one by one from
> PD_VO to narrow down the broken qos?
> 
> I also loop in Jonas who submited the code, to have a look.(I'm  also
> surprised to see there aren't any Qos nodes under PD_VO in vendor
> kernel for reference, but upstream code has...)

Upstream included all QoS that seemed to be related to each power domains
based on e.g. vendor DTs, clock driver and other hints.

Vendor kernel mostly seemed to take the easy way out and flagged all
rk3528 power domains as always on or similar, if I recall correctly.

For upstream we have instead tried to describe all power domains without
any always on flag and instead ensure all devices belong to a power
domain.

I do not have access to any rk3528 TRM or similar, so I would not be
surprised if there could be some wrong details. However, runtime
testing at time of patches was sent upstream did not show any issues.

I was however able to reproduce a crash using next-20260403 + rk3528 usb
series [1][2]. Such crash was not happening at the original submission
of the pmdomain or usb series.

Looking at pmdomain core and rk pmdomain driver changes since rk3528
merge I see that there are some changes that may have changed behavior
of the driver since initial rk3528 merge. I.e. GENPD_FLAG_NO_STAY_ON.

Following quick diff seem to remove any changed behavior introduced in
commit 2bc12a8199a0 ("pmdomain: rockchip: Fix regulator dependency with
GENPD_FLAG_NO_STAY_ON"), and fixes the crash for me.

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 490bbb1d1d8e..4d69b9f68886 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -892,7 +892,9 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	pd->genpd.power_on = rockchip_pd_power_on;
 	pd->genpd.attach_dev = rockchip_pd_attach_dev;
 	pd->genpd.detach_dev = rockchip_pd_detach_dev;
-	pd->genpd.flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_NO_STAY_ON;
+	pd->genpd.flags = GENPD_FLAG_PM_CLK;
+	if (pd->info->pwr_mask || pd->info->status_mask)
+		pd->genpd.flags |= GENPD_FLAG_NO_STAY_ON;
 	if (pd_info->active_wakeup)
 		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
 	pm_genpd_init(&pd->genpd, NULL,

Could also be that GENPD_FLAG_NO_STAY_ON only need to be applied to
need_regulator domains?

[1] https://lore.kernel.org/r/20250723122323.2344916-1-jonas@kwiboo.se/
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20260403-rk3528/

Regards,
Jonas

> 
>>
>>    rockchip_pd_power_off: vo pwr_mask=0x0
>>    Internal error: synchronous external abort: 0000000096000010
>>    Workqueue: pm genpd_power_off_work_fn
>>    Call trace:
>>     regmap_mmio_read32le+0x8/0x20
>>     _regmap_bus_reg_read+0x6c/0xac
>>     _regmap_read+0x60/0xd8
>>     regmap_read+0x4c/0x7c
>>     rockchip_pmu_set_idle_request.isra.0+0x98/0x16c
>>     rockchip_pd_power+0x130/0x48c
>>     rockchip_pd_power_off+0x38/0x48
>>     genpd_power_off.isra.0+0x1f0/0x2f0
>>     genpd_power_off_work_fn+0x34/0x54
>>
>> Test 2: Same debug build, booted with clk_ignore_unused
>> added to kernel cmdline via U-Boot. Same crash, same domain:
>>
>>    rockchip_pd_power_off: vo pwr_mask=0x0
>>    Internal error: synchronous external abort: 0000000096000010
>>    (identical call trace)
>>
>> The crash occurs even with clk_ignore_unused. The QoS
>> registers for PD_VO are inaccessible when genpd attempts
>> to power off this idle-only domain.
>>


