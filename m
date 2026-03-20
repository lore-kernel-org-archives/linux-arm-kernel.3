Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DC41098796
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnSjQ7Lpit07YVCpPuEqq6BeuB7OX9Q4zPm56j5sExI=; b=2yhOShZGkbFzgkls9dI0ZEUIOI
	gj907g6tXzRCsYTXX4eXwqxiUFg+th+sqkxQTd6mNg1SinmLQ6rGf0sOwjhYKIyr1PTEjKTq9/kFt
	+r7y8m7hJcNsZOqtUfvOjJ6ueXuSWSEMiUunyGOWrm8xYea+XH5sdTDbtF2FsCV+lGwo5th9kH1b+
	j8KOpMPomnom83fMsW515RCA6i+rfAv/qNG7EaBZw8NfZ1pEqB0AKjqbddmdh+VbGDhLz3FMESzXc
	xaxcLUp7SIU8w/pKBxvjvVAje9YwPiilGZXziMWioqCarbhmE4r03ooicv5mIPvax5J8JWbDt0zjv
	jjGC9gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bUp-0000000D0co-1W7v;
	Fri, 20 Mar 2026 15:10:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bUo-0000000D0ci-2iLf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6D8E60127;
	Fri, 20 Mar 2026 15:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F4FC2BC87;
	Fri, 20 Mar 2026 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019441;
	bh=8NutCIg1nSzibPkpyDvrmrsAIlpHtcascMUrPpV4bFY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CqxyCRrXEVdJ9Ua4Zk705ial7OG8sH6Y/jjG6sZL8eDkDnKLuxM5XABXmcwdnSyyo
	 HtLl9uS+kB3yJSH8a3PDfmkesHwsfOX3yb9zbCp+OD4YEv08fmVtLPCL8F1KWH/mD2
	 pprI+FSZvUcYYdGi6UTz9pkGMo6sN07rj3tniOS1HlWsG3VnE4gEz/7VZ8k7wGC6v9
	 iXT7Vq8dpG3HFY+sGc5QbEtOvaEswARLM0647As2XKqwklViOY3/T7G5zDpRLlJrSh
	 uWkZJKLAOV52AlrRSEaETGe6UGaXTsT5LXX1hqAyMp2RokqCdLatDi0pVWIiYDHW37
	 zR7jd+qnRg5yQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>, Marc Zyngier <maz@kernel.org>,
 Lorenzo
 Pieralisi <lpieralisi@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jan Kiszka
 <jan.kiszka@siemens.com>
Subject: Re: Question: interrupt randomness and handle_percpu_devid_irq()
In-Reply-To: <SN6PR02MB41577F8265CA23C3027364F7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB41577F8265CA23C3027364F7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Fri, 20 Mar 2026 16:10:37 +0100
Message-ID: <87bjgik042.ffs@tglx>
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

On Thu, Mar 19 2026 at 19:34, Michael Kelley wrote:
> The function header comment for handle_percpu_devid_irq() says that it is the
> same as handle_percpu_irq(), but with the addition of a pointer to a percpu
> variable with the real device id. That makes sense. But there's another difference:
> handle_percpu_irq() calls add_interrupt_randomness() [via handle_irq_event_percpu()],
> while handle_percpu_devid_irq() does not.
>
> Question: Is there a reason for this difference in handling interrupt randomness?
> Or is it just an oversight? handle_percpu_devid_irq() is used, for example, for the
> SGIs and PPIs on the GICv3 chip, so I wondered if IPIs (as built on SGIs) & PPIs
> specifically did not want the overhead of add_interrupt_randomness(). But then
> GICv5 is doing IPIs using LPIs, which use handle_percpu_irq() and hence *do*
> add interrupt randomness. That seemed inconsistent, which didn't help provide
> an answer.
>
> The question arises in the context of Linux guests running on Hyper-V. Hyper-V
> VMBus interrupts to the guest are per-CPU interrupts in Linux, using a PPI on
> arm64. So these interrupts do not call add_interrupt_randomness(), which is a
> problem because these guests don't have much other way to get entropy. To
> fix this, the VMBus ISR has always had an explicit call to
> add_interrupt_randomness(). But maybe that's not the best approach, and
> handle_percpu_devid_irq() should be fixed to call add_interrupt_randomness().

I don't think there is a real good reason unless any of those interrupts
is NMI like.

Thanks,

        tglx

