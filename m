Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B524CC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeU8AkJ8MGIav9tcLVv0+ySWv2dXd+zHgL0Diag8WfA=; b=IAEdggNy/fTmZGQv1BbdmZ10m3
	LV6k1llGHyPS13aqVs+itVaDwS1+4RRSWoYOFwbmn0830moQWjEnE92n8gAU5LCKUce+oPTgbPnO+
	T5a5pdYBQ7l/UPqStKgu8VeR8OpBMeAGieTNB43JYvEill4lzXYbOqdjzKRyxVTFHzBJYWKorGllx
	nzDOBPB6zqI121NSVzx6Loj+ES6xye/cH4iwapmlejdyOrrw92M8mrVHJThitlv4zdUiTkupNaBvk
	qf++JT1UtA+EO5NzzY9ZGRv1qYDl3RanqJJEOaOoEC25xrc3zM1GpjC49NAIpVRmzrgEl9y77bCw2
	ohQ0LvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynYL-00000000VNA-05fM;
	Tue, 25 Aug 2026 09:34:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynYG-00000000VMB-3yrI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:34:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so23946865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787650479; x=1788255279; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeU8AkJ8MGIav9tcLVv0+ySWv2dXd+zHgL0Diag8WfA=;
        b=AYlzOkQHc+Kolv8pyFl8AqkyLv1tCRbbV9fNZ2ZcjTj5+qZLLSKyRnq8iGE4+DdQ8P
         86AyDj7TkHiEAYPd/U6SGoPAKFOge1ymnh7U675u68kzDoXTm3k6NT3hMjR+6zIyvHsR
         hL7a4ZSy92vU7CdeNUtpfUsRG3kveaHYa6TdL2uMkCh51Bs2Jrrj8m/eTC0Pe4Ju5eWf
         AWek/0CWB7+pEly8oI55wopwiibqxNmws3bf4LyCqLu2YlntDh8GplqhAvbFF2aS4g5M
         Fhdt+goH06zVjjbmB/TTYm1P3XKUM6sF1wgvMfHs3u/RgYh9afBx5weBS+fINHlLK5Q2
         Ip+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650479; x=1788255279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeU8AkJ8MGIav9tcLVv0+ySWv2dXd+zHgL0Diag8WfA=;
        b=n75ZjECFisfspwn/IGhcN6j4SQBgkDFYV5CyW57wmkyxSyrJ/f9jHHyVcrkzc4wuoR
         7QK0J+6QI8uCLr8BUdBbSmCqIza5PKlp2V5nxffwclWMoCY4arljqHiphYFDUqIoF/SH
         KLmIqHgxJ/qQM+vCJjpLFpmoNb55CYIUuW2q7hbUKYpWALU7v84EnDNECaxFgjtz3Y85
         Qh+hGtsbNh21CFu3MC/Ca1dSf1zWMMlDu8fkolbfW+kuo/snfqMhde+qOn+ItO0C9NAD
         HXBB8QF9ky4yiIOZ6RoNcEL5GosQIJ7hzyA4H9TMajIW/USH6o12Puhehi8ybky9tZq1
         ns8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqL5E6wc5G74FIZnDmtgXNNvxK0bWL7ZKgqrxmSg+dx4zvFvpTKNkODpJWFT1dOqiKFJOHuiPa8ho/MxUpkSTp7@lists.infradead.org
X-Gm-Message-State: AFuF++kN6x6kBYN0M2iXzt9wUlkIC7hWamKpu//mUWcNRDbUrMpJvO4l
	JUgCVszCGzKHmEBMYsZxpf7UBeIs0lzlQXtxb8Pcj9QtuUum7gNmAKU4wdUQojPWoRcuVBX4A5w
	WKJEVCFU2mCM=
