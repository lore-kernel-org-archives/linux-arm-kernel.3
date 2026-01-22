Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF105D3EE6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7mVwEd6fwIbimNEJlQo8+vfAVD2+XS/xZOfgS1b43M=; b=WyNbYtLtydZ2JGXkzEdpkhkCR8
	9eJRkUVsyokaYrqvtr0qNsWfPdsGd50K1u3ySWiAWZKULH0xDS63Y2NfOFkap7KHgDhdXB4yRaD8T
	J1bSsqgRQFSVoHE2fPmri1KO6cbK1D26wbp3/tftBO1MCnHM2WjUfJfH2PCh3LAF7Iaw9uOkOW+23
	Z+xhmSXhFgjlUZsIxK2T8OqQ2BMuTmHnoQ9kuOgoCS4R8tcPBsv/8YkEP77aYbxnV4/PxLJ9F47zw
	FU+stOLFR6eHBU7WF6SDvVdnLoj103nbTNz6k9bGh9hLAHIT39ZtocPGnXDllEL12PgBnk9WKMAIu
	W8dS7Z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivdD-00000007Eij-3W3x;
	Thu, 22 Jan 2026 14:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivdC-00000007EiE-2Yii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94D6E600C3;
	Thu, 22 Jan 2026 14:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3070C116C6;
	Thu, 22 Jan 2026 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769091953;
	bh=Yl2qHTWE9Fz/7zZDgzhuQhCUpz24c+UW8s5oFbDoqv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgksenNLm8vVcFnylVsW42Tv+ZdtC5W29o1qOctfuLKEDknRSTgAq8uzfYssEItmI
	 1/wOROGwmmKK4A6J0Uf0YffnAOAuPW+Z6RN9LrRJxi0cMAMDPJW+sHCCBqhwnraKRy
	 kJJ07EzgsYxVOO45tD2+zF7iBGbuIZkGKgSP05MJZvD+tcbKYbrvLKNW11VeHgFWi+
	 VU9GuE9ZZl3qbAvIeLSbzdH7Yue/O7ulWuBcayymCEG/yFqi3DTV/nqppK2pyvu/Jm
	 wh4/199cda1IpN1SL0mJt6msWh7JYksIQOb9a5HPcwS51wHfuEWcY3g1/EH2SLxa1V
	 CSmkUrJoC7XpQ==
Date: Thu, 22 Jan 2026 15:25:50 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 29/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
Message-ID: <aXIzbmitdoJIMFCP@localhost.localdomain>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-30-frederic@kernel.org>
 <aW-cAlJCtI5Qtify@willie-the-truck>
 <aXEHf5nbZMI8LT4b@localhost.localdomain>
 <aXH0TZU7UNowTmwc@willie-the-truck>
 <aXIKDduX5qUXvOUX@localhost.localdomain>
 <aXILtazyRtpb3Yjy@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXILtazyRtpb3Yjy@willie-the-truck>
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

Le Thu, Jan 22, 2026 at 11:36:21AM +0000, Will Deacon a écrit :
> On Thu, Jan 22, 2026 at 12:29:17PM +0100, Frederic Weisbecker wrote:
> > Le Thu, Jan 22, 2026 at 09:56:29AM +0000, Will Deacon a écrit :
> > > On Wed, Jan 21, 2026 at 06:06:07PM +0100, Frederic Weisbecker wrote:
> > > > Le Tue, Jan 20, 2026 at 03:15:14PM +0000, Will Deacon a écrit :
> > > > > Hi Frederic,
> > > > > 
> > > > > On Thu, Jan 01, 2026 at 11:13:54PM +0100, Frederic Weisbecker wrote:
> > > > > > When none of the allowed CPUs of a task are online, it gets migrated
> > > > > > to the fallback cpumask which is all the non nohz_full CPUs.
> > > > > > 
> > > > > > However just like nohz_full CPUs, domain isolated CPUs don't want to be
> > > > > > disturbed by tasks that have lost their CPU affinities.
> > > > > > 
> > > > > > And since nohz_full rely on domain isolation to work correctly, the
> > > > > > housekeeping mask of domain isolated CPUs should always be a superset of
> > > > > > the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> > > > > > domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> > > > > > CPUs that are not domain isolated):
> > > > > > 
> > > > > > 	HK_TYPE_DOMAIN | HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
> > > > > > 
> > > > > > Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> > > > > > tasks and since this cpumask can be modified at runtime, make sure
> > > > > > that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> > > > > > by cpusets.
> > > > > > 
> > > > > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > > > > Reviewed-by: Waiman Long <longman@redhat.com>
> > > > > > ---
> > > > > >  arch/arm64/kernel/cpufeature.c | 18 +++++++++++++++---
> > > > > >  include/linux/cpu.h            |  4 ++++
> > > > > >  kernel/cgroup/cpuset.c         | 17 ++++++++++++++---
> > > > > >  3 files changed, 33 insertions(+), 6 deletions(-)
> > > > > 
> > > > > tbh, I'd also be fine just saying that isolation isn't reliable on these
> > > > > systems and then you don't need to add the extra arch hook.
> > > > 
> > > > Hmm, I think I heard about nohz_full usage on arm64 but I'm not sure.
> > > > And I usually expect isolcpus or cpuset isolated partitions to be even
> > > > more broadly used, it's lighter isolation with less constraints.
> > > > 
> > > > Anyway you're probably right that we could remove isolation support here
> > > > but I don't want to break any existing user.
> > > 
> > > fwiw, I think it's only some Android markets using the mismatched 32-bit
> > > support and we're definitely not using nohz_full there.
> > 
> > Now that removal becomes appealing. And what about isolcpus= / isolated cpuset
> > which only consist in scheduler domain isolation? Probably not used by android
> > either.
> > 
> > Ok but is there a way to detect on early boot that the system has mismatched
> > 32 bits support? Because I need to fail nohz_full= and isolcpus= boot parameters
> > early on top of this information without waiting for secondary CPUs boot.
> 
> Honestly, I'm not sure I'd bother trying to be smart here. Even if the
> system has enabled support for mismatched 32-bit CPUs, things should
> still work properly with nohz_full/isolcpus if all the tasks are 64-bit,
> right?
> 
> In which case, I'd just document whatever weird behaviour you get if
> somebody throws 32-bit tasks into the mix. Adding hooks to the generic
> code for this use-case just seems like a waste, as they're not going to
> be used in practice and it increases the maintenance burden.

