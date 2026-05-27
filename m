Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261ABCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc/BrRX6BDzOZ1YxVqm6B33Dd86tu453/aG5x7by2Ek=; b=LmeV6eSFc/O0IanSRvMk/reRhU
	ADAibz8pQkMgxa78FDBSmxAqcFALQ4zX8vpq4i9v0O4b16okoq8IjSJIoXPQWy9KfDbzmPAIo0txd
	xjcTuq1mSe9wimhWUfyybfemiQquPW1h8AAjizSeCFwJQ7ikwWHfSqWdy4xkIQ4cL04WlTNb2CQyV
	PdvJ+5FQZgC7fvArwDb0NLN9e3iqxUMwX65C1ev1vArwZrU4OuzRXDv6ve8xjX4XREqO217osHbCg
	3AlRHJfTpzZ9Tq9TJYSsfm4lLeYLK34MhJcUyEIOhldWB0EeTvIgM2598/B4G2DZ7hJBFPcAgwVEd
	+FYt5asQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH11-00000004UoI-3ZUs;
	Wed, 27 May 2026 16:21:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH10-00000004Unm-0g7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:21:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C4346053C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 16:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537EB1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779898913;
	bh=zc/BrRX6BDzOZ1YxVqm6B33Dd86tu453/aG5x7by2Ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P41/TPXzjKCimocX2l+68xKVYLMQD2YFpgRnY8N95Jn9yNOi1yXTdaams4CJab49O
	 bX2ZaZys0qJ+rca4L6XTxpTwg2SW1F51yFoZOHDInvjFUOAaS2KPfgFRA1UvoLQgVX
	 On6byVttJQ3khgpcDI5UnvlOIls7rPsFiOc821kso1A1SJ+Wl0pHSqBjaVtn4Wl3tl
	 g8ySCprcy41UoQjBQYm0+IEky/9tU0P/cALgnmFxvT1zYK927Dk9PGxRd/B1Gt0W/n
	 zSn35gq7XfCyNMBEBmJOyVU1WPljsJ8qfpisHiRIHdJ0c+cLfQAGBnQgty7dyXDTwX
	 RUaLFUHeSe3jQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa4a688f6eso1053373e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 09:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DS2wydJYlVv96uy/8XIuj3fLSu2WaGplSSVvTvvlY62MPT2F2C0WkB35ZrWK0NyjI5sBrVqS6KGExzpNZ81o1@lists.infradead.org
X-Gm-Message-State: AOJu0YxbkZt7yfTznwVHcpdptKshuBCqL0ZSgtmnYrBXQyUmFRSz1ZLv
	gP/f0oc3C8RHHDcoHUGQBfrfdlkTppviUNjtDz/tUeo9y1Pd/6HGfdXLpx8Swva/3GFSeonQGxb
	Tfy1+7Wj+7dIMs+X3LcdaWHXb9pEfmMc=
X-Received: by 2002:a05:6512:2201:b0:5a8:86a6:c476 with SMTP id
 2adb3069b0e04-5aa323843dcmr6639602e87.37.1779898912083; Wed, 27 May 2026
 09:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260523173251.72540-1-manishbaing2789@gmail.com> <20260523173251.72540-2-manishbaing2789@gmail.com>
In-Reply-To: <20260523173251.72540-2-manishbaing2789@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 18:21:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5GoXqgRCmH=f1btY3eToi3_wMBJEarohJuZhyKxowJg@mail.gmail.com>
X-Gm-Features: AVHnY4JfnnRkXYHTThwWUKLSwG3QzP6v1BK1Sk1xyc9ylqzeUPifpk0-WhZKh-8
Message-ID: <CAD++jL=5GoXqgRCmH=f1btY3eToi3_wMBJEarohJuZhyKxowJg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: st,stmpe: Add missing properties
 for PWM subnode
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lee@kernel.org, ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
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

On Sat, May 23, 2026 at 7:33=E2=80=AFPM Manish Baing <manishbaing2789@gmail=
.com> wrote:

> The st,stmpe-pwm binding is already covered by the MFD schema in
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
> PWM subnode was missing a 'required' properties block. This allowed
> Device Tree nodes to pass validation even if the 'compatible'
> string was omitted. This omission could lead to probe failures
> at runtime.
>
> Fix the schema by adding the missing 'required' block.
>
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

