Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E364C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 05:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRTMgmRzAZtXNEOmAT8IbS28wddZr0+Lj7+LsIfEVA4=; b=hUS0zqtLFeg7LtB4deY3G4VAPz
	P0SqeHXFG/TgeHyJKkW8bTsDWWm1hViEBbywBxZEeetAS0cMLg2RG3mEGxtBo2kAsdFHLt5M/hqQu
	oRyIw6nX8E/61Z4SMlsuqZ2Za1T/fFAZ5BZd85BLZhYYX+mJascuhCpC0WVuxTBys5+dp7QDiC2kx
	z6zT62JsDqoKBpgJ3NWztelhbxA4bBMq4ayukHe3fvpWtpSJwS5gQ8+ARDL7UMaMQBd/33WNHKemV
	AVoo8YjVXs8D2rNN7IxGX9qmzKV6q8nubgKmR507jbr4ttNRdUMZ+ZQV2aB7dtneknnxV8mf3cRAl
	z/TJJiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Xy-00000003Wjc-0qqv;
	Sat, 15 Aug 2026 05:03:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Xw-00000003WjU-3ow8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 05:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0129A61126;
	Sat, 15 Aug 2026 05:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F851F000E9;
	Sat, 15 Aug 2026 05:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786770183;
	bh=rRTMgmRzAZtXNEOmAT8IbS28wddZr0+Lj7+LsIfEVA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PiBAATCa8itJIkC++xchS6eUKPAdw1nwxt5GQa+XskLRQECxWmrgh/+OWayeeupcd
	 A6HAANOhSFRwCoijLQxbJbWbOO3QA6ADCy7ct196zSsyPppPm6SC68PToJlYG+z/XA
	 DqYgkXAQ02WUrS8uY3QYWpikWDNuHnvZERW0ebOwR7qnl7sD2LDrgkXgi+hnVvv9ll
	 wfGHZmB6g4g1uQbxvrDIK5RFsPsNqTzEI3H4oBIkMPFzGk3qnzouWkPzeRW8ZdSRYV
	 435PSrUXzLRdUADF9l3HrhFAViwzGoEzWjWby77EjsB36F0fubFFSADc4Zc23cqrb5
	 +WS4QRT8h/IeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/12] arm64/bti: Advertise BTI in assembly objects
To: "Catalin Marinas" <catalin.marinas@arm.com>, "Josh Poimboeuf" <jpoimboe@kernel.org>, "Will
 Deacon" <will@kernel.org>
Cc: "Ard Biesheuvel" <ardb@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Petr
 Mladek" <pmladek@suse.com>, "Mark Brown" <broonie@kernel.org>, live-patching@vger.kernel.org, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Mark Rutland" <mark.rutland@arm.com>, "Joe
 Lawrence" <joe.lawrence@redhat.com>, "Kees Cook" <kees@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Song Liu" <song@kernel.org>, linux-toolchains@vger.kernel.org
In-Reply-To: <5340f3df281bebc81aad3cd9a7471d95061b4b9d.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <5340f3df281bebc81aad3cd9a7471d95061b4b9d.1786768375.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 05:03:02 +0000
Message-Id: <20260815050302.86F851F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fails to enable BTI veneers for the kernel because EFI s=
tub and PI object files explicitly strip the property note.
--

--- Patch [7]: [PATCH 07/12] arm64/bti: Advertise BTI in assembly objects -=
--
commit f368db6f176a29dc1fd3803f6ac93282119ab6aa
Author: Josh Poimboeuf <jpoimboe@kernel.org>

arm64/bti: Advertise BTI in assembly objects

This commit forces the inclusion of a GNU property note with the BTI bit
into every assembly file. This is intended to ensure the linker emits BTI
veneers for >128MB kernels by ensuring all input objects have the property.

> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 6b005c8fef706..4eee721c0b278 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -23,6 +23,10 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
>  LDFLAGS_vmlinux	+=3D --fix-cortex-a53-843419
>  endif
> =20
> +ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
> +KBUILD_AFLAGS	+=3D -include $(srctree)/arch/arm64/include/asm/bti-note.h
> +endif

[Severity: High]
This isn't a bug introduced by this patch, but will this approach still
fail to emit BTI veneers for the kernel?

The GNU linker requires all input objects to have the BTI property, but
the EFI stub and PI object files explicitly strip the property note before
they are linked into vmlinux.

In drivers/firmware/efi/libstub/Makefile:

STUBCOPY_FLAGS-y		+=3D --remove-section=3D.note.gnu.property

And in arch/arm64/kernel/pi/Makefile:

$(obj)/%.pi.o: OBJCOPYFLAGS :=3D --prefix-symbols=3D__pi_ \
			       --remove-section=3D.note.gnu.property

Since these objects are stripped of the note and linked into vmlinux,
will the linker continue to evaluate the global link with objects lacking
the BTI property, leaving the original large-kernel crash unresolved?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786768375.gi=
t.jpoimboe@kernel.org?part=3D7

