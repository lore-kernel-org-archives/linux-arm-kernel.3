Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2136ACA601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKOWnKBJbJXeo8x7ZpRmGUBbXlEBT0+pIRkZH0GNbaw=; b=tM/BJNpZMXPiq3IH874noYupr2
	eyfX54bVtiUQNEUYmEymfb3iyQJeB7xT07h9L/63c6T5vbdDVr2gJSL4I5CwNQtRk+I/xoPuTGmn8
	hlkUQq6pP9Km9+iFTtdKFkdd8Pw4zwef+k/5Lk3C9QtP4LXPEZgyuhYBITnUVwQm1PYQmXEZx3lO7
	ZHQzeaRecGkwnv+DMFwEMUzePurzv5JkREwRmTdeunWwZaSjJY/hq91MfBM5i7bs7LQG5xF5D4qlr
	NXbkEbj7tw08o5X7j8w8ap2hzDhBaQ5MyOdmC/npipLEBn8JkngIMlQZyvsm5O/mKHMvuMmiccvH+
	VKSMbmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3oC-00000005aoQ-3ND9;
	Fri, 09 Oct 2026 06:10:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3oB-00000005ao3-2247
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:10:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E918460DC3;
	Fri,  9 Oct 2026 06:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04D71F000FF;
	Fri,  9 Oct 2026 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526218;
	bh=EKOWnKBJbJXeo8x7ZpRmGUBbXlEBT0+pIRkZH0GNbaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ItDXhXo2lnHxe4Ty/4W3UyneDlSvPXkqY1slCpv+/7L44f/H4MflyLcIPg1F0NZL1
	 WxWCTDpohl1nagM2Mos1gx+t5J9XCO8EFZUQ449XxQrFF9mkSXJsscKKmdbAdguvWA
	 MQr75gWIvkmf7QtGuytNbx24zzZh0LgqxMvNHjTw2dPcyl/QaBLztME9BD5ZbtnIQt
	 Ch/4lZtWUQ2c8qAll6JMREHTy8zt3oRzdQXcIb2A1FtH39mJWx9mR76qQorM5G0Ro9
	 uI4WIYQYoQ1A4IuEgTxOymxp0leN25nseGB8cen3v6KvCzEEx1pZN/sOp/WbGcjOnB
	 p2J63HhwyivYA==
Date: Fri, 9 Oct 2026 08:10:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH] iommu/exynos: fix NULL pointer dereference on
 device_link_add() failure
Message-ID: <20261009-refreshing-squirrel-from-hyperborea-ea10de@quoll>
References: <20261009034539.3073100-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009034539.3073100-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 11:45:39 +0800, Haotian Zhang wrote:
> exynos_iommu_probe_device() stores the result of device_link_add() in
> data->link without checking it for failure, although device_link_add()
> returns NULL when the supplier is not PM initialized, on a dependency
> cycle or on allocation failure. exynos_iommu_release_device() then calls
> device_link_del() on that entry unconditionally, and device_link_del()
> dereferences link->flags, so a NULL data->link causes a NULL pointer
> dereference when the device is released.
> 
> Check the returned device link for NULL, unwind the links that were
> already created and fail the probe instead.
> 
> Fixes: 7a974b29fe5d ("iommu/exynos: Rework runtime PM links management")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/iommu/exynos-iommu.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





