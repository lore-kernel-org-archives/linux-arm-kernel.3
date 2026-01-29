Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6849D358CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TreBPbYcd+qcEfeyzd9gSmsPnjmGM3aP8CkrKuGABXo=; b=BV+ZLak3zgFubKozBjgSpFLv/t
	prczPbQNeXFyCZpRySN4yF/8r31k4bsacqts5Nc7tTywib7vtBZvpG1ZjNv2uYaBaxG6WdIh73XIy
	mHJA39mYleq75pigbxmbCD7GeS7yFTzOwcdLBeiElW444tkrAoZh3AZjDYmJNEXIjSut6U30cLZay
	V+3NbMI9EoBtFffvOaNjoaQDXsDF/EVuSfTxsqCtoPhw14mw1u1+5nHLGfcSDEo1Xktmr/mPVKFP7
	BDDGKeJaw5uSqblE1p8LO3iNwjaTBDfqoCCnEpdH8Ujtm9mQ70iOSODYSxLD+7w1H38KL0xceMim+
	4ISWhqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMps-0000000HPfq-0Jyg;
	Thu, 29 Jan 2026 07:53:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMpo-0000000HPfT-2kv6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:53:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso5361065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 23:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769673179; x=1770277979; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TreBPbYcd+qcEfeyzd9gSmsPnjmGM3aP8CkrKuGABXo=;
        b=sL3iHY2mjBHVyO1vYYPSQpa43fVDoF4/9YhrURJEsOg0QLGvmGRiMJsxHqui6caYg4
         qplLQBACB6RsRfKIQF60doqPSEl8x47bCjsEt1atSaJCAJ2tRZuwSTqh55kb6WIocGsW
         A9NOfEbt2CrrnsM8fOd2wb35jCJDbWLidJSOsp3kvmYmX1l4+rwdU4GtjBQI0kQm65TZ
         9QPzArNUSse37foJpWdWLlSSWbxs475/vo2FIWWTNV4jgOGwZW4s1ilHDkJPTTdNvnl3
         zBew0ZtpY+UdVoXb8JLbacDDmrbect121sDMjy4W9t3mz7+wBRbOmsQgvfW8C0JJNqw2
         XJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769673179; x=1770277979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TreBPbYcd+qcEfeyzd9gSmsPnjmGM3aP8CkrKuGABXo=;
        b=dSdjGgZLexAA4AA6sCB+6u0i3t7PlHgDGDWU3WzSTqw7blNn5tqvTJNt8hHQhH/2Au
         HuXZ7WlzI2OKpFXs2J+NjaPYvjcUdzeTY1lDsNCxi0BIjQzh9lp/qWxm0xWPpFTtm5nt
         47FkyDpc0CZvzWwtsagwypJrLGFC6+NxevMXmYoFcMCu251k5rCfW6MqJ1/SHBzJy5s5
         /dtQGhvzOQ2tGsXKxEjiHLbgczfOEfjWlIHpvy9R5MfAOXEvSMW7aYvalB48D1K/lfrT
         CZfnKphKDgOb9fyfYKNOeOn9WsCvZhJdbO6w/2uZCyHys2Xy8dwWH4oa1bTAR+VC8o0G
         HpTA==
X-Forwarded-Encrypted: i=1; AJvYcCWSr+b7XS+KpbTxnB/Ox+FOy1JI7YLJcqqZN30tStm00qFzCHaPmtkgx1YNP5XW01HRA0K9Ia9uQIXtDzy7LeYS@lists.infradead.org
X-Gm-Message-State: AOJu0YxsVO93PonZZElV1lzvuBUpWYSohizOlTxpQjuyGtjNiX1FJ/q+
	7Ohf06yyxGJ+gQw+RbOUCvuDCE1FuR5VgkTG3cT6SfLjtx7fP8iu/azzWFssxD43ZaY=
X-Gm-Gg: AZuq6aL9y1r2EWRfk9djM1SEiAonrl2tF/Y2UprEzuuyIz1Gkn+BCkerQEgKRse/k/0
	ME+haFQtNB8uRcr0unRMna27cogbohCwG6Ga5RsPQD72on+XII8ZLP2BZukG8+bHZHDYZud1Yp3
	cKE3c3jnrrTgArlgORJiyn802MjMbc4YdoNe0gCkAPXykbnmeQwqdEZuPXOUiumxLLkFRbCYqAd
	GSctPyMNFO53aGw/X7Wp/6zIgtoNoufqYtdwv8mi0iXi1HzAglA/9Th/heBD2zMCc9y49NbBT3v
	yl45OdDHzdd8Q7Yjw8huYtnakm0XBH4KAy3TgEacTWj/mufx319M+FKIeO/jHELxstDHVFx0eyC
	DTJGuxcwimJM5R1HhIbqs1ZNkdiws+OdS4I+E7DWD1mo8tesfoRCO9YxfYBafAHvW4e4+V1I+nF
	TmZvDxBCSfAi246b/TNQ==
X-Received: by 2002:a05:600c:450c:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-480829beec9mr29095775e9.17.1769673178631;
        Wed, 28 Jan 2026 23:52:58 -0800 (PST)
Received: from draszik.lan ([212.129.82.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5d31756sm4253955e9.2.2026.01.28.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:52:58 -0800 (PST)
Message-ID: <3471955c681a8f9fb0ddf2dd421e1b4552dfbea5.camel@linaro.org>
Subject: Re: [PATCH v4 10/10] pmdomain: samsung: implement domain-supply
 regulator
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Thu, 29 Jan 2026 07:53:10 +0000
In-Reply-To: <20260128-gs101-pd-v4-10-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
	 <20260128-gs101-pd-v4-10-cbe7bd5a4060@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_235300_730598_D639357A 
X-CRM114-Status: GOOD (  12.37  )
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

On Wed, 2026-01-28 at 16:10 +0000, Andr=C3=A9 Draszik wrote:
> Some power domains on Exynos are fed by a regulator rail and therefore
> regulator control needs be implemented for Exynos power domains.
>=20
> On Google gs101, HSI0 (USB) is one example of such a power domain.
>=20
> While at it, add a to_exynos_pd() to avoid direct use of
> container_of() in various additional places, and update existing code
> to use it.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++=
++++++++---
> =C2=A01 file changed, 48 insertions(+), 5 deletions(-)

Looks like I forgot to include the binding patch for this, will
do a v5 shortly.

Cheers,
Andre'

