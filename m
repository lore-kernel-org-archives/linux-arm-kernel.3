Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929BFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujYRedhk5lwMgFqV8/GJR30PtxWyUV4s3ZYme0N6EKc=; b=jyaSSzV15KTyhkjEfHwWTJryuT
	KuCkAGS90gKzPZGjbWh/BvoOR81YBJ8MrVI8nsLL2xhSeS5B+N5s1/FKYCB5BcYXbaSdbRZ69KYOb
	2kXhNsS7DzL2spasQqA/6EEKaj3wegfWgmiu3FrP1APQLq0WlebxYnMvAfyDlBZqkPDrp9T16wie9
	jBtDjwe3y4NnyQ42nnJdfpO5/18KzU/4jCJwoj70UmA8mbi5d/Y0U2u+FYV2J4x1APxpdcijEr5RR
	L87FLK6LcYm57BAA1Y+coDJWMCth0EpGXu/DbpXI1KZS1GU2LkinS4/LcW6yCqKfGIm+CaSyP3mC/
	iUoRkjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMJD-0000000Clxo-1UXb;
	Tue, 02 Jun 2026 10:25:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMJB-0000000Clws-0nkG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:25:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB25B406C0;
	Tue,  2 Jun 2026 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8761F00893;
	Tue,  2 Jun 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780395916;
	bh=ujYRedhk5lwMgFqV8/GJR30PtxWyUV4s3ZYme0N6EKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaE2y1B9bNcNJz9ygk1tsvahF/A9NwlIdtilgqw3HNl3s6OCq4NeFGSCkPstpjy9l
	 TJZd7CMWDPU8AL9wv3CiUwvS4ceuH6QCe2vYxCRFY5VjSWI4qnzER0h221cUtYuXiE
	 5TQzdE6xAVDTa3SEb5XlA2cyIIaeVAT6nIsoO/p8G8iWZu20KUd8Qig2dg5QAvZpR9
	 7rn43/EdyDhN+kGlNCFCpRF7Z7rq04vgwwST7vzHqkFnQNxyqls52tD/1SvBqdM+0k
	 wLDM5Xkrt5uPZC/YwBiJ7NvKHYHOCjwC6UL8WwYSJ52Dc8emF/urX9i0fZ1GxoIOT7
	 VsKiVnZPlw/8Q==
Date: Tue, 2 Jun 2026 11:25:11 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	robin.clark@oss.qualcomm.com, joro@8bytes.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu: pass smmu->dev to report_iommu_fault
Message-ID: <ah6vhy58ztNm0Nlt@willie-the-truck>
References: <20260517005052.3783378-1-shyamsaini@linux.microsoft.com>
 <83e27ae0-870e-4bfe-806d-2c2f21a719df@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83e27ae0-870e-4bfe-806d-2c2f21a719df@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_032517_251322_ED76CC18 
X-CRM114-Status: GOOD (  15.66  )
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

On Mon, May 18, 2026 at 06:00:14PM +0100, Robin Murphy wrote:
> On 17/05/2026 1:50 am, Shyam Saini wrote:
> > report_iommu_fault() passes the dev argument to trace_io_page_fault(),
> > which dereferences it via dev_name() and dev_driver_string(). Passing
> > NULL causes a kernel crash when the io_page_fault tracepoint is
> > enabled.
> > 
> > In arm-smmu.c, 'commit f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")'
> > replaced a dev_err_ratelimited() call that correctly used smmu->dev with
> 
> I'm not sure it was really correct - it's pretty clear that "dev" is
> intended to be the client device that _caused_ the fault, since why would it
> make any sense to pass the IOMMU device to some other driver/subsystem's
> fault handler? (Yes, other IOMMU drivers already do that; I would consider
> them just as wrong too).
> 
> IMO it would seem more robust to just fix the tracepoint to handle a NULL
> "dev" in the case that one can't (easily) be identified.

Yeah, I agree. Passing the SMMU device just because it's the only thing
we have is just a bodge around the NULL dereference. We'd be better off
hacking include/trace/events/iommu.h to print placeholder "(NULL)"
entries when the device pointer is NULL.

Will

