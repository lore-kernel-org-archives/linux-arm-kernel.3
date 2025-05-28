Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=; b=EtnCubJgLkxNi6ltGtLLbWPzPX
	0RyA7ZhMYBvbynjgANqbjRjLEdxVAkA3ZJXcAUFqaEHfo5AlYvGEthsSwpeaWUfwf3ncs/LLoT9Du
	Pnk96Gl4SUqVnPfmUKxZGnJXIdroQMS6rIPzZynGHJ3GnrLNjyccZAv+7dGVIwefUaQ6HFuCiVhkc
	lTy7tVi8U9Jd27zlXdFE03iXuBBsn+dnJXDLDhoQBNE9ua33CeJq6ubrbvG+sgK59uOEbGeSbc1GM
	JLB6I9hCjNCBmZnrzcb6pxOSA3ZldPp9odOm0jV3096BkgYQY6eajL37Swx/vItXtIAG24ipr6+HR
	SAcFEPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIVn-0000000DWqI-3H1c;
	Wed, 28 May 2025 15:16:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIP6-0000000DVts-1vYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:09:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442ea341570so33749555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748444954; x=1749049754; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=;
        b=FYTgPyB4pWuMOPu21AWDB9kKTG2dAovRqpWDm9gnNYa82fNpKCIJ3UWmRZ1GQyPbzf
         +Dgue7szp8FXY+1iXfmCg/IZR96RANDTMHXBL+jtuWYDQKMoAa89wRD00cjlSLc+Oi86
         nch+n9KkGLDPR9ksPhP5L9coRIIdDW+anTKZoK+mjMf32IZwBWw1E73OQ5pukuc9FaQz
         UYohcmAMCNuViq1L04KCias3CNhfbvEP+uVbwZjKVe8WPfZejD7A4waEhPAg+5sBHeiY
         9IkaecnRrHJ5oHXwRJvlP5AscvTCbU4Xat5PNEhJgCpYuvYyxof9I++QIfr1kTvq2pjs
         s6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444954; x=1749049754;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=;
        b=PV4cpcxe5zQ9Sbs8im12AqL1NZ902+OhtaeXV/joQFMNG5mACKCrH5jm/5eckwhNnu
         X3XZZp/y2PZ6u4cFiJb3YKfsqpeFjp1+ocB47BsryKqwWOj7C73KMYQe7Elqx6zq1J6x
         WQG9JaR8yXB4A72YakwMC4E+PTfoWHalBV79HKHoPV5YwkVjJ4VKXqFssfx0dnkeWvRV
         ZGmm4vxSsPQOdx7f0EY6Gtbhb8jlK/+XfPlmOfapmY0qQfSQHeUkFNr5032wYt1wAkZ7
         DMGbQglkpWQKu98jGYJJQE+e3mIVDAG4R6xntwo9oFevakFDPq0fMx3AC+MvW0oi3+Pe
         B5jw==
X-Forwarded-Encrypted: i=1; AJvYcCWT2wke0/fgTkncupRZUwdk8/vJLYI7aFXsSShVXcTYNgbiyOdiEJMoKgrqBF7cicv1Rz97TIMzfAOtk5UdT0eg@lists.infradead.org
X-Gm-Message-State: AOJu0YwZUKpKyV0om+yl0OfyRgp2W22LJsVuA7R8ZUBQxKvxncT7o5yQ
	G3EB34OVQFNMuHtBLu/RF1D8l2ovBsIHd42IKrLNx0oxMJAckEPqrbTjMQiAqp11myw=
