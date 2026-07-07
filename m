Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5O3kKa+EQ5uAjyG128pW8I8XY6LFNYAh7h21UFVGtY=; b=2qtpl2t550Uo5YG3w8hBuSlTdv
	EY+0Ke4wnhHawKfm00BmtnHTcnubv1s7Bmqk++9N0A0Fd1Naa9KV7CFpCsaQh9RPyMA9HNu5tvC6E
	7ozBBMPefo0bdYuD/+xi/XD3XYmBeaqJD3hKWFowbE8BI55hAz9Ew96xc14iWde201tLGmS5Gqksi
	M/o2GOfyypPhHl8WoQUUhtnY8O5RabGxXwfhG7Xw8P25eIvfKCqq4NrXX64yDYEzGpyfZ01zm115c
	8Oa448hGmvJRYvhch+M6suE7umCuz+AoI1piC7E3Eiq4ncPcrI8moQ/Y77whs2OjanNLSyMww9xMA
	D/NuqT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3BR-0000000ElhN-446u;
	Tue, 07 Jul 2026 10:37:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3BQ-0000000ElhB-3omG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:37:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51AD2419C5;
	Tue,  7 Jul 2026 10:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1225A1F000E9;
	Tue,  7 Jul 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420664;
	bh=M5O3kKa+EQ5uAjyG128pW8I8XY6LFNYAh7h21UFVGtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2EbRhZxTe2YotdF+J+gGbv+GMMbo+NMUuhwVDb4IEx+n1ieO+I0Nll2mMyqZbLFm
	 yc5Kk5R1tBJuIsojhCKa/XTU1+H9veSADqcMUOdMce0HV3qOoUdVLULeUldzF6xuKd
	 m92XRaz26xwKNhdQx+X+39ZkNcNCwVTgk1X/P4MkfXwMQZMMqeqF461M5iDfl6gIOk
	 JgQQAfeYGq4Aeajc+6VeVuoyZUg0KqBLCI4fDS+UHeWZXH7eONhSspu9IF2Ru24bgU
	 htXPRN9xcD4L0lR2wfLKiZZnk816LwEUcLQFaKUgDTDCC27G4h9dgzRd75upT+zD6Q
	 0fK5uN7UZ9QUA==
Date: Tue, 7 Jul 2026 11:37:32 +0100
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
Message-ID: <akzW7HrxNkj2DMas@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
 <3bf910b8-c7e8-4a22-8e1d-fa701694369f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bf910b8-c7e8-4a22-8e1d-fa701694369f@huawei.com>
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

On Tue, Jul 07, 2026 at 04:14:06PM +0800, Jinjie Ruan wrote:
> 
> 
> On 7/7/2026 1:39 AM, Will Deacon wrote:
> > Hi Jinjie,
> > 
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
> 
> Hi Will,
> 
> I tested the above-mentioned latest patch on v7.2-rc1 with error inject
> on QEMU, which constructed the following errors:
> 
> 1、CPU4 does not support 52-bit VA
> 
> 2、CPU6 does not support 4K granule
> 
> 3、CPU16 and CPU17 call cpu_die_early() early in check_early_cpu_features().
> 
> 4、CPU18 call cpu_panic_kernel() early in check_early_cpu_features().
> 
> The error output is not correct especially for CPU4, CPU6, and CPU18 as
> below, it seems that some error messages are overlapping on the same
> CPU, and some errors are causing the CPU to be misidentified.:
> 
> (This leaves another blind spot where the 'failed to report alive state'
> message is skipped for CPU16 and CPU17, as pointed out in
> https://lore.kernel.org/all/bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com/):
> 
> [    0.594323] CPU16: will not boot
> [    0.605818] CPU17: will not boot
> 
> ...
> 
> [   11.052387] CPU4 failed to report alive state
> [   11.059799] Parallel CPU bringup failed; consider passing
> "cpuhp.parallel=off" for a more accurate diagnosis.
> [   11.060179] CPU4 detected lack of support for 52-bit VAs
> [   11.060426] CPU4 detected lack of support for 4K granules
> 
> [   11.061103] Kernel panic - not syncing: CPU4 detected unsupported
> configuration
> [   11.061534] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 7.2.0-rc1-00019-g52296829d92b #305 PREEMPT
> [   11.062052] Hardware name: linux,dummy-virt (DT)
> [   11.062230] Call trace:
> [   11.062339]  show_stack+0x18/0x24 (C)
> [   11.062528]  dump_stack_lvl+0x11c/0x168
> [   11.062684]  dump_stack+0x18/0x24
> [   11.062818]  vpanic+0x568/0x574
> [   11.062947]  do_panic_on_target_cpu+0x0/0x1c
> [   11.063111]  secondary_start_kernel+0x0/0x188
> [   11.063276]  cpuhp_bringup_ap+0x244/0x254
> [   11.063430]  cpuhp_invoke_callback+0x168/0x2ac
> [   11.063594]  __cpuhp_invoke_callback_range+0x90/0x118
> [   11.063776]  _cpu_up+0xec/0x1b8
> [   11.063905]  cpu_up+0xcc/0x158
> [   11.064032]  cpuhp_bringup_mask+0x9c/0xe0
> [   11.064189]  bringup_nonboot_cpus+0x12c/0x14c
> [   11.064352]  smp_init+0x30/0x8c
> [   11.064481]  kernel_init_freeable+0x18c/0x40c
> [   11.064645]  kernel_init+0x24/0x1dc
> [   11.064785]  ret_from_fork+0x10/0x20
> [   11.066612] SMP: stopping secondary CPUs
> [   11.068198] ---[ end Kernel panic - not syncing: CPU4 detected
> unsupported configuration ]---

I think this is actually working as intended. CPU4 has detected the
problems and the system has panicked as expected. Systems like this are
horribly broken anyway, so if you _really_ need to identify the CPUs
causing problems, you can disable parallel onlining on the cmdline (as
the diagnostic message above suggests).

Will

