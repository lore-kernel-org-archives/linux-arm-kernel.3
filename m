Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4465C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=; b=X3b9sU9NWtffEVodU8TjiLDkoy
	oURROzzId4se5phSZ1/RTs2sl5cvx1/4uz7RKLgkoYVCDINHELFMGQyIcuF3KWVOys4a52xlSHSD4
	/PhnfQ+WImlYDpVfe7VzkqU+dPhybsld9UzfIm/NZ9qmMTLVA5jQjtT+xTVKfH8DdIwTR3KY06N6a
	xSBJhH4TluV+FKXGhAUdeBNUIaONmrpSYyprJSiJXFMPkv0eZWmlVRLd4/gq1gwFEeW73P5r8djp6
	SuOIbcdhpVdif70mitATj6ehoMh4SaxLGNfsCS9wuqTthKHWZnva5aXl6n4XIquVFwJyfH37BQCkx
	Pw7D0/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp688-00000008OAb-0qQL;
	Wed, 29 Jul 2026 15:23:36 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp682-00000008O6a-2QEu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:23:31 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c10e86e52so281581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 08:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338609; cv=none;
        d=google.com; s=arc-20260327;
        b=NicEp3rnHjmbfryJng318RChBQ6ZoUZJJEMmzfEycfuorAjBfWdV7ZcvBPMbIfjuhF
         5ZK6VgaRTEP3PyXleSJfl9Bp0wiuvU/4UAWIF1h450Yvxf63W6zjN1EclVDXGUj3lcFO
         QlyiFV1AefHQ0PRl5akX0oHdoFkZluu1HQ6mV0SuHNuUIL1a5a4u3JdV+1o1Sv7b+6TG
         9S3qA/lFxkJoo1wtujJyT7ylgrZf3r2EirfZxPgj6tCCgEYNTSVPbXdLaxJ/p9rR4i+4
         5LnDuweiadN97Y0nlbx1437HnsxetfqhCCOlIjz+WqHgUq47Mb7RTIOKdlPO6ROSXJpu
         kS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        fh=R68T0/8ETkui6IXm5iZPX6KkkgYLJf5QbA0t4W/62Dw=;
        b=Z3QB4QTUPZf1gZx1ZF6SbrIwxLwm+E6o0LNlQecEVHutoOd22da2OZptntCDfzuybt
         EgCakMJIOrKQd2Cu2+lBevkxUBo9dU0mdT3VbenSqqhrRpiM2Tt/N/KHrKh3tRSa4XJE
         wg0XZzFIt/geYt5iCe+LMchwaWM2WoQs7oe/valkcdWFmDdnmSlfpKn+Tl9XJ1FspnJB
         +4WUNmMzIDPjLLe7yWbEtq5C0+YD88TXm9ccFmw8N82chzP4b+yEbCRBJhq1K95zGmJW
         mKww/93OimuxmvdGURyOXQHAdefdeSsZyoghJe7PEsjN2tK5p9QKQPBJhFqCALIBo+9P
         HoaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338609; x=1785943409; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        b=ciP7rWscSAgKKBWDiZCCQO7G2W796tVpRKbQJiJgIVgYdkc57taBNorlRBJsKYHS8q
         LyG5Wmq5lEkhpIVgW0oiHJW60UmvT6uaGnR0vkcBw+gbVqvLSqGiyI5T55ggXVjX/MmR
         gODBXxhbY0BhC6WrzwWUFwL9yaHerxIDDElUVo+HDUw22gh8V2VtyYsG2wbWkC3StCYP
         RfzLtNCOUHfjLQHC9TrL3aP1xLqLqT+3jJ6PYmgmAFdARXAcz7cfnkLVMd30w9ipaW/G
         +Lt42u6gzi76QXK0cnRGtzDg5VueDLdg+sw6Df2rpRzo8PtUg8x+7E7/SoL8ii+wRI/4
         fIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338609; x=1785943409;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        b=NOZAbG8FcfCaNkJZUyNs48vo3neuS0lNzJ01fgj2sh2ZOwr892VVyvr/0J3rJmM5Ln
         /ShA6Yd8/oUSyDTfWCAFFbCI/AmW/A/D2XqgB8R4wPND2o2Z0kzlFQjE/yWZc5AFxQO5
         d2VTnqlhcatMZ1Xbb1zs7mUDp/KGQhe8FEZPbQLXrSXnxmBFBDR4EUSyFM7T+DmsJx3u
         b24Zi5F9uI6nrN1OsB0eULdOwQ5nod4gjpjvd7zYhHQ/DSKyK8SFie60bja+3SQ+/O4u
         tOfmtsSDppBqGPWJOSx7hzNtig1CLv2vjjDvuY/Rcn4xY85ffLcBK7IQF6FL5dYm9+Xo
         GZqg==
