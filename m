Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC2CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=; b=xzqeClCVyAkb1czAXg8S36oVno
	Wve59WdebklVp+BEP4twreYUCb2WvBUe+7mwZmAfW83KnDOyvDQSxScmCkXDwmQeDRvpf9w9W1HS5
	8YkbegvtSKPdrvM/NphL4HZ0NGqR3zBZYo9SEJ2xZ+BRCJ8zdMVJ/xxvULb0y1H1vVO+W5YVqLdKo
	4Qxr/6Z122CFYrO6TP63v7pFaFM9WFwIql7Ttg5swUnqeFBhhZPWNnXQqTjbwoiFw3VBkuVZLR/w2
	KnzzJMHKutd24u4Kf71FA61qtdAZpCBLGeYkjh0F3pbQ9Rh/XMXTRhNSFH6OXoUuvM9vYRtMdiv6s
	yxJAsF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhijn-00000001Oy4-0Xlz;
	Mon, 19 Jan 2026 06:27:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhijh-00000001Oxc-11MP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 06:27:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so3194583a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768804056; cv=none;
        d=google.com; s=arc-20240605;
        b=UcRfsmlDiewynmzy8N0LSDMtGtQ4TajPkOPwvnvMKKplxWW9UXZe+1xFlDaL5Rs1y9
         OLTA0xfsAAwj9sF4vDDaTDmp32rvTZuCg0iy/weyH4O+UcVc3jFQXRu4kzKNgNQN4Cx1
         j0RHHkB7xE/DhjSgDMV7IE7Utpdhls4ZJKpDNkJU5o+M1C+B9jeNJi3UEWQXDD+IoI19
         wvJAp1E/BhTXwt0b8PjMPRS8Stk0G/q02QmOWa6es0p3l3L3krQY24sMCdxV5vB75LBK
         rPTABJB9F1ZmPTmaZiPzbPkSRxSRXYHzj/VAjzcB/lkLIqAYe61QTl5YhaaJKZnfKK3b
         rlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        fh=n55o14nDimUJhs0InMYBRHKzeiudpmCurca8eJe4cxE=;
        b=XoXhw+b8k4ULuHzNRNizFn+FyakrBkX3nCEIxWtP446Tk5ib7nJngq5lGMoaQNL3Py
         gLSwxW9G34Xi66V2htU8YowAgIItO6gCHAgYkW8m/OnJrQD7DWr/DYPuzfZKLWgkumM3
         KmgQwAJArWy2K3W+Yy3FtIMqTH49tsL3N3UVoxYMJK2PNh1SWHlb2rQk+KnYco8Nz62r
         mz72RRiTWYV+5PDMkF2OK/33v/lBw49PFfE2s7q7Tl2l6dqbuBrVVruCYXaUMRs+bGGn
         98012HG6bRxfPDzeicIEg4mhSHgeQfRlS8pN/N0HAfCYLRoTc/f6BNNF//zkteW+MLaZ
         0tJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768804056; x=1769408856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=lDt2VHZMgNG6GoEuP77b2L4zHfIYI7UlxCk8DmE8m1tFKllUZyLWbeeBe2xB/ZSeTm
         KMzuFodb1bvXSlbQMvg3ueTpvHJlj4po+nBcOIaJTDBaNWBCDzy9lQqSkfoF+gj6WBCn
         Z/nV2iaosF8EuzuCuwYcETLqkBl9CU1TvCc+Lm04Au+qs+JzwXy0nc13rGq4otDaxoE0
         rmUwiknkbZ8uyd1gaoUu5fRCg60Xv/zymywJDOCRlXJFlnzGTORoHgPKhBcnsHGMu6od
         kAN6xctp8AuydECIM/gRN9XQWOUHeG2VDwe0+3XziKHnC79+wHm4pF37614vijwPcrdv
         OEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804056; x=1769408856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=QkQxxoNAsdbcwkRoJgi3f7BnLeOd54uKtOeEqboVZb1v9VCHAfH7CwkphfTwBkTTyE
         rZcuzNKv3UXeEcAMzn9eKLbgGdTSvnSMGU89N4TW6OzEt54kGJuWqX6v3mZM0Z9VS53C
         ULLBK5QSInou/FOWQLkFltBUCUBcJhZBr/ncrR46ZxeLYy0JXSipsvyC4iE3us/rPjua
         ZiILC0LDmaduz+XhQ18vfZErSth3XzBvrmdOae5mEDS4nz4x389P9/xC2izmJWsmBlA1
         OzpIVgdoiKSObE/YQXDBH+RjHkWsC1numO/nOjLO6ZCdOsYWmS1aaL7W981bnAhEulPl
         5gZA==
