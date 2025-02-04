Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166FFC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSqgMFS4aDbQD1Za39QBUfMLlRyO1p8mWDLUklEpzZI=; b=2E0XGEVykho37an0btca65Jjbe
	GpxM63WlbgkXkZcjnBwvnt5Uw3ItT/s2kQcmQ/aD+Zs5nE0/T/foX5Tl46QydYOQugncQyI2Ql9ea
	qg6KUyzHqLCPSGSvgCzj4YxyqbmUkJwFRnfjtepu4+6RTS9NnqsG7Dn3RIjAoMak0xwuBEkgy5Kli
	LLMhikMf9mnkcshr+jNSxbu3LAiVY2RzFB3OWr5uRpCxc1VllVrvtTBfkPbJeZxtSEzeaDdh3oHcX
	suKxs6lAoHqYXdn+CuZ/0juzfutlN7j+mbhU2SAv6cphGdYlDt1b3OWrreyaeCoYCHNhrQnZBrwZr
	DdovTw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEkS-0000000HaIo-2G2m;
	Tue, 04 Feb 2025 08:57:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEiz-0000000Ha9x-1b5f;
	Tue, 04 Feb 2025 08:56:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738659363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSqgMFS4aDbQD1Za39QBUfMLlRyO1p8mWDLUklEpzZI=;
	b=mKD5KRklKrqXuveUDqTQ1L1HpTnd13HHNJ3z6qOmdFhn77mOErYPVsTtVodroOBX6waOm2
	yCjHaCcNEfo8cp4ZQxslB6hkHbqNgQJd02o17NfDTekgRph/VHEx6J/8kqeKsC5h/NplWh
	wLS6nIsOleHi16tu0WRI2yjtYig3qPX/PMkrBNZBVtooF3VUAL0eZbH7zPb8rEj5mSoJ7a
	o3if5Xzv2sVE/85ympiNuUyJWB3uDkl8ZH3mDXhVnJKdT1NuKR74r1iJzFxHsWzYPhGD24
	7V6G/clKUKMw6CLs5OaqYfw9w6CXHLGg1tFbeZ0NcmiLoYIiH+h2i9ztBuzTrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738659363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSqgMFS4aDbQD1Za39QBUfMLlRyO1p8mWDLUklEpzZI=;
	b=D3oWoJ8CAX418qVeH86CLIWCx4KbgcDAbTmVaPpd13BHVb64PoVUaGz3iQha4kI8/XnyAn
	JjZ3XY/2fYFaxkAw==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
In-Reply-To: <20250204075405.824721-11-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com>
Date: Tue, 04 Feb 2025 09:56:03 +0100
Message-ID: <87o6zinl5o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_005605_558605_FF1C9F50 
X-CRM114-Status: GOOD (  17.25  )
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

On Tue, Feb 04 2025 at 13:24, Anup Patel wrote:
> Devices (such as PCI) which have non-atomic MSI update should
> migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
> flag for corresponding irqchips.
>
> The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
> movement as follows:
>
> 1) No need to handle the intermediate state seen by devices with
>    non-atomic MSI update because imsic_irq_set_affinity() is called
>    in the interrupt-context with interrupt masked.
> 2) No need to check temporary vector when completing vector movement
>    on the old CPU in __imsic_local_sync().
> 3) No need to call imsic_local_sync_all() from imsic_handle_irq()

I have no idea how you came to that delusion.

IRQCHIP_MOVE_DEFERRED is part of the mechanism to handle this insanity
correctly. It does not prevent the device from observing and actually
using the intermediate state. All it does is to ensure that the kernel
can observe this case and act on it.

The fact that the kernel executes the interrupt handler on the original
target CPU does not prevent the device from firing another interrupt.
PCI/MSI interrupts are strictly edge. i.e. fire and forget.

IRQCHIP_MOVE_DEFERRED solely ensures that the racy affinity update in
the PCI device happens in the context of the original target CPU, which
is required to handle all possible cases correctly.

Let's assume the interrupt is affine to CPU0, vector A and a move to
CPU1, vector B is pending. So we have three possible scenarios:

CPU0                            Device                                
interrupt
                                1) Raises interrupt on CPU0, vector A
  ...

    write_msg()
        write_address(CPU1)
                                2) Raises interrupt on CPU1, vector A
        write_data(vector B)
                                3) Raises interrupt on CPU1, vector B

#1 is handled correctly because the interrupt is retriggered on CPU0,
   vector A, which still has the interrupt associated (it's cleaned up
   _after_ the first interrupt arrives on CPU1, vector B).

#2 cannot be handled because CPU1, vector A is either not in use or
   associated to a completely unrelated interrupt, which means if that
   happens the interrupt is lost and the device might become stale.

#3 is handled correctly for obvious reasons.

The only way to handle #2 properly is to do the intermediate update to
CPU0, vector B and checking for a pending interrupt on that. The
important role IRQCHIP_MOVE_DEFERRED plays here is that it guarantees
that the update happens on CPU0 (original target). Which in turn is
required to observe that CPU0, vector B has been raised.

The same could be achieved by executing that intermediate transition on
CPU0 with interrupts disabled by affining the calling context (thread)
to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
looked into that, but that has it's own pile of issues. So at the end
moving it in the context of the interrupt on the original CPU/vector
turned out to be the simplest way to achieve it.

Thanks,

        tglx

