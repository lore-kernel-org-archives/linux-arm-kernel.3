Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF520CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THAYM86a8lGfJC89oRqulnlUSAmMtqdsc6KSglKPv6Q=; b=1TsSw0OdV6mC/oA0k6695FI229
	Mkf63WmKarRVzT6XsmQt7fOcPebTlGc+1m7SDQkC72VphB1U4f2iOMwOmjlSupeHgm/avEiddGe9H
	Dwnvu9ZYkRk4KckHAmp5ZrOlZ6IvWCRQkYQYPxbN4SQgj0c/9XrvtDs9tsU9D/GDXpNhQyEIAY5/f
	ZeShXGB43n/kTx/UUa+rMdvbbRlfKEAe4Sn2wcB2NW/r6kvHKuECOCFXXQIqfp5j15Zzk5+ILmVNe
	OmU50XsU2PjSOepgLQiRqn9JEeZJNV/233mHzbpzUBLIWV0H3sSsv+GIdCJUCKz3/HDWnYYek9bYf
	m/XBEgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cWB-0000000Fwy7-18S5;
	Tue, 14 Oct 2025 10:44:35 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cW9-0000000Fwxk-0e6K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:44:34 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6354a4b4871so6588631d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760438670; x=1761043470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAYM86a8lGfJC89oRqulnlUSAmMtqdsc6KSglKPv6Q=;
        b=I/6A22pfnt0jhmzJqjY3UTKnIvxXRvny/xil98SsC2lU/RRWNJFLpuKkeE2l4ZOL6K
         265VpdiW6nGuRieXW05MJPUgwsYRutDXV6MOrQ1oZof0DFTKDiEl3CQpwNypaYfKu6c1
         Gg5IY4X4ndBQ4Ik04mK7/4VpgpQlQ7H1cl4ZhQobQsXanEJ6v32JQDgTQY9kQQldzrZC
         UnLycRJSkAimdcG3Xz2Sso3QE04c2WyHLCbjPfMAZhVA7cE26+lvPJ6FsTxqVW4/uJyq
         mSo+bQoF4TQD1zKmwIZuKy/OGf4Hdagu0D1bom9pcwS5tVYvaCrUKv2RwChcLFBQ9ymv
         uVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438670; x=1761043470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THAYM86a8lGfJC89oRqulnlUSAmMtqdsc6KSglKPv6Q=;
        b=W+03FUjnHNzhlMflAJE7mqfiTFrf1bdpZQBXloLMPJejRnNxWbYhFGia1bBE0f/sxK
         Am8h8vSqpT7becny3+zZDv+W1a8oFtz7uYbLC8onRPMl6LZM4isEJCWNqRT40cjndrVJ
         bp5JAK1kjmyXMvH+leeqANRPZD8wohiISIrzcdtm7x8OKjQ+TWKI0LaKP+6/WWw6eCRS
         Cwiq0Ugh3V0+jd3uuaHR1XZW07oJEBfmqOZyhXrn/xteVn11jbMFvdB1kDS4fW3nYqZC
         H3OfR6zkZ83ciTtWvf2VUO5hICkw4evaDrtnPxtVKRMTXunai4TD///lDWXY5tXkdoia
         ZvTw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/zpZczQlzjLaSWSPKaUTnbzvkAyd4x7KCXcDqFB2lvLvhN+kkFgfJyjE9QT3+O1kS60BSF2i8RaFdv/45iTY@lists.infradead.org
X-Gm-Message-State: AOJu0Yws+KGjBpNHHJUPNT+A8EFCjNG5XGQxjKLotH2zxlFqP1TUpHMK
	UHsEnxI7iq6xf5vmr25R8he6OLK6K9rYK+2xn5P+xnki3eDUzjGTG64QsErQqz+F86Z0kjrRFEm
	PktcnEPvAksja8BglFe/fPSl8pvyk3CcckyH1/EFN2Q==
X-Gm-Gg: ASbGncvUCiySdI6Gqc3WC2hHCOC/jawKrXQFoAW2Qxm+T0RlI0IGFVSBkkJpoCc+dV7
	bbXVnv58rn1h/YOefg5xwKBqLLJ4OdRp6UhRexTF7bFrr1r28cpvYCAOt20ADV/2CMmYZTE1FGW
	P1pAaZhMTaPtvJtxG+THbd9ctJHWtodx3PJS+gx3Rr27+M4oFIrW3zBx4U7fR1fxwFAl6bC/hV6
	9ejgL6j3yVGJg1SFXvJCx4maxey3Q==
X-Google-Smtp-Source: AGHT+IFp4+6M8ipAZ5PvzMBFmhPMOi8dNCbnfx7iCHUB+I0mJ3szARsJfZuBKpYg4FajfdIRV8gYXT4SlaoN9/M/6LQ=
X-Received: by 2002:a05:690e:182:b0:63c:f5a7:400 with SMTP id
 956f58d0204a3-63cf5a70a44mr7374154d50.68.1760438670439; Tue, 14 Oct 2025
 03:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com> <20251014015712.2922237-2-gary.yang@cixtech.com>
In-Reply-To: <20251014015712.2922237-2-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:44:15 +0200
X-Gm-Features: AS18NWAu8xsDVfGUGNQZd3TKgpRR7nZFuc-hAgCzcqzNK32irDscIbUpkUaITw8
Message-ID: <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_034433_245303_414ACDA8 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Gary,

thanks for your patch!

On Tue, Oct 14, 2025 at 3:57=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:


> +# Client device subnode's properties
> +patternProperties:
> +  'pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '(^pins|pins?$)':
> +        type: object
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnodes representi=
ng the
> +          pinctrl groups available on the machine. Each subnode will lis=
t the
> +          pins it needs, and how they should be configured, with regard =
to muxer
> +          configuration, pullups, and drive strength.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Values are constructed from pin number and mux setting and=
 are
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.=
h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.=
h.
> +
> +        required:
> +          - pinmux

Can't you just include both pinmux-node.yaml and pincfg-node.yaml
to get validation from the generic schemas?

'pins$':
  type: object
  additionalProperties: false
  patternProperties:
    '(^pins|pins?$)':
      type: object
      $ref: /schemas/pinctrl/pinmux-node.yaml
      $ref: /schemas/pinctrl/pincfg-node.yaml
      additionalProperties: false

Something like this, I never get this right before actually testcompiling..=
.

Yours,
Linus Walleij

