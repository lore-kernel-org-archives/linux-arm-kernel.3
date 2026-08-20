Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265F3C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW5t0G/U8sBPBIi/hy7+eXOaj+vhlsnXo8EJATEvXbc=; b=oWE+kKwQrr1Vr+/gAyhkj6RI9L
	GqBeH5Y1sDpErYpAO6ynLIH+1S1U20up7jrBBsVrbQcAFXpYTWe8kIRLNDEjzk6Ufg2BBNZvf4QAE
	FfQ38vv2sOVlVrqyPUDSWtlO9GdnFOa1FHqvw04I7LDm+QiYLzKELJphqW5f2qYPvEYM4etUJfUrr
	A055mvm4WM236UBVt1A1ib5ydcpGE0Vw4EvqsUMI+BczeOFKakEpi3RWhb65GAhgSA19Ri4VfcMgr
	1gY24HsEPssBt0YDaBYKVJqUDpm7JAKisE11zbPtqDS95IVMyJ66b6xNaFsxQ8vFRneXzz9scIeQH
	agH/p2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx43i-0000000Bjay-2c0m;
	Thu, 20 Aug 2026 14:47:58 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx43g-0000000Bjad-0Bv9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:47:57 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-90c4e297a01so15601846d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787237273; cv=none;
        d=google.com; s=arc-20260327;
        b=fBSyK6MJfgAYSF/jIpXnT+FCVA6sNoeTn0wJ5NC8wqr5hmLUPIvj61TawG3LCnLhrV
         fMLJyBYchJOdMWNcS5Myr7HoE8CjmyrfUU82Z4feHwFlVi8UyPnKesmuaU/rDgvPVoX5
         SwnQIz7Xy4WpVjEQ6sngjkq4RUX7ywZkyIJMfP//3v2mQutaY5MaI+bvitSY+JVqz50c
         YWRyPOGC6O+Nsu3PklAeojcSOhfa614/rl365o5S7eFji5D4srPIm3JaGTmKhj+ar312
         6TkmXO9xK2mjqFsnK+vZJyGBZ7vtn9DtUvkhj0OFbfqEBImq2ay2Ue/Pm+cJoOGhTzLT
         pWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=wW5t0G/U8sBPBIi/hy7+eXOaj+vhlsnXo8EJATEvXbc=;
        fh=zKC7Np1TvKDUe5j0P42R0YjhZG+q7cqHlmky5KXbxHA=;
        b=GrQqL+U4UodKTUIccyZATTCigdCYmE9XzvKkeXCc0rw1VHEXDnRt0lhTq+XSN4SlIT
         bZm5HBcvP6uYGRCnjVah5vCEWwJ/gKdaDdJuET5Meh2ez9KEXyUcLFrY/fG/FRVUELdq
         ffXAs1dHz/Txcg/zzFv8yiCoBMJCdwadGGdnF0+MoouI5TNlrV53/jywaL7nkHgW4LRV
         DjQTm9/kw9hAoza0qwVFxSQSz/0RxIAGsb2+dPQxEFkTgwIaXkeTFEz+itCbrYI5r7RL
         uhuj+sqOnWBGBZhY/NRwALb9Xj0Q+IEH8wSJ1Zp20jeAumpBVYKXuZs/1FbPgu5Kcmxg
         c62Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787237273; x=1787842073; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW5t0G/U8sBPBIi/hy7+eXOaj+vhlsnXo8EJATEvXbc=;
        b=Gm6K7rYUgo9teVTBj6j1cshlQxqiWyn+YHZoZgOcQ9BmvnLisiljqC2gKnT43JnTZ6
         bi0FjbGHJDM3Ml77SnBDagWA8XIvY4KplnP63dl2rnQ22Vyw/IYIetllZZKx+9nHw8ZM
         Ftwwv5kEKNzfTmRpgUtIMXy0yQjtPkp3u30fs422l3No3Xb36fmAm/CHZWRd7mlTCZzw
         ErwB6iknsnZoQ7hJws8FsP2MKz7JitKPiWxv9UxTM2ItrDnmn1jIEHjWfc3Coobyfe9X
         4Lx2EFvj8pbFHVCvzYK2ZEkL+DRFIm19qcpoBVd/Bt4S3rmHnrclPWS4eBpIjPI9nd66
         yHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237273; x=1787842073;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW5t0G/U8sBPBIi/hy7+eXOaj+vhlsnXo8EJATEvXbc=;
        b=ieBDCfvaQ1Yphl7HBufaOoG5ZHt8uId1sHBtV4mGXXPbuAJJyeShYla8I9mtJy9Oy7
         w9GVjipL7UgLjy4hiqOFtX8RwnzSKxAob9R0ehVq4upDJPrl3pVRx4xM9WR2Lp67lkTp
         Q9oOZXpemzIl9QQ29Zj0Xvbpxqd7qT4fHKcKbG4fqY6NMsBHJDXK+/slaXOat6F1YoCS
         0drmJt9EY20bupy8JpLwUF0aNL/VIYD5IQTnWRyQ6zXcn/4GWg5y9UiWaKBAYy/G0DD8
         AzzwAiOb2vU+jZI06R3GtCxyt6zsYky7F6y69vJddM3SisrUmkGa/392HMm0XfN78J8o
         oeaw==
