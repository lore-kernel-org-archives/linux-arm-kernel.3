Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B89E88D8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppO08De5fKDNxsOEOVN6crncqIPTkWq/KYv7kgENJ/Q=; b=ANlkFrZvITlGmhmbjGDISRJvJG
	695RzwLQSe6nXX4zI/C8NS6IJnJcmmE7LZTNWgI+D0QLbn0byAgbBy9SPJgZZaXrsBRg/BsnoayHA
	LxOv4TuKTjiTVJEkGaEDzx+hZ5Wnxnjo6juB81gl9i1FnIl74/ZBA/0J/DcP+c7yZHW5Sz9ACoRU9
	EpLEyxJNZTyYrh7pu84VqcVymI/o1V+t9/57Y0+XaIyG9e8h27UKI8rulvDzZ37sKRNrbpHFcYXGk
	63nBr9rBTL169rrqlsLFsgi14zlr1u64Yu3y8yQGaXfAMy5Q2sXNVJ0cVyag8toxha376AbaLvyjG
	EZjwLXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8zN4-00000003QYZ-2dk4;
	Sat, 04 Apr 2026 11:40:58 +0000
Received: from mail-m3282.qiye.163.com ([220.197.32.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8zN0-00000003QXf-3Qqu;
	Sat, 04 Apr 2026 11:40:56 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 398ad1038;
	Sat, 4 Apr 2026 19:40:38 +0800 (GMT+08:00)
Message-ID: <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
Date: Sat, 4 Apr 2026 19:40:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
To: Daniel Bozeman <daniel@orb.net>, finley.xiao@rock-chips.com,
 ulf.hansson@linaro.org, heiko@sntech.de, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
 <adAwtiaU-32qjRRE@claude-dev>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <adAwtiaU-32qjRRE@claude-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d584b88b609cckunm47ea691a1661c0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU4dHlYaGR4fGB9MTkJCS0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BpidNjhv1rke4/4+Gu342PUGVXa/6ZvmfPqF6dwimxlCX49Zk7Ou2PEcgzRY5t/xEG3n2xQi3VE5psBA0jJqZxyO87ly6dC7+09Y8mqUxVQ63M7CsIJ1GLVrv74fR8aAZSniw6cWqns0zFrRdvv1kpu+R6SjqAfiWKk93DY54Vo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ppO08De5fKDNxsOEOVN6crncqIPTkWq/KYv7kgENJ/Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_044055_374968_85F7C774 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

+ Jonas

在 2026/04/04 星期六 5:27, Daniel Bozeman 写道:
> I ran both tests you requested:
> 
> Test 1: Added pr_err to rockchip_pd_power_on/off to identify
> the crashing domain. With patch 2 only (skip EPROBE_DEFER),
> the crash occurs on PD_VO:

Thanks for fing the PD_VO, and I'm still requesting more docs internally
to check what's going on. I see there are several qos nodes under PD_VO,
but I'm not sure if they all belong to PD_VO and even not sure if their
registers are define correctly.

Perhaps, could you help dig more by removing the qos one by one from
PD_VO to narrow down the broken qos?

I also loop in Jonas who submited the code, to have a look.(I'm  also
surprised to see there aren't any Qos nodes under PD_VO in vendor
kernel for reference, but upstream code has...)

> 
>    rockchip_pd_power_off: vo pwr_mask=0x0
>    Internal error: synchronous external abort: 0000000096000010
>    Workqueue: pm genpd_power_off_work_fn
>    Call trace:
>     regmap_mmio_read32le+0x8/0x20
>     _regmap_bus_reg_read+0x6c/0xac
>     _regmap_read+0x60/0xd8
>     regmap_read+0x4c/0x7c
>     rockchip_pmu_set_idle_request.isra.0+0x98/0x16c
>     rockchip_pd_power+0x130/0x48c
>     rockchip_pd_power_off+0x38/0x48
>     genpd_power_off.isra.0+0x1f0/0x2f0
>     genpd_power_off_work_fn+0x34/0x54
> 
> Test 2: Same debug build, booted with clk_ignore_unused
> added to kernel cmdline via U-Boot. Same crash, same domain:
> 
>    rockchip_pd_power_off: vo pwr_mask=0x0
>    Internal error: synchronous external abort: 0000000096000010
>    (identical call trace)
> 
> The crash occurs even with clk_ignore_unused. The QoS
> registers for PD_VO are inaccessible when genpd attempts
> to power off this idle-only domain.
> 

