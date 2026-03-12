Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE9106ACDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6+OtjaK5kpQwDsWtWbZL7QFm/NMyVy7mbGZ1ghV8IA=; b=c39xvJNIVR3+2n5xMi0fqPfTTn
	LQwob5zbAgUZrBHUMX/1n1o3XK76DDSOFLZX1iu+D3TdCT27EmaWkZ4K6qqA46KL/QSUpHLHS4tQT
	oYZ6413l3f6hjQY0hSGaKBUaWdYmuhUFGbLH3z5aajJAjofgDtInlbGeZA+3K2h0kjmB75IxOy8ed
	rW7plhX8iXyBUdZ9zoVz6wLWBf5gswiLGyyx4Dhh0xvQOuV14cyeYYGAAf87fFWgwTJ1CYYIiYz35
	qFdgnO+g5/Ofad/hNScSSyHUUeDAuS6QpN35W/CAzMHL70DDoJ9Ban1Q4hADH3vCafXigLh9Hnvyo
	qxfLExXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lM7-0000000EyvY-2JLX;
	Thu, 12 Mar 2026 19:05:59 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lM4-0000000Eyuq-43df
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:05:58 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50906a98ffeso98261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342355; cv=none;
        d=google.com; s=arc-20240605;
        b=SQVTMDIbhJxG/hWYAHjUh0CAPzBCwktZcGe15qTzbA8iiGjOK/52P/CeVX7sn5dh6+
         CuxVa0U5Aj7X9pRkvV1j/YJ1JIQF88S1KIQxPaztYVXFuedpxASrjiCErHa4kdaoIDTa
         lecmGZpwyOsvFfumSTyLc8OuBUPnnFH9wu2VlIYj7U1icUkFA4pXI8eQtS7D/a1ITrSR
         UeBumUjJOopENoFjLqBivATU/NPmmPOh42HtfJGTHJ9ic1nbrwlPh7GBmvhUcTBfyMQT
         b80Me9Wk1swVuoc1KjJ8eNRUWQPY2lQ6xwalE75UTMJG19H8OpQFMp93hN26anBmoVQ/
         1hMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U6+OtjaK5kpQwDsWtWbZL7QFm/NMyVy7mbGZ1ghV8IA=;
        fh=B6CwWKjXTMabVYELoJvARHUPvHTfRjLm27hSUvNcoFA=;
        b=TxdTNDrzxjsAmm0UqpDPhMfSTtiacFE12UXOApPbaDTp2iGDVzu2ksWk0eAg5PMKMY
         ShfEwedE8cG/YioalzOX34LV5dpAKZ8xlUi0vSYWUulAHr/yaeQvuPMrWg6bovB9rHT7
         rzKRVCWFYSt6vbe0Wg3wfMAAd/+C6uhk/6Ji3jwp/R5//pYh8RNmuOCX+SzwQyw37dRw
         QoxCf9MChvD8D/68Lbjqr+mN8V1+Z8CbSCnnzRRIxCtfUWJzF8klC2A3dGZlyLio0Bsg
         l/IPamCvLEoiTkL3BA/uIGuv/TwfWf6bSIz6h/cODFp2ZgWFiXRmQhH3N2vx6S2oNi3L
         Obqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773342355; x=1773947155; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6+OtjaK5kpQwDsWtWbZL7QFm/NMyVy7mbGZ1ghV8IA=;
        b=JxrfXCUUdYAPtkY1ElQvRZV6aLSTl8d5WpOBvLu4jad3sr3tI3SB+8LZXeaovKMTy3
         AlI1qpa1F87/0/uttg/uzee4/VD1jGien07ozC1Uw5fpdQEdkYDdPwYN3Q9dj+t/D8Ap
         u1CcevX1m3G/DXrfAd3D+BV4mOdKLO7kPFVhUvn3fOKtI7JG93PV6tzEaCRX214GGw82
         HLhLaW3Gm+WrrJXbE1ZWsoi4g8T4+zdJyhlCXcG9l27QPiGwFWAq3WJ+XlmHngmZ5u+I
         Sa0AB2+CcVLQ2m+nLHnrHZaRjxsr0DlT34Q8GhIy2fo/7zQ+bGBNfNx6kKYRqVEgN3eT
         Q9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342355; x=1773947155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6+OtjaK5kpQwDsWtWbZL7QFm/NMyVy7mbGZ1ghV8IA=;
        b=JiKv1GQF2lDBDHy+l4KN9Zgll7kigbs164jzDFyNN4HJDf9Pg9/koIOtp0DPKLARtm
         PeWvdwIa7+biSwqqkF679jasN2+B97aIh8kqhznCwpcjmaAD0KoGZVNMfBiqIPpJ4GmD
         ft84BTb3p8v44p7sCvF0I/CCLMxJh8w4ydDTTeVw0ojwIAlSuFAVUwKbWkeet2MUZ7Nj
         HUb9kV9oyJRZ8J/HK6c3b05L8Wi2f5ohAIZ9o/X9rrtOlClzXr60+QC2ACuUsDCB0OK2
         NXzoOpjeipgPKD4b78hc3MK8CJQbOLvjkQ94yc9ueiBuMhv7S87xqTSG5XsWlu89CmLq
         TjNA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ml6Ryq37xpkE6OKCtdwF73UCtU/PN+SKeW9Zqpwha2vnvqZnj94xjUKnd5Ge9aM6AHWfjX49rKKbBx3DIh1W@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9MN2LqzlcYkr/yz4ZWVjBemLVmYiqhz1ee7GTVI9N2zPWIDU2
	Z2Y3DtcsOOx7PDCAl2hC+307iLynuq3EAD7c4BgNLu6ahWx21AFq5k3xP55gkSy4Z0XlKymyloc
	xCQGFABQfcKWKg3XyOCnocrmFuC2CSsRTUINu/F5f
