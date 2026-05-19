Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72326CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgwMblJfIxEmaANWEuRgc49UNNTEJj4iwpCYVZQxH64=; b=wT4wV57KUO3M/WT8VNixdV4+lc
	g+pK6U35q1oNnMmV/QlsoSwCnqpLPp2o32lXlF1Wh2shpYvjUcsBJRpnS+ox65snur3e5kqujrTVF
	6+BQ5Cq53RLmrc7f0Oll7cPfMBgrTDl/w38qpA2KjIrxLjbfjC0ccbamxfGQHCjJw1WPnNqoRXfI2
	eheiRr9IKWTR+2GIZzHQlYBi8uouWHDfz9IC1IFbkAl+lh6+pfw15UXLRbo8qjT2yv0IPbrtXbLIz
	rzjQB7XWdQ7vWsJe/Zmvu55MC3mC7vWooqrtMmKM0tQ0TtQzLc6/pZ1dSSczuvW1s5VeUPCUTFLxM
	0JCH/91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQso-00000002hUQ-1vv3;
	Tue, 19 May 2026 20:17:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQsm-00000002hUC-481L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:17:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14C1260216;
	Tue, 19 May 2026 20:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503B81F000E9;
	Tue, 19 May 2026 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779221859;
	bh=JgwMblJfIxEmaANWEuRgc49UNNTEJj4iwpCYVZQxH64=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BS7h5UyLvMIY/o09LiVQZ5odLA7cvPjyIpzG2hY0oyp57jnKokHf9goMsQ8jOlvwn
	 7J7BT1MuRvlHydrdp9IFLZAzIyrf3jwDV7jsK4nsYIh2N7RHXQ9Q6NRwcF2yuVOzTm
	 srRO+peKwLofUYR8xTKXKos1EE0OUwgvE+G13Kp8=
Date: Tue, 19 May 2026 13:17:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
 baohua@kernel.org, Xueyuan.chen21@gmail.com, dev.jain@arm.com,
 rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v2 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-Id: <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Thu, 14 May 2026 17:41:01 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wro=
te:

> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous.
>=20
> ...
>=20
> On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> the performance CPUfreq policy enabled, benchmark results:
>=20
> * ioremap(1 MB): 1.35=D7 faster (3407 ns -> 2526 ns)
> * vmalloc(1 MB) mapping time (excluding allocation) with
>   VM_ALLOW_HUGE_VMAP: 1.42=D7 faster (5.00 us -> 3.53us)
> * vmap(100MB) with order-8 pages: 8.3=D7 faster (1235 us -> 149 us)

Nice.

AI review found a bunch of things to ask about:
	https://sashiko.dev/#/patchset/20260514094108.2016201-1-jiangwen6@xiaomi.c=
om

It doesn't appear that you'll be getting any more review on this
series, so please check the above questions and resend?


