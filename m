Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCD8D10DDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xheUdNTjQZCXCu1iqFVovuDp12XGPVK2eJ3J0wQfUu0=; b=aB5Bdt5raiXZ9BE29tjeJz78bg
	o+DZWkyj5Kw9+C4dksa6yPs+KH+LbgZ/6hLFxGdjDufHSpxr3LkZ8HyMUZi+ojCh2WY4mXgxUDvRu
	cbxRPV3qg8gKpjm01wdRV/vghU4ie/1O7j8jwuE5v7rJaIhm56YlRJj1/jEU5Ybh63gpcbZbm3mP7
	zTIiygNm7RlUYDpjiQtdxQ/kYC5kG4YwX/xWieQ3s2iWDvNrLAsFdt/hp0hlxfLcXPmLfkYiwuqty
	6vsSlKfa7S9jaesl2c5gFe+BuIZXlhHMvgDR4ixnH7wi1XhAMnZQig5i9DAw1MZF3nd0qyKksEUBx
	M4NUdxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2ZX-00000005XDn-2jcB;
	Mon, 02 Dec 2024 09:18:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2YY-00000005X6C-29Ej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:17:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434a9f9a225so206625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 01:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733131045; x=1733735845; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xheUdNTjQZCXCu1iqFVovuDp12XGPVK2eJ3J0wQfUu0=;
        b=OKfP4ecT+hX0M7jC4LJ4Z7jT68QrNpK+FwJO3wsz8r12rYfUMRoFd5OqC+i1OeM67r
         UkIO1bXNNJp0BjwJM9KDn+IJdeyKt8Zz1pMw3fPrx+CFQl3jAC8g4QDFiqr2Rz9aIjqI
         Db+MnBBOLXZJoOmIa9CV0C/zQdS1yZ1gegSKCp1z3GFtg5QWqCuu81MATUC5hf38gc0C
         /0glnBr/oMaDpAbz2S7w50OSAR2aOxU1urOWKn3Lx7Sjgi+fGkPyb6qZIaKq6MuUaCxO
         uPJpd5IxzqzMDd/LSUNV9HGVU4zmIpjk981oP4JthYd9Q/6mO5ve0LOnrpQWsnlG2cUj
         HA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131045; x=1733735845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xheUdNTjQZCXCu1iqFVovuDp12XGPVK2eJ3J0wQfUu0=;
        b=KFLosQXi3+v1UwNgS5HeT0PxgtWVkBGelIdBfTGed2hTVCUeyDWjqZNGTHNovKkiaf
         HTwiLabVFTQH5Xe8EvBOooM6tVSWdMWT7feTMn+Lm3r68eRb9ym9KNaEtU4zd9AgctGQ
         escXJJNRuWR3tccLmVtsZEtoyO+J0urhInHbmJpWgJfePR+NTl1VyCBwIkKhtCxrA0Ni
         u+M8krnC9D52TubSgvogXqwRvn78y8UMgGCiXMmNTGBjZ7ksc3TIIVdlznEG0m0Zilvb
         ZfBM1buWn0MCEv7JFG0/b+h9BWkMbVvcrmBaKWg2+E5KFcykVVK4h0ki2EiQTS4nJ312
         1vxA==
X-Forwarded-Encrypted: i=1; AJvYcCUqVIb/KrLcZv428sxf0eMT45khHd6NKBYgABwTkXoiVdmI982FSKyA0g2qT/Ppxu02ztR3mQ3DY+qCMbvzsF4u@lists.infradead.org
X-Gm-Message-State: AOJu0Yxphz4yydB96YHK+TcQG4KbOXPomPLrCzAaF/ZBi3iH6cdXDVV7
	FZGhC0tzFVAotNYvbxa2pdR+FOBG1PprE+4smmG/4bp6hIyLTCFykBgjrJRo73SR6XV8lKuu6ik
	PKbI0eB/ZD0dlyuXISrhWtU63g9Xw6thJjDG0
X-Gm-Gg: ASbGncumw2z519gvpwrtedPV+7ComZxu5MRaofcJsRyqxNCOiJAeMpSAy9lQHvn91pp
	UV6V+nPcKSSRB1szVO2A3MRaiJbB4+A==
X-Google-Smtp-Source: AGHT+IGdGsEiB9WCD/AraN19zYGjoqrq86Rwh4ys+1rlPGRuRnqjVWf7BZbYMcLYEbVI3xMnZtgZrN3VG06AQdhaNtM=
X-Received: by 2002:a05:600c:6a88:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-434b0401690mr4445725e9.0.1733131044951; Mon, 02 Dec 2024
 01:17:24 -0800 (PST)
MIME-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com> <20241128123515.1709777-16-tabba@google.com>
 <8634j7v9rm.wl-maz@kernel.org>
In-Reply-To: <8634j7v9rm.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Dec 2024 09:16:48 +0000
Message-ID: <CA+EHjTxnYi7_kStfQtExuQTyBEZict5ekmfn_vg100tHFv_VJQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] KVM: arm64: Renumber remaining vcpu guest
 configuration flags
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_011726_547367_388D5694 
X-CRM114-Status: GOOD (  19.03  )
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

On Sun, 1 Dec 2024 at 13:00, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 28 Nov 2024 12:35:15 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > With the vcpu's SVE and PtrAuth configuration flags removed,
> > there are gaps in the numbering of the cflag bits. Renumber
> > VCPU_INITIALIZED to bit 0 to remove the gaps.
> >
> > No functional change intended.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index c5c80c789ad0..2e4afec09728 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -864,10 +864,10 @@ struct kvm_vcpu_arch {
> >  #define vcpu_set_flag(v, ...)        __vcpu_set_flag((v), __VA_ARGS__)
> >  #define vcpu_clear_flag(v, ...)      __vcpu_clear_flag((v), __VA_ARGS__)
> >
> > +/* KVM_ARM_VCPU_INIT completed */
> > +#define VCPU_INITIALIZED     __vcpu_single_flag(cflags, BIT(0))
> >  /* SVE config completed */
> >  #define VCPU_SVE_FINALIZED   __vcpu_single_flag(cflags, BIT(1))
> > -/* KVM_ARM_VCPU_INIT completed */
> > -#define VCPU_INITIALIZED     __vcpu_single_flag(cflags, BIT(3))
> >
> >  /* Exception pending */
> >  #define PENDING_EXCEPTION    __vcpu_single_flag(iflags, BIT(0))
>
> Please fold this with the relevant patches, even if that makes two
> consecutive renumbering patches.

Will do.

Thanks!
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

