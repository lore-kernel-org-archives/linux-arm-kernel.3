Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E160C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0dbOAMgISMQQS+1WkxTJ/jl2C/xVOcD8s/PetKIX6U=; b=Kbgh/7ZWUvk2vET0qzJnt+KdJs
	2FwAmkqY54kI1XciYAY21PzGtdquniIXm4ShopaykpL2iO2DsdLxLa3znNgJRZZzbZsidEYxFKFFv
	x+Z2qchAKakPjjr3iUI2qDnUcardmntWzAAIT9NxPoYByr1W6w2VoNlatfz8SFbC28YLZfrcdV6Wk
	z2gO5dbuLMTlZq4Qu1YhGLFF9+d/MSAJ5Yhx8Ok/xFj1QQsYKLxbato1SSBRCFIv7Nzobyzda3MPO
	wf7EapFmEgXocpUQYRySOd1PUoDNK5pHHfo1ZdlWOsb86OE+JyrodjIW4qT7885cMrk+0l2fT+9GT
	DTeqLiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaGi-00000005jHD-1eHK;
	Wed, 21 Jan 2026 15:37:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaGf-00000005jGh-1tLX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:37:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AD861476;
	Wed, 21 Jan 2026 07:37:02 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9351D3F632;
	Wed, 21 Jan 2026 07:37:07 -0800 (PST)
Date: Wed, 21 Jan 2026 15:37:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	david.spickett@arm.com, stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1] arm64: poe: fix stale POR_EL0 values for ptrace
Message-ID: <aXDynm0YGuNzi7B3@J2N7QTR9R3>
References: <20260121135639.1835784-1-joey.gouly@arm.com>
 <4f4b9dd9-02ed-4899-b17d-24415e50e5c3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f4b9dd9-02ed-4899-b17d-24415e50e5c3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_073713_531702_AAE61A4A 
X-CRM114-Status: GOOD (  18.27  )
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

On Wed, Jan 21, 2026 at 03:59:22PM +0100, Kevin Brodsky wrote:
> On 21/01/2026 14:56, Joey Gouly wrote:
> > If a process wrote to POR_EL0 and then crashed before a context switch
> > happened, the coredump would contain an incorrect value for POR_EL0.
> 
> Isn't that also a problem if using ptrace(PTRACE_GETREGSET, REGSET_POE)?

In the case of manipulating a tracee (i.e. target != current), the core
code ensures that the tracee is stopped (has context-switched out, an
hence has saved its registrer contents to memory) before the relevant
regset functions can be called.

> Just like for fpsimd, etc.

Just FYI, The FPSIMD/SVE/SME registers are a special case relative to
all the other regsets.

The FPSIMD/SVE/SME registers eagerly saved to memory (and so when a task
is scheduled out, the value in memory will be up-to-date), but they're
lazily restored (so the value in registers can be transiently stale
while the task is running), and there's a special case when scheduling a
task in where we attempt to spot if the CPU registers happen to be
up-to-date with the task.

The gist of this is that when manipulating the FPSIMD/SVE/SME regsets of
a task:

* For reads, we know that the value in memory is up-to-date unless the
  task is the current task.

* For writes (which can only occur for a tracee which is not the current
  task), we need to update some tracking data to prevent context-switch
  from reusing stale values on a CPU. That's what
  fpsimd_flush_task_state() does.

Pretty much all other regsets don't need the "flush" on writes, since
the value in memory will be loaded when the task is next scheduled in.

Mark.

