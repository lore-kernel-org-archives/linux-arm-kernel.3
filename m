Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09924C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wKcDZWZ9xIIi9sBYEFNIjetmSuFBzmeNKPPo41MolE=; b=umUeMsVM5v7F5xqtyaWg4roJBL
	5h/PTEUfM5NXUNK7QVQtFojMSbTHvvUr3BP0hO6DGBxX3xXy909YFMzEcivXTtRzsb+FIQvQR25ZP
	+FnLCL7yHIHTYbLvvdpjwGY6gGlTmd0+iYMhWa+I0te6BvyMfaRV0hEYuvmTcpwAzXN2G8oB82XAT
	GeKz3NjZDRN8jEU01rPwzD+e6dorlx8qJpO8WmnyzUXEK2h/nYwclu26iZkL+n/WDFmeduTRGYKLD
	GXcVa0zZiy7DAd91+o5VmKya5YVYoGybqSzjUEyLYmFf8/rtkv0v+PSPv1OQO6EyA7xnsKmondso3
	XfL9PS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpKL-0000000EUyt-1avk;
	Tue, 11 Aug 2026 16:27:45 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpKI-0000000EUxc-3AKa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:27:44 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1671ec8692so5606066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786465661; cv=none;
        d=google.com; s=arc-20260327;
        b=rcQb4Y0gogWRltINyhO3fMSIDH9C8QdMA5Panw7Pnb9wcogcAGzTRIB/EcxkNoUeGF
         Lov6kZDqbDbwgfRoXrukyk+ipUDqCIxTlXZzx1zvO6U1MLEmyYpaTiidcv0W6aJuao6P
         BS8VsrZg7Vg3ucyRmrLFM7WKxeiA3wkzTjkV10iRCN5wNREf7qlIwndDmJ2R70RzqdvV
         5cGd4uU+LNIGZ6n4fDHGxuZ/YzoRIpwA19gg3e666QPzEShfyy6e1sfQz+ylcdQ7C4qe
         zflpvvu7Wol+D6fL96KVy8Uxicez21vvGrEYXPMSkJAiRGJeBVsBNgN7hBVbJBx+YpZ4
         EgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wKcDZWZ9xIIi9sBYEFNIjetmSuFBzmeNKPPo41MolE=;
        fh=AksZKShkxvMZ0wFMZ0x15jMH8MjNd8XUZRHA+ZViVpE=;
        b=jBDOe8czAOrMW7hQkueOu+tqahvFVpd+RyyNlt0T+7DEHYjx2znl64Q0wmwvBv0CSs
         nqXOAhddWMKABApVE2lrHa9uwZqzZJFQZ3QNIMx7YWjtmkmc1UQb/EVvNj0jv4i7MTjo
         DnKHao+gK8uWbE7/mj7x6UnUwng3tmpFoG+CZ53LcnF2IjbGyG1Hb2hSkatBXDAkBUgu
         Gz+Dfkr/pqB5f93rJhb0iKwrsv0MVhPFl5zcOSBtANqmPvi5HMUodviUgC/4kX7VGAsh
         YqNZOZldKZ0ANAh/o4cihSxOlD2OhGz1rTyTurl2mAykZCozE82nKDIR6rZIB8wq6//9
         KGjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786465661; x=1787070461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wKcDZWZ9xIIi9sBYEFNIjetmSuFBzmeNKPPo41MolE=;
        b=SnYniuNdNf8JtTzy421pg1YGcm9+pgYaPXjEJ982Z4gVOMB4ZjgmqV0wYGNzkizQoW
         /0vMEdmBJCK4Ubmlg0JQ0UPiNVQFDR8dkbP2xPsDUrQy854/zV6+UNnQwVR9XIYrGocO
         8RWdmOphztxhG++cHr3atvlFK27SNFFtI9thfdhvRHvp3WfYbLlOUH1buXzFdQmtho17
         Yb3JVrGJN0Vp5HiFcBrABpMbU4kznx/UfkCiQCZllNoDqPYPODatbLJ6zZsIl+uH6mZq
         0dSqL3+52KMhlsU0NVtJiB2B6aCZomKM5kDTGKvd8Nfhk9C0wryqyDdXbpdvWCTTIKfC
         GFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465661; x=1787070461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wKcDZWZ9xIIi9sBYEFNIjetmSuFBzmeNKPPo41MolE=;
        b=L38ftjVzUPtnhiPIEDXl0gRZaIQgPQU7UPUoCk4y6QboY6QiQpmzCpE0f7zaq4EUQN
         UFrPQaeHZ8GUmhUdfOOtBbfprgiRrcBRGr9LkbC0JI0eFoDb8oE00bRWHGejCRC7oMLX
         mC8LDngrviYEkr5XEaJq4/Sc+tfMNS8zWS1JEq0KXdJmU9fOsc2QQyYgdI4nqxWoa+Ra
         1NvctxY9MmwZL6Z9bxY3EfMNSJzgKb/G54bJHbmuVUl2gTR9VvTV01dJe4D5K8EIQfg5
         D41GkpPSaD61b7IaS0RknfhBa3FXxA9qZ7kVbKZLNM2IFjsRzv7MgohtMC439PUJ5CU/
         7GEA==
X-Forwarded-Encrypted: i=1; AHgh+RqDuUI5qnOel4x4ctqnBlLPfXfjh3OR1Bg4SKSGnMwfAUECLd+fsZCfKjlAgrIY7p+BJgyeErxK6gjgjhgZMM05@lists.infradead.org
X-Gm-Message-State: AOJu0YxbnGkZcsDFkyO0VpUPbj6w+eyy/Sz6lXlLsxtcj/GO+F81GccU
	v+Agjw+RSwdlDl4bcWiogTCGh+Luc0DtUVOOkQwPDmj9OfE2ugMIQyVESkSICP4l3Fcgdg2V0Mz
	2uAaVYKFYCzgLLdJSs83IwfV7ZMIcmuuA6on/gAMb
