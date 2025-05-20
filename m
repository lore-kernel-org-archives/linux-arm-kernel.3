Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB682C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=; b=LRcoKpob5VWrHuqKT4OULPD0Gw
	6IRwNfNX6QkUx2YXH9Ic6P3fHUi1ekj8Q9WB409gf3TK9Ivz+FpnIh/TExYXOglfZRLU44PV+aKw2
	oFB3CeYLJFL7exJai3Z6do5fXw0fQl+W6OeR3gHaPchVrqAIIVCjbORvn1ZmEcg5KIiLTJ0XMHAqu
	h1a7Ux9vTe0fs0KognmJUqL/VF1mMZWEJ5/Vix9EKeoJf4FpZVBM1inPX0Qr2RUvDJUrrXSzsBqQM
	+dN+dAsSjXgNyNhyw+DzoeEdVo7UR5pjMuNxPWz11CSmAoaq3q4PDIpJpzmjnfWU5jM44jjVX0+RY
	z0CzvoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVBL-0000000EFDV-13Lx;
	Tue, 20 May 2025 22:11:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHV9D-0000000EF5A-11lA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:09:20 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3280b1a25b1so40134281fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778957; x=1748383757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=H1Ci7GstGDNsGx8jdfniRh8K3co9z1m9n0TGHGc2d+y/f071uL5e1UozE/NKzY9Vz3
         DB9+V732QACD2tlfHam8FeFmOI1C1E75EflPmmrUzeLM1ZtBi2cbiTLQoAInO1sh3YgG
         j7Ir2inMqWu4ZaGmYBwzelIfDMaj3qF6T0FnmyKc8pyJQud6OlgnF78SAVZPunbVi3Eg
         gD7wVyKJSwZqQ/E7pLljoe7tKUYHEzhIuU7N2RKkiSzhvu9JgcJkfDEHsvui8v0N9AUi
         DaaN8xFFFmcSuQHHCOOSZwwkWEaogEKfEw6Lw3K76kdAtYvMdUEFOawOaDzQX46ggo0b
         1UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778957; x=1748383757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=fPfPVG1MUMS4Cos79DPs3frzRY7QlfsLVPMYyp877GBTlk2DV6JEkyrHHSE7hzh02R
         zi8qpO5Y0N/+PHPnS1naReGB7/FCA024Ldg+6FW/fYBJxqnsBOd7lSWKulk+vWppnjpQ
         yrjRcpCbZgfCXuDMnuyQDtmNmb6DENfmsE3A8DfoYNR0z07k0BUKc1ihM6azhOfgfPQ0
         uS3Q/g8cgHifkGzUUwUHOiKFVzX/OH0Nujzp3T3gii9i7jELtbzj7tQpWPohKWe75dfa
         913Le1Yj7gaFe+0YEaEmiCsjHiKv6g1nPNOVrxDXtv+NKNS7QOounkzkNg78fldannEr
         n0kg==
X-Forwarded-Encrypted: i=1; AJvYcCUAXI6valwDwNrkdHSCj7hMsk9WPrehVjeMu/iF3g0u8OzyaAWylbTdlVo0XDzvY5xAcpR+3HrMICpzj5M0E0BF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3oHA/8sRrEVS3s1/wheofCeWLXjoWFcjBBSMowK1lzrpq2gxb
	B7198dSLbGQsbUTjf2kLc94cZgN4db9AQQXCFp4hYOY0cLtzLI7yOUdyjnFoQTlF++jMSv9atUH
	IlTadz4g/JN5l3Ry34bI2iWg1Wbv9tF1evJAmfRDSCg==
X-Gm-Gg: ASbGnculijy+DgeKMdgHrVYHIMow2CG37tW3bBFb0DwB7/mKuIOUPVpmBOcXGY1e5bk
	aki4Lcl3tJkQyo2hFHuyGseprakflyKeA74mLetVw6sWJoHuU4fEBxyLf9zZObV5yVRFQVuADem
	9/JwFJskU6HgDsgrR1w+6Posj50B1C93UWqSzzPsE/Rxs=
X-Google-Smtp-Source: AGHT+IHDDQJhnWX2kmTO5v1Pk0nimoh123FoAZWbqbQl+FUgai9VCQfwTjo/Tn4PNUMetJyi+2gPAW5SomZT1SLUvWQ=
X-Received: by 2002:a2e:8a87:0:b0:30b:d05a:c103 with SMTP id
 38308e7fff4ca-328077a2e75mr64717311fa.29.1747778957098; Tue, 20 May 2025
 15:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:09:05 +0200
X-Gm-Features: AX0GCFuwZ5Uj2GFu8v9SUCd9XbxxK9oH9Hmv5mkp9JeCnQEfeHNWxb9r3Wl8bto
Message-ID: <CACRpkda6D_OayG2DDFG6+sQ5vyYCrTojHs2H1ZVUMw4rpbuC9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, peng.fan@nxp.com, wahrenst@gmx.net, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_150919_289489_9C404A28 
X-CRM114-Status: GOOD (  11.64  )
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

On Tue, May 20, 2025 at 5:44=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

