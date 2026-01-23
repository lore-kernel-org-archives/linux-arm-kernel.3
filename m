Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38A9D74EDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haKTlGMXRzHzTeVN0kjKcN2ofryqhJ3KauOfUGQIMo4=; b=sOCITx2M89h0h2x0VNgExgUcLH
	NlHOug/6SHaPw0+ijizKGn46aS/6UWiDlHIf0ci4UPkB3f8e4aj+6qXWMmf5N5jbM7gi468ELLBdP
	TWGr17AeeF8QSz+5eFg0+H/1qLzcpRTVuk4QLo9t39M+ND1Qu/eWprkWp0cyS8JgE/MZ9g/25CBn8
	3mnaH4LCsGYEIq5TzPj+dPBjhFqeck6cSqh5Ol8hx/o6mFm5iZfpHrb8Z93vSY9AS3uhHJTXHGrpi
	C/+OS3fbChjwUejSyG2SNklnZGFYopaJ/AJ3BhF2cduB6RgF+MLnJsV98G6o/OP3etpwlRvjvO37J
	qpi8uFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIua-000000095Oc-22kd;
	Fri, 23 Jan 2026 15:17:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIuY-000000095O4-1xVH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 15:17:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 491A31515;
	Fri, 23 Jan 2026 07:17:14 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0181E3F632;
	Fri, 23 Jan 2026 07:17:18 -0800 (PST)
Date: Fri, 23 Jan 2026 15:17:15 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 0/6] KVM: arm64: ... and FWB for all
Message-ID: <aXOQ-3M7d2wSsAq-@raptor>
References: <20260119105651.255693-1-maz@kernel.org>
 <aXNoIrrjNnoQKkAg@raptor>
 <86pl70bj42.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86pl70bj42.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_071722_547968_0CBF21B1 
X-CRM114-Status: GOOD (  23.85  )
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

On Fri, Jan 23, 2026 at 12:37:17PM +0000, Marc Zyngier wrote:
> On Fri, 23 Jan 2026 12:22:58 +0000,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > Hi Marc,
> > 
> > On Mon, Jan 19, 2026 at 10:56:45AM +0000, Marc Zyngier wrote:
> > > [Yes, you can tell what I was listening to]
> > > 
> > > Today, running in protected mode puts the host under it's own S2 with
> > > FWB=0, even if the rest of the guests are running with FWB=1. The
> > > rationale for this special-casing of the host is that we want the
> > > combined attributes to actually reflect the ones exposed by S1.
> > > 
> > > We therefore use NormalCacheable (which is the weakest memory type) as
> > > the default attributes at S2 so that S1 can only strengthen the final
> > > memory type.
> > > 
> > > But there is no reason why we cannot achieve the same effect with
> > > FWB. We normally use FWB to enforce cacheable memory from S2,
> > > irrespective of S1. But it is possible to configure the S2 attributes
> > > as "pass-through", so that the S1 attributes are always used.
> > 
> > Would you mind clarifying why FWB is preferable? Is it so that pkvm uses
> > the same approach for configuring stage 2 for the host as for a guest? Or
> > is it something else?
> 
> Having only one attribute encoding scheme to think about on a given
> machine is vastly preferable, specially when you are debugging.
> Additionally, FWB==0 may not be with us forever.

Got it, thanks for the explanation!

Thanks,
Alex