X-Forwarded-Encrypted: i=1; AHgh+RreKEkWmX2iuALid8NUwSmk+jhIwaWl2zjkdVbhDDz2Bpms6jUVkIWMI2gWImpL+sB2WK0lviM46gDuc3rRAkux@lists.infradead.org
X-Gm-Message-State: AOJu0Yxarat624U9qnWMb+tJr7XYTKtqkTV/Pm0CGxLdK+GyOZAmhCO6
	OJgMfnA04ja+us5Y4suTG6uy8xE5ksNmFnd1r0IGsuLv7A8BJE4OiJTyEoYD5itKmpK+DEtfFdW
	6FsmaSyvqgNOCa1IdadQ+hxhnK3fbmdb3+ElYscui
X-Gm-Gg: AR+sD10dl3undTVHc6KLKPihWrSWGh+7T9Y6Zh40hasXI+47qd6dd49tWHUX2P+tZkt
	YMsp4xL80LhKJKYnQGcTJRgHPRO+KA1fS2x7DiTSvhUtNnotWJ60ms0Z1amVgtF6ryidshPJ3pe
	hCpAaJR5XmfeGxkTZkbE/KXtjw4vTZBT9IZwsTkWBYlE29/78fAzoalXxjJ7KWaZmki4IA7PKMy
	pC7Qz+LKNvbrNf5Yqxz1t4Hem/eb7uN1D7IraScXkTrHonxxN1ITL7DXP79UtlCL7OdCsv23hF6
	i600hDhbB9I7aOZrX4lEahR/bVTWYVWS8M1gzPVUJeCamqn7/WRuiK9kAnK+lQhIOADqcFfJt3l
	ByOoBDE2Hyg==
X-Received: by 2002:ac8:7c56:0:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-52b35089837mr565631cf.8.1785338608520; Wed, 29 Jul 2026
 08:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:22:51 +0100
X-Gm-Features: AUfX_mwUs9MTXlZgLAxa7rxOqn4AEWfpGlzGWJmBR-6Vw5CXw5g4z3qo-EMbdA0
Message-ID: <CA+EHjTzwDrP=3a7f38e2H_H1YPV0igRryhfuNCigZQUFy02tng@mail.gmail.com>
Subject: Re: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082330_652663_EB11E0FA 
X-CRM114-Status: GOOD (  18.93  )
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

On Mon, 20 Jul 2026 at 06:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Add a regression test that runs one vCPU and then tries to change the
> VM-scoped PMU counter count through an idle sibling. Verify that
> SET_NR_COUNTERS fails with EBUSY once any vCPU has run.
>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  .../selftests/kvm/arm64/vpmu_counter_access.c      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index 22223395969e..3b5bb421f401 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -461,6 +461,11 @@ static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
>         }
>  }
>
> +static void guest_code_done(void)
> +{
> +       GUEST_DONE();
> +}
> +
>  static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
>  {
>         struct kvm_vcpu *vcpu;
> @@ -622,6 +627,37 @@ static bool kvm_supports_nr_counters_attr(void)
>         return supported;
>  }
>
> +static void test_set_nr_counters_after_vcpu_run(void)
> +{
> +       struct kvm_vcpu *running_vcpu, *stopped_vcpu;
> +       unsigned int nr_counters = 0;
> +       struct kvm_vcpu_init init;
> +       struct kvm_vm *vm;
> +       int ret;
> +       u64 irq = 23;
> +
> +       vm = vm_create(2);
> +       vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +       init.features[0] |= BIT(KVM_ARM_VCPU_PMU_V3);
> +       running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code_done);
> +       stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code_done);
> +       kvm_arch_vm_finalize_vcpus(vm);
> +
> +       vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> +       vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> +       vcpu_run(running_vcpu);
> +
> +       ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                                    KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS,
> +                                    &nr_counters);
> +       TEST_ASSERT(ret == -1 && errno == EBUSY,
> +                   KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> +
> +       kvm_vm_free(vm);
> +}
> +
>  int main(void)
>  {
>         u64 i, pmcr_n;
> @@ -630,6 +666,8 @@ int main(void)
>         TEST_REQUIRE(kvm_supports_vgic_v3());
>         TEST_REQUIRE(kvm_supports_nr_counters_attr());
>
> +       test_set_nr_counters_after_vcpu_run();
> +
>         pmcr_n = get_pmcr_n_limit();
>         for (i = 0; i <= pmcr_n; i++) {
>                 run_access_test(i);
>
> --
> 2.55.0
>
>

