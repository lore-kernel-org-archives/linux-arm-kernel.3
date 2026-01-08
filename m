Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1279D185D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=; b=3EJCY/q5Vuncx03QbU1GDFeDco
	fhUGo+sQS2CbsIST14H6V5C2xUYaoUncPQmpBWcYnbyURu3xdw3wZvA02YjbauggZ4uD0bjA4D/N0
	lxy7Ck2O9g24OEh/nlgQmRnXRBmfkIxayfxCpgG+JNSo8EvzJdxGXQQ6HcD+SIRTAwWi0c83fDM1W
	KRpAVHHOLXU/6AF5O9HXM35xYxTxDxa5gM/czVKp8sGYC+y+8sCE78Ozf2up1QJLxu5fkFBdfGKYz
	3TkVmo21+FBu1nU2T/4hyQwQaeME+/dijv0XmmaIVCr0K1coyp7lb76TKwjm1JW6+mwNHVBpxX9yj
	dq+3MvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnfe-0000000Gk1f-047K;
	Thu, 08 Jan 2026 10:55:14 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnfc-0000000Gk0h-1Kuk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 10:55:13 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8c24f867b75so302692785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 02:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767869710; x=1768474510; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=;
        b=F7Smn2CW7ZIYUuPxRYEvp/Q9xDKRQMm5LQW7tbqA8Vgc48Nx6nZOIi08byY9WeHwnb
         QY/3LkXvtRN4Wu7s/tp6coQUVR1+8ZrY4/BPbPRIknIJhlROEvbjNzm9dXSJSEPqT3Wr
         X0S+nQdyP/Di+EsUA6VkrTreKEsXIXFDorUDkiM9mT9KthWqE6jwC7fVq9dmnBwnSpFj
         cUFhdDtTqX9Hop3DP8Ll43x6Jy3ro7W3aGyvq5l9tCRxreaNgclSabgPpIpjI6+eGXM8
         jm39rEkz/3+R/4NP4ZPnoS3MwRbmLo2YCeaXe9qTEfeeXK1M7OUtOcqzon/TMWaXOqAT
         meRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869710; x=1768474510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=;
        b=iRH1wBQ99DWLdIwWnmFM+k1joA/0krvIzCnXyVpkAQCiiNhLVnlDpceAXyAuTvIVht
         Uv6wu8F3GNzXSzj9XwLLLBwbpUPJ88ad+K4EG1CD9Cc8FGSzplNV4kwIDTWe1Y986bIv
         89RayYM1Oecs14d7AJAt/JtneoMYy6d6DF+/AH7mJIWp2peaPciuXHGLG6IUOkEOR9bu
         6hTvIzA4CC8NnF7Hl3aHtfEAcE8vSyRe1KpJPN2MdV/aY+ymzLIkYM1XIrntPJ/pyw+0
         sxJE4MhjzIHJK9C9ygQvqu+eY3LDDG6BvBtncCiGV6U8yC4EasmIflYsZ2hJVxTpvyJU
         gOGw==
X-Forwarded-Encrypted: i=1; AJvYcCUNy/wNrpmYpIRFQ3xPfsczQaDCH2isUJNYecwWhganTUlj5R3U/JEnN2b1Z8mZdthINz8RTljsZGTBnMqMr70d@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+MBf8dVMjmqAH64+9/8li7QM08pPEaiYh/arhsSwMF9LVAWl
	p+zmJNiDM1aZhXTqehrrjnte7L4lcGoW3Ky4Ougs4dmTTZ5xe7csq6Vo1vPHpYstKSE=
X-Gm-Gg: AY/fxX7DFyfLW2JTucnVa1C+ZoqIXFE5AEbH1agqBHPICpPPs0E3qJ1S6nb3Emt/1Ge
	PCxldPA1pzNjf2VwNtZWQdJDXGTZmrggSpf02lW8dLe/Pm7tKZrbTNuFeyNfxP1clJJEhf3x3Aa
	CZGqMEXUD68Kv9MHlI8bQkMw6YUsfGWJiE5m2rqJSTzU8FYad/OjTEtZaAtRLo+QsMRDOvbkBzI
	dRJOlv3+8LVxj6Y2i/k+7/HzqU9U1I5wvnubWXoW95fYhJs0GKLp2ff6MFlh4Y9QmWltMV5f4Zz
	Y7GXylXhLkI/ZBhZKmxobtJxS6dGXpY6T0GcHksNspjXrVjJCFdLvVas2ey78BBTVzIBO0Uatwr
	w5HhteSmw2268J53kzFKcQup2JWghsxVSnHLqCx46e32B15Xgim72rWdX8KWeFU98EC7TtwO3Gs
	DggHl5LQmim++A5uD3ZnWQIDhAO7rg
X-Google-Smtp-Source: AGHT+IH+RaIZdxo2LBIZtEtzdVtnDlJ9INeZCwV1cPG9NK7uPV6RGwucuqTJ9BlmjvonRR2RJ30qBQ==
X-Received: by 2002:a05:620a:45a6:b0:892:8439:2efa with SMTP id af79cd13be357-8c38938d982mr647120085a.23.1767869710344;
        Thu, 08 Jan 2026 02:55:10 -0800 (PST)
Received: from draszik.lan ([212.129.74.168])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f400b59sm574557285a.0.2026.01.08.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:55:10 -0800 (PST)
Message-ID: <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Thu, 08 Jan 2026 10:55:45 +0000
In-Reply-To: <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
		<CGME20251222103019eucas1p2c60f033dc02adfef360b4fc69bd4021b@eucas1p2.samsung.com>
		<20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
	 <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025512_391991_52D9C075 
X-CRM114-Status: GOOD (  11.62  )
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

Hi Marek,

On Thu, 2026-01-08 at 00:59 +0100, Marek Szyprowski wrote:
> > @@ -334,10 +456,20 @@ void samsung_clk_extended_sleep_init(void __iomem=
 *reg_base,
> > =C2=A0=C2=A0=C2=A0 * samsung_cmu_register_clocks() - Register all clock=
s provided in CMU object
> > =C2=A0=C2=A0=C2=A0 * @ctx: Clock provider object
> > =C2=A0=C2=A0=C2=A0 * @cmu: CMU object with clocks to register
> > + * @np:=C2=A0 CMU device tree node
> > =C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0 void __init samsung_cmu_register_clocks(struct samsung_clk=
_provider *ctx,
> > -					const struct samsung_cmu_info *cmu)
> > +					const struct samsung_cmu_info *cmu,
> > +					struct device_node *np)
> > =C2=A0=C2=A0 {
> > +	if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
> > +		ctx->auto_clock_gate =3D cmu->auto_clock_gate;
>=20
> Do we need to issue "incorrect res size for automatic clocks" warning=20
> for every legacy Exynos based board? The check above should be in=20
> reverse order:
>=20
> if (cmu->auto_clock_gates && amsung_is_auto_capable(np))
> 	ctx->auto_clock_gate =3D cmu->auto_clock_gate;

Good suggestion. I have one or two cleanups anyway, I'll add that as well.

Thanks for spotting this!

Cheers,
Andre'

