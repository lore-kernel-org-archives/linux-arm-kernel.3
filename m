Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631B4CE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CL2wCU2HH+fd4vHOU7eIexO99AmYoDs4dDo7720ek4=; b=v/unOgBDrKshGZj54KqX9Qldec
	wYKDMXS8B6I/Ftd2HmzI9DKuulLn+kYLC18d4glo/WE+yuC/y5JYIdTzU85rYIYWICDvaAUYTyA0h
	Eazl4oDe+mKeGPGCTkw9w0F8NwWhmKyOVR/hyoF1X0CeTEn3Sm7dYsVYzDWR8foXPZXojMadklEGx
	fk64lT3EuXtgmG2vW2O+R+W3g4w7V52R9bxbWV8h3ezGD8EcSPqVlBlNj/CWG/2wC+DYMuTj08tnn
	4GPgI/kwghYy5gDQ6BGt4fnZO7OVOf2xk4D9O04O+lQyzDnZQtlRlLd2sXfzFYkhWbX6het34ymV0
	xmOce8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wO1-00000000G0F-2SjH;
	Thu, 24 Oct 2024 11:52:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wHM-00000000FCc-3jgr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:45:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4314e64eba4so891375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729770322; x=1730375122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CL2wCU2HH+fd4vHOU7eIexO99AmYoDs4dDo7720ek4=;
        b=Nw5XSdYZAOLkrl4olvSfjYk1XJ48cn4107HTGoaMroGBhj5o6/OvNAgDaMICiqGyG/
         BhC37jhN6fA/Z4ymKlPF0tknJhXMg5JA39beGZv4meuyOq4Z/lyodLps6hY5vWj2m5i6
         8xvbT4qwrl4Lzb5uwdQFFFC2FL0ENN5qtBDuGqpBDsSrIlSs2NUrjC/Z5wGLV60bVqzX
         nl70zbApgP9oYTVwgF4MGzrtHcPc50rVghHoMa6wqMqvuWNRA/QTuQkqWBjxjsetIjCs
         1l94Y16lhmpiSQM0Us7Qb42Wyx+TY9NbfXJSQmsDZrRg8UFhCUeu9F4vFbCSgBYctPXr
         oo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729770322; x=1730375122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CL2wCU2HH+fd4vHOU7eIexO99AmYoDs4dDo7720ek4=;
        b=BxzpyODgpprxMsYyU7aP1KDKwzwCDTnDe9mLNdrAv1jUJjM7+tlvhVPzWTwem/j/Il
         TolyrIrtCAH2sAxDL7JB+br/jmM0TUj3N1oohrNXPp2DTLmvxZ2brfYZneTAmPPjvRJ1
         nZXOa3o7tY9JJ2Jc+nCU4jKq98fjHG1m3qMfjWhXQcmmc8Kf6ztwwc82lNDsQSOfpYPV
         nKWyffdUg+rrdtel6xfv0GP+C8DqjL+mggmrsYU9Vw4p6UuaqqENyGoLBi5aVWgIDJN2
         OZv7S1yvns0XjsH7i1dlE+C3TF+UDhcjJi98KzRGsRV+Egt0vtDK83QZHVKiNVOtEQgg
         8miA==
X-Forwarded-Encrypted: i=1; AJvYcCW/igzx1WSMCBib1mDJxC7WzMUfLXRsIKDubZt+9mLT8m6QlttYwN27BygKEiDIiVLeroB0wkwM3i67WBegWZrG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg3UeNWbxlr9bd0yiGFvNjfRCvslGKhp/Q9OsuPCaPUjjPhAZp
	C1AmRXYdxDaZtoRHaj1e+nlLkAgcLoQjnhLS4YBvCRs6Z2IZmcN22BMjcm3lkMw=
X-Google-Smtp-Source: AGHT+IFA4GABsskGJAvhBVgwpM0Becu10rrF1/mPcNcESTyA5925ZJdl1RcPGWOTLM6OI2YjfLoBKg==
X-Received: by 2002:a05:600c:4f91:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-4318408b98bmr20665275e9.0.1729770322153;
        Thu, 24 Oct 2024 04:45:22 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186be531esm42591215e9.18.2024.10.24.04.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:45:21 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:45:19 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Thomas Tai <thomas.tai@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Greg
 Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <20241024134519.18ed4657@mordecai.tesarici.cz>
In-Reply-To: <df753b4a-0cf1-4544-b073-0ebf2bb71ef2@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
	<fed3b427-a600-4ce5-afef-4ccbfff64931@oracle.com>
	<df753b4a-0cf1-4544-b073-0ebf2bb71ef2@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_044524_956604_6000BD3B 
X-CRM114-Status: GOOD (  24.54  )
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

