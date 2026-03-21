Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BE21094472
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baI0dO0uF1neOcS+PcZV3emUyCqLAu2i9Ws8CAsCOwk=; b=iDQWQD+E4neUqzhCJea80OiseP
	q69ZBVl3kPODaICnaL4jTFnKqBKg7fNZCWnaab0vmTNOHvk7mkMfiVjPLOavMJOMxEtaCcXs6iKue
	FrLZjM3BgYKT5RZy8VX8I/eZrb+s6AJCGtcokp/SDUd4XLG+eBntuKAzSsycfLd2aeJf3M2S6K0+C
	uaxyERpTqMdcKmuvlDj+YbTmfUiOu0yFb7KYA+zuZVQWKWlQuF7qekf3QJoM9Ou7Uu/KeEYdRLKyl
	D6O4yZK5qn5u6oQdwGlxS4l+hNeIAAvex543A2D1om+zAYsXpY0wMo3DKMdjisrV+AyrC1Ufm4Yyy
	yDfwUkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3wDN-0000000EUgk-2JJK;
	Sat, 21 Mar 2026 13:18:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3wDM-0000000EUgc-0MKh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 13:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 854A1600AE;
	Sat, 21 Mar 2026 13:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E53BC19421;
	Sat, 21 Mar 2026 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774099083;
	bh=M800nNzUvv0zNmdxOy67LWqFXo6bvZJuekBLzvfcWyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EDlwbhDyHF0PzAdik8rVakHd3eUdZ9PyDC8gg3KYnibPnmGvndc0/T/WyHtmaTml5
	 X3SqDVfGJwBo+Qm5gBDURc1CnoEm5Um87c0huJYm3dN3YZcCcyJ4f9E/OyYZP7fApD
	 lb0YCk2fHZGsGZ2AJ7Nmn8zluiIQPvb7jWFaKuFZWU2ifsjhMzglWcEZrgzRGzOd1U
	 4D6Xo0TejsatJ1rDPCPf2GsFXU3roboU1Sa7aPQysyx3pDVjJF1ZrgryvNEi4enLNp
	 WWpuV2OLOxJfoelZkuhQXouiVtFpLRR6PrD6+hZktEFnIYpbN5QAFpesnIUHRxhnqJ
	 wTMCiip0SFggA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
Message-Id: <177409907930.268981.5882592990447577348.b4-ty@b4>
Date: Sat, 21 Mar 2026 14:17:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.0
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


On Wed, 18 Mar 2026 15:27:45 +0000, André Draszik wrote:
> This series adds support for the power domains on Google GS101.
> 
> There are a few differences compared to SoCs already supported by this
> driver:
> * register access does not work via plain ioremap() / readl() /
>   writel().
>   Instead, the regmap created by the PMU driver must be used (which
>   uses Arm SMCC calls under the hood).
> * DTZPC: a call needs to be made before and after power domain off/on,
>   to inform the EL3 firmware of the request.
> * power domains can and are fed by a regulator rail and therefore
>   regulator control needed be implemented.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: soc: google: add google,gs101-dtzpc
        https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc78f7cd87b861ba
[03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
        https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c551dec50bc78788c
[04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as children
        https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317d6e659cec9b080

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


