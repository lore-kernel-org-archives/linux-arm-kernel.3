Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB23C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 19:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PETGhQTSZRzlo7qrX63Z+YHbFnHKtUVwIfZH3bLWHOY=; b=POKaJgEep9Oc5X05e9PZqk9e/c
	CW4Oc2WQ9qK4e9QsGK7nXukG6gbQX8rkJTwW33+qnGa22PrEZzQZFuGL0pS/oeaqmg3EJeEKQ6XKi
	pOGeamBwzUqdxGQ/EOle4C2VKT8UiE0o/9+c8STtjUAhVU143ZSXH6cXRwvvJS2+HfFdiX6T/hh/N
	/Se30NfI39w4UkYh2YS3ZZOSwvPhdjTBRpS19BH8VfP9QKcsAnygjsEwTOixbyzmaysWxaOh+J7eT
	oTUd7FuuVIp7iK9ADg4ZQyaKq8PFlqjiwlj3AM+P6lOon9rQSPtW9GWJvceg4jV2+otCZdsFRodqa
	YpI9rKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKikc-0000000GQFK-2jYl;
	Thu, 29 May 2025 19:17:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKiiS-0000000GQ10-3tlY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 19:15:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so105377f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748546099; x=1749150899; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PETGhQTSZRzlo7qrX63Z+YHbFnHKtUVwIfZH3bLWHOY=;
        b=N+HHhDtU4eTPy1ENfd1nJsPY+tz/DftyPIk/yAo6U2urlkJ67fV8NaiyjlFi9Io8r6
         N9MNMiTEdZFO2uGxbHwUUC/sdBCLW2TMGcuCYfcyQwGM15+b5CYx5AVlDQS+8x9PWQTc
         ZB/kTQnBXwvR7WH4moz+QECYdZpqVxW0soJHjUy/bFHLYAmCfouS5xqfEvh5G4EO6ly2
         6qJIiOP9FgMMU5IxAE/yUuczdWnUFi0lloulJeAecQV6SLixAQT+EWokEOgtk9vhcx+m
         +4b8WOJVV/jynY1o7oUCXYZhsj42waH2dNXqjokUjKv0p7rro/R9h2ov4w/8P7D8tF6u
         Yk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748546099; x=1749150899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PETGhQTSZRzlo7qrX63Z+YHbFnHKtUVwIfZH3bLWHOY=;
        b=EMMZ/6LDgfpFr+c7+ugd02i4Skv2gCuuAlMKC+spzI9mYQtjgewQRVj0Y84DkSmRvS
         vDvHAjfsdWvRJmeQdFdr9fG1oAppTcj8jkRjKjSSu/khB9oAi7OlrmIPZ1IV0UWi+fqY
         EbirXSmezvBcf00+XuomNfuEGkS61mP4ycI4HYAm6HK2oKddlBYm3UHMfn4nR5OL1pQl
         UMuYb0FqEOFwiUCiEyFhFe0oMBal8ODYp+iUd5Ja5TDVvLBHL4Yywa2w6aAOMmw5kv2f
         0pTRzxnYwKWdW3HiNKRcqyYed4yKJ1qqToLvsZCQqyh5sYemw6HpdMIkeG8tE+7MMAbG
         tRXA==
X-Forwarded-Encrypted: i=1; AJvYcCXnnKs3s1sof3htAbEHvUYzm5czOjz7omaZKrJm7mRL9DSagCYFK396xKvs/upxTapuhV39PjpgTQVGE/JsquA+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2lWv38WMi0iqG1F2dWJuB81q3I4hQPUIP/c1BP34CB8b2Ap4v
	U6cbgX4/EZCFWiZk+E92uJahpTjdkNC1yQyXQpO2kmRcmejwY/bK9JenzyrWLZ8JLk0=
X-Gm-Gg: ASbGncvhjiMU4ojpp0QDTv1TY5uZMamNtKE42V5bS/YJba+sOsByXjIQXoWSYgcbvtO
	atfYdewm+ByxSsYorH1W7/G1TVUHV8eSUTYO8x4lTfOsd74nHYwG5b5sbLwi5J39QksphRiLEDC
	8frDR7bzi1HmcUoNtqJqpf9ICtsPY9GiDfwNTsdp0tPy5+n6tL6ticAZVyUxdN/fg98oxGJ0HVN
	612mLkeejm2H16A8Q9SarwftiEiwN/OoXAMhJSWYzs9DE5C1eN7Kc9rDI+JY/p7v4/SpV1dBUxt
	3RqFJ6LGukPu8WsRUHYDSQYzEsDSP+rncxr6HpxAt+2QJ/mWbh+dHZw8rDMK/83u2dBzwclWW+S
	JJ7q+P6F+FWaPbUk=
