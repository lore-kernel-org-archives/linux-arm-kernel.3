Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59528C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cCqc7oVmR4ctIExSqMB03/LPKofsssdghTgzdOd1co=; b=fycYFMbllojge4BsC91y0slIMq
	j51H+ppLt50TbpZ+DTy0FbI4pmDqJvT7PX4gq2muUPBf+pq+TYdzCuRQRr+6Bo2VNphjrPIBQxEv+
	LzsnHsL2K+3umrtP/g8exyTreTpKQHw5i8uSja7trlmbmyI/NcyzD8pZGPCctBX2fGIGcbaFZA8hI
	JiOG244nPNVMXflsKbDcm75ptX1a37odVwkHBqE1Hq361ZeB1ec+U/9rFyMg7g0qM5NlGuFZUiPoQ
	JGB9UR/AEcg2WBRUuciA8t6ae3L7m9/HZEeDdkmkCl9Xux1ddr0ikXbJAaBk0ZFjJhymjKQwRqJu6
	8IJLuxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytqg-000000016Dv-47Nv;
	Tue, 25 Aug 2026 16:18:06 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytqd-000000016DY-3RVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787674683; x=1819210683;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3U36cbJA9GGbJw+GO8g1uZN1QM2k4wAwzhPSeVBOlXU=;
  b=k5yzj/62+/LuL2j5T8zLy4V6YfhvWZX5AmafdN3MFthyaNn3oPUuQgQQ
   TcIYGSlVm3mqISbcOPcLZ0IY8HYHwsiRqcvQMmWakj1QU0sjeHFqS3V3o
   0Qlx/xofWpvJZQno024CgRU2NpyT6198ai0eClZPUIrccdnt76wPgB8Wc
   0YGNIq+FGOzzWzc33IsWLpEPWE8N3tBC14IN+jyt6dJb/9l+bbkcN5w2E
   gTS7xyTAWuLIV6hu3PBDs/Adl0bySNru7gnEm9C7G2eyo9gltANxG8Nv4
   yhV/AE50QrFdTqb1CI9uZJ1OXx+IjvoHwAd17ZAdakleKgYQMJLN2Sn0p
   Q==;
X-CSE-ConnectionGUID: Wk/oDyIqRJKpUuWLZu20Bw==
X-CSE-MsgGUID: AenkFWDSTeWmZGqiPAWRcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="75683616"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="75683616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:18:02 -0700
X-CSE-ConnectionGUID: IVmEJ8cGTRWmBQlOpXyt3g==
X-CSE-MsgGUID: cI6+c/a6RCu4ERA2CPiKxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="264708705"
Received: from aschende-mobl.amr.corp.intel.com (HELO [10.125.109.12]) ([10.125.109.12])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:18:02 -0700
Message-ID: <2931f8a6-3780-4d6a-b19d-61cbbdad1a3a@intel.com>
Date: Tue, 25 Aug 2026 09:18:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/mm: add set_direct_map_ro_noflush()
To: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, usama.arif@linux.dev,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-4-xueyuan.chen21@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260730090647.2401252-4-xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_091803_878084_1F27B006 
X-CRM114-Status: GOOD (  13.78  )
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

On 7/30/26 02:06, Xueyuan Chen wrote:
> +int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
> +{
> +	unsigned long tempaddr = (unsigned long)addr;
> +	struct cpa_data cpa = {
> +		.vaddr = &tempaddr,
> +		.pgd = NULL,
> +		.numpages = nr_pages,
> +		.mask_set = __pgprot(0),
> +		.mask_clr = __pgprot(_PAGE_RW | _PAGE_DIRTY),
> +		.flags = CPA_NO_CHECK_ALIAS,
> +	};
> +
> +	return __change_page_attr_set_clr(&cpa, 1);
> +}

A couple of concerns here.

First, why the "_noflush"? Sure, the "this is a best effort hardening"
function argument can be made, so it doesn't need to be correct. But the
result is a function that's called once and also has some sharp corners
and relatively high potential for misuse. Let's just do the flush.

Second, I see that the other set_direct_map*() callers use
CPA_NO_CHECK_ALIAS. The reasoning behind it dates back to 2008 and I'm
not 100% sure what it is referring to. On one hand, it would be nice to
have all the set_direct_map*() callers be consistent. On the other hand,
there shouldn't *be* any aliases of a 2M page that came out of the page
allocator. We almost want a CPA_ASSERT_NO_ALIASES that goes out and
checks for aliases more than we want to ignore them. (Note: I don't
expect you to fix this, but a simple comment saying that no aliases are
expected would be nice)

Third, what's with the 'tempaddr'? Are you working around the 'const'?
Honestly, I'd rather have no const than have it and subvert it with
casting trickery.

Last:

int set_direct_map_invalid_noflush(struct page *page)
int set_direct_map_default_noflush(struct page *page)
int set_direct_map_valid_noflush(struct page *page, unsigned nr, ...
int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)

Which one of these things is not like the other, despite being named
just like them?

Imagine the fun if someone did:

	set_direct_map_ro_noflush(page, 1);
and
	set_direct_map_default_noflush(page)



