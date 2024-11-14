Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CCBD6A249
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DDE90TFUQidus4+uXN8t4eq4f+vB4yKXP8N40Q9rDE=; b=ZZ1IZx2y3GHnriPuGoHOGRfFbk
	kWdMHG365/vW5ehCaCI1W0AnjJ540r9C5WHb/VZtx9JChoJzliucXFl323SGXpPCXNNAQj2/ZJzqR
	WHwtVx5sjSuzzvLH0jR4B7g32Ax/PK6as3Put8lF4bV0Klz8vy8Byt87EvL1CLvB3bS5bJI6W32Hv
	gwBqb7EMSQeh69UQ8FITVu1a+Iu01p129mP3ACC/47LyR+KTYnG5VFoB8KnfSiHdXut/NgZbtVhaE
	1X23+0gHVrbS6nKn72ITDJt7v5f91S85MCJtY/4J7zEgFEPcZwLBq2ByOuKsJXSQHRSKCuJpgHFGM
	153kRJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiUz-000000010M1-3cGA;
	Thu, 14 Nov 2024 22:39:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiSb-00000000zhi-42zY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:37:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 400B15C0FED;
	Thu, 14 Nov 2024 22:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F769C4CECD;
	Thu, 14 Nov 2024 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623829;
	bh=2DDE90TFUQidus4+uXN8t4eq4f+vB4yKXP8N40Q9rDE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n1d0xC8eYss7liYDfNWOqdcx8/q2b8uLBUXXbncBy4Q2gJWW5A0CE71ouZS2MTDNP
	 SS1T3pMINoCCIVjB2XNGMbaX6QIl+qAXoCiQjjQrxtcGfQZyh4QFFTeIGaewMbcxcD
	 6IG2UiO5Bsfk1azzdjUmlcZ67Sgnd7uIQc+Cr0CqYpXDzgU1ZCB03L7wAJx1t+8tml
	 osWEzPSZW9hot5sQOm4pGhQLEfwQNO1Fb1kCyCLcRI9LPwUqma/v6MJvl53HQbuutA
	 y3wrDbUJp8bQ2rLFy5/qWYaqmECbaBWUjyDmkOJc/or7WCYTImpHRUM1dKpXON9yVi
	 rGLTRn45ItsFw==
Message-ID: <a69fc43dfe76861e293a936de3e0443e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-5-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-5-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 05/12] clk: mmp: Add Marvell PXA1908 APBC driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:07 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_143710_041598_6A86B117 
X-CRM114-Status: UNSURE (   6.43  )
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

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:07)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the APBC controller block found on Marvell's PXA1908 SoC.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

