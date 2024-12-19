Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E75CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap48egQQYjTFlsWXbHaljCMT9L0YYN5hLo9udbi2yJE=; b=u4lwSLwLhqJJ9nbkHcea3XeIGC
	VJhLqY7YGE7e7tF1cXtKvvvNCS3KUiZ2q3R9769D95cNejd622SzWHCda0i4mrvoAKMi6y6/sPbTP
	/aYR4Lq0NPk9ADOIQmERWsXcE3nx3a6NGN9vB2HfIo4FQTUDtLOLALVQaFthKV2sZyrHOocdCR25h
	NNioy7vCR6fen+LZ8HHYCmLJHQOn8d3LBNQbIZ44ep7F55wZECYCUHx5Gh/cd4i7o3BoWuIpi3ZEk
	gNC/5wvZDpsgh+7AXv47rTE2J59d7/mlz42NVfLSwivRctN+/Iy4vLlurTKN7T3+MsthaTaZeRhVO
	6mvd1mJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKgZ-00000002dDs-0hii;
	Thu, 19 Dec 2024 17:51:43 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKRr-00000002aHm-2yVq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:36:33 +0000
Date: Thu, 19 Dec 2024 09:36:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734629788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap48egQQYjTFlsWXbHaljCMT9L0YYN5hLo9udbi2yJE=;
	b=Csc+vQ+WRhHRGl7OlGJx22m1D4aOa0/LrTi+9UzU81TvkO0x8LP2EFgVOoV+/aJvDIr5Bx
	lzikpMxhvRNERHpxOgGQDhye/T8UhGy7Crt3bQagdyQGlb53vpJGxPaoWSWNjjWqwilWVC
	DlVPRbzgEoEaUrY0b/iu0jNpvJ/pDDQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, cohuck@redhat.com, eric.auger@redhat.com,
	sebott@redhat.com, yuzenghui@huawei.com, wangzhou1@hisilicon.com,
	jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
	anthony.jebson@huawei.com, linux-arm-kernel@lists.infradead.org,
	linuxarm@huawei.com
Subject: Re: [PATCH v4 0/3] KVM: arm64: Errata management for VM Live
 migration
Message-ID: <Z2RZkP-v2nbmmzLV@linux.dev>
References: <20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com>
 <86a5csq93o.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a5csq93o.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093632_012887_FFFAD74B 
X-CRM114-Status: GOOD (  21.08  )
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

On Thu, Dec 19, 2024 at 10:07:39AM +0000, Marc Zyngier wrote:
> Hi Shameer,
> 
> On Wed, 18 Dec 2024 10:53:42 +0000,
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > 
> > Hi,
> > 
> > v3 --> v4(Minor updates)
> > https://lore.kernel.org/kvmarm/20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com/
> > 
> >  -Changed MIDR/REVIDR to 64 bits based on feedback from Connie
> >   and Marc(Patch #3).
> >  -Added R-by tags from Sebastian (Thanks!).
> 
> Thanks again for putting this together.
> 
> I think it would be really good to have a sample userspace
> implementation of this extension so that we can play with it for real
> before fully committing to it.
> 
> I am also wondering is we should make it mandatory that a guest is
> presented with an MIDR_EL1.Implementer value set to 0, which denotes
> SW use, and would make it plain to the guest (and crucially, guest
> userspace) that we are going to play tricks.
> 
> Thoughts?

I see no issues with giving userspace the option of doing this, but I'd
rather not enforce this to use the PV interface.

At least in a cloud setting it seems highly likely that you'd be running
a mix of guests on the same VM definition, some aware of the PV
interface and others not. If we use a software MIDR, all old VMs will
lose errata mitigations and whatever else userspace might key off of MIDR.

Userspace can make the call whether or not a VM can be migrated onto a
different implementation based on whether or not the guest used the
hypercall interface. And maybe just terminate the VM if it didn't.

-- 
Thanks,
Oliver

