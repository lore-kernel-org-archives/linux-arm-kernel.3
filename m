Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428E6CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LP08PxMOy3+q7wsXIRxd+k6qF4bhNukjRqN2R7SnbJo=; b=0a8boSM80+9U1ygttL2M7g0p90
	/odUJfaPlu0+LwgyV9i/kipDanKlFa6MPnXH83bELfZAPWzSk5MlLYSw9yscSb/TQBHtzeunb97rZ
	QjlG8ZiVMoHrA3pXN9fDn/YhUYcRtGO3xptDjsdP7JpPLvY7J5h1De4h4eu/PMn1SinZJlpml0K/r
	c7uHIAeG9khZ/3bau+EqiwbiYB9cvINBfe5Tze+s7zNrB7yPacE28q5hr1vJvMWAiY5hePhydOhK8
	MAnocnxwFwe1/9yDEzrL4QtCbhLB4r8Fb0YXYd9YdskozNTenGoFT5eFJHV7IFw/Ld3YqKmseCt79
	DuottT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWbM-0000000Ew6F-3TLp;
	Mon, 27 Oct 2025 23:26:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWbJ-0000000Ew5e-2WQg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 23:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 955FC4571D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4A0C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761607568;
	bh=LP08PxMOy3+q7wsXIRxd+k6qF4bhNukjRqN2R7SnbJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YMgQzw5ktHHkIoZDDp8fmeIIxPhW3KmOp1ndU12agoAwMolAYuds0tzDxoZ3lLwvi
	 90D8GNBcJ5MR9tZIXs60SeU1xedeWKwJkcxCo+fnrKG3wubGnSvNPIS+HfWrdLYQNg
	 +QSePw5bDWFRgOUuvQNlInvHah694lOFOQ+Je4wFctkGmNBKJjadfuhUTLtiAP5aRu
	 Et+cYmW/xRrC7IqJAPdd45iUVRI44kgi1zY/VHtGQLamY389aw1FUk6hzrog1UZ21F
	 x0I3LxUKX8UbrDXDNuKXePMos3odZblAdMODdYIFLTVqc/zNEk1eMhBxdxThXcNTRA
	 WeDELGSbTY49w==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso11360904a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHN97Uv/NX7OHYzk4MgcN2v38OJdEW6JbV2L91Dg8bi4vtc3A8WKrcjirT/3832G1k7BklUb76MpPfpGhW+sEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxOouhaylbg8LNoIGdLF5ocBGEvkVNwFczV4ZzZ2PCTsH86Kzm4
	QsEz40cb2q7kcZm1acykRxc44D7neYyQJvyvcodh+HEvfUcYsVSlCJ2RVMfE4vH/aA4y4ASFD1r
	gocUn+BBHs+wjgFVOrx4HZ+f5MtdbhA==
X-Google-Smtp-Source: AGHT+IEX1xGnmtwVGoDLaZVp4aFh7ruN9LkPKkhMyM+i6wHN4ucAhYDTaXvbn65T7tutgmjdp+KLABvK7KA+7GmnR/0=
X-Received: by 2002:a05:6402:5cd:b0:63b:ee26:5449 with SMTP id
 4fb4d7f45d1cf-63ed84b8529mr1554449a12.32.1761607566727; Mon, 27 Oct 2025
 16:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org> <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
In-Reply-To: <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Oct 2025 18:25:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
X-Gm-Features: AWmQ_bnoPPjAhNXAPXCoKnPtawt5o6d_64F1B37jF33JCalDTEepaJ4EpcJjEG4
Message-ID: <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_162609_661103_825C93FE 
X-CRM114-Status: GOOD (  14.79  )
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

On Mon, Oct 27, 2025 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
>
> > Convert the Marvell CP110 System Controller binding to DT schema
> > format.
> >
> > There's not any specific compatible for the whole block which is a
> > separate problem, so just the child nodes are documented. Only the
> > pinctrl and clock child nodes need to be converted as the GPIO node
> > already has a schema.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Patch applied!

I already applied as it is clock and pinctrl.

Rob

