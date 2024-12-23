Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB308E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MUwOgRUnhXT5bm369Orj5PQynMd7SVyypJ/rGIX8VU=; b=1+EbxjG/n76Xuuw8pdskXqvhC8
	zRKo0g/M0QJoALz6F3Eh4WihvH87vkyeyNik73CK2V1AkrsFZER6TJtXCAqMQ+gmv7i3XbQkjiH8O
	wMnvqXBIx8bg5letwCouYvtQznsmWeG8xLSr0HI7cJboqVTFEVjyCzO7anbgANa+XdIBeaNtE+9Zd
	4Q2LHt+dQHWAuzFNZ8CfI1NvbtyrWL2aKVVnMHOLIC1Prq90+QkcHl4km7Ai1rMFJdlzOWY/6dpSN
	pPpvo2iwwIeT8tbZ/R2jTKQD9id7+q2Tn+cQuWglF2efQs1P+3n1Zo5tZYkt+955UXRNT0l9wHYqT
	apCI8Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkQm-0000000AIPN-2JwI;
	Mon, 23 Dec 2024 15:33:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkPa-0000000AILL-41Ta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:32:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361f796586so46142805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734967921; x=1735572721; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+MUwOgRUnhXT5bm369Orj5PQynMd7SVyypJ/rGIX8VU=;
        b=xJIwqJYJZ/mLsfHAWSLtP+aaIPjBtyhVmkhTKuY7n9bwbiaurwrXBblcQR7u4wxE18
         YA6cbyyCtmcYjvcTqGm4o4VGx6LwZGPxRg6+t9XODQTyiNiRCIMPeRogRDBXWOfoE/FN
         pZ8UBXLUCSCr4yqtHXF9S8XJlrE9kGykJy+nuVKHN8VKakigVUIBLD99SbLpM7vfJ8zb
         fQqZoht4oGnqZcHMnvo8KTk72vmU0trKA2D3n9BgoiLUPqpahQvIFaczWdL+lAQSXhmF
         qIM0NxSTgtydva7tynG3s7JthH1wXu3bmPcZoGfdMtjmiYMR57wA67ZL8jQHYEnPr4fq
         jEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734967921; x=1735572721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MUwOgRUnhXT5bm369Orj5PQynMd7SVyypJ/rGIX8VU=;
        b=UyjD+BfihxnNPtVICmfV9TYHLug9YNIXGtNXZSw1jA8+NKKjsOHVLQ2Dwkr2BJC3Tl
         Pht/+bqGXKQa8ROxS5U0BsU81AObNLbj9owblHbbMGXM6fq7Fvm2rMIfgc3PPSLz6uu6
         s00zWoMbpfjQ/HcOtLCBCEpopB5pFZc3ZdMsuJxc5/JfRWdquer8YHdkgHEEc4ZInCkw
         MrD5Es/RQ5EU34g0foks4hUSGeWqUNlDwg7L7m0qWCD4UQTeN6U47Cn1gZQiLEW0HNRQ
         m+U+Pb4Bf5dPXyaYkm6cOVLfgYOW/2o7VJzVG9hRwh/y/a0c8veR6nHZpAC8q3x2cUPS
         TqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ic/QJE07bmjdUcPj+yDUC2LK0zlz0zAM+srE8nfmLkoXKWqr+CSqIkASFMhwtLVPKzkm+bysygAvsE/MZwt8@lists.infradead.org
X-Gm-Message-State: AOJu0YzByeu71RUFpWm437kNzZ+xRWSFtFcGZr7YcG90PO30iXnwaBJe
	XtouhQLFjOBfnXz+hy3X3Qjz/hjrH+Qa/mas++eGZzZSyf0AzRGUHTpWyvAHPd4=
X-Gm-Gg: ASbGnctQC9JICj3MgtRUR5ZJKU8zyvg0o5cLDRBwbwobQEQz6pmAJbc7aVUfwgSOftU
	Ubgb9Kx51X+9Vu4gKqrF67qp3oaDNITDhCT/2ANLOGPjnL8nPlIMWtgOr9GvT+7IwsyOgK//3GW
	4+Bkh45BOke2CeoKZKOT2SI9ZaKVzVbm4G/ze5oDrWk2uL/eQQlxGZ10pDrOB7/FOQvvDgiz89P
	E7TzvYoa5/bzz6azMrJ0bHsNfDH+imkVSMR/EVv70kCMnFTL8Bug1mmTvtcJQ==
X-Google-Smtp-Source: AGHT+IE2PUKcy1CT4BX1kJYJ+FDVyKDT8Nzp8yzBmGcj8sTdsMxOqequomdtYBNo7dbt4pR218lSTQ==
X-Received: by 2002:a05:600c:5246:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-4366854c073mr112846465e9.11.1734967921077;
        Mon, 23 Dec 2024 07:32:01 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm138466205e9.15.2024.12.23.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 07:32:00 -0800 (PST)
