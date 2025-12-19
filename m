Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98CD74964
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4kZkHpdaiDkkZcvv8EinliAFULym58ZDDfTLrx6tdQ=; b=lo5R0fdBGLb2T/xDu72hcX3Zu4
	G9xAVsrcCxwet8yaOnEWcymhh0BeuxUSfhBtEu8suCMaNH5yWlcaKnj+Lo1y7d4MKllvArcBemSxK
	EstsMTNyLw1ibX1uAwc8y++VsyhdJ0GkKk52OnTCMfPmXzkjW+km3uoLFRc5aw4dR5+nVre6k8NJz
	edFq43T8B45miw71nnjKXsAD/n/ymR99Nn15cjq87tDuf2MgAT3DRlCEUMOQj60gpEGkaXxUg203r
	seAbkAgJCyHjivbzdt8zjdGuG1UhjlHiDy3//YSEMfchya+UuZBm2E6onJpdYEq6JGdw49kiYYfKE
	EKHP162w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc7-00000009p3B-1h1u;
	Fri, 19 Dec 2025 08:13:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc0-00000009ovN-0KhT;
	Fri, 19 Dec 2025 08:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B70624416F;
	Fri, 19 Dec 2025 08:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C38C116B1;
	Fri, 19 Dec 2025 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131999;
	bh=c8UdFBb7F8dmejdnU77Se4Vh0A297D7YwvyeUjSzvGs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bvV56RgSwPdWBOuOtUPVcXSmtsttDdT6myfmjpB+QZDRMIVyr7unLn+z+isWBP0Wy
	 Ny2hKlhPpLoymTC6JQ0DzSc0lTtu4IdOjoxflDk5ls0qr9rZjX4H6YN/PUpzbnQdAP
	 YpBOlDFBUmVl0ocWFf3MbPKhlUbei8L4bQwXt0Rf0W+fKMNrpn0yKASpPBE+phUtE+
	 eS0MjQp6QSCCa4q9q8ZjhuUYyTNuM7t+D6ja4QPtH8eUDpUit5SxogEKu15rseJwgW
	 mLfXoM8WdWG/4ZWUCIaOk3MfOwvaMmfztq3vshIPQCpKqjoQqXVEii+dxxDbG6AI8Q
	 Q/PUXYGj8Kqgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5B5D380AA50;
	Fri, 19 Dec 2025 08:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 00/31] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613180853.3684357.18339473690014642605.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:08 +0000
References: <20251114150133.1056710-1-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, acme@kernel.org, jpoimboe@kernel.org,
 pbonzini@redhat.com, arnd@arndb.de, frederic@kernel.org, paulmck@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 samitolvanen@google.com, davem@davemloft.net, neeraj.upadhyay@kernel.org,
 joelagnelf@nvidia.com, josh@joshtriplett.org, boqun.feng@gmail.com,
 urezki@gmail.com, mathieu.desnoyers@efficios.com, mgorman@suse.de,
 akpm@linux-foundation.org, masahiroy@kernel.org, shenhan@google.com,
 riel@surriel.com, jannh@google.com, dan.carpenter@linaro.org,
 oleg@redhat.com, juri.lelli@redhat.com, williams@redhat.com,
 ypodemsk@redhat.com, mtosatti@redhat.com, dwagner@suse.de, ptesarik@suse.com,
 sshegde@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001320_718298_43B355DB 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Frederic Weisbecker <frederic@kernel.org>:

On Fri, 14 Nov 2025 16:01:02 +0100 you wrote:
> Context
> =======
> 
> We've observed within Red Hat that isolated, NOHZ_FULL CPUs running a
> pure-userspace application get regularly interrupted by IPIs sent from
> housekeeping CPUs. Those IPIs are caused by activity on the housekeeping CPUs
> leading to various on_each_cpu() calls, e.g.:
> 
> [...]

Here is the summary with links:
  - [v7,01/31] objtool: Make validate_call() recognize indirect calls to pv_ops[]
    (no matching commit)
  - [v7,02/31] objtool: Flesh out warning related to pv_ops[] calls
    (no matching commit)
  - [v7,03/31] rcu: Add a small-width RCU watching counter debug option
    https://git.kernel.org/riscv/c/d1e6d2773898
  - [v7,04/31] rcutorture: Make TREE04 use CONFIG_RCU_DYNTICKS_TORTURE
    https://git.kernel.org/riscv/c/82a224498005
  - [v7,05/31] jump_label: Add annotations for validating noinstr usage
    (no matching commit)
  - [v7,06/31] static_call: Add read-only-after-init static calls
    (no matching commit)
  - [v7,07/31] x86/paravirt: Mark pv_sched_clock static call as __ro_after_init
    (no matching commit)
  - [v7,08/31] x86/idle: Mark x86_idle static call as __ro_after_init
    (no matching commit)
  - [v7,09/31] x86/paravirt: Mark pv_steal_clock static call as __ro_after_init
    (no matching commit)
  - [v7,10/31] riscv/paravirt: Mark pv_steal_clock static call as __ro_after_init
    (no matching commit)
  - [v7,11/31] loongarch/paravirt: Mark pv_steal_clock static call as __ro_after_init
    (no matching commit)
  - [v7,12/31] arm64/paravirt: Mark pv_steal_clock static call as __ro_after_init
    (no matching commit)
  - [v7,13/31] arm/paravirt: Mark pv_steal_clock static call as __ro_after_init
    (no matching commit)
  - [v7,14/31] perf/x86/amd: Mark perf_lopwr_cb static call as __ro_after_init
    (no matching commit)
  - [v7,15/31] sched/clock: Mark sched_clock_running key as __ro_after_init
    (no matching commit)
  - [v7,16/31] KVM: VMX: Mark __kvm_is_using_evmcs static key as __ro_after_init
    (no matching commit)
  - [v7,17/31] x86/bugs: Mark cpu_buf_vm_clear key as allowed in .noinstr
    (no matching commit)
  - [v7,18/31] x86/speculation/mds: Mark cpu_buf_idle_clear key as allowed in .noinstr
    (no matching commit)
  - [v7,19/31] sched/clock, x86: Mark __sched_clock_stable key as allowed in .noinstr
    (no matching commit)
  - [v7,20/31] KVM: VMX: Mark vmx_l1d_should flush and vmx_l1d_flush_cond keys as allowed in .noinstr
    (no matching commit)
  - [v7,21/31] stackleack: Mark stack_erasing_bypass key as allowed in .noinstr
    (no matching commit)
  - [v7,22/31] objtool: Add noinstr validation for static branches/calls
    (no matching commit)
  - [v7,23/31] module: Add MOD_NOINSTR_TEXT mem_type
    (no matching commit)
  - [v7,24/31] context-tracking: Introduce work deferral infrastructure
    (no matching commit)
  - [v7,25/31] context_tracking,x86: Defer kernel text patching IPIs
    (no matching commit)
  - [v7,26/31] x86/jump_label: Add ASM support for static_branch_likely()
    (no matching commit)
  - [v7,27/31] x86/mm: Make INVPCID type macros available to assembly
    (no matching commit)
  - [RFC,v7,28/31] x86/mm/pti: Introduce a kernel/user CR3 software signal
    (no matching commit)
  - [RFC,v7,29/31] x86/mm/pti: Implement a TLB flush immediately after a switch to kernel CR3
    (no matching commit)
  - [RFC,v7,30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush IPIs under CONFIG_COALESCE_TLBI=y
    (no matching commit)
  - [RFC,v7,31/31] x86/entry: Add an option to coalesce TLB flushes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



