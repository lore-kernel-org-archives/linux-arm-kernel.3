Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD74DC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=; b=GOe60EyHtsn/H/RoKGzPdezkbA
	vs8CNyFHwCtGIf7L67Etx6/BDp+v34S6u8p4DNdKsrZ3+Dfpk8HGOlrE5MFMQCo1diHU+/7tQRolg
	Qz1weVr2QiK8gQSzoQ8Enf5N+6ricOIx7vQimrVWeyMdwOpYCjsaDBA2dklGFvY/wWwGjgI+MT6RO
	DsKBqXjtZv1/pBzVQW7xf25A00GI30M206aNtaggw9dbJwecOmNTVaNHTpHCdqF0RossPKVzjfsLE
	5S7ZTse7YXRlcPJV+iKgALA7knmDDssl6zq+iakxgHvcl3Trs8eF9pTpYaJefJVg2JEC46hYBguFP
	XUmE476A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPXT-0000000HZ4L-2ptG;
	Thu, 13 Aug 2026 07:07:43 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPXR-0000000HZ3R-0WOG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:07:42 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so123587e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786604859; cv=none;
        d=google.com; s=arc-20260327;
        b=FxRzAseZy7rsJ2tUdACjl7dg5N0NfPgJu6a9ZSjHiiILMv6YOLKdNj2b/LnNN51S5N
         dNSs0ke6KJc5nXSZ1LaGZyI0eYPw7Bt+pczzKLsYKmIMK43W/1DXVP5YQCDAPM08fgNj
         vsFeJt79m9yps09AUtxNAjogYhpGFjnq47LQ4lH2JyeWz1qbue8cy+bMfSkMdVvUvg0o
         afLCUYUYq1URylRSa8pXVtX3UZhB+LdHhFVAyaTFthGL8lC+/tIIkMdDL3wwwGaFHUbA
         MMN3MmColCWts/hxhW3pXG1sRMcPwQbzVrnensUagxernVHnjH+PwuZEHMHRcAZflrXi
         IFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=;
        fh=38Whep4rUDIYeBWtKvtN18aGdk5kNT3yhIlSAeiA8TU=;
        b=VRSZrI1EXHfPPaRQNX0XZbyupFAZeKqW5IqXLSRbNHS8yNltHOGN5ZUNPdrEftFZz2
         bnTfesxYcLIdGiWNNn7CWMfZxAv3+wCklPZWV6xtNxnQKVb3BQ2c7Bme3CcbVHZykU4e
         qm2/STaktuMZ1FjQCgRaeAXggkhBhwxzbH3iFvSmZcdvYw/BekAx6l0qc7tKwe1JENHg
         PEfmtvdIgAcD7IPzdvOeEEg932zzWFs984qcE163exA3WY8oOeuytA0RjhyLcxaGWfCl
         XrK92eUvZpaL2MDz+W0NUO2BVbq21rXTgyhjCihXeD2c5YpwqAOOnuZTW6+CfqT+qnf1
         jrQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604859; x=1787209659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=;
        b=hluoe3Ks8kEq0HZrDvyG6EMdpXRj/lwfH9c+QtKxMeOEu9BZQq3YgOLuBKLKeAwX28
         jL32fTP+8xC8kNPVvXGDGrpbJJRjzndOP1qrTnrRzXbWZs5WIFMVVsUUKDzO6orZiT97
         FA3DuABAvk5QUlYHIihgrJOs/lqqjOcIxzxtv6goy2c96q8agn8qQ28d8BNRYLukDy9I
         2Z1hQKJXngznInHmeVEEy2YnuveN3YHOMVqKE/qhtB4qoERjqYbv4PDhp8cZbXdZBuF4
         kreAV0nUesbX402tLFPsPOUCfLDI0hEK2wV1yOyDkf9UwHdp2lV1GXSCngLRnegdra7w
         MiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604859; x=1787209659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JawJ392oLiwqJSSKv/chS0lFTdfl550m6jZnWA87huc=;
        b=heFI2k/Kz00PbcS0WSSkzxBYbRC5ZkEhysQUCkRedjJc1gIS8EOBHTfwq6zNPGfh8y
         pzf14+L525wwlXAJWsrM+8yxqilxOVCn2mXip1VEOeFQHZZBqHmI3fi9vmtJmlBTgeAd
         fyoYseKXpdrYDHsoG/z864xZNAnLaeK/xTevczSvI8klBiT3e6ZFawSo//8uTvKSKbZn
         y8m12Z3i5nDObbzk5EYC1aQNWx4SnRdCH4supDRJ6BHG7RnPVa1VSxpLA6YI41FhLHZm
         84Wn4YjiRKbsaQ7i5TqTjwLa2hwn24NQ+Ro9cu4L/6UzXIihzKz/JNaVrJ2FVDaJEOk7
         HO+w==
