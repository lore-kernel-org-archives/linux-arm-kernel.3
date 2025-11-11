Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC22CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 01:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5mewJoIQ9I5i6Zffpud0DnmACjP1kf1tzWPjN0ebA8=; b=PdtBARx6j05xrRuyliJEULOoHQ
	/514TZJSfjiSIQc8qZuDQvz56XqZdcoWunC1hr9zkYo1j9QNsKBwrgwc+oaPT/yYucfD/ceWQKE2d
	pxMlYQ2BSv1nM51ESb/fceE6B+JD1/4qDfXfOOvPH6RDTD0uN6FoLCx2L6fxRcRhYvUsHwBmVJA3w
	ZJbljxfllrzVFshVRCcoVwywZxz794dkY14nQJzVe0kNGLjI/OWmDL1eQiPnmpVhFCQ5u2GeAvCqd
	gEoIig/x4CO+lZqVahSeyF/Ws2RmYTwp5YfLID0cJML/NjUE6h7CgWqpNLyy3+Qp2yHGhFMpHphZW
	BNCf7J4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdM6-00000006LB4-2FXN;
	Tue, 11 Nov 2025 01:39:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdM4-00000006LAg-3Eba
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 01:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2986440A69;
	Tue, 11 Nov 2025 01:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBA8C4CEF5;
	Tue, 11 Nov 2025 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762825172;
	bh=/hQhWs6fIWq4LVxZQYUO5IFlDz6QLmh4TLjAbavYSeo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cAvMRy35HQERZPOVzojVm2TlYCAXBcctFxoIXTcorOoTfHhvEszBVwiGaW4gq9sPg
	 K54ZxzmczCK6gDw3qHe8OLHe9nRHasdiZOsDEtJ37UbUk9xOdUC+8F1YNIyjUNCmd0
	 I04rD7EV4VNWJxhwUbFAdRCf3A5VA194KT7VVk45J2Kn4fSjcBgJJc9aQMfWMsQyBW
	 jJB38dVKnn97s0AFhIqGXOADW1OoqnKgG4Y/N8m389F7NC2U99v4HzIO4vJK+5ES1b
	 as9LbCb9N3fMafkzcQ6f3dbcqsiX8RQKdQuYbMXqXz/AaRo4/K7oxyM7eL1JzTaNfD
	 JgzrJ/BuVi+yQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org> <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org> <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org> <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
To: Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will Deacon <will@kernel.org>
Date: Mon, 10 Nov 2025 17:39:30 -0800
Message-ID: <176282517011.11952.1566372681481575091@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_173932_838420_8B92379B 
X-CRM114-Status: GOOD (  15.62  )
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

Quoting Tudor Ambarus (2025-10-20 00:45:58)
>=20
>=20
> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
> >> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> >> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8f=
f95e029c52436e5c7f 100644
> >> --- a/drivers/clk/samsung/Kconfig
> >> +++ b/drivers/clk/samsung/Kconfig
> >> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
> >>        status of the certains clocks from SoC, but it could also be ti=
ed to
> >>        other devices as an input clock.
> >> =20
> >> +config EXYNOS_ACPM_CLK
> >> +    tristate "Clock driver controlled via ACPM interface"
> >> +    depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_=
PROTOCOL)
> >=20
> > I merged the patches but I don't get why we are not enabling it by
> > default, just like every other clock driver. What is so special here?
>=20
> Thanks! Are you referring to the depends on line? I needed it otherwise
> on randconfigs where COMPILE_TEST=3Dy and EXYNOS_ACPM_PROTOCOL=3Dn I get:
>=20
> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko]=
 undefined!
>=20

I don't understand that part. The depends on statement "COMPILE_TEST &&
!EXYNOS_ACPM_PROTOCOL" is equivalent to COMPILE_TEST=3Dy and
EXYNOS_ACPM_PROTOCOL=3Dn, so are you trying to avoid
EXYNOS_ACPM_PROTOCOL=3Dy when COMPILE_TEST=3Dy?

