Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F35C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSehX+uQl0WgX7e5PvxgT1SkG1L5I2WdoedWKXEeIXE=; b=Qa78wIJVabuY4dVXXYZAiMXFmy
	vF3/YExe0rhgy0G7udGYACkqDxJP/7+VoKDEXYikii0az5raJzM0mzPPnglKYCzHw8+KKCrO9cNsC
	CDXjSTPeG0aKmw7tME3pq8TWq19yBinTNDMOY3GBA8QwL5MxiVzEJbLcXZdvlPlOcWe6epViTAJJ3
	LvveCWFn/vAQLPeJ1SgRzc3aZMP3iGxpozqhFUkJ59uF4BL9eu4L8lrOpaNgSiGZ85gLAJVa5Qq49
	QWPuUcRO97DRhRNPH6Mt1AqTqJAtT8kt3HputxqU2NG03HwkYQ/I+pqnruTlJF/NPQFsURNlkgV0r
	dUSsoXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZO-00000009AVN-1vfz;
	Wed, 02 Jul 2025 17:48:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX18S-000000097C5-2mDJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:20:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AC5A22C7;
	Wed,  2 Jul 2025 10:20:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4FEE3F66E;
	Wed,  2 Jul 2025 10:20:38 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:20:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, mark.rutland@arm.com,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <20250702172036.GC1039028@e132581.arm.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGVn/SnOvwWewkOW@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_102040_740071_57D82ED8 
X-CRM114-Status: GOOD (  15.70  )
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

Hi Breno,

On Wed, Jul 02, 2025 at 10:10:21AM -0700, Breno Leitao wrote:

[...]

> Further debugging revealed the following sequence with the pl011 registers:
> 
> 	1) uart_console_write()
> 	2) REG_FR has BUSY | RXFE | TXFF for a while (~1k cpu_relax())
> 	3) RXFE and TXFF are cleaned, and BUSY stay on for another 17k-19k cpu_relax()
> 
> Michael has reported a hardware issue where the BUSY bit could get
> stuck (see commit d8a4995bcea1: "tty: pl011: Work around QDF2400 E44 stuck BUSY
> bit"), which is very similar. TXFE goes down, but BUSY is(?) still stuck for long.
> 
> If I am having the same hardware issue, I suppose I need to change that logic
> to exist the cpu_relax() loop by checking when Transmit FIFO Empty (TXFE) is 0
> instead of BUSY.
> 
> Anyway, any one familar with this weird behaviour?

To be clear, I am not familiar with pl011 driver.

For the first step, could you confirm the UART port is only used by
Linux kernel?

In some cases, if normal world and secure world share the same UART
port, it can cause the UART state machine malfunction and long wait.

Thanks,
Leo

