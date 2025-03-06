Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB7C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=; b=YKuErMxdMwITGLFC2cYIGJb9Ef
	R7U6ZOHcNCMdJf9WrJWlsgiX3cR3L69NAdsXndvkkzAldv5zF29tgnVvP70m8gX9coyLCp+DDuGra
	WyIrw3YwAwryTxjLdM4J+lAOiT9OKHiCPAPQoYFjRfA/FQqdregzxnv+dlSgoARGGZlIl3HRpzzpw
	kbOraYy20udaeyAEWkIb5dwoEefnw4mbzNrlqClxg5xYjKR/KFZyWG4FpnRR8ir1MDib49lRVczwF
	8j7RnbQ76BdVsu/bMmd757jC6VVb8EwzI983nl4DUvYU4kNDSGnnN/TFSRD8mf2qzcWxPW7Zm7yh3
	c33p4jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIcV-0000000CFgJ-3Pfx;
	Thu, 06 Mar 2025 21:19:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIYt-0000000CF5U-1Q7L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 21:15:24 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abbb12bea54so233145766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 13:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741295722; x=1741900522; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
        b=SctA2jJEmAdln3o+q8Cej0kt6iA9e/NJ1aB5vNhF3eLWrW0vm2zfOCw84O871OlMPc
         +w1tNw2nnFFL0ZcxoYsmFuEEfHQ2hhSqu/57E2DA8brMM+gOBNmQxywYO65hJgaAUdZQ
         f/sXggwsvVSextIRaFF9eyE0N2MafDzuf3YCoL8aso8qwgIWiyego46Z6KgVoaBi+HAH
         wW6YoIaNM7ODyA/DRaRQUo/3fC1LRi6N5tIG7iDrcRrW2VHVfWTpGB0tiWXyLS2YDaVl
         /Y8cdhIQZ+oVeIOLUukPRnGd/cFe4sQEGCL58e8Hysg6ipyPt4L+i9r9kFZvp0xyU6nh
         RrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741295722; x=1741900522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
        b=lQr53MVPp3M8+2KThjawvE1848BbxX6clP+CRSy6Y0pXxNfxMA/JIxaCcTK5pMlsSI
         bJ6vKH4dfEYkbzUREW+Ks2sqIVm/DiePfZ0ZrF9uH1XavilM8JI4eAvxkdYeQeVoi9EJ
         KZ/yN0Ju3NVpPLEkXy4nsGKHzyHN2BNwF5nZtPFts6z8ApDM3x880aMcbDo+cGtJnB3o
         peXOf/ql83JBmVdwLommru8k73YAMH6IC73U6iECQpu7GoTVaL0Aar3b3TUlCdWdwGZ9
         K+RrOBnh6wnzdBoFLAGbTlnfJtegSoYb9RFmtgEmzPu5L1RVQEEphf+2R0NdKSco7AES
         vaGw==
X-Gm-Message-State: AOJu0YzOne+osP8nG72b9hIAfhvqpXGZ1DM2PZy80SwhUuQvpFghosDc
	olg84KWfvK8QLgpnash2CqIRszT894J7V3OrJ76MgeXSLKClnkc5Kk4MpGihf70=
X-Gm-Gg: ASbGncsZ/1SUsks8EX715LipnwxZc3CZThu/IsWsL0+FIXh+jKlXUk/ib2Yq0ftm2Ob
	sb17szWHAG59G7GMx7bc9H6qsiHTuUFcRAfaXUK5f6rsn6oi0BRNa5Fk4Hr9GstBeq+pEC6hG+6
	PfO8G13dpJE2zujRQuPGjRHYc3LFgABwM9cFWIOPN0PMWKO9fTh6gOYEJRAo7slV/1QATxmWXY/
	MouomlUQQyh3kZVgKxMpAva9E/Nj8FC9jSrhEl46Ue0nhYEi51g5q3FI96LJfWJBOehV41cUmXC
	IIqLWtwCuMNoBSV/pYtFtdxny6qoOWhmkeZKOWLUT4vifMg=
X-Google-Smtp-Source: AGHT+IE+LHNfvlp8dFOhg8/hGQEzMaTOw9w3ZnSxV/FqKSm/TD4PkI2UTRYu6TY3+BOkP+WRqnVYGg==
X-Received: by 2002:a17:907:9490:b0:ac1:ebfe:fd90 with SMTP id a640c23a62f3a-ac2525980femr71342066b.1.1741295721652;
        Thu, 06 Mar 2025 13:15:21 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239887693sm152427066b.126.2025.03.06.13.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:15:21 -0800 (PST)
Message-ID: <1418fde488646160a1be14b2153e409488f3d861.camel@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:15:19 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_131523_392884_B70E0248 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>=20
> This simplifies the logic, and allows us to remove the
> clk_enable() and clk_disable() from the callbacks.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v2:
> * Remove useless init (Andre)
> * make it clear set_wakeup is conditional on bank->eint_type (Andre)
>=20
> Changes since v1:
> * Split code refactor & gs101 parts into separate patches (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |=C2=A0 28 ++--
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 201 ++++++++++---------------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A05 files changed, 109 insertions(+), 145 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>



