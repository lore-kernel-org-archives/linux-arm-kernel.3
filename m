Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C9BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMd3bS0uqcs7McwQj5vjF3TqbVfUowZQJ5sNvMWfsz8=; b=agt5uwGpBiLYxEi+yLmTE0ajiz
	sjTcAD1AJP9F2tGbL2TcltNMAqNHEcWrxN31fVhJdqjSrU7rGmuW0RZUpgr5+otWXbi9t7IYxqZFl
	slS38niwgnJ+ESuprIDe+0lNP8ee2vOrtqThqI1mpUVAnO5WQhxI1cLmqFbQUFF/fadwbax7eZ5LG
	+k8UZBkQ4MUk02aKQcMcmikca58Voy0BIRQaONUSp/nZRacAyDwKXGYLEzux2sBZUw2vb3d5M0XKt
	qWzWQ8KAzmXqkRzH0926urwPgVZLBTRQT2uMruTT9jI4Nt9WkZ2PUauHdY33nflmXZXwt+R/7ZDUW
	cLfjj7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYi8-0000000C86b-0qb5;
	Wed, 22 Jul 2026 15:18:16 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYi5-0000000C85p-0hLT;
	Wed, 22 Jul 2026 15:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784733493; x=1816269493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eIJCq0U0nvzWtAAiZhSd0Lkda2QdVkytVVFdCRV0V4Q=;
  b=EiSY9JuHAfHyy0ZtuUSMtCoT5PHI3PiiinuZ7p0ewsDMVeN6SlMMkwkP
   L8ZXAH6YljNAdM3MqAjYhgI+ep0m8TxqC+K7DkAPa3E7DQKAxh42tfzZr
   ImAunlj31w/e0IGPdDvm+joYRXhJajgD3TD07h4JJUlb++k8zXTxz8lZU
   vCQYSv3eIC8oLlbBitDw4fm69yLJ2JKgWtZA2MiUiH1UkjyTv7GPv+lKv
   wxHbKZLdJHvDktaIq6z+cVPj6ttq6zvOEX9i0yaBLiSQHw7rRD3EvW5JV
   mLNnwksMivieLtCLu8+ZpGxfRF+iWS10oK5kTm5/uK93/zsoPC0lAat+2
   w==;
X-CSE-ConnectionGUID: A3070L5hRambqdG1cn/eDg==
X-CSE-MsgGUID: dg4e9nt2S1mPb7J07yXhqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102920100"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="102920100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 08:18:12 -0700
X-CSE-ConnectionGUID: hLa2fyDLSsyVnjwP3QieRw==
X-CSE-MsgGUID: XxCvddLSRgOcXJMGgzV5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="282641187"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 08:18:12 -0700
Date: Wed, 22 Jul 2026 08:18:03 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH 6.16.y 0/6] cBPF JIT spray hardening
Message-ID: <gymgr5t5ocl3v5gykum2xlb5u3jhejmurgnodca534i6lih5q4@n7e6n3qf7szu>
References: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-0-2fc3e16263ac@linux.intel.com>
 <2026072151-outsell-suburb-64ea@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072151-outsell-suburb-64ea@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081813_250295_D6DE25B4 
X-CRM114-Status: GOOD (  14.93  )
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

On Tue, Jul 21, 2026 at 03:08:11PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 14, 2026 at 11:58:24AM -0700, Pawan Gupta wrote:
> > Hi,
> > 
> > These backports harden BPF JIT against spectre-v2 class of attacks. Without
> > a predictor flush, execution of new BPF program may use stale prediction
> > left behind by the freed one.
> > 
> > To avoid this, issue an IBPB flush on all CPUs on JIT program allocation.
> > The flush is conditional to spectre-v2 mitigation applied.
> > 
> > Patch 1-2: Adds the predictor flush hook and enables it on x86 via IBPB.
> > 
> > 	  bpf: Support for hardening against JIT spraying
> > 	  x86/bugs: Enable IBPB flush on BPF JIT allocation
> > 
> > Patch 3-6: Narrow the flush to only unprivileged JIT allocations
> > 	   to avoid redundant flushes. Also adds pack-selection changes
> > 	   that minimizes flushes.
> > 
> > 	  bpf: Restrict JIT predictor flush to cBPF
> > 	  bpf: Skip redundant IBPB in pack allocator
> > 	  bpf: Prefer packs that won't trigger an IBPB flush on allocation
> > 	  bpf: Prefer dirty packs for eBPF allocations
> > 
> > This one is mostly similar to 6.18:
> > 
> >   https://lore.kernel.org/all/20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com/
> 
> There is no active 6.16.y kernel branch, so why is this being sent to
> us?

Sorry that was a mistake. I had an old 6.16.y worktree in my machine and I
assumed it was still active. Please ignore.

