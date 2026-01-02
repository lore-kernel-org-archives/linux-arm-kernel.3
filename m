Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB140FA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfp0vOpU/C0y9oWZefdEhz0M9QMslqJoP/j34iw2EJc=; b=p1bXKbBlX97PTyA6GAKY3OH3VL
	VlQbJ+ffPnBVgJBFOUZk229XVeqXcXJLwwzfNTHMVG6ULSvxBl1L4cjRRN+2kJFay7hdCHOudifiR
	7KSW2Ji3PoNrZlnAPdZfD85BuZwzspG7XWKC5xGqTW4dz9VmtcQQajnLCqpn/NSHnCrztDiRspFBi
	enoeCAo7FtfNFLW73TlvLR7op0I5FMIRjGA/6+y5cVzG0/KuRIykzmkZqwMkTS29pqb/u7dLXNENn
	t/LSf4k3MqZI4kerg8+SuzFSDi5HvO2PyKObmk70yXfJeEWRetKbWqZJ84HfYZ6M9hKLUjuh/bH/5
	5lvdjLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgyt-00000008QWe-2K4p;
	Fri, 02 Jan 2026 15:22:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgys-00000008QWG-2Nlx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Jan 2026 15:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mfp0vOpU/C0y9oWZefdEhz0M9QMslqJoP/j34iw2EJc=; b=aWVJdlHC5dLL0Orukc+rZLMyXb
	wOoBw7oxhxZDILMWSN0N9Cw088qKKM3wBoDdGXPjRy537XJlLV0nMa8SBYB3vtGWiZHcWDdL+lx9p
	s47NzV1YbwPcnEUXW1Me4hpp3Fr/P35kgFBf+o0iSAN7T79Z0gt0dHjTqKCwdZ2bRYCHhTmfPyby0
	SL77zSmY2CGgLRjeIfWp/4pjPZ4HfV/ovYCZ4SLNEKaglry8EK9yP9OY63aFvZeulItXe7QgnA6Mj
	Rr0Qjkh4B4rcrLSIp+mgXkVwDFvob1Baft90Or1EDxR7ASDVcPIX3PbgVqvubwxGn4sscUjFenNrz
	ULJtY4Og==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgyq-00000006eoL-49Ea;
	Fri, 02 Jan 2026 15:22:21 +0000
Date: Fri, 2 Jan 2026 15:22:20 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: fix memset64() on big-endian
Message-ID: <aVfirJvsYt0-jDRD@casper.infradead.org>
References: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
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

On Fri, Jan 02, 2026 at 08:15:46AM +0100, Thomas Weiﬂschuh wrote:
> On big-endian systems the 32-bit low and high halves need to be swapped,
> for the underlying assembly implemenation to work correctly.

Heh.  In my heart, ARM will always be a litte-endian architecture.
I'm not really surprised this bug took, er, 8 years to show up; big-endian
arm is rare enough and memset64() isn't much used on 32-bit systems.
And it turns out that many of the users pass a constant 0 as the value,
which was kind of not the point, but it seems to be an easier API to
use than memset, so whatever ;-)

> Fixes: fd1d362600e2 ("ARM: implement memset32 & memset64")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

