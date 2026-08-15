Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4CDC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 05:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eS07SXGwx21modMUDcvK0pVgzUSuDjnYthy1a/bug4=; b=TpCYOkCBx1fYxtapsBgIrOWpnY
	V4iy23KOyEQu4AhC5OYNwxrDKm6Sy5Gi8mdomlP54hKEDGybMZ+KFjBgA+0vPkHmYCSiWhJEugF0n
	YFdbL28yMLO4JabP5z1CDoVuYC2fn5TgN71ui5FEi4NjIxWAYelx7DfIQiFi6749Uefon7PkF5+c2
	I7aX2N9zzz6zxD1uO1UBNgD0ATB1m7oQTj7iaw+TtA7r+ijdbI6XL9d86KOBxfAndF3bwzfEQw7UR
	nsO9dRUUgEkJLeorb3AsRUx4vuZDwsApuuQnBiM9j9VQjvYfQAQE/Ju+zf3wqIeMW6fZebxdWLCFy
	7OaZx7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Vx-00000003WQZ-3PBR;
	Sat, 15 Aug 2026 05:01:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Vw-00000003WPu-00nw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 05:01:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9978411C8;
	Sat, 15 Aug 2026 05:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCE51F00A3D;
	Sat, 15 Aug 2026 05:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786770059;
	bh=7eS07SXGwx21modMUDcvK0pVgzUSuDjnYthy1a/bug4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bcspw1rcBO+0xUhrc2Mh/ffAdtwMmJcp2rEpgBMdUZRmNf6verFXl6gM3uTEOdIqx
	 25jyvCRBaCuZlTQ5/Eoajypagq4fk1yOtTqMW+0Z1MWnCPH/VVL8YjcaedntxjE1Rf
	 ccjnY2Ty5EWsj4LyXf/4TlOAxCOpOj833/0vBPuSmN6EaVn4xRCawW5RXn8K+6uLMp
	 NJG9Y8WaTh0utSCQFLEusI3m/I9pxn3AnqmhsY27sNlHQZlsxz80RD6yyjNNUBDXZf
	 YpZJpsS89ffSRMglEMYwo6ZgulXofYUv29ce/MTW9gQXOXUooR+if1JJVSpbbNjgsw
	 ZzzXy054KXRCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] arm64/bti: Force-enable BTI linker veneers
To: "Catalin Marinas" <catalin.marinas@arm.com>, "Josh Poimboeuf" <jpoimboe@kernel.org>, "Will
 Deacon" <will@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Joe Lawrence" <joe.lawrence@redhat.com>, "Song
 Liu" <song@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>, "Petr Mladek" <pmladek@suse.com>, linux-kernel@vger.kernel.org, "Mark
 Rutland" <mark.rutland@arm.com>, linux-toolchains@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Nick
 Desaulniers" <ndesaulniers@google.com>, live-patching@vger.kernel.org, "Miroslav
 Benes" <mbenes@suse.cz>, "Kees Cook" <kees@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>
In-Reply-To: <edae8b52c1cba6eecd0bc75f709f6009816b80b8.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <edae8b52c1cba6eecd0bc75f709f6009816b80b8.1786768375.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 05:00:58 +0000
Message-Id: <20260815050058.ACCE51F00A3D@smtp.kernel.org>
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
- [Medium] ld-option incorrectly evaluates to true for -z force-bti on olde=
r GNU ld versions, causing build failures.
--

--- Patch [11]: [PATCH 11/12] arm64/bti: Force-enable BTI linker veneers ---
commit dc92fd3fe21010a76154b8b30a8e4ff7c0d55416
Author: Josh Poimboeuf <jpoimboe@kernel.org>

arm64/bti: Force-enable BTI linker veneers

This commit force-enables BTI veneers using the "-z force-bti" linker
option to ensure they are created even if some input objects are missing
the BTI feature bit. This aims to prevent silent runtime BTI exceptions
on larger kernels.

> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 4eee721c0b278..d0db9a6766a2f 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -25,6 +25,7 @@ endif
> =20
>  ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
>  KBUILD_AFLAGS	+=3D -include $(srctree)/arch/arm64/include/asm/bti-note.h
> +LDFLAGS_vmlinux	+=3D $(call ld-option,-z force-bti)

[Severity: Medium]
Does this ld-option check reliably detect if the linker supports "-z force-=
bti"?

When Kbuild's ld-option tests linker support, it executes the linker with "=
-v".
However, when GNU ld is invoked with "-v" and no input files, it prints its
version information and immediately exits with a 0 status code, completely
bypassing any validation of keyword arguments like "-z".

Because of this, ld-option will falsely report that "-z force-bti" is suppo=
rted
on all versions of GNU ld, even older versions (prior to 2.34) where the op=
tion
was not yet introduced.=20

During the actual kernel link, ld parses the "-z" list, fails to recognize
"force-bti", and emits an ignored warning. If CONFIG_WERROR=3Dy is set, the=
 linker
escalates this warning to a fatal error and breaks the build. On builds wit=
hout
CONFIG_WERROR, the warning is ignored and the patch silently fails to enfor=
ce
the intended BTI veneers.

>  endif
> =20
>  cc_has_k_constraint :=3D $(call try-run,echo				\

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786768375.gi=
t.jpoimboe@kernel.org?part=3D11