X-Forwarded-Encrypted: i=1; AHgh+RpaBpM3AC7VhKa/tb6lsbsfb/1TyBiIctVZX6+R2zJQ9DxZ9VrrAhxE+0sEyqDfb6fdYk/No5CruXdXfqa8vol7@lists.infradead.org
X-Gm-Message-State: AFuF++lQhwSRuHinljPvq1o0+1txnDOzH9tcrB3/rs89rL6LuN87jtX8
	6UJFnXkEB7qJoXHRIt5U3n5bBxJpsXFoUcSF03aKn+onlrXih9LSFmDp5NHCnp1rRiludYLeMMs
	GTgQ4nnodFenriszvTfAHg1Y5IXb6RlqKcVLFMULl
X-Gm-Gg: AR+sD11iZLSdh7Y+abpq1t2N3nPBqXGM9uLjQHKz/wF6pTHuBy9gaPFU9uFwlth5NIf
	gCkRzhFDrk+81rpIa3Ph+6cCGK9Sqs4dTGEAlQ72/VvUOs70TQfmYAv59KUULR0uZ0eHCh594qF
	fTLtODbObxGQcJwv9WTZ3zX/O23vw1aUp7alepGvh3KSWrDp831iFW8BBqOifdfqbhncajWdxvi
	UHYkaAGIm1K5YGVQ39wgvfhXhoXAka2DlMetSokzM7BoIBP5Mhl9kd5av6OI7PE4w0uORcBafPy
	Uy1V/FbSEc8eIlWMpYVfFknSU7sbg6j1tYWQvAx1/8l9BiIFNlUkhR+qMbTUt+99NlcvwFkHNtp
	aqsk=
X-Received: by 2002:a05:6214:401:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-90c5e68b4abmr133956736d6.1.1787237272678; Thu, 20 Aug 2026
 07:47:52 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 07:47:51 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 07:47:51 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoVut/h1u7HdFxkR@yzhao56-desk.sh.intel.com>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-4-5298f42d49bb@google.com> <aoVut/h1u7HdFxkR@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 07:47:51 -0700
X-Gm-Features: AcwNN1WYYXv3T1n5AIJ_TiYtLTY6vDd5CVOeUwq99s4OCRdrQcgzzR3vkPd99ho
Message-ID: <CAEvNRgFFs2BC7m8YH7RnQSysU+eDqOjQpqAxL09mwJgrT_iYww@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: guest_memfd: Stop returning struct page from
 PFN lookup
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_074756_135645_2C965A61 
X-CRM114-Status: GOOD (  20.68  )
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Tue, Aug 18, 2026 at 09:15:55AM +0000, Ackerley Tng wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> KVM currently expects guest_memfd PFN lookups to return a refcounted
>> struct page, which callers hold across fault handling.
>>
>> Holding a page reference across fault handling is problematic for
>> guest_memfd. In-place memory conversions between confidential
>> computing shared and private states inspect folio refcounts to ensure
>> exclusive ownership by guest_memfd. A concurrent guest page fault
>> taking a reference on the folio causes conversions to fail due to an
>> elevated refcount.
> Nit:
> As this series is based on kvm-x86/next, where there's no in-place memory
> conversion yet, kvm_gmem_get_pfn() does not hold shared filemap invalidate lock.
>
> However, the benefit of dropping the folio reference immediately before
> returning from the guest_memfd PFN lookup -- preventing conversion failures due
> to an elevated refcount -- should be effective only if the reference is dropped
> before releasing the shared filemap invalidate lock.
>
> Do we need to make this info clear, since I think it's important? :)
>

Is this what you meant?

  In-place conversions uses the filemap_invalidate_lock() for
  synchronization of shared/private state. In kvm_gmem_get_pfn(), the
  PFN needs to be prepared according to its shared/private state. Hence,
  the filemap_invalidate_lock() is held while guest_memfd gets a folio
  and decides to make private before returning a PFN.

  In kvm_gmem_get_pfn(), the folio refcount is dropped before releasing
  filemap_invalidate_lock(). This ensures that a competing conversion
  grabbing the filemap_invalidate_lock() will never see an elevated
  refcount due to guest_memfd's folio-getting process.

It seems a bit weird to fit this into the commit message for this
patch. I think I could put the above two paragraphs into the patch that
introduces the filemap_invalidate_lock in kvm_gmem_get_pfn()?

>> guest_memfd already notifies KVM of page invalidations, so callers
>> within KVM only need to respect the MMU invalidation protocol to safely
>> rely on guest_memfd for page presence.
>>
>> Furthermore, removing struct page from the guest_memfd PFN lookup moves
>> KVM closer toward supporting memory backends that are not backed by
>> struct page.
>
> Could we also explain why the lack of SetPageDirty() (and mark_page_accessed())
> for a gmem page, due to NULL being passed to kvm_release_faultin_page(), is
> harmless?
>

Sounds good. What do you think of this, continuing from the paragraph
beginning "Furthermore":

  Drop the folio reference immediately before returning from the
  guest_memfd PFN lookup, and stop returning the struct page pointer.

  ARM's gmem_abort() is guest_memfd specific. Since guest_memfd no longer
  returns a page pointer, there's also no need to do any
  freeing. kvm_release_faultin_page() originally also serves to set the page
  dirty and accessed under some conditions. The dirty and accessed flags
  don't matter for guest_memfd anyway, so it is safe to just drop the call to
  kvm_release_faultin_page().

  For ARM's kvm_translate_vncr(), initialize the local page pointer to NULL
  so that the shared cleanup path that releases fault-in pages safely no-ops
  for guest_memfd.

  For x86, no additional changes are required in the MMU fault path
  because the page fault tracking structure is zero-initialized at the
  start of page fault handling, ensuring the refcounted page pointer is
  already NULL.

>>
>> [...snip...]
>>

