Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37618C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCFp8azqbtjMnvLCWbCJTpVJiM5s5tHj5DD4OdLTAbw=; b=HObnRbfwKsG5etmDLjw9nlLm7b
	y07e9tMrikWnn0bmOxyNE2atsKDwCdDz44PzGW6AEZj+Y7TYPa+XGsk53NDRZIGxG54DeBlaVPOGl
	XT9QN4Ai7iONegtBlg4+lh8PeSbp5T657JiBSh3B9iPEdYxxhSpW6AeNV/zF7w68ctwsmRJ4JLUeY
	pxK5E1aZow1Ov/+135Q+4N7xRBBF3ZNVD2LRXehl8pAZuKjsMAFclaLivXMWPwqQHqNsbWPvnj86J
	WPkOn17oPONDF+sZv2UcVsX9cnv3dQI7cLACLlbfOnfoj1GaC5hRUsmhdLz/ia/N+JV1Xzemltozg
	U4Cvn5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JU-00000008iZc-2jIu;
	Tue, 21 Jul 2026 07:54:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JT-00000008iYA-2raf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1368F4505A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB13B1F01558
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620491;
	bh=dCFp8azqbtjMnvLCWbCJTpVJiM5s5tHj5DD4OdLTAbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MzDvOdbyzTCAvdoapu1Tim55VE4TPHvrsM716xnZiCJqz1gRE/ytbZAHFZTSScv/c
	 0PBqGmUU+Q0+8wWYJ3ggt7bIxBahPf1Z92LImAqaPHxaLg4RsBlKuZXf15WdZZcmn/
	 bMgi09VrHwwqMcskbiqckVfAwDTHtCQTsHH7xWqYeOeF5Bq0Yj5Qeps+gCszEWiV78
	 nbU6UUNqoHA193nqFxdJYEXUKNrhTPcQMU4HPb6m4FKBvZoA4SMIQTL80XfbSZykwH
	 zaABhGQjS98KMnWwRgi+VnslfcrZzi5etB+TaAKRcuw/bYx/yhvEQRjj2EMApQRBjK
	 yWwC1qyhCcL1g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so1358222e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr5QjV1afMJ9ym590KtDoTq23+AU0smFmW5gKo3GYnMjOlnyc2h7rUbjKy18TEBR0w+63OnFASc1Cuh9vnYxLcd@lists.infradead.org
X-Gm-Message-State: AOJu0YwtdGWmeMkR+jceso8RC2RBfIiZLMsz8cEiSa+6QB22F1QUn5Hg
	Dh8wkoAadHa7b8vzjX1ZRQLRIglKvhizzq1OeEsiMlL8Kvxe/hH3MYcFHSNEczChZsLMHgq2S58
	Gq++5AlBX+DSZ8ZVw586bT1OEnP5VXEU=
X-Received: by 2002:ac2:5b4a:0:b0:5b0:177f:beab with SMTP id
 2adb3069b0e04-5b28f9b8ab1mr2888376e87.44.1784620489665; Tue, 21 Jul 2026
 00:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260715175223.make.153-kees@kernel.org>
In-Reply-To: <20260715175223.make.153-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:54:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
X-Gm-Features: AUfX_mzMwCV8Z7xeaNpPDzFxYqTYvhmmKEur1wOLmu4Wv6aUpsrNZUfEjvv8O44
Message-ID: <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
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

On Wed, Jul 15, 2026 at 7:52=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> ARM32 GCC KCFI[1] violations currently show as generic "Oops - undefined
> instruction" errors, making debugging CFI failures difficult. Add a prope=
r
> KCFI trap handler similar to the aarch64 implementation to provide clear
> CFI error messages, including the call target and the expected type.

Reviewed-by: Linus Walleij <linusw@kernel.org>

> Clang and GCC trap CFI failures differently on ARM32. Clang lowers
> its checks to a BKPT, handled via the breakpoint/prefetch-abort path
> in hw_breakpoint.c, which cannot recover the target or expected type
> and so must report via report_cfi_failure_noaddr(). GCC instead lowers
> KCFI checks to a UDF (undefined instruction) whose immediate encodes
> the registers involved, so the handler can decode it and call the full
> report_cfi_failure() with the target and expected type.

Aha, that explains a few things.

The UDF is a better approach for ARM I think (Russell will know best).

As noted from earlier conversation the breakpoint usecase overloading
on ARM is a mess, and we would certainly like to avoid it if possible,
albeit I have a patch in Russell's patch tracker to paper it over.

Do you think that long term we could switch Clang to do what
GCC does?

Yours,
Linus Walleij

