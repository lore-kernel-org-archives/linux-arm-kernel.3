Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B81CD66BAD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 06:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYPE4ZNCJFy6FX0sE9ClVhGv4Cf/dafDkKNJVsMswuI=; b=LOZAMjubB+Ko/NFgxXNm+Iy8mk
	570VRF29/SSMWrTJfrlmVLfT898t/gmWSkO+r3g0UXAXQqc6oLazaJT/UZNjABfunVJeO2tqCnXv8
	vPTsGKC9F6RE46u1SoGezdT/XnUvJDsUEfXC7/Vmin5Q0xrrjKbyJOoYOl3lFcAaJqwBXAkK9Nekk
	mt8tZ4C3QdcVvaY1NNfkRVD66F5EQYic643wwXKWIEfZsCay1HJd/0VMr3PBDhih+CRYcy9qDqpaM
	KhIIs0bzeRpzgYxA9qzuxQrcJOXDQmxyimqHM4+tDmO0tGk+TRmUg99wHWAQiIlHJH2uoYCAxUEmC
	qNCcg6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXz3-0000000Enb1-3MLy;
	Thu, 28 Nov 2024 06:26:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXy5-0000000EnUc-06E5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 06:25:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so2714535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 22:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732775135; x=1733379935; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dYPE4ZNCJFy6FX0sE9ClVhGv4Cf/dafDkKNJVsMswuI=;
        b=iGZ5UgMoF02FHi4dZ/fGzkwHyBHo+b6euxEMco6qZbMpAlE4YQozw65i1awvMIdjZh
         Yfa8Tw2rt8sNmBSRlZz+5YpOi0CDw1VEfmxfEsHTtr2w6/dTGbP+0prT4ZHOhn41qMfS
         QuYjp7MtFxLEEGCpvGvH61ni5RbwcgJel0uwHuJ0DNbR6zak+HtYihO4eyeyQAOLoUmD
         gAvMOXwQJxJVTE2eraKke5k0QHV4tHuqCohQVfegoAEVlSNg/hLNI3xbHNriGfkh86Qy
         9UhhD5Vgn+iA3Pz94qgXC6UhD9SSvUPlHDNgQ+J1bFnL0+lhmM/R5aubKE/HERNUrTNo
         C9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732775135; x=1733379935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYPE4ZNCJFy6FX0sE9ClVhGv4Cf/dafDkKNJVsMswuI=;
        b=WVz767aMmpFN8dBGxAKsP3nXpVKQyayB/XyqxEb7NGfw+g3Eve/xRqpGscpEneW2QF
         fCrJoH1JD0udV8zBy4qah5UHFWUrzeZLVbCOwkksR76oi5ddPAw+2etohBFvJSPsLhQf
         UyKpkMd36/iCQv7//XGFs4ZKQVi2Kl4vbaM4kd8h1ZUu4yDf3g++qhWjsXZ9Zr3bWjig
         MusYp8Bv5OZd0QnOEKGcApNtkZqvFPOS7YOwt6pLJ3oGMA5ev+nEtT/jg/9kfJ2NEJRX
         18l+NaV3JndWP/Wz2wn7oolkd9c/XZx1szQFbMtPD4wErbVBZN3E+I7IGmmVEEm6+Rmr
         BM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW30fLHJSjOaiScZRmnHqQnmNeFQWJ1+yiKWDbeRQVbowmBMM3BeHHOP9KD0IHNU9h+S2Vvu+fSomdkSEfczDdO@lists.infradead.org
X-Gm-Message-State: AOJu0YziALz2w2Lgis4nRtwof/TK/AuRwgj8v8aVlfJBIhq24/GZhAs8
	kljEqYJWbLRI8/CDUTe6nrdNrbSC+DvLt5HmvRhy+oRwg4NMk86eFf89EEdxoHA=
X-Gm-Gg: ASbGnct1XcbE4E0RvZTGvmE6SSwFDVf2KrI0NCJf29LbLbmpCX7dHL563uH8zl0Z/eC
	meomWDqYGiNZiZicLBLaC/3qDyAiGAdrx+PJPVTy0SPaBMhpXYS/6ac5iSl+mnyME1u7ynbUnd+
	/eA2+YiGqPBOuSa01S0/uK+yZjYxHuGTCX+MTzbs6YnTP6TMHjHLWxaBKP2zGqwL0mrDjCOuNEG
	JH7HC8nYLuk2BmrkQJWbmpNKDuRV2oKM36/PgWcmhX0fmxNRMUU5K4=
X-Google-Smtp-Source: AGHT+IH6Ml7J+veNZgcHRluAVpujI8NQLzYAgYOdmWcaTC51mp1SAFlDYpCulVDkM5fF9/EPeYf0EA==
X-Received: by 2002:a05:600c:1c0a:b0:434:9fca:d6c3 with SMTP id 5b1f17b1804b1-434afb9efa7mr14137785e9.9.1732775135356;
        Wed, 27 Nov 2024 22:25:35 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db0bsm775126f8f.2.2024.11.27.22.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 22:25:34 -0800 (PST)
Message-ID: <8e11e1c92d81fa39a2881086dc58f6262dd719e0.camel@linaro.org>
Subject: Re: [PATCH 6/9] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I
	 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 06:25:33 +0000
In-Reply-To: <82f94ea4-2533-4ebd-a9e5-96ed64bfbc05@kernel.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
	 <82f94ea4-2533-4ebd-a9e5-96ed64bfbc05@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_222537_119503_597038D5 
X-CRM114-Status: GOOD (  12.36  )
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

On Wed, 2024-11-27 at 20:42 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 11:58, Andr=C3=A9 Draszik wrote:
> > We currently don't gate the power to the SS phy in phy_exit().
> >=20
> > Shuffle the code slightly to ensure the power is gated to the SS phy as
> > well.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
>=20
>=20
> I think this should be actually a fix with cc-stable.

Will do in v2.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for the review!

Cheers,
Andre'