X-Gm-Gg: AR+sD10v6HZNexfF7MXoQgNvxMM9SJaBvFoHN/G8EqwY+vzEahRVSNMU9BqBbty81Hl
	gfUH4cn7E7wbGms88eZdGMhoDE0i2Gc2lUvumLS9cRxcEDpSTRhl5LdoFwESuvlNsMqwAEyX1h+
	mkmKWUGPSgAjHw9dPtJdPPMDroDsQG7K3sXQ9f5yzgCl8PTXK1U/M9z9N08UADuCcGPivtDaejE
	jN2inrmCtR1JxcW3lol2sCiGNXIg4uM6lY+vGYCrIBp6LsO7ZaLEnSxi1Z2n/urxJ1wQp/0oLQd
	LUc7Wtgp9IxbdZEb9q1zbZTFyV0giJcgC8q3FWMXy48RYmo6Gum3z3FjclDnFk3enukgD/kCD5t
	vkT3vFTIKzzWODLnK/Fa6Lk+uf3UeyoTOFu63VYNvL2LPUY4gRGNki0twuL5on0QMycLxsYqCUl
	WdnvEiYr+L25aEV6Zz4hAlQXUvQ+ad8k4py2NLxhfD6voEZFums8YTTuph9rQPNxO3+y7AgR5zX
	4MTCm767SkKgVVdqu8rIZJaKfIJytNw
X-Received: by 2002:a05:600c:1387:b0:499:7a4f:d13d with SMTP id 5b1f17b1804b1-499b8313ad3mr338541545e9.4.1787650478642;
        Tue, 25 Aug 2026 02:34:38 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69cf5sm10736399f8f.6.2026.08.25.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:34:37 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:34:34 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v4 11/17] KVM: arm64: Filter out non-kernel addresses in
 kern_hyp_va
Message-ID: <ao1hqq-BCmKWmQE7@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-12-vdonnefort@google.com>
 <CA+EHjTycM7b4d1foNQr33e7dN7WHyeg-Ww8nPkSKu78DGDs9_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTycM7b4d1foNQr33e7dN7WHyeg-Ww8nPkSKu78DGDs9_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_023442_928226_481F5C81 
X-CRM114-Status: GOOD (  26.27  )
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

On Tue, Aug 18, 2026 at 03:45:23PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> 
> On Fri, 31 Jul 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > kern_hyp_va() is idempotent for the hypervisor linear space. This is
> > handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
> > pointers. Those pointers can originate from the hypervisor space (when
> > protected mode is enabled, we don't trust the kernel and the hypervisor
> > uses its own copy) or from the kernel space (we do trust the kernel in
> > "non-protected" nVHE).
> >
> > This idempotence does not hold for addresses within the hypervisor
> > private range, like the ones you get from the pKVM heap allocator
> > (hyp_alloc()). To resolve this, filter out non-kernel addresses based on
> > PAGE_OFFSET.
> >
> > Leave the assembly version untouched as it has no current users.
> >
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> > index 6eae7e7e2a68..d60e5f2de10c 100644
> > --- a/arch/arm64/include/asm/kvm_mmu.h
> > +++ b/arch/arm64/include/asm/kvm_mmu.h
> > @@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
> >   * replace the instructions with `nop`s.
> >   */
> >  #ifndef __KVM_VHE_HYPERVISOR__
> > +       if (!is_ttbr1_addr(v))
> > +               return v;
> > +
> 
> I gave this a tag earlier and only came back to the cost side now, sorry.
> 
> The check is unconditional, so plain nVHE pays it on every
> kern_hyp_va(), including the one in __kvm_vcpu_run(), and it has no
> private range to protect.
> 
> Could it be gated on is_protected_kvm_enabled(), the same way patch 17
> gates hyp_trace_buffer_alloc_bpages()?
> 
> Cheers,
> /fuad

Sure, that's really a micro optimisation though, I don't think that
is_ttbr1_addr() is expensive.

-- 
Vincent
> 
> 
> >         asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
> >                                     "ror %0, %0, #1\n"         /* rotate to the first tag bit */
> >                                     "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
> > --
> > 2.55.0.508.g3f0d502094-goog
> >

