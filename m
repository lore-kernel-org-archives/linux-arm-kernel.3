Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7EBC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF4KzUV/2FAr70joIgarXoXHvvFOUNtQosvbixQmtNs=; b=ZSAhvQxpszXN6fbLibeufj642i
	tEVravyiOhCYDLOGdgFS1j5YFgwQRRQrQ5R+VS17fNzhA1jzN48y26es5j2HaiJL6kRAXrEzY0tBt
	T7dNLPETYIKpDNab40ZHiDeC/7DtbAADnuIOhm30mpi9263p2ruHtdogAdleTOZ7Y6PoRbhLr3+OK
	9Q5fOaNwo6BwUqICBGgF2Ri7DPKuOCpcUOMOl13GH19b0xoPJlrk6EBvuRsPPaMdhrqphr7GyLUbh
	W6qZtidBiAfYBUKKYy+KHyEZPjuPmj9G4+dMRCrEAH7fUJqUyL8GUDXU4fh49klbBZYWJ55hX363j
	ISi4+h7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKbu-0000000HBBF-3VOX;
	Thu, 16 Jul 2026 11:50:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKbt-0000000HBAd-1QCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:50:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2576419E7;
	Thu, 16 Jul 2026 11:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C921F000E9;
	Thu, 16 Jul 2026 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784202636;
	bh=EF4KzUV/2FAr70joIgarXoXHvvFOUNtQosvbixQmtNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ldlTyjQ6WsIg8OGKTIpcmJc71vKK414FhmTm7yBG5rkbKfYduF3AQtGLAp/qPQN5B
	 oB+AXVmgph4kCKhQI2ApbsXP14xZPrtPHy8nUQIhNfwho2PIqlZDpPlwWnCu52r3o8
	 mEeYiOYzcGB6xOOfjD40M9O+qjssV9Y2Fo9PX6vNcK38+m4OUO1Mq2PO/bd2DukzQR
	 CQ+lMGw5RFgOftLoaqm7FToeFCeR0IG0uSD7zKldNqH4r9yqxitb9/HTQnDCwdeovr
	 Q3EA25GaEpYe7ae0A9LQzho6ZSKAuU0+6EPHq9wDvV2RVAmHPyAdagV0AFySG1Wmup
	 +rHCr6MKLK02g==
Date: Thu, 16 Jul 2026 12:50:31 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <aljFh-mSqQKh2o57@willie-the-truck>
References: <20260714143600.23853-1-will@kernel.org>
 <55b6734e-39b9-40bb-93ae-b869f17476d5@huawei.com>
 <aleILaiTXssk066q@willie-the-truck>
 <d95814b4-511c-4210-85c3-f4f922838140@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d95814b4-511c-4210-85c3-f4f922838140@huawei.com>
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

On Thu, Jul 16, 2026 at 10:09:55AM +0800, Jinjie Ruan wrote:
> On 7/15/2026 9:16 PM, Will Deacon wrote:
> >> /*
> >>  * Ensure tracer changes to x0 during SECCOMP_RET_TRACE processing
> >>  * are visible to later trace and audit.
> >> */
> > 
> > I'll tweak that, as I don't think the tracing part matters (it doesn't
> > see orig_x0 afaict) and I'd like to be very clear that this is down
> > to the secure_computing() call. So it becomes:
> 
> I do not think so, I think the trace part also matters, because the
> tracepoint also reads orig_x0 through syscall_get_arguments().
> 
>  18 TRACE_EVENT_SYSCALL(sys_enter,
>  19
>  20 >-------TP_PROTO(struct pt_regs *regs, long id),
>  21
>  22 >-------TP_ARGS(regs, id),
>  23
>  24 >-------TP_STRUCT__entry(
>  25 >------->-------__field(>-------long,>-->-------id>----->-------)
>  26 >------->-------__array(>-------unsigned long,>-args,>--6>------)
>  27 >-------),
>  28
>  29 >-------TP_fast_assign(
>  30 >------->-------__entry->id>----= id;
>  31 >------->-------syscall_get_arguments(current, regs, __entry->args);
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>  32 >-------),
>  33
>  34 >-------TP_printk("NR %ld (%lx, %lx, %lx, %lx, %lx, %lx)",
>  35 >------->-------  __entry->id,
>  36 >------->-------  __entry->args[0], __entry->args[1], __entry->args[2],
>  37 >------->-------  __entry->args[3], __entry->args[4], __entry->args[5]),
>  38
>  39 >-------syscall_regfunc, syscall_unregfunc
>  40 );

Well spotted, I was looking for "orig_x0" when I initially looked at the
tracing code but it's hidden behind that call to syscall_get_arguments().

Will

