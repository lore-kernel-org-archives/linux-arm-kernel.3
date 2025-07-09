Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667ACC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz3YgJnlUNW47E+9cHkUH8RMoEMBsNQYKP2VJAdtDRM=; b=BVUlrc8Yai9/c21z8b4CkzyQN+
	Gsr5z9qyOKaupyIqFOrEupTpO0FDogTCwECMzHdfRtkqCFE/m6xLpK2SWin3EOQbzAQR0erqx654H
	m+3eUi0yGREd7Ht7y+ItWw768Iccya7Mno0F7DDVC7He/JxdMXObY9MD3m9vskmn2Qz+oO8BzRASr
	h9zXsIDSJ2YFHu3LzrcibXAb5XxS8FwPSnZDen2wOQkpLCWs2tccO8lyza8Fd8fJrp5haPgsAY4Ow
	+hWtAkfWlS+5ZkapnQ5Ch0aWiaIbaZL7BKL8A61VxlJNGN9fRWIxs5jpbUFkup8FZUVfMPpVKxOLm
	Lzf2guOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXVY-00000009Iar-0ZSA;
	Wed, 09 Jul 2025 16:18:56 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVi8-00000008xxs-4BEE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:23:50 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso9136749a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071027; x=1752675827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xz3YgJnlUNW47E+9cHkUH8RMoEMBsNQYKP2VJAdtDRM=;
        b=eFDvkLuEEGtjPj5DLSAGzQVMS8hCwxYJU4pan9il1AlYY1hnkVivBKE6zbjLi74zHF
         b8nnsmZbmevM4qoQ/UydPdSB8Q42C/BRF3WYW4MMaHw6sFMzP50MOPwA67stu0nfB33L
         ulzk751SkZPO9ywpNlQcuNMkHQNqpfI9cWawi0M+lpM6Py8Dv3Z4I7eAmdB0fhhk5g1A
         ZpS6QAaoPTL6X8h7Sh/VmcqP7v9mcJKNR7Q37RdmBxPVDbjk/2fQjmtGOIPoPuj4q1Eb
         Ea5OiPycChWLv2wguX/lf0rVsbwd/9Qt6ncKf1vzivw+b9LlR0yFsJZyjBbbvPrGwKYY
         HgxA==
X-Forwarded-Encrypted: i=1; AJvYcCXxWtlX5rV/Ps6juL+KL+qo8sTlPiQDEa3H9IwiZElEbU/igTsg4ZTCmerTUwEafxwCVxro29i2mgm/+wQo8+5N@lists.infradead.org
X-Gm-Message-State: AOJu0YyGiGN3W+RwktBLrYAItF0fn5bKmY9fZmnIPhGodMjm/xuTt4fU
	i3QE09kTzNWOpolhgJUWV6VouJ2j20qRvuJA72QcHe1mJO/rz8IXEEIs
X-Gm-Gg: ASbGncup77EV8dKItre4SGrHx8qWKv2nCZdTRfsVyqmZaakxFXhQoWzZU/u3AxQWE9U
	Bjiqopp5eNoHyXIvrhQ2o1krvSmxsDs0GhP+5WvVAt3vNTLsFd43NnjXyjIluINMY3I9KKl0n0V
	aw6C5i2qFY8Yqk7tnktc52hjwYxWsytkpvWhyjpKDb/ESakszLzzAKUJIvgHrmVX5xwhfxgMLMr
	82wLzXILEjd2nUaidP54mqNjuBSArVgkUZE2CJ+gLXzIxN9cU/mNohBZ4F4qTYcE2gArUhuDkmy
	qQ3supuzmzQkKCHyMSUz1N7/TMlZ0N8UkZpycZIjz8opUJPbHJVmtQ==
X-Google-Smtp-Source: AGHT+IG9fbAxEwBEkk9DE/KSa7JmRtTm35JlrUR/YJvs45MqHuy9kT5yu1OfyqhuvJJX+KtoT208mA==
X-Received: by 2002:a17:907:268e:b0:ae3:53b3:b67d with SMTP id a640c23a62f3a-ae6cf5592c8mr297705066b.1.1752071027086;
        Wed, 09 Jul 2025 07:23:47 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f62e0e21sm1096020466b.0.2025.07.09.07.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:23:46 -0700 (PDT)
Date: Wed, 9 Jul 2025 07:23:44 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>, ankita@nvidia.com, 
	bwicaksono@nvidia.com
