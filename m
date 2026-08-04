Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8CDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdX9DoaF2BXktlYhw2+W3om6O1eLnSZX0QoBZAmb8q4=; b=gZEv/uxsxzc/Cv4wv+l6QZDUsK
	YZfXoUppdLXkWKX/WLk8KMjrP7SKNwZJ+pxU/8zKYmITsXf5dj5tJNUhwfQMBokGFCrGOgt8HAls1
	2m3IAqo3khbr21RPPgS74GSs+RmWIgYp1i9fK8HxRvxQed5CnVXb8Q31u4nO6uTnNZZh2r+hkNYnc
	gkrxKUiUWHhF5+tLsSiI7NXO8rEXYZ2WDCqULmXi8O8Dpf5xHEseOh3x84xGxjC/VXsJX27iLV+az
	x5ROyYzHAUnkiSXI3lmrmHXQ33UtkKKcszGR2XqxjBlnWIc/7wwX74kIyRdZMocSiYv4dczT8lYD7
	rxfOltXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGiU-00000002ALY-3p3H;
	Tue, 04 Aug 2026 15:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGiS-00000002AKm-214f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:06:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FA571476;
	Tue,  4 Aug 2026 08:05:58 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 058053F86F;
	Tue,  4 Aug 2026 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785855962; bh=lQ/vZbd2M6VD7tf7cRNuxfTToCU1ookzVTXaid79xFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULShoy7eOaT0f/lHcDVnjJBbewGBHD9Y5q+k5Z/D2snNygxZj8dWhLC9a0AgR8j5O
	 wVxTcSfbm1PrnGaddZzTrOLRehZYFkzbfZ0h6CQyZ1olgtxUxQNco0o7J8NUIK7chf
	 rmIAN57YPRzz1cUWunhmRE32j+KSQd7n1tPhz7OQ=
Date: Tue, 4 Aug 2026 16:05:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Subject: Re: [RFC PATCH 07/13] arm64: percpu: Implement preemptible
 read/write ops
Message-ID: <anH_1RdxZ1nAsbBA@J2N7QTR9R3>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-8-mark.rutland@arm.com>
 <20260728230504.41e2861a@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728230504.41e2861a@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_080604_560969_45DDE8A8 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 11:05:04PM +0100, David Laight wrote:
> On Tue, 28 Jul 2026 13:38:53 +0100
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > Generated code after this patch:
> > 
> > | <outline_this_cpu_write_u64>:
> > |        mrs     x2, sp_el0
> > |        mov     w3, #0x7c60
> > |        strh    w3, [x2, #20]
> > |        mrs     x3, tpidr_el1
> > |        str     x1, [x0, x3]
> > |        strh    wzr, [x2, #20]
> > |        ret
> 
> How is that likely to get scheduled on a typical arm64 cpu?
> In particular does the reuse of [wx]3 create a register dependency
> between the two instruction flows and stop then running in parallel.
> A typical x86 cpu (that anyone cares about) does register renaming
> so it wouldn't matter, but I don't know about arm.
> So it might be worth using different register for w3 and x3 (although
> that might cause a spill - which will be worse).

Practically speaking, any CPU which hits hazards those uses of w3 and x3
is not worth worrying about. It is not worth allocating another register
here.

Mark.

