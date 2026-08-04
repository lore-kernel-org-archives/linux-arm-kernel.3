Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FF2C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=; b=uD2CkdHwNGpMDLflvM1Enj3uRt
	JBYo8ISsZ5/Z98zB5WmQJ/7nEobEd6MeXl2PpUMjZYBgW2S8Jw2f6ujYiZNIFbbBIbUIsiRKlcLZM
	CbRWbMd5++BrnyaDWytK8lRafTO9zIthx+LASuzDqfDVDDT7Q2FPTTjkixiZLHAduaVeS6EZ5QopH
	oilJZjH8SwwIGY455H4BaKA9VZv5qYdUNaSik2IFxuPk8yHH3fAEgdALX634EXuW1A6gK8vmtKClQ
	tXhvETHnaMH0I1lO4B8zL3uKna0VJBMjsa5pIXR5+HzDDXqJY61qzQ1nmUFs5lHvm+xYetWYuFlef
	uofGbsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAWk-00000001LXW-43mK;
	Tue, 04 Aug 2026 08:29:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAWj-00000001LX1-21Aq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:29:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca913a601fbso3011342a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 01:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785832172; cv=none;
        d=google.com; s=arc-20260327;
        b=GG7fu5iPQ1b77Q8xqy16NdkWHacfDEMHksluDJD9WJ9BqKVXbpf1D+Hk5chGrs+Hgi
         K7sxsM1OHaQEIomUpRVoEhBypiPxoXIWbAMHw9MthoNY4b7h9hmHhX22tlebESzHvd0r
         zxMkQV1HKMZ1t/LabiuKNx2FfuutwK0FypGO3piiqnEdvaGrltgPU0Xlw44yiRn0S4JN
         nBuXnRvftFvbkJ2ZvTt7HaJGsAc1RZICezp6OEuaCg7hTEMzpp1GfZaX9qwmj/rUzy6a
         qQq5srGLiflAgHap+ysvopfexZ8b4+r2caJkqP4CrABTARoCC1Tc5BE7rzVhAoxfISOV
         CpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        fh=RqaKIh//r+mDvJ6c/m5Otfv/06tVFgxRk9xiTN4nX+Q=;
        b=NuTkqe2t+0L6N5uLIyzNgL+xxkwYa64/T1J86cFqUwbRi9U5AqReJ08ldTAz/YXhtH
         PpG3u4La09mrzjgaXyu/W4Ff9DVYDgARgbvK5JMAat6B+ga46y5dwxrmb5xDwj+cvXh4
         Oz6OkKgI10pxpfGsBgglHbDkmP2/4UjsFZgBxVUwiaTk2GgX96oeO78vVgPyL4mMna3m
         bT1iELHdJLriz6CYv3ZZgKGeOuzWvdKDInjDjes4F9OdAGUj+3doTlLQfbBpUGidPv57
         APJlX5K0HOdbGUTWN+Ibq2WDI/tvG5AIxLULWWrUOtfb1eY+TRFo3y0mnt6GS956v1Pu
         tebA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832172; x=1786436972; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=Jht1vz9KWogvHdXAYUr6Z13reV+WDHxVFXxXO+BuWxckTShZh0jRSUj01qcFMa4EJo
         cMhYIT9inwI7FWCYa7WJiApVoYaNYhcl2SnDBjmlxUy8EtRAYDepZnL8TxRgzoegR8mg
         3iE9LmLFJqsS/IPAgj2Q/LU5cS4LFK/xWjQyxnWHVt4CnlZBtBCFzWuYPEu/QLUpqFqR
         FT6AfHwGJdasgfqZ5ssRizzwY5vM4qgQ911E/nz3nItIgFjvz/5ldzKaFFYiNObq1zIr
         wfCH8Q2PTfMRWzooQxy8ZnzSB1f99/j40IFlZn8qaUCYqbJfzgQp2oUabN8tD6ITK9Tb
         DySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832172; x=1786436972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=Dv4hznMwA+m5Lvmw/am3+W+6MUuEFs4q6hmhynbPJgA/VVdaIJyPsUK2ATDhsUTlUt
         JNQymYFV7ARvaM7oU00FJp6xoo4MSbQiUhPwBpum5WDk0KVJ2MY0dzJOjDceg/lWI2YP
         q3Z4zNNiHlYmt2/4JKpoz9szS7cKxfXkvcG30laArJq8MOW3JxGE2yP5lM0jtSvix72c
         TQmX8NKeogPRmuBpGjPhUUDH8C+9e0gW7+RPk2GOcciZUy+LXqrxemzyyMKgOR8T/eNf
         fqFXPGoJIT3tHYBD21dYjeFvCA668xJ+z2lT3t6UGkzCoIAzImNxb+3bEg/3xHWm/cmA
         2UxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsyET1gcRYK8dBFICh4MJCElYhJpKUK53ur9QKuT/vZdV3vFntgBJnr1WIkHVVAY7xbwHQkickGs8Lgy3nZKcp@lists.infradead.org
