Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA51CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzPVgnzMxw0u/5rPyRAI2idtL300s+mFFNLf4vaxnoI=; b=XEsoANtPwDYn4is9gtmAkmJyFI
	+UKkjr/Go8xTJB4p5tVe6nk6u6iyFTFMmqXaAkiogRDohI1wq1AxtDnMATUj+R6TNdedByf5ZG5C7
	APWQKqyx9swaZJfYexgi6bHUr0hr8xfHoIT2ikB7LqbuhZGkIHpn6RVNwH5NiRmGbkdi0kPK49/+1
	GEoj246Cls0+uht6A1hm9PcD+TFTiMFetZDZBuAf4UivcSM+Lc7WAQ1sZp5lDUuzRY96MAp9mTOgN
	gz6MITXDeEMGhV8q3HLBGLzFwBST5IUx8z7m73sEt0cHCKiUlixnxVBSNYrSOFc3X8w471CtedgIo
	+FMbjMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zAx-0000000CvFB-2j4D;
	Tue, 23 Sep 2025 09:19:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zAv-0000000CvEo-1EWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 09:19:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4688326f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758619143; x=1759223943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzPVgnzMxw0u/5rPyRAI2idtL300s+mFFNLf4vaxnoI=;
        b=tVA/GEC7/PVrRz/AYLF+j23LPfHLzQ5JDTWZVw5x0JYrvKw+jLG+/Yg/+L7Ji+d3rv
         GmK18ZKWoltQ1VbLwQequ0q5aef1pgoWNWMPAMh7lNLUiHaYGH4NM4Uw5wsQ5BK/U2+D
         MW7v1Gh/5pQMStoX7dd9TSCGd5XZwHHXwUsdMo/DPZ+11uZXPv4m7mfY4NEY7qnF+RzS
         lsH+TJNwwEUkTaPEwQ2yA0KZJCtX3kd1HIlvK7KjEHhrqtKvIiaHnZoC+a+e/BaLbG+K
         W2TxMGwvcS2hpkhjsGLpHXJvSFE7YjFpDlMHzZP4QDE7rABPDiuGF8nBJFj9RLaMNqUb
         eqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758619143; x=1759223943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzPVgnzMxw0u/5rPyRAI2idtL300s+mFFNLf4vaxnoI=;
        b=UWrO9AwKFNLiV3QNCkxkRZVpvOE8bWgwlT87pufFxg561R5nbUXc2CYM1sCcitmlkw
         9Nht5Jq83YSFtdF6P41C16eoic7MHqSVmOLbT8l6/AjnzCQQG0o2dwHbxViTxj2WxxlU
         lcWktqhMg/9aLUkSiPKVqRKcXVsuyTQXgCNi4euuTLFcwNmF2b/ZQLGt2ONCk2fC9qrE
         pQTD+oUtQIdkO9FlP2/A8uUZ/NfzCRpGqVZ2GTFKKa3ay+QPgMUY1sfKRG8HWE28L5Oh
         q17WGj66Wv1gmBpZU080EcbJc9hVWsGgAiUFN+ofmv69YSRKOReKFMKhgi0K08Tzvmh/
         UuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3y0I4clao0fdqjJsTilszGvxGPYLBwvVs+jYx9PEoiDYSpirUOoWGNovqfcLdpiQms8lJSz82hvAUp/gbSD5n@lists.infradead.org
X-Gm-Message-State: AOJu0YxIcCfcJKiSeONg3UOXQ47M9/lFaOODHizGAf4a/9Vfv1DhZ8nB
	oDp+0q6Chz6N4PMI0Pd9FEeBMXbGTa3tHieDQnbVq32f5iooQjzK1JiGbd8bSZEhEg==
X-Gm-Gg: ASbGnctC2/McwkzIaQ+0PfkNqosiznktQxUhSyDAWh5sjmMm2T7twWCcTc8TlheW+Fl
	vlWRB7TDz6nJ2saaffuL82833oTI5SvY7/u6sAhhc/LMGv2Y408oY+0c8YNc0cMHNHqYnN9Yz/N
	3JS2FZGnyKMMmZ1R6vpPCI6K8Sks7hRkhzA33OwZ19lnfym/HOdQe23dViDpZCDn1RGI7fhPku+
	A1TMBxdEAY+tX5Ly1Z0gWaH823gjbJwWDEyXhNUkLSWhzaQT2bKKKdvaPosIvNXtDzudtdZgIpa
	iR6ECak/bIQdA2A0cI1nZWXMKHzfHOjl/ILeIWJIVJE0fY02OjwLyGK3D1t9WSmr8OtLtyYU1Fh
	7Rap8dR+DJ0zh745/nS4tMYXMnFKB4sViaNJO7CblxV8oj4ihAjMMBwU3O0psG2RfzoLqV8Up
