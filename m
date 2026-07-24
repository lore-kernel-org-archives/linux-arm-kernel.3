Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A488C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APQBT/opS5KtbRSzVCj4nfbclI4p7/AKyOb7OqqvEzM=; b=0Q8PsTXqPsYIGz5QlENdgbFIwf
	8JSnZH/fpOkIyxbPipaag9u3NdgTM/vFz8asd0/qJ7Wc0t3OcHwe1W7/21dtNe+Zn4+JmgUi99ZWH
	Y4i4h7AvUwQXXdt8uqGKjCoBCVh2MBnQUFezluEbAlqpEkxfnUTLCQgf+zGsmv0yBqjev3ylEKwFH
	GhxQSrhkfAtAUb9B6w13rol/A4u9MbNiS+KU5UQkjgZazjXCaylTTFcOo9KxXoJDHbMB4c8bsNZWq
	6xRRanHQ1Ur74o0wW5y9EqGhg6u8mqRQS7GUukWfu/jJfsG+zjG4j9Z6w3G5u862YhLQPk5Fz+vX9
	w/8JGxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHyn-0000000Gk2z-1OMX;
	Fri, 24 Jul 2026 15:38:29 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHyk-0000000Gk2O-12dW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784907506; x=1816443506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=STe3l81ZzYWmrYt3MRzUBujSbUlThRL6gf8a/dbofg4=;
  b=IhwMsAliPWNkBv4am9J0SJXzwg1TEARSu2SEtgr2Sn8jRrXBNk5G4+4Z
   oz7luQrotNTSC+aNcunjnAQOpdNW1gvOULHNoYDVOwOKbVrKQQvMA13ia
   4heFPSseNPhj3NxLyGRD+U6ZOhyhflyVLjZVVrkLr4QxYIzeKeTYe/37o
   UckIkYZulbqFqLKjUBjAXCzRr9ygwiJSqaAcHTKW7hWdPNtZXZ4HmwaPv
   Or4K4TlYLZRsb9Z1y1IHgHY3nJhqAGeNexX1ZjdcfzUloC/M3unGVcpH4
   yxSj4G/iixyC3vZcBXQfYNHGFo96Jrx9Z7xeNfvyS93Gs35gR3SRmbJkb
   Q==;
X-CSE-ConnectionGUID: mlWM9xDtT1Ghi+hsLYGrNw==
X-CSE-MsgGUID: njEi6RhfReaxwA4hqKiubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="234679068"
X-IronPort-AV: E=Sophos;i="6.25,182,1779116400"; 
   d="scan'208";a="234679068"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 00:38:24 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E78B15528
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:38:23 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9B448C04242
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:38:23 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.54.178])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CCF811400248;
	Fri, 24 Jul 2026 15:38:17 +0000 (UTC)
Date: Sat, 25 Jul 2026 00:38:10 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, linux-coco@lists.linux.dev, 
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH v1 2/2] cgroup/misc: Add support for Arm CCA MECIDs
Message-ID: <amOCt4r72ge-Iw5h@FCCLS0092175.localdomain>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
 <20260724094120.166536-3-enju.kohei@fujitsu.com>
 <amNfGkkI5OIBqpmZ@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amNfGkkI5OIBqpmZ@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_083826_809468_566CE3DB 
X-CRM114-Status: GOOD (  22.28  )
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

On 07/24 14:52, Michal Koutný wrote:
> Hello Kohei.
> 
> On Fri, Jul 24, 2026 at 06:40:56PM +0900, Kohei Enju <enju.kohei@fujitsu.com> wrote:
> > Arm CCA MECIDs are limited platform resources. Add a misc cgroup
> > resource to allow the system administrator to account for and limit
> > their use.
> > 
> > The cca_mec resource represents the number of Realm VMs using the
> > private MEC policy. Each such Realm consumes one MECID. Charge the
> > resource when the Realm is created, and uncharge it when the Realm is
> > successfully destroyed.
> > 
> > Realms using the shared MEC policy don't consume this resource.
> > 
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >  arch/arm64/include/asm/kvm_rmi.h |  2 ++
> >  arch/arm64/kvm/rmi.c             | 44 +++++++++++++++++++++++++++++++-
> >  drivers/firmware/arm_rmm/rmi.c   |  4 +++
> 
> (mainly for this)
> >  include/linux/misc_cgroup.h      |  4 +++
> >  kernel/cgroup/misc.c             |  4 +++
> >  5 files changed, 57 insertions(+), 1 deletion(-)
> 
> Conditional
> Acked-by: Michal Koutný <mkoutny@suse.com>
> (it makes sense along the other arches' miscresurces)

Hi Michal,
Thank you for taking a look.

> 
> Why? I see this [1] (or followup) needs to be added first.

Yes, [1] should be added first.
As also stated in the coverletter, the following series is anothor
dependency, because this RFC series is on top of those other series.
https://lore.kernel.org/all/20260715142841.80544-1-steven.price@arm.com/

The [1] series is a dependency of the one above, and I didn't mention it
explicitly in the cover letter. My bad.

My intention was to get feedback on this RFC series about the
architecture and the basic design until those dependent series are
merged, after which I will send this series as non-RFC.

Thanks,
Kohei

> 
> Thanks,
> Michal
> 
> [1] https://lore.kernel.org/r/20260715142739.80398-4-steven.price@arm.com/



