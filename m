Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55909EDF163
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWNkmAzUQdtfHegRZTbmU8jwK5zq2mplznfusYDgepI=; b=xdfb2xJtiXKYjKZP9GKCts5oPB
	M0TGqf5R9e772mBwPIr36vMdaeKnlizsdysVcyQ01c+bFWY4JPzqC0nVMgC+PLOfsD3vMeIbFL6rI
	gkYsnypVZXMgqckJO8hYMscZMfszqlMHM8UFWGAhtXYvvmn6pB5T5pyxCMDTpd7iL1zJI+6llDvkV
	C849hPyJtF9hTa5nAOFbflgTDt1mQ1pCoXjV38qGeXtILiDIkUOJWQO/afFC8IcDE3MkvUlnew83x
	9dV4JPJKyzpyWcuAYXhJ2IgHpCV7G/lVQadr928WQ0nA8R3i1hR3i1WTiY3muf3iAMax7no0OMGQ6
	ECJdp4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqtWW-00000003V8U-1N9J;
	Fri, 13 Feb 2026 13:47:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqtWU-00000003V82-0YfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 13:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A04B6442D0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 13:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8F8C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770990472;
	bh=DyzFY+7qXZ/I87ykE9tTTX/te+3kpL/x6B8NDHwgSQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QINFr95DCTmDGpJZL+syZ6w4OMbiyEaGahW44SzHXpgajJ2dD5vASaBSSOblTtzhJ
	 mEmISzqm/Rt05EPpL6OnY220wUlUKaw8KJPqyXaZUxb9RkyRQ3mrNGP/kBkyw5KDxZ
	 gD0qa7b8j6Rthu62yPbLUoVNaL5PKbjPYPkjBNBFcOVkrP5QUi2XFs4fa+pJXrw6+j
	 NgLRDKl6uyODeVCVJ2tEJRELPeN33fMl7ZyC5sfhiCV1Wo/OU9LFCwXtM3QGaJyfrG
	 l7/pNkeQchzKS1aNT7jZ0qwN5YdeeYoLYqKPQVMtZhNEy23R0m2gVXMgPAaSjHXDKD
	 T+ghE+E29rlvA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79627af6349so11052577b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 05:47:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkZio2PZnPVKcFrf2Ie50mLfGnNqp3IzXuUIhad8c5fVxf+P7Gp8QOkBYd/tWnXAIAGK4bBXdgy9SJxpgmTy+8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19K32tdqKywGwitOKsGbfyN9HCGXpaiKFqe2ntCpWxMUqTiZ+
	xZG0zurgr0CHVKgG/dPd6h6tLGnE4Gc8ILhpkJmUJRBTSvFUr1IvUyFC9xw2ht2TByA48E95z1b
	H+1/PmDZTX+CGg/E559suhG5kz82MX78=
X-Received: by 2002:a05:690c:18:b0:796:3f2f:a33b with SMTP id
 00721157ae682-797a0be9c0amr31425307b3.18.1770990471723; Fri, 13 Feb 2026
 05:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com> <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
In-Reply-To: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Feb 2026 14:47:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6=YLh1EER2_cQZAprWfgmy-_XawreM5YpcTG2XA=uqA@mail.gmail.com>
X-Gm-Features: AZwV_QhsixaqIxYeaVbNx--W7SxSEC1W_-pI5Tu0Vlx-qt-_T_CJ0Ra3jwQddw8
Message-ID: <CAD++jLn6=YLh1EER2_cQZAprWfgmy-_XawreM5YpcTG2XA=uqA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_054754_229003_B1374C56 
X-CRM114-Status: GOOD (  18.07  )
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

Hi Billy,

thanks for your patch!

This approach is better than trying to extend pinctrl-single in my
opinion, but it has a bit of road to cover.

On Fri, Feb 13, 2026 at 9:18=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> Add a Devicetree binding for a generic pin controller where pinmux and/or
> pin configuration are represented as fixed-width fields packed
> sequentially within shared registers.
>
> The binding targets controllers that are typically exposed as subnodes of
> a syscon node and accessed via regmap-mmio through the parent.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
(...)
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - pinctrl-packed
> +          - pinconf-packed

Why do you need two? Can't you just use one, pinctrl-packed.

> +  pinctrl-packed,function-mask:
> +    description: Mask of the allowed register bits for a single pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32

To me this could be static data in the driver but I guess the whole
point is to do what pinctrl-single is doing and store all of this
information in the device tree, because reasons.

I guess the DT binding maintainers need to decide on this and
also what to name it.

> +  pinctrl-packed,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of a gpio-range node
> +        - description: pin base
> +        - description: number of pins
> +        - description: gpio function

Just use the standard gpio-range.

> +patternProperties:
> +  '-pins(-[0-9]+)?$|-pin$':
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      pinctrl-packed,pins:
> +        description: Array of pin index and function selector pairs.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

Just use pinmux =3D <...>; from pinmux-node.yaml
(make sure to use the ref include.)

> +      pinctrl-packed,bias-pullup:
> +      pinctrl-packed,bias-pulldown:
> +      pinctrl-packed,drive-strength:
> +      pinctrl-packed,input-schmitt:
> +      pinctrl-packed,input-schmitt-enable:
> +      pinctrl-packed,low-power-mode:
> +      pinctrl-packed,slew-rate:

Just use the existing configs from
pincfg-node.yaml and abstain from any new
inventions here.

Yours,
Linus Walleij

