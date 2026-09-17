Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA92C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGYA4gTOL3tApLZclj7SRxkYczygoaWkM3bp2RW5R0Q=; b=JLjTXIaX6yPgrQ5oewMC33X+v/
	SfXPbyQdjbJUVKxTzQyg1vhVG9hMBCpr/6iS+mrGG5UBjMeYtSgBPHUxTDor70E0Kipnsbl7qaHR/
	+N+SasGgFM/nFnZlg5xnUSd0VGoDXW31J1z1sQ6VxyE9x+MCG2iWZRVDYE6jlr94wehxCXYn6G08l
	zAUPMHBhaU70HOU+MarqnWhaOgHb+jTd/2GqzfVRwkQFNh33CNmCfh7RWekNwc9JRbA3oqhmbXy0Y
	fAPUinLEPWcoP1UrU/YHToxwFhADIjaAtw7bHFufO6esmVLBDbQTJ192Y1xYqCJoTVN7TWl3YPw7X
	tMmxhoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79cn-0000000B7zQ-2fyd;
	Thu, 17 Sep 2026 10:45:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79ck-0000000B7z1-3EGV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:45:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77CEF1476;
	Thu, 17 Sep 2026 03:45:45 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 830FF3F882;
	Thu, 17 Sep 2026 03:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789641949; bh=A1qJUzoEx4MjxX5KJ5zP6XztKc5+3XRYmk3SylEfKJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3EKRXU7Cq0DBTHyOGTTXwg29ME9vRYoBg/Zu9Qo8a/ZRg4WR/J/U0BVm+v1OMi4g
	 HNkWPW0bXHN9fcTqmsv5rJx7nhcBoRmjzGf42teEOckKeKZ3kfBaAjMrxSeXMoZqoc
	 j6309z9kZ3G1alSAYIaABBDQGB2YjpiPXZfdXtnw=
Date: Thu, 17 Sep 2026 11:45:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Florian Weimer <fweimer@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 2/4] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <aqvE1w1-FQPD4AoM@J2N7QTR9R3>
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-2-077707b6f1c7@igalia.com>
 <aqqkX8GyxgdtoOmc@J2N7QTR9R3>
 <9d9a804f-c1f3-4c0c-b12a-975206f6c34c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d9a804f-c1f3-4c0c-b12a-975206f6c34c@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_034550_845922_7A81139F 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Sep 16, 2026 at 10:06:25PM -0300, André Almeida wrote:
> If I understood correctly, the correct approach here would be to use pop_reg
> as an input operand, making sure that we store the address hold by *pop on
> x2 register right? So something along the lines:
> 
> __u32 __vdso_futex_robust_list64_try_unlock(__u32 *lock, __u32 tid, __u64
> *pop)
> {
> 	register __u64 pop_reg asm("x2") = (__u64) pop;
> 
> ...
> 
> 		"	str 	xzr, [%x[pop_reg]]		\n"
> ...
> 
> 		: [val] "=&r" (val),
> 		  [result] "=&r" (result_reg),
> 		  [lock] "+Q" (*lock)
> 		: [tid] "r" (tid),
> 		  [pop_reg] "r" (pop_reg)
> 		: "cc", "memory"
> 
> Does that looks right?

Yep; that should work!

Just for completeness: another option would be to drop the memory
clobber, and have separate constraints for the "pop" memory location and
the "pop_reg" register. I think your suggestion above is simpler, so
let's go with that.

Mark.

