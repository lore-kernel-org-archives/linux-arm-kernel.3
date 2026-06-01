Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6649FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ/IhhKarGkjsev1ebvJY6DbVpgdipumlxcq7yohLJc=; b=zFSvGHOcdm1sE8bpUrYR+XDPWy
	nuKJg234cEkgoFgOzLyFFINTKZM4GHC5+0cKcO60HLc8iZI056yv3hvACejAtZN+oPsFQXOKn0l9D
	3DjWUDcZCDvrDLAciB1jZhHoioWWLTyQH7mlyk7XfUM5S1Lqe0NPWP/awsVTVOyUYS1S/gCVqFmuU
	7EffrmyvdV4uO86Z0NZdQX0nClLzoOPGOSkJqPVHBvSqpUhXikxQH3JykXvL5qVtupGnat4EPKjfy
	yArYRuy73wpe8ecTQlLV8pnFHsxlLRSaew3QF2foN1CVaoTYXcdEDHR5XSi7scLgIsAXoVqmB0vS5
	JuEECXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6pJ-0000000BcOS-0Rvu;
	Mon, 01 Jun 2026 17:53:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6pF-0000000BcNa-38Th
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 17:53:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBDB843B50
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 17:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05AF1F0089A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780336400;
	bh=WZ/IhhKarGkjsev1ebvJY6DbVpgdipumlxcq7yohLJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nr+gO/iRezHfQIb24kdU3vqS4vOhiseSZ6xa7VjdriTDL9IbS2aIb/ojqPcIAIVZJ
	 qWxMunqkAm0wsMP6jrIO/7UlDOaNeH7hF27BB4N0afm/wO9bfvems0F28Ck8HW4I+I
	 1VZF0t3infumq2ZX4u/zQHt/PMjvFZ4IZqx4HURNlzc9NZpclnCutWKA5Cokv/j6kG
	 ELynKCEyyuody05IlXgmfcbAQ6oOGK+gk/WUOluQn2EVVq+2EAE+oJyrNgd7hIwZCm
	 jMB+R6lwKZxxHw05OWX4JAKdOMWqYxmirNq7GgfqF9+TPyFy45+DAFZj52CCaauQaz
	 rQpGjHtF9aadw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso1828478e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 10:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8dptfe+NzKtNdiIFoM0lqtXkkPBvwXT3O03USWSASx1lkLVibsbjEVg3c2WIC+rDIEb1Q3LCBIWUNaQWqspUjN@lists.infradead.org
X-Gm-Message-State: AOJu0YzQzBCPyqc9kMxxxMkO2SIHxTDAfeB0OqjQcLeblhBrS9hVtOFX
	iK9UFOoPT+7FiJhLKvVzhj6aYOAf98tXuFv0jGrMSkJVgjF6LAmj+YhYDy4hSmHwsuOrjXNnUnm
	SR3CGt/BTdYGzCF+2+hmW9CWEE+VqrD8=
X-Received: by 2002:a05:6512:3094:b0:5aa:6f47:32a0 with SMTP id
 2adb3069b0e04-5aa6f47362cmr1141285e87.11.1780336399508; Mon, 01 Jun 2026
 10:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com>
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 19:53:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
X-Gm-Features: AVHnY4I49xiJB05RGboGIRNa8JpcA6v3sUBoiJTKtDzGmvM3jaAvFsRby97G7MQ
Message-ID: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_105321_797019_E9621E78 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Luca,

thanks for your patch!

On Mon, Jun 1, 2026 at 5:27=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The driver for MT6795 pinctrl already supports the slew-rate property.
> Add its description to the documentation.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
(...)
> +          slew-rate:
> +            description: |
> +              Set the slew rate. Valid arguments are described as below:
> +              0: Normal slew rate
> +              1: Slower slew
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Ideally slew-rate is V/s (or V/us, any suitable prefixes).

Of course that would vary for any capacitance on the output line,
so that value would be for an infinite impedance (open circuit).

Do you know that value for the SoC to you can express it like
this and translate it in the driver?

Maybe we should even invent something like
slew-rate-volt-per-microsecond =3D <...>; to push this into
SI units.

That said, there are many SoC:s doing what you're doing
above so it's no strict requirement.

Yours,
Linus Walleij

