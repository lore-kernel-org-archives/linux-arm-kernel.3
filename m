Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB6DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 02:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0sbvdyMOhP4gAbwmylvW8LFGC2Lj/073xwOM+B6M18=; b=afJF0vJulXtoG2rnelB6LxJ3Vg
	R8qtYdTuRwcV9SkdVcuwZI8sOR9BrX6+V6v5PQFJUGYu3mi4R7ZNJIePOA8Ci0DsCKmol3XBt/3Mx
	onlIfJ1Yxn7m/+zXvkUvv/5dwZHOuQxTUBd0Ar/997h047fxSPldxrn5cWAwZjPg19NKvtWgHjZ0E
	VlVj9bqoEoPdJj6Cp4wpVrAUYPq3V/5xu9ZNO32xq21k5wGzs7uGtDWptASFxU4xzM+CuWidIRdHU
	aUgRbNOHtD2YPPRD6ZqZPwJMzcsnVKx9hmMyPwc6766I9ih6d/Uypie3GgeQLWD5JVmanA/XwzxOO
	jx8fDPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiip-00000008pTV-3r02;
	Wed, 18 Jun 2025 02:40:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRigc-00000008pLV-3y3d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EEC6A4AACC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF06AC4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750214281;
	bh=6b3iIfu6jzCCt3mWYw2MvJyu3GCzr8Fe/h54qXuaBAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FlsdBlggwhpi3bHk9WUdle82DFNgz2Fjlutc+6GxJQtPLMVxpYJDH0cfObmocupLx
	 o1gUAXc3IFxfQQimvxH4idceYv1fEtExn8kAnKyWbqdNv3xXpvVR7nQ7/e1ecgMjtE
	 cnv2FewXpoDMg7FePO8Ccorw7QbMH/y5zvVNK90JxcwdPcZpM+jACwqVdBRJopjBdU
	 qb148RSZdQpTox69t8G5DLrTbd5k7bi+yF67RvsIxJprYO0n4i7qP0Q8nT7kSOttsi
	 OgMj9i2C22lQp0J4Gv3f7dyXYG6jBenQGl0+F5yo0gicP49G6NAVBzyeMcd22SgyGu
	 g8raMQ+Oi42Cg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5533303070cso6098370e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 19:38:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YzzKHt7juNJJj9RQi9pIIlefu3s/HbFGumwqJUZZ/WU6wNpik5p
	IFL4BdLQLxREFxSLc6HTBIgR7A4N4wQlcyMBrKCiLqAjEE6SZ4OuJttFLpLQEX0FsLIv7vvKFte
	F1pAgRq5qYbrQ235RlHDQfVVKZexMOTU=
X-Google-Smtp-Source: AGHT+IEXp9iKMD2aWmN/efqPNL/5+ytd+gAAdg/TaHdlszXlhzBTbI9xZmTKnUdMm2uhIW7fcfDhXbuTHSJgfGYQd5s=
X-Received: by 2002:a05:6512:3986:b0:553:ae05:9c48 with SMTP id
 2adb3069b0e04-553b6f3937fmr3941573e87.45.1750214280525; Tue, 17 Jun 2025
 19:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250617200406.GA3636948@ax162>
In-Reply-To: <20250617200406.GA3636948@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Jun 2025 11:37:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTNU0GopxtHCYLDGrV5mDnkMfTydiW2SAHW3uV_bCc9w@mail.gmail.com>
X-Gm-Features: AX0GCFvOHlgCw9fwhQt3pZs1n5ukL5M4NyGJwOjnvbnH0PZqp1EFb3F_MVJyIP4
Message-ID: <CAK7LNAQTNU0GopxtHCYLDGrV5mDnkMfTydiW2SAHW3uV_bCc9w@mail.gmail.com>
Subject: Re: as-instr in Kbuild broken for arch/arm
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_193803_051310_E16EAF80 
X-CRM114-Status: GOOD (  17.39  )
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

On Wed, Jun 18, 2025 at 5:04=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Masahiro,
>
> I backported commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use
> proper flags and language target") to 5.4 due to an upstream clang
> change that necessitates this [1] but it causes a failure for as-instr
> with arm [2] because arch/arm/Makefile uses '-include asm/unified.h' for
> KBUILD_AFLAGS but LINUXINCLUDE is not present in the as-instr command,
> resulting in
>
>   <built-in>:1:10: fatal error: 'asm/unified.h' file not found
>       1 | #include "asm/unified.h"
>         |          ^~~~~~~~~~~~~~~
>   1 error generated.
>
> There does not appear to be any uses of as-instr within Kbuild (as
> opposed to Kconfig) for arch/arm after commit 541ad0150ca4 ("arm: Remove
> 32bit KVM host support") in 5.7 but as far as I can tell, it is still
> possible to hit this issue in upstream if one were to be added.
>
> I see two obvious solutions but I am not sure what you would prefer.

The latter because this is more consistent with the existing cases.

The answer is in LINUXINCLUDE itself.

                -include $(srctree)/include/linux/compiler-version.h \
                -include $(srctree)/include/linux/kconfig.h

If we include them in a relative path, we would do:

                -include linux/compiler-version.h \
                -include linux/kconfig.h


Apparently, we always did this in an absolute path.



--=20
Best Regards
Masahiro Yamada

