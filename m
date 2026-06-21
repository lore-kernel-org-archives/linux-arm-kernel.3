Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA62CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XsKwg1GS9lT4/Q7bmwm9MowVi5d7q2SDPsQIWMoNaw=; b=o/BUNAJmSbHNBkYa+M1Fh2FAlG
	h6Aaalmt1F2w65GOAcm6yMDodKWagaLADNuuKcatJS0Rk36+jNUUmAZPrHCY/u9FauTw39WaJnR6c
	iCZ4A7gM9X7Rh+bkTZHxMNSMRG/MrX91RYNoG0zol+0VcD2qiIXxotTSgjsntZEKduUaNcZHNkV1d
	qK2t5BkFljiRKeBs1l1nV7vDoaq3YZjySpLpTl6ap/s8woaKQqaRvIIehn634gfymEYSc8JQtGXr/
	M965yxmbypPgMXEe9B4BOJ5L4hh0Iz14ZGLBU3XfCOKVaCyHPCelmjFfOSDz35F2+wGcgkSIRc9vz
	UUP/iyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbFAo-00000003uAn-102P;
	Sun, 21 Jun 2026 10:13:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbFAm-00000003uAh-2T9J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 10:13:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7228F60051;
	Sun, 21 Jun 2026 10:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8508F1F000E9;
	Sun, 21 Jun 2026 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782036783;
	bh=6XsKwg1GS9lT4/Q7bmwm9MowVi5d7q2SDPsQIWMoNaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SsyZ+1TsvgLflg0juXYCjcA3pH8vd+Y9MqLc0jYTOhxn+P6dy4eY5MVrVxb5LOEoG
	 RrsJ0srGqaRi77KiHkc+wrXh1Emat3ZrzazsysIAaCQMNMGheBK5y3Hia7XGDjeIwh
	 LpelPKZxXhh8Y2s446VszI2jLhTRwLl2n4aoLyozgo8nfNqijIIBJo83nfZDkhDjVn
	 zeV/f4D/0nNSdjN56lwbs/1HvvZ3/sR6vxbzEQ0DhZ/vS4thbxkh+Wd09+S0HmhHwJ
	 J68RbJ78ssT3222GKOLcajGNFfc3WxJv5d4ocntPrsfqRDltQ6MWCkBxIPIk+xpkfW
	 jKewonDrI7TBQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>,
 Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
In-Reply-To: <20260621093811.168514984@kernel.org>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org>
Date: Sun, 21 Jun 2026 12:13:00 +0200
Message-ID: <87ik7cmcb7.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, Jun 21 2026 at 05:34, Steven Rostedt wrote:
> Instead of having trace_printk.h included in kernel.h, create a config
> TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> Makefile to allow developers to add trace_printk() without the need to add
> the include for it. Having it included in the Makefile keeps it from being
> in the dependency chain and it will not waste extra CPU cycles for those
> building the kernel without using trace_printk.

IOW, you make it worse just because.

With the header being separate I add the three trace_printk()s and the
include to the source file I'm investigating. The recompile will build
exactly this source file.

Having to enable the config knob will result in a full kernel rebuild
for no value.

Seriously?

Thanks,

        tglx



