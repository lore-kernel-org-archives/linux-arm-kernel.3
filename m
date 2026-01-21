Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE8C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=; b=kb9ZbrY4frRxH3A0wH4Nx6yOrF
	tZTcDEdYtEQUy8RT40J505UhrY5SxVFy8wWOBbVYm0WUHGRAQeWSmsgoUHjj2HC78hRLjTnohSM09
	ZpQvbIBUxfuG0Nc41EkcTnZwxd6HY6XZfmprd3M2oaRXigJjYtlL0/0zrQspfsazRJUPiOdyCNvJ3
	DD+PHNhwkuDTKsZyRFKIzo9HRlImF2j2XxWL59rEfhu+bU0ciFdem0wiLAKwAnZZ0/9vgtdMHf43Z
	bnB/9figJylQsmr5GIGEqywtCKMnE5iKE+17/bhz+iqmNxQZdrXrtt9e2k6D2hUP+aCFzPqFjl+jh
	xNLllWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVkO-00000005IfR-2Kws;
	Wed, 21 Jan 2026 10:47:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVkL-00000005If6-328a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:47:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3530715386cso408475a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 02:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768992452; cv=none;
        d=google.com; s=arc-20240605;
        b=HHXTAkOkzzTzVOivQFqkp8BOEJjvIjfwxMqyW/64B/AhKhv+J3iFFjAf4ez9Td1iDX
         PMaB0DgzMGzwNJhsbXi23XixbjU0mVbHcO7tXAcDLgL/nwbbdFevCCFsICsIau0MX9DV
         7pWtSMhuxEnqQGm5Sq88U5COsjESE9cKeuzhi9o/6RLDyQ7jF75PQygOZdD84SxDU4kO
         OAwx5ysgSWhNTh9WxtBKoQPDtHJup7Y/PCtzHy6sITTjrJ2UubrfmY+6lGc5ISDTX6yu
         taXq770LA+QXu915yFciPNTHOLNUu6vn2YjMHmlywMZ1gV6JeOR85jMIzbkBvftDmJwz
         GHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        fh=gw1KYeeEds6SlKLzOtdpvB0c89Ro0n9WJSS/+pqnObs=;
        b=PBSAsCzH91ceQnDKveF5xYo5hQTHJzOLfYr89M0Fi7pdnZu8VR9YhdoPGe/ynvjb4T
         K0PB6SCN2I22ms208pnOtD/lDFvLqqHt0f1BCnP6s37F2xmsPzUtR0EWQx6rVTTtFcQq
         7443k5rYqSti2UZbII9sj+KqhnuyaCS7EkKaEoYV3sUeDa29ODyKRwGP0oKc9DfGqILp
         MivsmlHn7xYF/ISeqe/gSVub9HVmI2FaHsXpH5eBFTtwM2jePa2ETH9Q98pzSzybEQQF
         qAez8l+QOGAhqIVnxVFR0K+yDV8ADHRwx+xLyQCYqFQkkBGROnLSN7q5h9cmzfo4jv5p
         N11A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768992452; x=1769597252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=k+yiTnVV1SRZwB9qr4UqZyKwOYmRtXiO8eJSdrFeXLrDgCsd8btp9Hzh/hzqgPLgSG
         U9W6X4DaKwqlPZtomOzhXbVjLwvtaAnwsPg0NpJcF+8UCeTw1JT/RgJUQ8ajAfdrvHVz
         DBc9Vk1TZCBZnuWYiGXkWU9e8bDyQCQiUC3Wb1HDHnFZhczg32GraV4bjCeaRGiFE2mx
         TfWGvGjpNnsIWGu/tTIctHEVEHi+oZdMv776cmiJWNR/9jMQciGCcFG2SmSinBsEfSUf
         2HSqS1GJgXx3EqkbmPtbEWBEhBM2V8XmYcRAqmXVWSF/DVpI9biPSdZ8PcawhZYrfd0Z
         ysCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768992452; x=1769597252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=IT0/al4Bv9xycPwYXUvIY64+Kb+40uMYeqYyVcdoO+FFBBplcf7EAz/dhrm1IlZ8Qu
         RJcSPUxbAAHU/jIXxrNdWMEba+qH4SDgzEWehgqFiBnX5VhUKGQkXY7F3EVpECiCYxRz
         qb4Kv3ZtuB/G6WncI/mXUTRGwmSV8C3IOfpI69SgqibYquqLX6q6m1VwkE22VmuErrQ0
         NXpYSWLUnGKdRzqprvLbODNFtvmkg1TfCea94rYhAD0KvCHbKCy/aldozrEsFDA/b29K
         ozXWj/RQ/euIDN/c/u8JdIFvZEe1HCW5xs9tVr2p+FAkHkqkkpaQw4jAKhnfJy4QOytH
         ytQA==