X-Forwarded-Encrypted: i=1; AJvYcCVDhB3bVr6DCKkh1eWydASTBHNd9fENYrVcwXh0raZ31dfsyMBZYh7kPWI/ZbhYdj0V2vhe2fnBggCAEJC/fFnr@lists.infradead.org
X-Gm-Message-State: AOJu0YyQF1HVQMu79v9gq9FEWb5rJSJyX0XWm8sIjcsIdyhd03hJY5c1
	8YtfaCW6fumfSNoEAP5/rTKI2NE0iVdP7Zg89BWseA0JWRHKJj3lYIrS4xKnUTB5hTGEKjg2y6c
	xh1N92D3b7+y8AAkz+eWaTd8XBR0abMA=
X-Gm-Gg: AZuq6aJYEINJHWVl2Cjzh4UNfRHHmx/TJmL8Vmw4/+7bvmeRTX/IysvgjJ5uByv6Av0
	U44KnYW4xJa2bZYpyKzuk1wPCUc/1Z7W2MDRfosN1s1kBaRBCTOJ5x3gareFtCNxdmpYwQQngef
	jEVmXlcfvUZYzvEn4rDdWHXoh1EMRrBT7Dn/4XrGiwc04zyjb+4MkqBD21ip0CARX80D/3pdwx/
	T+bcopZJbkDEkSv28raXfYk3HxoioUkO9mxhtHQYjWyZH2Z/tFh0FdDoKK04ornhxk/AYdhQ4f2
	SpdxYQ==
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr8752017a91.37.1768804055769; Sun, 18 Jan 2026
 22:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
In-Reply-To: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 14:27:24 +0800
X-Gm-Features: AZwV_Qh2xtpI3oElyCcH4AM0eV_DbnEZq9du-jVlcZi7tddPI18dsGW5cus42Lw
Message-ID: <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
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
X-CRM114-CacheID: sfid-20260118_222737_332179_C8204CB2 
X-CRM114-Status: GOOD (  25.24  )
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

On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> > The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> > so add fsl,amix-bypass property for this feature, besides this there is
> > no power domain defined on i.MX952, so make power-domains to be
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/=
Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > index 3ad197b3c82c..50fb08460b4f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > @@ -34,7 +34,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: fsl,imx8qm-audmix
> > +    enum:
> > +      - fsl,imx8qm-audmix
> > +      - fsl,imx952-audmix
> >
> >    reg:
> >      maxItems: 1
> > @@ -75,12 +77,41 @@ properties:
> >          unevaluatedProperties: false
> >          description: Output port to SAI RX
> >
> > +  fsl,amix-bypass:
> > +    type: boolean
> > +    description:
> > +      The audmix module is bypassed from hardware.
>
> I don't understand why device AUDMIX would have property saying AUDMIX
> (so itself) can by bypassed. If you bypass the device itself, what do
> you configure here?

The case is that the SAI interface is connected to AUDMIX,  but AUDMIX can =
also
be bypassed by hardware configuration.

Yes, adding this property in the AUDMIX module looks strange.  Another
choice is to
add this property in the SAI binding document.  Is this better?

Best regards
Shengjiu Wang
>
>
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> > -  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qm-audmix
> > +    then:
> > +      required:
> > +        - power-domains
> > +      not:
> > +        required:
> > +          - fsl,amix-bypass
>
> fsl,amix-bypass: false
>
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx952-audmix
> > +    then:
> > +      not:
> > +        required:
> > +          - power-domains
>
> Not sure what you want to say here, but disallowing properties is shown
> in example-schema (:false).
>
> Best regards,
> Krzysztof
>

