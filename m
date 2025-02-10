Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20779C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78y7SNdwac/iLbnDAq+m4G4JXWRhEfokglNJz+Kj4VQ=; b=k/M4PGv1UgOPntM3FdBl6zoU0B
	uV3VZkDQVdTw9+OrDB8EMw4cjScJw0uZHVbhffoQ/yU4SBPZpLh9+sMuR4SQoqJNX97/1FuGpBGlM
	M3p1gHIpxwPCkjDiWEeb8AZOBSHzP5VzACKjmq3DT7WiLGIqY6R1kzZ26j33LwkPwpjG2ECfalUkq
	mtXV1cnOZ7+FjB6EHVxj4wfbIsxMWN2YJC16f4XocLsINu3pI8sAbIHkFyMm4RLGvDeCEfMK3v3Ic
	RjBwCHzZcIfGm2gDbGKRIIsHNa7q0Hb4/nm8i2ydr4zY7FZCI1oMV36l0M1e68PznQNYCuNueZ+So
	xoYLuhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUUA-000000004w7-17sN;
	Mon, 10 Feb 2025 14:10:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thURA-000000004Hs-39yJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:07:01 +0000
Date: Mon, 10 Feb 2025 15:06:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739196418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=78y7SNdwac/iLbnDAq+m4G4JXWRhEfokglNJz+Kj4VQ=;
	b=cdx36GckXXGFn7nRaOep+uZQFTSO0o3qmTncullx96eu3S9siqVyjGCXH2MIL8sh3c8yy7
	ql4c1f2+TgCeTxF0FehWNoCu62yQdF8I2tugwonCedecBNFhdAAeWwWLh7TcU/5F/g9722
	L78yEy47Md+zTG2gxtPtU4foaMEl094d6ozYgta2sWWGNeHez7kQa8Qh3horv2JrqP8M+w
	rBrZJIp2Fq2KkHYIDmprpZB6ETPFVC90S2hLq9YFlpUszJQpVtgOIquqJtQef8QZzLLqI9
	Ftur0nFSTt4spjiJ3fCELLijLMrZ8S+0skkfd5IXsXK8M8CR4459Y394PnBvTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739196418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=78y7SNdwac/iLbnDAq+m4G4JXWRhEfokglNJz+Kj4VQ=;
	b=L19kvCZd/HaCid0Ds4t5TJ2Bcga4AyQ2zAP+XiB4Ejdq0jO1SEkmsgqCEq6m5CFwK/8qVH
	Ph+jh3v6JoS0rtCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: BUG: debug_exception_enter() disables preemption and may call
 sleeping functions on aarch64 with RT
Message-ID: <20250210140657.UAsRw4k8@linutronix.de>
References: <Z6YW_Kx4S2tmj2BP@uudg.org>
 <Z6n16cK85JMyowDq@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6n16cK85JMyowDq@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_060700_927701_BCA9AFC6 
X-CRM114-Status: GOOD (  13.54  )
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

On 2025-02-10 12:49:45 [+0000], Mark Rutland wrote:
> Hi,
Hi,

> I don't have an immediate suggestion; I'll need to go think about this
> for a bit. Unfortunatealy, there are several nested cans of worms here.
> :/
> 
> In theory, we can go split out the EL0 "debug exceptions" into separate
> handlers, and wouldn't generally need to disable preemption for things
> like BRK or single-step.
> 
> However, it's not immediately clear to me how we could handle
> watchpoints or breakpoints, since for those preemption/interruption
> could change the HW state under our feet, and we rely on single-step to
> skip past the watchpoint/breakpoint after it is handled.

Couldn't you delay sending signals until after the preempt-disable
section? 

> That, and last I looked reworking this we'd need to do a larger rework
> to split out those "debug exceptions" because of that way that currently
> bounces through the fault handling ligic in arch/arm64/mm/.
>
> Mark.

Sebastian

