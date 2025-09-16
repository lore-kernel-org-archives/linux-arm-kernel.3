Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F34ECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ8PeabKOCTsDIKackA5xstIwzMCpNSnD2chhGCZ2EQ=; b=maWQpuYyIsCj5ZOo4juUVmLzH9
	WMylpT0YTk8PnjYAzcXAXMYPXEhDDrZwRK5Pv9yvvydukdXPC1pFanqQ3Op0jDW94qMC6iM2KApCL
	CekqT3+6Fh0FnxWc0yR9xp88gEmSpMC48yV/kqj//s7unj6k2P8c7SzaePgK1mnaa8fB1/gFUqphY
	wBD9IQIWyob1whj0WDdoTFalcf3X/q7WpFvela7GhTm5JCNraQ6uwmJCV2Rzg/9sBNutyerfHu1Xq
	4mwAjSul+EoGz0kqeyCjifK0dMrkeRp7vvMLvEmaFEIcwZP557YRKZTM8Gc7Wu6LUCvkCox06ELSk
	5kP92aDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRMh-00000007Fqs-1ji5;
	Tue, 16 Sep 2025 08:48:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRMe-00000007FqP-31d1;
	Tue, 16 Sep 2025 08:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00B9F44C2A;
	Tue, 16 Sep 2025 08:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88BFC4CEEB;
	Tue, 16 Sep 2025 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758012519;
	bh=gBC89acRt2ZWThI6GiBXUA4qAUTNm8vCd8qyDvzjiZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7LdLz0vXRu1QDRO3ZuQvA3+jqh3JxhTQHX8IW4VHNOE6jLAJTC8Gk87eluIh4jMT
	 bli4cXARt8ZQ6n6iqCiYQqtVy69DTegtOxc8LKakwQKUEqA2ZHBE2k+mYufiJ3o/h7
	 qesqNhorL9QrNX78rRFFprSYoXlFml9tgAj1rkmlm6pyvZupIiXfDuOty7eTB9qDqo
	 CouLVJhpNf8Pm+Q7rzYldmyitAeHqbukysVTR/mjP/u05hEnXKBbZCt/KRGpHXsHfJ
	 +n8uUiWSVq10XIvunL3dTV/12Q4aEpBQsfBiiIxiFvqrecpRpSlZT0oZuc1Pk+VoTO
	 +1DIAmhw7/dug==
Date: Tue, 16 Sep 2025 09:48:33 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aMkkYU-p2ouknnAc@willie-the-truck>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
 <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
 <20250915225806.GM882933@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915225806.GM882933@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_014840_802841_C7D9D6B0 
X-CRM114-Status: GOOD (  24.75  )
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

On Mon, Sep 15, 2025 at 07:58:06PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 13, 2025 at 07:58:04AM +0200, Jörg Rödel wrote:
> > [Adding Will back to Cc]
> > 
> > On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:
> > > To me this rejection isn't about Benjamin's driver, all iommu seems to look
> > > alike, so anyone else that would have sent new driver would have face the same
> > > issue.
> > 
> > This is about ignoring comments from one of the IOMMU maintainers. I am not
> > going to merge a driver with open comments/objections[1] from Will (and a few
> > others), so resolve this with him and get his Ack.
> 
> I would strongly object to trying to share map_pages, unmap_pages,
> iova_to_phys, free and other iommu pt related functions in some
> limited way instead of helping on the much more complete iommu pt
> work. Which is what I said to Will, but for some reason he suggested
> it anyhow.

If the answer is to convert this to iommu pt, then so be it. My
understanding was that was still premature at this stage but you know
better than me.

When I bothered to look at this driver side-by-side with the rockchip
driver which, despite apparently being totally different IP (honest!),
is *remarkably* similar, I summarised the similarity in the default
domain ops:

https://lore.kernel.org/all/aH5yR9CkYSJ4PaZV@willie-the-truck/

But rather than respond to that, Benjamin just sent a new version. I
was hoping for a bit more discussion...

> Sorry, but it doesn't make sense to complain about duplication in
> drivers and then not help advance one of the biggest projects to
> actually concretely and comprehensively address that duplication.

I don't think it needs to be one or the other. afaict, these drivers
should share the default domain ops and if the page-table code is using
iommu-pt then that's even better.

Will