X-Forwarded-Encrypted: i=1; AJvYcCWnvcRPgs4d7b+2xP8wQfUEM/qTCZQjzCiQZzEExW5eIULpGGwzsoLM0DeQXaQrbwvcMfT2a/56OSZ4X98TLdha@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5+SzT3eBmnac4sFNpenuqRa1SZuHGhk1SRok9827Cm6pL7uVb
	NBocNO34Ks9EOfHQlJ7V9ot1k2hgYCiE13nEdIHn7OnSBENTwekdxcyeOMYEnHozm5wH5pawUJO
	x5nj6o6G8NSceoipRyEMVjvla3bMI2T8llFxX
X-Gm-Gg: AZuq6aJwFLcse/AbhBmuam1SFYLe6D9r4DIT/PnOpGY9p4uf3vHJG6fbuJWC+nAc+8p
	Ot4VBj8KnlB8ZtSfLl3QFph9+CtY7dhEix1zpX7C5qXNRb9EkocX54oreWc6qSirnUQZTCiuD8G
	eMrNQea0xTWDP4Xj/9ZYe8BI5TVMbA3atZWdjHXMAP0KTngkhTObSNiGjV0St5ZL8W1VqD0nTR6
	VFBEHZCUz6GHw74JrFWztC8VDmBSaBwWoGV5nlaZ/AG7FCiEVI2oQauqNJR6IenDeOjuPk=
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr14234623a91.37.1768992452459; Wed, 21 Jan 2026
 02:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com> <20260121-careful-beige-iguana-c32bbd@quoll>
In-Reply-To: <20260121-careful-beige-iguana-c32bbd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 21 Jan 2026 18:47:19 +0800
X-Gm-Features: AZwV_QjDpxZv6jt8rBYtLCaZTNVLi3Y8jythwZEftwLkFpk7naOfOY6Hgw_qq24
Message-ID: <CAA+D8ANy6-e3RkhjSKWfqEcxEnsZrEuJvz7Bmp5q6ZO4x3RfVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_024733_788481_547D6F27 
X-CRM114-Status: GOOD (  27.25  )
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

On Wed, Jan 21, 2026 at 4:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> > The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> > i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> > this property present, then SAI driver will try to config the setting,
>
> I am still not sure this is hardware static property. You say "can be
> bypassed", so I imagine same board could have it bypassed or not,
> depending on use case (so mixers).

Yes, depending on the use case.
1.  When bypassed,   the SAI output goes to codec directly.
      like: SAI -> Codec

2.  AUDMIX mode:  the SAI output goes to AUDMIX.
      like: SAI -> AUDMIX-> Codec

Will add above info in the commit message.

>
> > fsl,sai-amix-mode =3D <0> is bypass mode, fsl,sai-amix-mode =3D <1> is
> > the AUDMIX mode.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,sai.yaml
> > index d838ee0b61cb..7808c324eebc 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -133,6 +133,13 @@ properties:
> >          - description: dataline mask for 'rx'
> >          - description: dataline mask for 'tx'
> >
> > +  fsl,sai-amix-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Anyway, string is more readable.

Ok,  will use string
>
> > +    description:
> > +      The audmix module is bypassed from hardware or not.
> > +      Bypass AUDMIX(0), AUDMIX mode(1)
>
> Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]
>
> > +    enum: [0, 1]
>
> What is the default? What is the meaning of lack of this property?
>

  fsl,sai-amix-mode:
    $ref: /schemas/types.yaml#/definitions/string
    description:
      The audmix module is bypassed from hardware or not.
    enum: [none, bypass, audmix]
    default: none

I'd like to use the above definition.  add 'none' for default.
Which means no audmix connection in hardware. then we don't need to
bypass or not-bypass audmix.


> > +
> >    fsl,sai-mclk-direction-output:
> >      description: SAI will output the SAI MCLK clock.
> >      type: boolean
> > @@ -180,6 +187,15 @@ allOf:
> >        properties:
> >          fsl,sai-synchronous-rx: false
> >
> > +  - if:
> > +      required:
> > +        - fsl,sai-amix-mode
> > +    then:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx952-sai
>
> There is no such compatible.

It is in another patch:
https://www.spinics.net/lists/kernel/msg6004158.html

Best regards
Shengjiu Wang
>
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.34.1
> >

