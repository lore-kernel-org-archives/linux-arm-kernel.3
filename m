Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18E8C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLPTVef/x8Hak6mIihEe8seDb5YCI7TWJYkGBSakXYw=; b=e08Z5wHOPQsOsul+AcABG4zwH8
	ygMXAb3WWGfIkN0bv5ixU3R8TnKIvaY1fYSPDU4A1ZctBj1IzS2JTqQ9V2LRAy0J9YnLx1nQ8rIOR
	R4QoY+9JTrZ/x5tcgueRr7wbvtg+AHEJCTh4ikjT1K2dJ5PBY056iyvZyakqUHkywI+JfrfVzU3na
	ZCPCwa5lK3MkQFzauw9GCeAQJDqB7bWYNThBagqvsXbMiuc5CiYksaH9nta3pj7yobphHq0WuYykV
	Fu2JUVKTpIIh/0EH5KdG+P5ADKdahrMpI1MQis1yYth7YNmIbYPBL41t/01qvgeD+9ztRavEr/RfJ
	EtsA6wFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpKS-0000000DnUa-0TH2;
	Thu, 23 Jul 2026 09:02:56 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpKO-0000000DnTO-2YKn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784797372; x=1816333372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QlInud9zY6Zj2WAQdHZwDimVEk6ix99BMpZJ6uDFG4c=;
  b=Y79VcGx9Y5YG+GH9L4nuL/qlKQ7Knt+/cPNlqU79R69LIVB55BKvhn0r
   tvwg/qcAxV3lyHI2kwdAO2xg3dahRVbpnA9gfqCSmICNgW/dX9RdNRETV
   w0Vrj1fhEXAwQMqAQRSP5zlSI8rfgGts1gP1v5SmrwVWh3ByzEZWRaHFV
   cXcOBSCc4dZkID624M9C9+waACje/c8u2nvkmltphYTIosWvN1AKanoJk
   KWo+MzuenQ1jiDC9AGKC7SkPBt01tXl5bcHGse/zMGqiJDTqaWbLn5Rz3
   Sfjyf8Y9G03AjAGg5pF7lgw6HB3YVWh1woIoPLISa5t+2mLsMWL2wZcio
   g==;
X-CSE-ConnectionGUID: ruKsSgkoSrKTnMUA9IyjYA==
X-CSE-MsgGUID: 4fob0aWNQgWoFWYlF35J6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="234526774"
X-IronPort-AV: E=Sophos;i="6.25,180,1779116400"; 
   d="scan'208";a="234526774"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 18:02:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3DC1F820717
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:02:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E26C0C09667
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:02:48 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.10.80.137])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with SMTP id B285540267C;
	Thu, 23 Jul 2026 09:02:40 +0000 (UTC)
Date: Thu, 23 Jul 2026 18:02:33 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v15 12/37] KVM: arm64: CCA: Support the VGIC in realms
Message-ID: <amHYWxZJsXzIu_7c@FCCLS0092175.localdomain>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-13-steven.price@arm.com>
 <amB-opawGgF6jNHB@FCCLS0092175.localdomain>
 <86cxwfe5m8.wl-maz@kernel.org>
 <amGwgAfHWX2P9pZx@FCCLS0092175.localdomain>
 <868q72dt8o.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <868q72dt8o.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_020253_220205_2D8A2E8A 
X-CRM114-Status: GOOD (  28.00  )
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

On 07/23 09:07, Marc Zyngier wrote:
> On Thu, 23 Jul 2026 07:38:16 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> > 
> > On 07/22 10:27, Marc Zyngier wrote:
> > > >
> > > > As far as I can tell, the CCA requirements don't require the
> > > > ARM64_HAS_ICH_HCR_EL2_TDIR feature. If that's the case, this seems to be a
> > > > problem. Is there any workaround for this issue, or should we implement trap
> > > > handlers for those registers?
> > > 
> > > No. Either you support TDIR, like any modern CPU, or you don't run
> > > CCA. I'm not adding yet another level of emulation for this.
> > 
> > However, I'm still not aware of any requirement in the CCA architecture,
> > or in Armv8-A/Armv9-A, that mandates TDIR support.
> 
> The GICv3 architecture has deprecated the lack of TDIR support since
> the very first release of the specification in 2015, because it was
> quickly identified as an architecture bug. CCA mandates GICv3 support
> as written in the spec, and relying on deprecated features 11 years
> later is not acceptable.
> 
> By any definition, this is buggy hardware, and I don't feel a strong
> urge to support it.
> 
> > 
> > When you say "you don't run CCA", is that because the architecture
> > requires it,
> 
> See above.
> 
> > or because that's the current KVM policy? If it's the
> > latter, we'd be interested in adding the required emulation to make it
> > work.
> 
> And I say no to this. Enough. This isn't a "policy*. This is a hard
> red line. "Do Not Cross".
> 
> We already have the most complicated interrupt architecture ever, and
> I have zero desire to add even more complexity to it. Because I'm the
> idiot who ends-up maintaining this horror, and not you.
> 
> So no, no more emulation code. CCA in KVM won't handle systems that do
> not support TDIR, unless you rewrite the CCA support so that it can
> use the *existing* emulation code without any change.

Understood. Thanks for the clarification.

Thanks,
Kohei

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