Ok, how does this updated version look now?

---
From: Frederic Weisbecker <frederic@kernel.org>
Date: Thu, 24 Jul 2025 23:38:48 +0200
Subject: [PATCH] sched/arm64: Move fallback task cpumask to HK_TYPE_DOMAIN

When none of the allowed CPUs of a task are online, it gets migrated
to the fallback cpumask which is all the non nohz_full CPUs.

However just like nohz_full CPUs, domain isolated CPUs don't want to be
disturbed by tasks that have lost their CPU affinities.

And since nohz_full rely on domain isolation to work correctly, the
housekeeping mask of domain isolated CPUs should always be a subset of
the housekeeping mask of nohz_full CPUs (there can be CPUs that are
domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
CPUs that are not domain isolated):

	HK_TYPE_DOMAIN & HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN

Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
tasks. Note that cpuset isolated partitions are not supported on those
systems and may result in undefined behaviour.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marco Crivellari <marco.crivellari@suse.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Waiman Long <longman@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/arch/arm64/asymmetric-32bit.rst | 12 ++++++++----
 arch/arm64/kernel/cpufeature.c                |  6 +++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/arm64/asymmetric-32bit.rst b/Documentation/arch/arm64/asymmetric-32bit.rst
index 57b8d7476f71..fc0c350c5e00 100644
--- a/Documentation/arch/arm64/asymmetric-32bit.rst
+++ b/Documentation/arch/arm64/asymmetric-32bit.rst
@@ -154,10 +154,14 @@ mode will return to host userspace with an ``exit_reason`` of
 ``KVM_EXIT_FAIL_ENTRY`` and will remain non-runnable until successfully
 re-initialised by a subsequent ``KVM_ARM_VCPU_INIT`` operation.
 
-NOHZ FULL
----------
+SCHEDULER DOMAIN ISOLATION
+--------------------------
 
-To avoid perturbing an adaptive-ticks CPU (specified using
-``nohz_full=``) when a 32-bit task is forcefully migrated, these CPUs
+To avoid perturbing a boot-defined domain isolated CPU (specified using
+``isolcpus=[domain]``) when a 32-bit task is forcefully migrated, these CPUs
 are treated as 64-bit-only when support for asymmetric 32-bit systems
 is enabled.
+
+However as opposed to boot-defined domain isolation, runtime-defined domain
+isolation using cpuset isolated partition is not advised on asymmetric
+32-bit systems and will result in undefined behaviour.
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef9..f0e66cb27d17 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1669,7 +1669,7 @@ const struct cpumask *system_32bit_el0_cpumask(void)
 
 const struct cpumask *task_cpu_fallback_mask(struct task_struct *p)
 {
-	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_TICK));
+	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_DOMAIN));
 }
 
 static int __init parse_32bit_el0_param(char *str)
@@ -3987,8 +3987,8 @@ static int enable_mismatched_32bit_el0(unsigned int cpu)
 	bool cpu_32bit = false;
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
-		if (!housekeeping_cpu(cpu, HK_TYPE_TICK))
-			pr_info("Treating adaptive-ticks CPU %u as 64-bit only\n", cpu);
+		if (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN))
+			pr_info("Treating domain isolated CPU %u as 64-bit only\n", cpu);
 		else
 			cpu_32bit = true;
 	}
-- 
2.51.1


