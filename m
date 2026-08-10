Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552D3C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n43/aKJ8eBUxUBD79l6UcJWpeqmmhi7C6KTZf2OBbS8=; b=lfaEPbsCl+hTmg
	+aHXAQRM/WD0wYuB/DJ/p5QlSyEiMMMX86SJ0r5dIwXEECd6IM/WrMJoieTQSiwQWBjs/0cLmvokx
	DThVNnbxwscyGOCLqFAG5D0wPgrJ+Fbn+UQnAf4BMpk3VSVLph9KYl6ySbHCmdgZY5gHZgKyyGxUN
	NyDtZYkgHUgB3ZPXoAODMQ6dvBJoE8lkb1WQrRvh/tdV53K6I0kGDJ3dPM+cTqmWkb1yaJoqTHAny
	+NCyRXzWVR2a/2XCEhIJ+UOkSahXVSL5JPUvmVwgCjJ20HklimJb5Y/Fw8sotLNyKWDE//kW4zgZg
	bmGAXYf3+1MyuB0lxlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPTv-0000000Bpei-3kVP;
	Mon, 10 Aug 2026 12:51:55 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPTo-0000000Bpdv-3N7T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:51:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=n43/aKJ8eBUxUBD79l6UcJWpeqmmhi7C6KTZf2OBbS8=;
	b=RdObbmdFVKOHTKxX52sYHajGprEIe7f7G201ZRemSi9eiJFBr4OCR9QsXnshR/NBpmdDAAXFJ
	m1z7QSOat5nN9rf1iD9RBNqUThFd8TgKUkLigbuWCbQ8/0lHvFq0l5J1hfD5ngLjAXfLaVa3WnB
	V+iOsFZkRHF1hGrBpELsVU8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hJZ9l6vrhzpT0F;
	Mon, 10 Aug 2026 20:40:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D96B2025F;
	Mon, 10 Aug 2026 20:51:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Aug 2026 20:51:39 +0800
Message-ID: <61786f30-5827-4785-ae68-febbdf0de900@huawei.com>
Date: Mon, 10 Aug 2026 20:51:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
To: Will Deacon <will@kernel.org>, Breno Leitao <leitao@debian.org>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3> <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com> <anm5T9FazACqOWXF@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <anm5T9FazACqOWXF@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_055149_633123_E001AB14 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/8/10 19:43, Will Deacon 写道:
> On Fri, Aug 07, 2026 at 09:29:12AM -0700, Breno Leitao wrote:
>> On Fri, Aug 07, 2026 at 07:58:21AM -0700, Breno Leitao wrote:
>>> Meanwhile, I will try to ftrace the writes to PMR and regs->pmr to get
>>> a better grasp of the states machine we are in (probably on Monday).
>>
>> It seems LLM found a very easy to reproduce this:
>>
>> 	bash-5.1# dmesg
>>
>> 	bash-5.1#  cd /sys/kernel/tracing
>> 	echo 'r:pmr vfs_read bad=+0($retval):u64' >> kprobe_events
>> 	echo 1 > events/kprobes/pmr/enable
> 
> Nice, that triggers straightforwardly in QEMU for me. The diff below
> (which implements my suggestion from [1]) seems to fix the issue, but
> it would be good to hear feedback from one of the Arm folks.
> 
> Will
> 
> [1] https://lore.kernel.org/all/anXgWRmcjwPKG7N5@willie-the-truck/
> 
> --->8
> 
> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
> index 795b35128467..691ee5f86dbe 100644
> --- a/arch/arm64/include/asm/daifflags.h
> +++ b/arch/arm64/include/asm/daifflags.h
> @@ -132,7 +132,7 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
>                 trace_hardirqs_on();
> 
>         if (system_uses_irq_prio_masking())
> -               gic_write_pmr(regs->pmr);
> +               gic_write_pmr(regs->pmr & ~GIC_PRIO_PSR_I_SET);

If the DAIF.I is restored below and the GIC_PRIO_PSR_I_SET in the pmr is
cleared here, it seems to introduce inconsistency with current Pseudo
NMI code.

> 
>         /*
>          * We can't use local_daif_restore(regs->pstate) here as
> 


