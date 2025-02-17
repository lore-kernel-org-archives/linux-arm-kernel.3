Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB2DC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqDAUvAEeGP+kauicMXsQJdKxUNLdnbFg64inWAI/Iw=; b=yYiebWQELTijqwK1A46gRmHyQe
	mEbaQd0B4r82q7kmi78DhXmgeOv6ZaEOa/1Q7PWm9/7UGh+s3mmusP7b64c+Mi3WXiNVhOkxH6P3O
	ub1O/HBW5b4Tja0wJqZdeNHWcSee9E/vUUe6ZsyQNpjq3RRNrBuhxAx3D5rNqLAcp3YEAPZzbm9Ga
	GV0ZVREXDImvrRbi2U/QNF3B+FnEr5aRcnXDwEtTjrbdJGynjImD97ik1m9+QKDM3UiGbAXgSmqDS
	j3z9+EhD1UthpzVmMSXzfkd9vo939Jrkz234ftpcYywsYMHNzYRVNIL/bEb2U5sJMICfBB9N3OR5U
	sob2Oosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykZ-00000004Aa7-174X;
	Mon, 17 Feb 2025 10:53:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxg0-00000003yfx-3ux1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739785471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zqDAUvAEeGP+kauicMXsQJdKxUNLdnbFg64inWAI/Iw=;
	b=AXxYqG36q1aCMIyv8jJzL9ioR7J9vyX9AABv0ztE4NYQD4P9VWbjE0u3VrB5psRYtgXnyG
	TTDYIzHwhECJgl4oB96jJxw2Gdo540RnkaDXMdNGxjGk+l9QsaE1SKggPX5TY6nvvlWVcT
	xACLJQCkbp2LJOM2O7PTiVuC/nuA66o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-kG-uCjYmNtmr2dUpyT4NLQ-1; Mon, 17 Feb 2025 04:44:28 -0500
X-MC-Unique: kG-uCjYmNtmr2dUpyT4NLQ-1
X-Mimecast-MFC-AGG-ID: kG-uCjYmNtmr2dUpyT4NLQ_1739785468
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dca55788eso3574594f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785467; x=1740390267;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zqDAUvAEeGP+kauicMXsQJdKxUNLdnbFg64inWAI/Iw=;
        b=XWjF0Ea/ej51dJj3PUt/2WV3omjaHdbsuFJMTh5HGYGml+YVLtt7dnbUJqt8iDLkCc
         vGoATu2VIMK3LKq3/fqIQNX0CUiy1AiuGruVcJmYf+9sWLSwfSVnuCW1bEk/WrfGL1pS
         tt7k+K3wrJz6A7Hm3KQTxYqDYVtrQc2mgZUdmLmPg8luYSEO1vDLRE2QD3TDVVuvZBMP
         51+ZcV2/jg6XdCLHFRhXrUAerRBjD5jdZz6UC//wSfrKSRzl5myR07l3hc7Ub0tuMctA
         Gpk3eU6+KKRkj1MDcPHOPhcpj4QHGqY3lLY9K89QJqhndpM4NXol7028iRmHyHqj0lUP
         hQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL32H6Hi8vGNVUY9GVd4RTthxAqKpGCp+u1HnAXK9sjTcIjOWmgMRH9NSHpySwoK24HK2oBm15DkidpOnY5MM6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcc3uJcCJzyjXU/jm0M/46zFQFL6P6EM/eIcbHCTVe6593H0A0
	UMMCUWLLyM3f6YYs6QayJdHMGrWzsFQLDzFMCO53KuulFUsQdExHAPT5C6Pu6lWVs+ps+5mxo0+
	wXhoCK8SNRafgdzmYss3ryuD/wKA9IliymEL5MMAqQa6BNShX/golj1dxBa/zRn4+vSLpAjXg
X-Gm-Gg: ASbGncvWN7pWsybXN0B11YpsFbd5xdPDM1aqUx783ZIP632Sm+lmiOUzvvYo1wwEaLw
	+mZK7yGJ6Y/npR0wRRD4Qcn4Rqru7Lj0LP7evTzV+vYAL5hz3z6ov4tlB9m585xwnKdt0Tq3Hnn
	fB/xGGFAQx5CmcbGv+nhWBlAKDGWnl2FWxfdrHEntU+KvxV3Y1jhPExcPr/08M0ou5gRP7V78oN
	KbKu7hcbmXwGyft1mQmGNz9s4BzdwtueStfMqGLLbox5uLxo37GOeqk5Hf8F2ofzWx7VZAAzQoC
	FEl+JOAcB98OqtfWkpgt/nV0hy9evqslAoDamRzUR7elNFZr9djxt3GsXUhJDEDvnkZQRVol03w
	ojUrXtfsgwuZjbUDKu/a5RlxZrnhctA==
