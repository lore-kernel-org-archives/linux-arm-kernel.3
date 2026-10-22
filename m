Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294DD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v+BFGAJy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+VmkrSx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vHf32BX5CBxcglhQ6KkJiiSCAqCtF8IKU/n7oyGpoCU=; b=v+BFGAJyP5HVi8EAY1eU+Y3Z1q
	RzSzQkdPhxs/CPzfOrXc7sxonVIi+3gh7r91wlJzRqU+64V2eOKlD7TJYUzzwgOmY1Zq2GLix8mJC
	xxLIc1DdNlpmok7RbYLdsUHHpe01q2ZCOmSYU+xaVeH+LMUYnLLh2a2sy5gLw3DcqScfrK5Vz0N8H
	wLHY5n3rK69BnZP8PTBSrtU1hW+S2ru1vXwmGt9boY+iEf2sFAKlngl2an+4wVlFMCB8o3/T+6DsC
	YXag24HouUsXje181hw8iBmEV1qcb9xjHOhn2CcCtG8Toh4fzBSQ4m8BWbTHjA3eBk8sOkWcb22r6
	26Abc2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJov9-0000000DoXr-3qSn;
	Thu, 22 Oct 2026 09:17:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJov9-0000000DoXk-0fr3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:17:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E22C44857;
	Thu, 22 Oct 2026 09:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5332C1F0157F;
	Thu, 22 Oct 2026 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792660630;
	bh=vHf32BX5CBxcglhQ6KkJiiSCAqCtF8IKU/n7oyGpoCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m+VmkrSxump5Pu41zZIF7aBMsvVbPqqUWq/08cLw5FlChqk/9w9an9vDEvLFgrbA+
	 gWbJaUpOtVOQIckffLDsPC3/lUkbOkjen7lxod98IL17CSYqe+KJoGj+aQlht+RGn+
	 aZnrVS5nDddnz8A90zqCS2yn4WQs5c6wNqHZe5XIzn3LS1hrvAAXTlEBc832O3S3jM
	 PcNryl78V4w2FrP/52PTO4RVtiAmZg1NC3j6feP9ncMG0R3B+KNzYW0iti3xdKn3D4
	 FMmuVFTa2w+/3QIyyve8g9m+4me0GqvYvrd6j5Pv+8QTE7Vg/ZZhQZur/plb027ZQT
	 +ZYtvzcoU1P2A==
Date: Thu, 22 Oct 2026 10:17:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Arnd Bergmann <arnd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH] firmware: arm: Consolidate arm firmware interface
 drivers under arm/
Message-ID: <20261022-dark-nocturnal-mushroom-9bbc4d@sudeepholla>
References: <20261022090003.3083557-1-sudeep.holla@kernel.org>
 <5da61969-8722-4aac-87c1-e9441c0f7092@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5da61969-8722-4aac-87c1-e9441c0f7092@app.fastmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:08:47AM +0200, Arnd Bergmann wrote:
> On Thu, Oct 22, 2026, at 11:00, Sudeep Holla wrote:
> >
> > Sorry for posting this in the middle of merge window, but if people agree
> > it is better to this merged at the end of merge window, hence posting it.
> 
> Hi Sudeep,
> 
> The changes all make sense to me, but I don't think we need a special
> case for the end of the merge window here, since it is fairly local
> and all those should already go through your tree anyway. If there
> are any changes to the files in other trees, that is usually something
> that git-merge handles well, only emailed patches would need manual
> changes.
> 
> I would suggest putting any new Arm specific firmware interfaces under
> drivers/firmware/arm/ directly, but delaying the actual move until 7.5.
> 
> To make the transition easier, maybe you can use this patch as an
> immutable branch and send that to soc@lists.linux.dev directly after
> 7.4-rc1 is out, and then base any other firmware contents for 7.5
> on that branch. 
> 

Understood and agreed. Sounds like a plan.

-- 
Regards,
Sudeep

