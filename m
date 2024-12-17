Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8152BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQBFudkH/U9XRrwJjvmyIWyAmq7wglEjIEj8Zz4oFpA=; b=LLYWKEpYeGEU3N4ozX8b+sNBCP
	2BBGS583XnxUQWZrZUdUL1j5oate+VFbQBjlr/4V3C3YSIHQSjrUVRXxScl4tDCm45tLwU6tLdrwa
	xN3Hol+gZfMk0ALCoLc+LVCsj4vXv0Zj8b1SotCZT4a/+Z57Y46qu8R2g/4k7k8SV8eJoDwoh0ArS
	CPVi6zX/KlWVFsFd6PxfUmsIaarTHOmJoMlYm+gKLql1BFQdo81BPHRXDbRGZz/jdqEZ7kAXEynhs
	Iu3uc+tas0oQpfW/toqI8xPGQ6vGosOj+1hEGZkyDGG+v1dFypsTtPXQ9T+PlMY3BM+76rAzeavWG
	vNFg5f1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT3h-0000000CiqB-3F3O;
	Tue, 17 Dec 2024 08:36:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT2b-0000000CihE-42t3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:34:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24077565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424492; x=1735029292; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nQBFudkH/U9XRrwJjvmyIWyAmq7wglEjIEj8Zz4oFpA=;
        b=X5Qvu48hze9e8rPMlG/kFupG9QTwP7WckL7jpavDkhI3lHg0J5qhUQx+FhFcQO3PBg
         NMNIunRLVmR157YMTnC753WQzU6tfedGMpk62UzTKNn6+zBUtOmjXCC3+UMTu//7e6Wn
         UPOt88Cr3SFPxDjOtj5alUYMltPwrHW1DEoyOiLuhPGIjrZ6keqoMRnplYm/Dbazx7nY
         SqoyZAEc863ZMHMFFbLvA4SzPVQGnkx/MXOsjcLE00oij4Bb5iHkcbCzs4RLKsPQaJIt
         dbNsgXEGky5RGNGzCSgIynXk8SZxOuQvgtIRVBWegEAXqMDsVz3Y46T1kBpINzOHQMBL
         gyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424492; x=1735029292;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQBFudkH/U9XRrwJjvmyIWyAmq7wglEjIEj8Zz4oFpA=;
        b=ukcIiZR8cyM19sh4yBf2rhkZKtUJpQ0OcSwrJJ+MExp2PPa/8j7PFQPqyZh2EqEQ7B
         Nb83vOny5zPrqdZSn/7h+bXXvBCHmzcPM/erBIScIY0kRp4ryiSD47wUChdx8+7wdP0m
         45+wfo0N0Gu/YjeRUgxSdJUX1JQvhn04x1+qUxSiEAmelV3ivcdQ2m8ZRl0RyqF7CClf
         1mbJ9x0Uh9UoP1IcNNuz7YReA0RLIXYUw7Gl3I1Mo03T5IBo+32vyHzHC4CviuvG+Sf7
         cbMDMIe8xnP1gk2cdM1heR/8Ply1Ftasnuw1SQ5cS3xsrzoeplaVl1s9/VtYa6COFB4J
         x7rA==
X-Forwarded-Encrypted: i=1; AJvYcCXsvqrEoh58oKt+YjKClYNu4W/eXhnVDoBiGbyIcQE56pd5Mb8h8VEnbofpNFpM0VTF7LP2grNAJT66Wlavc/kb@lists.infradead.org
X-Gm-Message-State: AOJu0YyCxvveKJeNLzq1iMWoV/TLfLMI2RjZZ87LgI1hZqwevFhzHMR/
	5ZDK+sCVso8nOAA/OnjF7rYXJ0O8shYKqePntI2/X9nGbAxjMDzgsJ9Wjdnlwms=
X-Gm-Gg: ASbGncsHzRosTGFgqBE7saBL4HesqFtTegHXr+6Hn4tumr8Ji8OHL8LhP+vGbSeUAqe
	A+pGnhis41lQ2QChIlVkZfH0jbm67zLdFeuuTqSwi7UuxAHRXHEABc/7ETWmi73wlW4l3p0X22D
	WmHpum441UXy1n75+W1KQjcTxH9RftqHBsz+88g+42CDNeSLPo1r21YJLfyp6kewktvz4onImUl
	2/YfQSTaDbofCP9OjHHzeLwSJkiOKNXE7anNWxvFGxfgMaDRnUSohPmSJwG
X-Google-Smtp-Source: AGHT+IGdkDRjPGq5YThJvtr0Dph2unG1voX84f7v6HaIyi5sRuOIUK1Mi3kKYmBQJuMvyL2RKZOlJg==
X-Received: by 2002:a05:600c:3151:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-4362aa3ffcdmr145552925e9.18.1734424492159;
        Tue, 17 Dec 2024 00:34:52 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625716e5csm163118975e9.36.2024.12.17.00.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:34:51 -0800 (PST)
Message-ID: <6e22585f8d374f8e26a2a51153680041ad8b1bea.camel@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Date: Tue, 17 Dec 2024 08:34:50 +0000
In-Reply-To: <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
	 <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
	 <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_003454_030451_A9198C0A 
X-CRM114-Status: GOOD (  19.37  )
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

On Tue, 2024-12-17 at 08:38 +0100, Krzysztof Kozlowski wrote:
> On Mon, Dec 16, 2024 at 01:06:28PM +0000, Andr=C3=A9 Draszik wrote:
> > In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> > we have to be able to distinguish them properly as we add support for
> > more features.
> >=20
> > For example, Raven has a larger display. There are other differences,
> > like battery design capacity, etc.
> >=20
> > Move all the parts that are common for now into a gs101-raviole.dtsi,
> > and just leave the display related things in gs101-oriole.dts.
> >=20
> > Raviole was chosen as the name because Google uses that when referring
> > to the combination of Oriole & Raven, keeping the familiar terminology.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +-------=
------------
> > =C2=A0.../boot/dts/exynos/google/gs101-raviole.dtsi=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 297 +++++++++++++++++++++
> > =C2=A02 files changed, 305 insertions(+), 282 deletions(-)
> >=20
>=20
> This looks like move of the code, so -M/-B/-C format patch arguments
> would create better diff.

Ah, yes, forgot about those when I switched to using b4 instead of
custom scripts...

Cheers,
Andre

