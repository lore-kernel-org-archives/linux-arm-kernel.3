Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE3EC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKYseCVUwAsrRbAPoZQ6d4d90WKFCcuz+KWQSPJljBM=; b=N9sQficRLVzomGf1nXllbuaX4o
	YydfqG5LQ1WflcbSYL7a87bxkbNg0CBSyOiF927IcnycMtMKp/UrNz8d2yBhBIeA9JP9itKmCvq1Q
	PQINoSG4NgVafCqqdCFNYBhozn+BE9odNRXi7cbx40EV0z42BqFJBcCfdMjtv3lYsCcwuNEsmj8WL
	O4NThJ31y0fBvPNx1KLubYxOsmREgZlS66gI1nOxmxWCkFrpGW++f4uUWCXkuIBlD8CdmdSJwJA6U
	0ubqaFdl7da6MZQ/Hg0kQPsY8r0cqQ8OToXGp64OpxErwqjD6WOkwDKENTIAJFY5XWSVsn19PoWgX
	VNMnecIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Nv-00000001609-0fGl;
	Tue, 04 Aug 2026 06:12:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Nu-000000015zr-245E;
	Tue, 04 Aug 2026 06:12:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8A77600AE;
	Tue,  4 Aug 2026 06:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5487F1F000E9;
	Tue,  4 Aug 2026 06:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785823937;
	bh=PKYseCVUwAsrRbAPoZQ6d4d90WKFCcuz+KWQSPJljBM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=jJsCxs8dQHMV4VZQ8X3uIxwKM22zfav6Eh3dBkIPsBuhofxUa/GTB0aNqIi9VGlJN
	 vfhzcJX0T+0uZHaR0sR4Y3GXjzFmHy4wkxd3tCB/70KjJbKifuuYaC8NyHQ7iaPUHO
	 wccqNKHTXcsE2fl5UZa1L8hYHgX9XzWewAjrevp6+ihVv24SRnjadFMJm+jdPx7RzL
	 e62FqrI2krUrJHnia7WWri4gfBC3Kmi+tBYmzPud7zr6g+T3Y12bgUzwurhWbAo7w/
	 pzvD84R5B6llP3BlF2U1qpFUW4sRuRpj5efx8+4+OkJMNmCOKO8MSSk6MmLh13y49t
	 zHPCknuf0UC9A==
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
In-Reply-To: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: Correct white-space style
Message-Id: <178582392607.12985.6150713140771675075.b4-ty@b4>
Date: Tue, 04 Aug 2026 08:12:06 +0200
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


On Sat, 01 Aug 2026 23:02:11 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/2] ARM: dts: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/e2b3acf8c227beda488f00d06f1266f83b9b5c08

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


