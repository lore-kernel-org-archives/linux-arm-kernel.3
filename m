Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A76CD2F7C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=818KVGLw8GMN1bYrM+ew2j8Hzoujv0mNjWO/xMRANZY=; b=EGTR/gSzdJCQ3lsBhB/NrSRJg7
	0erkEfkwDCQtzWnOPlbRwVrG05n1lH72HudPlQQVMkGTiFBN8TcrbOQLPtNo8MAk71ZHyBocTmLnM
	w+KLkp02klrnkGetpXf1aq9INP+szBWlBFBRfKq68ZVuVUbaj8pdMqpnPYnx4ZR7+wAewlNJ3OjT0
	YaxFy3vb2kqirdjASkEhkjcvA1G+x9yo/Ux1UYRUz3m+owpW3GqUYOebp1dFnzlJI9+J9nyBfhg8o
	iyJSqdZn49V0Rh25o/q85qxeGmxa+vHLjioIbenpkKkgCltNdGJqXtJ6CjFKWi8L3Ioo98qgcfJ04
	XcoZhhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRyn-00000009HwP-0db9;
	Fri, 05 Dec 2025 09:19:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRyl-00000009HwH-0B6W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 355FA60207;
	Fri,  5 Dec 2025 09:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA1DC4CEF1;
	Fri,  5 Dec 2025 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764926393;
	bh=lT/pcudMAAKNEf3hMBI+w8LvgOnpEyMVbtlvH+s44TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToGCcFvzkGWEjf2WJrzAPi48BHo5sW+oO10ov29Xjq4vN/ZF8PCrHJvpdiDYdcdI5
	 itHqws2a1iC2oG3SEzu3f4+0VFoOEC9xEptcaK1gBUnkZKLQ3uGZ324GgqpDKtFtPv
	 XPCl6w1vJ+A3L9MXpe2g/ugniYzZwjJavraDR5RzI4ybXo7APdYBy+VNPiYHFIRYf1
	 B04f4yNrafui7+Ggka6n9kZa0cEJlc/2EiEPliSwoEJiXJzCb2KDEijZXLajkpcGhX
	 bCWwmv7Fyw6WqG94t+oEJRP14ruHt7vj5smyheFyQlLoj+vPHiDcV6kshed8uDk9+j
	 RRpYvoRDO6shQ==
Date: Fri, 5 Dec 2025 09:19:47 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 16/26] genirq: Allow per-cpu interrupt sharing for
 non-overlapping affinities
Message-ID: <aTKjsz4TkqmPN678@aspen.lan>
References: <20251020122944.3074811-1-maz@kernel.org>
 <20251020122944.3074811-17-maz@kernel.org>
 <aTFozefMQRg7lYxh@aspen.lan>
 <867bv2pbsw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bv2pbsw.wl-maz@kernel.org>
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

On Thu, Dec 04, 2025 at 02:21:51PM +0000, Marc Zyngier wrote:
> On Thu, 04 Dec 2025 10:56:13 +0000,
> Daniel Thompson <danielt@kernel.org> wrote:
> > CPU 0 Unable to handle kernel paging request at virtual address 0000000000000000, epc == ffffffff801c2398, ra == ffffffff801bab00
> > Oops[#1]:
> > CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-next-20251204 #20 NONE
> > Hardware name: mti,malta
> > $ 0   : 0000000000000000 0000000000000001 0000000000000000 0000000000000000
> > $ 4   : 0000000000000001 a8000000020e8008 0000000000000000 ffffffff80c23b80
> > $ 8   : 0000000000000004 0000000000000000 0000000000000000 000000000000002f
> > $12   : a8000000020f4000 0000000000003ff0 0000000000003000 0000000000000003
> > $16   : ffffffff80d095c0 ffffffff80ceb410 0000000000000019 ffffffff80c378c0
> > $20   : ffffffff80c4bec8 0000000000000000 ffffffff80e00000 ffffffff80de0000
> > $24   : 0000000000000000 0000000000000010
> > $28   : ffffffff80c20000 a8000000020f7ec0 a800000000e12fcd ffffffff801bab00
> > epc   : ffffffff801c2398 handle_percpu_devid_irq+0xb8/0x250
> > ra    : ffffffff801bab00 handle_irq_desc+0x48/0x88
> > Status: 1400a4e2	KX SX UX KERNEL EXL
> > Cause : 00800408 (ExcCode 02)
> > BadVA : 0000000000000000
> > PrId  : 0001a900 (MIPS I6400)
> > Modules linked in:
> > Process swapper/0 (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
> > Stack : ffffffff80c35a2c 0000000000000002 ffffffff80e00000 0fffffffffffffff
> >         ffffffff80c50000 0000000000000001 0000000000000003 ffffffff801bab00
> >         0000000000000000 ffffffff805d82a8 0000000000000000 0000000000000008
> >         0000000000000000 0000000000000000 0000000000000000 5189d95a7a4f4800
> >         a800000002014300 0000000000000002 0000000000000001 000000000000001f
> >         ffffffff80e00000 0000000000000004 0000000000000000 ffffffff801bab00
> >         0000000000000000 ffffffff809ec128 0000000000000001 fffffffffffffffb
> >         0000000000000001 ffffffff805d7ebc 0000000000000000 0000000000000000
> >         ffffffff80c23c80 ffffffff80c50000 ffffffff80de0000 ffffffff80db0000
> >         0000000000000000 ffffffff80112f10 ffffffff80c23c80 0000000000000000
> > Call Trace:
> > [<ffffffff801c2398>] handle_percpu_devid_irq+0xb8/0x250
> > [<ffffffff801bab00>] handle_irq_desc+0x48/0x88
> > [<ffffffff805d82a8>] gic_irq_dispatch+0xc0/0x288
> > [<ffffffff801bab00>] handle_irq_desc+0x48/0x88
> > [<ffffffff809ec128>] do_domain_IRQ+0x28/0x40
> > [<ffffffff805d7ebc>] plat_irq_dispatch+0x64/0xe8
> > [<ffffffff80112f10>] handle_int+0x134/0x140
> > [<ffffffff80110dc8>] calibrate_delay+0x158/0x290
> > [<ffffffff80d58e48>] start_kernel+0x754/0x7a4
>
> This hack fixes it for me, but really, mips needs to grow up and stop
> using these antiquated APIs.

I can't comment on that. Literally the only thing I ever do on MIPS is
test kgdb ;-) .


> Can please you give it a go?

Looks good to me.

Local testing on MIPS worked nicely and I got a successful build back
for the kgdb tests:
https://gitlab.com/daniel-thompson/linux/-/pipelines/2196473049


Daniel.