Message-ID: <9507951f9ce4ee9d8c553d8964f00ef217f8ed1d.camel@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 15:31:59 +0000
In-Reply-To: <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
	 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
	 <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
	 <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_073203_040828_BBF84D2B 
X-CRM114-Status: GOOD (  33.27  )
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

On Mon, 2024-12-23 at 15:14 +0100, Krzysztof Kozlowski wrote:
> On 23/12/2024 08:45, Andr=C3=A9 Draszik wrote:
> > Hi Krzysztof,
> >=20
> > On Sun, 2024-12-22 at 12:38 +0100, Krzysztof Kozlowski wrote:
> > > On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > > > Raven is Google's code name for Pixel 6 Pro. Since there are
> > > > differences compared to Pixel 6 (Oriole), we need to add a separate
> > > > compatible for it.
> > > >=20
> > > > We also want to support a generic DT, which can work on any type of
> > >=20
> > > There are no such generic DT devices upstream, so we cannot add bindi=
ngs
> > > for them.
> >=20
> > Do you have a better suggestion for the wording?
> > How about 'gs101-based Pixel base board'?
>=20
> It's not exactly about the wording but the concept. We don't have
> generic devices, thus no generic DT (DTS). Period. Thus you cannot have
> such schema.

There is a Pixel base board, with different additions to it, e.g.
different displays. The boot loader can pick the right one.

Let's discuss that in the other thread to have things in one place :-)
>=20

> > > > gs101-based Pixel device, e.g. Pixel 6, or Pixel 6 Pro, or Pixel 6a=
 (as
> > > > a future addition). Such a DT will have certain nodes disabled / no=
t
> > > > added. To facilitate such a generic gs101-based Pixel device, also =
add
> > > > a more generic gs101-pixel compatible. We can not just use the exis=
ting
> > > > google,gs101 for that, as it refers to the SoC, not a board.
> > > >=20
> > > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > > ---
> > > > =C2=A0Documentation/devicetree/bindings/arm/google.yaml | 18 ++++++=
++++++++----
> > > > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Do=
cumentation/devicetree/bindings/arm/google.yaml
> > > > index e20b5c9b16bc..a8faf2256242 100644
> > > > --- a/Documentation/devicetree/bindings/arm/google.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > > > @@ -34,11 +34,21 @@ properties:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 const: '/'
> > > > =C2=A0=C2=A0 compatible:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Pixel 6 / Ori=
ole
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google GS101 Pixel d=
evices, as generic Pixel, or Pixel 6
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Oriole), o=
r 6 Pro (Raven)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - google,gs101-oriole
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: go=
ogle,gs101
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101-oriole
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101-raven
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101-pixel
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - google,gs101
> > >=20
> > > SoC cannot be a board in the same time.
> >=20
> > Can you please expand? google,gs101 is the SoC, the other ones are boar=
ds.
> > Is the commit message unclear?
>=20
> You now say that these are valid boards:
>=20
> compatible =3D "google,gs101", "google,gs101";

Sorry, I don't see how (apart from the fact that dtbs_check flags
non-unique elements anyway). The result of the patch is:

        minItems: 2
        maxItems: 3
        items:
          enum:
            - google,gs101-oriole
            - google,gs101-raven
            - google,gs101-pixel
            - google,gs101
        allOf:
          - contains:
              const: google,gs101-pixel
          - contains:
              const: google,gs101

So one can not have 'google,gs101' twice. And if I only add
    compatible =3D "google,gs101", "google,gs101";
to the .dts, then dtbs_check complains indeed.

> (although compatibles
>=20
> compatible =3D "google,gs101", "google,gs101-pixel";

OK, the schema doesn't flag incorrect ordering indeed.

> Both are wrong. SoC should not be before the board and SoC cannot be
> used alone. Your schema allows that and that's not good.
>=20
> I did not get what you want to achieve here, so tricky to advice.

The intention is to enforce either of the following three:

    compatible =3D "google,gs101-raven", "google,gs101-pixel", "google,gs10=
1";
    compatible =3D "google,gs101-oriole", "google,gs101-pixel", "google,gs1=
01";
    compatible =3D "google,gs101-pixel", "google,gs101";

I think this works (but I was aiming for something shorter,
possibly involving minItems):

  compatible:
    oneOf:
      - description: Google GS101 Pixel base board
        items:
          - const: google,gs101-pixel
          - const: google,gs101

      - description: Google GS101 Pixel 6 (Oriole), or 6 Pro (Raven)
        items:
          - enum:
              - google,gs101-oriole
              - google,gs101-raven
          - const: google,gs101-pixel
          - const: google,gs101


Cheers,
Andre'


