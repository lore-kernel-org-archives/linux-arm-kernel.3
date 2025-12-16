Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC5ED5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ1Q9xpjmZ0IbGnnUc9X95AMbWEVhMfQyGNWaq+BcLs=; b=WUQFn0GdeX1gGod/RveYE+vZEH
	o2aq9pX7MjVPaC1EfqGpsq23MTLAyuUIWaJ++sBmY5LBrsb27VjZ4JaY6ItEwqfNyY10+qP0qSIxz
	OMK84jtGQvqGgyyAZmlrqoAtJSyaIenqHEf0I2/pYCVAoALzJjN//w6BpomTobejUMCVYBC+cWsAX
	ybjRXV2Z/npDAugAkNV1zarV8CQpa5kTEsApOvZHVr+F+qqlXRpPs2TBj9DCUrwa3Tzy7A6gzq36z
	WR9pOJ2tCUwVa2LDrBwiFIRjbiduzpjKmugZ+nBXMXTP+KfTrTeUdtfOnkjwm1ywUiLcwnDZPuweK
	0rCWi77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOzM-00000004oWL-15Ky;
	Tue, 16 Dec 2025 06:56:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOzK-00000004oVy-47Wy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 132D26018A;
	Tue, 16 Dec 2025 06:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698D3C113D0;
	Tue, 16 Dec 2025 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765868209;
	bh=LLE+QbRY67a3/8sNXwwh/61RXkS7dT2QF1fC3yE4th0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tzyGReWDlEwh1z1MM9HPsAadMFHBj6pWiaFRf2JGQNSOlAT86omY5EWbWke3DvzOG
	 Cmgdp3j5lXHC7Kw0ShflvgPJbXKH1SJf+s9JtVseZ1cGC/ZzRfFBHFc5sO3QCDjVX8
	 HHLhIiR7WYpjdx5a5BYtyfFCTzzapwEmsSahyvp4WYA4De57sm565lPbNwYIRM5V0o
	 RhFxss8uJWIh7jlcq/PiK/Zb2OXgEnnfUZFAHzSP5Xl9jjn1Y5Hb8YLGmUmhun+7qf
	 bxATBlUecFT3j95N4i/j7ZTPfaf1SptyMzAttwKXgf9uJKxn7VRRHNoQB9ws++o9eX
	 4yUq/ycQwbIQA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-samsung-soc@vger.kernel.org, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
References: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
Subject: Re: [PATCH v3 0/2] hwrng: exynos: enable GS101 TRNG support
Message-Id: <176586820615.20905.780207403546638829.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 07:56:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Fri, 24 Oct 2025 17:57:33 +0000, Tudor Ambarus wrote:
> I propose the bindings to go through the Samsung tree as well so that we
> can match the compatible with the schema when pulling the DT patch.
> 
> Thanks!
> ta
> 

Applied, thanks!

[1/2] dt-bindings: rng: add google,gs101-trng compatible
      https://git.kernel.org/krzk/linux/c/d9465635e051ddc0d9ebb312174ace55d38d2d40
[2/2] arm64: dts: exynos: gs101: add TRNG node
      https://git.kernel.org/krzk/linux/c/d45eafec01fa31fb9ab30902de35fbbe70f63411

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


