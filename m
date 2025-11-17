Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9082CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49ctbnqVDAwIBJX5k40l0vJpezvfhKgkxScmbFVG3vs=; b=PedYUhChfqxQgwlw/gAcidVX2+
	trbr7xFc010877CwGDJB2VzpdZIzYjEAYp5CKWou4FNioQkMLnOLOKuSWb3Rs0ZbChoHy8dTe3hiV
	CE0eWCOI0kRwmr1ifCmzTAJJzR72AQBqvbI+YADu1gBZJV0cxeYwE6rlXUzKiZWAW1+EKaIdLGYDo
	HJm7DaTOU7ccoTVI+eslszn5H60ImHdsCU9+LPatrvYNBF2vEgRrfeDjLwgtHnlokP5P3JUC5e3iq
	FaRvJ1mx//SpCmehPmqZc+vw77+nwwiyTWvLwehqftEGcKHAzngU3Ew6VXkIb+EbW7zGFhjEl1FGh
	Cy8cCcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxNP-0000000Fxzo-3fNP;
	Mon, 17 Nov 2025 11:26:31 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxNO-0000000FxzT-01Ag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:26:31 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4edb8d6e98aso673221cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763378789; x=1763983589; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49ctbnqVDAwIBJX5k40l0vJpezvfhKgkxScmbFVG3vs=;
        b=yuYF0d/Fjvo2ezN4lRvVIyAAijZzvnzLDrNe2fI4Eublel8bqLI6EdC8VbttDwitrE
         5GHkYff1JExWxRzOjF2MgKDGVtQOvnnmvt7dRL8j5/NUBTJxK9/IhZt1EWScDJTe0zXw
         h4enaf8GiW3qyj5J7nItM9Wymm6Einb7drfLyMHJqW9BsRM6XCCvEzGSPPy8hjHS7UDM
         fgv+CwUwmy0iecmgkeTne9NEZ+Q1G1nx8RkM3RUrsyHkkjC4IaQD4SvxnsIZpeu4J3Se
         FyY8igofbuVMtmbUWytIMdj7kFYsNBiaisjwl2aQMB625j4WKVuMTcFXRVEr+O030cQ/
         jJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378789; x=1763983589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49ctbnqVDAwIBJX5k40l0vJpezvfhKgkxScmbFVG3vs=;
        b=iT8ha4OrZYzjoLOcQnnwyYT4+oo1SdhsJR5lQHsxhpRMPzCqNeqWv2aoxq9/+rXR/5
         kUKEo2hx1G1FCdOAT04VyEyHIc08zsOyBWRcZVAn1sArGgqZEoV+3n885nWxrVShBOQB
         O947CAQx3HkgHGBhEpWLLp0U0jRQl220ybsfpPpYn/fu2aXP8+dJrLLMKOjXVBxejJCA
         ZaYWidSWU3lHzyE3wrv3tLSjEvnodIhxNR13X4L+ORePoRTL5HYQvy106EfKtCe/5/US
         daVum60wUXOxmjU5/iiKZvNxVH4heNVRdbAgrrf5u/YhwvGd0GviBng0LZSX3d29Za1e
         Wc5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/gwM7oIFNN8Cz/Q2yjEBwi9coiUwMagyEHp+ejfCtd0H4Hn6AE+vHRbbXHJys+lQ46BO2Lh8xIeD9kgyJEHCi@lists.infradead.org
X-Gm-Message-State: AOJu0YxTrxiWF8OmH3DPp85SktZXVKzufBufStV1ULKsMxQp/PcHOUpw
	IYx3nkANkNxrBkOVpbFmAejcpv2dpBPQFYSrPNdU2wD52JbLnFyMJBTrCiF9ygK+3+FijonDQ86
	zLK5/DEATmw3ybWM5ckkGOtnzQVtSsFQzxRkANx8m
X-Gm-Gg: ASbGnctQhdyqi48a26YTV4rN3dz46r5P4O8doSlBDCRcvo48YC31+gnJ2Vod38nMpJR
	ApdSXnhNbMlMrouugBItoe4j0lR60mdcjShSvGMUEo6bBVabio8Ih0biM7yauIIUMhKLAM4Fqpj
	b22gkF3eQdHpITkRhQzof0+pkXIoqH897NaslbLnwy1ex6MTxrshqLUEgcb5bqEN3c1lr0AVH+e
	QnDiTnWm99hQPvWTFNUkrQ0i6APZDEU2Soqowg8OtPiUuz7vMVlsK8fQg7bcYjwHpDHww+9zzI9
	sGjpbwgHbUWriC/O
X-Google-Smtp-Source: AGHT+IEioMYFsqCc/4jnG0fmbEwZ6LA1WtQ/uRrIvwVWDiUcLFKyLiTmWE933E92hMBlL3D5tgBe1zTgaGIOHcn1qNw=
X-Received: by 2002:a05:622a:1191:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4ee0279d624mr12602131cf.2.1763378788577; Mon, 17 Nov 2025
 03:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-5-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-5-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 11:25:52 +0000
X-Gm-Features: AWmQ_bmeFv51Sa8WTg6Ls1D8vjiLqQnByeUS2NLYDYoerk0mUC01snRaXzO25Vg
Message-ID: <CA+EHjTwEj_-tDvq2+2x9MxTom2yw7Rx0ZZg7XuBOWxFxBJ-n9Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] KVM: arm64: GICv3: Remove vgic_hcr workaround
 handling leftovers
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_032630_048645_A6671045 
X-CRM114-Status: GOOD (  15.48  )
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

On Mon, 17 Nov 2025 at 09:20, Marc Zyngier <maz@kernel.org> wrote:
>
> There's a bizarre or'ing of a 0 with the guest's ICH_HCR_EL2's
> value, which is a leftover from the host workaround merging
> code. Just kill it.
>
> Fixes: ca30799f7c2d0 ("KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index bf37fd3198ba7..40f7a37e0685c 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -323,10 +323,9 @@ static void vgic_v3_create_shadow_state(struct kvm_vcpu *vcpu,
>                                         struct vgic_v3_cpu_if *s_cpu_if)
>  {
>         struct vgic_v3_cpu_if *host_if = &vcpu->arch.vgic_cpu.vgic_v3;
> -       u64 val = 0;
>         int i;
>
> -       s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) | val;
> +       s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
>         s_cpu_if->vgic_vmcr = __vcpu_sys_reg(vcpu, ICH_VMCR_EL2);
>         s_cpu_if->vgic_sre = host_if->vgic_sre;
>
> --
> 2.47.3
>
>

