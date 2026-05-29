Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A1CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 00:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTXQz6HHs8W29ynQVKxVai17ePUtAyTqEstLwjrZgu8=; b=ZcK9lP7w9TNp4TUVGd0XRmmYXv
	xe68q35Bbhz8+Y6XkDqMwdHIp+fPeaJsuzjCcswOvujkmUm5hcXkVPKMbXye0oSXPD/Jvhwq497TE
	6ukvDroWIyq+8iQ67JM47CwqV14UVTYCD36XrzQp449zsZ2FsUfMD1mhIz+NVXLCgE6KfZXXF+kLh
	tIqIPLr7oQNRzzPif3G/p0GAlokgcsj3+9QK3fiqm46G/Yu1lqkf6dzR7nVVIN2wDYvk4PgfGGCET
	/H4j3EgPRwEa36bLys8IS282h3AlNFI+2wENrf/nwk4E2WKrKzLpiLFZFP1ibqJwhBmI6VPJDX5p5
	H1xS4hhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlVi-00000006afF-26Hd;
	Fri, 29 May 2026 00:55:38 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlVe-00000006aer-2OSr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 00:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780016134; x=1811552134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lhpPtqrPlN22mh1WZzcu3aj/wlFlJxXUx2s+ET5Hoyw=;
  b=mWRWw1BG+xhSGGzWdT4bNw8QoQksIQirgFRMv1HO+1lQN5HaxWxjwnOb
   PJpeZWpRAKn+lnNi0g6sel3u9vtiYoJSpmWaI4hRcNGfxsvW/Ecx5/idp
   MVPOdVmuU4aYTqElt/WCLUblKfpKm8vx2C+ZWh+/U/B7V38OnOaSvx6+C
   n+yfqIbxZVUOpvHnRLOcLtU+RnwyDfzBMhoH7i8gbA496bmQAui8PRhal
   jUJOd2wzyHJhj8YN+1DaYuYg2Q9XnYJI8SECNqF2vCZCTayUh3W28YJrn
   B+jcRAmFSyHHl5RuWmBd8oro8xJFw/OHnJAmEJO/Z892CR9gWiDkRoVv/
   A==;
X-CSE-ConnectionGUID: dX4/cQIJS6a6dqNTcjQfng==
X-CSE-MsgGUID: obudLK9eSZaQdnFn6JxWLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="228364635"
X-IronPort-AV: E=Sophos;i="6.24,174,1774278000"; 
   d="scan'208";a="228364635"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:55:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AEBF3C00415
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:55:31 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 647E014003F4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:55:31 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 128DA2000752;
	Fri, 29 May 2026 00:55:26 +0000 (UTC)
Date: Fri, 29 May 2026 09:55:24 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/5] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <ahjj_CKuXhDOHhBZ@sm-arm-grace07>
References: <20260510145338.322962-1-weilin.chang@arm.com>
 <ag1jQB3dRX0RSqbR@sm-arm-grace07>
 <86fr3bvnt5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86fr3bvnt5.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_175535_171137_B5FB72F3 
X-CRM114-Status: GOOD (  23.50  )
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

On Thu, May 28, 2026 at 11:19:34AM +0100, Marc Zyngier wrote:
> On Wed, 20 May 2026 08:31:12 +0100,
> Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > 
> > Hi Wei Lin,
> > 
> > On Sun, May 10, 2026 at 03:53:33PM +0100, Wei-Lin Chang wrote:
> > > Hi,
> > > 
> > > This is v3 of optimizing the shadow s2 mmu unmapping during MMU
> > > notifiers.
> > > 
> > > Two new preparatory patches are added, one reduces a hole in kvm_s2_mmu
> > > and another refactors the code a bit during s2 faults. Other changes are
> > > listed below.
> > > 
> > > * Changes from v2 [1]:
> > > 
> > >   - Removed "polluted" teminology.
> > > 
> > >   - Use xa_{mk, to}_value() when storing and retriving values from maple
> > >     trees.
> > > 
> > >   - Avoid using the 63rd bit in maple tree values so that xa_{mk, to}_value()
> > >     does not lose us a bit.
> > > 
> > >   - Added reverse map removal during TLBI handling.
> > > 
> > >   - Other suggested refactorings.
> > > 
> > > Thanks!
> > 
> > With this series applied on the recent kvmarm/fixes (minor local modification), 
> > your v3 hello_nested runs fine on all three page granules; without this 16KB 
> > kernel can't handle stage 2 unmapping paths. I tested using the latest QEMU only 
> > so wonder how you're testing.
> 
> Can you clarify this statement?
> 
> Are you saying that 16kB S2 unmap do not work with upstream? That
> seems odd, as it would mean NV wouldn't work on Apple HW, which
> represents two thirds of my development boxes...

Yes, I built this morning's upstream kvmarm/fixes with 16KB granule fresh, and tested
Wei Lin's propsed KVM selftest, hello_nested on QEMU with the small buildroot
filesystem and saw the above i.e., the stage 2 unmapping paths never finish.

I thought it was due to the Ubuntu userspace I was using for testing,
but not sure now.

Thanks,
Itaru.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

