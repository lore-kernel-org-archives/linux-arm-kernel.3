Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73207C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNHJSaHujOpnba4UkNt0q/9Un0V870U2lCh6eig4pVg=; b=vEvn1EboUFdsiiTxiKt/sHNiDe
	tzjsdUXtyaKZJNNKZ1QhpJD8CD9LYPfmxrCq1GxQWBeVTQGZaOJu74NCJiyUzkDNT0Av7g7HwDlJP
	4tZb1pajq21+VmB0iEO2RP41dHwplIEbkUMotMoqfIs8Y7jmAEU19bSYzcB5gPy93Wg9kioBJDOqf
	84KuCx/m+vRFON2YdddW55cSsaHYDZJwbIolOS+BDv3Sn8d/mzWHoRmQcrrVobUyrh8jRjrir1V1m
	9o8zYk08SM+1Dyz3+X/hVrO54GodGu8nq9c/liloPTwwDC3AO0FkSMz1FwhQspA3Hx8PNhr4xtAXf
	PjKfBTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiegB-0000000CMSL-3q9i;
	Thu, 13 Feb 2025 19:15:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidll-0000000CBmw-1FUR;
	Thu, 13 Feb 2025 18:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B5A3A4285E;
	Thu, 13 Feb 2025 18:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEE0C4CED1;
	Thu, 13 Feb 2025 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739470620;
	bh=QLZRApTrn4O2R9Ogb2JhlUkm/5ex8J5sTyiNSk7EKzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FAvQM0YQ8e1kNEkDs7XTsZeSyNoMSVt2pjlJ7sOfzTT/SCVjI5jgV17A5FCdhmTed
	 8z1F4uT5DPqUR8QRmx/+plKomU8Kx4nzCDjyrQ3/UkimOgannIQBYyFMb6zkepjGOf
	 XDdhZstfdnaKv86qW0+J+MlRPGX7qT9DuzbnZD/SrQGnF5heZOnEwApBCsOXRqsiV1
	 L0pUqS3MEXZA5yFw6K3agIhYwJSnzJ80YHALS76pzL/6IO0U4d/b3T81qeyKXXr9VR
	 islrjn+Ln23J2TlHIe5NsP/QHweIFsy1p9huv2qy7DRo+vnsCxzQlFORW2oK+CVGCG
	 oD5NS+XE8WHZw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
Subject: Re: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Message-Id: <173947061417.294083.6730012157242194658.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 23:46:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_101701_399575_0B469376 
X-CRM114-Status: UNSURE (   7.67  )
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


On Fri, 06 Dec 2024 16:31:00 +0000, André Draszik wrote:
> This series enables USB3 Type-C lane orientation detection and
> configuration on platforms that support this (Google gs101), and it
> also allows the DWC3 core to enter runtime suspend even when UDC is
> active.
> 
> For lane orientation, this driver now optionally (based on DT)
> subscribes to the TCPC's lane orientation notifier and remembers the
> orientation to later be used during phy_init().
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
      commit: 642b1ed4cd184d5c2e5814c220bb93453492644d
[2/7] dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      commit: c38528812c2e9b05fe8b5fd1f66cf4c75835a38e
[3/7] phy: exynos5-usbdrd: convert to dev_err_probe
      commit: ee064390b82329df7fd8e0c48da03a8fee7d46ce
[4/7] phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      commit: 21860f340ba76ee042e5431ff92537f89bc11476
[5/7] phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      commit: 0bccdcb3eea93e087887027ff374dac5c3de36cd
[6/7] phy: exynos5-usbdrd: subscribe to orientation notifier if required
      commit: 09dc674295a388e71192430b6f9c3c5cb0eb47da
[7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)
      commit: f4fb9c4d7f94dabef4abf2209cf840dd1c9ca11e

Best regards,
-- 
~Vinod



