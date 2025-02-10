Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8708CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLBZiQvoRWMve47ekFMA9aPN96SiIqRBTIRflJ/8Sbk=; b=X4CPlf/2rX89NaN9RTM9PccKL5
	EO7SasOpD78Vx0LJiFoazIc9xgh6toaV2R6lvoeFXVBBKF+NdeejtdObg5OW1PJz4zxkCmrbdx8j0
	w6ZqJPwsrZClxqCO5flqHPsQXaRcpB6YFl7YFgaHh6KvTw6UjCHGD0Cu/27y+lNl35saEc/lsWqOM
	hzL4gkMBviWD915WbQG2Pr4PtJjkKip/5cwoemDm40Zty8fzPL03C+6vZgozXD8oPP7B6Zc06syJt
	hkvN/FcTwQ+LT2xuL3vlCi8F3FOeK8JQ0o8A4aINTBSpM6fGyEZMPZLbskVZKiJEDxwXkFzBt24zu
	BVNhg5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYp-000000017GC-16B9;
	Mon, 10 Feb 2025 19:35:15 +0000
Received: from out-184.mta1.migadu.com ([2001:41d0:203:375::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYyb-000000011TD-1cpu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:57:51 +0000
Date: Mon, 10 Feb 2025 10:57:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739213866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GLBZiQvoRWMve47ekFMA9aPN96SiIqRBTIRflJ/8Sbk=;
	b=gJJoxMAyjiATeKiLm/wKcBUg9+9nnXnXljH2/X8Xst7RlqsrqjY/v0Bkpn8cFxhnY4ayJw
	fDm+JdfSdjKMLgutx9xwcHqG7PDcjzHbe4380kJfDubp5RUMlraLLLPRCeL2ofzsp1DuFH
	LqsgsjppM/2hcYe5j83a9DVUp/dF5D8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"maz@kernel.org" <maz@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"sebott@redhat.com" <sebott@redhat.com>,
	yuzenghui <yuzenghui@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>,
	jiangkunkun <jiangkunkun@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH v6 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Message-ID: <Z6pMJIbcuPR4AXtE@linux.dev>
References: <20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com>
 <20250205132222.55816-4-shameerali.kolothum.thodi@huawei.com>
 <Z6ZPDml0JKuSjLIO@linux.dev>
 <Z6ZPyKK7HLHTtxYu@linux.dev>
 <a9a696009f8e47e0bac9e2d9289ebb0d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9a696009f8e47e0bac9e2d9289ebb0d@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_105749_638499_B9E768C8 
X-CRM114-Status: GOOD (  18.15  )
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

> > > This isn't right, vendor_hyp_bmap is very much load bearing. We have a
> > > documented UAPI that allows userspace to control the hypercalls exposed
> > > to the guest.
> > >
> > > The idea being a user wants kernel rollback safety and doesn't expose
> > > hypercalls that could potentially be revoked.
> > >
> > > https://docs.kernel.org/virt/kvm/arm/fw-pseudo-registers.html#bitmap-
> > feature-firmware-registers
> > 
> > To add:
> > 
> > KVM cannot advertise the DISCOVER_IMPL* stuff unconditionally, since the
> > expectation is that userspace implements these hypercalls. These bits
> > may need to be writable from userspace but have a reset value of 0.
> > 
> 
> Ok. So IIUC, vendor_hyp_bmap actually holds the information which Vendor Hyp
> services  are available to the user space and can be get/set using GET/SET _ONE_REG
> interfaces.

Right.

> Currently this bitmap is a 64 bit one and if we have to have a one to one mapping
> between these bitmap and the hypercall function numbers, then that requires
> some changes.
> 
> Because function numbers 2-63 are now reserved for pKVM and the new ones
> introduced in this series take 64 & 65.
> 
> May be we can have KVM_REG_ARM_VENDOR_HYP_BMAP_2  which represents
> 64-127?
> 
> Or can we take the next available bits(2 & 3) for KVM_REG_ARM_VENDOR_HYP_BMAP
> and then map it to the function number appropriately (64 & 65) when
> ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID is handled?
> 
> Thoughts?

Adding a second register seems reasonable so we can preserve the mapping
of bit position / hypercall #.

-- 
Thanks,
Oliver

