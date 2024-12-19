Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8947E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eR2DRTQ0KqCY0541VCndfWjKE2EM1mWquHwx6Ry0fQ=; b=ANv27R9JBUVtHDb5nwK+5FJ36w
	9IQa6jkOBSRz1mlS4+Lwb0aPFtJ0vanG6vlNs1JrjYeY+drhQx9NLeUNYH2dKdXXEgJc9Ut+01vWp
	xYqpwi2UIeVYCDN4K2f0HNqDdugyDciQQa0uyv4P1Zv4deCrf7x+17Pfn+V0Fkvp2UbrsXHRryVlN
	YeljAv2SQX6iIkufO9doz/fMeiRiKH+SqB5PcEVHdOlhZoctHEjYneejrh/LKeTjuvmrWIbGJTSLR
	T7FdY+2SvSHBK8vrK5D7WHF5RRv8rPL44cyTDgk/VvafWGDzzv4f7m5k8qjK7mTWCLvJ8wawAtdg3
	QocZ0gxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOItf-00000002EDA-1b6O;
	Thu, 19 Dec 2024 15:57:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIsV-00000002Dy9-0gca
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 15:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8225B5C5C8F;
	Thu, 19 Dec 2024 15:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE05AC4CECE;
	Thu, 19 Dec 2024 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734623754;
	bh=ZA3e8tpjMwQOZm128w5m1JOe7wbojppzP4cVWCciqpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFt1Ko4YSU9cU1rH2ogwSoR4bY8c2iHySJQGkHTYQAosWxgiBkosnPKX40IeNXGaB
	 3g9AreisVGT8bqdVM7Z+/tYD5rbyta86EKvBuMqYOvIizMenjvgFfzCkYiX8wto4Qn
	 Zkc3V6MFc2pEgwInun1X6Wz8fJPJOOH8CVazME9CYno/ZmiYc0v4TRVk09zlpiZ3P5
	 bY0YLTEuezQ5x+nGDBBygLzT+xNSCifTl+Nsy4utQ7EpikUjpx3cYaAu2EZzYhC9iy
	 Lux4KzWjFtXrBp1ArHWTEn9c6T1S/kiZkZDwxhMzO5Cg9BxpuvN1BWkuASj4P+Xg9a
	 ICuWsfsKQnXMw==
Date: Thu, 19 Dec 2024 15:55:48 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <20241219155547.GC24724@willie-the-truck>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
 <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
 <20241211224015.GB17836@willie-the-truck>
 <248dea18-bfad-4ec9-9a7d-5c87c7f48c84@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <248dea18-bfad-4ec9-9a7d-5c87c7f48c84@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_075555_249872_55FC43A9 
X-CRM114-Status: GOOD (  22.30  )
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

On Thu, Dec 12, 2024 at 11:33:05AM +0000, Mark Brown wrote:
> On Wed, Dec 11, 2024 at 10:40:15PM +0000, Will Deacon wrote:
> > On Tue, Dec 10, 2024 at 06:43:05PM +0000, Mark Brown wrote:
> 
> > > Yes, the issues here are not technical ones.  Though there are some
> > > complications -  eg, IIRC the XML doesn't encode the signedness of
> > > fields like we do and there's areas where we've deliberately diverged.
> > > Given the amount of review I end up having to do of sysreg changes your
> > > reasoning is especially apparent to me.  I've passed this feedback on
> > > (again).
> 
> > One thing we _could_ do is have a tool (in-tree) that takes two copies
> > of the sysreg file (i.e. before and after applying a diff) along with a
> > copy of the XML and, for the the new fields being added, shows how the
> > XML represents those compared to the diff. It should then be relatively
> > straightforward to flag the use of an unallocated encoding (like we had
> > here) and also things like assigning a field name to a RES0 region.
> 
> > So this wouldn't be generating the patches from the XML, but more like
> > using the XML as an oracle in a linter.
> 
> That'd be useful, yes - unfortunately I think that's still something I
> can't work on myself at the moment for the above mentioned non-technical
> reasons.

Is anybody able to work on it? Without insight into the "non-technical
reasons", I don't know what I'm supposed to do other than write the tool
myself (which means finding some spare cycles...) or refusing to take
wholesale sysreg definitions until it's been ironed out :/

Will

