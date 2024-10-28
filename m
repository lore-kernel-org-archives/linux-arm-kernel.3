Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7C7D1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31P51UN75/HgYqqcMXuPjVsOsXQpA+NG8jii4u8JTAo=; b=VBWk1bmi0/9tpvX0UZTrIx6wwL
	6LpdqzuFduYWTgLpmcVdc1i0Bc2Dd3S+Z/JN/2Z3K1xLO4uW1OCjNjhmhH0NxCPvefoxvSwxjj/cE
	CKkKvokb+hHFhFXfLiI9zUiVXOvVKoaokhaXMq9huCG3StTFIk/DBU6SkoREX/ewF2niTrt6N5OOW
	tD9Eq59BJpf6tP/0sqXK360/Ek3SL14HTlxWrxcVOGxlfSDCOGWoveLgGlL+xYlBe0Ynh5VSf+k+6
	XJTa+sqtDj9SdN0jacSkPR2v0zAETCGJA3zHE1ZCipkCQzzI0PvlOhOCvgJ8l6MINb6N/vqtXPJT/
	EA5hFjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PIs-0000000AqkK-1rfs;
	Mon, 28 Oct 2024 12:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P9x-0000000ApEz-23Je
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:47:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B88B497;
	Mon, 28 Oct 2024 05:48:18 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52DE3F73B;
	Mon, 28 Oct 2024 05:47:46 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:47:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
Message-ID: <Zx-H8IU2wZmyowGe@J2N7QTR9R3>
References: <20241001043602.1116991-1-anshuman.khandual@arm.com>
 <20241001043602.1116991-4-anshuman.khandual@arm.com>
 <ZxfGAHAn6I41ZLZV@J2N7QTR9R3>
 <2310454a-99c6-4ff9-80f7-8707fbfaf5a6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2310454a-99c6-4ff9-80f7-8707fbfaf5a6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_054749_779162_CE170D6A 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, Oct 23, 2024 at 01:01:52PM +0530, Anshuman Khandual wrote:
> 
> 
> On 10/22/24 21:04, Mark Rutland wrote:
> > On Tue, Oct 01, 2024 at 10:06:02AM +0530, Anshuman Khandual wrote:

[...]

> > Wherever this lives it needs a comment explaining what it is doing and
> > why. I assume this is intended to protect the bank in sequences like:
> > 
> > 	MSR	MDSELR, <...>
> > 	ISB
> > 	MRS	<..._, BANKED_REGISTER
> 
> Correct, it is protecting the above sequence.
> 
> > 
> > ... but is theat suffucient for mutual exclusion against
> > exception handlers, or does that come from somewhere else?
> 
> Looking at all existing use cases for breakpoint/watchpoints, it should
> be sufficient to protect against mutual exclusion. But thinking, do you
> have a particular exception handler scenario in mind where this might
> still be problematic ? Will keep looking into it.

Where does the mutual exclusion come from for the existing sequences?
We should be able to descrive should be able to describe that in the
commit message or in a comment somewhere (or better, with some
assertions that get tested).

For example, what prevents watchpoint_handler() from firing in the
middle of arch_install_hw_breakpoint() or
arch_uninstall_hw_breakpoint()?

Is the existing code correct?

Mark.

