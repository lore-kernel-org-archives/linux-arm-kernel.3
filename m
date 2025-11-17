Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BDFCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UMb76mn8fRdulKyLx/a7XYom3+koOQ6PHrThZtOCmE=; b=AMcpBuoJa7xxQR0YZ7EN7Q8VQb
	3uWZSvVh14Dp3zGsIzTvQ2Vp2nr1tAGmsqXivpVKdQbbjKL7qB/BMbgDN1JG1J1LQIbZIRg7D/Xxw
	22WhR93f8x5Zjoz6RO23djcowrO9dYQOCnF/lZaKhcYx7DC9yLby0mV9xlv+xfAQtx0FoK0dxzufJ
	yLZ453LLXomPSzjHual9eIYV+rk7Jw31im1KF3T6mJMNB4a8UyFMKNVyKEpenjUo4scucyQfYrvHw
	o5jroIOJoTAVUH382eXbAO2KEcu4nsnyFDqEMBSVnGDn0DsvFx4GOmAPxTJMyruzEGHxe3U4kU0d8
	FcTUa4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwZo-0000000FtFV-1iYn;
	Mon, 17 Nov 2025 10:35:16 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwZm-0000000FtF6-1zyM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:35:15 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ee147baf7bso403011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 02:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763375713; x=1763980513; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6UMb76mn8fRdulKyLx/a7XYom3+koOQ6PHrThZtOCmE=;
        b=sU1WkPYnFcezuC9Hrt1zyXq3zLOOZOj2u5EGz7HxU4mRunwgDcCnk1UCmV+7x7FLt8
         N1LmWmvCPRwnjH9cpXfFQNSrwnybMINgqnA623DsXg0sII4l1mSUTyc2dZC1xa1G33Ic
         Wis8SZ+CTjjPT+2RfIeC4Gs/caNBjnKn4WXumzbIHDS0MH5kui/tdAdzu7tLtmOep8P3
         AdhyCrj/rrpflVwJY4D7AmBwdZ6IRSpaJ0o8RDL/LgiYQzNq3matdDVA9Cztu7KjpKas
         znYxHtIvdelAqYnz+15wu+FMkgRLb6Pu6yo0gj0qXc9CIo8bn9HdBbXZc3j498pjq7AA
         GMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763375713; x=1763980513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UMb76mn8fRdulKyLx/a7XYom3+koOQ6PHrThZtOCmE=;
        b=RUdHOfa9TQBmrt6SER6yh+0zlh8Qn6rrTeCNiC+JAvlhrMMBNjidKtERM8v1Qtc/KP
         /RKmJbUv5eWekK8Qohmtxv2RC6QMafi+tIGgxNlBh7EWnSkYijb942n/GCxuP4oOTGD3
         o64dbTsauI2BATx0Isnri2Hm7GucKC+ehVevtwTM+NHY/XCEyNHd4rOTtm+2z7FZ5jb/
         qbGaCvaaA6jti4Bgaxb/lWyQFIb5bi78eu0X3JJLVoyHjM90DaplZIKCpsmIp8Louncy
         GUqQIwtRyf5cTQaALL88f8+NpRC4gKhDv0duoqFOeFNx164GkvflypQVruBTvE/jiQkT
         zy3A==
X-Forwarded-Encrypted: i=1; AJvYcCU/no/UVQRPN/xmrhh0WF++7ROqk+6vBvtnBQyOfYvGoe0k6ha9GraIiO+viNT5c1kbhfjRX6MHm7bbKYmSafM2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/tWm5HeBtSXKxsn3h32X/+B44QbljQPiEMZo3ZX1M8McmCxHW
	MGVr9RVi6g7c1EF5ck9/MhT68jM3CS1rHO9aSJ1ho9QM6+NyHY+DIwWBG1COdUmwAZYEYJh/0JL
	B2lYaQLh4OadCfjijro2xzDuyknZBXZ+zWRop/zjY
X-Gm-Gg: ASbGncvq4tYbcOSuASeiK3fPIpOM+Ges6MWbR54IRKvLIcJOE5WbSNSBMe9XDGy8WQH
	HTbMmJO1f6BwB/FGw7J5k+bHwvUaYwyuuXBrZ2hWRreNiH8zArFBX+43G3bU/9SZbkwiWz7nnYb
	GIAHst6H4yBMM+2i5e+ManfOjFt5U3mSJCKuzi9nX+i+bNy4mhDGhfjhiNVH+gLsjWqfjA0KbHU
	tQidKp+4XIQPF4uU2CQw91SHbEEQQYappwo+qnl5LGsm4kuSqtk+PaqmmgW/dR5B4hLw/8=
X-Google-Smtp-Source: AGHT+IEeDf8TqrvbNoWWGhOaSKTbd2JM8FcWY8tyPNdC251IWOGGbR4OQunLQUmX2T6cgbU3MIvYtVGTrvUN+xb9V7A=
X-Received: by 2002:a05:622a:647:b0:4e6:eaee:a944 with SMTP id
 d75a77b69052e-4ee02febe71mr10646641cf.4.1763375713065; Mon, 17 Nov 2025
 02:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-2-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 10:34:36 +0000
X-Gm-Features: AWmQ_blgezKjAAmHyIWXBoJZICk6tQG5D6YP6HkWhKHbDls8Zob-nCh13_5IZ4w
Message-ID: <CA+EHjTy93dmoTysS91+jFmey8ei55VWNUf-FsqVz9Ho4W1NWBQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251117_023514_520175_2B6FF165 
X-CRM114-Status: GOOD (  18.04  )
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

Hi Marc,

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

Bear with me, since I'm not too familiar with this code. This is the
only function that initializes cpuif->vgic_hcr. Should we be
explicitly setting it to 0, or warn if ICH_HCR_EL2_En is set?

Cheers,
/fuad

>         cpuif->vgic_hcr = ICH_HCR_EL2_En;
>
>         if (irqs_pending_outside_lrs(als))
> --
> 2.47.3
>
>

