Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MytlJ2KGkzQ+RhdKVpvDJ1qR08yPF+KOv8QGFyqerQs=; b=w8qvxHvJEfu+mQ92s+KemNYrtf
	Ww5k6gz2b4sBi/KNUpzhDwWAI5yBCZk679uROITJ5uL/61ypq8s3qQh+yt7WjtT9Avg1AqUdbLENs
	jQ3PN7yTt80BkozrFVbNyANtPcnqS0IkYHCVXYrV5TYTYsCCb4WI/IdaY8Eqk4h7aXSVj9ba0GSIk
	lB7RlNrFP40SOnUe8v4hnzX4rpceULaRn0RlexkrRpsx4AVymrY7Tti9pLvRv7ujrPpmIFDXbkMX3
	ysNrOG6Mzq7VrrDEiZqpClbTe8CnkHaOObsvST8VFnXlqSr0bnVGEyTuRADi5eX8QpW3WU/gzW9S2
	g2DHQODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgsb-0000000FMJe-1Hal;
	Mon, 24 Feb 2025 22:24:49 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgr7-0000000FM2N-01yf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 22:23:18 +0000
Date: Mon, 24 Feb 2025 14:23:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740435794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MytlJ2KGkzQ+RhdKVpvDJ1qR08yPF+KOv8QGFyqerQs=;
	b=maOIQzSvuUUmYk2SXkgSfup4ufEe8vHbBJ1FJO81wU3bAJfRUFrahN1yRRh9znIPT/o5TV
	WoB9p4K7A8zLUuGiNJ6GriZ8DtNyq3pPrqY+zl2aOneRbzq2EQxRQ9awhbiIE8t+IhjSRU
	HIruwKqVpJtTTT00ZjwDqRmDWWixvoY=
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
Message-ID: <Z7zxSdW5b6rqe2bt@linux.dev>
References: <20250218163443.32836-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218163443.32836-1-sebott@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_142317_188274_92F4B223 
X-CRM114-Status: GOOD (  11.95  )
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

Hi Sebastian,

On Tue, Feb 18, 2025 at 05:34:39PM +0100, Sebastian Ott wrote:
> Based on prior discussion [1] this series allows VMMs to change
> MIDR/REVIDR to enable migration between machines that differ in
> these registers. Since these are used for errata handling the
> errata management series [2] is a prerequisite for this one.
> 
> changes for V3:
> * handle VPIDR_EL2 as part of vcpu ctxt - thanks Oliver!

Thanks for respinning. While your changes are looking good, as I got
ready to apply this series I wound up peeling the onion a bit further
and have a few more concerns:

 - Current KVM allows guests to read SMIDR_EL1 despite the fact that we
   do not support SME (this is part of TID1 traps)

 - The "invariant" values that KVM presents to userspace originate from
   the boot CPU, not the CPU that resets the ID registers for a VM

 - A VMM that wants to present big-little can do so on current KVM by
   affining vCPUs, but cannot with this series

All of this is to say, I think your series is going to collide with
the pre-existing pile of crap we have. I'm going to pick up these
changes and rework them so we can send a fix for #1 to stable trees and
(hopefully) avoid breaking the old "invariant" behavior.

I'll post what I have as soon as I test it, hopefully we can get this
shaped up for 6.15.

Thanks,
Oliver

