Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340AFC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 00:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6GMexSWWuoc9Cddr8yMae7nQERhafauV/Q+TnV8uPo=; b=LSC4+6eUFa33WCf1hRrQiwdkqJ
	P/6D+YRq53UMfGT+HKY2cR+Ao20koOTDZOjS7wGZkU7uYvsmtHtjdDH4lArmgl9GbYHo/0MrMbATm
	/pvaa05Bdoem6Sm3/XQhCcsrfE+MsWaQ9OIW37FLorWjTF03BzpCGbczaW6vm4AlBSoHTOHwDgBs2
	sMmYaYIsKUavvRrCL9rpfV++nnPrp9+MwaGCnb8/kiP0M2sv62H3o6+JXvief1z7pTXcHyiXxBe/o
	7FQyltoHRtUNOP4vqclm7AysphIOg1C+DCwKiAOf86RCL3YZf8s4N+Ld3rgT1KdbRk2VCerzMB/wV
	rf2Cab0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Hv6-00000000oPd-1paC;
	Fri, 04 Sep 2026 00:36:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Hv2-00000000oOV-4C7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 00:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788482195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6GMexSWWuoc9Cddr8yMae7nQERhafauV/Q+TnV8uPo=;
	b=ZHD3+8HYAOqVcONtAwigZHibYQ7EZQJrHoVpmAUCOvS3RuyRAZ82FD0J2zgFlQBIWMCvXo
	4603P2X2mOO5eNjQDkM8WTQak4yD0DJ1xNQ4RvJUMP9WJyP1t5DzJEzwxrZS2vnwhsxVBW
	uMTu+ke9y4oOBnkLzabzkrvp6S3Nhtk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-z7_ir07IOWKfG_Ij2U7lgw-1; Thu, 03 Sep 2026 20:36:33 -0400
X-MC-Unique: z7_ir07IOWKfG_Ij2U7lgw-1
X-Mimecast-MFC-AGG-ID: z7_ir07IOWKfG_Ij2U7lgw_1788482193
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso808783a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 17:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788482192; x=1789086992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6GMexSWWuoc9Cddr8yMae7nQERhafauV/Q+TnV8uPo=;
        b=C4/XsQWbOXXAU5+IPxvsfaF8vXnieMi1OCZGtp7IrhTGmJckAphqJXNqiTXOTQQeoW
         HJCl4Ljp5+raR66fUuJbc3iArpipWIZCY38oTJXcE9O1T91+Nbu8JtFYABdLvOFtKOKc
         iFEFy8L8lUvDHQ8mdwIrl7XF/NE1w1TxKbNeeu5iVmDpTrs9VCeRZvw5endN1L8/TeR8
         lRDQB7v/2xBWTkBqtE/3Kl1ix7Fp5bV24sx+sH9wtt4gpfdN9X+a8cfe42vs47mrQZGq
         Fv54b4dza/4DFoVbi/OkTmbXe5pzILCIl0+C/7DJAbDK0X8F5o5ln9z+zlfuy0PUP5qb
         XMJA==
X-Forwarded-Encrypted: i=1; AKwUvBzqd4976rVx2nT37xr8xwGssxJzbWABrC9Rkdpntu5Zc/EM1jhif3bRGt1bbQlR6BpsywfB5ITbxoM2VoprOmiQ@lists.infradead.org
X-Gm-Message-State: AFuF++l0X48o5xTNBo5BI2xGa/rT2dypcxrzxTyz5qOI0Ec5UupFzLIz
	pRokFhRkN2c3l4wgDpSHnQYULsbkZNm04oJf7jFZR19n5YvPXi657mVGA+XRsyIK9lpOfJvJJLk
	WE6q88TNb7SyfN7LNtEaLSK+iVDJR85PDOkG8OIGJ4XpkzZ/U8TEQnwSoHM7jyJQq/akyM/5Swx
	gn
