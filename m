Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22C6C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 04:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tauycDhLSHK8+Z4SEw1ULV8RR4SX0dqi01Ofyz18GyY=; b=YPWiGv53BistttosvbTIOH2kQO
	/PYnebkIP9io0uHXv4xmqLMbr8Hq3Q51g32GweJSa4YPaOwkKlISy3b3lURZKp+yIecSnxsMUIY+1
	KtwfKnAexZbh/lOfgGZEkdey1uzf5cQ/YheCxjeBIEFbWYYGXUuXOrrRsV7VK6jxU45j862NO7Hbs
	smiSLSand1/7GIkufmXvIC9eS0DVGyQhLP337l7ZhSgiuLWp32eCUpNoyFJxJfqV+C7h9kMBd/SX0
	cI9iTVUo0LTDxWCJ3kpy9O/h4ZAgfDLb0GNLhClWjqTFwPHNlKOxeMM3trQdiUBvfDyBgK60Fxh4N
	Aa+X73eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twZI5-00000002AY9-27r9;
	Mon, 24 Mar 2025 04:19:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twZGK-00000002APG-39ze
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 04:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742789886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tauycDhLSHK8+Z4SEw1ULV8RR4SX0dqi01Ofyz18GyY=;
	b=FgYbdGRNCAgpSn5cUClOdMTia/xSZtWYcc28/vt6HsAoS46bJSo90RSHO+kkW2ed3G4RNh
	BNRPFvs7XGF+HsUJdOfSbxzqqFXlwgPoU8noZPfBhcEsinuz3a6MOCKpdwS+HdUnPnmJY4
	lUhxDJJPoUzK2lvhiiBJTOuPYO5PKBc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-bSN5RqkMMMy1oGW_9rIGkg-1; Mon, 24 Mar 2025 00:18:04 -0400
X-MC-Unique: bSN5RqkMMMy1oGW_9rIGkg-1
X-Mimecast-MFC-AGG-ID: bSN5RqkMMMy1oGW_9rIGkg_1742789884
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d333855so38784975ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 21:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742789883; x=1743394683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tauycDhLSHK8+Z4SEw1ULV8RR4SX0dqi01Ofyz18GyY=;
        b=Qiyj/ko4zCgASk4Rr+gId27uZfl1LqQFebmdSXKdjQPZrMGd1PYhplW0/XQaMwzla7
         fKbvhF0e0CSsA2H95Q3m2C4ngFN422u0mmN+ZG1wZpFT2wRBR29O2wOq4tkQlBn84wGz
         D7jhMWDtScCmGEuUe/YJBxuqqr7bv23x1ExpV1SpbBcYDhWOiPUpaZ261YaZpABJZR0T
         ziE0075FSgdreNODqVGlcs0jZTuTV3tmAAhzSO0ExIOkCid5oyG8J0I52h6F9mI8Si7x
         TWWfRcrJlv1pzJq9vYg623XCox37Vfh4vpYgK88Efvm9OFa5sflIxz5lwJ2VGbsaFk3i
         1dbg==
X-Forwarded-Encrypted: i=1; AJvYcCVptLagXHzshURVMipsOpxBi7TuzD1NifXW3ozAjZXjyr3rueVX727BfMGDao23StDP/ncoGkwCLhBCg7Y3M/gd@lists.infradead.org
X-Gm-Message-State: AOJu0YxktPrhBQ10ZYB+tz8saNJ1a4Fo9T/Zuy9peQurnDus2IsFWHFr
	+eqwY/LdbkTc1Ye85Ka6LxB2E3LDsfM84AaQjKM3moLoYHa93ynjlhYUbFBJuqe1qXNrwCZDgh2
	thowI60Zjw3kFkbSTosDbVObbbSua14D6byZf4Q0fn/IoB5Zh5Ju22+in5xx0AYoAxpf09iDoZD
	cDlxvHeWYY/SOgPw/sQQbdkxo9VQCRqNfVsI5F3wDXNzmYh70=
X-Gm-Gg: ASbGncvaSpprl8nstc8iTaDSscEA6FmFRU8LhqZ9lMGACGGgrWOT3i+35rVR4ZKtwqP
	mMUzkShlPpYCpAOFbIF+DltDpzQabs/FOUdmDAk/JellqUDW71v54MWKQW8U8ilt1D0SBujNfTQ
	==
X-Received: by 2002:a05:6e02:3e03:b0:3d4:3cd7:d29c with SMTP id e9e14a558f8ab-3d5961087a4mr114773215ab.11.1742789883494;
        Sun, 23 Mar 2025 21:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKTYUkEhLDCfmTqCzwmW7lTzNOrlm9PhUUN5r+ilaum3pQSmAXsd7VnN9OVuQyn+lnI6uMUA4yOPPaWTzR6xc=
X-Received: by 2002:a05:6e02:3e03:b0:3d4:3cd7:d29c with SMTP id
 e9e14a558f8ab-3d5961087a4mr114772865ab.11.1742789883003; Sun, 23 Mar 2025
 21:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com> <20250320015551.2157511-12-changyuanl@google.com>
In-Reply-To: <20250320015551.2157511-12-changyuanl@google.com>
From: Dave Young <dyoung@redhat.com>
Date: Mon, 24 Mar 2025 12:18:24 +0800
X-Gm-Features: AQ5f1Jo8cgDtoQHR7bje9Ajd-fT5hflpJGHeRbJSkzX-LSsy1GnvBgRPYu2INeE
Message-ID: <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Changyuan Lyu <changyuanl@google.com>
Cc: linux-kernel@vger.kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	luto@kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4C9SLt0o-AMI-1Z15Db7effFzaALlnp3vWudqwfbUCI_1742789884
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_211808_888912_69926F23 
X-CRM114-Status: GOOD (  20.85  )
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

On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> wrote:
>
> From: Alexander Graf <graf@amazon.com>
>
> We have all generic code in place now to support Kexec with KHO. This
> patch adds a config option that depends on architecture support to
> enable KHO support.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  kernel/Kconfig.kexec | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 4d111f871951..57db99e758a8 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -95,6 +95,21 @@ config KEXEC_JUMP
>           Jump between original kernel and kexeced kernel and invoke
>           code in physical address mode via KEXEC
>
> +config KEXEC_HANDOVER
> +       bool "kexec handover"
> +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
> +       select MEMBLOCK_KHO_SCRATCH
> +       select KEXEC_FILE
> +       select DEBUG_FS
> +       select LIBFDT
> +       select CMA
> +       select XXHASH
> +       help
> +         Allow kexec to hand over state across kernels by generating and
> +         passing additional metadata to the target kernel. This is useful
> +         to keep data or state alive across the kexec. For this to work,
> +         both source and target kernels need to have this option enabled.
> +

Have you tested kdump?  In my mind there are two issues,  one is with
CMA enabled, it could cause kdump crashkernel memory reservation
failures more often due to the fragmented low memory.  Secondly,  in
kdump kernel dump the crazy scratch memory in vmcore is not very
meaningful.  Otherwise I suspect this is not tested under kdump.  If
so please disable this option for kdump.

>  config CRASH_DUMP
>         bool "kernel crash dumps"
>         default ARCH_DEFAULT_CRASH_DUMP
> --
> 2.48.1.711.g2feabab25a-goog
>
>