X-Google-Smtp-Source: AGHT+IGhExYqvgFvSbs5q9ZpMpC1uzEuDKmNj/YazFyKTWl/Thue3B6m/H9d1jT5tZwjFvDXoPguhQ==
X-Received: by 2002:a05:6000:430a:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3a4f7ab15f4mr336349f8f.54.1748546098772;
        Thu, 29 May 2025 12:14:58 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fb0bsm2747906f8f.87.2025.05.29.12.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 12:14:58 -0700 (PDT)
Date: Thu, 29 May 2025 21:14:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250529-badd99c8168a8f607c84338a@orel>
References: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_121500_966199_A05FA08D 
X-CRM114-Status: GOOD (  76.66  )
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

On Thu, May 29, 2025 at 11:44:38AM -0700, Atish Patra wrote:
> 
> On 5/29/25 3:24 AM, Radim Krčmář wrote:
> > I originally gave up on the idea, but I feel kinda bad for Drew now, so
> > trying again:
> 
> I am sorry if some of my replies came across in the wrong way. That was
> never
> the intention.

Not at all. Radim only meant that I was defending his patches, even though
he wasn't :-)

> 
> 
> > 2025-05-28T12:21:59-07:00, Atish Patra <atish.patra@linux.dev>:
> > > On 5/28/25 8:09 AM, Andrew Jones wrote:
> > > > On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
> > > > > On 5/26/25 4:13 AM, Andrew Jones wrote:
> > > > > > On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
> > > > > > > 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> > > > > > > > On 5/23/25 6:31 AM, Radim Krčmář wrote:
> > > > > > > > > 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> > > > > > > > > > Upgrade the SBI version to v3.0 so that corresponding features
> > > > > > > > > > can be enabled in the guest.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > > > > > ---
> > > > > > > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > > > > > > > -#define KVM_SBI_VERSION_MAJOR 2
> > > > > > > > > > +#define KVM_SBI_VERSION_MAJOR 3
> > > > > > > > > I think it's time to add versioning to KVM SBI implementation.
> > > > > > > > > Userspace should be able to select the desired SBI version and KVM would
> > > > > > > > > tell the guest that newer features are not supported.
> > > > > > We need new code for this, but it's a good idea.
> > > > > > 
> > > > > > > > We can achieve that through onereg interface by disabling individual SBI
> > > > > > > > extensions.
> > > > > > > > We can extend the existing onereg interface to disable a specific SBI
> > > > > > > > version directly
> > > > > > > > instead of individual ones to save those IOCTL as well.
> > > > > > > Yes, I am all in favor of letting userspace provide all values in the
> > > > > > > BASE extension.
> > > > > We already support vendorid/archid/impid through one reg. I think we just
> > > > > need to add the SBI version support to that so that user space can set it.
> > > > > 
> > > > > > This is covered by your recent patch that provides userspace_sbi.
> > > > > Why do we need to invent new IOCTL for this ? Once the user space sets the
> > > > > SBI version, KVM can enforce it.
> > > > If an SBI spec version provides an extension that can be emulated by
> > > > userspace, then userspace could choose to advertise that spec version,
> > > > implement a BASE probe function that advertises the extension, and
> > > > implement the extension, even if the KVM version running is older
> > > > and unaware of it. But, in order to do that, we need KVM to exit to
> > > > userspace for all unknown SBI calls and to allow BASE to be overridden
> > > You mean only the version field in BASE - Correct ?
> > No, "BASE probe function" is the sbi_probe_extension() ecall.
> > 
> > > > by userspace. The new KVM CAP ioctl allows opting into that new behavior.
> > > But why we need a new IOCTL for that ? We can achieve that with existing
> > > one reg interface with improvements.
> > It's an existing IOCTL with a new data payload, but I can easily use
> > ONE_REG if you want to do everything through that.
> > 
> > KVM doesn't really need any other IOCTL than ONE_REGs, it's just
> > sometimes more reasonable to use a different IOCTL, like ENABLE_CAP.
> > 
> > > > The old KVM with new VMM configuration isn't totally far-fetched. While
> > > > host kernels tend to get updated regularly to include security fixes,
> > > > enterprise kernels tend to stop adding features at some point in order
> > > > to maximize stability. While enterprise VMMs would also eventually stop
> > > > adding features, enterprise consumers are always free to use their own
> > > > VMMs (at their own risk). So, there's a real chance we could have
> > > I think we are years away from that happening (if it happens). My
> > > suggestion was not to
> > > try to build a world where no body lives ;). When we get to that
> > > scenario, the default KVM
> > > shipped will have many extension implemented. So there won't be much
> > > advantage to
> > > reimplement them in the user space. We can also take an informed
> > > decision at that time
> > > if the current selective forwarding approach is better
> > Please don't repeat the design of SUSP/SRST/DBCN.
> > Seeing them is one of the reasons why I proposed the new interface.
> > 
> > "Blindly" forwarding DBCN to userspace is even a minor optimization. :)
> > 
> > >                                                         or we need to
> > > blindly forward any
> > > unknown SBI calls to the user space.
> > Yes, KVM has to do what userpace configures it to do.
> > 
> > I don't think that implementing unsupported SBI extensions in KVM is
> > important -- they should not be a hot path.
> > 
> > > > deployments with older, stable KVM where users want to enable later SBI
> > > > extensions, and, in some cases, that should be possible by just updating
> > > > the VMM -- but only if KVM is only acting as an SBI implementation
> > > > accelerator and not as a userspace SBI implementation gatekeeper.
> > > But some of the SBI extensions are so fundamental that it must be
> > > implemented in KVM
> > > for various reasons pointed by Anup on other thread.
> > No, SBI does not have to be implemented in KVM at all.
> > 
> > We do have a deep disagreement on what is virtualization and the role of
> > KVM in it.  I think that userspace wants a generic ISA accelerator.
> 
> I think the disagreement is the role of SBI in KVM virtualization rather
> than
> a generic virtualization and the role of KVM in it. I completely agree that
> KVM should act as an accelerator and defer the control to the user space in
> most of the cases
> such e.g I/O operations or system related functionalities. However, SBI
> specification solves
> much wider problems than those. Broadly we can categorize SBI
> functionalities into the following
> areas
> 
> 1. Bridging ISA GAP
> 2. Higher Privilege Assistance
> 3. Virtualization
> 4. Platform abstraction
> 5. Confidential computing
> 
> For #1, #3 and #5, I believe user space shouldn't be involved in
> implementation
> some of them are in hot path as well.

