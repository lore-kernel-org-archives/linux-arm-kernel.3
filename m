Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E72FD3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDp0nnRlXbjtf9+Tzimu2sf+62NgTQmfSvfCeGVNddw=; b=atfR9LZFXBYRGpAjfVxAS0KypU
	YoFvpG1j3cVTmU7AQwAVk/QLCt5HlDl0S7G9WqPKMmavQgbKEgmdD0MIk9ICnv224Iq12nec9FB2G
	IfTwVzS5JiRdMf+9HAZkXxjfXijjWd26PoEi/O1U50ivqaL3LWN7G9kP62j+IngvATtOMlyFT1Q8F
	6aIlbe3VKF2erhwRwRK1UQP/6A2Gb1pX0opx4Ho4oECv0f6X8WSe90jpc15vttAd7wRfWH+ZB3QmY
	sk9p+1UJZPl1sRkTv1VXcWTHnpSLlbcR3RXH7rZ7lRhKVUdv8qxh66SVcePDGEn1Lpz9mL8gfNgTA
	aAX419+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdeX-0000000DH7J-1K0J;
	Mon, 08 Dec 2025 15:59:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdeV-0000000DH6t-1NJ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 15:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JDp0nnRlXbjtf9+Tzimu2sf+62NgTQmfSvfCeGVNddw=; b=p9tNmu+dXkXPPLGeajNp1ZObuk
	i7nqvchAVu6f8aeq/kECsgbKmZYpBJwZ64bdaw8o4OgNEjQGO91pD2fy/+Yd2e7jcpKKcWuZcj78U
	NmWZV2ZEdGQO5CRbUfzmlA+KXlQ0VjVK6MKhFdtvZLZgldooIcMU1L2Hf0jgcqeakwoWL+xXDiwLJ
	l/ZjRi0YF0Md9z0vXV8E3mmAK9trUXoMJVAGZ+Eyc6kYDAlVqXGYL1HcoTzveEU1Dqi6q4NSUSY2q
	tubV+zMZAbyq1VFE6ikahERcniJ5ye9P/MzB4E6lJlHy9x/KC2lq8fn/UliiIVJs1RcC9XWilodNZ
	JVeDTF5Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33664)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSdeR-000000007wA-1rHX;
	Mon, 08 Dec 2025 15:59:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSdeP-0000000059N-3XC8;
	Mon, 08 Dec 2025 15:59:49 +0000
Date: Mon, 8 Dec 2025 15:59:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Message-ID: <aTb19aN_8PNduyDY@shell.armlinux.org.uk>
References: <aTbF009476Iufory@shell.armlinux.org.uk>
 <20251208150840.92209-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208150840.92209-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_075955_391215_B15FC891 
X-CRM114-Status: GOOD (  25.44  )
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

On Mon, Dec 08, 2025 at 11:08:40PM +0800, Xie Yuanbin wrote:
> On Mon, 8 Dec 2025 12:34:27 +0000, Russell King wrote:
> > The first patch adds an additional check in __do_kernel_fault() to
> > detect this condition. This patch is a non-obvious dependency for the
> > next patch.
> >
> > The second patch handles faults above the top of userspace entirely
> > separately, meaning we have a simpler and more obvious fault path,
> > which avoids any possibility of taking any MM mutexes, which is the
> > cause of the hash_name() problem.
> >
> > The third patch moves harden_branch_predictor() out of
> > __do_user_fault() and to appropriate places in the parent functions.
> > The reason this has been avoided thus far is because do_page_fault()
> > can be a hot path (since it's used for page aging as well) but with
> > kernel address faults being handled by an entirely separate path,
> > this avoids adding to that overhead.
> 
> I don't have any objections to the first and second patches. However,
> for the third patch, I feel it complicates some things. It removes
> harden_branch_predictor() from __do_user_fault() and adds it to various
> previous calling points.
> 
> This seems to be solely for adapting to the scenario of do_alignment() &&
> user_mode(regs) && addr >= TASK_SIZE. Does this scenario really exist?

As explained in the other thread, alignment faults are the first thing
that are checked when enabled, before permission fauls, so we can end
up entering do_alignment() from userspace with an address in the
kernel address space.

However, there is a user accessible page above TASK_SIZE, that is the
vectors page which can have userspace helpers in. Userspace can read
from this page, and thus can perform unaligned loads to this page.

The system behaviour of unaligned loads has been configurable, ARMv4,
for example, had the ability to check for alignment faults and raise
this exception. If that was disabled, then unaligned loads would
load the equivalent 32-bit aligned address and rotate the data in
the register. Compilers knew about this, and would code for it,
which made it ABI. Later compilers stopped using that which cut down
on the unaligned loads that userspace issued. Modern CPUs (ARMv7)
tend to behave "sanely" in that unaligned loads are generally
supported in hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

