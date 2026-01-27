Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33BED2F001
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OVlyCGnMtuPpE3SpcE+mrUgLiRrEpQleMNAZmB70u0=; b=qE+WGhGDiKD200
	LrQ1Z+Sos5YZUG1D2T2DRS9iyYBWf8powiP1g/wOSmlAuCBAohFyQeD7QE2mv8PDMASrHDRkbbVRv
	F3ILEwnfmOWRSlf33YnQ7a1dMKMldYZLkyGmY48iLXWDjRXfhI1GpNMdmEn2HN015k/nBTuqxwg0I
	5yiW4N5ZzoTrXYb/GP8pGYmsxkWFFLY8cXmoRuFwYgZ2eqE78z93vvzELhmjvAjOpOvKfA62rqGci
	atiMRUFUu8wDB2fA1GL5gIJgyazGcEWtVGAJeBz6Y/KT+o+RTkjSqnHEaDDe8+ZK8yffy+GC6eE2C
	iRle3cz+kdVrZn6d75jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhLT-0000000EABv-1hn5;
	Tue, 27 Jan 2026 11:34:55 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhLR-0000000EABR-0neT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:34:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7OVlyCGnMtuPpE3SpcE+mrUgLiRrEpQleMNAZmB70u0=;
	b=wvQdfUgrzrxqUOzxmPxzSBbFtRAleEg7rMLvtcXMZxuoOC7kzqmcjhV/IlNuEtHQZ38TKjP5K
	CH7MaWuXigDx5ZYp+v4pUb5qe2yiI0F6mIKppF9k9vP409WiebkUM8JCiND4dAqFOMYwMmgf4db
	hW43ezYzJ3stv4uzs1hOIzg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f0jrb4XC0zcZyb;
	Tue, 27 Jan 2026 19:30:39 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D94EE404AD;
	Tue, 27 Jan 2026 19:34:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Jan 2026 19:34:42 +0800
Message-ID: <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
Date: Tue, 27 Jan 2026 19:34:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
 <aXe6W69Esd1NLEU8@willie-the-truck>
 <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_033453_534716_FF34D28A 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/1/27 17:44, Kevin Brodsky wrote:
> On 26/01/2026 20:02, Will Deacon wrote:
>> On Mon, Dec 22, 2025 at 07:47:26PM +0800, Jinjie Ruan wrote:
>>> [...]
>>>
>>> To make it more reasonable and in preparation for moving arm64 over to
>>> the generic entry code, move rseq_syscall() ahead before
>>> audit_syscall_exit().
>> I've been struggling a bit to see how this helps to align with the
>> generic code.
> 
> rseq_syscall(), or rather rseq_debug_syscall_return() since eaa9088d568c
> ("rseq: Use static branch for syscall exit debug when
> GENERIC_IRQ_ENTRY=y"), is called first in the generic
> syscall_exit_to_user_mode_work(), so the aim of that patch is to align
> the order of calls with generic entry.
> 
>>  I'm also concerned that rseq_debug_update_user_cs()
>> operates on instruction_pointer(regs) which is something that can be
>> chaned by ptrace.
> 
> Isn't that true regardless of where rseq_syscall() is called on the
> syscall exit path, though?

My understanding is that if instruction_pointer(regs) is hijacked and
modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
this modification will not be observed by rseq. Specifically, in the
generic entry syscall exit path, rseq_syscall() is unable to detect such
a PC modification.


Regards,
Jinjie

> 
>> So, I'm not saying this is wrong, but it feels like a user-visible
>> change that needs better justification.
> 
> This seems to hang on whether the force_sig(SIGSEGV) that rseq_syscall()
> might issue interacts in any way with the tracing calls. My feeling is
> that it doesn't, but I haven't confirmed it. Worth noting this is only
> relevant if rseq debugging is enabled, so any potential user-visible
> effect is limited.
> 
> - Kevin
> 

