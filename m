Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4138CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Llg3IqMEvH4DcirkFP4GrJia4Ypd1f7p2AzxWn43Txw=; b=Es0SPBS5tqR3gtHYgR/LywO0kp
	nkjt7OliDb7r+K/wunbOzSErmocVZf8Bpor2LL3lizg696wiUGjhQmMhQ22WKwgbFTnJIhxFTyuVq
	oywFqRml6SqqGFs1nskhc4TY7HF0lDrYOOkt1DCGML7+a85j12iyzu1Pf0/On+vh+YesI+p4nZjxo
	RFlJ0EfriEB7V6GMa3a0dxySITyuZNk7yzqio29AE2Cni2OirnB06IIjG9UUPpwarvvMsXgecZGbN
	ed8xUYoE/YxQ1qcL3z2kMIWsLDwIHha+qloXxjuHjZdejB8sL7Rb3HhTyZr222eBsoPYSvvufEz+U
	mgGB6WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQXu-00000009E4f-2qWj;
	Wed, 12 Mar 2025 18:11:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQWF-00000009DwU-1lqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 18:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41CA9A47181;
	Wed, 12 Mar 2025 18:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C21CC4CEDD;
	Wed, 12 Mar 2025 18:09:23 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/8] arm64/mm: Drop PXD_TABLE_BIT
Date: Wed, 12 Mar 2025 18:09:21 +0000
Message-Id: <174180295545.4162360.4956385573664588446.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221044227.1145393-1-anshuman.khandual@arm.com>
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_110927_527610_5F01AA6F 
X-CRM114-Status: GOOD (  10.63  )
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

On Fri, 21 Feb 2025 10:12:19 +0530, Anshuman Khandual wrote:
> Remove the PXX_TABLE_BIT definitions and instead rely on PXX_TYPE_MASK,
> PXX_TYPE_SECT and PXX_TYPE_TABLE. The latter versions are more abstract
> and also include the PTE_VALID bit.
> 
> This abstraction is valuable for the impending D128 page table support,
> which doesn't have a single page table bit to determine table vs block.
> Instead it has the skip level (SKL) field, where it will consider 0 to
> mean table and any other value to mean a block entry. So PXX_TABLE_BIT
> therefore doesn't fit into the D128 model well, but the type fields do.
> 
> [...]

Applied to arm64 (for-next/drop-pxd_table_bit), thanks!

[1/8] KVM: arm64: ptdump: Test PMD_TYPE_MASK for block mapping
      https://git.kernel.org/arm64/c/0b626b245c57
[2/8] arm64/ptdump: Test PMD_TYPE_MASK for block mapping
      https://git.kernel.org/arm64/c/f5e93819e2cc
[3/8] arm64/mm: Clear PXX_TYPE_MASK in mk_[pmd|pud]_sect_prot()
      https://git.kernel.org/arm64/c/dba954801004
[4/8] arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT in [pmd|pud]_mkhuge()
      https://git.kernel.org/arm64/c/1601df9e366e
[5/8] arm64/mm: Check PXD_TYPE_TABLE in [p4d|pgd]_bad()
      https://git.kernel.org/arm64/c/4fa8a9c0fc99
[6/8] arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
      https://git.kernel.org/arm64/c/bfb1d2b9021c
[7/8] arm64/mm: Check pmd_table() in pmd_trans_huge()
      https://git.kernel.org/arm64/c/d1770e909898
[8/8] arm64/mm: Drop PXD_TABLE_BIT
      https://git.kernel.org/arm64/c/50c2726654bb

-- 
Catalin


