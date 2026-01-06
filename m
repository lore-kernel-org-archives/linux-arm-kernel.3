Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F30C47BDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmJSjNfo8SiACQa8+jDkNNSao5aYBIkd8WHNl1el5K4=; b=a6xVvp9KldLzEP/ote+xbXwQd5
	ptSwPpNXWXjogkluemh2Sn8gLHS9UOcjOOQVfTquksQ4pYLtc/o/ZcgQATP94vANLAzSHi3736KcB
	QN1/cNUqznDKg4eCvaNvGo1OG8vqJ0KZSh6bMxbZjw5P964sUB4d7fAGu7M6cMUXP2Pt3V11V3gd2
	9Wu0r5VS3ycqHYVfNCxomZ0kRta4z+kyxxrcncTbvQO9vCxh3RnoECD2D2X2z9K1n+kW/Koki8OvW
	XgBAj69JyxZ/qeqM40FllaPLaqRBl9G11V7NFL4QOesw1rrjkv1gYGKmsKPofZB6Ru3WEy4boq0xj
	pFtWn+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Dz-0000000Cmsi-0cta;
	Tue, 06 Jan 2026 10:23:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Dx-0000000Cmrw-0ZEY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00C1041836
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 10:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D202DC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767695015;
	bh=7G/63Ebg037MtWPdMChR2/hajf3uRri9rZlipp0hdvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W9AM8XTTiEn3d3buU61YhWWO/iV+wvM8AWzOcUCrENr+1LMFqYOQL3NPHjrCv/bBO
	 lUgyeVkx2QEHvJLtH+O6q4kb65VN6uD9XlgWFZtm8IHSI0NfBHL/3AHRuSNYpzJ3+B
	 fjEmae8Ytsd96++7EgqD2b2ccRwJdJHO0ZXVQ3xtgu+hE6nNkrN+8CADjKjDeT8tOd
	 OBhEaxDLawAtthZETP00dUW9XKrubbwoJhRoWpepO2SCAaUoLvQXADGUZ+TVw60qgp
	 YD3uoMQtyx5rvo2vchc+7yAk+ylRk2yvZBQ4bWDd+T/BKX6wiGHZ8mx2O5Nn0Yx9ck
	 Uil0DC1Kcu2nw==
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7baf61be569so920305b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 02:23:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5SNHmCjUL0M3RG82SsRIkbE6J/x3eJa1p78Wkt5wOV2QrtM/hDgd54n1m/2TnzeXTIAgYh2Ti9xJs/PpxHDPc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw65chdpn/9K4mikG5vIgxvGZUuQjHWwL5hzRuYXpOkyv393BBV
	TF+vf4Sgf4AfenTAD40vVtWviW+i06cYCcMLPutOeyUUfvCjrS4g53uGahxpHdR8GP6uReD7eLm
	BYRqgmyTESANzscd+lPA2gOEe5W4iJG4=
X-Google-Smtp-Source: AGHT+IGRu6tzZVsaq2B/AJ6p/F7Ga3K9ztaebfR7/XzLB4J/0IxzBLoDP96qpOtIr0VbIrLiDGar8eXDw4yLmfZ/NT8=
X-Received: by 2002:a05:6a20:549d:b0:34e:1009:4205 with SMTP id
 adf61e73a8af0-3898227b579mr1971666637.27.1767695015301; Tue, 06 Jan 2026
 02:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20260105135847.1585034-1-ben.horgan@arm.com> <aVvPIdREAdweYqZf@e129823.arm.com>
 <aVzAvqv8JnjrjJbF@r1chard>
In-Reply-To: <aVzAvqv8JnjrjJbF@r1chard>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 Jan 2026 11:23:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFpvcjtU-j=bQxMkH7h8yTFxGcjtJ0_cbbYPLWv_RXGMA@mail.gmail.com>
X-Gm-Features: AQt7F2qWXwk26mnOyrsQIoVCqQG-xBmoGdDbnqNwtvhq146Mfo0teG8s7g_Lh_0
Message-ID: <CAMj1kXFpvcjtU-j=bQxMkH7h8yTFxGcjtJ0_cbbYPLWv_RXGMA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/efi: Don't fail check current_in_efi() if preemptible
To: Richard Lyu <richard.lyu@suse.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Mark.Rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_022337_212197_695E924B 
X-CRM114-Status: GOOD (  22.29  )
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

On Tue, 6 Jan 2026 at 08:59, Richard Lyu <richard.lyu@suse.com> wrote:
>
> This change is good to me.
> Reviewed-by: Richard Lyu <richard.lyu@suse.com>
>
> On 2026/01/05 14:48, Yeoreum Yun wrote:
> > LGTM. feel free to add:
> > Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >
> > > As EFI runtime services can now be run without disabling preemption remove
> > > the check for non preemptible in current_in_efi(). Without this change,
> > > firmware errors that were previously recovered from by
> > > __efi_runtime_kernel_fixup_exception() will lead to a kernel oops.
> > >
> > > Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
> > > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > > ---
> > > On the partner platform I was testing on this issue caused the boot to fail.
> > > ---
> > >  arch/arm64/include/asm/efi.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
> > > index aa91165ca140..e8a9783235cb 100644
> > > --- a/arch/arm64/include/asm/efi.h
> > > +++ b/arch/arm64/include/asm/efi.h
> > > @@ -45,7 +45,7 @@ void arch_efi_call_virt_teardown(void);
> > >   * switching to the EFI runtime stack.
> > >   */
> > >  #define current_in_efi()                                           \
> > > -   (!preemptible() && efi_rt_stack_top != NULL &&                  \
> > > +   (efi_rt_stack_top != NULL &&                                    \
> > >      on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
> > >
> > >  #define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> > > --
> > > 2.43.0
> > >
> >

Acked-by: Ard Biesheuvel <ardb@kernel.org>

