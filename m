Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C10C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrOPqooVJKR65PqQc6a0txwADa8lEUlA4DFwnEFD/n4=; b=LFSlYuhW38j7xjTxrfXqHV6/08
	r12OZ2WJIU8Wg7uf0zI/FOa4IjQ+EvDg5Ok8kj3+qx5nSZSg9E+xC7nxn2tRzpo0c1xjFOou94uZ7
	8zdQNCP32ap2exK8dt2LAl4ofPPraxRrDP649rE/515vTBXrkuOCXfRf/VcIzBSuUx/xcpO2QaIMS
	vm4U4heJCLHZFhjrvvzZ2krCjeFW8TPj3VOnhQLYdCzGrVWZMd42dlpZdjbt1zCyhkUgh+tInMw09
	Q30LvyHyTtNOn889WewFcbAyhZ0rX0i4KX7uncQjE4Os3nLy7lGTK/p7wQs6KbNUpiPkkAOgWy4jb
	kBskgnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wZQ-0000000A6GP-3O2S;
	Wed, 16 Sep 2026 20:49:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wZP-0000000A6GH-3uIN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:49:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BC256022C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B881F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591770;
	bh=wrOPqooVJKR65PqQc6a0txwADa8lEUlA4DFwnEFD/n4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z/1GcvUL+QQ6ELhJi+Hgl5oJUICJOdCQTunyRu2QvSMMTOkNUSmnPRts9mT3vbzI4
	 FVMyVt+0LxPxC20gFHrWFGm70H8BIzdp2J4CU+wmjtZniHACx/5yr/bBGlBsDu6YAW
	 ZvKyZyNueSIJ2LORJQ9ip3MTbbWCH+YaVyVAnYVH4/zckuup1zKzFCxADXD+542Ulh
	 6MQMmGuFbGQdBxSG59jeaJjYGAIHMFgszPM4lcDfE0g3dxfcLxkNR0HtoR6azgEvZi
	 PGi7fBUWB5yuwX0RDh/69FLMGJ3iZu8lFCx3WF9ceWc6VhSWceZTgP1+qdyvMF7DBF
	 IcnF/+Z/afJNQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so8802866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:49:30 -0700 (PDT)
X-Gm-Message-State: AFuF++mx7uu3lFrMT5Z9mpDMh7lk9nlIFDv4VKpQqLKftntHM3OAhZqA
	WiucgQn78rb5Ys2YXre/HnVYWIqMM7gvKAcWj+mPSlmeRQPiYZzu+LB1o2fgDDhyrhMW8jcXbeL
	CS6uIE2gBfg9/lOv5K94hIWU/lDcIGQ==
X-Received: by 2002:a17:906:99c9:b0:c29:519b:3aee with SMTP id
 a640c23a62f3a-c29f54f0ed8mr67673266b.33.1789591769361; Wed, 16 Sep 2026
 13:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com> <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
In-Reply-To: <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2026 15:49:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
X-Gm-Features: AcwNN1X_UxnU6ZKwsSvWgTeaY6WNtC_ArZgdOyjZ98UNH3XGVrlhWCoa-QMjqBE
Message-ID: <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Wed, Sep 9, 2026 at 10:55=E2=80=AFAM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 9/9/26 5:31 PM, Geert Uytterhoeven wrote:
>
> Hello Geert,
>
> >> +       /*
> >> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> >> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> >> +        */
> >> +       spi {   /* SPI_1 */
> >
> > As this lives at the root node, I'd rather change it back to
> > spi-ws-2ch-canfd while applying, if you don't mind?
> Please make sure the DT schema check does not complain about it,
> otherwise it is fine, thank you.

It does complain:

      1 spi-ws-2ch-canfd (spi-gpio): Unevaluated properties are not
allowed ('#address-cells', '#size-cells', 'can@0' were unexpected)
      1 spi-ws-2ch-canfd (spi-gpio): $nodename:0: 'spi-ws-2ch-canfd'
does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'

The 1st warning is a side effect of the 2nd warning.

"spi-1" like the comment says if just "spi" does not work.

Rob

