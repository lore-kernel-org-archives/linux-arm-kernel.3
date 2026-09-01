Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2338BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JILWnOs54Nn3C+Kuiyqfpag/plbfbFDDxTr4XHpskoY=; b=iMWadpYoEfZ9ksypoWPPAuFo5E
	fhbox2ae22H+MVIq0ALbY6VBCZCeLx/i2HLFD3Xud/wGwAnjVTayZE/b1XThIWEkMvzWtHMHcLDxe
	ksV5en1h0jbG2OTA2i57vcEEMS6B1hpZHKEIhsN2jYyDz0rOX9UqyXzHFUOYVg5aw1E7X1KsYkMH8
	lBDmmeBRNskZ4abrlwgJ7c4JoMcia4jsFtKbC3FfqEThvakaLgs0XA6+01s58ZW5eQy7buiDG0Tb3
	R1UgADcItGruyayb1+1kWjL3UTA9PpTmtvteTyp0ldp/Fs+l1kEy9CDdQ/63xl5wukovsDYFZYtsF
	Ib5l46wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LgZ-0000000BXQz-0VM7;
	Tue, 01 Sep 2026 10:25:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LgY-0000000BXQZ-0Q1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B446401E2;
	Tue,  1 Sep 2026 10:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40851F000E9;
	Tue,  1 Sep 2026 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788258345;
	bh=JILWnOs54Nn3C+Kuiyqfpag/plbfbFDDxTr4XHpskoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GwKJ2pb20IazCMdTzU5Hgo8RXNWu8ZZnGm6PIg9BsHyoQJnaEmS4BmR4y8WeFGnTn
	 oLLkO9ba7prZwJj7sScsLLMAEsTE0f4s5YmpfnsHiI+QbOs+0tUjXj3Mydt4nYfTfT
	 TZfuPnXRQZjOrpliQObdkKuYcCBoHsO3XDC7IoU+wuDwAyYfCDhL2a/SvQjoK6YbPs
	 HcT0SgwLq3/0xAO30SY9kS1UX5P0iel5EP9MtMXfqPnz8K62k6mxQtO8Bl288kXKqe
	 1P7ip+w7s6bicT5OnN3+buZ4N+LKT10n8BUyHYI0y34N8bQisn6din/SO6CT4as7hB
	 gvZ5OO9OE2ncg==
Date: Tue, 1 Sep 2026 11:25:33 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <apaoHUrbY_1JFjfU@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
 <110d75e9-1580-42d3-b137-89bdad22b80a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <110d75e9-1580-42d3-b137-89bdad22b80a@huawei.com>
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

On Mon, Aug 31, 2026 at 11:18:47AM +0800, Jinjie Ruan wrote:
> 在 2026/7/7 1:39, Will Deacon 写道:
> > On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
> >> On 6/24/2026 8:16 PM, Will Deacon wrote:
> >>> Please just give me the time I asked for. If you want to help out in the
> >>> meantime, there are plenty of patches that need reviewing...
> >>
> >> It was a mistake on my part, and I sincerely apologize for wasting
> >> community review resources and disrupting your schedule.
> >>
> >> I will absolutely back off now and wait for your official series. Lesson
> >> learned. Thanks for your patience and for calling me out on this.
> > 
> > So I've mostly got the old series back on its feet:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
> > 
> > but there are still two issues left to resolve:
> > 
> >   1. The printing that can happen before RCU has started. Although I've
> >      reduced this somewhat, there are still error paths in e.g.
> >      verify_local_cpu_capabilities() that print a message before dying.
> > 
> >   2. check_local_cpu_capabilities() can mutate the system capability
> >      state via update_cpu_capabilities(), so it's really dodgy running
> >      that prior to synchronisation.
> 
> Just a gentle ping on this. I replied to the two remaining issues
> earlier — any thoughts on my response? Happy to help test or rebase if
> that helps.

I've been preparing a series to post asap (I was waiting for the merge
window to close), but I'm also looking at some of the id register issues
that have been pointed out around rng, mpam and mte.

Will

