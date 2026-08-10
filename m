Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F52C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO2Ev8YLzg13BRqdk5yRT8KPxiqC1zHZFeTk1LNCdF4=; b=XE1kv5aJL4FRlOI0PdFAUWPdCi
	/5yJxMXc09H+GG9oBDa60817Jp8iQWl+7QF3azgTCQpARrg9XAZ4+PBPJL9en/D/KOv3iRHO3z1Nv
	O7ktkySniine21C1PBxwOkUmxBska9OdEH9YlDOPdNl5zW9XW/74gJioAGkRklRe+4/79NosoEQbM
	HnIadC882ssr+wPedL2mIE+t1eX2v6pkJ9VQqezvDlDt8dnCnCZ/q6+QsiGm4+h9u3TJ4CwkVm1ZF
	Ya3eT5hN/t4DvUNeaHHlZqcVzY25k1ZvaFvKdECnMMPZLfb7s/Re/5cG2zxvURNC+srOqxplUZn+f
	AZkbisFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNBc-0000000BV4h-1rI4;
	Mon, 10 Aug 2026 10:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNBY-0000000BV2y-0H4c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:24:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF91542456;
	Mon, 10 Aug 2026 10:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE3F1F00A3A;
	Mon, 10 Aug 2026 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357487;
	bh=QO2Ev8YLzg13BRqdk5yRT8KPxiqC1zHZFeTk1LNCdF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PLtTk0Cfh6D8YQALwyYjF/H80rQE8ujJkzfn5lrQUhlV95MEwjd+K7Gxb1k2/SgjG
	 9npDiu8Na/le4Hclc0lJ3jVSa0pTYi9WCKVtSVDKdgxTdrIH5pr3gxeJvsPnU2A7sl
	 ns8wRevt4hq0OPAFdmSgNtkyk09L//YG/XM9VqjugsqEI+Kd3HeHwmad8SihPZh9Bq
	 PItIDsM48bf5cyqxeBL3FRBf6WxSHrgV/sURQIXj9X86d2h8HnsWx0HInO0jerOyPI
	 LnUK9dQa4cNAbzHuh3G7p51y2JJcjsO4r7WMxTKYxlA9FpZ84uEcmEQlIpKHdByU5b
	 BUISB4Ix0Dbgw==
Date: Mon, 10 Aug 2026 11:24:42 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Message-ID: <anmm6nF6GN-vSRn2@willie-the-truck>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <anMHs65s6Mk-ZRdT@arm.com>
 <yq5awlu43gg6.fsf@kernel.org>
 <yq5ase4miaib.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ase4miaib.fsf@kernel.org>
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

On Mon, Aug 10, 2026 at 03:05:08PM +0530, Aneesh Kumar K.V wrote:
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> 
> > Catalin Marinas <catalin.marinas@arm.com> writes:
> >
> >> On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >>> Changes from v8:
> >>> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
> >>> * Rebase onto the arm64 for-next/core branch.
> >>
> >> Was there a dependency on anything in for-next/core? We normally apply
> >> series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
> >> and merge everything together in for-next/core. We (and many other
> >> maintainers) strongly prefer series posted on top of an -rc kernel
> >> (typically -rc1 to -rc3) unless there's a dependency on a different
> >> branch. Never based on -next or -next like branches (which is what
> >> for-next/core is, as the name implies).
> >>
> >
> > The reason is that these two patches create conflicts. Since this series
> > involves file movement, resolving those conflicts was not
> > straightforward. Therefore, I rebased the series on top of both of the
> > following commits:
> >
> > commit 24f55f511b9e ("virt: arm-cca-guest: use migrate_disable() for attestation token requests")
> > commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")
> >
> 
> Any chance of getting this picked up for the next merge window?

No, we're at -rc7 and you sent this half-way through -rc6. Regression
fixes only at this point, I'm afraid.

Will

