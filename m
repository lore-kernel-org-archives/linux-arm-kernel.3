Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA6FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FITUIvH3OOKTM6pJeboLI1HfwgwJYxbryeU4nh+FdnE=; b=HOtGMCwjHvozQq8hc4abEQGiOr
	/IfAD5iqKapYWnZuiYGkTJjdydlRJDqNllaPGZtm/id9Sdk8HkNdwjaLfGk9tZZ2WkAawDZzVh0ij
	wvRrz421wX38FOe4FrBWSNKb1GA4VzsTr8KNUEnAYlbpP5QPpyja/9hOJlA0H5JRIAwath3H8INsu
	98+T7pszNcrdG69/OH60Y2pIhY3POHQ1YHZs4WWTRx4seJ8XWXQNen/RfMU4nayDn9S4lSpO6Mlmo
	N8Br58mGSXkrt5MlpZjzrrthBJ/z9rVdAabYlcEZ5b0kZlN1/8X2SXZgeUVQy2eZFi/WjiUZ+pa3w
	oUf0zfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH4mD-0000000FmNm-32kR;
	Sun, 26 Apr 2026 19:04:21 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH4mB-0000000FmNE-1394
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 19:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777230255;
	bh=cL909OqLMd5VzANrjK7Nm/XEbexMuPAlas4Ce1GEC8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHNUcbuCZilNwpHrn0AE0Yn4krgyTNzjDGoxNuscpKIOVVWM0QoT0gEDctOpBwiAL
	 TQLYYNLH702PIhm8Gg34eRi+IibwULREquFg0ov4wUBlBQjhV/nJ0u0s8tk0xvqXnG
	 BtiWRxFFBVLirNHcKKcDMrlU74nOSVdnXrShtZ40=
Date: Sun, 26 Apr 2026 21:04:14 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Carlos O'Donell <carlos@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Uros Bizjak <ubizjak@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH RFC v2 1/2] arm64: vdso: Prepare for robust futex unlock
 support
Message-ID: <c9e3f275-da35-4cdf-876f-b4ec4278a75d@t-8ch.de>
References: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
 <20260424-tonyk-robust_arm-v2-1-db4e46f752cf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424-tonyk-robust_arm-v2-1-db4e46f752cf@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_120419_436246_1360AF9B 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

One more thing, sorry for the spam.

On 2026-04-24 15:56:00-0300, André Almeida wrote:
(...)

> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm)
> +{
> +	unsigned long vdso = (unsigned long) mm->context.vdso;
> +	struct futex_mm_data *fd = &mm->futex;
> +	uintptr_t success, end;
> +
> +	if (abi == VDSO_ABI_AA64) {
> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_success);
> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end);
> +
> +		futex_set_vdso_cs_range(fd, 0, vdso, success, end, false);
> +	}
> +
> +#ifdef CONFIG_COMPAT_VDSO
> +	if (abi == VDSO_ABI_AA32) {
> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_success);
> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end);

The futex_list32_ symbols here are in the 64-bit vDSO. They are not
applicable for VDSO_ABI_AA32 processes.

> +
> +		futex_set_vdso_cs_range(fd, 1, vdso, success, end, true);
> +	}
> +#endif
> +}

(...)

