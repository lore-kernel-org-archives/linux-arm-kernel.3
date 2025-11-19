Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A26CF34AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=; b=3SbH/Cm/Hu3wQYSsjRoIjLiqEB
	P9fHWRhoW3HNWmx/gGcTGpDz73IwnZonUaca4Gy109haQNDa5kzlNu33npdT587kIXBVtbdtvyOaU
	uuCwnP/YrrpQtRm0CmFzzjeWL/65uWc5sZ3ZP2StxGNvodQ5LgXVspfZVKxMPX+IMMZceYpYxF4BB
	sEDGFTBWF8TO2G6UUjhSGF2ZKonMRQXhv5MhYrM0xR0iX+RahNxs1w4mfdRRyfUoktH/MhgGIuLqH
	bO91IXpEsPdKFtboX+V3Ld+zeSWVZE0xCvKorUM9FQBcOKt+0CUn/QKmLOFCNYGbu8yUeaXFrMV8E
	nnpqfqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLizY-00000003MIk-1UAx;
	Wed, 19 Nov 2025 14:17:04 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLizV-00000003MIE-1vRc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:17:02 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso68041321fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763561819; x=1764166619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
        b=pj96hKoc8YSK8YIhuvEkcvOGvpzNOc33R2TEV+9u4pzvnGo8VUmeJ3Asdj0zAhmUgG
         +FnIJL1/QOEeHIxm6NQJXQ1BTmEpdo7OrR5ZIzgzYWTjEy54nbgnq1GbF1/dkiRavXjf
         aZx+kjC0aR3W30UnpWwYmhUcuMrnEW2pEyecOXdAWvLJgeo+K5BsQL+YLVGIr7atM7qF
         EsJLQtPDUuNQLA23zR3zbPHC68Sd4tEuZfv1xkc1qOyD1VzoMuxU77B/8gaIi/lM5WYb
         uevpMWBrfqZq/O7cef5pbv3Xl8fR1X0szLC/f3xN3ojMxm83jD+xecHPgObN32kPcnOv
         gsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561819; x=1764166619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
        b=sanwYRrjcuOFZmiNqhWEGjzPgg9xmA4x3DMeZPAG96MlN7bq/9Xk32Bx4JQx3wp8M5
         kX+z1cujUQDodpkT+u5S3cDeNdZXiXjWBYR/Qxcl/bPirhB4ZxFxxOmq0B+uoU7lmq9q
         R0IO4jzMtfYf2xErHcrlZpk1sAZjbvPNo+hW4/qehrPlzTkjvmNwlMOOoNikMncpITqw
         JzRO6ddeaKOxTFi3sQ1iPFWkGrjYOqFpIEkia5FRqd0126F+Xv96V5JCmgnxXmi4AVQn
         +aWu2AqBfTmh+RzqkggsMr6ztN6B5ZOv6EKM10EP7/GCz4MGPH+dookHL1ioZYMEnr1W
         CNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEjn1VBXfgqh6dTjKMIpGgM4SasF8cwFUlPC0fuPH6jfvxynAtoV3uJtXC3wngTVRXF8OWMNo0LEoHUdXH8IRy@lists.infradead.org
X-Gm-Message-State: AOJu0YyFCNPXDTNLJ0DyXoEKxeoUWrIW5pb6OHxhBLVPTCphlEP2tlQt
	Z+DMqFN9b6Y81aN8oCDHnR0sUMtpcRUqcq4SAK2v64BW4k59NzEPYln0ygjmVVjQDmBTsmiAPA/
	drjm8mEVZT1VZyL80De09f6gRBe18QWgHdxqZWgIQ3w==
X-Gm-Gg: ASbGncsdMVWXlUKlEOPTZ7iohoGAXApcfmacw6RbXnJrhsho2zA21dCiojxgeU1rGe8
	JBxb79pSlRJlBBbRhM8XxpMFM3nVabGVEfxDgecBuQ9TLNgFzdNCH68atv7dsLs5nVb3kTzRyx9
	rwregUl1JBSnzpb0tZE8a4eADip2fT4x5SKqGbYhkQd0SogBDFYQZcSEVfCfDf8wuTyxpyHk0OO
	mYP9E8OWUvkqtC1ihnmGKIjDTC5j7kjUQvwjUWHQsBW/2A8jElwX+69WOaHJKbY+PfTOs4=
X-Google-Smtp-Source: AGHT+IGairnJxnYRKkuHYVw0JVrBsc+2FMWfccI9lHotg2DPX4sHJAgyu5upYOPaMi5aXgvof+7aycNKLZqXk7xQ9eo=
X-Received: by 2002:a05:6512:230a:b0:595:7dff:ebb1 with SMTP id
 2adb3069b0e04-595841fa4d7mr5909063e87.36.1763561819191; Wed, 19 Nov 2025
 06:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com> <20251118161936.1085477-3-antonio.borneo@foss.st.com>
In-Reply-To: <20251118161936.1085477-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:16:47 +0100
X-Gm-Features: AWmQ_bn95RYU3PYx77I_yIH51aH6sidmJ5f83D5VEpU-6oaLBlEbr7SStcwerBw
Message-ID: <CACRpkdYuRas_jgi5K9hbxtJLrxxQ+wS-dJcunT5m48qS0tKXAA@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use strings for
 enum property 'st,package'
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_061701_526050_D5719A5D 
X-CRM114-Status: GOOD (  15.83  )
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

On Tue, Nov 18, 2025 at 5:20=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The property 'st,package' reports the SoC package used in the
> board DT and is used to inform the driver about which pins are
> available for use by the pinctrl driver.
> It has historically been declared as an uint32 enum, where each
> value is a power of 2.
>
> Deprecate the use of the numeric value and replace it with more
> readable string values.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

I think Krzysztof is right about this, deprecate the property and
(re-)introduce it on the top level in:
Documentation/devicetree/bindings/arm/stm32/stm32.yaml

It may be a bit quirky to get to this property from the pin control
Linux driver, but it is the right thing to do.

The Vexpress has some inspirational top-level custom properties:
Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml

Yours,
Linus Walleij

