Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B52C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=; b=u7Bdkiqr/f2HkHKwDZKm2FTgtY
	83TSLKywsrrlFhWFSzIeBF/pBlwu0CgZ0aXPOPFELMR62gT1/8oCqVseIm4zx9hRxCsLCU/sWjMvS
	FxMzcR0Pbj3/TSRcyBFpbqBLNHRk/G4p8RxhGgzBXeW9ACJ1hbYcADhRGDSh9k5OW3RT6Kz464ktW
	R1szb8H2a70eXL4BjNHam1Krj2IEm5GuTTiMdqPX9NzXQvh7AYa13YtyftC0Wf399vl4On9jND4JA
	fuP9BWUoxsHodaE6WHUYgWEcDlUU3K5dhqaYX+c99NhSXtcE8t5fLYyOgqwdkNXGEpvGKw82flnru
	ujI2ymyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp64s-00000008NQb-1pnl;
	Wed, 29 Jul 2026 15:20:14 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp64p-00000008NPk-3xwQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:20:13 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c15a5b265so355041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 08:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338410; cv=none;
        d=google.com; s=arc-20260327;
        b=QTwzPUfX33LJtf6maUmiqo/LfSrQ9gjYhYqyxLFA8mZodA7an6SCL1+ClgQvGsMljp
         24urhJrtxpQaDPg89AulvsdtwIQaWM94quZOKMYMPx5CCvR9NWi5PuNDw1itwZawqiJJ
         N6MlKnS79Gk6KuxpfaJQcGipHVf72peAwGoVt4dmuIepp4xNhTLz5n6kUizlBfQgI3zp
         UJI2J0EWCWfBqNE3GLiL9MBKY/uE2kuI7m9wpjWpD0virnnT0tCH0QYNJ7mMt/PBx1f+
         UUfP94jdzZtOp6YxcWnlU1h4zWnkTQIdV0CD4y1qIyRYc7hTMy8nz91UkUvM1yTfNgDS
         sJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        fh=S/cqbzR1pwPCr5GuwjjBd5byHv67Xn662fQhIA/2/YU=;
        b=RjoFbJ7QLFhHw3HQpQt/vZNmdC75CEDf4gsYeZm2pb55ZROq73I9scXydkE5V/YPBM
         TgMq46E3TJ3vzjWsuwJIABzeTJtygzysnLvYSItgQe8GJmjCIX4C+yZHd45/93G4Ef+t
         Sd2PZZPOIhTgRJOj7INCSJTEOmRU+qujFnBJs16Xo3x2m1ADNUyXfPvhRBjoj45PcWYG
         JkF/r9AfEpFoqocMlpAe4q1GwVH6boBSL8wLxLs7MG50RJzDyeX4i8qAqj6pmJdFeU4N
         ZXEO5fe8CsDIe5wAd6/eNDxGN4Se93muI4f+kG6xpn2P8QuC+ko06UWVY6BoZO3SNGDt
         NKuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338410; x=1785943210; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        b=ftTaSDPIZbWPNI/NKB8UAYuheKXmk02T7jkM1fl4wrpBga7NMqsvL6xeVLWTYULOVE
         9EWDSbaAH+6rsNGhIT9VkOfchypr4T+HVNNSrhAJ3rEnu8ypKe78V7ufl9RspdzQGyY8
         xBgBOiNqRH6tw2vV4g5Pi/NYunyEe+hddXj5Yg2I002CZ9xJ6wbzJeCV57Y3UBwBTrih
         CzaB2M5aclgZCbnTJpR7pQg26KhKyAoO8tIbKXAezpicoc6birN+lZkRQP17Lz2P7XNS
         C8kWVyqcElpmg9PqferBJJS6WJjOd3twq6JUuZe2lNMFPotQikmmeb3x7bwLekJT2yJW
         ZnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338410; x=1785943210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        b=nFR1ZQnk3G9doetqUsyo/K53hoT7auWw+c6QxeL7eqJpXLcSAm6hxkdCgsFZWuB/xp
         vpq+5whpA+Q6NBlqwCdnk5wuYs6y3FFvF3LQHCJu5qWNEID3xvrs1nlGc+iSATXKSuQV
         871s5lGuKRf5ALOD20RJicwpNOvjFVAaHVMxU0f3AjBNzXj1XAQuHBAGG7Iw2Bp8KeoD
         E7OCIsQ6yusnWibzfc2HuZCMiyj7xsOmmbNYXpI+WM4vZBNp/g11OZfr5PTcCxdjKS7h
         mCygeryUVmjLHy9L9KSeG+/l8u7T9TWEXJumYG7shdlOZvCTqdiYjY0ULwyBQfxVWmVl
         lOQQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy3YQa+agC04o5r6zktm8fd2B1O6rW3HbdU+mye1TkMMV515BPasHrlSiVfHqObUerpQm5VTKWqPcPA2Ro3bWp@lists.infradead.org
