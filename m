Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3FC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uEp3AUGxuBoh9kZZQ7SWjbI2WiQzmsS3lDWalc2xI8=; b=vEXAKZ9qBNXTz4hLYjmABCUJl2
	qbhvhvqmigPslq2B7lecBpaGaf+rsxlFf/oTBeC2dxSIE7bhTST25oIObTdlynmOsZIo+UmHngAS6
	tgYNkSnviezbqsuFApGnhi3rsdjJc2+hdv2hZEZDrQrT9CFSKhB+Jy+kUMZLkmk3szZs/jA+AkGUu
	usnlVC+ss/p7Ex7pbUSUbY/vH+pIn/+27lLhwpu1wscWExj03jsWgVp/90ErKAIo7/wDgIKM1z44G
	yI26OwzntjqKqEMCJRruoCCYlskNztiy2BZq3j+Ywz87QwSUkaqFKkByeKUcZpX5xj8Wywp+18/2n
	EgLhp9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYovJ-00000003310-21yB;
	Mon, 07 Jul 2025 16:42:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoM7-00000002yFw-05ux
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:06:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 597F31762
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 09:05:52 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B4643F694
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 09:06:04 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:05:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <aGvwZn_EZNnwtxpZ@e110455-lin.cambridge.arm.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101134005.GA109739@nvidia.com>
 <20241104113237.GA11481@willie-the-truck>
 <CAE2F3rDcq-BQYM1yYq6RNSYSOovdoyRcbYw8Jy+BXCHLkrWN3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDcq-BQYM1yYq6RNSYSOovdoyRcbYw8Jy+BXCHLkrWN3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090611_107308_9D8B79DB 
X-CRM114-Status: GOOD (  12.42  )
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

On Sat, Jul 05, 2025 at 01:12:09PM -0700, Daniel Mentz wrote:
> With the removal of arm_lpae_split_blk_unmap, I believe the following
> macros are now unused. Is there any interest in removing those as
> well? If so, I can draft a patch.
> 
> #define ARM_LPAE_PTE_ATTR_LO_MASK (((arm_lpae_iopte)0x3ff) << 2)
> /* Ignore the contiguous bit for block splitting */
> #define ARM_LPAE_PTE_ATTR_HI_MASK (ARM_LPAE_PTE_XN | ARM_LPAE_PTE_DBM)
> #define ARM_LPAE_PTE_ATTR_MASK (ARM_LPAE_PTE_ATTR_LO_MASK | \
> ARM_LPAE_PTE_ATTR_HI_MASK)
> #define iopte_prot(pte) ((pte) & ARM_LPAE_PTE_ATTR_MASK)

Yes, I think these can be removed as I cannot find any users.

Thanks for offering to clean it up!

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

