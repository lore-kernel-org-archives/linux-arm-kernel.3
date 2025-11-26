Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD1D1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdfgXlkpyLxaObMMHx43Tkpr2ds6LGq9BHgJcGxz0JU=; b=P9S8p1ZdhoRd6L3x0cZC0hyS2E
	y1o7RDMNwPYNsMFCim6vw530Q/ZvXvFwNPw0fnPhJwjkqz9ylFO0WXnDV4P/UFPm178nEzwUz5Ask
	qkchSDnxQC31qr6sKHJp+mzeCZURAg5aXm6T54trfs6s/DmTb+tQeT+rf60QpP432H0HB1Pe2kyOt
	1tfC/aDjKBbyxOfJ2GKxyURQham3A1D7EoVbrFH68KTgxj/g3nJmHIoA5jSq4mtLtNawiyG39RMb4
	0InAzm9E1gtzl8RlfJ0ppMsAT2LLKEJzV2hRPgbJ9xz52/LcwiQ2P9GZG988RUG8/htm01O78/4/Q
	GiMFwswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKZ1-0000000FVyi-1TlA;
	Wed, 26 Nov 2025 18:48:27 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKYy-0000000FVyN-3Dkk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mdfgXlkpyLxaObMMHx43Tkpr2ds6LGq9BHgJcGxz0JU=; b=ivStOe1KLxJxw1t8tb72zR8h5B
	W24XagOg7rDcPXZgjOv1FG9rwU2wWxKjHritLGxQkB7rwfZ46htLdBTDboPRj4SILvJyeNToEyTH0
	xeQY2zH9Jt34KfvU2TX7aaPQ873aCah7B6FLdWXnT3cieEefNdrNf0WEnG++C62r58kjy8crDm7u4
	VEzwxCE2EyyrsKYMOSP3AqVbLC/mQaYK2K+5cxl1C8/K9l4KdbpoFZB9ffzoEDmP/AQmnEhi/ckwf
	o0rUliXD2IRZhnuuNzU64OPR1fgeLSdXpAp6NE7v/QLeLHI48lVuZknFaIWBHEGVZkKcxbZcjIAtw
	PyuQ+Jgw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOKYu-0000000HYvd-2akG;
	Wed, 26 Nov 2025 18:48:20 +0000
Date: Wed, 26 Nov 2025 18:48:20 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: brauner@kernel.org, jack@suse.cz, linux@armlinux.org.uk,
	will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org,
	hch@lst.de, jack@suse.com, wozizhi@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251126184820.GB3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
 <20251126181031.GA3538@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126181031.GA3538@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_104824_809167_6076AB48 
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

On Wed, Nov 26, 2025 at 06:10:31PM +0000, Al Viro wrote:
> On Wed, Nov 26, 2025 at 06:19:52PM +0800, Xie Yuanbin wrote:
> > When the path is initialized with LOOKUP_RCU flag in path_init(), the
> > rcu read lock will be acquired. Inside the rcu critical section,
> > load_unaligned_zeropad() may be called. According to the comments of
> > load_unaligned_zeropad(), when loading the memory, a page fault may be
> > triggered in the very unlikely case.
> 
> > Add pagefault_disable() to handle this situation.
> 
> Way too costly, IMO.  That needs to be dealt with in page fault handler
> and IIRC arm used to do that; did that get broken at some point?

FWIW, on arm64 it's dealt with hitting do_translation_fault(), which
sees that address is kernel-space one, goes into do_bad_area(), sees
that it's from kernel mode and proceeds into __do_kernel_fault() and
from there - to fixup_exception().  No messing with VMA lookups, etc.
anywhere in process.

Had been that way since 760bfb47c36a "arm64: fault: Route pte translation
faults via do_translation_fault"...

Did that get broken?  Or is it actually arm32-specific?

In any case, making every architecture pay for that is insane - taking
a fault there is extremely rare to start with and callers sit on very
hot paths.  Deal with that in the fault handler.  Really.

We have no business even looking at VMAs when the fault is on kernel-mode
read access to kernel-space address.  And callers of load_unaligned_zeropad()
are not the place for dealing with that.

It's been years since I looked at 32bit arm exception handling, so I'd need
quite a bit of (re)RTF{S,M} before I'm comfortable with poking in
arch/arm/mm/fault.c; better let ARM folks deal with that.  But arch/* is
where it should be dealt with; as for papering over that in fs/*:
NAKed-by: Al Viro <viro@zeniv.linux.org.uk>

