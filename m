Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB01C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1HNNILPSDl3Q34aXfxs4ZPYaPnX+sUSt9EkyNlpzwo=; b=JKp7kGMOu2IDzv5Olpchvt3b0E
	n7Dh8XTTWnhPAs4DwOWvxXKJBsH9lcwFAjbESt7Dgp1/9xQ62kAmxVv5kRv70zaiBBJr4nRB6LyXc
	s8C1KYSEzyVQvxtU8/rsTycALzf8cPcIBV/Pz8wbGAZafnTGZthDk1x6Ywrrz41aHoU16D+UMN8vd
	zfQyX3A74m+6yGQ6muWJqoU2SreJt5vsimSZqEKiyYlYm520+jDKRPpPGiov/QlsX7fVpqtMrJ92+
	/g5sVFgRdFbP5bC9ufjWd2ke7kfGg9O4y+2JX9BPFWm7bOmJLLrZgXFDJz2Am71N9wmgjxD6N0qtN
	dTtgFqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJTg-0000000BPAM-00jM;
	Thu, 03 Jul 2025 12:55:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIO9-0000000BCg6-2nFo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:46:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD9DF1596;
	Thu,  3 Jul 2025 04:45:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5B1E3F6A8;
	Thu,  3 Jul 2025 04:45:59 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:45:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, mark.rutland@arm.com,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <20250703114557.GD1039028@e132581.arm.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <20250702172036.GC1039028@e132581.arm.com>
 <aGZVP8A2a3VVQwzt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGZVP8A2a3VVQwzt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_044601_748629_8AB530F0 
X-CRM114-Status: GOOD (  14.26  )
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

On Thu, Jul 03, 2025 at 03:02:39AM -0700, Breno Leitao wrote:

[...]

> > In some cases, if normal world and secure world share the same UART
> > port, it can cause the UART state machine malfunction and long wait.
> 
> I don't know how to check it for sure, but, looking at the serial
> console output, I don't see anything else using the UART. The only
> output I see on the console at that time is coming from linux kernel.
> 
> Would you recommend any additional check?

I have no experience in the driver, I should avoid any noise. But two
things in my head for quick trying.

- First, you could try earlycon mode, e.g., add option in kernel
  command line:
  
    earlycon=pl011,mmio32,0xc280000
    earlycon=pl011,0xc280000

  This would be possible to give more printing logs. If earlycon works
  well, then the issue might be caused by later init code (clock, or
  UART driver itself).

- Try another UART port if this is possible.

Just curious, you mentioned you are working on the mainline kernel. If
you can confirm a workable kernel version, then this info can help to
rule out hardware issue and we can review the delta changes.

Thanks,
Leo

