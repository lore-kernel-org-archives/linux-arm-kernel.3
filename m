Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948F3CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR6Li5YSVDXFaaB/n5eOMtqh4EBeFoCLf7S8pn0aiho=; b=SFH8pUCuXuxd6Bcd1DAytZJyf0
	BhaE18K70uM0hT1sJOMMhqSIg1PBkIUPJRde3FAD4pVNsMNIDU9xwVrOiJWV6kahu8OSWM/Uf5Hod
	izwaQOT+Q599kWIWQtiw/4wDjAAqZLFW7wQ7gb2IrxnPeN0+cu2WdOB4TP8ufGWOYrYuiQN3sL4G1
	yxnzwrAlwKbwRIoXm0I57fG6b2kHPGTY/8mHGi5ceDmeAH3hMRZJRfBRzoqjR4eRGVGZ6i22hk3qr
	y/h2wDt1uIAbsUTilWD2GjcXN7Cjvg9LLaocKuiUChmjyEo8ttN0wCaHBUYnjvTOL2+S/dtkTu4cr
	9Hbyu7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluiQ-0000000BrOJ-0fX6;
	Tue, 12 Aug 2025 19:31:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsbl-0000000BX3Q-2O6w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 17:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20FDB46326
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 17:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06105C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755018981;
	bh=hiKx5h6WgJ1kRSlNqANQXTbZ/qufuAsjkmYJWLdzY/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rrx7ONevt651nfLg0mqbamZT+I9vsT7FOdqYPWXahJLbdCSR9mxCrDH69WVkjOJFJ
	 sQrSPjjyETzpVgPm/FHFSlCO56TxP9G1ojEVjiQONhbWjmHp/jN3AGYxeDXB4e9tl1
	 glmCD6QGhW2LROTweKFIBVLIf3b2wlfF0JZzidE0Sv/duoSwFiK67XXeW0tyfVD0p1
	 qFw12ZcpeprdH93mFyOicmwAeeVdeemJK2Apu8OvKbP5yYC2TKznK1bubWNGb9egnq
	 3Gt1V6Wv6p+XqgkHEaM4Xh6Q+NAEFXFo+NMzcls9CuGdnwu7g9utWKlCFpqWlmxiMv
	 j2QJ2LTmx0ywA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af97c0290dcso1003626366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 10:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQQG5V7LW4LuWg4YXXsYHlYx9mEk1CKT6l2sETHhNxU/f84I/cQVhPgt3OHJYGUOzaUEfx40jLt78lezlnD06n@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf3YIWA8Dv36VIxVhqrpDo6vcpbGaySDWYvlUuoxba9lIy5dPP
	BABTwFHjKsHrKmEsynpMT4EaSujHfBFnP+mdiVh1ZSc97w8Fv6WWN5EoIU/JlruyEODm8Th1PcJ
	GXZ6tfw0ZvPD+uAIn+S+3vHdeUVAtIw==
X-Google-Smtp-Source: AGHT+IEBE2ikhAU2DNl85LpL+NhY5CizUSURSGTC9MFOW45Us0P1xe9kfUVQc4IbWaS2z6b1ZX94B9hdIEwvFsOIwvk=
X-Received: by 2002:a17:906:c145:b0:ae3:4f80:ac4c with SMTP id
 a640c23a62f3a-afca4cca31fmr10795866b.12.1755018979494; Tue, 12 Aug 2025
 10:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
In-Reply-To: <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Aug 2025 12:16:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
X-Gm-Features: Ac12FXw2MCpi_Gef6Ss--eZgTnXi88_EsAQqYxE-YlC_gadE4Co6lYS79wZ_vkE
Message-ID: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Krzysztof Kozlowski <krzk@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101621_649021_9719045A 
X-CRM114-Status: GOOD (  26.47  )
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

On Tue, Aug 12, 2025 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/08/2025 13:02, Christophe Leroy wrote:
> > The QUICC Engine provides interrupts for a few I/O ports. This is
> > handled via a separate interrupt ID and managed via a triplet of
> > dedicated registers hosted by the SoC.
> >
> > Implement an interrupt driver for it for that those IRQs can then
> > be linked to the related GPIOs.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,qe-ports-ic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-po=
rts-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports=
-ic.yaml
> > new file mode 100644
> > index 0000000000000..7c98706d03dd1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.=
yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> > +
> > +maintainers:
> > +  - name: Christophe Leroy
> > +    email: christophe.leroy@csgroup.eu
>
> Oh no...
>
> > +
> > +description: |
> > +  Interrupt controller for the QUICC Engine I/O ports found on some
> > +  Freescale/NXP PowerQUICC and QorIQ SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,mpc8323-qe-ports-ic
> > +      - fsl,mpc8360-qe-ports-ic
> > +      - fsl,mpc8568-qe-ports-ic
> > +
> > +  reg:
> > +    description: Base address and size of the QE I/O Ports Interrupt C=
ontroller registers.
> > +    minItems: 1
> > +    maxItems: 1
>
> This was never tested but more important this and everything further
> looks like generated by AI. Please don't do that or at least mark it
> clearly, so I will prioritize accordingly (hint: AI generates poor code
> and burden to decipher AI slop should not be on open source reviewers
> but on users of AI, but as one of maintainers probably you already know
> that, so sorry for lecturing).

If anyone needs some AI (chatgpt) converted bindings, my "dt-convert"
branch has ~800 of them. Feeding the warnings back to AI to fix was
somewhat effective. The result is not the worst I've seen submitted.
It saves some of the boilerplate, but can't fix things that are just
wrong or unclear in .txt bindings. Despite my 'prompt engineering'
attempts, it still tends to get the same things wrong over and over.

Rob