Cc: rmk+kernel@armlinux.org.uk, catalin.marinas@arm.com, 
	linux-serial@vger.kernel.org, rmikey@meta.com, linux-arm-kernel@lists.infradead.org, 
	usamaarif642@gmail.com, leo.yan@arm.com, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <juiog3337iozva23zpf4apdydegj4z7jibqykfvcgnkabemw4w@z5g5hhwrqr2w>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <aGZbYmV26kUKJwu_@J2N7QTR9R3>
 <aGaQBghdAl8VGWmV@gmail.com>
 <aGawTd8N2i8MDCmL@J2N7QTR9R3>
 <aG0kYjl/sphGqd4r@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG0kYjl/sphGqd4r@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_072349_036863_C943F7FC 
X-CRM114-Status: GOOD (  18.31  )
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

On Tue, Jul 08, 2025 at 07:00:45AM -0700, Breno Leitao wrote:
> On Thu, Jul 03, 2025 at 05:31:09PM +0100, Mark Rutland wrote:
> 
> Here is more information I got about this problem. TL;DR: While the
> machine is booting, it is throttled by the UART speed, while having IRQ
> disabled.

quick update: I've identified a solution that significantly improves the
situation. I've found that the serial issue was heavily affecting boot
time, which is unleashed now.

After applying the following fix, the boot speed has improved
dramatically. It's the fastest I've seen, and the CSD lockups are gone.

If no concerns raise in the next days, I will send it officially to the
serial maintainers.

Author: Breno Leitao <leitao@debian.org>
Date:   Wed Jul 9 05:57:06 2025 -0700

    serial: amba-pl011: Fix boot performance by switching to console_initcall()

    Replace arch_initcall() with console_initcall() for PL011 driver initialization
    to resolve severe boot performance issues.

    The current arch_initcall() registration causes the console to initialize
    before the printk subsystem is ready, forcing the driver into atomic mode
    during early boot. This results in:

    - 5-8 second boot delay while ~700 boot messages are processed
    - System freeze with IRQs disabled during message output
    - Each character transmitted synchronously with cpu_relax() polling

    This is what is driving the driver to atomic mode in the early boot:

      static inline void printk_get_console_flush_type(struct console_flush_type *ft)
      {
            ....
            if (printk_kthreads_running)
                    ft->nbcon_offload = true;

    The atomic path processes each character individually through
    pl011_console_putchar(), waiting for UART transmission completion
    before proceeding. With only one CPU online during early boot,
    this creates a bottleneck where the system spends excessive time
    in interrupt-disabled state.

    Here is how the code looks like:

      1) disable interrupt
      2) for each of these 700 messages, call pl011_console_write_atomic()
      3) for each character in the message, calls pl011_console_putchar(),
         which waits for the character to be transmitted
      4) once all the line is transmitted, wait for the UART to be idle
      5) re-enable interrupt

    Here is the code representation of the above:

            pl011_console_write_atomic() {
                    ...
                    // For each char in the message
                    pl011_console_putchar() {
                            while (pl011_read(uap, REG_FR) & UART01x_FR_TXFF)
                                    cpu_relax();
                    }
                    while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
                            cpu_relax();

    Using console_initcall() ensures proper initialization order,
    allowing the printk subsystem to use threaded output instead
    of atomic mode, eliminating the performance bottleneck.

    Performance improvement: 16x faster kernel boot time at my GRACE SoC
    machine.

      - Before: 10.08s to reach init process
      - After: 0.62s to reach init process

    Here are more timing details, collected from Linus' upstream, where the
    only different is this patch:

    Linus upstream:
      [    0.616203] printk: legacy console [netcon_ext0] enabled
      [    0.627469] Run /init as init process
      [    0.837477] loop: module loaded
      [    8.354803] Adding 134199360k swap on /swapvol/swapfile.

    With this patch:
      [    0.305109] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
      [   10.081742] Run /init as init process
      [   13.288717] loop: module loaded
      [   22.919934] Adding 134199168k swap on /swapvol/swapfile.

    Link: https://lore.kernel.org/all/aGVn%2FSnOvwWewkOW@gmail.com/ [1]

    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 22939841b1de..0cf251365825 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -3116,7 +3116,7 @@ static void __exit pl011_exit(void)
  * While this can be a module, if builtin it's most likely the console
  * So let's leave module_exit but move module_init to an earlier place
  */
-arch_initcall(pl011_init);
+console_initcall(pl011_init);
 module_exit(pl011_exit);

 MODULE_AUTHOR("ARM Ltd/Deep Blue Solutions Ltd");