X-Gm-Message-State: AOJu0YyD2BDn6wGm3Hhs1qOacAqXB4Hu0VngXYN2FqS6jMyh14o6JsIu
	sdlNelFyBOEIoADQN+UnkNk45s5wNV+UiKJAWRq51abNatUC5PP2VfbgbI9C9r/Q2gEPs4sRLo/
	sQWDSqkDGRjpLwZa5dqYn99jr7nZQYeM=
X-Gm-Gg: AR+sD13RZajmQc4C4+RQDo3SU+hGVv4uUkCiISBRvYIKJbVKp+AvJc/KPLnP9VEixt9
	40PXt75cJBxH/meSiR/CXeBbwFxY9k9MWIKFaMIKjttiYGHUW2BXUZyg79snOkaLtnqCtt0DmZK
	9177uSsW/nZhma2ltlZY38wE713QjWlKxLzA1iJZ0dGBc5myTmVv25cnBTLrz38sdhgXNA14ymr
	2dKFYdmD2VZ0ePADuQA7BQcMJmYX5JGjIaX+gJAS8GGcoQ/TydYQWWrplfoy6shu5DdXmXNLS/p
	CmiFm5uCGJzTrj+SdT0SGuxQ/dae5wZCcl+B+3kP9uyqQsD1/GA2R7g=
X-Received: by 2002:a05:6a00:8d2:b0:845:e2da:91a3 with SMTP id
 d2e1a72fcca58-84ee480ae81mr12824134b3a.30.1785832171759; Tue, 04 Aug 2026
 01:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <20260731225930.GA2098187-robh@kernel.org>
In-Reply-To: <20260731225930.GA2098187-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2026 16:29:19 +0800
X-Gm-Features: AUfX_mwxExGCC8sRpN6-vbVB9v8CNcSex_SykavnhYOluP_E46GIp0w8aQWy9oQ
Message-ID: <CAA+D8AO1D6GJ8xwuKf797rc41ymTZp2d=LD8GEQALHhdpToCUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Rob Herring <robh@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_012933_522188_F536DCD7 
X-CRM114-Status: GOOD (  25.09  )
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

On Sat, Aug 1, 2026 at 6:59=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
> >
> > Add a ports container that enumerates three named sub-ports:
> >   port@0 -- pair A
> >   port@1 -- pair B
> >   port@2 -- pair C
> >
> > Each sub-port references audio-graph-port.yaml as before.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. Update the examples to
> > show both the new ports form and the deprecated port form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 78 +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..18d252722aa8 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,29 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair A
> > +
> > +      port@1:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair B
> > +
> > +      port@2:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair C
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +145,10 @@ required:
> >    - fsl,asrc-width
> >
> >  allOf:
> > +  - not:
> > +      required:
> > +        - port
> > +        - ports
> >    - $ref: dai-common.yaml#
> >    - if:
> >        properties:
> > @@ -188,3 +212,57 @@ examples:
> >              };
> >         };
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/imx6qdl-clock.h>
> > +    asrc1: asrc@2034000 {
>
> Drop unused label.
>
> Presumably the existing example uses the deprecated 'port'. If so, just
> modify it to use ports and drop the deprecated part.

Ok, I will update it in v3.

best regards
shengjiu Wang

