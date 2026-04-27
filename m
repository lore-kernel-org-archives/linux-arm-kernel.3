Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601A4FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIpoYo8mg2F8TqqpFA/ShdThKE3hDl3W8aeDKomZNEM=; b=e+M3cy1vWdv8Y4uVzHY8DRnyFJ
	T6tLB/7Iszx7fyXZaa8dqdHJBV+KqC699+4SWB8Yw8VvtMSj5WlIEHVmxu8UBmeHwCMImpWhfDpxL
	iorpHMGqZfpdzd0Uf67KJLUL5dxFaKWLePAtAdYyOhlbGORgSyYT5r2eGJMEOa0yRbMgRLiNcOGAx
	X8IfR4hutEuC7bkirRpzbaXF58Xu/A/Qg8P+UwSaB4WQKMx+gxgwBAVzzjidYc9ogbqbCfeixfZzz
	dNkOkKjBASOMTQ6COam25xAC5MHNUfxyDu/oqBmGpTYQGlmhfBmuF1hBWfzzQy6bDXS/5Zt2qNL8d
	+aTjLoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSPp-0000000077q-0cOq;
	Mon, 27 Apr 2026 20:18:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSPn-0000000077C-1FP7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9310160139
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429DCC19425
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321126;
	bh=2m3w2eF3ySbCRlzKKfWno16CUj5QKOxf9WIS6YvqOy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oqUnmZVbutl6/yxt4+cqgVCczSJIkB6dH3yocAbV7lESi32RXPrsTItrwzCKOPd72
	 fODgAQ2MNlBIEL02i7IDfifh/70W4gi2Frh0dYSuM0l/Q9eX5q18Yz34gvLsUTbJm0
	 bbBgft3QlAAk2KNmM5roTtXH2E54BW+N2o1QLTyZCsDu5MHxUqYCbBvXMvd3aMLRJR
	 Zj1rMiJKGkLUdYuriT8QUZblm08tyhtlwKK5ijvF8y7YeST+clqIh9D7et9mbssvDy
	 cTuBuiGw7GVbQX1GFUtGV7ND7JdXE5ldQHQ6E+gUuwBAlupevbdGwSRNoIdMLRVa2C
	 j/plYrbnR/ABA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so10581401e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1w1Y2sW0AIE6MGfLPnWUu4Sk54Y3q5VbzvNB63vJUj1uWb9O0k5XznaUN+UiFDGNg9TkjNY05U3RCw7fG8oba@lists.infradead.org
X-Gm-Message-State: AOJu0YzSdsZuL83nu1xlZ0lFa1BJKnHgyVGg/4yOMubl39aWfcTqCivI
	h+i5VgzQm4ZIHPgsIBa39xmgB0c3HBj/e2AsbkbIHTtnjhBKaBBHCmyrpI6ND29dkNMty/7wAjJ
	rWGcwlTw7VCkjarjBZVTjG09DGIUQL2o=
X-Received: by 2002:a05:6512:3f18:b0:5a3:fe5e:3d49 with SMTP id
 2adb3069b0e04-5a746626a7dmr91838e87.23.1777321124983; Mon, 27 Apr 2026
 13:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:18:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
X-Gm-Features: AVHnY4JDVHbJjkTqLXSL4th_cNweCpaDB9wF_OCiODgBCzqsZyGQqWQgB4pLxPc
Message-ID: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
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

On Sat, Apr 25, 2026 at 5:55=E2=80=AFPM Krzysztof Kozlowski
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
> 1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
>    not selected before but should be, because these platforms need them
>    for proper boot.
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
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Way better like this.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

