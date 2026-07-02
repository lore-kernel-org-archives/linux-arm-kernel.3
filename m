Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adgjMTckmpxpZCcJHdKndp5zeblz2lkQJtQUpi5yLqw=; b=rLo3YZbcB7n2E+j6QkjzY26t49
	uniE50QTFAUh8IvkCWb90XqVzLPEUmFRY9iLRmmBCUj2Vawf36LlNTxMSvkVTKKxq5SmjOwhpzqhI
	q9amGprpoUUyeijrpPQhnsFIev5lMBHJxg32rrd/oufnq/eKS/Bu/JlLIszdtlfAUnNcJjooLGy+F
	n3C16R9FPDGuIBl8bRamNK8cU0ACgkQOhaPs25yXxy1br1hTwoXAJ3oXJmjzPdwjtPjFABjGwv/n5
	BlDxmHfD4pUBIsTM0YJRdFb0cVh0imS5TeCt5wIdMgtCr2StItYXoYz24azdSVi+YYOdory0DNVHG
	oYA7tINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCpC-00000003sYE-3vod;
	Thu, 02 Jul 2026 08:31:10 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCpA-00000003sWz-2fGh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:31:10 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782981054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adgjMTckmpxpZCcJHdKndp5zeblz2lkQJtQUpi5yLqw=;
	b=lCL8SUoRvBuYJjOANyVkEtDxtMP+lrtMd+JM22wKEQg/9vL02SI2jmIv/0K6w18ZXSfRmW
	pyYqOtyzNMKo9IlWryGti6xTNZDxKuT4/OiXQMIgcEuP/lkaMwrX5LmL40mqzRK/is1qNv
	824p2/q8qxoAqbhxxZiPgnYNnOVND+E=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2 6/6] mm/mprotect: use huge_ptep_get() for hugetlb
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <555ccf16-3abf-4f82-9ebd-5df970e9de53@arm.com>
Date: Thu, 2 Jul 2026 16:29:59 +0800
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
 rcampbell@nvidia.com,
 apopple@nvidia.com,
 ziy@nvidia.com,
 matthew.brost@intel.com,
 joshua.hahnjy@gmail.com,
 rakie.kim@sk.com,
 byungchul@sk.com,
 gourry@gourry.net,
 ying.huang@linux.alibaba.com,
 j-nomura@ce.jp.nec.com,
 nao.horiguchi@gmail.com,
 ak@linux.intel.com,
 mel@csn.ul.ie,
 pfalcato@suse.de,
 jpoimboe@kernel.org,
 dave.hansen@intel.com,
 tglx@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 ryan.roberts@arm.com,
 anshuman.khandual@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <69EA5792-0152-4ACA-9BB0-1971180F40F0@linux.dev>
References: <20260702051341.126509-1-dev.jain@arm.com>
 <20260702051341.126509-7-dev.jain@arm.com>
 <555ccf16-3abf-4f82-9ebd-5df970e9de53@arm.com>
To: Dev Jain <dev.jain@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013108_815928_57B8306B 
X-CRM114-Status: GOOD (  11.03  )
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



> On Jul 2, 2026, at 13:18, Dev Jain <dev.jain@arm.com> wrote:
>=20
>=20
>=20
> On 02/07/26 10:43 am, Dev Jain wrote:
>> prot_none_hugetlb_entry() is the hugetlb callback for the early
>> mprotect(PROT_NONE) PFN permission walk on x86.
>>=20
>> The callback passes the decoded PFN to pfn_modify_allowed(). For a
>> hugetlb callback, the pte pointer refers to a hugetlb entry. On
>> architectures where hugetlb entries need huge_ptep_get(), reading =
that
>> entry with ptep_get() can make the permission check use the wrong =
PFN.
>>=20
>> Use huge_ptep_get() before decoding the hugetlb PFN.
>>=20
>> Currently there is no path which can trigger a bug: huge_ptep_get() =
is a
>> simple ptep_get() for x86, and the prot_none walk occurs only for =
x86.
>>=20
>> So no need to backport - use the correct helper anyways.
>>=20
>> Fixes: 42e4089c7890 ("x86/speculation/l1tf: Disallow non privileged =
high MMIO PROT_NONE mappings")
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>=20
> @Muchun, I did not do the change you suggested: if we do #ifdef around
> the hugetlb callback, then for CONFIG_HUGETLB_PAGE=3Dn, =
prot_none_hugetlb_entry()
> is defined but not used, giving compile error.
>=20

Got it. Thanks for your explanation.