X-Gm-Gg: ATEYQzyAuVg0TwQmuMvuinBVAzYPuaWob0Fiz0CsMmhnZVvkKs0P28KBTjPtBh45h7Y
	HonQqPHe/pKSyliANrJQQ6yvLXtXuqiL5Ya3b3lI/0IT+UyTZZiVHBVgsF2xAZ9htWarAd+C+b6
	pbzwsi/lTrhteB/4QpgGXN5HWU3E2GRFun/Hj0IjEcbEzL7OGYxhAx5sREqC+X8oqaWagOzcXvh
	Ucb9XyiLJp8YxD1AuQDHiY2Nggem/9oJweZsbalSSxFADV+H5DUS+jCWPWmt6Ef8Uvm7pfxzU6k
	IEQSSW9V
X-Received: by 2002:ac8:570e:0:b0:509:21ff:cd49 with SMTP id
 d75a77b69052e-509583f2b67mr2191931cf.4.1773342354514; Thu, 12 Mar 2026
 12:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <20260310124933.830025-3-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-3-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 12 Mar 2026 19:05:16 +0000
X-Gm-Features: AaiRm50KV_wpisOqPhBXIc_wURyzMu0dLQv8LiQKoIvYnfkELQ5oUW5aGq7nCAA
Message-ID: <CA+EHjTwDkgF5GV-k_VZ_nXbmUmwrAXaQJ5sFsk2tgr8LL3j4DA@mail.gmail.com>
Subject: Re: [PATCH 02/14] KVM: arm64: Track host-unmapped MMIO regions in a
 static array
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, dbrazdil@google.com, 
	joey.gouly@arm.com, kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	oupton@kernel.org, perlarsen@google.com, qperret@google.com, 
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_120557_042936_3CD967BD 
X-CRM114-Status: GOOD (  26.72  )
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

Hi Sebastian,

On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
>
> Introduce a registry to track protected MMIO regions that are unmapped
> from the host stage-2 page tables. These regions are stored in a
> fixed-size array and their ownership is donated to the hypervisor during
> initialization to ensure host-exclusion and persistent tracking.
>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/include/asm/kvm_pkvm.h     | 10 ++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c |  3 +++
>  arch/arm64/kvm/hyp/nvhe/setup.c       | 25 +++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 757076ad4ec9..48ec7d519399 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -17,6 +17,16 @@
>
>  #define HYP_MEMBLOCK_REGIONS 128
>
> +#define PKVM_PROTECTED_REGS_NUM        8
> +
> +struct pkvm_protected_reg {
> +       u64 start_pfn;
> +       size_t num_pages;
> +};
> +
> +extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
> +extern unsigned int kvm_nvhe_sym(num_protected_reg);
> +
>  int pkvm_init_host_vm(struct kvm *kvm);
>  int pkvm_create_hyp_vm(struct kvm *kvm);
>  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 0808367c52e5..7c125836b533 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -23,6 +23,9 @@
>
>  struct host_mmu host_mmu;
>
> +struct pkvm_protected_reg pkvm_protected_regs[PKVM_PROTECTED_REGS_NUM];
> +unsigned int num_protected_reg;
> +
>  static struct hyp_pool host_s2_pool;
>
>  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 90bd014e952f..ad5b96085e1b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -284,6 +284,27 @@ static int fix_hyp_pgtable_refcnt(void)
>                                 &walker);
>  }
>
> +static int unmap_protected_regions(void)

I think the name of this function is confusing. It's not really
unmapping, it's donating the regions to hyp. Maybe
donate_protected_regions() or claim_protected_mmio_regions to reflect
that we are doing an ownership transfer?

> +{
> +       struct pkvm_protected_reg *reg;
> +       int i, ret, j = 0;

Please don't interleave the iterators with ret. Moreover, you can
define ret inside the loop below. Also, you don't need to initialze j.

> +
> +       for (i = 0; i < num_protected_reg; i++) {
> +               reg = &pkvm_protected_regs[i];
> +               for (j = 0; j < reg->num_pages; j++) {
> +                       ret = __pkvm_host_donate_hyp_mmio(reg->start_pfn + j);
> +                       if (ret)
> +                               goto err_setup;
> +               }
> +       }
> +
> +       return 0;
> +err_setup:
> +       for (j = j - 1; j >= 0; j--)
> +               __pkvm_hyp_donate_host_mmio(reg->start_pfn + j);

This rolls back the regions only for the latest `i` iteration, not all
the `i` iterations.

How about (not tested):

+    err_setup:
+       while (j--)
+           __pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
+
+       while (i--) {
+           reg = &pkvm_protected_regs[i];
+           for (j = reg->num_pages - 1; j >= 0; j--)
+               __pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
+       }

Thanks,
/fuad


> +       return ret;
> +}
> +
>  void __noreturn __pkvm_init_finalise(void)
>  {
>         struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
> @@ -324,6 +345,10 @@ void __noreturn __pkvm_init_finalise(void)
>         if (ret)
>                 goto out;
>
> +       ret = unmap_protected_regions();
> +       if (ret)
> +               goto out;
> +
>         ret = hyp_ffa_init(ffa_proxy_pages);
>         if (ret)
>                 goto out;
> --
> 2.53.0.473.g4a7958ca14-goog
>

