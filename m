Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E858CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ3QL+ViFIRQLIm9wDhWdL0BX/Xy+P2cyftFjHpTXuA=; b=YW5jnCIEepZ3t8OpqlI5qOOuvA
	ASJuKUF/bcyV4XczOCe/0hCHDbw906RVMofRREr2xAEdBoO4GVIkrwsMghThzcf1o60AyEdoSIITQ
	DdbooSL5SRq7J2mEvpfJ4ooUWNwRImiIv5pPAScj9dKHGM+oelQDcYJtW1NthEGuclJzQbpc6h6WY
	JIG00kQMVDaOwptudO9mxo5sPkday/sNUjewbONYzK9LP97AA8yevSQkNHmWrewxnTkE0PeBtsIhH
	MzmrV6G9pELvkTfnnjkdSWri0UsAoeNFH3jL6kz1yZyucwJaOGeqhU7O9/jNMea7ZZoy3ZJ6piCN/
	2FDALNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbHqG-00000003wex-3ZWU;
	Sun, 21 Jun 2026 13:04:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbHqF-00000003weo-2Cnv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 13:04:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED7EF43E1A;
	Sun, 21 Jun 2026 13:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436C81F000E9;
	Sun, 21 Jun 2026 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782047042;
	bh=XZ3QL+ViFIRQLIm9wDhWdL0BX/Xy+P2cyftFjHpTXuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Fov1mXvDuGCK2T8sN6e2OfQHKCECHfbpGXRBBqt0mJumjJ/lQbWWgN+HJ+/A1VLw+
	 e5YBQ183dvuJj8bkhkLpBwxFrOxwQLVALwfGN8E1vAdvSrax2YUe76xVCjK7uPwOFi
	 8L8TB9EiAaEyP+6x5OTgJet8aZiHBkKPALBPE4+VYsqKVHMeJsBx9VwREe4epBtPeP
	 n9K1YBwfMVRT70tbP5fJHUITXTsn/07OQJHxOY03KDzngCMaGRvGI98OxNWNIGSt1/
	 pUwueEV4G7f1R4ZCP/PbFKS6BI+0tZTyLgw9UhMTaK5YsTglkNBetTBg7DaYsXC78p
	 S9lKpmXhld3Cw==
Date: Sun, 21 Jun 2026 09:03:53 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, Yury
 Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <20260621090353.24772584@fedora>
In-Reply-To: <20260621135531.243375d9@pumpkin>
References: <20260621093430.264983361@kernel.org>
	<20260621093811.168514984@kernel.org>
	<87ik7cmcb7.ffs@fw13>
	<20260621135531.243375d9@pumpkin>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 21 Jun 2026 13:55:31 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> Indeed...
> Isn't trace_printk() just an extern?
> Having it defined somewhere isn't going to make any difference to build times.

No it is not. It is a macro to cut as many nanoseconds as possible as
trace_printk() was created to debug tight race conditions and any added
latency can make the race go away.

-- Steve

