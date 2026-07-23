Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81EDC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjKwg502tyZxWCtZ7RYBVZ1wpUQ9BQEXF5pbpjIjcNs=; b=oBZKuixQI5RfTy2IJeT4KUWIQ7
	2VNV4jQAsk39CznWnjm3MlZZ786IwQuDdlcD2U2d17cli27BpNjOq/AuR6dlLVw15edZUYAAWCT6P
	IEaxaY1IhWGaC150mEhipc0qf2+YQ8fbNtvJ7FICMsIMws/XYIjMkvkJ6KSWcbPzPJsGWIxMIUSYx
	T6V+tdB55RcyimUpcD2Gbi9HpYzJgH+MpvqCYBFCfDolTL+5VeC7Hb+dwO7vDHi0nkQ8jXyIVWzUd
	aJ+9i2z+w8yWXiIA5bbE1p/wEMrbADvcUveQmyZt61GRLRZw2l/J8ah5Ir9xUGeySaZbh1yxrDF44
	ZOjT12DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsZy-0000000EEzR-3Lr7;
	Thu, 23 Jul 2026 12:31:10 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsZw-0000000EEym-102f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:31:09 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51c15a5b265so238861cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 05:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784809867; cv=none;
        d=google.com; s=arc-20260327;
        b=TL0aL/44G3dPaAOri0yqaFz6WyzxqWU9LfNyr3jCbMtQlyhplcMeUEJQaofWKMkWz0
         y7Fet+kD8mODWG5cq5fbzl8UUIjjN1Xmd/kpPRdxuZxH4dnwPBYkU2Ox9+TI3zkCTm7j
         IeOtMTMHALBXOAnXGN47XQje1GWVo1hhIJ/Y3fsVEMoOyCDRRmiSWNSqOdsB4RL+b3ul
         G2ToxbM/ceNO5Y8jbMKFzyg53yHjLBJ1LQPMbt0feFGJ1l1KV70IeLEB8/WqNghMu4zC
         Usk23O+f0WL0CDWMRShll0ty4GU9wQq5pcKQBo/dTQDk6l/ZFELFPPeENCyDtM7dCHwa
         dJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GjKwg502tyZxWCtZ7RYBVZ1wpUQ9BQEXF5pbpjIjcNs=;
        fh=8qQg/F6hTnxb41RhUi15zmCDlNLDuJYAvmTKxo1SJBU=;
        b=bFza2hY8GfHlISc74naALi8RzWYz0LU/nrf22f+GGWLJD1zYCy9UbTM6givC8NoDu6
         z2QkaRKTUpaObxMfVdXCFYHad/OtcJjH+vSLU7tSu05TKbjJD3E4HVtOASLagZAqNFjN
         UAfVlSyCowUasRM9o3OJMwOMmglk/xHET5pnMbjTV9PAPUH2E5dYNdeHjk9We39kl+ET
         +jpfo7ALrsNuyudZCYkVqOtp/Hy8D14oPDksGLT6DbXSKoppedZS0Y5hQFOjPfa4cSp3
         oH9S+KGV8dOFuTpmGAzuc1TNS1j4BFQBgfnBQwiNpxoYTrdfoOovuEDOKhqihwHQyLWk
         LSFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784809867; x=1785414667; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjKwg502tyZxWCtZ7RYBVZ1wpUQ9BQEXF5pbpjIjcNs=;
        b=EVQHHO1amI3CAjvp+YWb5iZWTYeqyigjGVDLwIHWL8lzdSWJHzt9FC3zmTmd1eRAmT
         +xMkZdxbvGNhkpm22Akxm16dnO4E6/EYmQuH0ATPSrtE2dF7s4C357RkV09n7gj5q18S
         9qkmrU+F3H9Zv+8h14pwQnEGSs0R7kQgxH3gMKooKUnSrweM1SW8ixZosAlpc19UuKTE
         BfmImELrAVFg5r0/9NNh9gra0J61dnJ6KyYp5GPXPm4v/mh9cghcrTRxmTtnr/9IpWIn
         i4j9LqWI/TpiYb11TFQRzPB8iuZJJi+xEhJoXFtKPMxkfhv+IUMO4WGHe8V4yUgYdo8l
         BflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809867; x=1785414667;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjKwg502tyZxWCtZ7RYBVZ1wpUQ9BQEXF5pbpjIjcNs=;
        b=Iyz53aB8LA9hAQWM7lHF4d/1CmnYqmsgX5Des+5yPEZl590jR/RuthflLyvgQ69VLN
         koo1vggYLCt0vAmgN0RrjBXzZAgAW+Odw95hmac0aMpQWYmiOqhpTfvoYNG8BXra/2Zg
         VJf9G3Xg+FQ6Wt7HR7tcRnaSPs4mWVTnVm5alCjTnV48erCgDD28sQqdSRB5/RXkD1x7
         cKpvHUckD6dxMojjtOX2n5OGPdgRX2Vsy8KkETOiLMN8v05nSuiUE1dQ/ZXzYV8wv+y1
         kcqI0DYl8uzpI7/ZuOJ4nS3x7zKpWdMZmBqv9Y10JTVHvuOUF9+IxBRtCdee5FG2R1Ql
         vjTA==
