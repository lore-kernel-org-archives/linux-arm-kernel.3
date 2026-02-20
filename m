Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C24C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Q9sXkyTULRlV/f5Z9X6brMtiW0sBJ93vcPjisGnwpA=; b=XKkUgPESMNX4gXmdQGycgSNwSe
	Gyv49n6QpD3QWFyYWWMpJjpoR9ord/bEs2CWe+71SkgmY7jmXdfzLU9t2tWwWYM25osraFIbOtBS5
	JtxpNPalJNG1qjxlaySAWqQR08lGbyGnvk1JekhmSREmX4iSTQLy6lMDiV8tQ/6p3ZlDZMdX8M/Cy
	mRFwXZkXxzBaDI9/qOk8JhUOl547nQwyF1qG4rrp02WEXxyJsxcnNbl/E0bdSZlovbqSXTm31rXVz
	0KfvogXIMy6bPPbL57zEgJRL54URLLtrunevWZCB4wb0lYF9RzXdBZMbHbgx5sTa5xhSE6grUiu+i
	SDXwrhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTfM-0000000FJuW-0EcA;
	Fri, 20 Feb 2026 16:47:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTfJ-0000000FJtw-3qml;
	Fri, 20 Feb 2026 16:47:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 542A4339;
	Fri, 20 Feb 2026 08:47:34 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DEE53F62B;
	Fri, 20 Feb 2026 08:47:40 -0800 (PST)
Date: Fri, 20 Feb 2026 16:47:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <20260220164738.GH136967@e132581.arm.com>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-4-jszhang@kernel.org>
 <20260220123414.GF136967@e132581.arm.com>
 <aZheqINXslxlrmTt@xhacker>
 <aZhi1p0NJH5ug8CA@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZhi1p0NJH5ug8CA@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_084742_000289_AFF56D1A 
X-CRM114-Status: GOOD (  12.36  )
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

On Fri, Feb 20, 2026 at 09:34:14PM +0800, Jisheng Zhang wrote:

[...]

> > > Run 3 iterations, and measures three metrics (messaging/pipe/seccomp)
> > > and results in seconds. Less is better.
> > > 
> > >   +---------------------+--------+--------+--------+--------+
> > >   |Without change       |   run1 |   run2 |   run3 |    avg |
> > >   +---------------------+--------+--------+--------+--------+
> > >   |messaging (sec)      |  4.546 |  4.508 |  4.591 |  4.548 |
> > >   |pipe (sec)           | 24.258 | 24.224 | 24.017 | 24.166 |
> > >   |seccomp-notify (sec) | 48.393 | 48.457 | 48.232 | 48.361 |
> > >   +---------------------+--------+--------+--------+--------+
> > > 
> > >   +---------------------+--------+--------+--------+--------+--------+
> > >   |With change          |   run1 |   run2 |   run3 |    avg |   diff |
> > >   +---------------------+--------+--------+--------+--------+--------+
> > >   |messaging (sec)      |  4.493 |  4.523 |  4.556 |  4.524 | +0.52% |
> > >   |pipe (sec)           | 23.159 | 23.702 | 28.649 | 25.170 | -4.15% |
> > 
> > If you check the result, this result variance is abnormal, it means
> > your OS is noiser.
> 
> BTW: if you remove the abnormal run3 result, you'll find that the
> benchmark is improved by ~3.5% on CA73:
> (23.159 + 23.702) / 2 = 23.43
> (24.258 + 24.224) / 2 = 24.24
> (24.24 - 23.43)*100 / 23.43 = ~3.5

TBH, I don't think we should subjectively select data.  But I agree a
clean test env is important to avoid noise, and I also agree that the
current results already show positive signals.

Thanks,
Leo

