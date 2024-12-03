Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E86BE64A80
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yYjvF6qVvKzBxYttP8yiTPmOTcqD+VbUaWnU4lSefY=; b=vJ4T3zxFL8Bww6YAUw9VxterUP
	BFpxlXm78skejNEMA9QwHcNndcoGQowcm0USyAHY+fp/nTjJnC4ADN5J6qW0MFiPgSQPK1XS5Cxab
	dh1h1a8E1vblzdhukMcCj1Dl0X3PZ9vXmmjsB8bB6H8Yxe0ekVLlRjXU/JttxPrWCSBzdofehZGys
	TFhem6Ff49EV4vHTePl4xmA20wpCqvEn+BA/XEQgjywvRxHyIejen2hpMxo1Smx/jOtJjDNI18esT
	o2c+aKPMNIONa5i3Tamc7gvwxoFqQISPRgh1yzdd6l1tiwd+o5FqsSvDvYPlzoShbOcixjxodRXbg
	hh77XTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQst-00000009FBy-2q5u;
	Tue, 03 Dec 2024 11:16:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQhk-00000009BoO-3nNq;
	Tue, 03 Dec 2024 11:04:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733223871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yYjvF6qVvKzBxYttP8yiTPmOTcqD+VbUaWnU4lSefY=;
	b=GPh9J544GLpTTHxYmRPEOJGjgakTV87tvrpcFyzmjVfjTgmMlFaRBphYMzd68uKaM8UHBT
	/8y3ljPi3RMyCAjmib5czRfFtbslBOfcQND2YjCJ8guUjde0/0fHf5JU0GcGoDvWKmVKos
	HiPzu22BALCLVBnaXHNu8cUp4DGwd7LIi9olPiCZrjtyqBFwzlv3TOFKdEgE0vPjIgrxeW
	ZMzcUJGih0YwQZOopROfUFc48azjD7w7ql/w92e2WkbH/K3DxcmBxvGHWgWwsBmzo6u3Vk
	DP0ZtECGev+ymNGFFRj6jQyH2c2+D9uAlTvm0tEGHpf861Nip5oHzES5aNejpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733223871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yYjvF6qVvKzBxYttP8yiTPmOTcqD+VbUaWnU4lSefY=;
	b=Ug89W9+H4bPUfmR6EL/qwLR3mPtemvy0s7sj/ASkjTx+PzWZ1v4vgS42y6KLbbJDWnoOWj
	Q/JVO9P0HhGoXGBg==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, bhe@redhat.com,
 farbere@amazon.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
 adityag@linux.ibm.com, songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <20241130201143.48808-2-farbere@amazon.com>
References: <20241130201143.48808-1-farbere@amazon.com>
 <20241130201143.48808-2-farbere@amazon.com>
Date: Tue, 03 Dec 2024 12:04:30 +0100
Message-ID: <87wmght4ch.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030433_080071_E4BAD67B 
X-CRM114-Status: UNSURE (   6.65  )
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

On Sat, Nov 30 2024 at 20:11, Eliav Farber wrote:
> +
> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
> +	bool "Clear forwarded VM interrupts during kexec"

This should not be user selectable. Just keep it as:

config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
	bool

which defaults to 'n'. Just add a comment what this is about like it's
done with the other options in that file which are only selectable.

Thanks,

        tglx

