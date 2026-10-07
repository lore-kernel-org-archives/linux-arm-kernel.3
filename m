Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFB8CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tRvYPXoN+7/ZzFMbu9CMAZ1Cq5cwCvkdJCdn+ymaiM=; b=hoajvrmyZFpv+mQ9Oy+uL+YS/F
	/40j+jsXetU/lXqHEVfvzWjagrluQP0r2R9MlCN/4ghha5xv4IJG9uLGgJ3V/iDMmZ+rrnAgmN4PW
	sXSqb/KdoP4EWFAQlacm7XnNI2moDyfF1FjoKOwWwHSoLjMMuzM62HvA030kOFN3ArVrx/8pI0D0C
	RjY1gZQ8/M4TLywL1wyz0xtuh0apoOh5qadBS+xrurjeWYql4QXaVO8m5NnOv8uvvMzy5FMD++n2o
	DmqbvCcuUGfGCdETFMiByimxdj95FtCozn0bTLYbtWBCv4dYskllUePWjWK9KhdB0V00fzWz7kRg2
	nlaAJkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMqP-00000001vve-2Xa7;
	Wed, 07 Oct 2026 08:17:45 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMqJ-00000001vv9-32yC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791361059; x=1822897059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MyqC3h/MCGtGNFcHgQdVBKkmwX4hPvWFwf5yZpwYALk=;
  b=ruv7TuZpfcWfv9p2BXioIX57xhst8ZokYCXAnlAkNKbw88LEqtIRL0Q7
   7jsAyhka6Ns0ju/cInNbgYDhjBNvj6dVvt7lASS2qijX9HLRUzG0nHjzT
   yMXCTiQGp5pTqe4jVM7Nd+SRMAPSK3fsgKSMp/ALKFetO+1BRTjpHnLUR
   evphvUquSsCVO2GC1GWlefqsAGu66Fe8ciOU0ge2LGak7pa7OE+BRQ3mN
   fHR3NR2JlQ4Jn698n6tKZtJQn7FABoKiT67ZRN1tsEgn6/5ycbLl64CVg
   8Ox/73vwqIqFTF5yZnTgtOE2v3dxq+Vv+PkMHVoP4o39Wm8b5Qm1jS6rM
   A==;
X-CSE-ConnectionGUID: KjVNxBr5SceW2r8G88jllw==
X-CSE-MsgGUID: qby6RJpkSHSbatu2EQAc8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="261335967"
X-IronPort-AV: E=Sophos;i="6.27,144,1786978800"; 
   d="scan'208";a="261335967"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 17:17:37 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 446CC42A325
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 08:17:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EA7FFC012A9
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 08:17:36 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.51.148])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 9AEAF2000AA7;
	Wed,  7 Oct 2026 08:17:31 +0000 (UTC)
Date: Wed, 7 Oct 2026 17:17:29 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
Message-ID: <asX5CiaDodoFrn0q@FCCLS0092175.localdomain>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
 <20261002-monaka-fix-for-upstream-v1-4-4aec0b0cbe34@fujitsu.com>
 <86tsn42sqr.wl-maz@kernel.org>
 <asS5r0WNCQpMIo4p@FCCLS0092175.localdomain>
 <878q4b2mj5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878q4b2mj5.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_011741_448357_C12E7175 
X-CRM114-Status: GOOD (  38.78  )
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

Hi Marc,

On 10/06 10:42, Marc Zyngier wrote:
> On Tue, 06 Oct 2026 10:08:19 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> > 
> > On 10/02 13:26, Marc Zyngier wrote:
> > > On Fri, 02 Oct 2026 11:26:52 +0100,
> > > Tomohiro Misono <misono.tomohiro@fujitsu.com> wrote:
> > > > 
> > > > From: Kohei Enju <enju.kohei@fujitsu.com>
> > > > 
> > > > On affected FUJITSU-MONAKA CPUs, an SGI generated by writing to
> > > > ICC_SGI0R_EL1, ICC_SGI1R_EL1, or ICC_ASGI1R_EL1 may be lost if the
> > > > operation races with CPU interface processing triggered by the arrival
> > > > of a higher-priority interrupt, an update to a pending interrupt, or a
> > > > transition of the PE to the Sleep state. When this occurs, the system
> > > > register write does not complete, causing the issuing core to hang.
> > > >
> > > 
> > > Is the SGI lost? Or is the sender core hanging?
> > 
> > Both: the SGI is lost, and the sysreg write does not complete, causing
> > the sending core to hang.
> 
> I don't think the two are distinguishable. You might want to simplify
> the commit message to simply say that the CPU hangs.
> 
> [...]
> 
> > > > +		 */
> > > > +		for_each_cpu(cpu, mask)
> > > > +			gic_send_sgi_via_rdist(cpu, d->hwirq);
> > > > +
> > > > +		/* Force the above writes to GICR_ISPENDR0 to be executed */
> > > > +		dsb(st);
> > > 
> > > This doesn't force things to be executed. This is about completion of
> > > the access, and with an nGnRE mapping, it doesn't enforce that the
> > > stores actually reach the RDs, only an arbitrary point in the memory
> > > subsystem.  The only way to guarantee this is to perform a read-back.
> > 
> > Understood.
> > 
> > I hadn't considered this when writing v1, but on further reflection, I
> > don't think gic_ipi_send_mask() needs to wait for the target CPUs to
> > handle the IPIs.
> 
> It's not about the target CPU handling the IPI, that'd be crazy. It is
> about making sure that the IPI request has been observed by the HW and
> that it is not going to race with something else.
> 
> > Given that the GICv2 driver does not wait for MMIO
> > write completion either, I don't think we need to ensure completion of
> > these writes before returning.
> 
> GICv2 has different architectural requirements (i.e. none). GICv3 is a
> bit clearer, see the requirements at the end of 12.1.3 in IHI0069H.b.
> 
> > 
> > If my understanding is correct, I'll remove the dsb(st) in v2.
> >
> 
> As indicated in the spec, you either need nGnRnE+DSB, or a read-back.
> Given that Linux uses nGnRE for all device mappings, read-back is the
> only option here.

I understand that section 12.1.3 describes how software can guarantee
completion of a memory-mapped GIC write. With an nGnRE mapping, if the
GICR_ISPENDR0 writes must complete before gic_ipi_send_mask() returns, a
read-back from each target Redistributor is needed.

What I am trying to understand is whether completion at this point is an
architectural requirement for this particular write, or a requirement of
Linux's ipi_send_mask() interface.

I could not find an explicit completion requirement for ipi_send_mask()
itself. The normal GICv3 path also appears to return after an ISB,
without the DSB described in section 12.1.6 as necessary to guarantee
that the associated Redistributor has observed the write. This is why I
am unsure what completion guarantee is required here.

More specifically, I would like to understand:
- What could an outstanding IPI request race with?
- Which component must have observed the request before
  gic_ipi_send_mask() returns: the CPU interface, the sending PE's
  Redistributor, or the target Redistributor?

A pointer to the relevant architectural requirement or an example of
such a race in Linux would help me understand why completion is needed
here.

Thanks,
Kohei

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

