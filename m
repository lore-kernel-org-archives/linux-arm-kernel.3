Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFBEC28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=; b=C0Cl9ICwf1xL7LNL9NN8/L2fEM
	1zd8UCfUw/3DbgUtSmN24/nROQfFkidh6iSst0Drz6KcUycLFndOUAE3dHYfONw+2exEhbJf4S+Ym
	AK4GjhC0s/yT4YQGvrqQHFK7yNiJZwgd5aNfbInXwYc6CcqCtdprNeH0JjFwDA8gndYdFlj7bEmCl
	DJ1UllMMwiOE54O1P5/eKbir430rroxmkMYS8YVTkyGxEkmOzzvQAJrvVFEOWW81w9jyeS1i/dByd
	DEXaXgH7EuLQkcJPmmsXxpwDNuqg+LtsYu6DrFGAr06tOUrWvAdF/DDyKgMT02j+jE3PCFj5admQ5
	Qe7BVZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIln-0000000CGlZ-2HlS;
	Thu, 06 Mar 2025 21:28:43 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIiN-0000000CGKr-3Qql
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 21:25:12 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so192937466b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 13:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296310; x=1741901110; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
        b=wDsmO3k03SfybzqEh/l6gCkljz/rwrC2dlSYPgtCDBAHLpXutt5V0bmelqr38KHcUg
         5YGSVePL4RmUvoNFHsRgB1zkkGvE0I6VaQc1gtUjuDwDshwujCEmsh17y0IJv7l3TnrC
         aUjHz3rO/39rmliHJ49yaFtzTNNcywmXbk0YHUsOt0QTXFE519FOCOqlAgvI47U6yVPe
         prcFxHylk4NFrqzt6nDngiZU+9CsWkZNWM+PYUsHBczu4z543U8XjF6Af2E12Arl0UOD
         Y3KC/Je6OcHssA0yabLfwOTqUbeJm6VHs2vOrOmk+heLCU7BQgYRE1xal/bVcnzS9itj
         aRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296310; x=1741901110;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
        b=nuQ6JvFRP3lpFGPipgDO4W11uAOwotiU0+Z5ECPBHRH/1gAqfo4Lx2kIx6hTQTMWCl
         Q+CtUdrE1qJrh1Y5VV91ccosC4JAw7fB5eWIVYFdYfH/7Cz6yxbQ2jixWQy+3WfTnVqH
         ZNWvzdngHiBp/qi8RxAmN7ZbWMNAZkrmTSEiFIVbUxo5eyQYRU+8+jpqe0YYIadKCLbn
         ussId4UH57i8vELzsIT0T6yE9u8t/bApjhz/VstopiTLJTmxymrvUHH4dy9WSU+AFd3o
         XR8MX+L1cn83/c5wk4trP4CtNF33GiDX+SEf7qd+mBOLvkKF++bU2UO2bVNNxaGi4lYA
         fRzg==
X-Gm-Message-State: AOJu0YypPWz2BXvS63fZrpWrxDUfIc+Dm3h/YN258PFKASV+Lqunaqvs
	CQaPLg+WYZwYuMmrOSesw/fDYYqpy/ggXAJdg4M8d7Md+yJ0SQMUZPqE8WuuYeE=
X-Gm-Gg: ASbGncs5Lu6O89SeBc1j7c5d3En+x6Vxx2sbfDjZwCR34hBZBW8IEQUFMvMM2uXPE1a
	f/DNAzeAHJM4+PX3r2khoPFEyRNk8bCpTSg6dcpaFcp+rGuzW11h2IvWePfEW8QUuFoU3+uzfxt
	gqVBsEOi7g0r+Hv99qI3sgttQM/YvXe3hhDWwMiHSD3WTs2T+RMPAITvrsPa5jivOzzaiG3Czxr
	tp5pGIuag1NH48bexLqQtnekwX2IUaqcUEUF0BB8bJMpTFQD97isnfuyns3wbqrPR1/V1YeSCqz
	a8S+4IkvlDsxLh7C2/kd7C4LHqBhy1H0eVAlSxiURNHg/2g=
X-Google-Smtp-Source: AGHT+IEfkrY7UVJaq0/ND9NEi5g0hc9ml44W1eaBzgh92FLmrsjRrsJKvCEmtLb9GKZY9TgjXouEaw==
X-Received: by 2002:a17:907:3f9b:b0:ac1:ddaa:2c11 with SMTP id a640c23a62f3a-ac25210ff7emr88036066b.0.1741296310064;
        Thu, 06 Mar 2025 13:25:10 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d7da1sm156779066b.174.2025.03.06.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:25:09 -0800 (PST)
Message-ID: <2c1cab545cd3b57a2155df2e87ad9830b2b94ab1.camel@linaro.org>
Subject: Re: [PATCH v3 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 21:25:08 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_132511_857777_16564360 
X-CRM114-Status: GOOD (  10.59  )
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
> gs101 differs to other SoCs in that fltcon1 register doesn't
> always exist. Additionally the offset of fltcon0 is not fixed
> and needs to use the newly added eint_fltcon_offset variable.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org
> ---
> Changes since v2:
> * make it clear exynos_set_wakeup(bank) is conditional on bank type (Andr=
e)
> * align style where the '+' is placed (Andre)
> * remove unnecessary braces (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 70 ++++++++++++++++++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A03 files changed, 84 insertions(+), 12 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


