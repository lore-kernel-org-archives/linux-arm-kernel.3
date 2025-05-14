Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E59C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avCCqmE7kuFuDbsPlYm1SxK/weGyl9uo4TZeRAsOn/4=; b=W/syPib/vhGVvSHefTWFk87m3g
	3QJJ/tF8pUKQsUU3bYdm368hGfGjB2jPEruXmcbZXY4c0K880dMpNI9oEOZEyPI8NTjjBujlgtvcX
	wHprXVGPgjRhNLBbf1MCpbhTueO1uY20Lrc0QY5mtytnOocerPHCp8HF7fvEyHQQruMSL/cenRZzs
	H5Ob9I0uwEazviOJqDMrDT4doDXN4OjMFECMvvLMHakR3ndje91FzzRE94UzHX2SacLvryqGWpNBH
	QRssLBUniLB21NyjUq9IYqhOpc52+xjUZovVHjSBNmXF7ch8JtXKSomeSsWywuXoYPJzgBoG4+AxH
	q4TOQKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDeY-0000000FVIK-3eQ6;
	Wed, 14 May 2025 15:04:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQo-0000000EuYo-3Bzx;
	Wed, 14 May 2025 11:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7967244731;
	Wed, 14 May 2025 11:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659AAC4CEF7;
	Wed, 14 May 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222670;
	bh=0F01DWP26YYgS1PPdTSuMQtQtJxshmUQ6mSt4A+utgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BRQnb8WftKdlkP5oGSf5HoMasCRIMWeAvcu3TQDmCOC3I9ljErJZ6RTN1Tqu4i+Vs
	 i4F2roBZZ+D9qHJGbxdxmzsmC6KD7WYptbl8TWIeHpqeoc2EH4X4yhvuyHbGOY0pj5
	 +ILAZpFMrQ1kulgAj/8Dd+0RSQhCSyMG2OFC+fZkuKpqOh8LJQ+zc677t773QaoniU
	 WQEO0JRWkvSUBF1O+IMYIGYw8py4zu3KxAVkyos+kgAljVYff/qYTcfUIZWwRkuJWs
	 V4bR6U3I2USosOjHLPK/CMWSPfIcna51PUKDvLFc4SjA/bKbUbwHN+8B3mEq87Fn7L
	 iZJmK7OEQWd2A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v5 00/10] phy: samsung: add Exynos2200 SNPS eUSB2
 driver
Message-Id: <174722266707.85510.6309026442043319817.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_043750_824604_E4D7FF13 
X-CRM114-Status: UNSURE (   7.78  )
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


On Sun, 04 May 2025 17:45:17 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds Exynos2200 support to the existing eUSB2 phy driver,
> as well as USBDRD support for that SoC.
> 
> The SoC features the same (as far as I can tell from comparing code)
> USBDRD 3.2 4nm block that Exynos2400 has, hence the common denominator.
> It consists of a SEC USB link controller, Synopsys eUSB2 and Synopsys
> USBDP combophy, which are independent underlying hardware blocks of
> the USBDRD controller.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
        commit: 59cf7546079e3d08d105369c48f8834970290082
[02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
        commit: e4c9a7b475e5d0d9b2440ee48f91d1364eabd6cb
[03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
        commit: 8d3b5f6375466ffcd2cd98a0c84d31295470fe9d
[04/10] phy: phy-snps-eusb2: refactor constructs names
        commit: 93dbe9b5b3a265c7e5466c7b6ada439b01577de5
[05/10] phy: phy-snps-eusb2: split phy init code
        commit: 3983b4e9746da1b6091f1d9083f44ed3f12717cb
[06/10] phy: phy-snps-eusb2: make repeater optional
        commit: d460be705ae599c0cbfc1ee4ba6a41b225525609
[07/10] phy: phy-snps-eusb2: make reset control optional
        commit: aba7a966b50d11deeb3e2f1a66182d150eeb7843
[08/10] phy: phy-snps-eusb2: refactor reference clock init
        commit: e36a5d1ecc5f2bda92e4f954f41d65d1ddd5728e
[09/10] phy: phy-snps-eusb2: add support for exynos2200
        commit: c4098f3e6134e79e070ec44c58976e1f00d9bfad
[10/10] phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller
        commit: cc52a697f87e8b2d88298827aca3f81398385572

Best regards,
-- 
~Vinod



