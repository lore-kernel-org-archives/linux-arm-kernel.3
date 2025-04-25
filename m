Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30712C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:Cc:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cLkf8WACstYTJxddueeqYJMP2WjUmq1R4SoKNA2QWwg=; b=QPnuON63Os8bfslGZU7Mtci8/x
	AkjJPjjjuKEdpqU9JswT4uyQUKQOLxoSwheax6K50q2k8GdopSDAtugrIBpoto3VXx/oVW6xZ5CUS
	5s0hh9b3g9VeB8I8uuJ6AMSZM11seQyNCOyaybcF9VgKee1vTsfvzHoZ1PTfeg5fMWgZYe9EyGIXO
	tbYE1yNJwdZstiyM5YeAEsbJweMgRYLsYexOXNC6OchiLhpi9c/YbZJvjHHuZCWkAXug9WSe+72xh
	yDIdlxgvsMaPCV/21DS2JiXhjcZUF7Cfp9uW4MBmp+d3EUsgwoQylgctsgk/NGSpRqsFQ0A9ZM7lG
	0QIWigJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JBA-0000000HIQD-0wXC;
	Fri, 25 Apr 2025 13:33:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IN7-0000000H9XA-1TAq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:41:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7016106F;
	Fri, 25 Apr 2025 05:41:28 -0700 (PDT)
Received: from [10.57.90.155] (unknown [10.57.90.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40D123F66E;
	Fri, 25 Apr 2025 05:41:33 -0700 (PDT)
Message-ID: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
Date: Fri, 25 Apr 2025 13:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
To: Kees Cook <kees@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Catalin Marinas <Catalin.Marinas@arm.com>
Subject: BUG: vdso changes expose elf mapping issue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054137_475780_4A88D92E 
X-CRM114-Status: GOOD (  16.48  )
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

I'm hitting a nasty bug which is preventing VSCode from connecting to my arm64 
VM running v6.15-rc3. Bisection fingers Commit 0b3bc3354eb9 ("arm64: vdso: 
Switch to generic storage implementation") as the point where this started 
failing.

Debugging this, the root cause is due to ldconfig crashing with a segmentation 
fault (I have no idea why VSCode thinks it needs to run this...). The segfault 
happens because ldconfig's attempt to expand the program break fails because 
vvar/vdso are in the way. The above change expands vvar by 2 pages and this 
causes the problem.

But I don't think we can really blame this commit...

ldconfig is a statically linked, PIE executable. The kernel treats this as an 
interpreter and therefore does not map it into low memory but instead maps it 
into high memory using mmap() (mmap is top-down on arm64). Once it's mapped, 
vvar/vdso gets mapped and fills the hole right at the top that is left due to 
ldconfig's alignment requirements. Before the above change, there were 2 pages 
free between the end of the data segment and vvar; this was enough for ldconfig 
to get it's required memory with brk(). But after the change there is no space:

Before:
fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
fffff7ffc000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]

After:
fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
fffff7ffa000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]

Note that this issue only occurs with ASLR disabled. When ASLR is enabled, the 
brk region is setup in the low memory region that would normally be used by 
primary executable.

So the issue is that when ASLR is disabled, these statically linked, PIE 
programs are mapped with insufficient space to expand the break.

I think in an ideal world, the kernel would notice that this is not an 
interpreter and map it to low memory. But I guess we can't know that for the 
case where the interpreter is invoked directly (as apposed to being referenced 
in the .interp section of the invoked binary)?

Another option would be to always relocate the break to low memory (but without 
the random offset for the ASLR=off case). But it looks like there could be some 
compat issues there? I see CONFIG_COMPAT_BRK...

Or we could just ensure we enforce some dead space after the end of the program 
that nothing else is (initially) mapped into. I think this could be done by 
overallocating the initial MAP_FIXED_NOREPLACE mmap, then munmapping the hole 
after ARCH_SETUP_ADDITIONAL_PAGES(). But it's not really clear what the correct 
reservation size would be, and any mmaps the program does will start to fill 
that space.

I'm hoping someone has some suggestions...

Thanks,
Ryan


