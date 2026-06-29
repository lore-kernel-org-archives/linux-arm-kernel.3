Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC6C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r78oSdhTVN+8MeD5ByYXQ1b1CKPj92ZjAEWWw6Wo7CI=; b=KBcZUWmP3UD73UvhzbieV7KaoD
	IhEaeXRG+WXKE1rWHIrtRmuVfRA7fwCtH/YL9w8ts/vopetLNu+MNBr97lppjCI/6pLRuRUDgRoJz
	GhlbQGYMLsBmeNf9LDsa0D7g1zjWW2gIz5P3b4vgzae4/oKYmZ6ACT5VVMWDeJ3CxbVF3sO/314Lq
	FMSZD8O5Ch6H6Q63/te2OMWoD2SEoH1wJhvcGpiac8s4Mu6TvKT2GPXpsOSzG12krp/onIQoFHS9p
	PkMYlPoOJcc0h3T7WQjrqrngXC+08q9lwdJO5F2iPipYZwUjZeOQQWQb/S/gRugkjAcHElwn/CCpw
	o4I4GrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6s3-0000000Dxqr-1wRq;
	Mon, 29 Jun 2026 07:57:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6s0-0000000DxqF-1hqH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:57:33 +0000
Date: Mon, 29 Jun 2026 09:57:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782719848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r78oSdhTVN+8MeD5ByYXQ1b1CKPj92ZjAEWWw6Wo7CI=;
	b=0KCCmphd0bIumHVx1JyMEzRPcI71wGxWRC5J2cPJR+lS73V+fDAEr2hbzOD2G/1YM1om+5
	JL5dlY6/pdSP1zEiKFRnOefG58e4Q+a19/55EnwwFkq9L9G2JGayB83gSYkFqo/R7SJbfG
	2Oz7NNJvU2UQ4VUXrZ2u1d5FwVctDWmbXvO66s2Udoi2uGrxcgHrRLWG5uhDhlPeXtKdDJ
	dqwmnXwze5+9tYWgDUdBNstfQMvgbtNvsgyJN8yMVDtwOPr7CGD3/94cP0N8xP2CzmIgRY
	zEA9RI1zcSa/jbcI2gL7TbPCwGncfETsjfTjznC1INKzEhqkgz9F6LyutreuuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782719848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r78oSdhTVN+8MeD5ByYXQ1b1CKPj92ZjAEWWw6Wo7CI=;
	b=vzYv0SixowAx7/+6dSEJ2TBOFIkr8EAYnDXfSACWBfoqPSMggio8VWRUqcDgG+UvyKdOgL
	xaWesL/6nElCsLCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, clrkwllms@kernel.org,
	rostedt@goodmis.org, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260629075726.McX9yWi1@linutronix.de>
References: <20260625152159.WtO_S3i7@linutronix.de>
 <20260626082953.47503-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626082953.47503-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_005732_617495_AF445EB2 
X-CRM114-Status: GOOD (  13.24  )
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

On 2026-06-26 16:29:53 [+0800], Xie Yuanbin wrote:
> My personal view is as follows: First, an Unhandled kernel fault indicates
> that the kernel has encountered an error, which is different from an
> Unhandled user fault. An Unhandled user fault can be artificially
> constructed by user programs, whereas a healthy kernel, in theory, should
> not trigger an Unhandled kernel fault.

correct. 

> When a kernel has already encountered a fault, I think that printing fault
> information is more meaningful than improving the kernel's real-time
> performance. Imagine this: The interrupts enable here, and at the same
> time an interrupt arrives, and then another kernel error is triggered
> within the interrupt context. The log would be a disaster.

The problem is actually hitting that "error" spot before oops_enter().
In oops_enter() not only interrupts are disabled but also the emergency
mode of the console is enabled. That means all console output is written
via the atomic_write interface to the console as it the output happens.
At this point, your real-time guarantees are gone. There is no need to
worry about anything here since everything is lost.

> But no matter what, the above are merely my personal views,
> and I respect the maintainer's opinions.

Restricting it to user context is reasonable: Here you kill the task and
need enabled interrupts in order to send the signal.
For kernel threads it is not needed because the "printing" happens with
disabled interrupts anyway and without any buffering. Should this event
not end with panic() then it will kill the kernel thread and enable
interrupts before doing so.

Sebastian

