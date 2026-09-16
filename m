Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE52C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aon2dbJnCr/S2AeRAdi+xJK6D/wc/t0gWjIMopRk3mY=; b=x8FEx09vhhGxytyz9MkAdTIFQX
	45bc8PmtJON7VLZgWOfH+tbcn5iMZtBc/s8NJCyIAkA6LFOemsDv8V8kj+T4IGXO0xmgLDFf/4PEy
	Vyfxh9laRy2QXsvcMKMneJXYsRaT3eXf0Fu+5keFmgbgvrpGOe1/hC3wEPboWDnrEhuTjIUsix6DO
	yTq0eL0Wf8Pyp50EaoriyewN7ZY58iIAMg5Nxn1bUMD9T7J/3ipyhT5+EwOWYTBTPkK6TAsPcVlwX
	vNqfC1zBN+8BbgwUt2XVPH0B1wAHGcbXpCu1TDUXmQb3fys+tXXeWS+Ulbu93QNCs1ktfQpORichi
	4TEp2N1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6si7-00000009lm6-2f4J;
	Wed, 16 Sep 2026 16:42:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6si6-00000009llo-1B3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:42:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51FD6601FD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086841F008A1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576933;
	bh=aon2dbJnCr/S2AeRAdi+xJK6D/wc/t0gWjIMopRk3mY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LmpZX2of13S/6KVObhaOb4/ezUF9BOl2ZBn3oI+UabvrNP/MuVjZlkdwzKswKJ0YT
	 2frPNdkEs75UvwL05GEhlIm+sbYW0bZreMufLpWKG1yETNfWd7mhq/JF9x3Ez/5j2K
	 IYpigV1vdVaVCP9oAG0o2FjlWOqy+haqutQrjyDDyJMMYbCmeqXwR8QENib2V1MiFg
	 jSP3a9KwW0n5G/yqqY6Er7YYCqMbHnfepVGakNrssd1Wmcrkk69kyYW7bSTqpTGyia
	 hBdw03sEpx7SgY97mKseZouE+w3i66pVKCgef0VVnuE/WL6XLy6CxoWmOoMDZutD+R
	 OqvlKsrOun1qQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74dbc7359so1135772e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQ4FgyZbGhDHxkIVkPCsdica3JUfOfrLtG3/jwqJ7PQya62hL44wtfRodQ/58vGaUvwzg6H26qPYDlPQVSb/E7@lists.infradead.org
X-Gm-Message-State: AFuF++kWJgZmCn+WGTS2dZA7Ng5LXJ54G1yFVAWuB+zMLjhbqJF7+kZM
	k3jJBQOGgFP0pywKD27H9ETzafSy9Lcz7Qg4sop135JWSK2nQ3kPBGIbnqd0HyBgjZeUKhxJfUo
	0dkWt6MXVVv5dJxGFScxRJ5KAMzkv3xM=
X-Received: by 2002:a05:6512:3188:b0:5b6:1a7c:59c8 with SMTP id
 2adb3069b0e04-5b8b6643a5bmr963863e87.34.1789576931685; Wed, 16 Sep 2026
 09:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260905080235.33785-1-kmehltretter@gmail.com>
In-Reply-To: <20260905080235.33785-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:41:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=U6TmJm8ALpv8m78XC2wvCFqQDbto7UcSLoZ9udJ7vMA@mail.gmail.com>
X-Gm-Features: AcwNN1Xzz7Vr8iQ0kYrCMzI5XzKo9WytuY39-tP1Q1YM7-T14r0eH_M3K4Ta9tk
Message-ID: <CAD++jL=U6TmJm8ALpv8m78XC2wvCFqQDbto7UcSLoZ9udJ7vMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Drop the nonexistent CONFIG_MACH_STM32MP25
 from the STM32MP257 default
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
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

On Sat, Sep 5, 2026 at 10:02=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> Commit 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
> made CONFIG_PINCTRL_STM32MP257 default to MACH_STM32MP25, following the
> MACH_* pattern of the arm32 entries above it, but no Kconfig symbol of
> that name exists and git log -S finds no Kconfig file that ever defined
> one: the STM32MP25 family is arm64 only, where CONFIG_ARCH_STM32 covers
> it. Commit dba0aff2b89b ("pinctrl: stm32: Allow compile as module for
> stm32mp257") added "|| (ARCH_STM32 && ARM64)" next to it, so the first
> half now evaluates to n and changes no configuration.
>
> Drop the first half.
>
> Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

