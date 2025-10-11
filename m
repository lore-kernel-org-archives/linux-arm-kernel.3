Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E12CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rZ5OY9YNy1tyQbF8ZBq3xrEXPSjfrKt/aDNx5G/Re8=; b=wJN0HMVoLJn9IA3qJxrdxeiCJt
	C6g8QM1RB6FF9+Z93s2MLC1umI8BGT5uO36EXPYs0S1BoPA7uz/lPBFIWHDZhQWRt55FwumuBr3uM
	Os7FKuMwYXmI/uIQpdniNIK+ewE4hrul7fhmKzqHJ07OffXavURyZKzqOTDaxnUpLYo3abwpAt+VP
	fJ/MXJFRWqDdtWAtvWWagmXJY4XLi/363FrzjJ/17OXeoTiCTQGzdLjEkOmSM6WKgo9AKTz4rkQnT
	XyU1TxRvM38yZPXfc+vlKoLPzaepigRAe8pojyz5wuhD8LYFuw7tQS9/p8/VLIGix4jsPzyoXfc1e
	zwbySvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QTJ-00000009lWg-2Xwo;
	Sat, 11 Oct 2025 03:40:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QTI-00000009lVr-2swe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 03:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24587622E6
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C879DC4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760154039;
	bh=d8gS8wOiKMr+l/ZJJK/wQClNzHRVZjbJoYCPz75pBA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DzNmc2htDKTHCp3aozZ6E5kEpQ/T9k9BWOy4+jwgGV0SIndwfInOWiuXfSFiC5/5t
	 QL0ZrMiCOK0FsZeNjSXSIG3/Br58Maj0goLA9/Q6msU1Q15XtRG+/XCdCPfCh/moCu
	 3wN9SmB4nk5eeZ2n9d7wmFfMO1QGUzW5I1c3d7STbqXTYzS+mpV20pHVAmWvmSxSj4
	 RkOfn0MoXV6y5yHYuCfrLF8mrUT/cWs/nH/BhFqc8TDo0dG4dA+boCphnqx3GOExuE
	 QOttymeUokIXpaUETbAytEn+TzSZ/z6oVLixTt5MXuB/USBSphsTqedUHobjukDNnT
	 j/m2eilL1toDw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59052926cf9so2847914e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 20:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJQFJUIyzYc9VQCOq9Axbh68HFMt406CCO8Yfwfo9pz5bB2aRDOdiSvYbFaIfXane6rABnj2dTKoVXakNDEpz8@lists.infradead.org
X-Gm-Message-State: AOJu0YzbEoFF93HZeSdlpcAu2gGLl9cPsGV6FQEaGos1nmRcWBI0LArC
	mLAUavK6wm0uHKvY1ZLyeKl7iQvnPzDP744M9GTbsP+ptuGVRtGyb4LRZlOkUCWA5DziLkUKt8r
	QF9SrYIggl63t9HvGAykjHTJKimQnJKU=
X-Google-Smtp-Source: AGHT+IFLXMYQ5g+Z7hYaE+htkOTZgcAsNtsCxDgeGT8tN/INhUQhJ+SJe8urgMafAAQJ9Ld+ELNhgSE8e7XFB5+/m9g=
X-Received: by 2002:a05:6512:b10:b0:577:9ee:7d57 with SMTP id
 2adb3069b0e04-5906de88ee4mr3575140e87.46.1760154038165; Fri, 10 Oct 2025
 20:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
In-Reply-To: <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Oct 2025 20:40:26 -0700
X-Gmail-Original-Message-ID: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
X-Gm-Features: AS18NWCSTMnmP5OepZJr1Y4u3ZHVFaMO9Ik-XYJVsvY5QDAPT-bP-GHnlwwanEk
Message-ID: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 10 Oct 2025 at 19:54, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Sat, Oct 11, 2025 at 9:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > On 2025/10/11 =E4=B8=8A=E5=8D=8812:25, Ard Biesheuvel wrote:
> > ...
> > > Why do we need both (1) and (2)?
> >
> > Not both, either (1) or (2).
> > Which one do you prefer? Or any other suggestions?
> >
> > Taking all of the considerations in balance, we should decide
> > what is the proper way.
> As a summary, there are three methods:
> (1) Only link libstub with vmlinux.o during the final vmlinux link.
> (2) Remove the attribute __noreturn for real_kernel_entry() and add while=
 (1).
> (3) Ignore "__efistub_" prefix in objtool.
>
> Josh prefers method (1), I prefer method (3) but also accept method
> (1) if it is not only specific to loongarch.
>

This is a false positive warning in objtool, which complains about a
function that falls through, even though that can never happen in
reality.

To me, it is not acceptable to modify how vmlinux.o is constructed
also for other architectures, in order to hide some of its constituent
parts from objtool, which do not use objtool to begin with.


If you are not willing to fix objtool, I suggest fixing the loongarch
code like this:

--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -10,7 +10,7 @@
 #include "efistub.h"
 #include "loongarch-stub.h"

-typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
+typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
                                          unsigned long systab);

 efi_status_t check_platform_features(void)
@@ -81,4 +81,6 @@

        real_kernel_entry(true, (unsigned long)cmdline_ptr,
                          (unsigned long)efi_system_table);
+
+       return EFI_LOAD_ERROR;
 }

