Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E8D10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ad8ik7IFSyx7voLIMN7w0BRCBgrkaim2ypdKamKnu4=; b=gt/J1R42gZhLlQFvAGOSWXaSXi
	si8LH46Bo2hTurL4C8uoNd1IFfQmILVBO5TpvdDR/dqHFloutLM4dZZqXD+GLMF5yf4fkT9IWXduf
	9vtkHeXGURKvX8Ehb0KlYXg1IzTNuvT4lBsnrN4I1Hahe+Bhhwz4s3cxfXNYoy/Vxpta0R7mnArNd
	ENm02y+i5oDIINKOe46qsryBst11FXAo+YFam0a+F9DkAbcSPOhUL3MN23ofUQTiFskdLOvgct0O/
	LjO3grt9NP34jbUiJm5BCwU7gsIyh7bNXhsW2E3d6p06Nlr0QDlRiDNS9c+wNgksHgnaDHD8uUdAj
	SkImGiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWJd-0000000G745-1MkH;
	Thu, 27 Nov 2025 07:21:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWJa-0000000G738-3NZB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 07:21:20 +0000
Date: Thu, 27 Nov 2025 08:20:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764228059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Ad8ik7IFSyx7voLIMN7w0BRCBgrkaim2ypdKamKnu4=;
	b=fLInNBs8TXqUHGtP3Sh1sI6ytVwTqfBLr12hBnrz+MA8vrF5DTVkSUXNqFbzywP456lNeB
	ez73iUWVfEsf7FI0j6ikXXxHMfwNimMtiy7rW8tC5ZhcKUxZU29BYos4u2BXpsCC5Ald34
	Vs0GfoQublaZnEOiSv48K7uNCrPlu07CIS0rI3lgaEBNIk8gpzEjvWrfezSP+0BW7PTEpx
	J8wjLrzxdRXyxoQKeZi0kBumr+eR2LmUSOrGj8xPUOqnMccqZfx0+qYvS5U941NFYPFFZS
	PrZb9p0STUdw3Zxv3qYbCkZlJXkHt0KmsNyzGv9MQX3zaLVbHr0vTtdeG4MNJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764228059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Ad8ik7IFSyx7voLIMN7w0BRCBgrkaim2ypdKamKnu4=;
	b=dk5SuCbOQvbURXCZeKYw/C9ynGOXmOuzOVf9ofmc8gtUWPcmsiNWWOsyOjHAZ0L3i9i8YU
	ZNHJRX1mAseyi7CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: viro@zeniv.linux.org.uk, linux@armlinux.org.uk, will@kernel.org,
	david.laight@runbox.com, rmk+kernel@armlinux.org.uk,
	brauner@kernel.org, jack@suse.cz, nico@fluxnic.net,
	akpm@linux-foundation.org, hch@lst.de, jack@suse.com,
	wozizhi@huaweicloud.com, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, catalin.marinas@arm.com, rppt@kernel.org,
	vbabka@suse.cz, pfalcato@suse.de, lorenzo.stoakes@oracle.com,
	kuninori.morimoto.gx@renesas.com, tony@atomide.com, arnd@arndb.de,
	punitagrawal@gmail.com, rjw@rjwysocki.net, marc.zyngier@arm.com,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251127072057.EbvhUyG4@linutronix.de>
References: <aSeNtFxD1WRjFaiR@shell.armlinux.org.uk>
 <20251127030316.8396-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251127030316.8396-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_232119_006616_B79CE004 
X-CRM114-Status: GOOD (  17.69  )
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

On 2025-11-27 11:03:16 [+0800], Xie Yuanbin wrote:
> On, Wed, 26 Nov 2025 19:26:40 +0000, Al Viro wrote:
> > For quick and dirty variant (on current tree), how about
> > adding
> > 	if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
> > 		goto no_context;
> >
> > right after
> >
> > 	if (!ttbr0_usermode_access_allowed(regs))
> > 		goto no_context;
> >
> > in do_page_fault() there?
> 
> On, Wed, 26 Nov 2025 23:31:00 +0000, Russell King (Oracle) wrote:
> > Now, for 32-bit ARM, I think I am coming to the conclusion that Al's
> > suggestion is probably the easiest solution. However, whether it has
> > side effects, I couldn't say - the 32-bit ARM fault code has been
> > modified by quite a few people in ways I don't yet understand, so I
> > can't be certain at the moment whether it would cause problems.
> 
> I think I've already submitted a very similar patch, to fix another bug:
> On Thu, 16 Oct 2025 20:16:21 +0800, Xie Yuanbin wrote:
> > +#ifdef CONFIG_HARDEN_BRANCH_PREDICTOR
> > +	if (unlikely(addr > TASK_SIZE) && user_mode(regs)) {
> > +		fault = 0;
> > +		code = SEGV_MAPERR;
> > +		goto bad_area;
> > +	}
> > +#endif
> Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com
> 
> However, the patch seems to have received no response for a very long
> time.

This all should be covered by the series here
	https://lore.kernel.org/all/20251110145555.2555055-1-bigeasy@linutronix.de/

or do I miss something.

Sebastian

