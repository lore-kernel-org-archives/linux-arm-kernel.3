Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDDFCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siT4dHhFRtLHmzf8No1g5rI39nMLHFOVTlqBlC6FJXs=; b=AXYTlZh739+cMN4SfIRweMovWb
	AegMdl0TlNIR1ufB2BX2KaohWS/p38kV9loE65sHEDEd/lfWVJp7sv2QDD6lMLhqJBebOEtlF89s4
	oDqP0YWsHoBm5gxqOV9IsM/vmEEIv//oJblpP81tTlAxkwzPUC/AGGC25Asmuo1m1EUiOiN1Keq5G
	jh2IW57ixilAsokMsRDN4Jxmb+/dUGzjqPZWeoDFDVS8HxLToUoLwoaIME9Ffk1ffb/8CERuFuUnq
	SY1JmVKYIoFy59NfjpVbnl+y+wIAhljOHSJlySSGS20Cv/3huB2cPLs1Vc6+xt/ojINDxUidd9Czs
	l0aJFUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8af-0000000GRA3-1Ihm;
	Tue, 21 Oct 2025 09:23:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8ae-0000000GR9h-23RE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E4B96232C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD37C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761038601;
	bh=siT4dHhFRtLHmzf8No1g5rI39nMLHFOVTlqBlC6FJXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M5L/s+Ep11ydt2PRNb3z4WGQu0duCzFC6bkMI6VSuNmnKbW3bf+PG/xkiW33RaEee
	 UeFQZHX5oyBtiTNYr2FLdf642kT96XPDDCwU1RA6ujE0ugU3u1Q0eNy04/ug8U/oeG
	 ANNW6H0qgiyjhP9ScDzI+uejpOaN/WFWEkrj9T/UxAZQfcmequSNhtbT8vifY90146
	 CGx1x6hzjna19WhLC9MApMd5PHlf9yf4YGqdstakWavkOsPuhqK7aP/6757wRLN9Og
	 myqEYLK82dIcqEa7vDwdzKLBK/lrIoVkhVR5uOZbPMufTfCwxilzMZRnmUbt7y7hiW
	 oBitQhsed3y4g==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36a6a397477so55500881fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU43y8akX9igp4kjI4NQBg3myfmCeMgjGBb7Ta6XLHFapUeFzUc6B16PjVG9vwETVG4Np0DgNVfqwPO5g4EhrdP@lists.infradead.org
X-Gm-Message-State: AOJu0YyJczxpmNQBPsm7TncXGralsk//RSoZRKHvQrpvlymzSZo03Mwp
	FZx5T3W+G3Av4i4Jak86k/tP1obTk306D8rofOdkQ1+Pk+HPOPRSwRwPvBjIpLZ68y5cgAOnUTO
	I0G8EsHgxyU9ZiS5zmM/cyX+THN9n+D8=
X-Google-Smtp-Source: AGHT+IHehuvAcUwnsIKlc9SJ9pUrJQPiH4zAJPIHBzDcdeKYlo32G+eo1Enryh1Wkpbz7ueaSkFJqyOvAILxG0Azntw=
X-Received: by 2002:a2e:9fc9:0:b0:336:72be:3339 with SMTP id
 38308e7fff4ca-377979feb62mr54976441fa.28.1761038599616; Tue, 21 Oct 2025
 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com> <20251017170718.GE1566@sol>
In-Reply-To: <20251017170718.GE1566@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Oct 2025 11:23:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEBworuqfQiGpekTdDsa1R5y3jCmS_U91vGCHyhY9QLxg@mail.gmail.com>
X-Gm-Features: AS18NWDbKfRq249JXG9Iltw5RC8ZRy2b5DJyiPJTBssBM0JuWkoLHIllDHXeA3U
Message-ID: <CAMj1kXEBworuqfQiGpekTdDsa1R5y3jCmS_U91vGCHyhY9QLxg@mail.gmail.com>
Subject: Re: [PATCH v3 00/21] arm64: Move kernel mode FPSIMD buffer to the stack
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 17 Oct 2025 at 19:08, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Oct 08, 2025 at 05:45:34PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> > context switch out of struct thread_struct, and onto the stack, so that
> > the memory cost is not imposed needlessly on all tasks in the system.
>
> This patchset needs the following fixup to build:
>

Indeed - thanks for the head's up, although the robots already
informed me as well.

