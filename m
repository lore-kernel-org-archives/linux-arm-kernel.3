Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55806C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ui2IHk55jxlS8MBO9zH01efZshT030fUXAfXlN+I9k=; b=cjTzCUouj8ejdM09RTxWbNyW9c
	NfGforNrJ9cRthGI8e1T3haGazCHWySENn3jZGkELkLdxp9jQBIQQpaA8EltK6uw6RA/Hsdyc02HL
	RgY2a4VE1P0BYFFaz+N22ulWKH6IXB9v9ZdYN5f04Yn8U+0QDy04RQ/6t64a444siPc3B9zHT6w0m
	zhXDBagRpTo9a1UT16QauqM9PnNtmnDcefrlHQYQp/WqACgKTmiUSYSVolceHcvHEtoriQondf5D1
	6KLZTUN7fTvKs2lJQfqhqzvk1AsWjHh+jk25qNgH8Vt7sh+QPcmqKawm9L11mPmK8Dwkx2kq7iLBp
	1anCc7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkws-00000000By3-1K02;
	Fri, 17 Jan 2025 11:55:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkv0-00000000Bjj-2V8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 11:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A6505C611C;
	Fri, 17 Jan 2025 11:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED40C4CEDD;
	Fri, 17 Jan 2025 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737114821;
	bh=0zZXpSz47v+UqA3suZe4AcahION/UIHqd8eJ9H8osKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajsdKEAwPRPkkWB1mEUBErOvZzj8UpNeTQ+16bPRWvSweJ6fiGiuslTg8e/fIKo6J
	 BRzdHbhq7y+nzRWtaxyC0EjFGPyJoo/knBT68AcddDt7jRBx4oJDRZETYYHInR8crA
	 Obgf+wAizimJ0uAr+RhYDximXOVpU/9Td8QuSZGM=
Date: Fri, 17 Jan 2025 12:53:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Cc: Russell King <linux@armlinux.org.uk>, Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] serial: amba-pl011: Implement nbcon console
Message-ID: <2025011743-rummage-civic-5c14@gregkh>
References: <20250115052749.3205675-1-fj6611ie@aa.jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115052749.3205675-1-fj6611ie@aa.jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_035342_680673_3BD1D1F2 
X-CRM114-Status: GOOD (  19.04  )
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

On Wed, Jan 15, 2025 at 05:27:48AM +0000, Toshiyuki Sato wrote:
> Implement the callbacks required for an NBCON console [0] on the 
> amba-pl011 console driver.
> 
> Referred to the NBCON implementation work for 8250 [1] and imx [2].
> 
> The normal-priority write_thread checks for console ownership
> each time a character is printed.
> write_atomic holds the console ownership until the entire string
> is printed.
> 
> UART register operations are protected from other contexts by 
> uart_port_lock, except for a final flush(nbcon_atomic_flush_unsafe) 
> on panic.
> 
> The patch has been verified to correctly handle the output and
> competition of messages with different priorities and flushing
> panic message to console after nmi panic using ARM64 QEMU and
> a physical machine(A64FX).
> 
> [0] https://lore.kernel.org/all/ZuRRTbapH0DCj334@pathway.suse.cz/
> [1] https://lore.kernel.org/all/20240913140538.221708-1-john.ogness@linutronix.de/T/
> [2] https://lore.kernel.org/linux-arm-kernel/20240913-serial-imx-nbcon-v3-1-4c627302335b@geanix.com/T/
> 
> Signed-off-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
> ---
> This patch removes the legacy console code.
> Please comment if you have any concerns.
> 
> I plan to try a stress test, referencing the work for 8250.
> https://lore.kernel.org/lkml/ZsdoD6PomBRsB-ow@debarbos-thinkpadt14sgen2i.remote.csb/#t
> 
> Changes in v2:
> - Remove the module parameter used to switch between legacy and nbcon.
> - Remove codes for legacy console.
> - Fix build errors detected by the test robot.
> - based on 6.13-rc7

This fails to apply to my tty-next branch, which has 38 commits on top
of that release and at least one of them caused conflicts here.  Please
always work on the development tree you want to submit a patch to, OR
against linux-next, to help prevent merge issues like this.

thanks,

greg k-h