On Thu, 24 Oct 2024 11:48:55 +0100
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 23/10/2024 22:00, Thomas Tai wrote:
> >=20
> > On 10/17/2024 8:32 AM, Ryan Roberts wrote: =20
> >> On 17/10/2024 13:27, Petr Tesarik wrote: =20
> >>> On Mon, 14 Oct 2024 11:55:11 +0100
> >>> Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>> =20
> >>>> [...]
> >>>> The series is arranged as follows:
> >>>>
> >>>> =C2=A0=C2=A0 - patch 1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Add macr=
os required for converting non-arch code to support
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 boot-time page size selection
> >>>> =C2=A0=C2=A0 - patches 2-36:=C2=A0 Remove PAGE_SIZE compile-time con=
stant assumption from all
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 non-arch code =20
> >>> I have just tried to recompile the openSUSE kernel with these patches
> >>> applied, and I'm running into this:
> >>>
> >>> =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch/arm64/hyperv/hv_co=
re.o
> >>> In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
> >>> ../include/linux/hyperv.h:158:5: error: variably modified =E2=80=98re=
served2=E2=80=99 at file
> >>> scope
> >>> =C2=A0=C2=A0 u8 reserved2[PAGE_SIZE - 68];
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> >>>
> >>> It looks like one more place which needs a patch, right? =20
> >> As mentioned in the cover letter, so far I've only converted enough to=
 get the
> >> defconfig *image* building (i.e. no modules). If you are compiling a d=
ifferent
> >> config or compiling the modules for defconfig, you will likely run int=
o these
> >> types of issues. =20
> >=20
> > It would be nice if you could provide the defconfig you are using; I al=
so ran
> > into build issues when using the arch/arm64/configs/defconfig. =20
>=20
> git clean -xdfq
> make defconfig
>=20
> # Set CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
> ./scripts/config --disable CONFIG_ARM64_4K_PAGES
> ./scripts/config --disable CONFIG_ARM64_16K_PAGES
> ./scripts/config --disable CONFIG_ARM64_64K_PAGES
> ./scripts/config --disable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
> ./scripts/config --enable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
>=20
> # Set ARM64_VA_BITS_48
> ./scripts/config --disable ARM64_VA_BITS_36
> ./scripts/config --disable ARM64_VA_BITS_39
> ./scripts/config --disable ARM64_VA_BITS_42
> ./scripts/config --disable ARM64_VA_BITS_47
> ./scripts/config --disable ARM64_VA_BITS_48
> ./scripts/config --disable ARM64_VA_BITS_52
> ./scripts/config --enable ARM64_VA_BITS_48
>=20
> # Optional: filesystems known to compile with boot-time page size
> ./scripts/config --enable CONFIG_SQUASHFS_LZ4
> ./scripts/config --enable CONFIG_SQUASHFS_LZO
> ./scripts/config --enable CONFIG_SQUASHFS_XZ
> ./scripts/config --enable CONFIG_SQUASHFS_ZSTD
> ./scripts/config --enable CONFIG_XFS_FS
>=20
> # Optional: trace stuff known to compile with boot-time page size
> ./scripts/config --enable CONFIG_FTRACE
> ./scripts/config --enable CONFIG_FUNCTION_TRACER
> ./scripts/config --enable CONFIG_KPROBES
> ./scripts/config --enable CONFIG_HIST_TRIGGERS
> ./scripts/config --enable CONFIG_FTRACE_SYSCALLS
>=20
> # Optional: misc mm stuff known to compile with boot-time page size
> ./scripts/config --enable CONFIG_PTDUMP_DEBUGFS
> ./scripts/config --enable CONFIG_READ_ONLY_THP_FOR_FS
> ./scripts/config --enable CONFIG_USERFAULTFD
>=20
> # Optional: mm debug stuff known compile with boot-time page size
> ./scripts/config --enable CONFIG_DEBUG_VM
> ./scripts/config --enable CONFIG_DEBUG_VM_MAPLE_TREE
> ./scripts/config --enable CONFIG_DEBUG_VM_RB
> ./scripts/config --enable CONFIG_DEBUG_VM_PGFLAGS
> ./scripts/config --enable CONFIG_DEBUG_VM_PGTABLE
> ./scripts/config --enable CONFIG_PAGE_TABLE_CHECK
> ./scripts/config --enable CONFIG_PAGE_TABLE_CHECK_ENFORCED
>=20
> make olddefconfig
> make -s -j`nproc` Image
>=20
> So I'm explicitly only building and booting the kernel image, not the mod=
ules.
> The kernel image contains all the drivers needed to get a VM up and runni=
ng
> under QEMU/KVM.

FWIW with the attached patch I was also able to boot the kernel on
Ampere Altra bare metal and using modules.

Petr T

diff --git a/arch/arm64/mm/pgtable-geometry.c b/arch/arm64/mm/pgtable-geome=
try.c
index ba50637f1e9d..4eb074b99654 100644
--- a/arch/arm64/mm/pgtable-geometry.c
+++ b/arch/arm64/mm/pgtable-geometry.c
@@ -15,8 +15,14 @@
  */
=20
 int ptg_page_shift __read_mostly;
+EXPORT_SYMBOL_GPL(ptg_page_shift);
+
 int ptg_pmd_shift __read_mostly;
+EXPORT_SYMBOL_GPL(ptg_pmd_shift);
+
 int ptg_pud_shift __read_mostly;
+EXPORT_SYMBOL_GPL(ptg_pud_shift);
+
 int ptg_p4d_shift __read_mostly;
 int ptg_pgdir_shift __read_mostly;
 int ptg_cont_pte_shift __read_mostly;

