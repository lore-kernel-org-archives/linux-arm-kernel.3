Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C39C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+m6HPDtb0R18pUg/qJCD2U+j03ktvX2ktaHxXO8cS8=; b=s63NCeVZw7oukrx3XZjbjjJp9c
	6LbVGaZZSn0B0Z7WIEizzESI6Hv7sBWdW2g2w4ppgA5mSx3tMgRLrB0fp0eeRJ5PdZY3RuzTdl7ZW
	xWiGw6FWQzVR39LWzvrTrZzIoLXfJOxPfwa5fcFbmQQ6HNCSisHYjZlPSI9Pp8CTf7remstVYKquw
	2sSy1QNKV+/zrEsNsjrOFHFvn4bV/DhTzjwF03wYEC1Y19TO3NqadeeFS8L2VvWRuEu4N0rzl9sol
	4j6MfUrGEyeCFr+SZW6oQJrSRz+gQfOec9Wmp8UdTlEPNbUojeZMsY7htllG0qd1KO/N2B70UXdwF
	EgcvMbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVk1-0000000E7HK-0hPG;
	Wed, 07 May 2025 03:46:41 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSGM-0000000Dl8T-0fPo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 00:03:51 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2d9ea524aa6so5678595fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 17:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576228; x=1747181028; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+m6HPDtb0R18pUg/qJCD2U+j03ktvX2ktaHxXO8cS8=;
        b=dyw0BmzPnHd/rRmN7NtAHGuip8dvSQYuNowI++VUxmQgCPIcssjmMiV1xT1v+JnQbA
         feJyGNP/fidyCTPe3QlKzmaQ5nJNlhUCxFzwNTDtzAEw2V73EFErUWUF67Hqz9zFS7Qr
         NXpTX8YssrEglAMo1MuZyQ8Dx8ghL+QvqSwWSFn4kwt4nzYkF42nN5hwlfgeWZObNXVT
         OfBE8ZGquwWy6UDElAYumRfUB7p/kBfVDf52YcFmlzRDmAwCEWYyPdPiyQ0mdhZwt7fW
         xrPKojsiLek6axQw11kByjN0ZW1LNU06D7vOY4PGcs5d/voqRkmN4UPeoPRm1fXuTV7H
         SucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576228; x=1747181028;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+m6HPDtb0R18pUg/qJCD2U+j03ktvX2ktaHxXO8cS8=;
        b=GEa9N7GhkKfr4zCJoHSprvmY0tU0x7EScSmzJkCakhTqQv7mdtcrKpZWuwC8iZ7naH
         P4xwf5ya3TksstL+M+csY5ScZd8UihdLW2ml8wnvioJ3+ZAfSguKkuC2ysRIMDn3H0Lc
         Cj3XLCdHfnmubwJFCL+nMmkwuWYUpiPv9bJwmW5xuBYkyDBDoumQIWT42XuBE6Xfht3q
         YzAX9s/2PqPG83ai1ioHKLJMr1DlAQifNXkrId7BdT63VVomyh3UACqU8kj81YfcS+eP
         BKq2k0F6Ilaq3cmF3TIpxoPHLSlwcKee6yuM8vRcdp3n2ZgWsSRCxkqAvzpUKbeD+kKb
         yzlw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsu6usdDmJRuyc3vSmB7Bw/P/rLPpzkeleLvquyKZmr2DpW6MVFpDuJ1UxqHsLi1q5ECCVRmf2Ff/sASMBkdv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd3osvAOGed68HL6PCO5Hb4hqxiDr7XrhacnKKZDHyFm4Ql/OS
	1eHfGaJUBeWUyGi8/kdXZiTrRQqlVx6jb26hP25zdiKzCbhuFi9Bj+EgsntiWqiXS/5hQnoH/1k
	MJg==
X-Google-Smtp-Source: AGHT+IG6Fxa93Bz0YoXvtTYguCqgLiKUWD1kixt49zVH2HtfKhQptZBHYIAFUFv7wo+hSUraRC2rqINWD4c=
X-Received: from pjbnb1.prod.google.com ([2002:a17:90b:35c1:b0:30a:7c16:a1aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d8c:b0:2f2:a664:df1a
 with SMTP id 98e67ed59e1d1-30aac156361mr2370837a91.2.1746576217154; Tue, 06
 May 2025 17:03:37 -0700 (PDT)
Date: Tue, 6 May 2025 17:03:35 -0700
In-Reply-To: <20250109204929.1106563-4-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <20250109204929.1106563-4-jthoughton@google.com>
Message-ID: <aBqjV40pb-s9gvsz@google.com>
Subject: Re: [PATCH v2 03/13] KVM: Allow late setting of KVM_MEM_USERFAULT on
 guest_memfd memslot
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_170350_197898_0FDE8DC2 
X-CRM114-Status: GOOD (  24.69  )
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

On Thu, Jan 09, 2025, James Houghton wrote:
> Currently guest_memfd memslots can only be deleted. Slightly change the
> logic to allow KVM_MR_FLAGS_ONLY changes when the only flag being
> changed is KVM_MEM_USERFAULT.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  virt/kvm/kvm_main.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4bceae6a6401..882c1f7b4aa8 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2015,9 +2015,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
>  			return -EINVAL;
>  	} else { /* Modify an existing slot. */
> -		/* Private memslots are immutable, they can only be deleted. */
> -		if (mem->flags & KVM_MEM_GUEST_MEMFD)
> -			return -EINVAL;
>  		if ((mem->userspace_addr != old->userspace_addr) ||
>  		    (npages != old->npages) ||
>  		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
> @@ -2031,6 +2028,16 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  			return 0;
>  	}
>  
> +	/*
> +	 * Except for being able to set KVM_MEM_USERFAULT, private memslots are
> +	 * immutable, they can only be deleted.
> +	 */
> +	if (mem->flags & KVM_MEM_GUEST_MEMFD &&
> +	    !(change == KVM_MR_CREATE ||
> +	      (change == KVM_MR_FLAGS_ONLY &&
> +	       (mem->flags ^ old->flags) == KVM_MEM_USERFAULT)))
> +		return -EINVAL;

Oof.  I don't even want to decipher this.  Let's just drop the blankent immutable
restriction, and simply say guest_memfd slots can't be MOVED.  guest_memfd doesn't
support RO memslots (and never will), and doesn't support dirty logging, so this
is effectively dead code anyways.  Then the diff is much nicer:

@@ -2012,14 +2027,15 @@ static int kvm_set_memory_region(struct kvm *kvm,
                if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
                        return -EINVAL;
        } else { /* Modify an existing slot. */
-               /* Private memslots are immutable, they can only be deleted. */
-               if (mem->flags & KVM_MEM_GUEST_MEMFD)
-                       return -EINVAL;
                if ((mem->userspace_addr != old->userspace_addr) ||
                    (npages != old->npages) ||
                    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
                        return -EINVAL;
 
+               /* Moving a guest_memfd memslot isn't supported. */
+               if (base_gfn != old->base_gfn && mem->flags & KVM_MEM_GUEST_MEMFD)
+                       return -EINVAL;
+
                if (base_gfn != old->base_gfn)
                        change = KVM_MR_MOVE;
                else if (mem->flags != old->flags)

> +
>  	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
>  	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages))
>  		return -EEXIST;
> @@ -2046,7 +2053,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  	new->npages = npages;
>  	new->flags = mem->flags;
>  	new->userspace_addr = mem->userspace_addr;
> -	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
> +	if (mem->flags & KVM_MEM_GUEST_MEMFD && change == KVM_MR_CREATE) {
>  		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
>  		if (r)
>  			goto out;
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

