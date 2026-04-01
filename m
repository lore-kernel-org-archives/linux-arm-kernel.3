Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FBBD3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTYD3BdeiKasj9p/65Qh1vCnQKo8NB1Gv0M28P71x98=; b=R2gM/XMDmFH2ma0WQfEWl2bVhg
	fkRs3hS2/mbt+A3gMzUrD7Zs91xCEU7KXumGckw5EEJcLZy6SwFlSfs1b3c4vnCYgztwdThf37ufx
	rPSTI3C5zUi39SDpaeQdhb6wBajib3B32D4+J5Y/C6BBNagBw98W+vsW/LX9pbYDSM9N4xpJlzR8G
	j1zPVazgt33GyW6yGu5UGfHA+HrJWAIImVaafbov2Z66UCQwcP2zgVMggYPvpTRxYJXm7dGNWkF8h
	n+LYIOljdbM34BQS5hGVcmOkAE97BqaY+PNTuXkG+XMbNe7sFwSsXgy0hz7k4kCWFG3FBpGdHp4/e
	74qZZlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pjb-0000000EAsb-3YDn;
	Wed, 01 Apr 2026 07:11:27 +0000
Received: from mail-m15581.qiye.163.com ([101.71.155.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pjY-0000000EAs5-0tQ7;
	Wed, 01 Apr 2026 07:11:26 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 391dff0b7;
	Wed, 1 Apr 2026 15:11:18 +0800 (GMT+08:00)
Message-ID: <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
Date: Wed, 1 Apr 2026 15:11:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
To: Daniel Bozeman <daniel@orb.net>, ulf.hansson@linaro.org, heiko@sntech.de,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <CAG+Ngm+xJCCQMPddZx8AbPEeH3rUrn3GKF575zXpGPJrnELvMw@mail.gmail.com>
 <acy3eP0dZBx6A950@claude-dev>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <acy3eP0dZBx6A950@claude-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d47e1de0c09cckunm098604e3fd985d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpLGFYZSk9OSk1JGE9KTENWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XK7L4fAB8DVTWQs0ZKyABCZaY4MYlJiruuP1OSHK17Lk2Pzs+YyiLRLbyFXuzV+mgXQ9+RXOeAgtqFdyIGOVS5QQZTRn/2sw8DcwlTmyVIkWB+DOBA22inMmCF0k5u72WnyMY3dxPX2J8INrdHlfbOgp5CwAbXDru+pUE65dEP0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PTYD3BdeiKasj9p/65Qh1vCnQKo8NB1Gv0M28P71x98=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_001124_879296_5BE26BB8 
X-CRM114-Status: GOOD (  17.14  )
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

+ Finley

在 2026/04/01 星期三 14:13, Daniel Bozeman 写道:
> <fc6f00fa-10b0-44c8-d8b4-694f8ff3b9ea@rock-chips.com>
> 
> I ran additional tests to gather evidence:
> 
> Test 1: Patch 2 only (skip EPROBE_DEFER), no patch 1.
> Result: kernel panic. The idle-only domains register
> successfully, but genpd_power_off_work_fn attempts to power
> them off and crashes in rockchip_pmu_set_idle_request:
> 
>    Internal error: synchronous external abort: 0000000096000010
>    CPU: 0 PID: 59 Comm: kworker/0:3
>    Workqueue: pm genpd_power_off_work_fn
>    pc : regmap_mmio_read32le+0x8/0x20
>    Call trace:
>     regmap_mmio_read32le+0x8/0x20
>     _regmap_bus_reg_read+0x6c/0xac
>     _regmap_read+0x60/0xd8
>     regmap_read+0x4c/0x7c
>     rockchip_pmu_set_idle_request.isra.0+0x94/0x1b4
>     rockchip_pd_power+0x378/0x604
>     rockchip_pd_power_off+0x14/0x34
>     genpd_power_off.isra.0+0x1f0/0x2f0
>     genpd_power_off_work_fn+0x34/0x54
> 
> Test 2: No kernel patches, PD_GPU disabled via
> status = "disabled" in DTS to avoid EPROBE_DEFER entirely.
> Result: same kernel panic. The idle-only domains register
> but crash identically when genpd tries to power them off.
> Same call trace as above.
> 
> So the crash is not caused by probe ordering or
> EPROBE_DEFER -- it happens whenever idle-only domains
> (pwr_mask == 0) are registered and genpd attempts to
> power them off. The QoS register access in
> rockchip_pmu_set_idle_request faults on these domains.
> 
> Regarding S2R: you raise a valid concern about skipping
> QoS save/restore. However, these idle-only domains cannot
> actually be powered off (pwr_mask == 0), so
> rockchip_do_pmu_set_power_domain already returns early for
> them. The QoS save/idle/restore cycle in rockchip_pd_power
> has no effect on these domains since the power state never
> changes -- the save and restore are paired around a no-op.
> Skipping the entire sequence for pwr_mask == 0 should be
> safe for S2R as well.
> 

Thanks for these details but I think it explains the phenomenon
and work around it but didn't explain the root cause.

RK3528 SoC can't power down these PDs but only support to idle them.
Right, idle these PDs could still make QoS registers inaccessable.
But from the code, rockchip_pmu_save_qos() and
rockchip_pmu_restore_qos() both are called under idle-free state.

One possible guess is it's clk related. Could you please help
test your environment with "clk_ignore_unused" set in cmdline?

Another test is to print out genpd->name in the entry of
rockchip_pd_power_on() and rockchip_pd_power_off() to see
which one is inaccessable.



> Both patches are needed:
> - Patch 1: prevents the QoS crash on idle-only domains
> - Patch 2: prevents probe teardown from making things worse
> 
> Tested on NanoPi Zero2 (RK3528) with all four scenarios:
> both patches (boots), patch 2 only (panic), DTS workaround
> (panic), both patches + E20C regression test (no issues).
> 
> The board DTS that triggers this (GPIO-controlled USB VBUS
> regulator on GPIO4/PD_RKVENC) can be seen at:
> https://github.com/dboze/openwrt/blob/add-nanopi-zero2-clean/target/linux/rockchip/patches-6.12/102-arm64-dts-rockchip-Add-FriendlyElec-NanoPi-Zero2.patch
> 