IMO, userspace should still be in control of whether or not it's involved
in #1, #3, and #5. It may make little sense for it to be involved, but the
choice should still be its.

> For #4 and #2, there are some
> opportunities which
> can be implemented in user space depending on the exact need. I am still not
> clear what is the exact
> motivation /right now/ to pursue such a path. May be I missed something.
> As per my understanding from our discussion threads, there are two use cases
> possible
> 
> 1. userspace wants to update more states in HSM. What are the states user
> space should care about scounteren (fixed already in usptream) ?
> 2. VMM vs KVM version difference - this may be true in the future depending
> on the speed of RISC-V virtualization adoption in the industry.
> But we are definitely not there yet. Please let me know if I misunderstood
> any use cases.

That's what I'm aware of as well, but I see giving userspace back full
control of what gets accelerated by KVM, and what doesn't, as a fix, which
is why I wouldn't want to delay it any longer.

> 
> > Even if userspace wants SBI for the M-mode interface, security minded
> This is probably a 3rd one ? Why we want M-mode interface in the user space
> ?
> > userspace aims for as little kernel code as possible.
> 
> We trust VMM code more than KVM code ?

We should be skeptical of both, which is why we'd rather put as much code
in userspace as possible. Insecure/faulty userspace will hopefully have
exploits/bugs contained to the single process. An insecure/faulty KVM
means the host is compromised/crashed. On x86, Google put a lot of effort
into moving instruction emulation out of KVM for security concerns[1]. In
general, if it's not a hot path and there's a way to do it in userspace,
then it should be done in userspace (or at least there should be an
option to use userspace -- each use case can choose what's best for
itself).

[1] https://www.linux-kvm.org/images/3/3d/01x02-Steve_Rutherford-Performant_Security_Hardening_of_KVM.pdf

Thanks,
drew

> 
> > Userspace might want to accelerate some SBI extension in KVM, but it
> > should not be KVM who decides what userspace wants.

