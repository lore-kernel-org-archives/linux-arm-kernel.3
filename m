Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aa964Ha8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqUIW910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AH9jbyRyqYQM8uXEqlVbbyuWAkQCPVJGJ6rXheEFJ/Q=; b=Aa964Ha8SlwDSxX7d8S4ZpvNX6
	ZkgoeIqg3FMbYhCz7UUOdt4PRjZ4NyufTyTPeyUeRoZoUBHsQDJYNoRN8lRibtx7r6DXPoxqa1/My
	rNinaV9nrKQzAa+20CdY90DVKPamUPaVvZAnD7LoCTPxT9AyVL19FovViNck3EpJ5Qy/mbc7mP9du
	K54HgMFbrJ9hRECQ7gupQiszPlCXxqjq+Ooj7n19xTW8dGBUC6Fc1IATODsSOAfSpr86aoRTOItjN
	R7Z2Gw44oWhjJoZDRU1HcBXMAVGYpQEyxmaxRUiW+DHTKCvD09SQQtw+ixC75wSfKLMxSr8gdHCPP
	os8TBSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXTa-00000004uRU-3jb5;
	Wed, 04 Nov 2026 09:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXTZ-00000004uRM-3pGk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:40:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F2C760D96;
	Wed,  4 Nov 2026 09:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342E31F00A17;
	Wed,  4 Nov 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793785212;
	bh=AH9jbyRyqYQM8uXEqlVbbyuWAkQCPVJGJ6rXheEFJ/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RqUIW910dsKAi0PXWO/dMXKS3N7RyvNVQ4qmdXxmLKX5SERn0RLcNeLf8bOQ9WSik
	 ThX4WduNIwDacCxsUSk7lkHcG0W2MO0+cRuMKrsm7ztdTcNfSYfjzYiap8PxHlH+tY
	 9e6QpxChceyBUVV9u/TWPN5U6sdRdW6yfZJfGXfiqevDx+TiqxOA58Io8AShz0qkAd
	 OTMI93uhbQsXCEegJdvz7jp7TJmsmuT4dUt0MsLUEpeuSYlliDzr8t1sjvZE7MlsPm
	 Fuv/IP5YdByBjn1Si7evZHCb3cc9wv/UXxpg6WX1n+L1JJpREEGujQKxFOxF9rj/Rb
	 zUdMFPEEBpGPQ==
Date: Wed, 4 Nov 2026 09:40:08 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH 2/2] ACPI: FFH: Support FF-A direct request 2 calls
Message-ID: <20261104-poetic-durable-jaguar-cdf3ee@sudeepholla>
References: <20261103173907.1996118-1-sudeep.holla@kernel.org>
 <20261103173907.1996118-3-sudeep.holla@kernel.org>
 <20261103211136.4122648-1-jamien@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103211136.4122648-1-jamien@nvidia.com>
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

On Tue, Nov 03, 2026 at 01:11:36PM -0800, Jamie Nguyen wrote:
> On Tue, Nov 03, 2026 at 05:39:07PM +0000, Sudeep Holla wrote:
> [...]
> > +	if (!acpi_ffh_ffa_version_negotiated) {
> > +		args.a0 = FFA_VERSION;
> > +		args.a1 = FFA_VERSION_1_2;
> 
> Same question as on the earlier thread: how does this work if the
> transport driver has already negotiated a version?
> 

Handling this coordination is difficult, which prompted my earlier query about
requiring v1.3 as a baseline. On ACPI platforms, this initialization conflict
is already an inherent issue, as the UEFI or early bootloader might negotiate
a version before the kernel FF-A driver probes. I welcome any feedback or
proposals on how we might cleanly resolve or track this pre-negotiated state.

> [...]
> > +	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_PARTITION_INFO_GET_REGS);
> > +	if (ret)
> > +		goto out;
> 
> I think REGS is only needed when X1 is zero, and if I understand
> correctly it's optional at the Non-secure physical instance. Would it
> make sense to check it in the lookup path instead, so an explicit
> receiver ID still works without it?
> 

That is good point. I completely forgot why I didn't add this check in
the RFC patch. Thank you for catching it; I will make sure to include
the proper fallback implementation in the next revision.

> [...]
> > +	memcpy(&args.a4, &buf[4], len - 4 * sizeof(u64));
> 
> I believe this would trip FORTIFY_SOURCE's field-spanning write check.
> So I suggest:
> 
> 	memcpy((void *)&args + offsetof(struct arm_smccc_1_2_regs, a4),
> 	       &buf[4], len - 4 * sizeof(u64));


Apologies for the oversight, as I remember you pointing this out before. I was
rushing to get these patches sent out, but I will make sure it is corrected in
the next revision.

-- 
Regards,
Sudeep

