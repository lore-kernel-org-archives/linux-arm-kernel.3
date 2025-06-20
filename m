Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB05C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 02:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjZyfr93RvqtkNq8JxVPIB+pxnsD1+6Omg7FJZT+ONk=; b=xNTGLvT+unxQSoP1I+l1c9y4ju
	v2+zcNvdGz3jwj/WfIeEk42udaqEXZLzfZfi74BdZugOJ4qZlCwihJ0bVx6Fs7sohv4wggnzGMBDU
	UZFgiq/CE7ZUxz6Qp+0Zm0+Xzklm+K1xksWMRbELbkO92XHQioUzWDCF2pL4tbmWunNb0HL8c3YOx
	shHe+LtNdLUezP7QS/r0ip834lOIIQzBYKybApr2lJLKOlML8Q68w29mQd1AeXkb+oYKaqUxcHwIY
	FQ4eMTviPW7fJ0UVKGIRxQQztyqB2K2a+Oo5VLBSIUG5eR0mPwIW3su3uP/np5WM6qgUJfWOYluHz
	OwqHSFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRai-0000000Eafx-0Z75;
	Fri, 20 Jun 2025 02:34:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRYT-0000000Eaa0-2PeO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 02:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F398A4908C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 02:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDE2C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 02:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750386756;
	bh=nFwAjdcCBmuCFAWX9WMeLyT+AO0LFKWNtBekZcA+g8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GlycR+VuvjLYWJ4I6djxLbVZVOzZ5BvQsJCFfnrDbSddUWNzItrgfXapLUgX4uSWk
	 u0LbGElgQ5mUj+S+oybZpaaU6nCBGtooAQO5Euuew+Z2G7JPc99cS35PgpOdhqevei
	 ujJ9DZLdZmYdn+oERg4qAcTCDGL4g1rboV49D3TZrmUK3A50DcPOlbQDLGfxWHIA4u
	 mfDAcaU78A8qEda9EraXNakPpYIL8nGwxuwzLJO1z/tgWRSEU4JQ9E4VrgCzUozPpp
	 9eTJ+/zNWXOSa/JwypVoFSHApRF+ByMIwTa24xDDx+Xm58XmZm8Yvsc05tg2v6FcnH
	 MfeCEt2hsXXvg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551efd86048so1368779e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 19:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVcrVnfi/j2l5kVg/S9vqoTI17sG3rjjyRlCYkCiy2Q29l6vI3F17no0a1AoMImmqaUgdtG8fqUh2W/zYzENvj@lists.infradead.org
X-Gm-Message-State: AOJu0YyL3wJoF6+4/TsnSWSdrgxbRuE61qEcJKWXAnm/G826gUya6QF6
	DAOOrLz2PT98/WFV4cr69/7w8z55A45mgVcd662tccxAb33Xv7chAcceLlh6mo0Qk20IjDzgBXJ
	s/wZWS05lFooTfPoPJuz+9oieSYdeSjM=
X-Google-Smtp-Source: AGHT+IF7KhN1uteG5Uxd3myLT7qqu+b6R67w8bIpo5CxMzP2p2xxNhvi+eJk2suEmLF/ecrta0Tla3VG3jH7pCkyRH4=
X-Received: by 2002:a05:6512:31d5:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-553e3bd0367mr416872e87.22.1750386754813; Thu, 19 Jun 2025
 19:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-arm-expand-include-unified-h-path-v1-1-aef6eb4c44ca@kernel.org>
In-Reply-To: <20250618-arm-expand-include-unified-h-path-v1-1-aef6eb4c44ca@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Jun 2025 11:31:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREwF0Yn6R80+1WnrJpHe4vXcjMdqUqqEU=cL1++Yk9SA@mail.gmail.com>
X-Gm-Features: AX0GCFto2VXAU61sRbn1UlLUs-rN5P4yoY-wp1BS5Fvn7pkoy54ZTWiHwmO_VTc
Message-ID: <CAK7LNAREwF0Yn6R80+1WnrJpHe4vXcjMdqUqqEU=cL1++Yk9SA@mail.gmail.com>
Subject: Re: [PATCH] ARM: Use an absolute path to unified.h in KBUILD_AFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, KernelCI bot <bot@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_193237_741982_80986E71 
X-CRM114-Status: GOOD (  17.16  )
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

On Thu, Jun 19, 2025 at 4:29=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper
> flags and language target"), which updated as-instr to use the
> 'assembler-with-cpp' language option, the Kbuild version of as-instr
> always fails internally for arch/arm with
>
>   <command-line>: fatal error: asm/unified.h: No such file or directory
>   compilation terminated.
>
> because '-include' flags are now taken into account by the compiler
> driver and as-instr does not have '$(LINUXINCLUDE)', so unified.h is not
> found.
>
> This went unnoticed at the time of the Kbuild change because the last
> use of as-instr in Kbuild that arch/arm could reach was removed in 5.7
> by commit 541ad0150ca4 ("arm: Remove 32bit KVM host support") but a
> stable backport of the Kbuild change to before that point exposed this
> potential issue if one were to be reintroduced.
>
> Follow the general pattern of '-include' paths throughout the tree and
> make unified.h absolute using '$(srctree)' to ensure KBUILD_AFLAGS can
> be used independently.
>
> Cc: stable@vger.kernel.org
> Fixes: d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper flags =
and language target")
> Reported-by: KernelCI bot <bot@kernelci.org>
> Closes: https://lore.kernel.org/CACo-S-1qbCX4WAVFA63dWfHtrRHZBTyyr2js8Lx=
=3DAz03XHTTHg@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>





--=20
Best Regards
Masahiro Yamada