X-Gm-Message-State: AOJu0YytXUfPKEWZXoG5w4H3nfAhtNK74TThsW4m5p6k7D80ckCwN3L6
	/76FruWBik8kt73EBc42l5Zh6GOsgU/9bRofquTRtXD/7DJMkbY2vLVBoBiBpeYx1KM13aODB5t
	qaKqUk9bq30YLIq1VcxtNzZuO6mUlafMKvRy0lT45
X-Gm-Gg: AR+sD13IgC9Sq/SaJvj+SnL+pJlfPa/B/gXy2XouOKwS4MOBKH9AOLQsCwhbE9nTzUU
	r8MJCg/6SVabkYHvb/b4380/kY8kLUtymM+dSOMytQ9ymeQ7oGa7hMVTieV3vEZA6BfM2CUHS3j
	+3JpxAwzaGEur4WjnyX5W+TjTQrqoO8mJFteD5dSSYQmQ5I7QiaAas56Ei/3QQQoyQ1ulDwIYSS
	ODBQbO+ctEVHyUG4rWuMtxhZB4FHIvisL4+4ybeNuBpCTUVwQ5CbrylWq7UhIgX1nIMYsQONWZI
	OX8yUdefTXJoX1oHvgfHTUlrfjyf7SpGPmQ/LmkTkevG4t6i2OR8tOkkCJpo7Cko3PC1xZS9Mla
	GIfNYtxzkNQ==
X-Received: by 2002:a05:622a:9014:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-52b34e95118mr803001cf.4.1785338408902; Wed, 29 Jul 2026
 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:19:31 +0100
X-Gm-Features: AUfX_mwnVrQrZWbAViwhlMWDHtZtcw4flUU1g4ENMs-4TGfR7On64kQESsXcw8M
Message-ID: <CA+EHjTyYk0Dcc-8RbvQZHFBZ7HM7cekfg3O5MR4jo57qX5SohA@mail.gmail.com>
Subject: Re: [PATCH v9 03/16] KVM: arm64: PMU: Freeze counter count after
 first run
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
X-CRM114-CacheID: sfid-20260729_082011_996439_842C603A 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> PMU configuration is VM-scoped, but SET_NR_COUNTERS can be issued
> through any vCPU. Checking only whether that vCPU's PMU has been
> initialized allows userspace to change the counter count through an idle
> sibling after another vCPU has run.
>
> Reject the attribute once any vCPU has run. This keeps the VM-wide
> implemented counter mask and the PMCR_EL0.N value stable after guest
> execution begins.
>
> Fixes: b7628c797376 ("KVM: arm64: Allow userspace to limit the number of PMU counters for EL2 VMs")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index b5df6843dbcd..b4b877f31097 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -1087,6 +1087,9 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>  {
>         struct kvm *kvm = vcpu->kvm;
>
> +       if (kvm_vm_has_ran_once(kvm))
> +               return -EBUSY;
> +
>         if (!kvm->arch.arm_pmu)
>                 return -EINVAL;
>
>
> --
> 2.55.0
>
>

