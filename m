Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EDCC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJbsqN6wqYrtfAxvXkhAoP2bYCz03A4sparHJIC38dE=; b=eeh6kfR0F664T3
	aZikfUwsFz0yPOwhlkkQ4kfXN9m0yt0Y3NIKa1/zoU1zreDJt16vGrnnC96qzng1P5/PgJ+Mq93zz
	rB8xv0CRxAAK8uU3FtNPSlSsek2TcwOlteR2LO3265PSokKs6UEf5ldbAxq/rbXTlAlUc6x1Cn+2n
	1jZM25iqWFXySR4zJNcydtN46rhmjWgv3btOezXuF+JfdYqs3hqMcnlnvfllqYso1rkaChxkClcMW
	oEe/kuYB+ndcNrYH42JfIoDrMcHVZE0lMuuNXLDU8yaC4fRd+lFQjrDYRjfKXY0nUmfJ/q/qP3zq1
	vMKowT/xjhRQ8AE6OHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6oe-00000008zfG-0Ue7;
	Tue, 21 Jul 2026 09:31:08 +0000
Received: from [113.46.200.225] (helo=canpmsgout10.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6oa-00000008zdC-3rCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:31:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cJbsqN6wqYrtfAxvXkhAoP2bYCz03A4sparHJIC38dE=;
	b=d/waB1qOowvCbjjPKalGiMhNHDsFZrHvKEHZlV/nJrLXOgmgPkC7nDlJRnAO16DkaldMP9gWd
	aletERf6DHgMUR4iKCXmqmCq/Cr6ZvibLW7dIaJRLDqN5VbVvp+15UOKCURwB7wjglTTNp+8f+o
	lWBEFP3d2ypJVutMKNnzRNM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4h4Bhc42Lcz1K9cD;
	Tue, 21 Jul 2026 17:21:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 63DA840578;
	Tue, 21 Jul 2026 17:30:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 17:30:39 +0800
Message-ID: <e674b355-b4a9-4205-9a60-a1c49aca6758@huawei.com>
Date: Tue, 21 Jul 2026 17:30:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/15] arm64: syscall: Simplify el0_svc_common()
 syscall exit path
To: Linus Walleij <linusw@kernel.org>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-12-ruanjinjie@huawei.com>
 <CAD++jL=D1S7HE9dVwHeOyAmu-6g+BGq+f2=2=BUX-4tzp88NOQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jL=D1S7HE9dVwHeOyAmu-6g+BGq+f2=2=BUX-4tzp88NOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_023105_264227_AD9FC653 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/21/2026 4:51 PM, Linus Walleij wrote:
> On Tue, Jul 21, 2026 at 10:19 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> Remove the redundant nested conditional check within the system call
>> exit path of el0_svc_common() to streamline the exit sequence.
>>
>> When entering this fast-path block, CONFIG_DEBUG_RSEQ is guaranteed to be
>> disabled so the call of rseq_syscall() is a no-op.
> 
> Please explain why this is guaranteed.

Yes, there is a little unclear.

The expression "!IS_ENABLED(CONFIG_DEBUG_RSEQ)" evaluates to true only
when CONFIG_DEBUG_RSEQ is not set; with the guarantee that it is
disabled, the condition is always satisfied.

> 
>> Under this constraint,
>> the code logic inside the block becomes completely identical to what
>> the arm64_syscall_exit_to_user_mode_work() helper already does. Replace
>> that nested logic with a direct invocation of the helper, eliminating
>> redundant code.
>>
>> Before:
>>
>> | if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
>> |       flags = read_thread_flags();
>> |       if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
>> |               arm64_syscall_exit_to_user_mode_work(regs);
>> |       return;
>> | }
>> | trace_exit:
>> |       arm64_syscall_exit_to_user_mode_work(regs);
>>
>> After simplify:
>>
>> | if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
>> |       arm64_syscall_exit_to_user_mode_work(regs);
>> |       return;
>> | }
>> | trace_exit:
>> |       arm64_syscall_exit_to_user_mode_work(regs);
>>
>> Furthermore, Since both the conditional fast-path and the fallback
>> slow-path now uniformly invoke arm64_syscall_exit_to_user_mode_work(),
>> this explicit conditional branch is entirely redundant regardless of
>> whether the evaluation is true or false. Removing it collapses
>> the duplicated logic into a single, unconditional path.
>>
>> No functional changes.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> After looking at it for a while I conclude you are right, provided
> the reasoning about !CONFIG_DEBUG_RSEQ holds. So with
> that explained:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij


