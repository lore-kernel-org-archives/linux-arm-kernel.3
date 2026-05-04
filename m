Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B552FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAttJD+RV5lk5kNpW7EPj87JP+4oaqPyp5frl0M0LOQ=; b=nCQ6tIoSgzgtjfvPZkYqvvbxOP
	JTL7lGCz77BWA1HtnUALZfgjXkLhrnlJgTNlsWppDcu4AHtxKqhnsPnnicKp1XMwdr/0jPk37TXK0
	xqPxjQvNyeDHUBlGpnXl+eiBwgbnjWa7fLAF9X9TsrTki64CAKkRmtZQlJvmT3vYNWjv0EFBHNmap
	AXOFjzVsvTg88YH9tlJ3AELYcEObmpYLEYDWBd6dQqjE3XeIPZ0sarycQgnsULu2Qm9BbDPbgsrKy
	JaOnvM8phbgm9JMy75ySX+7jWWlHHLS5OAkAT55cs0usMM9AUJIBTi5G3TRZcsc7xZaQUs5iERJBe
	u9wEILyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2RC-0000000EZB0-0rs4;
	Mon, 04 May 2026 23:10:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2R9-0000000EZAX-18yq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 23:10:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3568090851aso12034817a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777936250; x=1778541050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAttJD+RV5lk5kNpW7EPj87JP+4oaqPyp5frl0M0LOQ=;
        b=uXlYs8lIFFp6wcqQkXjpAqr6z4apXsqAn9m5zDew5Z0/iIfXdoHNv95rMgNjP3OrBe
         tehaGZ+6kG2520zpwV4ygow5s69jlDCw/qHrrqwcRY5XUMihsMeYOqVlEVhanmNTVGxR
         V4sAAkluU/Khdb8vcJPQJv0I9EAXr6otQ3pNJ+EGdZt22X3jvom+6MNgLPP/jrWWh4JP
         WD6icxdl2hH45Cjz2hZUDpXhaix0y3NyfUCzUUZ7YSlwlyn+tV1yQ1Kye0jzYj95/Gud
         eSP+XkjuVB8YKIsoIl0V2lpIi3RqagN7NJyWIPOQKU9pLUX6apjipCbZ6mMT+/W+eKH0
         UVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777936250; x=1778541050;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAttJD+RV5lk5kNpW7EPj87JP+4oaqPyp5frl0M0LOQ=;
        b=e6TqhZYIqxpA/k3jrfozfKiLgSvwYvtIm1fpuYF5wIcZABLDzLhDhBsyULCSBIqgQW
         ek96FBennHO8uUWC4Svbfx/dCxu1g82wwX7VTkDnTbVR12ucR/3sllUE1d99uVbcj0/T
         CWLo0LQny5GLTmU1V2ZmeMVQEPv2JD49CwxafRZcE01gZGOh19iEucErN6JaBxWs51d2
         8QM/JtS8IHi+SMT8N3U0UBTeDWo/IdxvogFjs9B6EE6Fxq4ntg2In5awoYRpcBMI5B5V
         UTWIKns0WTObsBCiiXeATss54ydXAfz5JfpJATfwnGWsGGcJIfWjY1iuBLryqGRnsGug
         YCQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lqJMR7UpY7qWrGHvD+mzKB+uDwicspAbmxhUT1Lv5nUQonr711RPrigQP70R1TdgA7vumefqYXXBCyIK2IR8J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4+RnefJf0Pz6d9tED3sLw3QaI0L5sOgRwPeRJpDtEYnGExq+r
	ugwk4bt9yc3G/kc6jCM7AKyTTLrfeQIXDKqU4z9xnQIAr/x6Jzj4KpQY7QuzpbRPS2NHVJC/+P9
	LEIivd8oRfjaAq1ix1Gh6Pw==
X-Received: from pgbcs4.prod.google.com ([2002:a05:6a02:4184:b0:c79:8b14:e151])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:580f:b0:35f:bae8:3531 with SMTP id 98e67ed59e1d1-3657761ae72mr698785a91.25.1777936249486;
 Mon, 04 May 2026 16:10:49 -0700 (PDT)
Date: Mon,  4 May 2026 23:10:47 +0000
In-Reply-To: <20260504224213.1049426-2-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504231048.1184273-1-jthoughton@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: jthoughton@google.com
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	seanjc@google.com, shahuang@redhat.com, stable@vger.kernel.org, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_161051_322667_868FB208 
X-CRM114-Status: GOOD (  27.38  )
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

