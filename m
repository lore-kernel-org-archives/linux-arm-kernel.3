Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y25vXV3t1GCxqlAl1osZrotdon2GGO2WDyL2Qc56+ao=; b=uHPQL0dxHWMz3CHq2cBsBBqcFP
	dDJhgNBC6Yyq5RXi640xBifx9bN5MXa7qblHtz1yP0GilGjS8xkFczlLdl7zzDSMWHyhyN6yvawnu
	3lyPNj5rV+uwqx2GXEk44XupHanGUQX+rDARDYdW09sZ8PzplxGsCB6Qbnnoy/mLDPqcAeTGwj8qE
	Mcx9Wx4/JzfWA4wYhl2OflTLcd2zq8vXIYV7Fgkg55zIRkO5vvSAJUtgWSTdGAl7I4siK2+aZbhlk
	NSUuR+JY5tNLkVohP2Lm7k8i95r/eWNndLmbY5qQnvn4B+BBQotzM7nmqbNjOq8wzNw9oMINfJLaR
	sjdQ3PkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkwz-00000007uEx-1L2n;
	Fri, 03 Jul 2026 20:57:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkwx-00000007uEk-1loK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:57:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C66BA43B50
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 20:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7AA1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112246;
	bh=Y25vXV3t1GCxqlAl1osZrotdon2GGO2WDyL2Qc56+ao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aiQRNQq55eymVHbQFXIbokkf0/A9R+VyD0Z+MDi8MICBy9t/74ZLuWnb/dXsxG+C5
	 eDUmpx5nsmQEj4OEEfHqck8a0skRlyEVrSUKFMuLngmUujWUaPl18K853LeZ0MzCxo
	 0/+HPcavAynqDpu8D2TifjvhRoGGPrq6mWcO9WpOp72gTR2qQ2SmBRiSBwvsq93bGf
	 g4lruNT3uSvWaJEgqd50kLkg1vPHKDUuHRiVhglt6c3icWQrD0f21rmNzlvHxC2Zei
	 VayNErRxc1Mre1pbvHBRqyVjjI4hAENAbNYfLfh8XHz7G/v5O7OC/tlNWcViN7DtPQ
	 /A+zIaGrhja/w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so965866e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYl1tJ6NYkbWqeST3wYYUszKKHFYyJo2EJoOZCwh22t2cPiZeN+ZKERwdSvSLxYIc+NqeIGX1OLAKjrm1qumq8@lists.infradead.org
X-Gm-Message-State: AOJu0YzZNmCBfpyaXyoNCIVQ8WPBsp5V5pM6gFnsLwI9PfqO7bMEpqb7
	/usZPs3YueljFZUxjwa7JvyVrRjUuHu3PKKyQNKTMTpOKf866eYNw7Uno+HBNL+nXbGOyCZyQXf
	ag+OU4pOnLwZnZzrirGKg3BwjLRwHegQ=
X-Received: by 2002:a05:6512:4041:b0:5ae:bba5:aee8 with SMTP id
 2adb3069b0e04-5aed50953famr82424e87.24.1783112245519; Fri, 03 Jul 2026
 13:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-9-eb5e50b1a588@kernel.org> <20260702155113.GW2108533@google.com>
In-Reply-To: <20260702155113.GW2108533@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:57:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLnEDzkinxjv6Ce7JRCLy1A5BSHLTBp2KpQ5sOvKUygCtw@mail.gmail.com>
X-Gm-Features: AVVi8CfHunFNc0klBzqgomE1zDWiF88K1FZrzxv0woj_6dulz5xhJDaFP-6xKg4
Message-ID: <CAD++jLnEDzkinxjv6Ce7JRCLy1A5BSHLTBp2KpQ5sOvKUygCtw@mail.gmail.com>
Subject: Re: [PATCH 09/11] regulator: db8500-prcmu: Remove EPOD regulators
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org
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

On Thu, Jul 2, 2026 at 5:51=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Thu, 18 Jun 2026, Linus Walleij wrote:
>
> > Remove the obsolete DB8500 PRCMU regulator drivers.
> >
> > Drop the regulator build hooks now that EPODs are power domains.
> >
> > Keep the MFD cell around because a later patch reuses it for a
> > small compatibility regulator driver.
> >
> > Assisted-by: Codex:gpt-5-5
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > ---
> >  drivers/mfd/db8500-prcmu.c             | 239 +---------------
> >  drivers/regulator/Kconfig              |  12 -
> >  drivers/regulator/Makefile             |   2 -
> >  drivers/regulator/db8500-prcmu.c       | 501 -------------------------=
--------
> >  drivers/regulator/dbx500-prcmu.c       | 155 ----------
> >  drivers/regulator/dbx500-prcmu.h       |  55 ----
> >  include/linux/regulator/db8500-prcmu.h |  38 ---
> >  7 files changed, 1 insertion(+), 1001 deletions(-)
>
> Any deps?

Not really, was planning to split off the stuff that can go
directly to MFD and resend it with all the ACKs.

Yours,
Linus Walleij

