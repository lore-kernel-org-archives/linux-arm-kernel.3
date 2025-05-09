Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D1BC3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwm9SBRK0k658OIyHzGxSSpL8ydG/vfzFLSrnn3n7Vo=; b=2SmA2VInmEKJV9jUqj/6lVF3Ve
	yOESmrJlDi+87tteuh+hwa2+0sR0dIuRBLmIIefMfOsEv4E7mN3KzAm8D3joxWkLPQfbLhovkdczM
	7JHqNb6OMs/yYASd/cF3lVXXZJlIacQ1eKKewd4s1s2H+TTWN+FuNBhM3loiKheDT6uiRho5l1Z0Z
	Z3TX1AFip0sE2p+s2NeB5Gm+AqPNBJDikNr7XVD1Y47aJtlOYQpCsppQ9oMdUUo3h0MYAZGHVvPP0
	jawLCcKENA3HUlQpqX38f2WakmB4FYx/xduyeM9E2mILfnNPi2IWDMnlXC37nfGjgn9lccZEonNd6
	PYYRTe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU85-00000004jOT-2trE;
	Fri, 09 May 2025 20:15:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPFH-000000041C6-2DIc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A838E5C6C87;
	Fri,  9 May 2025 15:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38004C4CEE4;
	Fri,  9 May 2025 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746802958;
	bh=7NskiScE5gptOGADrQReISR757xZmSnWMX0UyKOeZCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWQzY+hvdRs9Re4KDHntxug0qY5Ca7OwjjFfM2Dn7yZOCj6QK6lIfaqvNMQ4OIo3d
	 w87JJHVlm/5gF48Ytqb2lav051IsEnhc0mUdBnQG6VIWR/VBplOAZMLSIwVXaYDfBq
	 J5W1U8D2EqfTJkZrlE5RnxyNH+lAWNBi5l7k4NQxZ2njHf983SifjFK6mlksmZ+RS2
	 zTf8bJBT/+oCJt6zumU+GZxluzCGzPuCI0hcWgf/2GQjTGibVLVWYs2AckrZNWPW4r
	 lgoCSsj8pLyGn9/krfB6WCElwvcIeO8tY8PCJUuhrRM9NsiX1TO7NmGh472rnvCfrO
	 /JKGE0GOhqOBA==
Date: Fri, 9 May 2025 16:02:33 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Implement pte_po_index() for permission
 overlay index
Message-ID: <20250509150232.GA5984@willie-the-truck>
References: <20250415054442.2287891-1-anshuman.khandual@arm.com>
 <20250429151134.GB26272@willie-the-truck>
 <b07c1320-3140-40d3-899b-7c2b6e0d3c18@arm.com>
 <16ffa9f2-5ebb-4839-ab87-3c193ab9683a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16ffa9f2-5ebb-4839-ab87-3c193ab9683a@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_080239_614592_14E7DA4E 
X-CRM114-Status: GOOD (  22.56  )
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

On Mon, May 05, 2025 at 02:20:46PM +0530, Anshuman Khandual wrote:
> 
> 
> On 4/29/25 22:15, Ryan Roberts wrote:
> > On 29/04/2025 16:11, Will Deacon wrote:
> >> On Tue, Apr 15, 2025 at 11:14:42AM +0530, Anshuman Khandual wrote:
> >>> From: Ryan Roberts <ryan.roberts@arm.com>
> >>>
> >>> Previously pte_access_permitted() used FIELD_GET() directly to retrieve
> >>> the permission overlay index from the pte. However, FIELD_GET() doesn't
> >>> work for 128 bit quanitites. Since we are about to add support for D128
> >>> pgtables, let's create a specific helper, pte_po_index() which can do
> >>> the required mask and shift regardless of the data type width.
> >>
> >> You say:
> >>
> >> "we are about to add support for D128 pgtables"
> > 
> > Providing some context: Anshuman has a private branch that adds D128 pgtable
> > support to the kernel (it does not yet do this for KVM). I originally created
> > this patch to fix a bug on that branch, so the "we are about to add ..." comment
> > really only makes sense in that context.
> > 
> > We are not yet ready to post D128 upstream - there are still a lot of questions
> > to answer - but Anshuman has been posting some of the reshuffling and cleanups
> > that prepare the way for D128 where (we think) it makes sense. The aim is to
> > reduce the diff as much as we can.
> 
> Agreed. All these patches have been really harmless clean ups and re-orgs etc,
> that do not affect existing 64 bit page table management or its functioning in
> any manner. OTOH these changes help the kernel prepare for D128 enablement.

In this case, I wouldn't call it harmless clean-up. You're actively
removing the use of helper macros which is inevitably going to result in
churn.

Please teach FIELD_GET() to work with 128-bit types instead.

Will

