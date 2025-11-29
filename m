Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEE7D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puYdCjauAnyp13Z3AbnzcEE9KrU8OtebpK4HHLvOqPI=; b=G0h2faF4+VXgVap+9FlBeAyTAZ
	L48Ijvr0x+K4VAWAzHuGWZj8Elgf1crvaml/rtubfFF786EcHBg+rFIq3pEGumc99oPSEeSTavb0f
	VCAt/iqyiLlHiBsEwNe5iDD0CW2X9OZNJ27EIPA0/0M4L4XhfxI5GCsIyCMSKbYeRdMvIyYGIBn0/
	ZC7pS3njlUZJAvk34Jqtp3kW/BB8+Mf0Z57NwbhmpqPsloeD9tPBhTwLqtS5/e+YSUpq5xgpUoV59
	umS1revMS297/+7c0L9YXOJLziRLKQ76Es5TGRhP/M5zg9eHaGe6z1V8zLD6QIDZgG9NcGOHkGVSv
	3zTNm5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPGw9-00000001Pfq-1Bk0;
	Sat, 29 Nov 2025 09:08:13 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPGw6-00000001Pf1-02XU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 09:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=puYdCjauAnyp13Z3AbnzcEE9KrU8OtebpK4HHLvOqPI=; b=ElfgA3pcqI4u2V5Qw2qVd/nzGU
	T/EfzhaKAZVqIsLqTKtnSuVLOEUx4j3TU/2CnNbw+rDxqyHoU6/M8j53gZwej0rhySWnbWuxUWIgx
	L5h6kNOL4g4WAPTCm7IFDpDy4FndmhAG6sENH+0qdZm7Jc6ZFC6fZJ+Kru2E0eyv122nxlvxPKPSt
	Crzm0cmJZC9hxgrmlCJgqIs0s/SKhgGb3Em804A/sYtSghutELdkVYwU/7cLq/P/qIL45h56lVOcu
	HAQrDYvlaOjnfaP3cGbNoAmr/70ouZzTg4CMBy0thr/rfv2PJCOyQrljlKsXX4MnKHtqRQGFXmqEp
	9LpKA/1Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPGw9-00000007WR1-1Vm6;
	Sat, 29 Nov 2025 09:08:13 +0000
Date: Sat, 29 Nov 2025 09:08:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: torvalds@linux-foundation.org, will@kernel.org, linux@armlinux.org.uk,
	bigeasy@linutronix.de, rmk+kernel@armlinux.org.uk,
	akpm@linux-foundation.org, brauner@kernel.org,
	catalin.marinas@arm.com, hch@lst.de, jack@suse.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	pangliyuan1@huawei.com, wangkefeng.wang@huawei.com,
	wozizhi@huaweicloud.com, yangerkun@huawei.com, lilinjie8@huawei.com,
	liaohua4@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
Message-ID: <20251129090813.GK3538@ZenIV>
References: <CAHk-=wjA20ear0hDOvUS7g5-A=YAUifphcf-iFJ1pach0=3ubw@mail.gmail.com>
 <20251129040817.65356-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129040817.65356-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_010810_666328_575C03EB 
X-CRM114-Status: GOOD (  17.29  )
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

On Sat, Nov 29, 2025 at 12:08:17PM +0800, Xie Yuanbin wrote:

> I think the `user_mode(regs)` check is necessary because the label
> no_context actually jumps to __do_kernel_fault(), whereas page fault
> from user mode should jump to `__do_user_fault()`.
> 
> Alternatively, we would need to change `goto no_context` to
> `goto bad_area`. Or perhaps I misunderstood something, please point it out.

FWIW, goto bad_area has an obvious problem: uses of 'fault' value, which
contains garbage.

The cause of problem is the heuristics in get_mmap_lock_carefully():
	if (regs && !user_mode(regs)) {
		unsigned long ip = exception_ip(regs);
		if (!search_exception_tables(ip))
			return false;
	}
trylock has failed and we are trying to decide whether it's safe to block.
The assumption (inherited from old logics in assorted page fault handlers)
is "by that point we know that fault in kernel mode is either an oops
or #PF on uaccess; in the latter case we should be OK with locking mm,
in the former we should just get to oopsing without risking deadlocks".

load_unaligned_zeropad() is where that assumption breaks - there is
an exception handler and it's not an uaccess attempt; the address is
not going to match any VMA and we really don't want to do anything
blocking.

Note that VMA lookup will return NULL there anyway - there won't be a VMA
for that address.  What we get is exactly the same thing we'd get from
do_bad_area(), whether we get a kernel or userland insn faulting.

The minimal fix would be something like
	if (unlikely(addr >= TASK_SIZE) && !(flags & FAULT_FLAG_USER))
		goto no_context;

right before
	if (!(flags & FAULT_FLAG_USER))
		goto lock_mmap;

in do_page_fault().  Alternatively,
	if (unlikely(addr >= TASK_SIZE)) {
		do_bad_area(addr, fsr, regs);
		return 0;
	}
or
	if (unlikely(addr >= TASK_SIZE)) {
		fault = 0;
		code = SEGV_MAPERR;
		goto bad_area;
	}
at the same place.  Incidentally, making do_bad_area() return 0 would
seem to make all callers happier...

