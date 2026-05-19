Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757BACD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxHSWPCTfDbe1/jl06gJUOwsNCNtzVTbw9CYpiwAOqM=; b=MU9VfhgGtEY7gH1Zh8VTR9Q8X3
	lMp6UzmVO5DDTUJJNFPQU3tJ9A3D5+kv4hH7zGHFEusXG2VYWwGVc/mGR1SB9Bm41tTp9S7ijaCUK
	MFpg4JTxodcJ2KLWTebD+F3l3+C10nEetljcV+chnNw5tD6v+3PiL5EDiTPf56Vv6ReNwFX5dFy9M
	0qn/zIPjIqaz+JIcgMg2UGmV2SSaysObGFtXGzb1ts5ERxtGAOVlgVBdEEnAYUSNiZ7Vkg6TKAA2E
	HzNEgppS9L9bl1B5i9KBgtd91oCRxQyc3z8Zu+R9bO6ydBimujwURaaClaUgUGtCV68B0QPkIJQw3
	WFenlzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHzS-00000001CIT-2A0X;
	Tue, 19 May 2026 10:47:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHzQ-00000001CHq-42Go
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4101F60207;
	Tue, 19 May 2026 10:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B63C2BCC6;
	Tue, 19 May 2026 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187675;
	bh=rx4jBUAUTfTU9d74AbgJoYnnI+srO8ESplRvYD79xm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVu+MfB3e0csBDPiWDhDgefpoPwoAB5IrFyQkXVy428iNGC6h9FPnOwKuuiCWjN9y
	 rweEXSAeGRtOWsTk7RoPTKxqkV3GoX4J3Jl6bLlTBA/KC4dP18AorJWSMo+bTNpWfm
	 rXwcbB4+Nsm7rjPkHvbdOkqqozVtoTSDLB+xtHrU7wFp5isnsyIQ1J6YZ2sUwPIpzg
	 J+fQ1TAI/KuAz1k27tYSMmWovClvsv1sYF9dhMy9LPInq4XzI0nHgFR3BhajcN3oHq
	 hGyHk4Ya00jOp3C1j7wTfd5V9ABIMEZpMhc1fRyaM69Pv+ngJ+GQp30NcU4foLpukn
	 rE57YdBSHnNeA==
Date: Tue, 19 May 2026 11:47:48 +0100
From: Will Deacon <will@kernel.org>
To: "zhangpengjie (A)" <zhangpengjie2@huawei.com>
Cc: catalin.marinas@arm.com, rafael@kernel.org, lenb@kernel.org,
	robert.moore@intel.com, beata.michalska@arm.com,
	zhenglifeng1@huawei.com, zhanjie9@hisilicon.com, sumitg@nvidia.com,
	cuiyunhui@bytedance.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	wanghuiqiang@huawei.com, xuwei5@huawei.com, lihuisong@huawei.com,
	yubowen8@huawei.com, wangzhi12@huawei.com, ionela.voinescu@arm.com,
	jeremy.linton@arm.com
Subject: Re: [PATCH 0/2] CPPC: reduce FFH feedback-counter sampling skew on
 arm64
Message-ID: <agw_1IYaY4zeobZE@willie-the-truck>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <aa1284c1-ea26-48ca-a7d7-022027c8228a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa1284c1-ea26-48ca-a7d7-022027c8228a@huawei.com>
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

On Thu, Apr 30, 2026 at 06:00:44PM +0800, zhangpengjie (A) wrote:
> Hi all,
> 
> Gentle ping on this thread. It has been a while since I posted it.
> 
> Could someone please take a look when you have time? If there is anything
> I should revise or any additional information needed, I'd be happy to
> update it.

It's hard to find active folks who have contributed meaningfully to the
cppc_acpi driver... I've added Ionella and Jeremy, in case they can take
a look.

Will

> On 4/10/2026 5:41 PM, Pengjie Zhang wrote:
> > The legacy CPPC feedback-counter path reads the delivered and reference
> > performance counters separately.
> > 
> > On arm64 systems using AMU-backed CPPC FFH counters, each FFH read is
> > served through a cross-CPU counter read helper. Reading the counters
> > separately therefore widens the sampling window between them and can
> > skew the delivered/reference ratio used by cpuinfo_cur_freq. Under heavy
> > load, the skew is observable as transient values that may exceed the
> > platform maximum, as discussed in [1] and [2].
> > 
> > This series adds a small generic hook for architectures that can obtain
> > both FFH feedback counters in one operation, while preserving the
> > existing per-register read path as the fallback.
> > 
> > Patch 1 adds the generic CPPC hook and uses it from cppc_get_perf_ctrs().
> > Patch 2 implements the hook on arm64 by sampling both AMU counters in a
> > single operation on the target CPU.
> > 
> > [1] https://lore.kernel.org/all/20231025093847.3740104-4-zengheng4@huawei.com/
> > [2] https://lore.kernel.org/all/20231212072617.14756-1-lihuisong@huawei.com/
> > 
> > Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> > 
> > Pengjie Zhang (2):
> >    ACPI: CPPC: add paired FFH feedback-counter read hook
> >    arm64: topology: read CPPC FFH feedback counters in one operation
> > 
> >   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
> >   drivers/acpi/cppc_acpi.c     | 58 +++++++++++++++++++++++++---
> >   include/acpi/cppc_acpi.h     |  7 ++++
> >   3 files changed, 127 insertions(+), 13 deletions(-)
> > 

