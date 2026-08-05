Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684B5C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmM7iJ/JFimi4nUYP29JpOtNDUWwHTyF/YlUByNAJnQ=; b=glwZxIQeknI5Uo6YlXblYp7HNw
	clk1F6OvtudfMbSLFyrO6nYVnlo12Iv/mNvf925X99vMuVs+ESRycgJtRIhlrPCmrW12Uaf4LrqEI
	aBI6hLPBpPQMiNeYqLHYdMhitP7nz4i5WzbZ9taX5yyreCrCaaNeVldBTZ8QPIshW3KW4jqiHNmgy
	0Z0ofMj+nxuu7/9sPorr2asXSKZOFBddimqdjcfZ6dJgS7HA+1IMA/rqq4Sh0WPBcpV/sx/xE12QH
	UytIS24IfUUXfLYt3BE3QNtHrkBN7F5wMj4YdR4uvjmEt5uKV/Rjou4BVGrfIiv7B6VHni91DoQQv
	SzEZ8yMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbm2-00000003zxz-2SBW;
	Wed, 05 Aug 2026 13:35:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrblz-00000003zwr-3CZA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:35:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6219153B;
	Wed,  5 Aug 2026 06:34:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5726C3F66F;
	Wed,  5 Aug 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785936903; bh=8JBRpOeiOY+Me7oAb6fyHzfpzC6aAxs+etzsMAdQr8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDKWlqkLl4v/1chvARizg+HbWc350DWBeDrsrC+jNbNat7d+Yk440letDKcPRDiZS
	 xrkemB62DwQnG1TbYTR49CI8IvaTgkKl+NyX1DRAvWMXlZATVKPvQ+kpclZIEBIaJT
	 KZBn5UJsq4B4q+oiBU78jM0Qj0cXBuMDmxAHWKAY=
Date: Wed, 5 Aug 2026 14:34:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2 14/20] arm64: percpu: Implement preemptible read/write
 ops
Message-ID: <anM8AW4N81iDqP-V@J2N7QTR9R3>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-15-mark.rutland@arm.com>
 <00a85d9a-8727-4b89-b33b-ce2d3358355c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a85d9a-8727-4b89-b33b-ce2d3358355c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_063507_882052_9B4BEB38 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Aug 05, 2026 at 10:24:04AM +0100, Ryan Roberts wrote:
> On 04/08/2026 18:04, Mark Rutland wrote:
> > ---
> FYI I'm seeing build warnings caused by this patch (with ftrace enabled - based 
> on the warnings, I'm guessing that's the key bit), using:
> 
> aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> 
> I haven't investigated the cause.

Thanks for the heads-up.

This is an unfortunate effect of the casting in this_cpu_write_##sz
wrappers:

(1) For cases where pcp is itself a pointer, compilers warn for the
    unreachable (sz != 8) cases, unless we add a cast to unsigned long
    in all of the cases.

(2) With the cast, compilers warn about implicit truncation (as you're
    seeing here), where we've performed redundant extension in the first
    place.

To workaround that I believe we need an explicit cast somewhere, unless we can
get the compilers to realise the other cases are obviously unreachable. Two
possible workarounds:

(a) We make __percpu_write_##sz() take an unsigned long, and cast it
    down to u##sz in the asm arguments.

(b) We update this_cpu_write_{1,2,4,8} with {u8,u16,u32,u64} casts,
    applied after the unsigned long cast.

For now, (a) is the simplest, as below. I'll see if there's a better option.q

Mark.

---->8----
diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index d868a88960123..dd49d14d9cd91 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -149,7 +149,7 @@ static inline unsigned long __percpu_read_##sz(void __percpu *pcp)          \
        return val;                                                             \
 }                                                                              \
                                                                                \
-static inline void __percpu_write_##sz(void __percpu *pcp, u##sz val)          \
+static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)  \
 {                                                                              \
        u16 *gprs = &current_thread_info()->pcpu_gprs;                          \
        unsigned long off;                                                      \
@@ -161,7 +161,7 @@ static inline void __percpu_write_##sz(void __percpu *pcp, u##sz val)               \
        : [gprs] "=Qo" (*gprs),                                                 \
          [off] "=&r" (off)                                                     \
        : [pcp] "r" (pcp),                                                      \
-         [val] "r" (val)                                                       \
+         [val] "r" ((u##sz)val)                                                \
        : "memory"                                                              \
        );                                                                      \
 }

