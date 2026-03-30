Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC5BFB3D00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=; b=TIs6IPkU0g9DJ2pIWfyWR5d2C+
	9meZXWaMUix1HsNu0FKBDNW1MX99wGPJNPcDz5PcOYnrS+YMH0bz8MRBBCrunlh+uCAxcjG68JQPf
	bDSDFXq3E4UgL034suUyDK6aWxFDsuIWwrPwnPBgQQv/+tGxsC+xCehRL9BOUYAALO7c0x1ou9fRq
	61wYwc8AX51tgY4/9LN6st4i1bEySOlWl/5AnnjLgzTqAjkexYLmNfqY4RQ5dvVRE8TH4uNTbgxjk
	0g6NAwNJWjQQTLs+S3R1RqVErJhT+DaUD0cm7Qsvdd86UZ6vm3tGI03jhP/Rf0WLLJOwzc7aN3tVp
	BhWNclTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AEC-0000000B6WP-25ZB;
	Mon, 30 Mar 2026 10:52:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AEC-0000000B6WJ-01A4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=; b=dPWbNz6/Rj/WZgqGeFS8YphlBZ
	7MxAOGhTqe/hiGC98UGN0XC0vw4VRLLZr3/Svh5lMOh5XIT0fQW+FEMiXp0ywvr1ZF8x/ZPbaCSF+
	3ts8ZucK+FjgRZPAPsAsnqyzN5SQ0Obo48ge7F3FZfnd080hKAJOXSce43sXS6EXVN1ZlVIwmXfaU
	LTZo4/cq2VCedx4gQZ/8W+53F0uBdPVqGX5GV5pdsLABZL8uwLccxTOYujPWsfv5DaBmSPFhdNnya
	dkNYY3FMlOHpE3UUHhxz5079q7N7qlI1xsqph3GUE20PfhAnFGqr3bYPvGvLNUQaIDRM2qoFscdjy
	AtfmcNqw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AE9-0000000DdKf-0Cvx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:52:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso42783535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774867931; x=1775472731; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
        b=I63qAO4+TH4KtD7qALgvu9F3TdB2rgH7hBsmdGIQka6zT2AfJbCmnt3Db6wum2XmxW
         6O6OHY0Gztvl18ezes4alllm3UQQow77/IyWDbtHQPf3ezZgp0at0LhxNWEGjeEd/43v
         58JlbN6uuuxjsgNBgXJavM+u7Kh4dAqS8zELZZFLej915OhW23TO32kxe03+EEECYnJi
         G/j9oq6Wi3Al5J5wjwIt0/Kp/PoM9kZw9ANCvfLK8Cho5fhaufFynC0+uNPlQgD3xcrr
         xYIiw8vrVThRQzlQbHOoPhnXbclq6p5zIb6GEqkGo0bNL5K4glGzTyqaGpsOO5hKT7hE
         byqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867931; x=1775472731;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
        b=WmPket7rm/EXjbaKf44qm5xDs7poyA/C0eFddj7oHMghyDTfRE0iYgTul/D0PWjK03
         lC2CLaeh50T7XuXQSFp9uFFYpJa7ox8T12Rfg/rFUKMeQ3MCmRFkoP2uKRnVCIdiio9Z
         gTyKWzr2meGHiOO/ECSe7+haz9zPtsZCocNFgSTG0QpDPKRmjZhKj1r2/pXpou1p9hx4
         pvfC+nr/ssePILyzpA/8gdDlMa1dINtpi7NQ6frZqAlOZjc70JY5nJqc3lN6YIjY9L/j
         L+v5vtrpCKe5jNOhbt5MjC2UkeHmkS/I2JN8l/loquk5FkppkC5wALXSWcfvTqwJqWK/
         I/cg==
X-Forwarded-Encrypted: i=1; AJvYcCUDJEqaGNj9irFc3qWXVrSfiOX7AwXowHJs4fMTZlpU/v6Gj2BNdSJkKLlh2OEKH59s3I31GK8VjoAglzxWtTkw@lists.infradead.org
X-Gm-Message-State: AOJu0YwV2ZcE/Rt82tGW9MlcF3OUYwA1BDrVOvpgj7AB3+4HXvM5Jkpe
	26Ft4JUrqBInwWF0VTeMISEal7R/a8V+rW7gyTylwL5ridU7e79smU+oZD1StGNoY6o=
X-Gm-Gg: ATEYQzw7nIhZpxr3tKSPxRC/F9tBuy4QNgR2PXpeHRl3x+LGWs2CVuWT+BAE/AbT3bZ
	zJ0LcsdWB8ux7HgYYiuCxio6BRmdHmaLi4HkFLWCwhrA0RvOtumPjNNIV3vq9hB505i8zBrDiHS
	mVxacGVO43OEwy33BMzuoY+wPVeHA0YV39DeBBf+JGYUSPw6/mR6mVXBotmTAD5dkpwkJIj1eFL
	92LS8YxL2TfzLrjynrdRsOW2PHr2ATjiH6oeLyFw601/Rif7J8ykxK6USb3N+4pen8o+4emVidx
	pfgeGflV0397cR0yK6+6UFoqCBKoKJl5Z3TIM2BT9X2IG5go+GKjJiyY4NQthhm+i0lhnNFoOQD
	cJeJh3SD4fK+hHc2mm65mLjuEdamcvtmhLnSyIO0mxptKMVtlJXsw9A8YL+lteiR80sR2qQks4m
	7FKnIR06Xo79zvNDQwXJBMVwOaujLT
X-Received: by 2002:a05:600c:a108:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-48727c82082mr167788605e9.0.1774867930830;
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm78932785e9.0.2026.03.30.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Message-ID: <6f0be0a71c74e7a7959e9ad02e93aff1cb8ef712.camel@linaro.org>
Subject: Re: [PATCH v8 02/10] dt-bindings: power: samsung: add
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 11:52:08 +0100
In-Reply-To: <177409897339.266364.69715997034739052.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
	 <177409897339.266364.69715997034739052.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_115213_238494_D710DABF 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Krzysztof,


On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:47 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/=
Documentation/devicetree/bindings/power/pd-samsung.yaml
> > index 9c2c51133457..3f1a2dc17862 100644
> > --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> > +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> > @@ -44,11 +45,28 @@ properties:
> > =C2=A0=C2=A0 power-domains:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > =C2=A0
> > +=C2=A0 samsung,dtzpc:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Distributed TrustZone Protection Contro=
l (DTZPC) node.
>=20
> For what purpose?

It is part of the domain.

Furthermore, TZ configuration is lost as part of power-domain power
cycle, so this allows a driver to take necessary actions (inform the
EL3 firmware). I believe this handle to be similar to e.g. the existing
samsung,sysreg

> Your patchset is organized in odd way - first patch for me, then not for
> me, then again two patches for me. Please keep it consistent. Or better,
> decouple since there are no dependencies according to cover letter.

I'll update the cover letter to describe the dependencies. 4 depends on 2,
and 2 depends on 1, hence the ordering.


Cheers,
Andre

