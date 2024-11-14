Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF5D6A254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXxdqGMJNbAakgZf80bd6MEsav7ou3gW/Zmc9xNKV5Q=; b=FNGB14O/TZq+OzVatOg/3vq+6I
	e6Bw0mbVHFnWB3gsRyvAsi491E+XTEMH4d3jZNTlrTZ7DnpE3avEXihv2GeHJPnVXnKM5MpOQTozI
	kZ1X6DX6HAdA8Eygo2ALwKZaDN1H0omzE4QvMGLcD67qypwHk4lrFo7vxqfHOOsBEujSi3lF+OUIC
	FgL093TBdmKunZoGyZ54YanipY44RoWFtZboMDaLlQSrIn12bO3ulcWmHuaw9VtPvS4dUZVgOiqWW
	aivTwLQtO3KLogdWsALTijDF+MnfPVarFAqTgtHk00LwosgQIRN/QnYSzRaxznRJHxLGDbFpjqrcm
	K63t9CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiVu-000000010Vw-2BWY;
	Thu, 14 Nov 2024 22:40:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiSj-00000000ziz-3hRm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 156D0A41A81;
	Thu, 14 Nov 2024 22:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BA3C4CECD;
	Thu, 14 Nov 2024 22:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623836;
	bh=vXxdqGMJNbAakgZf80bd6MEsav7ou3gW/Zmc9xNKV5Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XFzfQq3mW5HTwzeyeudVkRVC0SpKnQv+MkAxYCkQ7znVfbb6+V52xA4kjYm8OrJPN
	 DnnYqbUDcP9MuVrgK+Yabs3rCbfGoTGX1qIYTSnKhBq2ixhiE0pX4ZArngIH/+J2MG
	 XqMc1H0YaX1rlJYB4qQmYcyhlZteDjxtCjuvhcoGxM7lBtoAjftf4AeFOAN1jGQS0Z
	 V+c0aSJuN+jBblHAUuLRwX53hoVN71c0G2XevGsBw6wQgFlR1/0TnCSlZtYqrKSPJ3
	 rybDI2QCTjSKfhEojutAsJ53JR8w6gDdn6kFuXj42+NGbeR1nNy5B+lGx1MIWxIhU3
	 sTCFn5Wi9l8MQ==
Message-ID: <d3768c0f91a324330051ae8f7f265e04.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-6-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-6-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 06/12] clk: mmp: Add Marvell PXA1908 APBCP driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:14 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_143717_981715_EC84643B 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:08)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the APBCP controller block found on Marvell's PXA1908
> SoC.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

