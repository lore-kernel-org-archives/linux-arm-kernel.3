Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C2C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/2lAloUxNkyUNTQVRqjrzrN3TnrTeD5XrpCGs1lgZg=; b=snekCFbEMdtJhhtbD2+7STvWgl
	uSqFfr23myRx9DwYA01bJp+Kx+KTicqL2tbHbgsl83h3Sthl76i2XrfblTcFsABh+utF6bC+mlfHD
	SUWxnZxk0ST1VE5mWlyK1KmuTcP3FzA8dbNbCUIrxxRomeUEZgE0MvPHsF8i7gUA6tGfnnvhCecdy
	BgqQaXYaG2Qqy5A9Hl5b4MKkiGckBbpCmHdJj6wa8XFJgB8kB2qBlkQw5FQgElyyRQrPTkhN3yNun
	tQlzUcvan6uNNyHdi+Ckv24ZXjF1sOvShmLLV9Zrcrtnahn5882Da5jCQnqrrNN4wM9XUamm+X7DZ
	QuhXuaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ6Z-00000004m2D-20sh;
	Thu, 02 Jul 2026 15:13:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ6X-00000004m1z-45wR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:13:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6256343A01;
	Thu,  2 Jul 2026 15:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978F81F00A3A;
	Thu,  2 Jul 2026 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005209;
	bh=v/2lAloUxNkyUNTQVRqjrzrN3TnrTeD5XrpCGs1lgZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EN2SdiREAz1ok0NPvBjkDF0HuLa0AU/nOMLBgyunSJGfd2BW7LIzDbnytNnya2Wow
	 M4eGqbopfqhp6luTj8CaXF4zEjq4TV4x6Pf8ZJ52FTOLyUqqQx2Zf+KmHkhGN8dcD+
	 JF2yZ12lhDJIUCSgHb6McnGJSLUaHxejbiW2gnAZPG/2E0RLFSVOk0k7YgzmE0oym2
	 JSRAiU7RF87EncgDYC031O5EpLXxy4luB8jRyn9G2MPfiHzxMJDn6ZijN+oWA7BZdO
	 z2bzVjrUdRIDKQdKKDnRRCl/3ZnEJzjka+QpygLxMbXocGfbxmL3a/206JZAVfvRK9
	 YZJzn40lfCkOA==
From: Thomas Gleixner <tglx@kernel.org>
To: Bjoern Doebel <doebel@amazon.de>, stable@vger.kernel.org, Marc Zyngier
 <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Woodhouse <dwmw@amazon.co.uk>, Ali
 Saidi <alisaidi@amazon.com>, David Arinzon <darinzon@amazon.com>, Zeev
 Zilberman <zeev@amazon.com>
Cc: Bjoern Doebel <doebel@amazon.de>
Subject: Re: [PATCH] irqchip/gic-v3-its: Reconfigure ITS from software state
 on resume
In-Reply-To: <akZPM6SeJiM8th0N@amazon.de>
References: <20260507183102.1897629-1-doebel@amazon.de>
 <akZPM6SeJiM8th0N@amazon.de>
Date: Thu, 02 Jul 2026 17:13:26 +0200
Message-ID: <87y0fto25l.ffs@fw13>
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

On Thu, Jul 02 2026 at 11:57, Bjoern Doebel wrote:

> Hi all,
>
> gentle ping on this one.

Marc?

> Since the original posting I've re-validated the fix against current
> mainline:
>
>   - It still applies cleanly to v7.2-rc1 (and to v7.1.0).
>
>   - I reproduced the original failure on *stock* v7.2-rc1. On EC2
>     Graviton instances, hibernation resume fails 100% of the time: the
>     ITS comes back reset, MAPD/MAPTI are never replayed, and the ENA
>     NIC silently loses its LPIs:
>
>       ena 0000:00:05.0: ... didn't receive a MSI-X interrupt (cmd 3)
>       ena 0000:00:05.0: Failed to create IO CQ. error: -62
>
>     The instance then has no networking after resume.
>
>   - With this patch applied, the same kernel survives hibernate/resume
>     cleanly: 9/9 cycles with zero failures, across all three Graviton
>     generations (Graviton 2/3/4, i.e. Neoverse N1/V1/V2), networking
>     fully restored on every resume.
>
> As described in the previous message, this is the fallout from 713335b6ee29
> ("irqchip/gic-v3-its: Implement .msi_teardown() callback"): device
> teardown no longer happens across a suspend/resume that keeps the MSI
> domain, so the ITS is never reprogrammed and drops interrupts after the
> hardware has been reset.
>
> Could you take a look when you get a chance?
>
> Thanks,
> Bjoern
>
>
>
>
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597

