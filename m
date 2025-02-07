Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C846C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7P+yYtf68Gk6mgQu7mjcsgZLRWdPZQqVrYW8WznHBc=; b=WVdGCCafVU/tHJE+0qOtMiYjSx
	llGoc05nx3Rq00VWOtFP1hybU9rEWzTePAG6j9s9h4oy7bWEzrGtZy98Ji9xpfwNLV7oOCyEP9Su0
	NZ82oQ8DVdE5UPAA8dmjqHJUPmEY2ZOOH0MKRZ1GgfgdI5soJreKnyWwQ+aDN2dkuUljui/vR4e5H
	jPIKMrYmyWLogvE2IybNHAejR6m3mTsqN1TZEG+oB/nlwnqOl4hIjqMbqTIcxJofGDLZEBQZBZM59
	XfVLqGTRpXxoOZKQ0ZkvoQtBnMTL89f6ToeK1+XwSt9ITroVuOC8GzK+q92QzoMtJ/7+/kFJnovPN
	2FBlvqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTSU-0000000Ano8-10jJ;
	Fri, 07 Feb 2025 18:52:10 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTR6-0000000Anb7-1IlR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:50:45 +0000
Date: Fri, 7 Feb 2025 10:50:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738954237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7P+yYtf68Gk6mgQu7mjcsgZLRWdPZQqVrYW8WznHBc=;
	b=f4vkChq3DUW264PV6AWlXBKla/NT5UPoE776+UIsFt4xAAEHXIES8pJzCkXhTHNLgJ78s+
	8D/yHdHnNXS2O0Kto6B/PbxadeSzPfpWz4QSJFZ2zP3qPX6Ztcc3gxyjhJbNT2Q8ctuJvI
	34dwwTbutZIc45JabbJMkJt9RJPartc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Assorted vgic fixes for 6.14
Message-ID: <Z6ZV-JHDSSLKEah-@linux.dev>
References: <20250206152100.1107909-1-maz@kernel.org>
 <Z6ZLC1v5KU-zzbQR@linux.dev>
 <86ed09tyl2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ed09tyl2.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_105044_757877_6AE36DE2 
X-CRM114-Status: GOOD (  21.84  )
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

On Fri, Feb 07, 2025 at 06:10:49PM +0000, Marc Zyngier wrote:
> On Fri, 07 Feb 2025 18:03:55 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Thu, Feb 06, 2025 at 03:20:57PM +0000, Marc Zyngier wrote:
> > > Alexander, while fuzzing KVM/arm64, found an annoying set of problems,
> > > all stemming from the fact that the vgic can be destroyed in parallel
> > > with the rest of the guest still being live.
> > > 
> > > Yes, this is annoying.
> > > 
> > > Fixing this is not going to happen overnight (though I have some
> > > ideas), but we can make what we have today a bit more robust.
> > > 
> > > This is what patch #2 is doing. Patch #1 is just removing a loud
> > > WARN_ON() that serves little purpose, and patch #3 fixes the actual
> > > bug that Alex reported.
> > > 
> > > Hopefully, none of that is controversial...
> > 
> > I'm a bit grumbly about slapping bandaids on the problem, but given the
> > fact that glider reported all of this a while ago and we still haven't
> > fixed it is enough to justify these patches. So:
> 
> Yeah, same here. I'm starting to think that we need to either prevent
> the vgic from being asynchronously destroyed, or start refcounting all
> IRQs just like LPIs. Which is very annoying since we don't have a
> global namespace for SGIs and PPIs.
> 
> But maybe simply refcounting the vgic itself would be enough.
> Thoughts?

So would we refcount on the owning structure for a particular IRQ? i.e.
private IRQs are counted against the owning vCPU and SPIs against the
distributor?

Adding a vgic_put_vcpu_irq() could help disambiguate private IRQs too.

-- 
Thanks,
Oliver