X-Gm-Gg: ASbGnctZoHhYHXR05cJMbdyui0q40Ikjtz5uf2LKttJb+j87eWNAR6j2QcFaZPn40lt
	vK2cEN2dIrG09JcaAwCQA00JjHfml24Uwrv3wMeEnIAJH3DNprh/5J55AzNh+VSUEviIZIsx6n+
	UtsIvPsaEvkY2MnOiKGr5pSDzL7LP2/hyBmY36GXruQ3VwfR053YQs2C7lZjVDe9ZUOGhibe/TB
	Q0ya427DNsNEGzNI3iydMOlV1ZXP1iFlnfRRQJMHi6QiixV+VWUrbcdvh3QOcJKNvcgBAKNrgTu
	AvVlSpkozpc5AjmsrKsA8Q9xykoZs+N/HPalG0I=
X-Google-Smtp-Source: AGHT+IGlaccgtVXoxgdtRY0DaxB5E5oM1xLtWSVzQKwZmQedIB076PoZ1cGVyfI0Vth+zZs2F/ULAA==
X-Received: by 2002:a05:600c:8487:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-44c933ed9bbmr168819085e9.4.1748444954154;
        Wed, 28 May 2025 08:09:14 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae525sm24810625e9.21.2025.05.28.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:09:13 -0700 (PDT)
Date: Wed, 28 May 2025 17:09:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250528-ff9f6120de39c3e4eefc5365@orel>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_080916_499175_550A2D0B 
X-CRM114-Status: GOOD (  39.02  )
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

On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
> On 5/26/25 4:13 AM, Andrew Jones wrote:
> > On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
> > > 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> > > > On 5/23/25 6:31 AM, Radim Krčmář wrote:
> > > > > 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> > > > > > Upgrade the SBI version to v3.0 so that corresponding features
> > > > > > can be enabled in the guest.
> > > > > > 
> > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > ---
> > > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > > > -#define KVM_SBI_VERSION_MAJOR 2
> > > > > > +#define KVM_SBI_VERSION_MAJOR 3
> > > > > I think it's time to add versioning to KVM SBI implementation.
> > > > > Userspace should be able to select the desired SBI version and KVM would
> > > > > tell the guest that newer features are not supported.
> > 
> > We need new code for this, but it's a good idea.
> > 
> > > > 
> > > > We can achieve that through onereg interface by disabling individual SBI
> > > > extensions.
> > > > We can extend the existing onereg interface to disable a specific SBI
> > > > version directly
> > > > instead of individual ones to save those IOCTL as well.
> > > 
> > > Yes, I am all in favor of letting userspace provide all values in the
> > > BASE extension.
> > 
> 
> We already support vendorid/archid/impid through one reg. I think we just
> need to add the SBI version support to that so that user space can set it.
> 
> > This is covered by your recent patch that provides userspace_sbi.
> 
> Why do we need to invent new IOCTL for this ? Once the user space sets the
> SBI version, KVM can enforce it.

If an SBI spec version provides an extension that can be emulated by
userspace, then userspace could choose to advertise that spec version,
implement a BASE probe function that advertises the extension, and
implement the extension, even if the KVM version running is older
and unaware of it. But, in order to do that, we need KVM to exit to
userspace for all unknown SBI calls and to allow BASE to be overridden
by userspace. The new KVM CAP ioctl allows opting into that new behavior.

The old KVM with new VMM configuration isn't totally far-fetched. While
host kernels tend to get updated regularly to include security fixes,
enterprise kernels tend to stop adding features at some point in order
to maximize stability. While enterprise VMMs would also eventually stop
adding features, enterprise consumers are always free to use their own
VMMs (at their own risk). So, there's a real chance we could have
deployments with older, stable KVM where users want to enable later SBI
extensions, and, in some cases, that should be possible by just updating
the VMM -- but only if KVM is only acting as an SBI implementation
accelerator and not as a userspace SBI implementation gatekeeper.

Thanks,
drew

> 
> > With that, userspace can disable all extensions that aren't
> > supported by a given spec version, disable BASE and then provide
> > a BASE that advertises the version it wants. The new code is needed
> > for extensions that userspace still wants KVM to accelerate, but then
> > KVM needs to be informed it should deny all functions not included in
> > the selected spec version.
> > 
> > Thanks,
> > drew
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

