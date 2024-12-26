Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDdetpWl8Rx8zGrvo8k5g/rjchfr37Wq2r3vYm1xNTQ=; b=yTrDslHUCqur32wjan2JK59TtH
	nrPABHpIoEd2Prg3ZkBZU+kgtttCrcqxwdmKmS7H6A5hBAmxdu1OwW9505GybJSUzH93fKik9VKvN
	Xn6HwB5dNWvpd1/Fe9z99+Acxb1feXOKr9MFQnOmpFSn452bhaPJeOJgQb6BWPioaz0vhR6BJXzJY
	kpGdNqnG6NqgX6rsGxc/jDu7g9zEDpsnY6Y6Sl7gUqn3Pr4Z7dJVG3au8PHOHmb79WWl4uUMMIU/e
	fWP5MbKzi4h81kFOKNEKmYvfHyoAiHf8clMMGx4tfi8SRM4mL28CO8W9THms7ZVitJMCD5XkZHi9o
	qHkasJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoMz-0000000FraW-3EZ1;
	Thu, 26 Dec 2024 13:57:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoLo-0000000FrMD-0aJo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 13:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5204DA40E06
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 13:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34BAC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735221390;
	bh=rQtPaps1uCjak1GsAb0T6MZ0Udcaw509a22ogoKvfQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P7nrAxSEHTclguVe69cSAJOX7qxWjYMz6oYdGuCRzXZoNkH244tGbiRNdIW4cKoeT
	 OYNrfv9Gh5ktqfWQXqHPCQ5vkUn4bRn0FK6QObrbJMufwNuK4lk+HTk8dbn8iz/zQw
	 fp3CwoRQQlvnjK7V6ocQ1qx2Sn/PY1gB/NM2l0ukgu83bH7alDgif4oep7N7tWVVk1
	 hCKIJ9s+CySulXLs/804n4zWcZNgbfCoQVv2FoiIR2jLufItODyBR9X6A9aSoa1Kya
	 MuVMcPHijXwRPDAk4aJDJKBMEE78aQDNevb/QRnoNc/G9KWdZOf+ptE5GtLhz9j9kX
	 nYZs0uTWzABCQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so7230284e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 05:56:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrcGQjwsODxVKA7YT4lpwTVrn+IhTUq89UVzRcQINppqdSguklW7SbETNIbSS4+YM3YFv7ZXqou7I7SNzS9dTI@lists.infradead.org
X-Gm-Message-State: AOJu0YwoQmllZgHldnLYUghcRPPE5Jmp27baAjB0Srpf8ArR3lTzWQmj
	ZrFLeovULZvkdpjXZAZSXOUuCw6M59/sjW/ib8f5OnGrfgvNxX2i+sUoCuSZbj/rvu2TDuerooA
	gmdIT2hxylgxmsSd6OcsMhhTMtI8=
X-Google-Smtp-Source: AGHT+IHKWIu7+TnvA5d8Khi9NI2HC0pclZ/WbzhtUzLIJ3LRSBAp+26TZgma/b8RIB5S6N7Ok5xldVAFNyYJuamFV8I=
X-Received: by 2002:a05:6512:4014:b0:53e:2bb0:4942 with SMTP id
 2adb3069b0e04-5422956beb5mr7528070e87.57.1735221389529; Thu, 26 Dec 2024
 05:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20241225153343.134590-1-masahiroy@kernel.org> <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
In-Reply-To: <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Dec 2024 22:55:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
Message-ID: <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] modpost: work around unaligned data access
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: gregkh@suse.de, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, rusty@rustcorp.com.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_055632_318740_088D3C27 
X-CRM114-Status: GOOD (  17.45  )
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

On Thu, Dec 26, 2024 at 1:27=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Masahiro,
>
> > The latest binutils stopped aligning section data in relocatable ELF.
> > It saves small number of bytes that were previously inserted between
> > sections. However, modpost crashes due to unaligned access:
> >   https://sourceware.org/bugzilla/show_bug.cgi?id=3D32435
> >   https://sourceware.org/bugzilla/show_bug.cgi?id=3D32493
> >
> > Similar to kernel space, unaligned data access in userspace can be
> > problematic on some architectures.
> >
> > Simple example on ARM:
> >
> >  $ CC=3Darm-linux-gnueabihf-gcc
> >  $ echo 'int foo(int *p) { return *p + *(p + 1); }' | ${CC} -O2 -x c - =
-c -o foo.o
> >  $ echo 'int foo(int *p); int main(void) { char str[16] =3D "helloworld=
"; return foo((int *)(str + 1)); }' | ${CC} -x c - -c -o main.o
> >  $ ${CC} -static -o unalign-test main.o foo.o
> >  $ qemu-armhf unalign-test
> >  qemu: uncaught target signal 7 (Bus error) - core dumped
> >  Bus error (core dumped)
> >
> > In this case, the 'ldrd' instruction causes a bus error due to an
> > unaligned access. If the -O2 flag is omitted, this issue does not occur=
.
> >
> > To avoid potential unaligned access, use the get_unaligned() approach
> > as seen in the kernel space.
>
> I have just applied this series against Linus' tree and I can confirm tha=
t it fixes the
> unalignment access anymore on sparc64. There is no more "Bus error" and t=
he build succeeds.
>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>


Thanks for the compile test.

Loadable modules (*.ko files) are relocatable ELF.
So, there is no alignment in *.ko files any more
if the latest binutils is used.

Just in case, I did run-tests for arm and arm64.
Even if there is no alignment in *.ko files,
I confirmed that the kernel can load modules.

If you have time, please run-test and
double-check loadable modules are working.



--=20
Best Regards
Masahiro Yamada

