Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754E2CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsfzxlWlUfAtZGI+qAXkjznTjniwrhyCHyN/kFIVlaQ=; b=tdeA8o3jLcix5RIJMW4AWsi49W
	IEoOcoCdEYNjo2kwCjnbzwxgvse5dNAlZSN2qCqkvnUNoFQ4lIDJdvegDp3KhxAnSU2/DvkJLAje4
	i8gQFJaFcUgi5Yjfh+7vKdy1iuKi/BqsoFK3+aSV5JVqQjqhxDLEK5S8zF8wq79Wrvmb4WaLhD9XH
	sGm+AGWqyv5HJPvqO02hTAgoFQMTXq+VcQQZv9cBxp8jouqDui3WpIbXD/GBuNBRM09A/X+NqG4NY
	J4M/06OcV5pCAKD4MLrlNg1dhp2Xo5G/A41ABmpw5mcr3FMKFF1cqkmHVKbB4vscmUhKVR5ais6pp
	Jwahac1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeJC-00000001MWM-2LXs;
	Wed, 06 May 2026 15:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeJA-00000001MVf-39sN;
	Wed, 06 May 2026 15:37:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E5B1682;
	Wed,  6 May 2026 08:37:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 923CB3F7B4;
	Wed,  6 May 2026 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778081826; bh=5jyzOt/YE4MAJ87a+6OW9BOIOtlHnKUUXQbFsJ69GA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMdi+zP3Eg/uLU1d3mO63YYr4BA3ZO4t1algcuI4CFGs8XeA9T34+qb0rdR39jzeg
	 j06elKg2k5eNJF+ZUZm4HfbXrZgBVCdvHX1pcaN+Q7kkJVmt6743pZjHTA/47tQcPO
	 EhPeVMH+7RxtBnh++b/ct/abuXYH8cT/M2HIAXHg=
Date: Wed, 6 May 2026 16:37:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v4 3/8] arm64/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <aftgHVEW3dsnblfc@arm.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-4-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430094730.31624-4-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_083708_838909_F11B381E 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Apr 30, 2026 at 09:47:25AM +0000, K Prateek Nayak wrote:
> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. GCC generates a:
> 
>   movz  w1, #lo16, lsl #0     // w1 = bits [15:0]
>   movk  w1, #hi16, lsl #16    // w1 = full 32-bit value
>   and   w0, w0, w1	      // w0 = w0 & w1
> 
> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> by Claude which is implemented here. The final (__ret & mask) operation
> is intentiaonally placed outside of asm block to allow compilers to
> further optimize it if possible.
> 
> __runtime_fixup_ptr() already patches a "movz, + movk lsl #16" sequence
> which has been reused to patch the same sequence for
> __runtime_fixup_mask().
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

