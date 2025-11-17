Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CD6CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyqx4r4nQhUfWXnWTqZF9HfLyEHZr57gV1AR9j4NAXk=; b=40QaIQ75GHk8Ay7sijRRIv98sD
	JW1lyunb0Rn/S5TSE1cW3IV6WXYYrbcAsI6V9+LTqMn/kOWRLOhjuBtWQ+0dARNPCqDyfWyTDSFfP
	sJTENTJEeqcmkqH7IaexffRgS29pJz536R3Oh1homZ+egCTeqWqjnhWemcdzPfx1u/Qqj8TvRIW2f
	C+0Wj34jtRPBi2X9byITkPQyKLLNAw/fQ2eHELjiR7eIdQATXrkDwBrirlqq6HHLxXaSn4jlF3xye
	q7QnOI5RnaSV4wlVaB8bYma9uY7z934Hd0wdeLS1s00qsjrQYM9HOutUClVo0+8Sg9UXTPC215wsz
	8ai21KIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxQg-0000000FyK9-1V1T;
	Mon, 17 Nov 2025 11:29:54 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxQe-0000000FyJk-0SMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:29:53 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4edb8d6e98aso673871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763378991; x=1763983791; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hyqx4r4nQhUfWXnWTqZF9HfLyEHZr57gV1AR9j4NAXk=;
        b=r8PGJsIqq9aCFl4i5Zf2kIid6fWwfLr+QskplO9BFR7d108j7mPDAdxaSA1LCzdOEq
         CAbOFRpsKNBFnFLm2qJ9mBqtdZ0vJTr/dpqhzAw5jFT/KG1AM7aflnuK0KkrhqTLeSC1
         PD81NbR/9L5RJ5v6PQi7BK11BEXmYqYCryObKLOQ0aKpR8DxiJuVFM4Y4/BfXiB++c0+
         c6mwLg2Wzvt/QwZspfgNY051dcqgbc7/NpxyCqoJ6Ee9VVQdO8uI9aLFuK+oY5YKQYGL
         GSXRqTTl+/4UcQd6TWrjfHF8oyL2rYloc64Nuc/4o0C8UD6t0XAd82SNml+dgwS+LRxn
         PS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378991; x=1763983791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyqx4r4nQhUfWXnWTqZF9HfLyEHZr57gV1AR9j4NAXk=;
        b=Yl43NDCjmnrOvkdDD0rlCYe1FFaW810vZfc1MwrppoXN2dXxVJ9wsHCS8ZN/f6G4kU
         qhilKQPE0/vU80qLZ/kzv0d8MKgy8r4ffs+XoYr5vLlniour75LwE697EeCP0/6MS+cd
         E6shUOzJWxP27p0Rb3CnKFcV9fPWOzm/KrroHdMbmMDx9MvcEjQLzofx70/0xJ1LioDx
         r7J5YalGyC0p1W6a0AJPcX83UpavQyhnxLUw9t7xzTUzGyE4NmmrAW5L56iiZllWdQ+y
         MvwvKFdu30Esby/ky2cssLay9deiKIcHr3eNBVl0mPzNnUhHPe63FL9BaiDjnSRhxpD/
         CZoA==
X-Forwarded-Encrypted: i=1; AJvYcCXiihWQbmjREIniYYSckwyq/3uvegL170EQ8AZO4CRD4cnzwLhMx0jhkJEwCiBPF+JciY+05Ea6oyKB8d9IRX2e@lists.infradead.org
X-Gm-Message-State: AOJu0YxOJ3u3PYDedtHeXeFaeAzkCeh99I8Y1PoPO4mjrCn5PQe4ApcX
	smK/K8mcV5vJFuQ+qaYH/F4/rUjqu+gcK4ZuK9oJYe6zVkbdjdzkabnuWpDZHwxUttjVJ7laAwe
	lQniXRvWk+a4ILZYZAPH7BFV8WpBclH1EF5eo5cc5SHcSon9sXz7EqiMBHxU=
X-Gm-Gg: ASbGncvFeRsYYFHHvho+QwEJBXZnZ9XqovFmnaabpZlY5xkFscDYQ3yrqnqRUjOGXW3
	+F2W16xttVLlUme8uOBL7dyKfdaROLRqYuWLkHBWIGqJ9ILKf52sBRWHwMiK95ZN+K7Wnl/bzXL
	9f42IhpTW+0IYCoSO7wyo8ZF2sFFZPXIwFHHRCgUAkjV7zl/Udm3P4tsS4l/lSs0kEhe+7RsfMi
	f7PogTbon6VbGFfW7Q5owgX41X08B5mO2z/roirookvPErq9JsWtpOEw9ddfUim4KJnozXIMT0i
	WZCKew==
X-Google-Smtp-Source: AGHT+IFIOxZ//wrmDM1cUR4nb6LDG7ma+elT+J0SRvK2XWzC5avyhLG6D40y3PR+JjZ4wC9eFj5753jVYjCTDfo9sNA=
X-Received: by 2002:a05:622a:4f13:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4ee02a994a9mr8299811cf.19.1763378990715; Mon, 17 Nov 2025
 03:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-2-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 11:29:13 +0000
X-Gm-Features: AWmQ_bmzdmE29Dyex3S07XvvcAkxx0qUh2gMXUSYHUgIgZOO3S3AS3FjH6bjm7o
Message-ID: <CA+EHjTxUhpUT8s0v6P=TNTqwHnF32arTsd7SCXOU+9uJ3wO82Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] KVM: arm64: GICv3: Don't advertise
 ICH_HCR_EL2.En==1 when no vgic is configured
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_032952_151273_68F981ED 
X-CRM114-Status: GOOD (  17.05  )
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

On Mon, 17 Nov 2025 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
>
> Configuring GICv3 to deal with the lack of GIC in the guest relies
> on not setting ICH_HCR_EL2.En in the shadow register, as this is
> an indication of the fact that we want to trap all system registers
> to report an UNDEF in the guest.
>
> Make sure we leave vgic_hcr untouched in this case.
>
> Reported-by: Mark Brown <broonie@kernel.org>
> Tested-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/72e1e8b5-e397-4dc5-9cd6-a32b6af3d739@sirena.org.uk
> Fixes: 877324a1b5415 ("KVM: arm64: Revamp vgic maintenance interrupt configuration")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/arm64/kvm/vgic/vgic-v3.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index 598621b14a30d..1d6dd1b545bdd 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -26,6 +26,9 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
>  {
>         struct vgic_v3_cpu_if *cpuif = &vcpu->arch.vgic_cpu.vgic_v3;
>
> +       if (!irqchip_in_kernel(vcpu->kvm))
> +               return;
> +
>         cpuif->vgic_hcr = ICH_HCR_EL2_En;
>
>         if (irqs_pending_outside_lrs(als))
> --
> 2.47.3
>
>

