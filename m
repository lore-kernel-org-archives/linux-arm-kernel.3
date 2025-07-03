Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD386C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N55H91JG7/o0OYijH19DmF+weuiDcP05lYo8pm41Sus=; b=z9mgBPaPeVCqCjQt8B5q25bBgp
	otPaP80ZyfJp8LKAmc5EJhGCmvbybXabTMBQ1iArZ6DwQ6uxFn0rHHYEzH8dzLq2a09N712QEDYal
	YZPOQXbxKC8pJqua1KtfV/Y6BwXRziJRdZw9zt2/vkK+9Xr6UYT3DLK/RFoI1XPWNngLcIFpJJm1d
	nNK8pThZxECRvMWbBFEq3U5L/9MlI/dAHFN3x/XrF1Yl+rItVahAlS0K2oM+FdAhbNRN1FML4hGMa
	oettU6q6osiyNj+WanXDfhcrNYKSQH0Il6F8cZTSmqoEJVBJNqKSvxhS9zsOvNw9Ctkvn9UwJTSC6
	LSKADiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIOM-0000000BCjX-3Z3f;
	Thu, 03 Jul 2025 11:46:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHBb-0000000Azif-2gU4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:29:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 129CD1596;
	Thu,  3 Jul 2025 03:28:44 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981903F58B;
	Thu,  3 Jul 2025 03:28:56 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:28:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, catalin.marinas@arm.com,
	linux-serial@vger.kernel.org, rmikey@meta.com,
	linux-arm-kernel@lists.infradead.org, usamaarif642@gmail.com,
	leo.yan@arm.com, linux-kernel@vger.kernel.org, paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <aGZbYmV26kUKJwu_@J2N7QTR9R3>
References: <aGVn/SnOvwWewkOW@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGVn/SnOvwWewkOW@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032859_721290_B8A84BBD 
X-CRM114-Status: GOOD (  21.77  )
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
> Hello,
> 
> I'm observing two unusual behaviors during the boot process on my SBSA
> ARM machine, with upstream kernel (6.16-rc4):

Can you say which SoC in particular that is? Knowing that would help to
identify whether there's some known erratum, clocking issue, etc.

Likewise that might imply more folk to add to Cc.

[...]

> At timestamp 9.69 seconds, the serial console is still flushing messages from
> 0.92 seconds, indicating that the initial 9-second gap is spent looping in
> cpu_relax()—about 20,000 times per message, which is clearly suboptimal.
> 
> Further debugging revealed the following sequence with the pl011 registers:
> 
> 	1) uart_console_write()
> 	2) REG_FR has BUSY | RXFE | TXFF for a while (~1k cpu_relax())
> 	3) RXFE and TXFF are cleaned, and BUSY stay on for another 17k-19k cpu_relax()
> 
> Michael has reported a hardware issue where the BUSY bit could get
> stuck (see commit d8a4995bcea1: "tty: pl011: Work around QDF2400 E44 stuck BUSY
> bit"), which is very similar. TXFE goes down, but BUSY is(?) still stuck for long.

Looking at the commit message, that was an issue with the a "custom
(non-PrimeCell) implementation of the SBSA UART" present on QDF400. I
assume that was soemthing that Qualcomm Datacenter Technologies designed
themselves.

It's possible that your SoC has a similar issue with whatever IP block
is being used as the UART, but the issue in that commit certainly
doesn't apply to most PL011 / SBSA-UART implementations.

> If I am having the same hardware issue, I suppose I need to change that logic
> to exist the cpu_relax() loop by checking when Transmit FIFO Empty (TXFE) is 0
> instead of BUSY.

If you have the same issue, then applying the same workaround makes
sense. As above, it's not clear that this is necessarily the same issue.
Any more detail that you can share regarding the SoC would be very
helpful.

Mark.

