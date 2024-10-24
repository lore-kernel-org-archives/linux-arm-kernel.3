Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E3D0E415
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtFndtJcIL3zsSxbBk4RRQ6rdE2RirToZ3JUO30TCHs=; b=trRd9ewqpf332sYty0Dkv1FY9z
	qfhgc5jIoJ5qqrqrLh+WQGCvLEKc58ZVIqh1zs5LoUH+o80lcdHxKbOCJTEvszPncmPKQ2vdwbtwV
	IVJitdsx5obB7S/gMD2x27fTsJrBAGKppDtMtYs91xuExj1sovQ/WzaniQ5CPPfuE6fPUadOhz/v9
	9dDQ+qc5HKu/VQJst1OZ0u4qOyKJAP9gijG3ISCfUDW/HZF0K6KYFu7Tlycb8U9y/8PIuZGRxk94k
	JpOjsr+nGQA1y8m4ApjIwH3h24nqwTHh/w529d+KjNN2WRXugvPKUT81DwYRuhAbPAae6gbTtvVKB
	OuqLzuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44OI-00000001ivs-14mD;
	Thu, 24 Oct 2024 20:25:06 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44EZ-00000001hlz-0Mtq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:15:05 +0000
Date: Thu, 24 Oct 2024 13:14:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729800899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtFndtJcIL3zsSxbBk4RRQ6rdE2RirToZ3JUO30TCHs=;
	b=YfMBqlEuY3d4sssErtWX/tyOE6MwT9DGBdAkTCuk3A3qClaZ1jgVMh94ystYpCwzOS3XQ0
	kA6nAgW6nZsGBkOEUHBGkUp3x8C8S2QFSMgI7b/odoVduDw6c6fJO90OQ6BOTifEgTsS7k
	fKQmtIPOjE09rsN97IuRq5Y3IxznMxw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Zhiqiang Ni <nizhiqiang1@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	wanghaibin.wang@huawei.com, tangnianyao@huawei.com,
	wangzhou1@hisilicon.com, yuzenghui@huawei.com,
	wangyanan55@huawei.com, jiangkunkun@huawei.com,
	jiaqingtong@huawei.com
Subject: Re: [bug report] KVM: arm64: vgic-its: Performance degradation on
 GICv3 LPI injection
Message-ID: <ZxqqvcaGFkK4_QHW@linux.dev>
References: <bb4aeb68-c77b-4071-bca5-d129a1c5f6f3@huawei.com>
 <86y12e2amf.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y12e2amf.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131503_575769_DA823BBB 
X-CRM114-Status: GOOD (  21.58  )
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

On Thu, Oct 24, 2024 at 09:00:56AM +0100, Marc Zyngier wrote:
> On Thu, 24 Oct 2024 06:06:58 +0100,
> Zhiqiang Ni <nizhiqiang1@huawei.com> wrote:
> > 
> > Hi all,
> > 
> > I found a performance degradation on GICv3 LPI injection after this
> > commit ad362fe07fecf0aba839ff2cc59a3617bd42c33f(KVM: arm64: vgic-its:
> > Avoid potential UAF in LPI translation cache).
> >
> > In my testcase, the vm's configuration is 60 VCPU 120G RAM with a
> > 32-queue NIC and the kernel version is 5.10. The number of new TCP
> > connections per second changed from 150,000 to 50,000 after this
> > patch, with the %sys of cpu changed from 15% to 85%.
> 
> What is the VM running? How is the traffic generated? Without a
> reproducer, I struggle to see how we are going to analyse this issue.
> 
> We can't go back to the previous situation anyway, as it has been
> shown that what we had before was simply unsafe (the commit message
> explains why).
> 
> > From the ftrace, I found that the duration of vgic_put_irq() is
> > 13.320 us, which may be the reason for the performance degradation.
> >
> > The call stack looks like below:
> >     kvm_arch_set_irq_inatomic()
> >       vgic_has_its();
> >       vgic_its_inject_cached_translation()
> >         vgic_its_check_cache()
> >         vgic_queue_irq_unlock()
> >         vgic_put_irq()
> 
> Are you suggesting that it is the combination of vgic_get_irq_kref() +
> vgic_irq_put() that leads to excessive latency? Both are essentially
> atomic operations, which should be pretty cheap on a modern CPU
> (anything with FEAT_LSE).

Looks like the bug report is for a 5.10 kernel, and at that point in
ancient history KVM takes the lpi_list_lock for every vgic_irq_get() / vgic_irq_put()

The series below that we took upstream has the necessary improvements to
alleviate lock contention, Zhiqiang you may want to consider backporting
this into your kernel.

https://lore.kernel.org/all/20240221054253.3848076-1-oliver.upton@linux.dev/

-- 
Thanks,
Oliver

