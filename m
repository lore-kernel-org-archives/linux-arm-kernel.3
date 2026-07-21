Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D09C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0omSUnt08SejJLz29xOo8sp3iPA9DylD6gbXatvjdY=; b=Kr2IH7D7TzIc95KdTWx5P3OGvy
	hx6R2+1weo5NPk7vfhTf9zh2U4WSXFEfvjIwbq1KNNgV6+hmjA9NrEcT73vFe0SmghxZlWH7tYmWl
	uiIpISrBfbvqTnkCWPc4siEeSwcA4Hx0e3UyM2EpCZlRMdOUCHV5DIr2GDBdMXrSdQ9yxv4NUA7DI
	BEIE+GqQjWVf6iKuokWvudj3jPR7I0W7FJSBvlUxelbVsIBNx5ws6hb0k5aIrLxc46Q7kpz7OASkY
	cpeC31yZ6W9/EmqXu1knwrRMbxpCJKawWk+rLuhXPShQRQ1kOtzJ5lT4gH5PgBu03U+ZA24viKYSf
	sIti7Okw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA8s-00000009Tmz-0HVE;
	Tue, 21 Jul 2026 13:04:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA8p-00000009TmR-1YNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:04:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD682152B;
	Tue, 21 Jul 2026 06:04:04 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EE6D3F99C;
	Tue, 21 Jul 2026 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784639048; bh=/21lq1+712VAZl+qXtv7I+D8Ly91WMHoXi341sZZ5lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzGIbj+u1PpiUI0SWsfQLKXRg6S/rtzeyC0f6BEwJhvN2ewm6cy2KihhPt6HWWibO
	 LU/oOPB1cAR6ZQuz7mTkZnEf1lOYBOdfUs12JEQbBk5xpsN8a/qFDLVSBTWGmR3ns3
	 4i9LPfNvwPqQ2IYpPOa233EziMTAV3bF+riueX0o=
Date: Tue, 21 Jul 2026 14:04:05 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <al9uRagYJSQPJr7_@J2N7QTR9R3.cambridge.arm.com>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <akfHIH_dZrr5bosu@J2N7QTR9R3>
 <f2d4b312-4a11-425e-8329-33838ed37d15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2d4b312-4a11-425e-8329-33838ed37d15@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_060411_453377_AC322676 
X-CRM114-Status: GOOD (  18.83  )
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

On Tue, Jul 21, 2026 at 12:29:54PM +0530, Sneh Mankad wrote:
> On 03-Jul-26 7:58 PM, Mark Rutland wrote:
> > On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> 
> FW permits CPU0 disablement because it functions properly in regular run time.
> But there is an additional hardware constraint in above mentioned platforms, that
> suspend to ram has to be performed via boot CPU / CPU0. Due to this constraint,
> CPU0 is required to be online when suspend to ram is triggered.

The PSCI spec doesn't permit that.

Even if HW has that constraint, it's up to FW to hide that from the OS.

[...]

> > This is a platform-specific property, and it's possible to build a
> > kernel that boots on this platform and/or other platforms.
> 
> Yes, but for that reason the config will only be enabled for SoCs that have this
> constraint, it will remain disabled for other SoCs.

Please re-read what I said. A config option can't help if you have a
single kernel that supports multiple platforms.

> As mentioned above, its not a FW bug. CPU0 is allowed to be disabled
> from FW and HW constraint is for suspend to ram to be performed on
> boot CPU.

Please see my other reply at:

  https://lore.kernel.org/linux-arm-kernel/al9tdvOxYb83zBxd@J2N7QTR9R3.cambridge.arm.com/T/#m872da3cc4ded3386dce92d4bd4bdf9c33d3e2d0b

This is *definitely* a firmware bug.

To be clear, I'm not saying we can't do something to address that, but
let's not pretend that this is compliant with the PSCI spec.

Mark.

