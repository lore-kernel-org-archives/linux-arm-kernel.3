Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B81AEA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1nL/5ruTLWXWmm1oZwROsAmjQKPkwhPsC9Nu9qN/dg=; b=iaDVAKfdjACaq0ILwZg0Vv+l4N
	eKkQYAXj+jhjilkFGPs9oiDoQrnc07BuGwPTD3n+gqoeECdwmTVxAEwk6pRhDTDgB8MYPZYNknpWs
	5kEQwct8Ywq0PKISkZHNrC7OiB0twJngnGuAquOhpLGsqln4sEMKiWS2M2vff/dlPdjZacdKRGxtP
	e90df5zRr1xn4hQNWdyU2+V6ePpqEDxPYCX/AIdXMw2xBo75LLcDUT5MGqO5aD+0BFh4RX30miDzw
	9bY2/rSZRAiU/DlXZ7T/4oEkqeGEqEVMwqpzaY854zbzSf03IVCmcHmKvx12a12GxcUmjAwdo2CGn
	TKEn0e/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoRM-0000000AN9v-0t6a;
	Thu, 09 Apr 2026 12:24:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoRL-0000000AN9p-3Ouw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE9BA600CB;
	Thu,  9 Apr 2026 12:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C7DC4CEF7;
	Thu,  9 Apr 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775737494;
	bh=+1nL/5ruTLWXWmm1oZwROsAmjQKPkwhPsC9Nu9qN/dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Or8EBxzrYN9MfDJbRvOtdt1enEsBiRhwf2xAmGCeGWnRbDgAjYyImwh4JZtV8/X4z
	 iCIhgIv/ATz1RUlDNVFXgBNAmPG6CjeP2vZA62UwGaFuXrldJBRg2nTR39TN0VocbN
	 /aaff+eUgpsF0JAaMsj+cJ7GYU4N+A1j+REfgSDn6pRjXrxOLDHTH8C/TLNFrHkefo
	 /4cVI/CE5qTfHfDV7QoAnlMEZoElWGRAt9aIYrXQWGiOhoZEhm6nkFXdHQi4e1/q8J
	 AR+IlbUocInVVkhp8YaAbRTjvEw5nihRwhidGTBGYI1TdNmLnYGpKXGNtRIbjz1vFp
	 kDLjIk95LJJWQ==
Date: Thu, 9 Apr 2026 13:24:41 +0100
From: Will Deacon <will@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Robin Murphy <robin.murphy@arm.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-ext4@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	dmaengine@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
Message-ID: <adeaiSAnkaggqPsA@willie-the-truck>
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk>
 <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
 <adZ9grUg71f518Fg@shell.armlinux.org.uk>
 <adZ_ZmjcE8S22vR1@shell.armlinux.org.uk>
 <3a1d0520-3402-47b2-9d7b-4e14a3cd07a4@arm.com>
 <adayAMR_dEA6W5vW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adayAMR_dEA6W5vW@shell.armlinux.org.uk>
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

On Wed, Apr 08, 2026 at 08:52:32PM +0100, Russell King (Oracle) wrote:
> What's the status on the iommu fix? Is it merged into mainline yet?
> If it isn't already, that means net-next remains unbootable going
> into the merge window without manually carrying the fix locally.

I'll pick it up for 7.0 in the iommu tree.

Will

