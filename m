Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004401061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=; b=Fv/u1NoG7mp4Eyqsfoizdm60rx
	RHgaelbIVfX75r9QjFU1cvkR/kotQuqr6Ncw+KI64524eyLyxsxhf0qfP59LPWIht2/ytEpoQb6gf
	w67/Gn25TZtugvJixK7JgihdaQjYnqFKCfK9C8L2bE4hzoMIzKWc/kxD/T38bYIGC2gV+RcsiSKSs
	dXF7onlAkFBCZzOTXSS+L/P31yHqsYemJBMPyTUZJ7J41XgjHtKvQv8d8vGyoiOjphtTCliBS5Euu
	pNIum5HURWNiFJDc/0gf7Ez8jLik2U9Ls0nAmm4tjdC0j3Rs5QXbFJHetZRDyfkZJsFMIOo41Kyy+
	Z10ZCVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W7y-0000000ClPf-2ngF;
	Tue, 31 Mar 2026 10:15:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W7v-0000000ClOw-3uGK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:15:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso5467999e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952113; cv=none;
        d=google.com; s=arc-20240605;
        b=Te3hGzkHo0wLyjRPaduENU89uyEqbmwNGA6prdUu8MgYMERvQCf9q5+Qa3GF9tZKDM
         iA7LuGMHAXJxATrnWxJ5rorQRh5zCRDprdJOfDmnFtrUfrxjVxNgtOfcfX8UMQrR96p2
         0DwDSoJAaAkDcYeC/4hMxSzFX0jd1ktyDeGNTBw+cuUlAWBFvbCLoctb55ZSAceNRKLk
         TdjAC/tOM1cJFKMqPxTqPwx6ZnXWYkaokEzpqx0fkXuORd8fY5ql1S0umRhcPIgUGuBq
         kkKA9yVk4JGe5Wn/dek5Txavzm+rT2ez7lJL8MvP7s+pvS+ORtw4oAOVlGQ967Y9pl9F
         Vf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        fh=gGYsZZVJsEeTNI24kuKSacFrhIpIolE4DkdSdZpT7Ec=;
        b=fgsUqZ4ppU88vVvCuIw1PG3kAda3SWDkCwYHTpE1lPB+ENFXLKQV1uanEv3Uc+t2ve
         Sx8flWmZxEDIATGeVAw7bD9cpz5IBwOT/C8xNr1vlTXKwX1mmVaG1Fc/jIppWFeYWG4q
         R/ac+2mMbXk9OOmqRsGAnpkEPHkMVT9K5ux2t0Mn7nTR6cUbc7P0JErhQJ7NY8YoNw+n
         7WtGlIQDLFsNb2nbiVQwLOr4F0/BXbcKWtlGccCRHNh3bTRPMzHYz4I22fpIsvScqnIG
         7ilKdl5OXFbEB98LYRCVhwein7cRWRjqQBnj3Ij6KCBs0yJH4vHPm9muXwRhoNi4dudT
         AFNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774952113; x=1775556913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=NvyfrSd7fLGaHmiYyvT7KWPdfE1COYswL0cUVCDqUz2Q7WoxSxhvbj7FC+UKbgbOoX
         ebwRZLkeXz6ZGmPjU8OD251gOLZStz+zQCEcwXWQvyoj36pRX9EY9cwKWFIdmiEqCDKs
         T7in7msT03bvhpdxAMejotZSb93jXf99Uf/uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952113; x=1775556913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=AjR8JohxQHxBBEmecWQpRSRaRoy47t8+w62x8D4UBnqln2IG9aRVxNUInEgpDZqdHo
         NhV+dnBv3DConjIN3O8r6V9BpqmKchqppsP9nlA/SWxgwOu1qqi4vB/FDtcAGIVH2s9e
         0bmwpy5xFuUr1TjciedQ3LnL6aYhIaSkogZOdl1I8cD3qVrAKiAoO6lnj1Zk0127jfc9
         2hhZm1OT5Xw3ad9eb/7STJwUdlsUljUuFwpR/uS2ESC8boP4MqjuW9XaZE+fXiZhNZgx
         TRPyy19nw/XtxKliGZ/vhqc57GwrCDgGL/zD8nLNZ+2YeP7BvcEcVBV9hDbByRDxfPY0
         auzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYRtcQ5dPDEXC3gcadg9+6aDvhOMxPUTqjnmR476uqLDTzVIQAUso7yNTimA0LQ6K4Ttyto+9x38qZxclWCFdL@lists.infradead.org
