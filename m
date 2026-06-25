Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94ADCDE00A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L28gvtHaVFUvm3g298xCnBf8nljEiAgGAj/WveWrpJ8=; b=JQ7xz83cHtTUv54UP8NUkKJocn
	/r3oQDtH3+HmXbnYf7wlNfX4MudRDSBa2uSNqy2cCHH/0KxNVF6pD6ty62n5nppMja/CW9nPhC32H
	INWwsO3U9qdWSP5lqd6EPM5c1jjBMnGQ9H+5wZlbkIyLK+x5IIR0c0VgA0umKPiE3YwUFrdS9yGX3
	U1YhvehW08PyUyDWyrR1FU+c90YdY0TjK80doDnkSpPUPAa0A9QokaOfneYEibsulXtgvisPATAMU
	654eIWKkgvmDU6m49DNM9XvB6tQedDDWaXhi0bfPMjoU/uX347YSnHXmPzUtxie2gDZT21vzCNtwg
	hUv0Afrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchv5-0000000949t-2rRG;
	Thu, 25 Jun 2026 11:06:55 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchuy-0000000947U-13Rz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782385608; x=1813921608;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3mMUyu41hsUV3+8vmn2FEljozTYUkLukSLGnNifcCP4=;
  b=kRN8GPTG52WZoe3Z8vC7enXS/aZIbLbdo8/FBEN4qPht8LxVoaZsprhm
   Gxr9xBzxskmAwv9o21LQaol7iyCNVMTNRyZ/dQlJ3fGqzms2gqBInopcz
   /VRleyegjC7IDvhoWQ+oWGjBCb8DC3+sOcesxU6BnSNUi4OPPyIzBreY+
   lJ5BgkVcB//zCzEkk5YGd3jE0NvftHS/VWbPlqw9O9g9mifvLoybtbOvm
   b7VH+cSsWd9bxYdPJ3DYgeUhYU+CcodahEDoWtFCUl7ZtXfde+hzyaJQG
   M7ipTpk4PiPGblMrIybHNK6gaZ4P5rN3pa/OomcJZqFCOgPtRcEC68YYI
   w==;
X-CSE-ConnectionGUID: KR84U1c4STykXAV0vmgr4w==
X-CSE-MsgGUID: Nab5VDVhSB682uyLY6wXUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82144897"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82144897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 04:06:05 -0700
X-CSE-ConnectionGUID: Ff5wjq2eS3y4NEnYZUPVEg==
X-CSE-MsgGUID: /T55+aBtS92ybM5/4REhrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="249131302"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.126])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 04:05:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Thomas
 Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Julia
 Lawall <julia.lawall@inria.fr>, Yury Norov <yury.norov@gmail.com>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 0/2] tracing: Move non-trace_printk prototypes into
 trace_controls.h
In-Reply-To: <20260625104007.041432666@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260625104007.041432666@kernel.org>
Date: Thu, 25 Jun 2026 14:05:56 +0300
Message-ID: <2037b6b62264c0192d45733ec1099c3ec14085a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_040648_303348_5F9BFC16 
X-CRM114-Status: GOOD (  12.96  )
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

On Thu, 25 Jun 2026, Steven Rostedt <rostedt@kernel.org> wrote:
> Remove trace_printk.h by creating a trace_controls.h for those places that
> need access to tracing prototypes like tracing_off() and for the places that
> need trace_printk() directly, to have it included directly.
>
> Changse since v3: https://lore.kernel.org/all/20260624081806.120105649@kernel.org/
>
> - Always include trace_controls.h in rcu.h (kernel test robot)
>
>   There are other configs that may include tracing_off() in rcu.h besides
>   the one that had the include of trace_controls.h. Just always include
>   it in that header to be safe.
>
> Steven Rostedt (2):
>       tracing: Move non-trace_printk prototypes into trace_controls.h
>       tracing: Remove trace_printk.h from kernel.h
>
> ----
>  arch/powerpc/kvm/book3s_xics.c         |  1 +
>  arch/powerpc/xmon/xmon.c               |  1 +
>  arch/s390/kernel/ipl.c                 |  1 +
>  arch/s390/kernel/machine_kexec.c       |  1 +
>  drivers/gpu/drm/i915/gt/intel_gtt.h    |  1 +
>  drivers/gpu/drm/i915/i915_gem.h        |  2 ++

For the i915 parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree.

>  drivers/hwtracing/stm/dummy_stm.c      |  1 +
>  drivers/infiniband/hw/hfi1/trace_dbg.h |  1 +
>  drivers/tty/sysrq.c                    |  1 +
>  drivers/usb/early/xhci-dbc.c           |  1 +
>  fs/ext4/inline.c                       |  1 +
>  include/linux/ftrace.h                 |  2 ++
>  include/linux/kernel.h                 |  1 -
>  include/linux/sunrpc/debug.h           |  1 +
>  include/linux/trace_controls.h         | 54 ++++++++++++++++++++++++++++++++
>  include/linux/trace_printk.h           | 56 ++--------------------------------
>  kernel/debug/debug_core.c              |  1 +
>  kernel/panic.c                         |  1 +
>  kernel/rcu/rcu.h                       |  1 +
>  kernel/rcu/rcutorture.c                |  1 +
>  kernel/trace/ring_buffer_benchmark.c   |  1 +
>  kernel/trace/trace.h                   |  1 +
>  kernel/trace/trace_benchmark.c         |  1 +
>  lib/sys_info.c                         |  1 +
>  samples/fprobe/fprobe_example.c        |  1 +
>  samples/ftrace/ftrace-direct-too.c     |  1 -
>  samples/trace_printk/trace-printk.c    |  1 +
>  27 files changed, 82 insertions(+), 55 deletions(-)
>  create mode 100644 include/linux/trace_controls.h

-- 
Jani Nikula, Intel

