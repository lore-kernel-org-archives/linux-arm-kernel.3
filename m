Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D9BC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9E+0cH3cKcXicltNKxOldSsPBO6M1KLocx/REOkmNmE=; b=adb83eBQQJqLuOXKfn7gkaQj0J
	EQiH3eN76zztXrEt7Kjlo6wempJyjWevnV9a09r57Bu31w20U6vINszhqz3M3rtl0rLMi8JZJE13p
	INQibK5rQwQKPdIWCQsMUVGnlXnzOyhzlHwzHyTSnZJlQo5AmrDMM7U9ssOAXenQqnojh4YjUHzPs
	bZDP7zWjupCg9ezf9Sr8LSnSTgsTyDymQEhNF+bGrY7ubMFsMXCM3IyavWaFhMe8DhYUBdgxynDUn
	7/0Ks17nBPNjECR+cLBTmCmUKlx4xqBFevXw60E5a0xq9glxjHlS8mEY5ojhYcfUkVLZeMyDGaq4p
	+O4s45wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMH7-0000000D4XV-0L7c;
	Fri, 21 Aug 2026 10:15:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMH2-0000000D4VA-0lRQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:14:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4920A153B;
	Fri, 21 Aug 2026 03:14:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14E803F66F;
	Fri, 21 Aug 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787307294; bh=x2PW7k3TwIFcVb0HgB/a2qRx2lQJd10nFtvVhrzqC8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuYRMiGderCL7nMqslzfHOA6euy0UBOD1xqRTMH9+k081cdWWc08S4DdYXjkt+Sal
	 boFmmz6ePE8ZDTU+icV/5pr531uWUWcQXyMj2Wc5+zy1PRn5+91yD8wOHdNoP4RuA4
	 x8vzVwd5pN4HQ78h03aRbZpZZ0ZLjboqoXvsE7kc=
Date: Fri, 21 Aug 2026 11:14:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: Will Deacon <will@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>,
	Shradha Gupta <shradhagupta@microsoft.com>
Subject: Re: [RFC PATCH 0/2] arm64/hyperv: Enable kexec reboot support
Message-ID: <aoglGZD7ntLJkmcO@arm.com>
References: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_031456_477117_87EF69C2 
X-CRM114-Status: GOOD (  10.53  )
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

On Fri, Aug 14, 2026 at 02:31:28AM -0700, Shradha Gupta wrote:
> Kexec reboot consistently fails on ARM64 Hyper-V guests (Azure VMs).
> During the kexec shutdown path, VMBus channels are never cleaned up,
> so in the fresh kexec kernel startup hv_acpi_init() blocks because
> the hypervisor still holds the old kernel's VMBus session open.
> 
> This is because ARM64 lacks the VMBus teardown that x86 performs during
> kexec via hv_machine_shutdown(). On x86, machine_ops.shutdown is
> overridden to send CHANNELMSG_UNLOAD and disable SynIC before CPUs
> go offline. ARM64 has no equivalent mechanism.

I'm really not keen on such hook, a bare pointer you set elsewhere. Not
sure it was discussed before but can you not use the syscore_shutdown()
mechanism? This hook got added in 2023, so the 2022 discussion you
referenced precedes it.

-- 
Catalin

