Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B094E9B356
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNEwAoW8yEfG1F1tnsyvIKHGrgnEvcjUntIagfqxPmg=; b=mdHFXwRqR69CPxd/l3z/keobsW
	KDEnYqn0In7+eBR1RNGMWuIyr5ScGOd5jZmQRRBcZNvshX6MUSsaQ8QFL9vXh20C//r3FoyYPEmL/
	KxeQzC3Vk5zxBMdq/Sf7CruZzMGwk471r/7iC6D7w3so8adrZwrx1y/g0iFYaub8ioJqxApK+J3TX
	R6+OCc9m0BHj4jVDuUKdX/SRYt8JNh5QbQzFnXCkdIQau1MOO/gsIfeVm883QBBxuUFGUPeIeCWbh
	ZINkmft6VtXfzJIPh1Ij2fXBC29b9B280r1izMEkuuDWxFLZKaTaSH9f2VtlWbAn4+OHkYnCkI2wO
	ZSRQHnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Qo-0000000CgpX-2xwN;
	Mon, 02 Mar 2026 10:23:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Qm-0000000Cgp7-0X2d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:23:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC36B14BF;
	Mon,  2 Mar 2026 02:23:06 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E85D3F7BD;
	Mon,  2 Mar 2026 02:23:11 -0800 (PST)
Date: Mon, 2 Mar 2026 10:23:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL
 single-step
Message-ID: <aaVk1YrbraMAwcEl@J2N7QTR9R3>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302101905.3591689-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302101905.3591689-1-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022316_219778_EF304B60 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: linux-arm-msm@vger.kernel.org, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 02, 2026 at 03:49:05PM +0530, Khaja Hussain Shaik Khaji wrote:
> On Tue, Feb 17, 2026 at 04:55:44PM +0000, Mark Rutland wrote:
> > Since DAIF is masked, we won't take an IRQ to preempt during XOL.
> > Can you please share an example failure that you have seen?
> > I believe other architectures are likely affected by the same problem.
> 
> Thank you for the review. You were correct on all counts.
> 
> I confirmed the issue is not related to scheduling or preemption, and the
> v1/v2 approach was based on an incorrect assumption. I’m dropping that
> line of reasoning.
> 
> I’ve since identified the actual root cause and have a new fix ready,
> which I’ll send shortly as v3.

Ok.

As above, *please* include an observed failure in the commit message. It
will be the first thing we ask for otherwise.

Mark.

