Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87BAC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJs504H2TfnwscpKBSMlG38yShzo225c8pXdWha057o=; b=aHQj+VQSZVtyAf9nmFyuHhntuN
	KFIUjUbn71M16C95vvW+QJsf1SxqKiFRnt6nwilF/BdLBXZpqLsGKdMlSb2Jtjm4B0nwEDNmibkas
	QqHCEu+WkUbUr1qi+4/uqn+aBmHbUgNC8AvVORxrUi7DugvKLW99hXGoiHNmykXRW3Y+wD41gw84s
	3mJ/pBRFni8IDO+DEYhoy5fJKLMvylo/x8GbkVZgeWi7JFBKu6QMI1ZsuUZWPHdtLrmS+35TY+/HN
	Higy0rCFIGhP8Vlno2LWgePYj4BbUWsoOSzYjbcFQTHNgdoGRfW2R2GyBpSCcW5uSGjvwT4IF/tP/
	GHKIlH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZsO-00000001QHd-1bvt;
	Mon, 21 Sep 2026 08:59:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZsI-00000001QET-2vKb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:59:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EDD81D13;
	Mon, 21 Sep 2026 01:59:39 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C6993F86C;
	Mon, 21 Sep 2026 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981182; bh=MxtCpLf+O8fMXcDqbLvflbINzdvEZ16LzLkZP73gn9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FK+Mls5OtsTgLk6IYJdSnW5aG5Hi2PyyG5+lNpA7QC3REm4t/EmuYUI6dSmKRkXu6
	 XFEllh+1aZZLvqhsP6QNU8e3ewlhe/vTWtD7rILvB8TJgTmXaueVwHGTn2TEuBko7A
	 xMYf6KoKH2Kh+RZMiODh0bNF3jp3M3vdQMJW99+Y=
Date: Mon, 21 Sep 2026 09:59:38 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: will@kernel.org, julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH kvmtool 0/7] Fix --vcpu-affinity
Message-ID: <arDx-mrK_V6jiKvT@raptor>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
 <86zexe4ume.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zexe4ume.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_015946_782838_89665BC2 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Marc,

On Fri, Sep 18, 2026 at 01:22:17PM +0100, Marc Zyngier wrote:
> On Thu, 17 Sep 2026 16:49:25 +0100,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > Tested on an Orion board and a x86 machine. On the x86 machine, there's was this
> > one thread called 'kvm-nx-lpage-re' which had affinity of the VCPUs, but I
> > couldn't figure out where it was created. I grep'ed for each part of the name in
> > the source node, no luck. I used strace, and couldn't see a clone call that
> > returned the corresponding pid. Any clues would be appreciated.
> 
> This is a KVM internal thread, from what I can tell. See
> arch/x86/kvm/mmu/mmu.c::kvm_mmu_start_lpage_recovery().

Indeed, it didn't cross my mind that it might KVM that is creating the thread.
Thanks for the hint, and to Joey too, he suggested it offline.

Alex