X-Gm-Message-State: AOJu0Yymi6jAiduC0ZM4LMmiN5/C0uHXy15JsY30rHGJTgIarSvd3lnp
	321XeDAifUkzxuoAoMEQBjEJi2XTkLP7OD4jZbdimDle+/8+SGOOdHjnX06czvV6qm8aFCtO/AP
	sudqKyDGY4yqiHFNrwdhvUwLSNjuTXuaTeXeWV5EM
X-Gm-Gg: ATEYQzwclXxnAIqzCQFniicuFrD7qthpUhF1t/WqV3n2F9x6ledb48wvuUGH7EWayrD
	eWRQhJ1hemuQf0OLHd+qrQgq7b1MnuBFNCEWQbb/1iCqTsvBnC+thhMD1lvs1FxPHCefwZWsziv
	19y6EfiQJczDv8w8BFiv3QBVgsg4LqdwVhgWStBI0itrSNwswdYkXgFzo0hd3PGwQxIAMrGIBy8
	8epgfN13G0Y5KoJaIwIACYosUS3BwDS+DsYPBnQN1ynDK/2lhM7ktzw9YUvvzjaWP/yZ4PCfhgw
	12wRuKAQxYDklQRqV6rTy4BGOG1kFzbLTzPtYA==
X-Received: by 2002:a05:6512:10d1:b0:5a2:a5f6:dfce with SMTP id
 2adb3069b0e04-5a2ab7ea285mr5687077e87.11.1774952111900; Tue, 31 Mar 2026
 03:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll> <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
In-Reply-To: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Mar 2026 18:15:00 +0800
X-Gm-Features: AQROBzCSfOwC7PpxPWsVcV8RwypXUnG7y9-g_GLDlmzGCrhYIDEBqda8qgwR7SE
Message-ID: <CAGXv+5F2nMwftF4JvXLuJr8Oz9VSoB1f1qq9mPcMYegmJ6BP_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031516_040683_D6EFE02A 
X-CRM114-Status: GOOD (  19.17  )
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

On Tue, Mar 31, 2026 at 4:36=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> > > -    required:
> > > -      - compatible
> >
> > Not really, this affects existing ABI and might make the child schema
> > being applied. Basically regulators node can be anything now.
> >
> > This is definitely not a binding we want. The syntax for parent schema
> > when listing only compatibles is requiring this compatible. You cannot
> > have here whatever empty node.
>
> Hi, it felt quite strange to me too, but that's what I thought you
> meant with your previous suggestion [1].
> To keep the required attribute I would be happy to reintroduce the
> compatible here, in the regulator schema and the pmic dtsi.
>
> Before I do that and resubmit, could you please help me understand
> what you meant before?

I think the point is that compatibles for regulator sub-nodes on MFDs
is no longer accepted.

Instead if you want to have a separate binding for the regulator part,
you would need to reference the binding directly.

Say the binding is at bindings/regulator/mt6392.yaml, in this patch
you would have something after the "additionalProperties: false" like:

allOf:
  - if:
      properties:
        "compatible":
          contains:
            const: mediatek,mt6392
    then:
      properties:
        regulators:
          $ref: /schemas/regulator/mt6392.yaml
    else:
      properties:
        regulators:
          required:
            - compatible

And drop the "required: - compatible" part from the common regulator
node bits of the binding.


ChenYu

> Thank you!
>
> [1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/10506=
0.html
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com
>