X-Google-Smtp-Source: AGHT+IGW/BGKmTwR+8ZWW1MRwZl0fncm95Jhv/kZ6B+0I1aPkL40IEURTciwlEaJlI8gawUIXIITSw==
X-Received: by 2002:a05:6000:4313:b0:3da:d015:bf84 with SMTP id ffacd0b85a97d-405c76a1cb2mr1589577f8f.25.1758619143195;
        Tue, 23 Sep 2025 02:19:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee106fd0edsm22499598f8f.53.2025.09.23.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 02:19:02 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:18:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com,
	sebastianene@google.com, keirf@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2] KVM: arm64: Check range args for pKVM mem transitions
Message-ID: <aNJmA-1ZlikW2Knw@google.com>
References: <20250919155056.2648137-1-vdonnefort@google.com>
 <87plbkxcvv.wl-maz@kernel.org>
 <aNG417MneSKBxyn8@google.com>
 <aNHcxAJXHeS2T7TH@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNHcxAJXHeS2T7TH@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_021905_488337_1BD93EAC 
X-CRM114-Status: GOOD (  36.37  )
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

On Mon, Sep 22, 2025 at 04:33:24PM -0700, Oliver Upton wrote:
> On Mon, Sep 22, 2025 at 10:00:07PM +0100, Vincent Donnefort wrote:
> > On Sun, Sep 21, 2025 at 12:29:08PM +0100, Marc Zyngier wrote:
> > > On Fri, 19 Sep 2025 16:50:56 +0100,
> > > Vincent Donnefort <vdonnefort@google.com> wrote:
> > > > 
> > > > There's currently no verification for host issued ranges in most of the
> > > > pKVM memory transitions. The subsequent end boundary might therefore be
> > > > subject to overflow and could evade the later checks.
> > > > 
> > > > Close this loophole with an additional check_range_args() check on a per
> > > > public function basis.
> > > > 
> > > > host_unshare_guest transition is already protected via
> > > > __check_host_shared_guest(), while assert_host_shared_guest() callers
> > > > are already ignoring host checks.
> > > > 
> > > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > > > 
> > > > ---
> > > > 
> > > >  v1 -> v2:
> > > >    - Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
> > > >    - Rename to check_range_args().
> > > > 
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > index 8957734d6183..65fcd2148f59 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > @@ -712,6 +712,14 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
> > > >  	return check_page_state_range(&vm->pgt, addr, size, &d);
> > > >  }
> > > >  
> > > > +static bool check_range_args(u64 start, u64 nr_pages, u64 *size)
> > > > +{
> > > > +	if (check_mul_overflow(nr_pages, PAGE_SIZE, size))
> > > > +		return false;
> > > > +
> > > > +	return start < (start + *size);
> > > 
> > > I will echo Oliver's concern on v1: you probably want to convert the
> > > boundary check to be inclusive of the end of the range. Otherwise, a
> > > range that ends at the top of the 64bit range will be represented as
> > > 0, and fail the  check despite being perfectly valid.
> > 
> > Do you mean allowing something like start == 0xfffffffffffff000 and size ==
> > 4096?
> 
> Yes, this is what I was alluding to on v1.
> 
> > But I guess that would still put all the following checks using "addr + size" at
> > risk. Also, I believe even the code in pgtable.c wouldn't support a such range
> > as it is also using a u64 end boundary.
> 
> I'm not sure I follow. Ranges are pretty commonly expressed as a range
> terminated by an exclusive value. This just hasn't been an issue yet as
> the page table code is only ever dealing with TTBR0 or VTTBR
> translations.

If I do exclude the end boundary, evading checks would be as simple as making
sure we overflow the end boundary?

e.g. __pkvm_host_share_guest(phys = 0xfffffffffffff000, size = 4096) 

        check_range_allowed_memory(phys, phys + size) /* nop */
	....
	for_each_hyp_page(page, phys, size) {  /* nop */
               ...
	} 
	...
	/* Install a valid mapping to phys */
	kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys, ...) 

> 
> Anyway, I'd rather these range checks have as few assumptions of the
> applied address space as possible.
> 
> Thanks,
> Oliver
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

