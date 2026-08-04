Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F77AC55843
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDNd9DzFETq7zh1CKdTiu36YsT+TypRRNBpZkxjqnXQ=; b=c/fHyQtzFcbThCJGdfjDRhgoJ5
	MfcgaJxeWLVzR5P8pmzHhkPUs14XgQR5wmRviLfKVJRlW0XBj0GW+zevQ/WxRP0TRCRTmCOsETyDU
	z4Z4D0f94FbSQWfeSGDvIU1Izi4TwS8UUoUl6/Owkb8dK+2p8PNLR7x3nCdvW7DBD+tj1jWJ4vUzN
	dQoyD2evuTuncjiy1NYJ9REJTRegV2MW3TTaa3Xp7/LpmpkCX4TSwEjJfKaIdFo41nU5deGHc0V67
	qK5lBjOC0cokTUnQvqp35numKPWUX4eJGrtU2un9tbxgXmtwneq3qXvfey02A8xIIQyk2VNrKhR6U
	vduOFCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8O6-0000000164L-1bnS;
	Tue, 04 Aug 2026 06:12:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8O4-0000000163K-3NOG;
	Tue, 04 Aug 2026 06:12:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF20E40E13;
	Tue,  4 Aug 2026 06:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CA51F00A3A;
	Tue,  4 Aug 2026 06:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785823947;
	bh=NDNd9DzFETq7zh1CKdTiu36YsT+TypRRNBpZkxjqnXQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=nxPZb2ttW+AtHuTh7EaCmi5Q1aeKAz7A4kjEhHSkoXevYZkAJ1SwjC79NVj79bEWa
	 fCd21l42uHO1pst7NbEAeF3Y47viGm/7wJm2Hny5OjTrt/v8oor0eOWP1ZGoDEMWev
	 5gmXjhJA9orub5sQh/q266YYqEPxOPCNxmytLj8jtQRCPKIJo023NOmjJFZRuPFnGn
	 awRZA3lc/vHJqEsMODDZsvDBRxytIIbB0zgSFOTCP3WGyKh2Zq8KjWhI+e7NFH/M0k
	 gNWvASJsRldMDEYc4OIZCd63jzX85LRnYjia+qYpa2V3ax81eHV+IZyrFXdp8MVbhM
	 K/JtRdeQ35Ahw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org, 
 asahi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: Correct white-space style
Message-Id: <178582393779.12985.8100593791487064400.b4-ty@b4>
Date: Tue, 04 Aug 2026 08:12:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Sat, 01 Aug 2026 23:02:12 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[2/2] arm64: dts: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/7c78d6fa9aec67a72a498cda5cdbaced890cb038

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


