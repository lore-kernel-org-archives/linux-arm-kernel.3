Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2337ED116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpWPac07+wxKuS6MpbrUgSTLRodN/pdTRBhnL8dG2vY=; b=YGEcFXpBGVnidOONahG/v+wWf2
	crsR5oaPlApQ11bVmthXzZ1YcOJLOs5PMfUOMcfNcoZ/zza6xB/hUHNIvfNgnCoNwqpwLYXiI40dm
	htpNoXCqIwO5FtgYFq6ESyaVMuhh5loOZ5XmAR13GMWaec++sm7nyQhxnl2KTfkHyJCkxLUSVA5Xn
	1nVGVeX648aO9tderwqvSzKyTG/o2jLs8+MQhd5ZxQ9buIym5hYSbVGFYPGasGe24dJA2Fv0HqLTZ
	GQ12yRlHlvnThrHois+J69Di1UVerJ9r3Sh7e12drTjUyYkB2sZVw2bgFoMO4tQPTKVyMxk/KQbLy
	wVcXNLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7KF-00000004KYS-3Ueb;
	Mon, 01 Dec 2025 17:04:35 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7KC-00000004KY2-37YV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 17:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qpWPac07+wxKuS6MpbrUgSTLRodN/pdTRBhnL8dG2vY=; b=CLxaaLWkd3Vj5LUt6l2CXj+WRu
	ukMTYnMpmH24s/EHBRlnEGvrQkuF49Vfw0EtxtIzdqK3vs8wUlz6OZ73jYFKwfY1O4kPItmfVpc2x
	4AzCx0xKRy9jtBJkklK3jIKo/Quvc/cRrFEzYPQNqC6Ppgdvhl/ft62EF209KfCbZ4jA/FzzalU3R
	+BV2Z1lFZjUlOUt/HsWghB0xKES8D3iqUrZdSPm4klZFDghscTS2C7H/CoFsJFkq2SUdKm9bGHHTy
	eswosTUTk70b5v1zmKo5TrxGGlD7kBHmXY2CGmrDNITguyPVuZkeOmkZhKFghi9aCUm2XF5dG+NiQ
	rKmAtvqA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vQ7Js-000nOf-RR; Mon, 01 Dec 2025 17:04:12 +0000
Date: Mon, 1 Dec 2025 09:04:07 -0800
From: Breno Leitao <leitao@debian.org>
To: Petr Mladek <pmladek@suse.com>
Cc: john.ogness@linutronix.de, linux@armlinux.org.uk, paulmck@kernel.org, 
	usamaarif642@gmail.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <qluelhof4piilyqbyanflp3qdljxak73kt2yvahkaby6vmyzzu@qgvqej7kdio5>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
 <aSnI8UQRNICSKxAb@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSnI8UQRNICSKxAb@pathway.suse.cz>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_090432_825423_742EA7D2 
X-CRM114-Status: GOOD (  17.10  )
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

Hello Petr,

On Fri, Nov 28, 2025 at 05:08:17PM +0100, Petr Mladek wrote:
> On Tue 2025-11-25 08:02:16, Breno Leitao wrote:
>
> I do _not_ think that the CPU was waiting in pl011_console_write_atomic() in the
> the following cycle the entire 11 secs:
> 
> 	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
> 		cpu_relax();
> 
> A more likely scenario was that pl011_console_write_atomic() was
> called several times during this period because there were more
> pending messages.

Probably. Most of the messages are coming from CPU being powered off:

	[   44.119433] psci: CPU1 killed (polled 0 ms)
	[   44.146057] psci: CPU2 killed (polled 0 ms)
	[   44.182058] psci: CPU3 killed (polled 0 ms)
	[   44.218031] psci: CPU4 killed (polled 0 ms)
	[   44.252962] psci: CPU5 killed (polled 0 ms)
	[   44.276939] psci: CPU6 killed (polled 0 ms)
	[   44.296152] psci: CPU7 killed (polled 1 ms)
	....

And this only happens on "large" machines, thus, the host is flushing
a lot of messages during kexec turn down time.

> >   printk_kthreads_shutdown (kernel/printk/printk.c:?)
> 
> But the function seems be called with IRQs enabled. So that it might
> help to restore IRQs after each flushed message.

Agree. This would make the irq-disabled sections much smaller, with
a higher changes of IPIs and NMIs (on arm64 hosts without FEAT_NMI).

> But we could extend the existing commit d5d399efff6577 ("printk/nbcon:
> Release nbcon consoles ownership in atomic flush after each emitted
> record") and restore IRQs after each emitted record.
> 
> I wonder if the following patch would help in this scenario.
> It is made on top of "for-next" branch in printk/linux.git.
> But the most important pre-requisite is the above mentioned commit
> in the branch "rework/atomic-flush-hardlockup".
> 
> Note that the patch is only compile tested.

I've tested the patch and I don't see the CSD lockups anymore.
Thanks for the quick fix.

> Closes: https://lore.kernel.org/r/sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Tested-by: Breno Leitao <leitao@debian.org>

Thanks for all people involved in here. With this last patch (that makes
the irq-disbled section smaller), and kfence not IPIing during kexec
time, I consider this issue closed. 

--breno

