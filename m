Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F145CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcrir+g3vTkBKXXW4cwammW/9LshAbzsNVNZiUPPreM=; b=bWcKJ1ZP5Jd4FRmyQPnigDnAQU
	Wh019yYY0DRdSp9pU5d/rOMJ5BRbVMhucOvGJ4F9Ak+MphZygH8ZspKA2rSXnxMvw5kAlssyPRkwK
	sRwPPyG5YNUYe+yFq/haiK67hTHDiou+trg1zk6+UY3pnjS7qarh3Gn6ZEoj1W+4aLwty+OAX7G5f
	8B7jQJODpERqQ90gckwnDgK/UVOE5ryONuYk10GXjAk2e7n0pV4bcLhJEQaYejwBq7gWUbH3ZWngX
	6IeXj5yMSsUtd0hZDC1/sSlW+PBhNOsRGWoSYJhZ6987fWsezl9zW/wHMXkStEF0MCB58QeCFfZKU
	nm6VXTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMCC-0000000Epna-3wMc;
	Sun, 04 Oct 2026 13:24:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMCC-0000000EpnR-156p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:24:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE24F601F7;
	Sun,  4 Oct 2026 13:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3134D1F000FF;
	Sun,  4 Oct 2026 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791120241;
	bh=hcrir+g3vTkBKXXW4cwammW/9LshAbzsNVNZiUPPreM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvVcxO0VFB7fHrYMpf/mmT14Q+zq2eT30yYrlKWtkHp4HdzAu1/Zh7joOZ9O5ktes
	 gyTFXODD3zmenNVGO86zG0YJGf8NzP3JMJGRhgVuqK/h7dftn6RjgId0sV1/k2ftL6
	 7HUmVwZeBkQvfPiqvEVHR/+9yIfJvbrrZo27xwYuEhHefMO4XSpEy8WVyCWz1+/i46
	 Sg7MvOnd4oXBdWt9/E6bbmKHV6le4nw4AQTaSwVD4nu1RRcEMa6O7cTU7EuqcUMa6x
	 tFjf+vjvEhkoSPXxIuqNuIEt0iPDioE1pknwOfvtWbBsyjVEOK6JZyI0sMUIgiGzHV
	 vQw0X79UXL26w==
Date: Sun, 4 Oct 2026 14:23:55 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 02/13] iommu/arm-smmu-v3: Make the ASID space per
 SMMU instance
Message-ID: <asJTaw0lU9cRN4Gk@willie-the-truck>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <782e24224c916ad0f48de1a49c139e71c8db0ef2.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <782e24224c916ad0f48de1a49c139e71c8db0ef2.1788130528.git.nicolinc@nvidia.com>
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

On Sun, Aug 30, 2026 at 04:18:03PM -0700, Nicolin Chen wrote:
> An ASID tags the TLB entries within one SMMU, so two instances can use the
> same ASID without ever aliasing each other. Yet the driver allocates them
> out of a single global xarray, which makes the instances share a space that
> the hardware keeps apart, and lets one instance exhaust the IDs of another.
> 
> That global space is a leftover from the BTM support that shared ASIDs with
> the CPU. Now ARM_SMMU_FEAT_BTM is never set, nothing looks a domain up by
> its ASID, and a domain is pinned to one SMMU at the attach.

We probably need to figure out what we're doing with BTM. Over at:

https://lore.kernel.org/r/20260907184513.GA2543240@ziepe.ca

Jason was talking about bringing it back once the remaining invs stuff
has landed. If that happens, what is the correct sequence to allocate
the same ASID on every SMMU instance after these patches?

Will

