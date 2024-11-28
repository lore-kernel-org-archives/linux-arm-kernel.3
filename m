Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25470D690F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYmxpAymuaS1BHhRzDYCr8r7Tzu8mgJe4gNvGTzASXA=; b=lQjCGcrU6PFS/TBUG35MvsKdFy
	iqYxjVZkPohRj6aX9yvPlACmN8ZgqWatlZHupKLjeEWagmu0E0IeryYA2HC2Ebe9E0J1vefajL86M
	xZER+AE+ANNXlXYiR7SITHvlvt1baRolsyANpbOXkahniNSmve8NarCK+JjikADdvrF/M7Ai2G7Ti
	GQBx/MlUSAxN7LytGZAdCTjfCovx5boIm1xQaLHm9XrLs73Dkr2pX1SRkmL/7mHLYQmAhwoFqg9d3
	fc+uNfj/bf+Srn39Bf6xmJtHY5hvVuojsGz7sYx0pBydC6gwnPrjPaPiShVC7ql8R7pJtNJ7ltcnb
	AIuUJRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbwW-0000000FHP7-2k0k;
	Thu, 28 Nov 2024 10:40:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbvX-0000000FHIc-1cQY;
	Thu, 28 Nov 2024 10:39:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732790351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYmxpAymuaS1BHhRzDYCr8r7Tzu8mgJe4gNvGTzASXA=;
	b=cyPZAtWAGKbtlFWs9cEMvxPPbhEBsBnTgasmylViURLKCrFJZq4KUFb2hoQpVM+0Z9ZI1Z
	HO62GdcPQtLBS0emt0zgsqqt8D/KJgT9r+iriajxxywIfQ6InBLGnR/p2k6Co013cESbNE
	ZvqJB7jykaIt+TTjCTah9MpBi+fFiSzt5O6vnOLUxNefLPuZF0690cl1N4NcAIj9j3P05B
	i8Z31ZLczDPUPOurcPUxWuYufOzQVlkWXNONCH5XfzBTyT4KInz3+mkpb8kW0bPUR15U5W
	jeOXwEKawd/Jj0uU8epeY5AZbW0xLvajafN4AKc+/Cj7jduIIf0H8gha7FcrAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732790351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYmxpAymuaS1BHhRzDYCr8r7Tzu8mgJe4gNvGTzASXA=;
	b=xo4AX0OZ4yOQ7vQ7VDws86dLP7aK72d31WgBVqTxbaNaz3x+dO9DcPO/XU471u3j9BZxhr
	jOpHg1fBovstYFCw==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, bhe@redhat.com,
 farbere@amazon.com, hbathini@linux.ibm.com, adityag@linux.ibm.com,
 songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
In-Reply-To: <20241127152236.26122-1-farbere@amazon.com>
References: <20241127152236.26122-1-farbere@amazon.com>
Date: Thu, 28 Nov 2024 11:39:11 +0100
Message-ID: <87o71zy75c.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_023915_566185_BA4D2940 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Nov 27 2024 at 15:22, Eliav Farber wrote:
> diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
> index 80ceb5bd2680..54d0bd1bd449 100644
> --- a/arch/arm/kernel/machine_kexec.c
> +++ b/arch/arm/kernel/machine_kexec.c
> @@ -142,11 +142,8 @@ static void machine_kexec_mask_interrupts(void)
>  		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>  			chip->irq_eoi(&desc->irq_data);
>  
> -		if (chip->irq_mask)
> -			chip->irq_mask(&desc->irq_data);
> -
> -		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
> -			chip->irq_disable(&desc->irq_data);
> +		irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
> +		irq_disable(desc);

This is just wrong. If the interrupt was torn down, then its state is
deactivated and it was masked already. So the EOI handling and the
mask/disable dance are neither required nor make sense.

So this whole thing should be:

		chip = irq_desc_get_chip(desc);
-		if (!chip)
+		if (!chip || !irqd_is_started(&desc->irq_data))
                	continue;

But what's worse is that we have 4 almost identical variants of the same
code.

So instead of exposing core functionality and "fixing" up four variants,
can we please have a consolidated version of this function in the core
code:
                struct irq_chip *chip;
                int check_eoi = 1;

		chip = irq_desc_get_chip(desc);
		if (!chip || !irqd_is_started(&desc->irq_data))
                	continue;

                if (IS_ENABLED(CONFIG_.....)) {
                        /*
                         * Add a sensible comment which explains this.
                         */
                	check_eoi = irq_set_irqchip_state(....);
                }

		if (check_eoi && ....)
                	chip->irq_eoi(&desc->irq_data);

		irq_shutdown(desc);

No?

Thanks,

        tglx

