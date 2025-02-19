Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1923BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teFEEY27X3Zb4o9qYoLcaC3DWikKd25qT1PCi5W3oTM=; b=sT4tN0K+G4iBm+QwlUMgqZR2HY
	pkx89N4tolizxv7qxrtVDj7fa6qUewRODX/e4raTDWSegB+y9/TGCPU6Jfz+cFPoZxIcpEgKDU9BM
	gZAPufyUsUq50ZXiYgwnPuKWFpbKNkFTOFMtCDymNFRN3Rkmyz6vyyDfcJVd7nNBxZkFBh/gvZy76
	TpCsfbR47dv0LInpwe0qybij5jdADJc4bCl5Ik+E5BZE73plPDxqmL+uujVcwmwDzmN5Pyq2UkViZ
	gcw+9oVqi+8kMemgTe2SQMpnNmQ14osK1FNCTQTGpDxSpgs3FiaWm2MLhhu7nMQXuPQUWTSMTTkRL
	7hz+4LwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkie3-0000000CWyo-28OV;
	Wed, 19 Feb 2025 11:53:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkicZ-0000000CWa5-39wm;
	Wed, 19 Feb 2025 11:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E51DA41E00;
	Wed, 19 Feb 2025 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C01EC4CED1;
	Wed, 19 Feb 2025 11:52:03 +0000 (UTC)
Date: Wed, 19 Feb 2025 11:52:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/ioremap: Pass pgprot_t to ioremap_prot() instead of
 unsigned long
Message-ID: <Z7XF4Y3FIbSrSP9u@arm.com>
References: <20250218101954.415331-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218101954.415331-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_035207_855034_CD177DD6 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, Feb 18, 2025 at 03:49:54PM +0530, Anshuman Khandual wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> ioremap_prot() currently accepts pgprot_val parameter as an unsigned long,
> thus implicitly assuming that pgprot_val and pgprot_t could never be bigger
> than unsigned long. But this assumption soon will not be true on arm64 when
> using D128 pgtables. In 128 bit page table configuration, unsigned long is
> 64 bit, but pgprot_t is 128 bit.
> 
> Passing platform abstracted pgprot_t argument is better as compared to size
> based data types. Let's change the parameter to directly pass pgprot_t like
> another similar helper generic_ioremap_prot().
> 
> Without this change in place, D128 configuration does not work on arm64 as
> the top 64 bits gets silently stripped when passing the protection value to
> this function.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Co-developed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

