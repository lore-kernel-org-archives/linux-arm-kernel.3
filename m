Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E4FCF58CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HTJMZU5A6kXrmWytCxaO95cgtDo5F6WqG5vGLqokbQ=; b=JCI5yhuVJSoPRdm9/FoiUKomNp
	RVdlyRp1H7jEB1QFAAlMkIzaX5S2HRxNLG2bPf+9FNNRt7DHbjXBs7d4TzLBfMSP4MimNKiMhIXbI
	g0zxxDmM3GDvysYJLjK7a5A4STBuvk//TALYSVKFea8MKUilsBELD2LtFuw97ZfpaIaH9ZdI2MizP
	/5RSZtXDnmuMdkFTKrdGDBJvayym76m1OOR1RCcO91nyjcWJKC7I8riIDZgpEM566U/DBL9n7XwN3
	FMt9mOW+TQFJ8pvuRnRWSli7NlBmbS+jbL19ejYAiFZQ5Ku/8/A5itkrsxfJKKKObOFgcUaDO31Ew
	zMGVTIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnbo-00000004uq2-0Hku;
	Wed, 19 Nov 2025 19:12:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnbk-00000004uni-3T0o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D6D743356;
	Wed, 19 Nov 2025 19:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27586C116B1;
	Wed, 19 Nov 2025 19:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763579568;
	bh=bjbS5c6QBCQhMSLNZyiSFoGDxCB/KqDWFIBeYfD831g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRrAZF5fWDGw5ziNk1qW0owFpHkrvRp09md5FyvbC9ox85pQvNPzEpS1JoNkyfS9g
	 UpqNjgL7+gPADjk8FP4QthEcYqrVgR6RPhOlLn6C3ThKqemnbn7qAZmXgHV0E1AF3s
	 jfy83EEkqQNN/XS41AsMPRCgl4Ef3JWTiKbze9LCLMtMTcQUitKnbxZaijlo0a/fcn
	 FWLsZJpb4ruXbXlEf9udvSwGkCcVSsxY2e25Zd2wxHF5wWk4Wqiue1hc7xZMMY/06d
	 RDTey05/00NQPqBR6CAoe64pxxXgyTMJEirB18lU5HSucVfYScd9Fmg9cpd/D2dW+R
	 /bVpmIK8poWtg==
From: Catalin Marinas <cmarinas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Huang Ying <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH -v6 0/2] arm, tlbflush: avoid TLBI broadcast if page reused in write fault
Date: Wed, 19 Nov 2025 19:12:30 +0000
Message-ID: <176357954996.2095484.7552035917547182661.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114085403.101552-1-ying.huang@linux.alibaba.com>
References: <20251114085403.101552-1-ying.huang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_111248_885269_0C6EDFAF 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Fri, 14 Nov 2025 16:54:01 +0800, Huang Ying wrote:
> This series is to optimize the system performance via avoiding TLBI
> broadcast if page is reused in the write protect fault handler.  More
> details of the background and the test results can be found in [2/2].
> 
> Changelog:
> 
> v6:
> 
> [...]

Applied to arm64 (for-next/local-tlbi-page-reused), thanks!

[1/2] mm: add spurious fault fixing support for huge pmd
      https://git.kernel.org/arm64/c/79301c7d605a
[2/2] arm64, tlbflush: don't TLBI broadcast if page reused in write fault
      https://git.kernel.org/arm64/c/cb1fa2e99955

-- 
Catalin