X-Gm-Gg: AYBFou3i/FnAGr5W/fmKKIskJtboiiW/5sa+vK/+N1pGaLkf4gTteEueIxGsf5l1uY+
	L6XQKENj66zCzR+2VzfhQf2eGfrhvgznIsfO5vJ/iKbL+pCtgAgnjIZGuPYGP1z56OdVFi0Mx2i
	MzOX8P5XzXcI4z7TlUM2//EfcU8OgvI6uyZE19GaerXWgU/VLRboV5gWG6Fw5t5yWC9XAGbqPyp
	vs6BWE41ptxp/PbnI2R6ov8rvl9VyCUEYBv1GtQnA+l+WZFhLXQhtBMFAI54mINiev+q1I2BvPF
	YIo3bCfZcvr1Ofktc00HvrzuvJE2rKkxkispdybA0mDmG1hC2lRIKFFpnUJXneeM0M+J3M5Edqd
	odJcXa8hnqFz1nF2BDYbiDTMYCi/4hCdyT6dNC3QAMg==
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr3925684a91.21.1788482192428;
        Thu, 03 Sep 2026 17:36:32 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr3925599a91.21.1788482191942;
        Thu, 03 Sep 2026 17:36:31 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm2233190eec.22.2026.09.03.17.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 17:36:30 -0700 (PDT)
Message-ID: <a7fb4f62-bc2c-49f9-848f-9f64235f95a1@redhat.com>
Date: Fri, 4 Sep 2026 10:36:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] KVM: guest_memfd: Stop returning struct page from
 PFN lookup
To: Ackerley Tng <ackerleytng@google.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 Yan Zhao <yan.y.zhao@intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
 <20260826-gmem-no-return-page-v4-5-3bb9c1ddb4e3@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260826-gmem-no-return-page-v4-5-3bb9c1ddb4e3@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 78yOEvtQI92-0kkBGXJWa8B62R494Z6-erHs5EU6PGo_1788482193
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_173637_115273_247AF5DD 
X-CRM114-Status: GOOD (  22.73  )
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

On 8/26/26 7:01 PM, Ackerley Tng wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> KVM currently expects guest_memfd PFN lookups to return a refcounted struct
> page, which callers hold across fault handling.
> 
> Drop the page's refcount before returning from kvm_gmem_get_pfn() to
> prepare for the in-place conversions series.
> 
> CoCo shared-to-private conversion handling must inspect folio refcounts to
> ensure exclusive ownership by guest_memfd. A concurrent guest page fault
> taking a temporary reference on the folio causes conversions to fail due to
> an elevated refcount.
> 
> While this refcount is also taken on host userspace page faults, that
> refcount is taken on behalf of the host userspace page tables. This
> refcount will be dropped when conversions unmaps the page. Either way, once
> there's an mmap() or userspace mapping, the pages are open to way more
> refcounts, transient or not. This patch focuses on just dropping refcounts
> before handing KVM a page.
> 
> guest_memfd already notifies KVM of page invalidations, so callers within
> KVM only need to respect the MMU invalidation protocol to safely rely on
> guest_memfd for page presence.
> 
> Since the page refcounts are dropped, don't return the struct page pointer.
> 
> Not returning the struct page from the guest_memfd PFN lookup moves KVM
> closer toward supporting memory backends that are not backed by struct
> page.
> 
> Here are some notes on the cleanup in the callers of kvm_gmem_get_pfn():
> 
> kvm_release_faultin_page() in ARM's gmem_abort() originally also serves to
> set the page dirty and accessed under some conditions. The dirty and
> accessed flags don't matter for guest_memfd anyway, so it is safe to just
> drop the call to kvm_release_faultin_page().
> 
> For ARM's kvm_translate_vncr(), the local page pointer must be initialized
> to NULL so that the shared cleanup path that releases faulted-in pages
> safely no-ops for guest_memfd.
> 
> For x86, no additional changes are required in the MMU fault path because
> the page fault tracking structure is zero-initialized at the start of page
> fault handling, ensuring the refcounted page pointer is already NULL.
> 
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Closes: https://lore.kernel.org/all/anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com/
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>   arch/arm64/kvm/mmu.c     | 4 +---
>   arch/arm64/kvm/nested.c  | 4 ++--
>   arch/x86/kvm/mmu/mmu.c   | 2 +-
>   arch/x86/kvm/svm/sev.c   | 8 ++------
>   include/linux/kvm_host.h | 6 ++----
>   virt/kvm/guest_memfd.c   | 9 ++-------
>   6 files changed, 10 insertions(+), 23 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



