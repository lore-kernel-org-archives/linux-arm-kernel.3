Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF06FB3CF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=; b=yr0NwEgKK2jJh6GEgEhZ4BazYM
	3l0/uube8q+QHubuhl8cProd7hcLD6b8dGolGxkFP0ZeXPRkVr4tktNT/CM3nlUQxbJkhxNO/wJ+q
	lzdWKp+ssZSMM2A21trTNEqzlTFy5Z+Gz/9ltVMMnp5xdz/272O6lyZ9mZijFzZe/k67Eyqjgn1LR
	44R39kIpudrm2iTLTXvB/nCzTYj6FG3Fpz1sy0czU4DAMf9Hod8lNPeICm5O4QHG4cst01z+Qupn6
	PUzoPvXuaU8IUYiqsiuiB3MDlGpX4Y2FiswCkchc1LTaHqFL6ajzpPaJpI5J9kid4hoF+0cTEoVoc
	zQpjTPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79dN-0000000B1zE-2KSn;
	Mon, 30 Mar 2026 10:14:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79dL-0000000B1yF-2rht
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=; b=OpOjqUExRUd97AMDGB1w27XbQO
	+6jrB8DpFjbr19YcPmnKTrj/bF3isizuUcXF8+7bXG0l/gTroHFAzsN0HJq/QO2v3XbDrYZjjuqtK
	VK7lsfkL3uTSLEUvIqdMcvvg3bni1wfJZnioze+g8LINljzGGGxyRuJmd6YR4nivGm+iqWTlfJDtb
	9SvfedTVs9HLUZlCS2utodLNrCd/bk0mCyy0TYfCWuqpaK6bCzUuIEnAtZ2xGDOJLhNKzq4WSYa0H
	JmnKJjgbqCefg4mdejMT/ur5Qt/CErQxMFfd8iyxjJ99aKP7AYj78CWT4Dt1HJnlllnnEqACsjNas
	mycZZsjA==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79dG-0000000DXUW-3mPr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:14:09 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59e4a04f059so4323114e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 03:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774865637; cv=none;
        d=google.com; s=arc-20240605;
        b=lVfhf6ntl/Sp1A6honu6O9AVNEOKr9SrOVr8ADs9onKpeH5PEVewxO+7PYCL8iuWbd
         8Yrpd686aAFFnPei9K0QnI3CESWlOAL7CLA/oicVg4OYZK1zLXqtP49jZKQHdQ7nu7zq
         CzK/XVMVU2Vm7mT4HR74OzTUWZbRBfzwrt3L3i4qXfQxHF0A3zJTvhR9ya8KZ0HQp0Yv
         ZZpjutoH69WcJw6PQ0ViWtU9uhqYzibDl+X088+nsWB+3XtTQdFCvoHCjNIADCWT6Xwe
         jWTlSqWKwIg8puNw8+Fl32xriTeXaynEgqV7KBkfaZ0VEZwYu9a7yaOXQSJWHKsnpOcQ
         F41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        fh=u5mjqESIGx1Wn3M/YGIOaNUvjH2LhfYgLAvgq+T6niM=;
        b=cgFRlVcBFlD1AWMx70JcYQbr9Egl88fxGQ0H99rHB9VXmrWl+ViyN5abIkhpQDS96c
         F1JG2/pbxIFgON0YhGfqgS9/YjEJCAoi31xkf7hpestXvbDoRfHfiPW5WYLiHO7vX5Im
         dvWakQX19/riRW+MtOPALOavg/arEuV6un6wL2yMGNV0GBrJKZjv5zG8MfQpJh1+B08F
         k9otMcmO74mDjGPNt20IkJLi2y08S4rCMhKx+YGfh5xXMbzzYHqBb84qA7EDJ2h4dFN0
         FBceThuhqKPkimqpcbC9FebqVmsq8fIkPxye9nWeKR10jfOZ1oX72SsEGyF8OE0sYnIj
         NYaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774865637; x=1775470437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        b=VMOtB6tAp5YyUCBOgNv7aaC/uQUsZsLTrn7PNkezVoFjKGgpvkPlq6ECxoUO3ZeYIX
         OG73Yp2SZS0OZbpbEWqIMiOdwlOU14AxlfoCtync9Ap1sHoAqI+HqBmolM8fBoub/btB
         WwwOu4x1uGp922m4VaFs9xr3KbnBYDe9/HLIV3Y/01uj5Gn5SQZHFQo2MFI4dDU3X4pe
         KTJH/awYmUNlD9xImW0pz/i3dF4l3QZ63QDWebAvuX0VPrcssG9o/Wdrm/WOyEITfn/v
         84iwOS03gjsc0+W4zgpiOuHqXbMuiUtxPZDJERs812N558zaeiNI8IIym9CYfQo5RzWl
         M8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865637; x=1775470437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWtl0HJjBJni2u27bxpNg6crCSE9pGY/Ablms6+Q03s=;
        b=iw+5F7LmdEsyaMRTCYA7ZBzpW16hYECulCT0jJE6WCLvYpLPK6TIAFJ93DnWj3RwQ1
         +kzO1pN8Ke6P43zpgfqGhFu2ms7gqWDPrJifeBrYbQxd7Ecpt4KldfvEstTN2OC6MyKR
         zYDqxX8KBxiiZnThVGgdy6Fn4qnCjebdAzB9JI1vKfCFDwfKHZIReOYrX8KClS3t5Q7X
         nBBJK790NuiLpCcVjz05P0tDusF7xCQAVXB/pHgftyyw0Hz61x3k5Iv07Asn+le6PjnG
         x9znDCnyrG7Wes7oOBMCwsAs2DqUP4qsMb0eycr5WAz0KJFEiLdjPphaTHoE2yPQJxHQ
         y3xw==
