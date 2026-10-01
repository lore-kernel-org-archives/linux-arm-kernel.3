Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC64ECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEN0e2H7/40ktw6SZv37khLK/vSI6EBRPCqKAg34jhs=; b=Ki4s4pEzzjWLEUXMAK/K6yQWVi
	TW2EBQDPlSIdngCH+OLz+WiITZABqfOD6bc1ka+YJ91EemnF3+Oza1l4KJZWY8Tgm2DoyWazbrFlL
	L5mJBNL4q/oGdUie0Ylq8C3KaC0xkDZmonQz19cgGxblcNSFuWes67shqcP0I1ARYcx9La0eow2tJ
	29EPgh2iTn2Fh7/SSZdHuo2iXjfLAYpXkSTR3X3fUKpz0qlUxsxCBD7BB1txeUaDLbL8EJDDZXpze
	xCDBIdM+8d2GPoT/0gNBj90DzGqFzW1JWUvG8poetDasQ9mpStcqR64LW5xcHwJi4fJRe/xlMi4M2
	bdxsgzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCApu-00000007wiG-3Aze;
	Thu, 01 Oct 2026 07:04:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCApu-00000007wi2-0mat
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:04:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DACC443BDD
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B047C1F0089F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838249;
	bh=wEN0e2H7/40ktw6SZv37khLK/vSI6EBRPCqKAg34jhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rag2NIgaLGE5+zLXWRj+vMIiBBSCcqDN/WT8xmBZ9nHFiVEs2z/YtTzC5yHrY0tG1
	 kNoVSCdt3xMdbcLIM3FYTafcIdDEixFTew1wrZgus+9IkwmEgFk5jey7/R8nW6G4y1
	 NyvcQe0/5Wkmn+m/57rSuvmFQ9F2ouJO1Z9L5nH66BHM+uS0MDtzLCizg0VTyeRcUl
	 UyPtU9ZqSXRQzl9yaoOBAn3EU8htUUsEKKD0gtfB5Zg4zin84yQto7shhfcqEx50ZH
	 Zz3TxgUxZM/Zpn5Sy8Hh/qCR0fuURqeLKbQ7zIphL3aS3cTuAreeImFLlOE4fFOVVC
	 XlFnieB76IgqA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb6ddbb75dso109640e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5Xf4GQ3leXIe87JSb92fWJ4ikYfxIgCyTX9K8Q65cCgMzRNcJoYUS225Ih6THbpe7YSG12UF8kgoTAaKBQM6/@lists.infradead.org
X-Gm-Message-State: AFq9FYLhxp/9fbVsMnOJebGxaXJ4CMuJavdubrfB9sphRAX8Obqd2NSO
	F02cH0/NHTV9/SGMIuH9TcsiRARIMGBq2iNcNxnxV2ZZgeklCgcMNNR8K8cpIA3GcGk+GUVFsRA
	QSUj2ukwkeSimoxUv7DgmziDVAr+roEQ=
X-Received: by 2002:a05:6512:715:b0:5b8:edeb:5c27 with SMTP id
 2adb3069b0e04-5ba405ea48emr1230973e87.10.1790838248433; Thu, 01 Oct 2026
 00:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:03:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
X-Gm-Features: AclHuK8S_q-U5PRteYICZ8VGfGhkOd-OtdrQpaJ2DynuPN4AlXp-gJ1LMPWAi-g
Message-ID: <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the CV75 pin controller binding using generic function and
> groups properties for pinmux configuration.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

This patch 4/18 applied to the pinctrl tree.

Yours,
Linus Walleij