X-Forwarded-Encrypted: i=1; AHgh+RrbuS41RNjgYnJy3UD9tuM4k8pvef9hx/SW+95dgfiCqPgvOtsCzgQAXmHOq5eoA0wL285Y7L3chJ7R8br1l8oo@lists.infradead.org
X-Gm-Message-State: AOJu0YzqCJUmGt1GoNPl6gI471XAi89R9UFkNjRLuyUfwPU9/hEGIzuA
	pXpb+UKTo+Pn1WF4R3PjSqtY9fRQhB0E+RbAYC22/WR695XAyYdpm17fwW7N0pi3x1bCupDrdLc
	R1F38tXoSQdCMz2X1zQ4voBavSHbx7Lg=
X-Gm-Gg: AR+sD10+VEU+KSsCVcp8JRIX5HPLjfNS0KeeBJz23imtcOqMKFnJEbAfEA3Vqd40w2t
	FK6wGMdh5qUJowbcFmG0DEmUAkAPdsRICZ1c/FAqBEAhWwEwQ8v+qXBB8A1ZfPOc5NB3QNxfmP6
	HCfHVv25DasEY0q3McaDjS2BNIv3q0NGq3MkEIJ6H8AQUCHVtYVBa26NlKf6fGX7cyafJZuPXZf
	+2Br+x6wdEShTsMIcN2Lv4FGId/GhyZdOop9JwDHkloBDAHhxdaqyZjKnhNP17zjrngFq/YR9/2
	83JxXJHXhbJ7LC7A6yTcAzoijP3Hdy0mJaqOna+3wyefemYy6PXfqCVLpg==
X-Received: by 2002:a05:6102:f08:b0:745:6721:8c2e with SMTP id
 ada2fe7eead31-76db527b110mr828054137.2.1786604859600; Thu, 13 Aug 2026
 00:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-1-5d67e0efa6c5@gmail.com> <20260807135417.GA63178-robh@kernel.org>
In-Reply-To: <20260807135417.GA63178-robh@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 13 Aug 2026 15:07:28 +0800
X-Gm-Features: AUfX_mz7a9dcIAK-s5cvIzuRv5XGFroygtfy3R9a9idtSFOSgE2XnApE3cVRlPY
Message-ID: <CAPBH0A8NjrYVGdPBegFo+DcZDL-YGRHAzC3MzDc33Gvamd_dHQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_000741_172512_5133C8D7 
X-CRM114-Status: GOOD (  14.64  )
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

Rob Herring <robh@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=887=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:54=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Aug 05, 2026 at 09:02:29PM +0800, Colin Huang wrote:
> > Document Anacapa BMC EVT1, EVT2, and DVT compatibles.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
>
> Missing Conor's ack.

Thanks for this,  I will add this in v5 patches serial.
>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index dd7996960de3..1c2656d99807 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -84,6 +84,9 @@ properties:
> >                - asus,ast2600-kommando-ipmi-card
> >                - asus,x4tf-bmc
> >                - facebook,anacapa-bmc
> > +              - facebook,anacapa-bmc-evt1
> > +              - facebook,anacapa-bmc-evt2
> > +              - facebook,anacapa-bmc-dvt
>
> alphabetical order
Thanks. I will modify in v5 patches serial
>
> >                - facebook,bletchley-bmc
> >                - facebook,catalina-bmc
> >                - facebook,clemente-bmc
> >
> > --
> > 2.34.1
> >

