Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A98C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 02:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/w2//o9tLFu8D1YyHGm3x2nl7TT2wWydLVFSqS1msQ=; b=3MsjPIE+8OXAdNV28zcricCTxy
	lyAHPGRxldq16PevVJccW6zcnU60XKilIWCjogxwa/H/51wdB/VG7phXZE/O+W1535yBbVTXt2+Fl
	ZG6Kl29RYxppfZ1ow5+r5qWZMEaajinkOS727GHVMJHhTUaReWgYtLolL0glXmI//NengYRlRWiuK
	ra3kp2vZ1syYDO6PRXEC9LfKmNX4mJmmjuUW9gRVlCcDnlPxWcKJZkwlxQQUdYF9T/6oKytlaPwrO
	0e4HrbZ1zmUFOIrA5VND1FvYWNRKb7nMOHJ7YkgmcugufNBSbk4v+7XzbK8zPTcNWbj+JxSHfr/6G
	ifK9wYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfqLy-0000000871K-3GO7;
	Sat, 04 Jul 2026 02:43:38 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfqLv-0000000870t-16Uy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 02:43:36 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783133008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/w2//o9tLFu8D1YyHGm3x2nl7TT2wWydLVFSqS1msQ=;
	b=Z6AXqHVA+9nAVYfSa3QbdfPfvb43qNaCDbGVGpDJitxEZRu/+WHXiZt1uJm2m9gWRYnLBn
	rrMBGuwNRW8WoE+9qA6G/xghPUPVLiysithLQ4EAtBTx6p4nsscEq1kQqKczHWOE40wXsn
	Q29B2m+VxuTz6Z/bm0e5ix4C/1bn3MQ=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 1/6] arm64: make huge_ptep_get handled unaligned
 addresses
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260703114202.365553-2-dev.jain@arm.com>
Date: Sat, 4 Jul 2026 10:42:45 +0800
Cc: osalvador@suse.de,
 akpm@linux-foundation.org,
 ljs@kernel.org,
 david@kernel.org,
 liam@infradead.org,
 riel@surriel.com,
 vbabka@kernel.org,
 harry@kernel.org,
 jannh@google.com,
 lance.yang@linux.dev,
 kas@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 apopple@nvidia.com,
 rcampbell@nvidia.com,
 ziy@nvidia.com,
 matthew.brost@intel.com,
 joshua.hahnjy@gmail.com,
 rakie.kim@sk.com,
 byungchul@sk.com,
 gourry@gourry.net,
 ying.huang@linux.alibaba.com,
 ak@linux.intel.com,
 nao.horiguchi@gmail.com,
 mel@csn.ul.ie,
 j-nomura@ce.jp.nec.com,
 pfalcato@suse.de,
 tglx@kernel.org,
 dave.hansen@intel.com,
 jpoimboe@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 ryan.roberts@arm.com,
 anshuman.khandual@arm.com,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <58500686-A4A0-45FD-872D-AB0EE2AD2ACC@linux.dev>
References: <20260703114202.365553-1-dev.jain@arm.com>
 <20260703114202.365553-2-dev.jain@arm.com>
To: Dev Jain <dev.jain@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_194335_541269_AC8E0588 
X-CRM114-Status: UNSURE (   9.89  )
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



> On Jul 3, 2026, at 19:41, Dev Jain <dev.jain@arm.com> wrote:
>=20
> huge_ptep_get() can be handed a virtual address pointing to the middle =
of
> a contpmd/contpte mapped hugetlb folio (examples of callers are
> pagemap_hugetlb_range, page_mapped_in_vma).
>=20
> The arm64 helper rewalks the pgtables in find_num_contig to answer =
whether
> the huge pte we have maps a contpmd or a contpte hugetlb folio, and
> returns CONT_PMDS or CONT_PTES, so that it can collect a/d bits over =
the
> contiguous ptes. We can falsely return CONT_PTES instead of CONT_PMDS
> if the addr is not aligned.
>=20
> Fix this by aligning the pmdp pointer down to a contpmd base before
> checking equality with the passed huge pte pointer, to correctly =
answer
> whether the huge pte is the base of a contpmd block.
>=20
> Fixes: 29cb80519689 ("arm64: hugetlb: Cleanup huge_pte size discovery =
mechanisms")
> Cc: stable@vger.kernel.org
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


