Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F01DCD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZXZf0QrLRBB3/wedLhEYzNfMCQac39aVxAQMf9tnbw=; b=fkb/7jRCPX0fZWj7mXUHIuRvct
	JtsCjEF7VBaqdBVDuw6on2AKriOO1h0aNR4GSh2mgrzOjnvaz0HJnwJfQgY5lboRDCknMDwD/YuU/
	CwHj0nVgA68JPob8RQidnUERMjNGfiTBRdrUPsPDi+YRhQgnOnhTyQZgRTIt6jWqBiIp3/YGjp+f1
	DaEwsD04WXmwgO+kJ5o5oe07gpr8Bvai95x0IihOBzElZlY7b7XMMjxdou/lXeJjRBfJvlxbZMZ83
	tEZ+/DXoclyxq50f43PfJ91GQd8rFLbLWsrLPlgcJYuDIrTy7w5sZgZvOFKtRVsg0Qx84c7KrxqhK
	hqm6TcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyBU-0000000Fq4E-3LL0;
	Mon, 18 May 2026 13:39:04 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyBR-0000000Fq3O-3ILJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779111541; x=1810647541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z2kNdpLbI2LyHk1ntAUPjhzA6RQ5Jbi78aL7gqWOJ6s=;
  b=iAOLMj90bSPsO8EwSU/u/x5f3oJcvnsaQYzQcusWpVCgMvBusarpGBDj
   hXeJRxmuQtXL3XmGg41bLSqmpcLNVsQ3edlARKtmvR9V61jnG8wnt+BPU
   0OUkZhzxl+z9BYfzSWho88LOGgwxEAuPdDw/LNV7TL1rEbBsZ2r0o6b1R
   bqxUMn85oeSjIzanlngIDqsJFl5xwxVvJ9vCrpfYHHUS2IXgrP7WMQvlz
   uhaqWcErqS4V1fSMzEHjqjr3lyTc7x4xn3iAlaB4ywXPyIXPhZAoDRimn
   KehWC/4wjaWnfH7v03EmRtFnE6MeYMy0O1l+JfxhxtcFp7juU87bme97o
   Q==;
X-CSE-ConnectionGUID: nKPR1v72SmSoE5hxwHWQIQ==
X-CSE-MsgGUID: pX2K+EXhTvyrXH4HkRX49g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="228929312"
X-IronPort-AV: E=Sophos;i="6.23,242,1770562800"; 
   d="scan'208";a="228929312"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 22:38:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 142281C000B6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 13:38:59 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B67EB18026F3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 13:38:58 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.3.119])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with SMTP id 6019810003F8;
	Mon, 18 May 2026 13:38:54 +0000 (UTC)
Date: Mon, 18 May 2026 22:38:53 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Sami Mujawar <sami.mujawar@arm.com>, 
	Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <agsSyRT7z-F5iBIp@FCCLS0092175.localdomain>
References: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
 <agsHBb9f3HkmJaIx@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agsHBb9f3HkmJaIx@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_063902_397823_302F7320 
X-CRM114-Status: GOOD (  33.03  )
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

On 05/18 13:33, Catalin Marinas wrote:
> On Mon, May 18, 2026 at 12:31:31PM +0900, Kohei Enju wrote:
> > With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> > debug_smp_processor_id(). This debug function complains when certain
> > conditions that ensure CPU ID stability are not met, specifically when
> > it's called from a preemptible context.
> > 
> > In arm_cca_report_new(), which runs in a preemptible context,
> > smp_processor_id() triggers a splat [0] due to this.
> > 
> > However, the CPU ID obtained here is used as the target CPU for
> > smp_call_function_single() to designate a specific CPU for subsequent
> > operations, not to assert that the current thread will continue to
> > execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> > correct, and thus there's no actual harm except for the splat.
> > 
> > Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> > ID without the debug checks, avoiding the unnecessary warning message
> > while preserving the correct functional behavior.
> > 
> > [0]
> >  BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/134
> >  caller is debug_smp_processor_id+0x20/0x2c
> >  CPU: 0 UID: 0 PID: 134 Comm: cca-workload-at Not tainted 7.0.0-rc1-gc74a64d12073 #1 PREEMPT
> >  Hardware name: linux,dummy-virt (DT)
> >  Call trace:
> >   [...]
> >   check_preemption_disabled+0xf8/0x100
> >   debug_smp_processor_id+0x20/0x2c
> >   arm_cca_report_new+0x54/0x230
> >   tsm_report_read+0x184/0x260
> >   tsm_report_outblob_read+0x18/0x38
> >   configfs_bin_read_iter+0xf4/0x1dc
> >   vfs_read+0x230/0x31c
> >   [...]
> > 
> > Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >  drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > index 0c9ea24a200c..2d450caee3e4 100644
> > --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > @@ -108,7 +108,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
> >  	 * allocate outblob based on the returned value from the 'init'
> >  	 * call and that cannot be done in an atomic context.
> >  	 */
> > -	cpu = smp_processor_id();
> > +	cpu = raw_smp_processor_id();
> 
> That's just hiding the warning which might be genuine, irrespective of
> what the comment says. Sashiko has some good points:
> 
> https://sashiko.dev/#/patchset/20260518033157.1865498-1-enju.kohei@fujitsu.com
> 
> Basically what guarantees that the cpu won't go offline? Can we use
> migrate_disable() and ignore the smp_call_function_single() altogether?
> It looks like a hack anyway.

Hi Catalin,
Thank you for reviewing.

You've raised a very valid point about raw_smp_processor_id()
potentially hiding a genuine issue. I agree this would be a concern in
most contexts.

However, this implementation was intentionally designed not to block CPU
hotplug:
https://lore.kernel.org/linux-arm-kernel/7a83461d-40fd-4e61-8833-5dae2abaf82b@arm.com/

As mentioned in the thread above, the potential failure from the target
CPU going offline (resulting in -ENXIO) is an expected and tolerated
condition in this path.
Using migrate_disable() would go against the non-blocking design goal.

Given the context, the debug warning looks false positive for our
specific use case to me, and I believe raw_smp_processor_id() correctly
reflects the design intent by simply acquiring a CPU number without
debug checks.

> 
> We should also look at the other unrelated findings in this function

Regarding the other unrelated findings by Sashiko, I'll take a look at
them. Thanks for the heads-up.

Thanks,
Kohei

> 
> -- 
> Catalin
> 

