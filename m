Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190E5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKYzHIALNtDUUydkxeFhY6Lnu4RyTa/BxMviK7FEme0=; b=ryiWwjo2KbtMFDh5ixCB+B3Wnb
	jTHMz/DWDuP5WdhZlRUhjvqdBfz4hmcYgrm/Pc0+Sda/OcmuxLK6lXCb2PquEGka8s5a8+hEOVXYY
	JSxhFFcMoZlaC4kNLXtZH7Tfw0DQP7k/Ez3ngBwkP79oeG6bZkRXwetGh2lDOCetrKFFxGqwQT+vo
	iCKqNlXlgGt36hi2WYFCpnhRYWrIBZKiMLBbi7qq6OMTfAN7cFOav9ze/2Mwg0NTBOAdZdQnIM0XB
	3MjA3fbdDMPAaCZChZuHgf5xp6MJDyIdmklgnvN+RSrY9w5LP54oWTD6hz50kaNT5kwupry2RFD7h
	4VBEtFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OSu-00000000cT4-1BTI;
	Fri, 25 Apr 2025 19:12:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OPv-00000000bzP-2KIt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 19:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aKYzHIALNtDUUydkxeFhY6Lnu4RyTa/BxMviK7FEme0=; b=jJmglLn2xcvuWVpTYWDmM1yxR4
	qVMBGIZQw5UMNuetuPXAcU3EPY7NpfKppXxD6BrJ31gx/4dt5M6kcohNT5GgXxwrhcrOXo1Zwjmw/
	dzFpqy6pWN/d+8LikBV6Zbzh6uwxnAEpMF4hJTtPCTb5ddlhPD5uRJmx3/Y63w7ZUwNtUFxtD+UYj
	6btcOSXcALKynfnR6ZMafLNz9+jGHRhqtCOEdkoeuEWfkmNK8MTmkwjMtyZW4kpT8n2m/ucgdSJE9
	m91XZrQO75JIYnHxyrWT8XUSOQoluLCildSTBryKqtkyv/mfc+eQLmNchyVbM+sRjcXULs6fmteti
	YBxjqClg==;
Received: from [188.39.25.218] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8OPp-0000000C8dg-0e1C;
	Fri, 25 Apr 2025 19:08:49 +0000
Date: Fri, 25 Apr 2025 20:08:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_7/7=5D_mm/mm=5Finit=3A_Use_for=5Fea?=
 =?US-ASCII?Q?ch=5Fvalid=5Fpfn=28=29_in_init=5Funavailable=5Frange=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
References: <20250423133821.789413-1-dwmw2@infradead.org> <20250423133821.789413-8-dwmw2@infradead.org> <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
Message-ID: <91CA8854-2E86-4AF3-BAD0-8C47833F59D4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

On 25 April 2025 17:17:25 BST, David Hildenbrand <david@redhat=2Ecom> wrote=
:
>On 23=2E04=2E25 15:33, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> Currently, memmap_init initializes pfn_hole with 0 instead of
>> ARCH_PFN_OFFSET=2E Then init_unavailable_range will start iterating eac=
h
>> page from the page at address zero to the first available page, but it
>> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
>> won't pass=2E
>>=20
>> If ARCH_PFN_OFFSET is very large (e=2Eg=2E, something like 2^64-2GiB if=
 the
>> kernel is used as a library and loaded at a very high address), the
>> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
>> long time, and the kernel will look stuck at boot time=2E
>>=20
>> Use for_each_valid_pfn() to skip the pointless iterations=2E
>>=20
>> Reported-by: Ruihan Li <lrh2000@pku=2Eedu=2Ecn>
>> Suggested-by: Mike Rapoport <rppt@kernel=2Eorg>
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel=2Eorg>
>> Tested-by: Ruihan Li <lrh2000@pku=2Eedu=2Ecn>
>> ---
>>   mm/mm_init=2Ec | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>=20
>> diff --git a/mm/mm_init=2Ec b/mm/mm_init=2Ec
>> index 41884f2155c4=2E=2E0d1a4546825c 100644
>> --- a/mm/mm_init=2Ec
>> +++ b/mm/mm_init=2Ec
>> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned=
 long spfn,
>>   	unsigned long pfn;
>>   	u64 pgcnt =3D 0;
>>   -	for (pfn =3D spfn; pfn < epfn; pfn++) {
>> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
>> -			pfn =3D pageblock_end_pfn(pfn) - 1;
>> -			continue;
>> -		}
>
>So, if the first pfn in a pageblock is not valid, we skip the whole pageb=
lock =2E=2E=2E
>
>> +	for_each_valid_pfn(pfn, spfn, epfn) {
>>   		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>>   		__SetPageReserved(pfn_to_page(pfn));
>>   		pgcnt++;
>
>but here, we would process further pfns inside such a pageblock?
>

Is it not the case that either *all*, or *none*, of the PFNs within a give=
n pageblock will be valid?=20

I assumed that was *why* it had that skip, as an attempt at the kind of op=
timisation that for_each_valid_pfn() now gives us?

