Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2356FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8bn+J1m/2WVL2HRQqPjPX3jby4LCx/UUlRbPjdP5Mc=; b=tuLgeDb/Hj5XwEfgOvfzTcMo5d
	NNZZTF9YDdcO5jnHKZ94AGBRNvNG50dsMWu7euUYEZ9kMPEk+oSsPUsHbAcbMmfgKlp+qecZ0um3L
	qE/ZHrE8d4UblSqB6Osml9BtzXZrgvSpI67Py/R6qrROnxl+W9f5tcTJwonnDVnX/Kuh8np57neBP
	LzsJvxKDDSnkwj5z6em0dtyMYvigXZgWG8Uf9YA6M0TiCFZIM0qrk/5v8ShU65ZSGBU7aZD9aWup9
	mxOTdP0TGIWVn0Lubr+TrKNF6u+hrlyqzc/K40QaLXN97z6QJbJstDPrf4Z28bzYjwF3jMCJOCCsu
	iv4KoNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJfP-00000009zqu-2L2S;
	Mon, 13 Jul 2026 16:38:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJfO-00000009zqY-2IRB;
	Mon, 13 Jul 2026 16:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+8bn+J1m/2WVL2HRQqPjPX3jby4LCx/UUlRbPjdP5Mc=; b=maZ04DwFOeZI3/p+3+c8d8Aq29
	dLI2YSSOcSCKt3zuw6VDEAP7hNr+Xh+AABGxRthTJU03zHAszRqpRRqlx7Nxn6q/aH2E0PSA7InS2
	RAOE91M5kTVvPIXLO13mvNfQCAEOWesIlQlzjBBWszwBSQNLbRjGLtkCeHm9D42Rw8MKUXuyyOgsk
	5OdBkivpqF+TnC/Cwa74BcyuD/SQ8IbJxaUdSCy9m3zzjKl5/z9cNmMj+QJ/L7vH/0PeLgJ0/v7P3
	XPOCE906nydtCFDVzbcIKSdF7yWYrigm+KkapOLjp9qLG7Agq4a0kQNL9ikVVx7ovT1WtNQYzQzUM
	1BrLWwMQ==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJfK-0000000BrDX-1oXN;
	Mon, 13 Jul 2026 16:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783960679; x=1815496679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4kZEQHCKkpYpxkKyYJlUA0Zza6SQ8vOAw/fP08uqXDo=;
  b=cQXVCGBJmIGQ3cB7gicDP+9isOj/PsucTY9v0STicXTqfz0DQrxJSxrX
   7r/Xhs3uamx+mAoTTAi+NyUVpTl6fFQwRjRfPqFgZAGSJFrve2f+rccpW
   iqd7aYpUpQTL68EHTo4WoGoCyvbZ+jX4Y6/YDQW5Y2YWT4Q+ANEJbX8jk
   kPv76ULdr+RtW+Du5fC09VNKpGHfakkgEsuIPKIVjtj5Ysgc3go/COuwK
   ADPwqr6MlIwA/gdrsYWDYmiMbh+NKvR9j21VtshWcXAKN7CSuENDAElQ/
   KaP1Me53t1C9OwAMIZ2kGZG+kc/E52OURINOAa2U+9krAxyO+SHY7UNhr
   w==;
X-CSE-ConnectionGUID: 0lnt/pZYRpCIPd9uexI0Hg==
X-CSE-MsgGUID: Bo1foV6zRCyCuNF9KSFJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84768095"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84768095"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 09:37:53 -0700
X-CSE-ConnectionGUID: hWdotUdbRAyEFlX+x/kfWQ==
X-CSE-MsgGUID: leJxOZsNRQSKnAtRZj8eFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="249245643"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 09:37:52 -0700
Date: Mon, 13 Jul 2026 09:37:45 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: bot+bpf-ci@kernel.org
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org, sashal@kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, x86@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH 7.1.y 1/6] bpf: Support for hardening against JIT spraying
Message-ID: <ehtglcrfzb4feb2ysknrcyvz7t2vc2ui2nfbunypteeexbsfu7@x477johvq6pl>
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-1-5ac5a2d6797f@linux.intel.com>
 <de3ebfe684f280473617b560a9dcf501df07833f835a08eb6e75720cd03662b4@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de3ebfe684f280473617b560a9dcf501df07833f835a08eb6e75720cd03662b4@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_173758_839143_3F9D0EF9 
X-CRM114-Status: GOOD (  18.34  )
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

On Thu, Jul 09, 2026 at 10:52:04PM +0000, bot+bpf-ci@kernel.org wrote:
> > commit 96cce16e26dd02a8678f1e87f88a4b5cdb63b995 upstream.
> > The BPF JIT allocator packs many small programs into larger executable
> > allocations and reuses space within those allocations as programs are
> > loaded and freed. When fresh code is written into space that a previous
> > program occupied, an indirect jump into the new program can reuse a branch
> > prediction left behind by the old one.
> > Flush the indirect branch predictors before reusing JIT memory so that
> > indirect jumps into a newly written program don't reuse predictions from an
> > old program that occupied the same space.
> > Introduce bpf_arch_pred_flush_enabled static key and bpf_arch_pred_flush
> > static call for flushing the branch predictors on JIT memory reuse.
> > Architectures that need a flush, can update it to a predictor flush
> > function. By default, its a NOP and does not emit any CALL.
> > Allocations larger than a pack are not covered by this flush. That is safe
> > because cBPF programs (the unprivileged attack surface) are bounded well
> > below a pack size. Issue a warning if this assumption is ever violated
> > while the flush is active.
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > Acked-by: Daniel Borkmann <daniel@iogearbox.net>
> > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> 
> The reuse path this patch hardens (bpf_prog_pack_alloc() finding a free
> area within a pack, and the size > BPF_PROG_PACK_SIZE branch) comes from
> the pack allocator that first packed many programs into shared executable
> allocations and reused freed space within a pack.
> 
> Should this carry a Fixes: tag pointing at that commit?
> 
>   Fixes: 57631054fae6 ("bpf: Introduce bpf_prog_pack allocator")

It doesn't add much value. This commit insn't really buggy, it needs no fix
for the eBPF. The fact that cBPF is unprivileged, opens a window for a JIT
spraying attack. Also, the the patch is a backport, so it should stay close
to upstream.

