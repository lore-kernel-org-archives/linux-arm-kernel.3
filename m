Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6019E6817A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfKzSeau4sWZSt12SmP9c2jYzxSDL7+fSWgN7FTF05M=; b=ZGJSBJqLS1mc+8/EcAPi095lfc
	QTyDRRIepCpj7b2Mm5i+XJ7obzT8UR7nWg11WfDXvgZ4lkvGGB7VBoXPM4m7LC4QJ+I+y2SBfHX+K
	188AFMLoJZkeB7ANCQfB6WYSqa2Wz2jkR/gOp06NRkrY/9tswBpIPer6Ktt/g2ejLhx6BZaSBBbKW
	KKdgBa+9taWavDfpqLO7/YrPJCUbJzSZH8fVNGagV+w7Dm0kgZcHM/JUkAo5sK9c7EvxYHKXZtJnh
	rxwIH84fuEfQQXeE01foGKPM5lwxWpOuVFKt/2l6jUxmnASuHUb05uipx1RRSBWOhgjMpcHY0BlEF
	c+USS+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK9Y-00000008ChN-35V5;
	Tue, 17 Feb 2026 12:26:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK9X-00000008Cgy-28MM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 987D860128;
	Tue, 17 Feb 2026 12:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7682BC4CEF7;
	Tue, 17 Feb 2026 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771331166;
	bh=2KlYMYJvT7Y1hTSO1LDecXwagv+AIm7sgfiCCrb0pYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI9AL0PJHNoLl0/+DUPyswIEazvwwB78CNj8mD4bRvCbR0MbGiEPMChYqzrw9BFC2
	 5TLTun3MnEffKHQz/v6Y3Uf3AhgS3QgFmZqCBkviX700Y1USxbbpxaApVINvRFISki
	 eWmMw3sy+XqJodL07DZFztJ+Vaw4Od0grh+QCYs1klINpTnvkD0akl5GhsyNKJauR6
	 4xzBmH6flQGJQWI7BggQc1RNioqchViAsoJvWYSoP4rq9HwMCn3NSjoV0OmfSnsma+
	 SBKANRTyf3bamNkIPyBIKePAyZqjmYqsRNWeJf9sD/3bZeqpDmScj1vw74vSsVxumV
	 eCycN4OD+yb8Q==
Date: Tue, 17 Feb 2026 12:26:01 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aZReWRme4InoSa8M@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <aZNUqONyOUVd0opW@willie-the-truck>
 <cda4e111-29cc-481c-aee2-811f4178f54b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cda4e111-29cc-481c-aee2-811f4178f54b@linaro.org>
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

On Tue, Feb 17, 2026 at 12:20:14PM +0000, James Clark wrote:
> On 16/02/2026 5:32 pm, Will Deacon wrote:
> > On Mon, Feb 16, 2026 at 02:29:31PM +0000, Marc Zyngier wrote:
> > > And even then, I'm tempted to simply get rid of any sort of
> > > guest-only tracing, given that TRBE is not capable of representing
> > > exceptions that are synthesised by the host, making it the resulting
> > > traces useless.
> > 
> > I think that effectively means reverting the series merged from here:
> > 
> > https://lore.kernel.org/all/20250106142446.628923-1-james.clark@linaro.org/
> > 
> > but then we still need to clear TRBLIMITR_EL1.E.
> > 
> 
> Removing that series would actually have the effect of turning guest trace
> on in nVHE for non-TRBE sinks. The reason for implementing the filtering was
> to turn guest trace off because a user didn't want to see it.

What I meant was, revert that series and then also ensure that both TRFCR
and TRBLIMITR are always zero while running in the guest. Is that not
sufficient?

Will

