Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA2AC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW/mSodAbyY4X5hSzjHvse9R+Jd5fudj6Q6V2BAm9Cw=; b=Sg9UeIvolXG2xWUM1EcyXPMGlo
	X7woDweS9Y5dqMVWMfm9bUE7Zai4zVolKN4zEBsnUA83Xe3NCMCuZrdRVJfuGpyg2EFaIq5vaAGtU
	vCeSRqu6PTEJaT4Fs+co5dkv5fdlHCwkq1AztRcgi5hL50/WnnWwJ+wxvjvZmgoL6N/VaO5L7h6oR
	gaX13Np6FzL1Pn46Ke/V1/e9/pChw2hl0BslRaIusGMLxY6yZPhzzp4u8pGgk99XieUQi1lqIm+E1
	u02obotcgoECbI9YT5DreKNKHssMgA9FADTFuY1XRfEkSL2A4kKBrWc1XnuK9BB3lSjRxDO49mg2P
	g9d1r1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduWD-00000000Lbc-0vkH;
	Mon, 21 Jul 2025 17:41:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtss-00000000Gbf-3GT9;
	Mon, 21 Jul 2025 17:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7F345C5F31;
	Mon, 21 Jul 2025 17:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D047CC4CEED;
	Mon, 21 Jul 2025 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753117261;
	bh=h1oejTOcfn/FE2b+ejcQflWVFtGGLIORTNGbuq1sNOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUEzYCpk6R0hOoLdylSHY9tzBvWrPk7MG4kTCcEuyTLuXsy5JbkpMw7I64vt8uJAt
	 QFQZigkgYTI0hFOk/H+Gx18kPZn7qsOtQ6MQdTygt+QDY1v9zGHnyPEBNO9ibWpWki
	 OOZsYOy1kjXnH5n/Jwo7PQyxmnJn/XmMyUVJtU9LBTgI1iwvPbysL7sztT8Iq+hh4o
	 0FpRNDxxuEzG6xEYzOIE0LejGHj/u7T/Rr5Tm3CE7zz5hs6yiehrTQj0QcIQ3E3A5w
	 e4nVjMb8VUM+BvOhw7L3iLfnrb0gYSyA+2WZrKaU2Q6t3CDWmG54JwayRUH1Q5faWg
	 yGE4xjbIXAVMQ==
Date: Mon, 21 Jul 2025 18:00:55 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v6 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <aH5yR9CkYSJ4PaZV@willie-the-truck>
References: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
 <20250710082450.125585-4-benjamin.gaignard@collabora.com>
 <aHTzPwTob8_5rtBS@willie-the-truck>
 <baa1fcde-f167-4a1b-afca-0a2957a688cc@collabora.com>
 <aHozv0NG1OBlAH6c@willie-the-truck>
 <b4169471-fcd0-4415-8281-c5bd722e5f2b@arm.com>
 <aHpQXy-bnwW56rCn@willie-the-truck>
 <20250718141401.GD2206214@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718141401.GD2206214@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_100102_903306_C35BF490 
X-CRM114-Status: GOOD (  25.87  )
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

On Fri, Jul 18, 2025 at 11:14:01AM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 18, 2025 at 02:47:11PM +0100, Will Deacon wrote:
> 
> > Just because the existing drivers are a mess doesn't mean we should
> > proliferate it!
> 
> If you want to insist on something here it should be for this driver
> to use the new generic page table code I've written.
> 
> Otherwise I don't see the point in trying to improve this in some
> lesser way.
> 
> If this had come in a years time I would probably insist on that, but
> right now it isn't merged yet and it will still be a little bit before
> people have time to review it.
> 
> Perhaps a compromise where Benjamin comes with an iommupt format
> header that works for this and we can progress this series and be
> ready to swap it out down the road?

I went back and applied the verisilicon patches locally so that I could
look at them side-by-side with the rockchip driver. Even then, setting
aside the generic page-table code (which I agree is premature to start
insisting on for new drivers), the callbacks for .default_domain_ops()
are very clearly doing the same thing:

.attach_dev:
	The two big differences are that (1) the VSI driver has two
	locks instead of one (and it makes me wonder about the RK
	locking in the IRQ handler and suspend/resume) and (2) the VSI
	hardware has a TLB flush register whereas the RK driver does
	a disable/enable cycle.

.map_pages:
	Basically the same but note that the RK driver _already_ has a
	hook in 'rk_ops' for decoding the DTE

.unmap_pages:
	The big difference here is that the RK driver has TLB
	invalidation whereas I don't think the VSI one does. Yes, it
	implements .flush_iotlb_all, but that's not used any more (and
	we should probably try to remove it again).

.iova_to_phys:
	Same comments as .map_pages.

.free:
	The only difference is that the VSI driver has to free its
	single-entry top-level (the "PTA").

and so moving these somewhere where they can be shared just seems like
the obvious, straightforward thing to do.

Will

