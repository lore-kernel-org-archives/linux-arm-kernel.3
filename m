Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFC4C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaZWKHAckqeA7K7xB+lhxHxtbFfTIKiixJPwaw0cQfE=; b=XSbtD5VJbMRuDoSWw0edVLOqka
	cQxgRVWxwA0Yj3sYIbuyXMijUZTgxtJvLLpIKmLW7kVCIhIUaHd/tlaIXWLdamZqBNINM1xIP5pI3
	3XkBAJGWjZwn4ZLgxzeq8zVxjJzbeLLlLvtQK1folbzLqgnoK2bS+bL/VVFcrwQtvK2/cpSxOthNh
	xVQetya2S7e21KRDH8YCVo0bKyHcMiNR6q9YlrLrlAJkS/AhndskkFPw3cxl4o15AIu3TiTP6cjhW
	iWypuL+O18RhNFUJHXd1Gh1bhUmy2sBJaW8zj5L/tcAgZsuPCnrvVEBL5I9sZAcKYq9RWmTzldIrb
	qS4mXHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuSO-00000001AB7-42bW;
	Tue, 25 Aug 2026 16:57:04 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuSM-00000001AAm-1Rcz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787677022; x=1819213022;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GUHBtX8i/XXdFP4nTGCmtXDoyJYGQXwhXsT4+TfHfKY=;
  b=Hfm4HpAUenh1gAAPbehWgg4oBmGdlljVra4bsHFPgA69Vocd+W+4ivow
   M3cpqZvH3meR/ZhhB3r2/DKBIcK525M/0wWHWq5FTzopE8EVQwktNhSdc
   rYof8/TgGDVl7rGbJBBuwQ++WnK41PR+toFf8l6RPK58MlJiowkTDTjem
   NEli9GrXWSOw4ohV+dAT/KI1h56643eNU1F5Q6VcDkpTByMElEDbxAraS
   WRDMEenPzIh1rGcmHzhfZU0hAxnsaQfsCCo2UeFDBCXnt1J72ZixeBASQ
   gpnAL7QDZabSnJb9NMtBngRlC59knjePZbsAWU13tZYpPV53N49fnnPFd
   A==;
X-CSE-ConnectionGUID: ipofKm7KTRCsOcv43NKP0w==
X-CSE-MsgGUID: VDqKKidQTh+DBbUO7IbHvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88206687"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="88206687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:57:01 -0700
X-CSE-ConnectionGUID: yAPm+p4JStOXHfag/PiOnQ==
X-CSE-MsgGUID: gpPNc10qQBSRPWPPMyM1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="270819353"
Received: from aschende-mobl.amr.corp.intel.com (HELO [10.125.109.12]) ([10.125.109.12])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:57:00 -0700
Message-ID: <687afc72-5b6a-4138-8d33-fe5b6b7aef00@intel.com>
Date: Tue, 25 Aug 2026 09:57:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/mm: add set_direct_map_ro_noflush()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org
Cc: ljs@kernel.org, usama.arif@linux.dev, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-4-xueyuan.chen21@gmail.com>
 <2931f8a6-3780-4d6a-b19d-61cbbdad1a3a@intel.com>
 <1e04196a-7079-4a8d-a1b7-844e60d08728@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <1e04196a-7079-4a8d-a1b7-844e60d08728@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_095702_476754_883E89B1 
X-CRM114-Status: GOOD (  14.44  )
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

On 8/25/26 09:43, David Hildenbrand (Arm) wrote:
>> int set_direct_map_invalid_noflush(struct page *page)
>> int set_direct_map_default_noflush(struct page *page)
>> int set_direct_map_valid_noflush(struct page *page, unsigned nr, ...
>> int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
>>
>> Which one of these things is not like the other, despite being named
>> just like them?
>>
> That's called out in the cover letter:
> 
> "
> This series adds set_direct_map_ro_noflush() so mm code can make a
> direct-map range read-only, then uses it for the persistent huge zero
> folio. The helper is direct-map specific, takes an address-based range as
> discussed for set_direct_map* helpers[2], and leaves TLB invalidation to
> the caller.
> "

My concern is not so much what the function is doing or whether or how
the specific function is documented. It's more about whether the new
function is consistent across all functions with a similar purpose and
name. Also, if it is _not_ consistent there needs to be reasoning behind
the inconsistency. I think that is missing here.

In this case, look at the call site:

	addr = (unsigned long)folio_address(huge_zero_folio);
	set_direct_map_ro_noflush((void *)addr, HPAGE_PMD_NR);

It *has* a folio. But it does a folio_address() and two casts to massage
it into the type for set_direct_map_ro_noflush().

If set_direct_map_ro_noflush() just took a 'struct page *', there would
be one folio=>page conversion, no casting, and complete consistency with
the other set_direct_map*() functions.

I'd also be OK with set_direct_map_ro_noflush() taking a folio, with the
implication being that it might eventually make sense to convert the
other set_direct_map*() functions to folios. But page vs. folio
confusion is much less likely to cause bugs than a void* versus another
pointer.

IOW, what I think I want is:

int set_direct_map_ro_noflush(struct page *page, unsigned long nr_pages)

Or _maybe_:

int set_direct_map_ro_noflush(struct folio *folio)

