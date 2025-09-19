Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763CFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejv4+a1Szt6NXcbVGJywclqiPFjJOmBuKdS8czeKkZw=; b=rI4+70aKMoKpYjUu6teHutasrZ
	zXwgs+1WYdRHAolWvcu1wXASV0/RSF+qzlMqyAqz5v1rUQLJM05vj0+2koWgqSyarjph993wMwo3F
	GAKAWHkX/U88cXUS9/Zk2xRaUwKLTQBdfSfh0bF5FsOmbEh61S64wx+oUB7wBGKq5NWuHSLTOJfLG
	jYntAl4ExgQC/5Esn1YRddi12l3LidOzvHhmF+NVLJJj3PWXPqNox3z3OAFb8aja578t+e3m8Sim6
	9XcUtJfsmy+rRlL/Qm4tCaIXSi5gZA/LSTwGwYANTYKCGgADrXcWNM2LSZohY8r+cqOV4aIaE9/yv
	YJucAnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzX1u-00000002K9F-1FQ2;
	Fri, 19 Sep 2025 09:03:46 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzX1q-00000002K85-1CQy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758272616; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ejv4+a1Szt6NXcbVGJywclqiPFjJOmBuKdS8czeKkZw=;
	b=f7diUbdB0ukPk5k1u6Z/DtnDmLY9yHry3Pk021uuR975h1zoGICMLi3cmG5aJJGVdOzFxd/8HIObBAKtTlLmQSq5viUSOV3LsQb9QiaXlcOWF0yUAU4HP9juZ3JPIXLXz1pw51/iFLwQLsGBp7KHYTnKVN4l7MdxI5fTZM2fWeg=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WoJInQG_1758272600 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 19 Sep 2025 17:03:33 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,  Will Deacon <will@kernel.org>,
  Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@redhat.com>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
  Vlastimil Babka <vbabka@suse.cz>,  Zi Yan <ziy@nvidia.com>,  Baolin Wang
 <baolin.wang@linux.alibaba.com>,  Yang Shi <yang@os.amperecomputing.com>,
  "Christoph Lameter (Ampere)" <cl@gentwo.org>,  Dev Jain
 <dev.jain@arm.com>,  Barry Song <baohua@kernel.org>,  Anshuman Khandual
 <anshuman.khandual@arm.com>,  Yicong Yang <yangyicong@hisilicon.com>,
  Kefeng Wang <wangkefeng.wang@huawei.com>,  Kevin Brodsky
 <kevin.brodsky@arm.com>,  Yin Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [RFC PATCH 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
In-Reply-To: <aMvbNvCsSxQjA2rq@arm.com> (Catalin Marinas's message of "Thu, 18
	Sep 2025 11:13:10 +0100")
References: <20250915032946.33203-1-ying.huang@linux.alibaba.com>
	<20250915032946.33203-3-ying.huang@linux.alibaba.com>
	<46dcddec-88a9-4b22-920c-8a3edeb2f027@arm.com>
	<87o6r833li.fsf@DESKTOP-5N7EMDA> <aMvbNvCsSxQjA2rq@arm.com>
Date: Fri, 19 Sep 2025 17:03:17 +0800
Message-ID: <87wm5uizl6.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_020342_996918_12ED9829 
X-CRM114-Status: GOOD (  12.18  )
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Thu, Sep 18, 2025 at 10:18:49AM +0800, Huang, Ying wrote:
>> Ryan Roberts <ryan.roberts@arm.com> writes:
>> > contpte_ptep_set_access_flags() currently does a (broadcast) __flush_tlb_range()
>> > on the (pte_write(orig_pte) == pte_write(entry)) path. I think that should be
>> > changed to a local range invalidation to be consistent with this change.
>> 
>> Yes.  This should be changed too.  However, it means we need a local
>> variant of __flush_tlb_range() and flush_tlb_mm().  Is it OK to
>> introduce them first and tidy up later?
>
> If it's just for contpte, we'd never take the flush_tlb_mm() path. So we
> could instead add a specific local_flush_tlb_contpte_range().

Sure.

---
Best Regards,
Huang, Ying

