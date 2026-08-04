Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C67C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBH/Dc/ZJz+4sJLW+ut9cuYtgG9NRpWhNfYqB994G2g=; b=wSIvVVNe9xLmbWwAalPw7t2gre
	nW+vLdKFgYgyxC29+r3Dg/4c+N0DIffYawJcwr5V8lb6zfi8p49XMAJSIWlUwBeBAPzHi+IPlPiCq
	UB6if7ai29V4oiWL5q6+osHZJkM6y9nBMsEXQHQON9Jq61SL1lZIJSmuyQLMvRe52XV6V5VtC7Xcd
	bwUtCZo866r1tO8uRwiGpnAJdpivaQ0ft54C039zBti5Ya2YBrfUctJQv5LTj8JpZLkyONj/cQzGt
	0YvAj2zroIVhwevw1JfBTki47HlQmTHzEFR8mQvnCDkV1qphetaScMKYF8hXLIGaMCwdyHQh/XmZH
	POW125Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQl-00000001xT4-32jK;
	Tue, 04 Aug 2026 13:43:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQk-00000001xSa-0GJW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:43:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C1C760A78;
	Tue,  4 Aug 2026 13:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD5B1F000E9;
	Tue,  4 Aug 2026 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851021;
	bh=IBH/Dc/ZJz+4sJLW+ut9cuYtgG9NRpWhNfYqB994G2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHtmCddswf2PGZfFcl62pyqqu04/E7F86tIAV9KM56Q5mQvysgWALmoW8qvGMEPtR
	 HBMDSSXBJflPvUTOlLnjZsqOjrTFtum7s4cbYYKas1fQt27U2HnbRya71c0Wo6USc3
	 Iv4IVqCrmNgfTlzkcOAnqGtaLsglgfasO9QF8P8MeugPQ4SYyGRlLckNrPHrBHswFE
	 8GdjBCg3n3Bt/9axjacpHDRnn1VJ6UBN4RlVOPAy6ckT1FsVG/ZewYkSURKS1V8gjS
	 6yjV+Fvo5mDBJZE/7cKa86Z5QntI9ieyTI2glVuRYHV7dePDLx/UtbUPoVx3UneCvh
	 8W9330z+eNB1Q==
Date: Tue, 4 Aug 2026 14:43:35 +0100
From: Will Deacon <will@kernel.org>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Thomas Huth <thuth@redhat.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Pengjie Zhang <zhangpengjie2@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
Message-ID: <anHsh0SpRfSMIza7@willie-the-truck>
References: <20260722113044.1835365-1-namjain@linux.microsoft.com>
 <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
 <70e8596f-7316-4cc9-90e8-ff06a94c4616@arm.com>
 <d52431ea-3166-459c-8f3d-988fdef63c32@linux.microsoft.com>
 <amYPss8PK9dgg2TD@willie-the-truck>
 <45ab9640-14b7-48d7-89e2-109aa3935539@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45ab9640-14b7-48d7-89e2-109aa3935539@linux.microsoft.com>
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

On Mon, Jul 27, 2026 at 11:08:05AM +0530, Naman Jain wrote:
> On 7/26/2026 7:16 PM, Will Deacon wrote:
> > On Fri, Jul 24, 2026 at 10:16:03AM +0530, Naman Jain wrote:
> > > On 7/23/2026 11:26 AM, Anshuman Khandual wrote:
> > > > On 23/07/26 8:19 AM, Jinjie Ruan wrote:
> > > > > 在 2026/7/22 19:30, Naman Jain 写道:
> > > > > > When a secondary CPU fails to come online, __cpu_up() falls back to
> > > > > > __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
> > > > > > distinguish a CPU that never executed head.S (firmware/hypervisor never
> > > > > > dispatched it, so it never ran a single instruction) from one that
> > > > > > entered head.S, started executing, and then got stuck somewhere in kernel
> > > > > > bring-up. Add a change to let us tell those two cases apart, which
> > > > > > narrows down where to look when a CPU goes missing during boot.
> > > > > I previously encountered this issue when debugging the parallel startup
> > > > > of ARM64 secondary cores. It is difficult for the kernel to determine
> > > > > whether the secondary core is hung in the firmware or whether it has not
> > > > > executed a single instruction. So I think this motive is reasonable.
> > > > 
> > > > Why should kernel determine the difference here ? Would not the firmware
> > > > know if it has started any secondary CPU for the kernel which must have
> > > > come inside head.S ? If the cpu gets hung inside firmware while starting
> > > > up then the debug responsibilities belong there instead.
> > > > 
> > > > Still wondering what's the rationale for this change.
> > > 
> > > Hello Anshuman,
> > > This sounds fair to me. Let me elaborate the problem, beyond the scope of
> > > this patch. In production, we occasionally see these crashes where one of
> > > the CPU fails to bring up online, with 0x0 status code. Hypervisor may be
> > > missing the telemetry, but the problem is that we don't know if the
> > > secondary CPU ever started executing the instructions or is stuck somewhere
> > > between the start of head.S and marking itself online at the end of
> > > secondary_start_kernel().
> > > There are couple of places, where we get those other status codes, but not
> > > everywhere. If the issue is not easily reproducible, experiments on local
> > > setups do not yield anything. That's where I am attempting to add some more
> > > information in kernel to debug these issues.
> > 
> > I think this is a game of diminishing returns. There's a lot of stuff
> > that the firmware/hypervisor can get wrong here and trying to detect or
> > handle that in Linux is going to be a real mess. For example, if it
> > enters the kernel at the wrong address, or in the wrong mode, or with
> > the MMU enabled etc. It sounds like you don't have much idea about
> > what happens in the failure case, so it might not even execute the code
> > that you're adding correctly.
> 
> That is true. I agree. While we cannot and should not worry about adding
> logs for each of these firmware failure points in kernel, do you see any
> merit in adding any of this information to the kernel to at least narrow
> down the problem?

Possibly, but I'd prefer to land the parallel bringup work first and then
see whether this still makes sense.

Will

