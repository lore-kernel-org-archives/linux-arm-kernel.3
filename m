Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD91DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agcuF+xAnQK1uMc7VMljVRNlrE+i6mkP6bbq36vGcUQ=; b=Azn/lt6VOueHXRCttNx4gDAXuB
	tpbJHSClL3PpnRBCHw3Rizvj+1yALH3Dwgx0+uZq5jAGdRgGO4NsUB/Xsny8M1zm1xgLn2uxMkDSD
	88sqHuLsS1ys7NkYunS84ZUsng/mUFovqNJ7tqnbtybYlKPZyWvVF53YC50c7aTC4FiNY0w9hQJ41
	kjvu0pIjDNSRnq8mHUSUkSE68eD8M3J5S0YbNjIZZNguZHpiVLvgoTrP9tgJ+gADdzkIyW6FftN3a
	JCvECpgFLvAPvs6xZREDbZlSw97ngdvBlpe7DvxG2BsCALjFbICHTwlJ6tNTK/kgk6WOBC9YRey+W
	bVwnPOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgxW-0000000DWvD-3NKf;
	Tue, 11 Aug 2026 07:31:38 +0000
Received: from cyan.ash.relay.mailchannels.net ([23.83.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgxT-0000000DWte-0TBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:31:38 +0000
X-Sender-Id: thundermail|x-authenticated-sender|cloud509.thundercloud.uk:
 kirkwood@davidjohnsummers.uk
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AA99294088B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:31:29 +0000 (UTC)
Received: from mailclean11.thundermail.uk (trex-green-1.trex.outbound.svc.cluster.local [100.111.243.51])
	(Authenticated sender: thundermail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3D80D94154B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:31:29 +0000 (UTC)
X-Sender-Id: thundermail|x-authenticated-sender|cloud509.thundercloud.uk:
 kirkwood@davidjohnsummers.uk
X-MC-Relay: Neutral
X-MailChannels-SenderId: thundermail|x-authenticated-sender|cloud509.thundercloud.uk:
 kirkwood@davidjohnsummers.uk
X-MailChannels-Auth-Id: thundermail
X-Spot-Thoughtful: 5febc87431a14442_1786433489587_3511233055
X-MC-Loop-Signature: 1786433489587:1052847176
X-MC-Ingress-Time: 1786433489587
Received: from mailclean11.thundermail.uk (mailclean11.thundermail.uk
 [149.255.60.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.243.51 (trex/8.0.2);
	Tue, 11 Aug 2026 07:31:29 +0000
Received: from cloud509.thundercloud.uk (cloud509.thundercloud.uk [149.255.62.113])
	by mailclean11.thundermail.uk (Postfix) with ESMTPS id 098151E0012
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=davidjohnsummers.uk; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=agcuF+xAnQK1uMc7VMljVRNlrE+i6mkP6bbq36vGcUQ=; b=M7tqVBYqk8JeqKLJN5NKzoNjV/
	Mu9PLgpLHlul0uf0hN+JqRE+HhClFY8mclM6h+MlQQOlIdlDRGT/Bx2HxhZ2Kki7mZszpyttNG653
	JFeiSgGu0OAIrGEZ+N2B+0vIZ1330iS9Q2eDlomdbDC1otMUhy9er238vgzCn4+F1TpFtsjOvRD9a
	q9ioDaOlUTtEo9+irbbTa2IgqL44KLa36nmL49r5UfT/zhcUwINyjjXNINOyuHglp3EkHC/P+PMLe
	+ImBTLhK8qRlebKGwoLNPsLWuePwgzMUQEiSCCzvrezSHrONYO3V02cwfIWiWdgew0pua/Ru3WsjC
	1TKh2CRg==;
Received: from [94.0.196.130] (port=59784 helo=[192.168.0.5])
	by cloud509.thundercloud.uk with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <kirkwood@davidjohnsummers.uk>)
	id 1wtgxL-0000000DmVQ-33lx;
	Tue, 11 Aug 2026 08:31:26 +0100
Message-ID: <1d3c1fcf-40b5-4d37-bc73-e84760bebd2c@davidjohnsummers.uk>
Date: Tue, 11 Aug 2026 08:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Marvell Kirkwood and the linux 7.1.5 kernel
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
References: <5cb9b531-29c3-4928-aba6-5f14560e046f@davidjohnsummers.uk>
 <abec4a63-11cd-4814-ae12-f1c89d07e9ad@app.fastmail.com>
Content-Language: en-GB, en-GB-large
From: David Summers <kirkwood@davidjohnsummers.uk>
In-Reply-To: <abec4a63-11cd-4814-ae12-f1c89d07e9ad@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cloud509.thundercloud.uk
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - davidjohnsummers.uk
X-Get-Message-Sender-Via: cloud509.thundercloud.uk: authenticated_id: davidjoh/from_h
X-Authenticated-Sender: cloud509.thundercloud.uk: kirkwood@davidjohnsummers.uk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Queue-Id: 098151E0012
X-Spamd-Result: default: False [0.00 / 999.00];
	ONCE_RECEIVED(0.20)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.10)[davidjohnsummers.uk];
	DMARC_POLICY_ALLOW(0.00)[davidjohnsummers.uk,none];
	R_DKIM_ALLOW(0.00)[davidjohnsummers.uk:s=default];
	HAS_X_AS(0.00)[kirkwood@davidjohnsummers.uk];
	FROM_HAS_DN(0.00)[];
	HAS_X_GMSV(0.00)[davidjoh/from_h];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[davidjohnsummers.uk:+];
	HAS_X_ANTIABUSE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:34931, ipnet:149.255.60.0/22, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:149.255.62.113];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: mailclean11
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_003136_391122_9310A977 
X-CRM114-Status: GOOD (  28.46  )
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


On 10/08/2026 20:54, Arnd Bergmann wrote:
> On Mon, Aug 10, 2026, at 17:59, David Summers wrote:
>> Hi All,
>>
>> I've an ancient nas I'm updating, that has Marvell Kirkwood core. I
>> recently updated to the 7.1.5 kernel, and now my kernel is hitting many
>> bugs, specifically:
>>
>>> [ 3.195064] BUG: using smp_processor_id() in preemptible [00000000] code: kworker/u4:1/49
>>> [ 3.203374] caller is __flush_anon_page+0x28/0xd8
>>> [ 3.208146] CPU: 0 UID: 0 PID: 49 Comm: kworker/u4:1 Not tainted 7.1.5-1-ARCH #3 PREEMPT
>>> [ 3.216370] Hardware name: Marvell Kirkwood (Flattened Device Tree)
>>> [ 3.222666] Call trace:
>>> [ 3.222677] unwind_backtrace from show_stack+0x10/0x14
>>> [ 3.230489] show_stack from dump_stack_lvl+0x38/0x48
>>> [ 3.235573] dump_stack_lvl from check_preemption_disabled+0x104/0x118
>>> [ 3.242139] check_preemption_disabled from __flush_anon_page+0x28/0xd8
>>> [ 3.248791] __flush_anon_page from __get_user_pages+0x420/0x608
>>> [ 3.254844] __get_user_pages from get_user_pages_remote+0xd0/0x404
>>> [ 3.261148] get_user_pages_remote from get_arg_page+0x6c/0xec
>>> [ 3.267025] get_arg_page from copy_string_kernel+0x98/0x194
>>> [ 3.272720] copy_string_kernel from kernel_execve+0xa0/0x19c
>>> [ 3.278501] kernel_execve from call_usermodehelper_exec_async+0x120/0x238
>>> [ 3.285425] call_usermodehelper_exec_async from ret_from_fork+0x14/0x28
>>> [ 3.292164] Exception stack(0xe0b2dfb0 to 0xe0b2dff8)
>>> [ 3.297243] dfa0: 00000000 00000000 00000000 00000000
>>> [ 3.305458] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> [ 3.313672] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>>>
>> And this bug gets hit multiple times for each command run.
>>
>> I've tracked smp_processor_id() to linux/arch/arm/include/asm/smp.h
>> which contains:
>>
>> #define raw_smp_processor_id() (current_thread_info()->cpu)
> Since you confirmed that CONFIG_SMP is disabled, we can tell
> that this is not the location that caused the BUG() above,
> instead the warning does come from lib/smp_processor_id.c when
> CONFIG_DEBUG_PREEMPT is enabled, and this happens regardless of
> CONFIG_SMP.
>
> I think this most likely comes from this function:
>
> static inline void vivt_flush_cache_pages(struct vm_area_struct *vma,
>                  unsigned long user_addr, unsigned long pfn, unsigned int nr)
> {
>          struct mm_struct *mm = vma->vm_mm;
>
>          if (!mm || cpumask_test_cpu(smp_processor_id(), mm_cpumask(mm))) {
>                  unsigned long addr = user_addr & PAGE_MASK;
>                  __cpuc_flush_user_range(addr, addr + nr * PAGE_SIZE,
>                                  vma->vm_flags);
>          }
> }
>
> which only gets called on uniprocessor Armv4/Armv5 systems with an
> aliasing VIPT cache, and those are relatively rare.
> smp_processor_id() checks that it is called in an atomic section
> because the CPU might change under it on SMP kernels otherwise,
> but __get_user_pages() is definitely not an atomic context.
>
> I checked the same code path in linux-5.15 and I don't see any
> changes that would explain why you did not see the same
> issue earlier.
>
> Can you try to turn off CONFIG_DEBUG_PREEMPT? The specific
> warning here looks like a false positive since you can't get
> there on an SMP system, but it may be that there are other
> similar issues if you see a lot of different warnings.
>
>         Arnd

Ah yes - I do indeed have CONFIG_DEBUG_PREEMPT set to - and 
interestingly that was set in the 5.15 kernel (last one I was running) 
and that didn't produce the bug.

I'll try this when I get back on the machine  - am currently stuck in 
the initramfs, and having problems bringing the HDD up (think the 
initramfs doesn't have the module it needs to access hdd via the 
kirkwood CPU, I though I'd made this be always in the kernel rather than 
a module ... but its not working).

Anyway I'll set up a system on a USB disk - and boot off that - Then I 
can access the hdd, and make the changes.

Thanks for the help.


