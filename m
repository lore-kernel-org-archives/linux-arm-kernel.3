Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8631049516
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLpTE+Y/R0Tdv9vswPnMcKu+W093lttl1jCB5Rb2dPo=; b=g2jZjKGWTwX3nghpJIgSwQxZ3F
	VFAr8plyfEoIQ36jEhXZSnhL7wopur9qCkx+Qdqz5G2u+BgzYt1yXtCiTZQ+z9Kk8Z5QT8/XHzYY9
	zkNL8jwjclHuNRp4jcdDs3gluWEFRaOoo2NbVeyMaog3HqL+aHSZk9IWCrRok6aNE2j/CTQe0/O5b
	fRliC/cixu8honHjgIeP6yz1bxowPX3d3S40eNaUl08JBzFQDFhc4rIR7pGTSd5ambtQ7P/Yo59zB
	gRhcnIeqfxh/lthjdhGQLB+HGqsCXTd68CEOoEgF3OklAqogWwMSfOi6MB8buqjR3zd3XRYZ83bQb
	YZDxkmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FsQ-0000000BHuZ-248q;
	Wed, 11 Mar 2026 09:29:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FsO-0000000BHuG-11ar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B9AA444FA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EF5C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773221351;
	bh=ZLpTE+Y/R0Tdv9vswPnMcKu+W093lttl1jCB5Rb2dPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F0UoSS6HeTeib+b99NgLUia+OyIhq3d974Aaz/MUtDwtuUEhhCks7o29mfOMjAVKX
	 g4uzGajiuIujzHTAQG2mA2a756hkcje6PBx9L7ejmnbdBtG24PCHfWqqllyFhml1ef
	 r7UmSxCrN/ZzCnAyj7mOocSqVm4PRXRyR9zHiUaHi1iTuO2rD3QxaNEs6dH5wMcLSx
	 j5fJu2sglWpDCXdVDVnd/6YktG/5jvPa4Iu+duoFPHRIcI9VQ18cdOSO/fFER+sa11
	 awiguuyqGhaomMJgXyyy/vixRpx+Z9ONK1cEEOXXE5oNJKJ/3T9+FwBV/RmSJjo2Jg
	 ex8YQGMIDgbgQ==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64937edbc9eso12733967d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:29:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQ0i4FJaJqi1Gy49ZB+TKCyD2FgAduv/jPAonzTy2jZ8wFzGeTPO9US7nTwiyBIELhkwesLNND7KaeLnoDM16a@lists.infradead.org
X-Gm-Message-State: AOJu0YyuklOg7VU5L0SC3ocKxKXYIfkpwpT/cWiM0IGCodU8FQ2SLf5S
	/w4qqNS6MFMTW1XpHINgJLtmPrwUCC2e3qzgpQ9NmJZnzDy1CzzPLaeavONYqJUoLFYQ0ee8kB0
	1FboYvGX6ou7mYM0qG3t9MJrRPGZ92qA=
X-Received: by 2002:a53:c751:0:b0:64a:d479:bfbd with SMTP id
 956f58d0204a3-64d6568df17mr1064855d50.7.1773221350597; Wed, 11 Mar 2026
 02:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com> <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
In-Reply-To: <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:28:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
X-Gm-Features: AaiRm52uciv83L8ui1qjVsq1iiproIcpV5iHuMJHrm82sToGHhfR4T4DzXQs8RY
Message-ID: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, cristian.marussi@arm.com, 
	jens.wiklander@linaro.org, etienne.carriere@foss.st.com, 
	Sudeep Holla <sudeep.holla@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Antonio Borneo <antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022912_323022_12A8221E 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 10, 2026 at 10:07=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:

> Patch 1 to 11 applied on stm32-next. Linus, let me know if I take the
> pinctrl one or you prefer to take it.

AFAIU you *have* to take it because there are compile-time dependencies?

I provided my Reviewed-by so go ahead and apply it!

Yours,
Linus Walleij