On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@google.co=
m> wrote:
>
> kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> concurrently in the event that the KVM's `mm` is __mmput() at the
> same time that last reference to the KVM is being dropped.
>
> T1              T2
> KVM_CREATE_VM
>                 Get VM file from T1
> close VM
> exit_mm()       close VM
>
> T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>     with only the KVM srcu read lock held.
>
> T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
>     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>     again, with only the KVM srcu read lock held.
>
> This leads to a potential double-free of
> kvm->arch.kvm_mmu_free_memory_cache and now with NV
> kvm->arch.nested_mmus.
>
> Cc: stable@vger.kernel.org
> Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is =
enabled")
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  arch/arm64/include/asm/kvm_mmu.h |  1 +
>  arch/arm64/kvm/mmu.c             | 23 +++++++++++++++++++----
>  arch/arm64/kvm/nested.c          |  4 +++-
>  3 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kv=
m_mmu.h
> index 01e9c72d6aa7..30d5c24fcebb 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -178,6 +178,7 @@ void stage2_unmap_vm(struct kvm *kvm);
>  int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigne=
d long type);
>  void kvm_uninit_stage2_mmu(struct kvm *kvm);
>  void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
>  int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>                           phys_addr_t pa, unsigned long size, bool writab=
le);
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..4bab407d43bb 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1021,7 +1021,9 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm=
_s2_mmu *mmu, unsigned long t
>
>  void kvm_uninit_stage2_mmu(struct kvm *kvm)
>  {
> -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> +       lockdep_assert_held_write(&kvm->mmu_lock);

*facepalm*.... this doesn't account for the other callers of
kvm_uninit_stage2_mmu(). They will get lockdep warnings.

I've attached a diff to the bottom of this reply that *does* deal with them=
.
:( Sorry.

I'm guessing Marc or Oliver will probably want this patch to look quite
different, so I'll wait to hear from them before actually sending a v2.

In the meantime, I'll properly retest with lockdep enabled.

> +
> +       kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
>         kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
>  }
>
> @@ -1095,12 +1097,14 @@ void stage2_unmap_vm(struct kvm *kvm)
>         srcu_read_unlock(&kvm->srcu, idx);
>  }
>
> -void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +static void __kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu, bool locked)
>  {
>         struct kvm *kvm =3D kvm_s2_mmu_to_kvm(mmu);
>         struct kvm_pgtable *pgt =3D NULL;
>
> -       write_lock(&kvm->mmu_lock);
> +       if (!locked)
> +               write_lock(&kvm->mmu_lock);
> +
>         pgt =3D mmu->pgt;
>         if (pgt) {
>                 mmu->pgd_phys =3D 0;
> @@ -1111,7 +1115,8 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>         if (kvm_is_nested_s2_mmu(kvm, mmu))
>                 kvm_init_nested_s2_mmu(mmu);
>
> -       write_unlock(&kvm->mmu_lock);
> +       if (!locked)
> +               write_unlock(&kvm->mmu_lock);
>
>         if (pgt) {
>                 kvm_stage2_destroy(pgt);
> @@ -1119,6 +1124,16 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>         }
>  }
>
> +void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +{
> +       __kvm_free_stage2_pgd(mmu, false);
> +}
> +
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu)
> +{
> +       __kvm_free_stage2_pgd(mmu, true);
> +}
> +
>  static void hyp_mc_free_fn(void *addr, void *mc)
>  {
>         struct kvm_hyp_memcache *memcache =3D mc;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 883b6c1008fb..977598bff5e6 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  {
>         int i;
>
> +       guard(write_lock)(&kvm->mmu_lock);
> +
>         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
>                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
>
>                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> -                       kvm_free_stage2_pgd(mmu);
> +                       kvm_free_stage2_pgd_locked(mmu);
>         }
>         kvfree(kvm->arch.nested_mmus);
>         kvm->arch.nested_mmus =3D NULL;
> --
> 2.54.0.545.g6539524ca2-goog

And here is the diff that should fix this patch. (Sorry!!)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_=
mmu.h
index 30d5c24fcebb..e32e844943be 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -177,6 +177,7 @@ void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_a=
ddr_t addr, phys_addr_t e
 void stage2_unmap_vm(struct kvm *kvm);
 int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned =
long type);
 void kvm_uninit_stage2_mmu(struct kvm *kvm);
+void kvm_uninit_stage2_mmu_locked(struct kvm *kvm);
 void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
 void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
 int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4bab407d43bb..98ba8116676c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1019,14 +1019,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_=
s2_mmu *mmu, unsigned long t
 	return err;
 }
=20
-void kvm_uninit_stage2_mmu(struct kvm *kvm)
-{
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
-	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
-}
-
 static void stage2_unmap_memslot(struct kvm *kvm,
 				 struct kvm_memory_slot *memslot)
 {
@@ -1134,6 +1126,24 @@ void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *m=
mu)
 	__kvm_free_stage2_pgd(mmu, true);
 }
=20
+static void __kvm_uninit_stage2_mmu(struct kvm *kvm, bool locked)
+{
+	__kvm_free_stage2_pgd(&kvm->arch.mmu, locked);
+	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
+}
+
+void kvm_uninit_stage2_mmu(struct kvm *kvm)
+{
+	__kvm_uninit_stage2_mmu(kvm, false);
+}
+
+void kvm_uninit_stage2_mmu_locked(struct kvm *kvm)
+{
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	__kvm_uninit_stage2_mmu(kvm, true);
+}
+
 static void hyp_mc_free_fn(void *addr, void *mc)
 {
 	struct kvm_hyp_memcache *memcache =3D mc;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 977598bff5e6..f61f0244f0fb 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1201,7 +1201,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 	kvfree(kvm->arch.nested_mmus);
 	kvm->arch.nested_mmus =3D NULL;
 	kvm->arch.nested_mmus_size =3D 0;
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_uninit_stage2_mmu_locked(kvm);
 }
=20
 /*

