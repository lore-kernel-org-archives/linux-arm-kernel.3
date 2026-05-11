Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B55BCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=; b=ideH3AbqH65njAeMLgFwzsvDxq
	+63RN7x9+XBk5PIIvMdRdXYchzjGysbTAAEKgy8a+2LLUuvqOhFIR4JEqMNuikLZr/Xzv//j23Z0m
	KXyXktTCuIrGR66JJQpgit3H9X2dcbo6yflZE0NHxteNJC8YdXSrXuWQvlHgWG1Z/gYjW9ul7GR8Z
	2PloR0w86UZszrlyed4jhz9p8lyxMjn1Yk8EuXSiHlR/Ceml9p7LCQ3+OgmT8lqwGHcgJEcD5FGff
	e4VFTDdYujqilESReYuqQ2IWqznA5VSTitV/TGrzUuWH5BxE+UjOWvpRwtHwzSMh5mUftel6Uykb3
	9B+MbDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTKM-0000000EAzS-0hEl;
	Mon, 11 May 2026 16:17:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTKL-0000000EAys-1iLG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 16:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=; b=RXHoALXkWvRH2xxoYH9fAvXM8H
	TFWJOpVUVpxSc/HgkyacEIloKgelCvJLU2d/4qrhWD8l1RKcSLGdJktZfbriWA0nXspW7SWp/N9DD
	+ROfjHfnysUDAS+HnhjcK1BAAgP5JjRy1GbCv0MaoJDtrhYixzk1NgZkpT5a/SFN8Vm8pZ6otGp7J
	aj9yhw3tKycc58pxjDVjd1wfctSNSHekveBCk8WdCOuJj2viC9EJvQf7eOtw5lM6l/n7kUa1/IrBa
	1qR/YWAZ+LEBOIa8sEUN/eBjdl6D3+pUAwPPZiCbDQQByjMdeJhqDKWwMH9I7GTFC3xbXGippmfjQ
	sW5SuzKA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTK8-0000000CHyC-11xM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:17:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48909558b3aso47818375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778516258; x=1779121058; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
        b=RiA3uipqSqP4s5u73f8yWS2W5RqaJJ+qEIyhsOOcpV2aZV2b66Qy3BnLHRu/cwxSDO
         5EA34nArCh8ZIXoC06A8UCj5sJAJ1tbYF+v1+wzytpq43sLqkUVLYj3+IRIkVLCv4cKI
         hu3C8cZUqu7n06iZfPb7jc2JEMTxlvb1TB+lBDTY+QeC9yal8mVM6pdCjSMUlTkkGohl
         WCTpa8jnLQtbczrIOrmMSe/5U3/3AHTRcDoN0mGH5wyF5p3EztMJLIBtS1GM1DS1opS1
         KxrMex6PGHJGPPsymyHueWylvsytNOH5yNQyREWgLzfxSstL9wBKXcCM15F7XmgGbsuM
         /IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516258; x=1779121058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
        b=Np7Er34+3K3WraGGRdEG9BFUQ4psASOJgYVByT8bVIWQ83HSAD7NFKXDL7X0Pey09E
         gu/8Sq20FOoTGsJw08sh5Uyfa0RuDMyYddsSwxACXqFhJsm9AOYYesMLJWNCRdbKMmcf
         EOvBIClgjbOw3UsVLbEknm7JPGZWEFiHxztRuv5A9ERdesEku+c9QMSDyv2BjqgrKvW4
         dE7vtJLA6f3FWrEhYQ9sJK4E3cMNcOfzKx5IyOkApGUoMUJVp81u8x4H5QbfV1VNO8Ya
         2TB0MrwCn+ecmVMSdf68apMlZCD2j+qKPh9tv3RXkIj1fqfHvJPLfh+PG5PuyPfzTG9Q
         IPxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pKCR0Xk8pVkkvs2Q5PHUjiTy7lL3ADbJedgeMbLwJ5a25x/ioO90E0EbtMYavsY4sg7oO9kggOTWW/T5xerwk@lists.infradead.org
X-Gm-Message-State: AOJu0YwPYxPaDPXtBaDd/xWfmDOcDalgiWNNOE91qF2Wt7i5YAKvH1Vn
	EmOYQCh9GbZyV59Jxl9R6D6a/+ezQ6R0aJ6Hgjsv51i2/gRIQNjEfjsc
X-Gm-Gg: Acq92OGP6Yoia1WhRmJIV7wQR+KmI53LMQcnQARm/fvV0zleGNql4PuuFd+zAfSWOeG
	ohkhBfSUANO4mDOYf23qzjyVTDXTwoXOgEO2NnnbVNvd27vs5ZBHOq5KVYTbfEstcLyj6KOiV6x
	Wc2u08ttoHhU0JWx9t57G+jITkO79UqXIPw44Xfwl6S3ldM6Q2Qv2S9llJQTfDgY8Ju5AX3lfTv
	GV3hLijT9hXIx9ob53qSsv4siBbDyFfx7cKbmwp0CrTOZGWq2cCZIC4aJ9ws0Jg6qeJJimocFpw
	xn4meQf7mlyuIFmqfAEv/QOX8x7/6NUtbodYFEF0vFaGUdsOtRVwvYvUb5IM4xsJdPEeafLd0A6
	8iEWwo4fCQj1g4eNGTW+NvSB1kSSftxagYfTsZqVRLcvg6x6QbwX2BIqb7LrQaCTIZhUjPNtj/M
	xZCsie0UE7Jn0johVrFbatdj5JUO6hChzkObOnJnNMgdgoNWjILA211kJ0jdh4Xb8tZ/0/9ts8G
	EabsLg=
X-Received: by 2002:a05:600c:47d3:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48e51e0bb62mr257112665e9.3.1778516257805;
        Mon, 11 May 2026 09:17:37 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e566cf7sm472495e9.0.2026.05.11.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:17:37 -0700 (PDT)
Message-ID: <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Andre Przywara	 <andre.przywara@arm.com>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 11 May 2026 18:18:22 +0200
In-Reply-To: <20260511-stock-elitism-f1f703bee1a3@spud>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
	 <20260511-stock-elitism-f1f703bee1a3@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_171750_843126_077627D7 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Conor,

On Mon, 2026-05-11 at 17:08 +0100, Conor Dooley wrote:
> > Baijie HelperBoard A133 is a development board around their A133 Core
> > board. Introduce a compatible for both the Core and the development
> > boards.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> >=20
> > Changelog:
> > v2:
> > - introduced baijie,helper-a133-core compatible for the Core (SoM) boar=
d
> >=20
> > =C2=A0 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 ++++++++++=
+
> > =C2=A0 1 file changed, 11 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index e6443c266fa1..d7b9dec81165 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -96,6 +96,17 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - co=
nst: allwinner,ba10-tvbox
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - co=
nst: allwinner,sun4i-a10
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Baijie Helper A133
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133-core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwin=
ner,sun50i-a100
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: HelperBoardA133 Core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133-core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwin=
ner,sun50i-a100
>=20
> Does this make sense? Can the core board be used without a carrier?

such operation would be impractical at least, that's why in my v1
Core board didn't have its own compatible. Maybe I didn't understand
you correctly.

Shall I drop the above 4 lines, the compatible property from the
root in sun50i-a133-baije-core.dtsi and only leave
sun50i-a133-baijie-helper.dtb with 3-strings compatible as it is
now in v2?

--=20
Alexander Sverdlin.