X-Received: by 2002:a05:6000:1acb:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38f33f5403emr9005223f8f.49.1739785467531;
        Mon, 17 Feb 2025 01:44:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNgLkKR19H26t5bIeaj/kdxdOHxKJk3k2pdc8bDKMxYHqeL2D6C5+H/jLNeUyyltbMVaZIzw==
X-Received: by 2002:a05:6000:1acb:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38f33f5403emr9005196f8f.49.1739785467127;
        Mon, 17 Feb 2025 01:44:27 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:900:900f:3c9e:2f7b:5d0a? (p200300cbc7390900900f3c9e2f7b5d0a.dip0.t-ipconnect.de. [2003:cb:c739:900:900f:3c9e:2f7b:5d0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258eb141sm11538422f8f.41.2025.02.17.01.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:44:25 -0800 (PST)
Message-ID: <8c1578ed-cfef-4fba-a334-ebf5eac26d60@redhat.com>
Date: Mon, 17 Feb 2025 10:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] arm64: mm: Populate vmemmap at the page level if not
 section aligned
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
 catalin.marinas@arm.com
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
References: <20250217092907.3474806-1-quic_zhenhuah@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250217092907.3474806-1-quic_zhenhuah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VOGDqEgD7IRGtocpcon4VKID64I8W8oOUU8QfTbOxWs_1739785468
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_014433_053906_D338E967 
X-CRM114-Status: GOOD (  27.57  )
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

On 17.02.25 10:29, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> The first problem is that if start or end is not aligned to a section
> boundary, such as when a subsection is hot added, populating the entire
> section is wasteful.
> 
> The Next problem is if we hotplug something that spans part of 128 MiB
> section (subsections, let's call it memblock1), and then hotplug something
> that spans another part of a 128 MiB section(subsections, let's call it
> memblock2), and subsequently unplug memblock1, vmemmap_free() will clear
> the entire PMD entry which also supports memblock2 even though memblock2
> is still active.
> 
> Assuming hotplug/unplug sizes are guaranteed to be symmetric. Do the
> fix similar to x86-64: populate to pages levels if start/end is not aligned
> with section boundary.
> 
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>   arch/arm64/mm/mmu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b4df5bc5b1b8..eec1666da368 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1178,7 +1178,8 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>   {
>   	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>   
> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> +		(end - start < PAGES_PER_SECTION * sizeof(struct page)))
>   		return vmemmap_populate_basepages(start, end, node, altmap);
>   	else
>   		return vmemmap_populate_hugepages(start, end, node, altmap);

Yes, this does mimic what x86 does. That handling does look weird, because it
doesn't care about any address alignments, only about the size, which is odd.

I wonder if we could do better and move this handling
into vmemmap_populate_hugepages(), where we already have a fallback
to vmemmap_populate_basepages().

Something like:

One thing that confuses me is the "altmap" handling in x86-64 code: in particular
why it is ignored in some cases. So that might need a bit of thought / double-checking.


diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 01ea7c6df3036..57542313c0000 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1546,10 +1546,10 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
         VM_BUG_ON(!PAGE_ALIGNED(start));
         VM_BUG_ON(!PAGE_ALIGNED(end));
  
-       if (end - start < PAGES_PER_SECTION * sizeof(struct page))
-               err = vmemmap_populate_basepages(start, end, node, NULL);
-       else if (boot_cpu_has(X86_FEATURE_PSE))
+       if (boot_cpu_has(X86_FEATURE_PSE))
                 err = vmemmap_populate_hugepages(start, end, node, altmap);
+       else
+               err = vmemmap_populate_basepages(start, end, node, NULL);
         else if (altmap) {
                 pr_err_once("%s: no cpu support for altmap allocations\n",
                                 __func__);
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 3287ebadd167d..8b217265b25b1 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -300,6 +300,10 @@ int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
         return 0;
  }
  
+/*
+ * Try to populate PMDs, but fallback to populating base pages when ranges
+ * would only partially cover a PMD.
+ */
  int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
                                          int node, struct vmem_altmap *altmap)
  {
@@ -313,6 +317,9 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
         for (addr = start; addr < end; addr = next) {
                 next = pmd_addr_end(addr, end);
  
+               if (!IS_ALIGNED(addr, PMD_SIZE) || !IS_ALIGNED(next, PMD_SIZE))
+                       goto fallback;
+
                 pgd = vmemmap_pgd_populate(addr, node);
                 if (!pgd)
                         return -ENOMEM;
@@ -346,6 +353,7 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
                         }
                 } else if (vmemmap_check_pmd(pmd, node, addr, next))
                         continue;
+fallback:
                 if (vmemmap_populate_basepages(addr, next, node, altmap))
                         return -ENOMEM;
         }


-- 
Cheers,

David / dhildenb


