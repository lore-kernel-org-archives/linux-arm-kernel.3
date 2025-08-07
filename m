Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E491C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96362UVupe8COf1P6wW/mjtmbdG3wWxnQMi7BMOUIUE=; b=xBu5KQJffXqW7Ck799ZgEP+bFe
	TGJpdtP4BivgcVgJA5s0lk8R7JNX4JtM/N/C7jM19YujbBgFuH4YRQ+guSycUSLbFPrUdbrEZNeag
	ep9M+mExwT85Xnn+Ap9miYm3bWwG46b0/euh3JcLSSc5nnIaTJZkQGE6fb7rvDb72Jjkw5trruOHC
	vq+a4g26qAzCT36EWfRaND9BD7Pv3mo5NQPcY08tcsDDEjwn4K40dH7hE+k2WBFuDFvmIU4lncrva
	usy39iFkPMC0dPk8FQySnleQrpEW+nV23lFdLEAn8qOl5ZdC2LsL9qq+21w5+lahO7XMGBgCM0z/v
	4JkKlofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5rC-00000001MfN-2ths;
	Thu, 07 Aug 2025 19:00:54 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5oe-00000001MMt-0T4n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:58:17 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4b0673b0a7cso58741cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 11:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754593094; x=1755197894; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=96362UVupe8COf1P6wW/mjtmbdG3wWxnQMi7BMOUIUE=;
        b=tsbgY2JLbSBErHc5ien6paG34kEa+bU/rf0Xi5zIjq1V3keQdyOBgSr0PvRKp5fztc
         8UczDtTphT7p5Pnu8h7ugpAQBXHDNR5iqFUfnTWvvDFvYKS27KpkxZNplRuUbPzrCGQj
         6YMW2jWWcRVfv83S3iosYptkurdjNaIraoyb3If0kFhq2w2mwP72+kf88CxXuP7BZmTz
         AgVQHCm9GHMd/u2oHHNZ+ueKikoYzuYvSRkCXjTltr0c/VlPGQjRH+yVYC9fuGNWuvuN
         nDqqp10ICZloY2x2sFWJUsWSs/z72aE7jXn5lFbxTPMgh2hbT9XgMgTYSUAUt75EJ9e+
         P5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754593094; x=1755197894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96362UVupe8COf1P6wW/mjtmbdG3wWxnQMi7BMOUIUE=;
        b=tCGLSwc+OOAUUE4JBioCjNRDNMS85wJ7Gpu+AKDI4wo/ObJDSPrE7l8aU/CIC1ttdO
         pob6GgaY6QizOdA3VxN08Z69IrwuibY99LJzj1N2FP2RU54Mtb4pp2qz2R6wz+VQo/zl
         EELcw+zlX06V3UYXaXNtDeFvtOJXjWEeztkaMUO56TFj76pHLj8P+TeGHXeioLXCffFH
         pVZ/scXhLFfejJ64G+4VzFXvjHomYk/3CUIbreKw4idclmRHTt84PIX+k9cuhpSIRguz
         hUInGwsZCvVU0HQFHoz4/Tp4yjJU9jaPwN8xynyBz3sT0Pynp5/MhWRfaNdd3QyfPE07
         w+uA==
X-Forwarded-Encrypted: i=1; AJvYcCXDcXwscb9k828/w2ALI3uOR8Preh1XaZH/kA4OohYQoisrgLDSzaZ1EFifupiRkxe+PdyOedEgroNbV4ZIJz88@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo+/2frzK2VKtSQHN/lbpUXvG4tTjb02UrgvaiLwy1qBpxfaF1
	cbrp7qKkAZ/olvsUAWG2ZamONgggBjIiKGMgpligg8M18SNrbulDkV9w+E9jsVNsf6ZFI07IbxD
	uNIeOGKu2mMXTM2IzMBy+SDuE5va1Au7VxB4tWBr5
X-Gm-Gg: ASbGncum5bJ/9ifE+RfjkTRyhx0997WenrGDDBoivE/vfEMbJnbsH+/1Bgw1jFoCevW
	98lJllY8HjZ4aFGJ9N7aw1zqCVdzFERktw4NUkB3Krwd0rmJj6mMcy0jjfn97OKZ3LewopsjLml
	ZGQjsO7fxdpK36jRBpvAem9k0CHXdRHUP95tqHhCTgh2mX2kiQocCFpJf/zXpFxs1iH+OfDo0uV
	gDSuhf59K26AclbsxnmuKcQvqUMgWFgOAp3
X-Google-Smtp-Source: AGHT+IGQv3PJBbuZ1uXQcTT0alJEv27zQP6RUhp/GXkD21PwsG9r1YtfOqnK9qoS+hDRmSRDSNYUz0kE+B4S+clok58=
X-Received: by 2002:a05:622a:a648:b0:4a5:a83d:f50d with SMTP id
 d75a77b69052e-4b0af27a4c2mr270701cf.11.1754593093620; Thu, 07 Aug 2025
 11:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250724235144.2428795-1-rananta@google.com> <20250724235144.2428795-3-rananta@google.com>
 <aIjwalITY6CAj7TO@linux.dev>
In-Reply-To: <aIjwalITY6CAj7TO@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 7 Aug 2025 11:58:01 -0700
X-Gm-Features: Ac12FXylmxDAHRXg2gQCPPXuwIGOmW7c0vzzAhp62yyDvoK-TIuMbTJEHyOdR6k
Message-ID: <CAJHc60wBNTP9SSt_skEXXv9N+tF_1RoV6vcQQx4hWphJF6EmkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table periodically
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_115816_160535_CBC4577B 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Oliver,

>
> Protected mode is affected by the same problem, potentially even worse
> due to the overheads of calling into EL2. Both protected and
> non-protected flows should use stage2_destroy_range().
>
I experimented with this (see diff below), and it looks like it takes
significantly longer to finish the destruction even for a very small
VM. For instance, it takes ~140 seconds on an Ampere Altra machine.
This is probably because we run cond_resched() for every breakup in
the entire sweep of the possible address range, 0 to  ~(0ULL), even
though there are no actual mappings there, and we context switch out
more often.

--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c

+ static void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+ {
+       u64 end = is_protected_kvm_enabled() ? ~(0ULL) : BIT(pgt->ia_bits);
+       u64 next, addr = 0;
+
+       do {
+               next = stage2_range_addr_end(addr, end);
+               KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
+                                                            next - addr);
+
+               if (next != end)
+                       cond_resched();
+       } while (addr = next, addr != end);
+
+
+       KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
+ }

--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -316,9 +316,13 @@ static int __pkvm_pgtable_stage2_unmap(struct
kvm_pgtable *pgt, u64 start, u64 e
        return 0;
 }

-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt, u64
addr, u64 size)
+{
+       __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+}
+
+void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
+{
+}

Without cond_resched() in place, it takes about half the time.

I also tried moving cond_resched() to __pkvm_pgtable_stage2_unmap(),
as per the below diff, and calling pkvm_pgtable_stage2_destroy_range()
for the entire 0 to ~(1ULL) range (instead of breaking it up). Even
for a fully 4K mapped 128G VM, I see it taking ~65 seconds, which is
close to the baseline (no cond_resched()).

--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -311,8 +311,11 @@ static int __pkvm_pgtable_stage2_unmap(struct
kvm_pgtable *pgt, u64 start, u64 e
                        return ret;
                pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
                kfree(mapping);
+               cond_resched();
        }

Does it make sense to call cond_resched() only when we actually unmap pages?

Thank you.
Raghavendra

