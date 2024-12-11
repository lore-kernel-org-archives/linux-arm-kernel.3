Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6586BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cC0jtNFF2OB7EPEgIvbsGCXy7/YyEZDKndIQ+GkiRE=; b=BGnavP4QTp3wYvu+VHuJtqXtn3
	OEb9l0K8gG1iW3VyshRY/XSD/YwQ4Kb9PN0Z6eVJgdpaAFeg5/dTYumnFtOc7TB2YAAIWqJxboIRS
	kQBiV2mUQIlfn3jHlD7WK2/Gm8Bi4YdxBUd7DCd76isAfYjpC2G8cDVAkiybvUX0GA0l/qD+TCNQl
	/W87BTAY1TuleJiKmwKpaU/Nzrd6WqX36XFaVYi685EbuvWdiU+DzMK+wbNjNo+32iwgrwe7P+uet
	ep71dFSpEk2LuPt85+i+8mtikyqwuydBhkc9rFDeWyvkb88g7uiyU3IB/osAJRHLBYnmQ5Pr5xRXl
	TLQm6JXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMkI-0000000EyZn-4AO5;
	Wed, 11 Dec 2024 13:27:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMjF-0000000EyQT-1xUP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:26:14 +0000
Date: Wed, 11 Dec 2024 14:26:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733923569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2cC0jtNFF2OB7EPEgIvbsGCXy7/YyEZDKndIQ+GkiRE=;
	b=g3QuKsaQef6e6PeMK+2oy3noWjaNhgRV6gXBjaotK0lO44SUXfa0MTZpNhHcq16gz+qlVh
	PN8w+U8BTzrMD0xY6Au9o2yGSnpKt9H2DtoVk4Dc+3Rf4bAtt2eWYbu5Xmjf/rJg6A+KKw
	DowFb+Ip/fqTB+MOql8BHL9HcrugxZeAXRzp4gnmPRaUtwONCu4O3MNVUzSmfFEPE6aOJ+
	bVSiv4nmWM4r9C6KV3w1RMoMq/hazNgGNMiNlZxCpGixcaXJrKgY0Pe6JZ7wYH5aYnYqTc
	4syQuoDYqxu9xGeFhtBThSDQgJA/mXzLVCjK7ybGuftIy28Wb7EmgjLiovNzSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733923569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2cC0jtNFF2OB7EPEgIvbsGCXy7/YyEZDKndIQ+GkiRE=;
	b=oZyZKAzopi3biPeXNdIzMu7nkbrftsiKhCO4QLn9NSke2ZXhslY9IaxLL2rMo1dfnCMIfX
	ScXi8cERdOFVpFBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/4] ARM: Disable jump-label on PREEMPT_RT
Message-ID: <20241211132607.z1zDTk89@linutronix.de>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210160556.2341497-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_052613_651658_75EB15BB 
X-CRM114-Status: GOOD (  20.13  )
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

On 2024-12-10 17:05:53 [+0100], Arnd Bergmann wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> jump-labels are used to efficiently switch between two possible code
> paths. To achieve this, stop_machine() is used to keep the CPU in a
> known state while the opcode is modified. The usage of stop_machine()
> here leads to large latency spikes which can be observed on PREEMPT_RT.
> 
> Jump labels may change the target during runtime and are not restricted
> to debug or "configuration/ setup" part of a PREEMPT_RT system where
> high latencies could be defined as acceptable.
> 
> On 64-bit Arm, it is possible to use jump labels without the
> stop_machine() call, which architecturally provides a way to atomically
> change one 32-bit instruction word while keeping maintaining consistency,
> but this is not generally the case on 32-bit, in particular in thumb2
> mode.
> 
> Disable jump-label support on a PREEMPT_RT system when SMP is enabled.
> 
> [bigeasy: Patch description.]
> [arnd: add !SMP case, extend changelog]
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Link: https://lkml.kernel.org/r/20220613182447.112191-2-bigeasy@linutronix.de
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I slightly changed the patch from the version currently in linux-rt.git
> to leave jump labels enabled on single-CPU kernels that are still
> fairly common on 32-bit arm.

So HOTPLUG_CPU depends on SMP and without SMP there no HOTPLUG_CPU so
the patch function will be invoked directly. So we patch and flush.
Well, okay.

> If there are no additional concerns about this version, I will
> forward it to Russell's patch system

I'm fine with it, thank you.

Sebastian

