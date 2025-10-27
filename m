Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5B8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EL18DRmiuTWLATBe5Gs34HIgGkwAeVge3RkC2LhpsLg=; b=KzCqm8cML5OB3RZanb+KRrXeUU
	GCf6J5unAlRUoJvEKrV7244hJMfpHACy36/CQPBUaiKucEs6h5MtHHjKxai6j1/z7ItbgbtyM+9/B
	10eibIqoeL5Van/p2ZsK1gTw/C+81Xibr1TX0iCw+scS05J4gbXwEIOd+Y6ifftYPaUtOcyYeB8Xz
	U21kES3tzeJ99p9rZa7GKTPfLqBMJA1ykgEeejUaNoMKs0ZyGP6AcoANKiMaNnSzRTULaYSehF6/z
	oEfEOOhlb7X1HkPiktBoWWcNatlcn9KG+8aPdMmBZZwq7AKmILdU5N9IGYGlO0gwVWgHegkcbjYzG
	OR/OINMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQtH-0000000EQud-2tCz;
	Mon, 27 Oct 2025 17:20:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQtF-0000000EQuF-37ob
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:20:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761585616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EL18DRmiuTWLATBe5Gs34HIgGkwAeVge3RkC2LhpsLg=;
	b=Y14ZqlD0EkXH4iXjM70FdXLZ+iOmw30C2f7uSB34GLPzWVrHPR6OXTNqwiVcy3+bZNKHkp
	6K1KOrw6cVb9UR7MqjEoTKh821zZ8z3a+Pf5p2aA2Axnet/8ZauSCNdRYDrIlU4dJquAFd
	jKh+n99niLkinU17cVLbaOaySoruhIk8BMB89Pi5toNhruNW+EQiH1SVEZOrH354Y+Yt06
	Viaw77hlRVAUvWKxKWJR+fynvTuYcuWFp9dNX4qtnWL1NQ0jwc+gwO+NZeRRKmA9lk5f6/
	CLJS3BiWWLqaZmxUXQuZJvOkCI5iXQEhY2/B/fd6MmpzAlE4oYYVI+jxxZrMsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761585616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EL18DRmiuTWLATBe5Gs34HIgGkwAeVge3RkC2LhpsLg=;
	b=A42MOUxIaJbK5VTM2nYXH7xNrbkEdlYKRkj/alxqESRm5Jg4OCECUkjGTLfYR5G4C0rGLJ
	SoYRkgVexCygZbBQ==
To: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 1/2] smp: Introduce a helper function to check for
 pending IPIs
In-Reply-To: <20251020141718.150919-2-ulf.hansson@linaro.org>
References: <20251020141718.150919-1-ulf.hansson@linaro.org>
 <20251020141718.150919-2-ulf.hansson@linaro.org>
Date: Mon, 27 Oct 2025 18:20:15 +0100
Message-ID: <871pmow9bk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_102017_931565_91EF8E03 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, Oct 20 2025 at 16:17, Ulf Hansson wrote:

> When governors used during cpuidle, tries to find the most optimal

When governors used during cpuidle trie to ...

Both plural and no comma.

> idlestate for a CPU or a group of CPUs, they are known to quite often fail.

idle state

> One reason for this, is that we are not taking into account whether there

...for this is, that they are not taking into account

> has been an IPI scheduled for any of the CPUs that are affected by the
> selected idlestate.
>
> To enable pending IPIs to be taken into account for cpuidle decisions,
> let's introduce a new helper function, cpus_may_have_pending_ipi().

s/let's//

> Note that, the implementation is intentionally as lightweight as possible,
> in favor of always providing the correct information.

That sentence doesn't make sense. It's a snapshot and therefore can't
provide the correct information.

>  For cpuidle decisions this is good enough.

Thanks,

        tglx

