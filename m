Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE6CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NFx3sGFGJhNBv7Npo6RWGiGByRYKa+YBHkbsiKAW7I=; b=oKdYgvwy4rF4EE6PzF3GFKpOAc
	lZeEfKJ5az0NftRka/07VI8fslt1wzb/2ltPNmR0geuxMPMxTkRISaHrWHFJraoYy1Sg1uqWXGcJA
	+uHzTbbwbeKFaSuewbERV3NJnpmSYz3bLlMI/6ljsLHlPUOwLD0Rwz5U++AvLmEOdvFv7pv23Frlx
	llNjJcLIRkyl/uui2ZXfH0uCSoxSGPIqulb9iEB3hfKVAxmAj3Zxmad/NZ/iuBs7sH1lrEVP5Dipb
	JWDSXRVAjh5tl8Xu4OWwdfEwy5mEG4OkdYmHSGnXl9goQeRP1HKTkbdW8W9VOVOsRWTcwQPTpFQ+K
	AB9Q7QQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCF5-0000000FgYW-3DY5;
	Tue, 05 May 2026 09:39:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCF3-0000000FgY8-1eox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90301400E5
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7227DC2BCF4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973940;
	bh=Z7pBTNXW5udugu29L3PKbm5GuTxdmBMTA6+euj+Fv08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eWo0v2t0y+N9u6yxGvGUS6uZxPHVFo9v0wAiabELbSb+h1VIKHFR8Y0rOJM15clsu
	 JeVWug4wSVMkmIdYwNJbcR4My5n6kgzNbfAGAxPDdGP6qR/aBQDoVxYoq+yRNKF5Tc
	 YPuZraCPbN3E8SMiMGTuym1uSh/aE3IgulQMwo3mun4KAlgPFcQLp+qpM62irgsCl9
	 PAMBSIB06EHga/7Kk/ZBSkvy/CuxOc45mhFTZEACykvKg4oqDSiyM7iGcSg/aWyZf3
	 7rgmRvUCIiYpTO7baNr6v3yeA7gWVZWorIRcU+zC+H1nzzzGjrCtxLadsnBstvbLgx
	 RSk2YqdGTZOGQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5507805e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+lPXIsq4zoPMZcazdPzEf0wXrfJYMOFnAVLnUnwFiDOBjB9FrQNa7PkgTffOmdHdMdjurEb2o61z3BjTpJ7k3I@lists.infradead.org
X-Gm-Message-State: AOJu0YxSiN4EHdmEBtHYspC82bnCxvmkuTsP21t6VOg3OL9qLQfJgcC7
	lEVvCqmoz3VjDZyXxg1pcOANy+O6EzNWJpNAkzZS3sQgndPF2x47bRTfBuP0As5DCi3ht1yMfd1
	C+kefp5VRV7ZmexQZhmVpuWz2sddPv18=
X-Received: by 2002:a05:6512:1150:b0:5a4:1798:31ba with SMTP id
 2adb3069b0e04-5a8631bdb0amr4506124e87.21.1777973939184; Tue, 05 May 2026
 02:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:38:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnZEnF6HbWRsJZyN4Jodfna31n=RrfZ_1nKUz0mq=_4g@mail.gmail.com>
X-Gm-Features: AVHnY4Jzejsx6nrPML2iTQxMvnqJ1x-tq49MkT39GYfcLcZfEV2KLJUsaPiKL7U
Message-ID: <CAD++jLnnZEnF6HbWRsJZyN4Jodfna31n=RrfZ_1nKUz0mq=_4g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_023901_508740_611C4BF7 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Apr 28, 2026 at 6:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
>
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
>
> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>    PINCTRL_HAWI, which were not selected before but should be, because
>    these platforms need them for proper boot.
>
> 2. arm qcom_defconfig: no changes.
>
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
>
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied for v7.2!

Yours,
Linus Walleij

