Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34443C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9NTVrwlm0T6q5xmXlu/Zj9XfefDzx/FrPXJ+Bp5H3w=; b=cMmgaazUbS1q4DxBX/sS0vEIwI
	HaVmnSC4R6KI2fjWHmH4vjI7h7qz1QwQSg7t9KqC6FODZBZhTETTtsMd4qEkqsCSr2ilffD3IeDZb
	LpHCF/nXfxXI19aqfXBANNI+ofcLzkxf9Y3+FOuE2+jCWy7h6aEa80rHW5rW+MrrjQ47YWjg9PVmT
	D7E3I+vgnJcGzetYdXer0v/FzGHwN+nhdulh5XdrGMdG6kkpRZsETrodSA1lgG7LQxcNywAaCBssN
	5DJpAUBX9N5uSaeV/TgULuwGFRuawLi1H/Ji6Qss5lTNJwbp98bObOtHw9q68f42XgIE36DKEV914
	2GSW1SOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2caf-00000003QOL-02Mr;
	Fri, 04 Sep 2026 22:40:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cae-00000003QOF-0jBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:40:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6EC143FEE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD30C1F01563
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561655;
	bh=T9NTVrwlm0T6q5xmXlu/Zj9XfefDzx/FrPXJ+Bp5H3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jJ61hFWdmGdAZt3iISMIPITZqY4gxZC3mfJ6sEZet37Mo9rzg9diBibR0s2PjNTCW
	 0MnxYR2cjA3wpMkcSUSNRIfBtWqT22oCAJczafxHUfqpDsfK3EFw6zV9kEIGlXqG0l
	 G4F5F25SFoaKA4tiwurpisUO6Un2GRUjjE12QhB6IYLkYPnr8Smgli9czcH3gwYtzv
	 +5ZgUob8KFI8Qq68HIhw8Atmh5VtcAjc/eRJQoIXoiRxoUcDV0GA/JW1oe1+Ye0I+0
	 fc5muqsh+s+QV0bcaPffCtNpMmLstM9wcBL1ImobvUU8oJoO+fz5Nj9GWTgAqna2Yo
	 g38RLP4vOC8bw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so1671957e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1rNRC21rFbgxN2he3WipInw/XScsQlNDuf3g74t4NyBHUhZSjrpnvVRcLqUaqRIlwkX3QkMV7P40BPT+y8hbm@lists.infradead.org
X-Gm-Message-State: AFuF++lVizPrdovUHx2ZezyXifuZorce7mLj96+HNbcly/uqNoKm4dcW
	P0CZEOl9ndzlcFWNMisN1G/+rTaEu7Qj+EgtnhvDVYjvTO5uJ6OMM15lENMviz3QJXU78dFRIS4
	2nu5xkd1DLvg9jOHe/KSQMHONmTDmi40=
X-Received: by 2002:a05:6512:3f16:b0:5b6:1a7c:59e6 with SMTP id
 2adb3069b0e04-5b61a7c5b4amr952304e87.64.1788561654360; Fri, 04 Sep 2026
 15:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-4-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-4-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:40:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVKRobxDb1_U8xCKaH6d5CzLDAn0qe8W=voSUoTtduTA@mail.gmail.com>
X-Gm-Features: AcwNN1Um3dJHBV2YivCN_BFI8Mitw2Ry9tj9isgsluqoUCSueU7CVUJmlqo5JrE
Message-ID: <CAD++jLmVKRobxDb1_U8xCKaH6d5CzLDAn0qe8W=voSUoTtduTA@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the CV75 pin controller binding using generic function and
> groups properties for pinmux configuration.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

I think this looks great!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

