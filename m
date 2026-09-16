Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BA9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 02:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+G1FOCWXLkN8j6Q3OlM8pkV0Orx9iwVxUAFrdbXSd0=; b=tMGsSWUm3Lj+gEqefX9x1x1HaB
	+cxq0EgCsIQNiG5TiFlwnRiPWmG52uE9ao7+e+artR/GUksTomibYN2lOh0mUqPCVKR9B6jkjALRa
	4OwCrNCXVGXuTgctq3e8iImKDf7rtLSrBKnEGMjwjP/YjXAtNM7+CB/x8Z1VTHjw0TztWxJEY3+ne
	G4puid6BSlXrKszGeKVxguSme6aoQ0F4B1BcRU5/M3bBqQd5qdQRWIK3Q4UjUEsyf6hiH9SHcu6lf
	CXvvgZCjp3L/2QB7SW5iPyFQu2qgWTZAYtjyrlvLA4FGVjJ1w88osJdq9tTsr4ebEwfQ8qEtJM2b4
	7sWND8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fa0-00000008CeV-2qwZ;
	Wed, 16 Sep 2026 02:41:00 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fZx-00000008Ce7-1K5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 02:40:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c+G1FOCWXLkN8j6Q3OlM8pkV0Orx9iwVxUAFrdbXSd0=;
	b=YzkwZQpG+WmuZg4XY5M+XCWgYMeFChbTmiZMkMJLHm7vRW4PV8dFYquLglRjfYk0I3YF0KOgB
	D/acBo32iRNFdQwtJNckBgXn8PeHbMXwdb8tJ0WvZd4Zdbgbe5NnlbjWKJDOFqYkjaHlzCOZGFt
	EcMsFjFb/e+lZy/hS9ENAa4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hl2rf6BrNz1T4LX;
	Wed, 16 Sep 2026 10:29:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E4DE440537;
	Wed, 16 Sep 2026 10:40:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 10:40:47 +0800
Message-ID: <8fffefd6-c109-49ad-8265-e3bd63b629ea@huawei.com>
Date: Wed, 16 Sep 2026 10:40:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during secondary
 CPU bringup
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
 <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
 <aqFS58mJ4GJNrbZ2@willie-the-truck>
 <19ba4bb9-e2c4-4956-bd8d-b8f50259a422@huawei.com>
 <aqP5ofIC8rkmtBtK@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP5ofIC8rkmtBtK@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_194057_708902_6E7E78B1 
X-CRM114-Status: GOOD (  17.07  )
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



在 2026/9/11 20:52, Will Deacon 写道:
> On Thu, Sep 10, 2026 at 10:47:58AM +0800, Jinjie Ruan wrote:
>> 在 2026/9/9 20:36, Will Deacon 写道:
>>> I was about to say "don't do this" but then I realised two things:
>>>
>>> 1. update_siblings_masks() can trigger lockdep splats outside of
>>>    pr_debug() if RCU isn't up and running, e.g.:
>>>
>>>     [    0.524042]  show_stack+0x18/0x24 (C)
>>>     [    0.524519]  __dump_stack+0x28/0x38
>>>     [    0.524546]  dump_stack_lvl+0x64/0x84
>>>     [    0.524562]  dump_stack+0x18/0x24
>>>     [    0.524576]  lockdep_rcu_suspicious+0x134/0x1cc
>>>     [    0.524591]  __lock_acquire+0xee8/0x2cb0
>>>     [    0.524606]  lock_acquire+0x11c/0x2fc
>>>     [    0.524621]  _raw_spin_lock_irqsave+0x64/0x84
>>>     [    0.524641]  of_find_property+0x2c/0x8c
>>>     [    0.524659]  detect_cache_attributes+0x1c0/0x6d0
>>>     [    0.524676]  update_siblings_masks+0x38/0x288
>>>     [    0.524692]  store_cpu_topology+0x4c/0x58
>>>     [    0.524706]  secondary_start_kernel+0xdc/0x1c8
>>>     [    0.524722]  __secondary_switched+0x120/0x124
>>>
>>> 2. This code is running _after_ cpuhp_ap_sync_alive().
>>>
>>> So for the next version, I'll reintroduce the call to
>>> rcutree_report_cpu_starting(), but move it immediately after the call to
>>> cpuhp_ap_sync_alive(). I think that will solve these issues, without
>>
>> pr_crit() and pr_warn() (such as vec_verify_vq_map()) in
>> check_local_cpu_capabilities() can also trigger lockdep splats as below.
>>
>> But I think this is not common on the failure path, so it seems to have
>> little impact..
> 
> I agree that we shouldn't bend the code out-of-shape to squash a debug
> warning on an error path (ideally, printk would handle this internally),
> especially as the original message does seem to get printed in the end.
> 
>> [    0.158619] smp: Bringing up secondary CPUs ...
>> [    0.173958] CPU1: missing HWCAP.
>> [    0.174071]
>> [    0.174088] =============================
>> [    0.174099] WARNING: suspicious RCU usage
>> [    0.174197] 7.3.0-rc2-00020-gef0bd63bdd97-dirty #504 Tainted: G        W
>> [    0.174217] -----------------------------
>> [    0.174226] kernel/locking/lockdep.c:3845 RCU-list traversed in
>> non-reader section!!
> 
> However, if this is caused by vec_verify_vq_map(), then how are you getting
> that to run on the early boot path? check_local_cpu_capabilities() only

Sorry, based on the fact that pr_crit() or pr_warn() is printed before
rcutree_report_cpu_starting() is called, I modified the code to add
print tests to simulate this situation.

> calls verify_local_cpu_capabilities() if system_capabilities_finalized().
> 
> Or is the backtrace for something else?
> 
> Will