X-Forwarded-Encrypted: i=1; AJvYcCVhfTaqHl7guiJXXR0bVikRXN44oMJ7JivFLgd1uCACLX0n7DKZl4d0b5YQidxb6Q47ftC1Ec7/YeaCa+MmKUNG@lists.infradead.org
X-Gm-Message-State: AOJu0YyfP08jn7k4UIDb3cX9gQHALIX3JPvDREcewyLu7meBoS7jsgLs
	pR+s8hO6+01HZQsFUHpOjXOmJUTDpcbvZPfuPuJT4/J641PCxr2D/yf01fR45ykVxCjhpEgvxhN
	V3XpD63Qt9rG7w/6sKbrTIwUezmK9vQt8hyV4o/PP4Q==
X-Gm-Gg: ATEYQzz0uR97WD1VUboxbg8x3PcgoRHrsMGu6CDow+GLYzKp4LlEmy5b+vIqOlRpuNg
	mZ402jFRJcVdjiXKcgBdwo4kl4AoNCOoh+gR4yLFhbqKO8O6rTT3Lxk1I9zare1HR54mFm6bLbR
	19+jmGsDv9k3f2KNj5lTcNCg719lJZnkmpFZnb393BMQqkV2GbXFRRNzvARzndyz9pf3sKlOfQB
	QiB8PLyZRNjZ8sTjp0lsLzM4kmwRBaCSyMetMdYI08EEejh1OVcm5OzOtSghGPARcOpyKjz9nTZ
	NS7tbGUJ
X-Received: by 2002:a05:6512:3d05:b0:5a1:3561:519d with SMTP id
 2adb3069b0e04-5a2ab7efbdfmr4713361e87.8.1774865637404; Mon, 30 Mar 2026
 03:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org>
In-Reply-To: <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 12:13:21 +0200
X-Gm-Features: AQROBzDdVJjqE87T5ud7_fnM2lD6hQfK23pJY5_ZrG8f3bl6KZeUN4yLdyWW2BY
Message-ID: <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_111407_497354_D57A3A8B 
X-CRM114-Status: GOOD (  22.66  )
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

On Mon, 30 Mar 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 23/03/2026 12:13, Ulf Hansson wrote:
> > Hi Krzysztof,
> >
> > On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >>
> >> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> >>> This series adds support for the power domains on Google GS101.
> >>>
> >>> There are a few differences compared to SoCs already supported by thi=
s
> >>> driver:
> >>> * register access does not work via plain ioremap() / readl() /
> >>>   writel().
> >>>   Instead, the regmap created by the PMU driver must be used (which
> >>>   uses Arm SMCC calls under the hood).
> >>> * DTZPC: a call needs to be made before and after power domain off/on=
,
> >>>   to inform the EL3 firmware of the request.
> >>> * power domains can and are fed by a regulator rail and therefore
> >>>   regulator control needed be implemented.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
> >>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc=
78f7cd87b861ba
> >> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into sep=
arate binding
> >>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c55=
1dec50bc78788c
> >> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as ch=
ildren
> >>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317=
d6e659cec9b080
> >>
> >> Best regards,
> >
> > Usually I pick up the power-domain related changes for the DT bindings
> > and host them via an immutable branch called "dt". If needed, SOC
> > maintainers can pull it to apply/test the corresponding DTS changes.
> >
> > That said, I am open to whatever you think is best here. Perhaps it's
> > easier if you can drop the DT patches and provide your acks instead or
> > if you can share them via an immutable branch for me to pull?
>
>
> I did not pick up any pmdomain binding patches. I picked up only soc and
> according to cover letter there are no dependencies between anything here=
.

As I understand it, they are all related and some even depend on each
other. I think keeping all four DT patches together makes sense.

Although, as I said, if you think it's best to funnel them through
your tree, please do and then share them via an immutable branch, so I
can apply the pmdomain driver changes.

Kind regards
Uffe

