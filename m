Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB0BD2F024
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drRx2SqfbaK5PNp/rPvvkzqlNVfAxYsbBu8xT8DC8tQ=; b=EDEJpMrLyL5BN7vPeR/3weii7G
	z+MFfUML4vJat+bioJ+j/eVjz/2fNRRq7OsY3GlX7imBsZt5Uq2AUDaKi45xwEo1BNmOPSSHcjtZz
	oKt0VNcboHtKCAnJki0w2YBWzn2+vYxQnx4zaOcUgRN7FZtlFmI9fC0GQDJM61eQu3QHP3wInxaUa
	FNpfqbxJ8agcc7eVnVlSGyFrNyMoZ2fO7X1J8kCqC/rDc2PDVlNw1I6ZRc/0DB7wrq3DKTPfMMjUu
	PhVj72A8UQq7WYImK+mJcEFUn3pSEESqCz3crvSxlFMGKGPDQpCTF9ApCHeGmN8q+f3zRKgqnrkxv
	nTPPUARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiqT-0000000EIAm-09JN;
	Tue, 27 Jan 2026 13:11:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiqQ-0000000EIAP-2nN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 201674021B;
	Tue, 27 Jan 2026 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82885C116C6;
	Tue, 27 Jan 2026 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769519457;
	bh=FoR/91tcqgCb9bTR8L2/y9tPEOUImDArbq74MY9GZJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdQ1q9QI17PW5NfnHxAzQjLhh2LExwOy9wC8v76Gio946pTDCJGZw6O6ena8Z4Vrv
	 6f66Lrwt+Mg4kSVYPERTLDCAgheP2gyrLLLscUdmb8mIBPSZREnqMdx47x7ttlMSD5
	 cf3WeQC/ygUsSJv9wNsO0wA2DESJGH3c5BCr/X2ArvuVqx8VBGaoubchiESdkpnIF3
	 9GmjcShtAejjI9iHc6BGiVIhJ6Ij6q6xm4KoKUaiHLzLtzcROjd1hbgMFQXApwZLNL
	 I2DnPaScgVCVfwYW2O7qO2ctL/0uilMDBxYwd8mKMEJOfXTXpuivqxxQIK+FBkq1dx
	 2dHlmuo8pLNrw==
Date: Tue, 27 Jan 2026 13:10:51 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH RFCv1 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <aXi5W-7b2odQQtqy@willie-the-truck>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
 <aXdgljWHHPVMTmya@willie-the-truck>
 <20260126172020.GP1134360@nvidia.com>
 <0a60797a-fbb9-4a83-adc6-ad62baf5915b@arm.com>
 <20260126190935.GV1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126190935.GV1134360@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_051058_744322_F49A6DB2 
X-CRM114-Status: GOOD (  24.14  )
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

On Mon, Jan 26, 2026 at 03:09:35PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 06:49:07PM +0000, Robin Murphy wrote:
> > (assuming SSIDSIZE > 0 and it does anything at all - note that strictly we
> > cannot assume this bypass trick is *always* possible, since an SMMU is
> > permitted to support ATS without supporting SubStreams).
> 
> Yes, I think Nicolin has captured those conditions in computing
> it... We don't have a logic to disable bypass in that case though.
> 
> > > So, I think a CD table pointer to a fully invalid L1 table of at least
> > > size 1 should be OK?
> > > 
> > > Or stated another way, why would ie be OK to have a 1 level table with
> > > an non-valid CD table entry for SSID0 but not OK to have a 2 level
> > > table that returns non-valid at the first walk?
> > 
> > S1ContextPtr itself is reachable since S1 is enabled, so it cannot point to
> > nonsense. But the S1DSS==Bypass behaviour does state:
> 
> > "Note: Such a transaction does not fetch a CD, and therefore does not report
> > F_CD_FETCH, C_BAD_CD or a stage 2 Translation-related fault with CLASS ==
> > CD."
> 
> Yes
> 
> However, taken together:
>  * S1CDMax is set to substream 0 only
>  * S1DSS is set such that "does not fetch a CD" for SSID = 0
>  * SSID >0 doesn't fetch CDs because of S1CDMax
> 
> Then it seems to be saying that it will never use S1ContextPtr? ie it
> is IGNORED?

Right, I think the critical question is whether that setting of S1DSS
(0b01) means that STE.S1ContextPtr is considered "invalid". The spec
doesn't call this out explicitly but the "translation procedure charts"
seem to indicate that it doesn't use the CD for anything...

It would be good to get some clarification from Arm about this
particular case.

Will

