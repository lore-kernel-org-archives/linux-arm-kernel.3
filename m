Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526B7C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 08:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3B6GkoF4/TUzTqGKurnKW93IpQpwd5TQSP6kcfbI30=; b=cTyAwPqc0LSbLz+ahSCPDk/t/Z
	RTP/l5l6lDFs+83pTU0/58SmOdbXfTKQAj+2sfiZu44WE8ymZ9YPT2e0qJKWtxvN91/lhShyN5QLf
	OIwlFKpG8Xv58kBJFLPsOMB1vktd09caytK5k9bo5LKYyH41b5P1uZtFnPLRbKEdfEEgWwbciXWHz
	tHNCs28+6LGgDaDn0vubKnvlO0WQ8kzXlzXmhuAfSrIIGs8dhRRx78E4niFIw2pFCCGyHl+qRuOET
	JJKPwf3AzYwh+HDwA80C17ewGqegGF18gugAXvLsShpZnpO/4F3vR5qyYsqwj3m+GKGYD2iiV/cmU
	TDRnzjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwrH-00000005fnO-2wHy;
	Thu, 06 Feb 2025 08:03:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwgQ-00000005eQF-0EUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E665A439F8;
	Thu,  6 Feb 2025 07:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C493C4CEDD;
	Thu,  6 Feb 2025 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738828340;
	bh=88KiQixzKQj5rRXEekbKnJmhNWTZtXqiwpRxpjLPSJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s/04mWHLv/q0fTizs8GnPLLAN21F3yucrVtVGTFut5UMv/abPKUv6mx1R+nfI1F86
	 NYoh/PmmwupjFT8CL9zWItndkNSsA1RSpozAdPa+MRDLFXrkFaEQQgCR172XSZRqpa
	 YUqUWLrX2t36zIOACa4NI6+RI8Z4OUDjcNgySxeo=
Date: Wed, 5 Feb 2025 23:52:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Uladzislau Rezki <urezki@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Ard
 Biesheuvel <ardb@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Steve Capper <steve.capper@linaro.org>, Kevin
 Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/16] hugetlb and vmalloc fixes and perf
 improvements
Message-Id: <20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org>
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_235222_168902_4ED51F8A 
X-CRM114-Status: GOOD (  13.06  )
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

On Wed,  5 Feb 2025 15:09:40 +0000 Ryan Roberts <ryan.roberts@arm.com> wrote:

>  I'm guessing that going in
> through the arm64 tree is the right approach here?

Seems that way, just from the line counts.

I suggest two series - one for the four cc:stable patches and one for
the 6.14 material.  This depends on whether the ARM maintainers want to
get patches 1-4 into the -stable stream before the 6.14 release.