X-Gm-Gg: AR+sD13mX6EsXB2Xb9RyGtBq1PTY+lseJJVAcnjaHhZVpM4fKmA3TBpBRiL4vILLShS
	dl5h1VUMWDMw4F4vXbmcAAbSVPVqswk8L5aCs7ok2ISeu1lStZahg4Iq46Wj5mzcFcZe1Th1JAy
	MTA31qBS7SfATMeDOLGfP0MeHou61Egg4ZtvAIx4av4z9dmVknSdkjkVFFFm/9+QRyN3eAwsOfy
	LHCUDi2p00+KLr1k4JfSl+eqeW6aYnJV81rUqdoe6f4Qz6iwo/jlAAsURGsjwPLKq7IcF2BBkHi
	MpB7Pac5LAHsiLSQY2yDyH0XSK4JcYcTt3zapPeq1Jy3wwZ3HhwZqx360Msn8C7rubnc9m1E3Qe
	Ae3JCCZxG1nlvWtvm9xc5RATphqN2cDtqGKG/TwEFh2Y2KJ8fPYTyfT77uWbsSwmiJ9c=
X-Received: by 2002:a17:907:d15:b0:c1f:e9d3:a3f0 with SMTP id
 a640c23a62f3a-c20e60df3a8mr254587866b.7.1786465660246; Tue, 11 Aug 2026
 09:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck> <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com> <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck> <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com> <answWdRpVQLtIzIj@willie-the-truck>
In-Reply-To: <answWdRpVQLtIzIj@willie-the-truck>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Aug 2026 09:27:28 -0700
X-Gm-Features: AUfX_mx63tcWy1Jtv82HuXBCB2XJ2aiGhpU71NomFwpZ9zzDnDI_X6osGygKWm8
Message-ID: <CAKwvOdkrxJ_9qjaBNQS+o=+_m_f3e9k6jMEmXB-S3+nXGoLV7w@mail.gmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_092742_824112_AD52A050 
X-CRM114-Status: GOOD (  30.48  )
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

On Tue, Aug 11, 2026 at 7:23=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 11, 2026 at 03:18:17PM +0200, Ard Biesheuvel wrote:
> >
> > On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> > > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> > >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:
> > >
> > >>> Sure, but let's replace this with a link to a bug report in llvm's
> > >>> issue tracker?
> > >>
> > >> Yes, please! I can apply the patch once we have the bug number.
> > >>
> > >
> > > I can look into that.
> >
> > https://github.com/llvm/llvm-project/issues/215547
>
> Thanks, Ard. I've ended up with the patch below.

What's the extent that HAVE_LIVEPATCH will be used?

Does this penalize kernels built with BTI in favor of HAVE_LIVEPATCH?

For example, with my Android hat on, if we have a kernel that's built
with ARM64_BTI_KERNEL=3Dy, and _dont_ use HAVE_LIVEPATCH, we're going to
turn off BTI for a feature we're not using?  But maybe we _do_ intend
to use HAVE_LIVEPATCH, and my assumption was wrong?

>
> Will
>
> --->8
>
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> Date:   Tue Aug 11 14:11:44 2026 +0000
>
>     arm64: bti: Disable in-kernel BTI with recent versions of Clang
>
>     The following BTI exception was seen when loading a livepatch module:
>
>       Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
>       pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=3Djc)
>       pc : kill_orphaned_pgrp+0x0/0x150
>       lr : do_exit+0x498/0xaf0 [livepatch_combined]
>
>     The problem is that the patch module's do_exit() is branching to a
>     static function in vmlinux using a module PLT veneer (indirect branch=
),
>     but the target function doesn't have a BTI landing pad.
>
>     Clang 21+ omits the landing pad for static functions which can only b=
e
>     reached by a direct branch.  That's normally fine for ordinary module=
s
>     which only branch to global exported functions, but Mark Brown points
>     out [1] that this isn't guaranteed if the module branches between
>     sections. Futhermore, livepatch modules use klp relocations to refere=
nce
>     arbitrary kernel symbols, so with CONFIG_RANDOMIZE_MODULE_REGION_FULL
>     the module is far enough from the kernel that every R_AARCH64_CALL26
>     needs a PLT.
>
>     Put Clang 21+ in the naughty corner alongside GCC, which suffers from
>     the same issue, by disabling CONFIG_ARM64_BTI_KERNEL until we have a
>     version of the toolchain with the problem resolved.
>
>     Cc: Ard Biesheuvel <ardb@kernel.org>
>     Link: https://lore.kernel.org/r/da06bbd3-d04b-4d0f-b331-f5b91bc373a5@=
sirena.org.uk [1]
>     Fixes: fd1e0fd71f65 ("arm64: Implement HAVE_LIVEPATCH")
>     Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>     [will: Stitched together commit message, diff and bug number]
>     Signed-off-by: Will Deacon <will@kernel.org>
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..fc57d90d92c1 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2116,6 +2116,8 @@ config ARM64_BTI_KERNEL
>         depends on !CC_IS_GCC || GCC_VERSION >=3D 100100
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106671
>         depends on !CC_IS_GCC
> +       # https://github.com/llvm/llvm-project/issues/215547
> +       depends on !CC_IS_CLANG || CLANG_VERSION < 210000
>         depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
>         help
>           Build the kernel with Branch Target Identification annotations
>


--=20
Thanks,
~Nick Desaulniers