X-Forwarded-Encrypted: i=1; AHgh+Ro50ot/bMi9JMHG+3p9slOzakHPr0PwV6c9iiJ5Qo2kTnmItFH+T0HFdVNVHsX9ER7SuXp6Lu75s9U+l7JdyFOT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+JNBEoVrbow7mEcvYxqJGC66dRoJMGkFpxiaNNHb65bIljBPt
	+ucXZveCndgSjTwqLKG7UtCciuWcROHaju/MNCsxEdSGDzMkQdTQQRRFqHmjcfDg0vSC5RRnPi9
	wMPk+s47sJqX3nRPwZjdY4Mo6ordDYm4lVJzVH9zi
X-Gm-Gg: AR+sD13q5jOD4NWfFx2HlqpgZtDvyvwmhDeLo9cECG60nDpwe4gbxTCpgTk1UoHQCYw
	W+xF6tJzgol859bwq37Mujws05fA4oGRiKj+LGO/7Nx8W5FWjo7D+2KdxeZqXdVE4AdJXsVOrMm
	DhNHyLWv+c5his7lcn8TuWDoDMVGI8DcxgMH4mks2pC1Kzs0OWXrUhWvJPC/AxHPftK8XaggfWu
	lzLbDywFZiAZpCGEj/Lp0fmXdQtjvgWTkir6Rbrgv4qGxI+HnxSWmJ/MswoTQ==
X-Received: by 2002:a05:622a:aa43:20b0:51c:7a90:a797 with SMTP id
 d75a77b69052e-5283d85b7b0mr7596281cf.23.1784809866173; Thu, 23 Jul 2026
 05:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com> <20260720171513.1415357-4-vdonnefort@google.com>
In-Reply-To: <20260720171513.1415357-4-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jul 2026 13:30:28 +0100
X-Gm-Features: AUfX_mzbQdbtQwzjAF4zylFKz0WUrBhvIzo9qg77xEfFDecvyAhNZcw6XIXOZ00
Message-ID: <CA+EHjTy0ghocNgufEbieYuKn03f7_kCHH85YcmQ+xviO9GtaLg@mail.gmail.com>
Subject: Re: [PATCH v3 03/17] KVM: arm64: Add pkvm_map_private_va_range
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_053108_292460_C4914152 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In preparation for the pKVM heap allocator, introduce
> pkvm_map_private_va_range() to map a physical range into the pKVM
> private range.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> index 00cadd13ee5d..ea97ea49820e 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> @@ -31,6 +31,7 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
>                                   unsigned long *haddr);
>  int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
>  int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
> +int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size);
>  phys_addr_t pkvm_private_va_range_pa(void *va);
>
>  #endif /* __KVM_HYP_MM_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> index 5cd2f1fe51e4..20e4445dd57b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> @@ -25,6 +25,7 @@ struct memblock_region hyp_memory[HYP_MEMBLOCK_REGIONS];
>  unsigned int hyp_memblock_nr;
>
>  static u64 __io_map_base;
> +static u64 __hyp_private_va_start;
>
>  struct hyp_fixmap_slot {
>         u64 addr;
> @@ -90,6 +91,31 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
>         return ret;
>  }
>
> +/**
> + * pkvm_map_private_va_range() - Map a physical range into the private VA range
> + * @haddr:     The virtual address in the private range.
> + * @phys:      The physical address to map.
> + * @size:      The size of the range to map.
> + *
> + * The hypervisor VA @haddr must have been first allocated with pkvm_alloc_private_va_range()
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size)
> +{
> +       unsigned long addr = (unsigned long)haddr;
> +
> +       if (!PAGE_ALIGNED(addr | phys | size))
> +               return -EINVAL;
> +
> +       guard(hyp_spinlock)(&pkvm_pgd_lock);
> +
> +       if (addr < __hyp_private_va_start || addr + size > __io_map_base)
> +               return -EINVAL;
> +
> +       return kvm_pgtable_hyp_map(&pkvm_pgtable, addr, size, phys, PAGE_HYP);
> +}
> +
>  phys_addr_t pkvm_private_va_range_pa(void *va)
>  {
>         kvm_pte_t pte = 0;
> @@ -450,6 +476,7 @@ int hyp_create_idmap(u32 hyp_va_bits)
>          */
>         __io_map_base = start & BIT(hyp_va_bits - 2);
>         __io_map_base ^= BIT(hyp_va_bits - 2);
> +       __hyp_private_va_start = __io_map_base;
>         __hyp_vmemmap = __io_map_base | BIT(hyp_va_bits - 3);
>
>         return __pkvm_create_mappings(start, end - start, start, PAGE_HYP_EXEC);
> --
> 2.55.0.229.g6434b31f56-goog
>

