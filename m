Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zcr0HAZVJL/wPM68//kB0QFOkcy4cqNgVvPP1uhkVrY=; b=uRBVnNN+NZCPPyVJ425YAk+d/F
	ThAr9QvAvgbmwN0V2BUJyi7/NK7s192G2LQ9mTW1SJ9Q87bIY1IvbEDNILcKBQuejoimWD/KFs53g
	dVumOlqAGNjmvTKBbgvqFjcKKYBPBgi+JlBii0K8BnHK5oTJ0sy3e2j+ftweZo5vF09xz00zSTqha
	NUNbxh59ZiwgLrH1fqkHYv7mfQdilPhBkATNV8/V+5hnc3N19XxPxxSEIWYWLv0XoKBp9zxy13sIg
	nGuoHr7TlwqVw1/iP0kCa6sfiT4Q5jxRdPEGdpu3RN2la5I0o4FKsV1+FrqSX0nLRPCSA1la1EZTD
	NlOZrn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE7Z-00000002Sho-0O2w;
	Wed, 30 Jul 2025 21:13:57 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE55-00000002SQz-1Ck6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:11:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-756bb07b029so180718b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 14:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753909882; x=1754514682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcr0HAZVJL/wPM68//kB0QFOkcy4cqNgVvPP1uhkVrY=;
        b=wTo/S60CwBFSwseKrKtOsUwZLc12jQnBu1mZfYcZO8adGPt9aMp0/HyVZU7OHK1Njw
         g/MOolz1hgA6PBCt6hIF4BCZ1N0g6uhfFy72Yl7gnc3UgSbSlFx5fuG4m1t7+qO5fl7L
         YjfLDYpQ9ZdklsV2ShhSOzUuSV5ajoTXzJRWmnKov5iC0iuh/NHvc1UoMPYOd05XP+aV
         r+GYzBLHdK89FlAJ2Xrpq0rw4Vqv7PeVNa5kfURo3fGUSqRM183F1xbeZJPfXLG64/Ad
         nDLB28C/+gOwjjoDNNfD7X7OTJxo0rYgBAf0RUELVy8oDkyEZnI/SqcWjsxPVnOWJt1u
         E+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909882; x=1754514682;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zcr0HAZVJL/wPM68//kB0QFOkcy4cqNgVvPP1uhkVrY=;
        b=FFv6U3wujHdD2ARMENKzPrvFy7GCKtD9w+fUckx6SD2k3Hgr3Qzz1fyxRwk/+ht3ay
         9aVJ00GL3sC6imO/BV/SXbgcGvATw1qtjxyDPK1GEyjZrLFK2EEp6ELMUVtksYmeU9pE
         WuSr7nHBa+BNP3t42l/BPhqi8nUCgng0cm8mp9swyPRtem+D9rg2Z/ri90QYSY0ynyKC
         qm+3FCgAMhQMcOtB32f4BYF7fp022Ow9carLIvZBf+nUzFjtQjq21ubjO/RhoaFsiWCh
         U0Bwbit3+Rlb+qFI54lmEolWGzuzZLj441upndWLhd/rkjX3RgVrLAHoinOBgZFuDCp4
         sREg==
X-Forwarded-Encrypted: i=1; AJvYcCUyB8X8hNhh8DXK0JpiVOfz7GeagNSeBB4jiIhdtTkryNkauC1OEbC8EC4iBkt2GwgM4juMAj3ZymMqTLInwW6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzUlMi1mJDbvXhxJRfr7rOF0moGj8y/er2QiW/A/bxAetwWJr8I
	hTBrCn1jo9r2OkMxccnizlUaMgWE8gmCTTBf9YS4pee6hLNw3+85LxWRXOgf3WcC/pEQuqKZevH
	ALYvRefYTRuOSxYWOeAAPEw==
X-Google-Smtp-Source: AGHT+IH81SELHZh+GPX7YKucdrOrQjsD2qC5Y2tfTvaMHB5OVH1Y4cxqU+ojrj5t1POmR4E8onsMP+EV8Hr7rDZV
X-Received: from pgmb10.prod.google.com ([2002:a63:1b4a:0:b0:b3b:d2a0:df40])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:12d3:b0:234:216b:cf98 with SMTP id adf61e73a8af0-23dc0e8609fmr7392654637.35.1753909881916;
 Wed, 30 Jul 2025 14:11:21 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:11:18 +0000
In-Reply-To: <20250618042424.330664-6-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-6-jthoughton@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250730211120.4163536-1-jthoughton@google.com>
Subject: Re: [PATCH v3 05/15] KVM: x86: Add support for KVM userfault exits
From: James Houghton <jthoughton@google.com>
To: jthoughton@google.com
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	kalyazin@amazon.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	pbonzini@redhat.com, peterx@redhat.com, pgonda@google.com, seanjc@google.com, 
	wei.w.wang@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141123_323005_E52FAE21 
X-CRM114-Status: GOOD (  17.29  )
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

On Tue, Jun 17, 2025 at 9:24=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> Only a few changes are needed to support KVM userfault exits on x86:
>
> 1. Adjust kvm_mmu_hugepage_adjust() to force pages to be mapped at 4K
> =C2=A0 =C2=A0while KVM_MEM_USERFAULT is enabled.
> 2. Return -EFAULT when kvm_do_userfault() when it reports that the page
> =C2=A0 =C2=A0is userfault. (Upon failure to read from the bitmap,
> =C2=A0 =C2=A0kvm_do_userfault() will return true without setting up a mem=
ory fault
> =C2=A0 =C2=A0exit, so we'll return a bare -EFAULT).
>
> For hugepage recovery, the behavior when disabling KVM_MEM_USERFAULT
> should match the behavior when disabling KVM_MEM_LOG_DIRTY_PAGES; make
> changes to kvm_mmu_slot_apply_flags() to recover hugepages when
> KVM_MEM_USERFAULT is disabled.
>
> Signed-off-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

This patch fails to remove the WARN in recover_huge_pages_range(). The
diff below will be applied to the next version of this patch, whenever it
comes.

This WARN can be hit by enabling KVM_MEM_LOG_DIRTY_PAGES and
KVM_MEM_USERFAULT, then disabling KVM_MEM_USERFAULT.

I've been having offline discussions with Sean about this series; I'm
waiting for him to rework the KVM_GENERIC_PAGE_FAULT bits. I'll dedicate
some more time to the QEMU side of things too.

Thanks.

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7f3d7229b2c1f..2d83ddb233a9a 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1779,7 +1779,7 @@ static void recover_huge_pages_range(struct kvm *kvm,
 	u64 huge_spte;
 	int r;
=20
-	if (WARN_ON_ONCE(kvm_slot_dirty_track_enabled(slot)))
+	if (kvm_slot_dirty_track_enabled(slot))
 		return;
=20
 	rcu_read_lock();

