Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CD7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSZAKZJBtmXPfCIzyN+pyGhW+GDpOa1dgPvIqwhe5V4=; b=JKEiwpA7YQTjEMYpzSnVLlFPi6
	m7ZZORB0bBMMnNYhaSK9/u8cXHdP1H7nDazryj+xBZDuxqyKb9yFHEWEge+KVwCMMdhBleyOqV0CJ
	kCVj9j1e5vH21BBwnKTbQqNh74u9zJsY5hFRQQ8n6m7mE7WgivAvrk7Xq+ZlBONdCNLL5J1SFEv+l
	IX3jGVUgD4muJdjs1WX4lobrpNYgkcWqo4TyexljSFHEKflvOQ/83vYObghYZsAwX7wk33CzKNZfC
	PBVBxo4zWRRmpgjtKqOwWQLtMOL7EDcdb0XyBx+X1Wb24lWMcguiTSXP3QYMhJim3UnUJQNgF5LMS
	pXlklqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMfN-0000000553G-2ToG;
	Wed, 26 Feb 2025 19:01:57 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMa5-000000053cJ-0B0u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:56:30 +0000
Date: Wed, 26 Feb 2025 10:56:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740596186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BSZAKZJBtmXPfCIzyN+pyGhW+GDpOa1dgPvIqwhe5V4=;
	b=DTrVl07ICp5qpVt9MAbJRYr2jB6odrQGw25//j+jiz92ZneaTgdDrKxpiezmpU/LqmQ43I
	JALYeNQ0rzYI+D5/Kg7jn9ve6YZsWTOq2pUMBN/fF/SjaKuW4hlJPRhK+IMYGRaD01KVOD
	/BMsU7qHDH6aVQa/frsYmyPqUVcg77s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] KVM: arm64: writable MIDR/REVIDR
Message-ID: <Z79j1ckWLx_Hwqct@linux.dev>
References: <20250218163443.32836-1-sebott@redhat.com>
 <Z7zxSdW5b6rqe2bt@linux.dev>
 <b2b015de-569b-2cdd-8ec3-8c8690ff950b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2b015de-569b-2cdd-8ec3-8c8690ff950b@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_105629_218335_EDB8E4BC 
X-CRM114-Status: GOOD (  26.10  )
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

On Wed, Feb 26, 2025 at 05:47:53PM +0100, Sebastian Ott wrote:
> On Mon, 24 Feb 2025, Oliver Upton wrote:
> > On Tue, Feb 18, 2025 at 05:34:39PM +0100, Sebastian Ott wrote:
> > > Based on prior discussion [1] this series allows VMMs to change
> > > MIDR/REVIDR to enable migration between machines that differ in
> > > these registers. Since these are used for errata handling the
> > > errata management series [2] is a prerequisite for this one.
> > > 
> > > changes for V3:
> > > * handle VPIDR_EL2 as part of vcpu ctxt - thanks Oliver!
> > 
> > Thanks for respinning. While your changes are looking good, as I got
> > ready to apply this series I wound up peeling the onion a bit further
> > and have a few more concerns:
> > 
> > - Current KVM allows guests to read SMIDR_EL1 despite the fact that we
> >   do not support SME (this is part of TID1 traps)
> > 
> > - The "invariant" values that KVM presents to userspace originate from
> >   the boot CPU, not the CPU that resets the ID registers for a VM
> > 
> > - A VMM that wants to present big-little can do so on current KVM by
> >   affining vCPUs, but cannot with this series
> > 
> > All of this is to say, I think your series is going to collide with
> > the pre-existing pile of crap we have. I'm going to pick up these
> > changes and rework them so we can send a fix for #1 to stable trees and
> > (hopefully) avoid breaking the old "invariant" behavior.
> > 
> > I'll post what I have as soon as I test it, hopefully we can get this
> > shaped up for 6.15.
> 
> Sry, for the additional work I've caused. I gave what you have in next a
> spin and it looks good so far.
> Thank you very much!

Don't apologize -- it isn't your fault what we had already was a mess! :)

Thanks for kicking the tires.

Best,
Oliver

