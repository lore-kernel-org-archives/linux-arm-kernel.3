Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE84CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ3AyNwcHkDwyotJKfmaIM16qng3evSu5qPs3Xeesp0=; b=jryHOWLAvBAzgmUMyH/6Pn5NvC
	Hbk4Vk2Z9sgPO8XzxTyE88cJbdPh0CzLUsjbMeMTGNleExuO/evNov5chO9qzYn/2ilw3PvoEu3S/
	c1rCvEP5dQhxztm9Va8tfjTj2GHfiBLtS9E4McjF2V9Nxht8r5nWmHs0sfZbj6YAaQ17XhM4Pwst5
	1DkFIQByCTy+OVDwxa8ye5yoluTiwNI6UhZD78G4mJ/IjzcUtVPS1gpXIIXDz4d5b1tjSUVS2ApAx
	Ns5CxqArGqR2g4vRR6AhDZGNJq/4IgkpijWkyo5HQn17K+7xdinmklz66Ro0pbDIEOEyGSPd8UKeP
	y82zExBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0f3-0000000GHHi-30EH;
	Mon, 18 May 2026 16:17:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0f2-0000000GHHE-2I5q;
	Mon, 18 May 2026 16:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GQ3AyNwcHkDwyotJKfmaIM16qng3evSu5qPs3Xeesp0=; b=fU3+SCOFfUUlkOUmyIuTsbnywe
	89kqfFg93eDsIn1f4q6CEtRQBpKAuBqXFwczvVeUyK1MqiAmO/Is7GNS6SQajMkq/Ou4EEPXO5gjd
	QG3X5RgIMMIHaZt2k6X7tQJKlMJUiidUWjRLLsCK96ufITmHS/etRFdCcKGXPu9m3Y/9455P1VY+7
	yI95TKqa8/ath+SxD9IFOJNLaKt8Sstckq3piVjXElv/WkNhCMR7wKydSnX4sVdCnnWMjLyWBjQ2b
	4vkZR2poj4v3QZS8BJi9xbkgnOoh2L9CaUbogqrM9GJMbxKImRWLaIAgDeo+jPw7Sed1HBtUwdBx+
	aOLN/sjA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0em-00000004wNm-3PR8;
	Mon, 18 May 2026 16:17:28 +0000
Date: Mon, 18 May 2026 17:17:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, surenb@google.com,
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ags7mPK7Ong0ZsBf@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
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

On Mon, May 18, 2026 at 07:25:54PM +0800, Barry Song wrote:
> We have clearly observed that the `fork()` operations of many
> popular Android apps, such as iQiyi, Baidu Tieba, and 10086,
> end up waiting on page-fault (PF) I/O when the VMA lock is
> held during I/O operations. This has already become a
> practical issue. I also believe this can lead to chained
> waiting, since the global `mmap_lock` blocks all threads that
> need to acquire it.

It's always been a terrible idea to call fork() from a multithreaded
application.  For example, this question:

https://stackoverflow.com/questions/53601200/calling-fork-on-a-multithreaded-process

or this lwn thread: https://lwn.net/Articles/674660/

Do we have any insight into why these applications are doing this
horrible thing?

