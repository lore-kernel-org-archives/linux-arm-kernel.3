Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED906CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mn/TCnn3qax+blQPsCpXCAr5QppiqKmNfNs2SNhPTyE=; b=HOq/vQb651ZJib
	DAmtFcnXAhUZI+KGx7vWN4aTWjIgMv30scomAFvbMnD9rLjmVX0Kh3yq9ptbw87WW/Xrv1Fe510Re
	9q3R9/aZCDGtDw4acEeBg3SA4CyFugIgkg60NSPInlYK6BM5BVT+PJfAQElERLL23D5F5vhl4VhDy
	Yr1cqBy2JUaYDYmYhUUyGNHhtmehQjcSpseex4+N3lnBu8rVBcGjwdkTyRxt45JbjWRUrD5CuvvYC
	kPOg9F1eqKX7sbZGGsIZCfUt2TB6e9Jf9Et1Y0Yn5SE6tC4HGX1FRS0oJaSd9O3JbncK1c5pSPfeJ
	6yngn2Wn0hbyGSuEoUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDR7-00000008QnO-1DDM;
	Thu, 01 Oct 2026 09:50:45 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDR3-00000008Qm9-2Ckz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:50:43 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 1 Oct
 2026 17:50:36 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 1 Oct 2026 17:50:36 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Date: Thu, 1 Oct 2026 17:50:35 +0800
Message-ID: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOssvmoC/4WNOw7CMBAFrxJtzSJ/YhKouAdK4dgLcZGPvMYKi
 nJ3TC5AOSO9eRswxUAMt2qDSDlwmKcC6lSBG+z0Igy+MCihLlIIiZaTatYVrXf4XjhFsiPqutf
 +Si2ppocyXSI9w3pkH13hIXCa4+d4yfJn/wSzRIHGOjKN0bqW7d3yQuQTueHs5hG6fd+/AxcTI
 L0AAAA=
X-Change-ID: 20261001-ast27xx-adc-upstream-34b3d9e8e27b
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790848236; l=2233;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XHbvVorMLz5K4/Iil2a7YFAg6vMcHZYbtiuuQiSNe0k=;
 b=i/tI1BJzfiDkiUcQwMt/rhJNaPcweC5wck+TdqspYqpZ4Y5MPP0Jhp10JReWFcUeOAqp0PQTi
 cBYPABhdVEQCuaeD8tkxpipGV1NaAx3bQR52X9jX/3a7mtQjCwy33Zz
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_025041_569215_43AED81B 
X-CRM114-Status: UNSURE (   9.85  )
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

The ADC's reference-voltage trimming data lives in a SCU register. The
driver has always located that SCU with a global, name-based
device-tree search, which works as long as a platform only has a
single node named "syscon". AST2700 splits its SCU into two
instances, syscon0 and syscon1, that share that same node name and
differ only by label and unit address, so the lookup always resolves
to syscon0 even when the ADC's trimming data lives in syscon1.

This series adds an explicit "aspeed,trim-syscon" phandle property so multi-SCU
platforms can point the ADC at the right SCU, keeps the existing
global lookup as a fallback for single-SCU platforms and already
deployed device trees, and wires the new property up on AST2700.

Patch summary:
1. dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
2. iio: adc: aspeed: Use syscon phandle for trimming data when available
3. arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Rename the new property to "aspeed,trim-syscon": a bare "syscon" is
  not a generic property per writing-bindings.rst, so follow its
  vendor,type-syscon convention
- Reword the property's description to state its purpose instead of
  restating the schema's required condition in prose
- Drop the extra AST2700 example added for the one new property
- Link to v1: https://lore.kernel.org/r/20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com

---
Billy Tsai (3):
      dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
      iio: adc: aspeed: Use syscon phandle for trimming data when available
      arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes

 .../bindings/iio/adc/aspeed,ast2600-adc.yaml         | 17 +++++++++++++++++
 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi       |  2 ++
 drivers/iio/adc/aspeed_adc.c                         | 20 ++++++++++++++------
 3 files changed, 33 insertions(+), 6 deletions(-)
---
base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
change-id: 20261001-ast27xx-adc-upstream-34b3d9e8e27b

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


