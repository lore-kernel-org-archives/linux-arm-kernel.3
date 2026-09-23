Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D17CC98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWMa9OalqLq0fLbQDb1XYdlsmfjX+7XGI2dh0YL8MJQ=; b=are9zUXu6PD8Py/h/CW9e/uEAE
	sxPkJqhKKF+k83Ud5udVAonFW3D2cSEx3B29tLk2iXYuM7RbtcRWt1rCZ0Cc1+mPUEDMKkuoauI9f
	Q8aOKhLa0Ep3YpmeFtEmP2V1lYuqF+SOQcuTSvLCV35SzprygeRglMv2zjiHczgORPAuVGv9luAku
	b2wp7Emsu5vCFgMNCUcIg5bzEmSUsCRcTh2KBGDdQffKcU6QVQhXvXFFQwqDjEK2hmVNiiGRn8o0J
	l/As4vTaBoYqJab3raSYeDgNEU1MesIolGVrAfT/upKyp2iOWWN9hYjCY3Bq9BR+XPfp14iFis+VW
	rRApfmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KnL-00000007zE6-1PKo;
	Wed, 23 Sep 2026 11:05:47 +0000
Received: from out-146.mta1.migadu.com ([95.215.58.146] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KnI-00000007zDe-0zpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:05:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kHep/UoJdFlSFtMOk5eTsBvsgTZFrj+duqNAdJba03Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790161542; v=1; x=1790766342;
 b=G9JVWcXxhRKoYaz+VObIY7RqO6JcArdp6rKqbOJy1zAjIYti36x2SZzXeo31m8Ko2+Z00xGV
 T5+rEFcIT3PGCQ+VaO5UvjaPSeFSQuw+fCYac//ZlqsmbUU20nzSY3zkwxnsEgihwCVkfXzUO9B
 +4Bykx/odZwtzo8QwnHqmmxo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ef1ca11f6800b6b9;
	Wed, 23 Sep 2026 11:05:41 +0000
X-Mizu-Trace-ID: ef1ca11f6800b6b9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso4525e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:05:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUZCANtauMyW4Ewqw2KVCSpOsx+/kd6wqhLmZVYCch4Qc7oZs4s39ffgZLRtOlAswcaePkAZ/Fup2le6Fu6tpf@lists.infradead.org
X-Gm-Message-State: AFuF++lHnxgb8oJ7NMtz02zbyHdpT/mGfI/1K3t51W2Aes38ykLCrGSj
	q+yFmlUVDmthOGzUR2zDstsdrgUzAJHj/Wj8KJBidYOf9xeoPv4e1HNDUYb5J4PS4IBJgLzfCSp
	r+lN4IjvjNtzuTZMRMRd8L9nL3bc9JKSXUThaa8aQ
X-Received: by 2002:ac2:4c54:0:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5b8d915cbe7mr97644e87.5.1790161539952; Wed, 23 Sep 2026
 04:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org> <20260922-kvm-arm-prefault-v3-8-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-8-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:05:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwSRAGe4iP2E2V=b+baQ_GRYpYoNzJSft385m9E5RvEMg@mail.gmail.com>
X-Gm-Features: AcwNN1Xp8lA6R1poRNOfE-88mv5Px32o87Y3m3XsUHw9H9Pq7uMPdjPzqDpKw3o
Message-ID: <CA+EHjTwSRAGe4iP2E2V=b+baQ_GRYpYoNzJSft385m9E5RvEMg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] KVM: arm64: Propagate EHWPOISON in kvm_s2_fault_pin_pfn()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_040544_424386_B1F10B5A 
X-CRM114-Status: GOOD (  26.28  )
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

On Tue, 22 Sept 2026 at 15:19, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Currently kvm_s2_fault_pin_pfn() handles a poisoned page directly by
> sending a SIGBUS signal itself.
>
> This is an odd place to do it, the caller should decide what to do with
> errors, so move the handling to the sole caller, user_mem_abort().
>
> This lays the foundation for stage 2 pre-faulting which, arising from a
> synthetic fault, should not send a signal.
>
> In order to do so, check to see if user_mem_abort()'s caller has set result
> - i.e. whether it wants to be informed about the outcome of the fault
> handling.
>
> If it does, then it is implied that it should handle the -EHWPOISON error
> itself. This is the case for pre-faulting.
>
> Otherwise this is real hardware, so send the signal.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 221ea069f9bb..2576b967d20e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2016,10 +2016,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>                                       kvm_s2_fault_is_write(s2fd) ? FOLL_WRITE : 0,
>                                       &s2vi->map_writable, &s2vi->page);
>         if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
> -               if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
> -                       kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
> -                       return 0;
> -               }
> +               if (s2vi->pfn == KVM_PFN_ERR_HWPOISON)
> +                       return -EHWPOISON;
>                 return -EFAULT;
>         }
>
> @@ -2261,6 +2259,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
>          * get block mapping for device MMIO region.
>          */
>         ret = kvm_s2_fault_pin_pfn(s2fd, &s2vi);
> +       if (ret == -EHWPOISON) {
> +               /* If result is specified, let the caller handle this. */
> +               if (result)
> +                       return -EHWPOISON;
> +               kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi.vma_pagesize));
> +               return 0;
> +       }
>         if (ret != 1)
>                 return ret;
>
>
> --
> 2.55.0
>

