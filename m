Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622CCE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5ejaeb3tUK5PpYvNkiHqlTIchJ3J7cv3zPdysZWCz4=; b=nMWAv6PZItXI8KrWy1IR6eMykz
	lxfrKO5yPmvDl92xPtUJCC2NE5nYWTuCGwKWnFBbfGNX+gb0ArlTX6iiDGwMzyqWpek2+pv7113mi
	cszT/O/HUpTYpCvQzS/7T9ssILetG2ZVUxKtUMbvufcSH3AVjJK+KnAWfgqlI1iWnUgPJNO3YRwU+
	57BFZvkJy+zzlUnxAsonmHMk7LdUp+GKzuG4NAqD6icVIcgFt9NI8DZRbXSPIANbsp/WN4xb7rXjU
	DFK/9P0luWsGYN0pqpoEWelDr51L0nD/ovo6x2Qkgoo7LPN5w0C4DB3SuA7kJ7cXA2UylBmECS5xz
	rNZU4QeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrNy-0000000BoW6-2iVn;
	Thu, 09 Jan 2025 12:11:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrMl-0000000BoES-0AR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68E435C5AA1;
	Thu,  9 Jan 2025 12:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6E6C4CED2;
	Thu,  9 Jan 2025 12:10:19 +0000 (UTC)
Date: Thu, 9 Jan 2025 12:10:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, will@kernel.org,
	ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, chenfeiyang@loongson.cn,
	chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v4] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
Message-ID: <Z3-8qdluDbrDntRJ@arm.com>
References: <20250107074252.1062127-1-quic_zhenhuah@quicinc.com>
 <Z31--x4unDHRU5Zo@arm.com>
 <fbb134e0-cfeb-4c6e-98b4-d945f95383db@arm.com>
 <169f8006-ff33-48ca-a680-37fe1cf0efe8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169f8006-ff33-48ca-a680-37fe1cf0efe8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_041023_133769_D7DE9049 
X-CRM114-Status: GOOD (  10.41  )
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

On Thu, Jan 09, 2025 at 03:04:48PM +0800, Zhenhua Huang wrote:
> On 2025/1/8 18:11, Anshuman Khandual wrote:
> > Just wondering why not start with PUD level itself ? Although SUBSECTION_SHIFT
> > might never reach the PUD level but this will help keep the flags calculations
> > bit simple and ready for all future changes.
> > 
> 
> I suppose that it's because these are significantly larger than 2M, whereas
> Catalin assumed SUBSECTION_SIZE would not increase?
> His comment:
> "should cover any changes to SUBSECTION_SHIFT making it *smaller* than 2MB.
> "

Yeah, I was thinking of having fewer code lines. Otherwise the compiler
would likely optimise them anyway to a single assignment.

-- 
Catalin

