Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6442CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjXowdpk9n74trVf4bFjKOhIzSQvO0hzJM33XCmqiBM=; b=Fv7RDgQePfW0o8
	xcx8jqsn1zs0FcjCCDFx+e6Fp7LZCK1xZLvPqvprNZVTd+Hx9KvaQroW/uF6xIGs31fGiKMvQUvKB
	B0LS75yB9NsGZ/jkKmIZfKeeHpPLeGQ/9YGZ1PddTAzRB5+Exmlar4WQhNFjsQ5/mAeIoWtLUp7wl
	FaoWVyxsLHcCQp2vGnY6A98+LokXsvyfFyPuNv4yMeVh6aBDEWKzJspHjy89KxMi8sbvzB+8QR1Vh
	63hH95kWLS/XgmsXP0SJfII3c9pUCDsizVQDxqTWgBmysCtKP1znV554Jb+D4xG31Klec+FRXoxiM
	Ivp9WUDmeiQMgNP5GbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Tg-00000007fRl-3kvX;
	Thu, 01 Oct 2026 03:29:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Td-00000007fQd-33WX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:28:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 1 Oct
 2026 11:28:45 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 1 Oct 2026 11:28:45 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU AST2700
Date: Thu, 1 Oct 2026 11:28:43 +0800
Message-ID: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvTvWoC/x3MSQqAMAxA0atI1gbaKk5XERfVRs3CgaZKQby7x
 eVb/P+AkGcS6LIHPN0sfOwJOs9gWu2+ELJLBqNMpZXSaCWYOka0bsLrlODJbliUY+FaasjUI6T
 09DRz/Lf98L4fovR/emYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790825325; l=1731;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Qwwf1v0cP1lKAkuefRa4xK+nKzoRTdD8GOlUuQ48oL0=;
 b=2amv2tlwU+84A4Gia3y54ss8EMMFhAc0RUd99/JvaaoeO2sr60yhlMZBDIBaOiHLvUw0LSt9X
 Xw5hjObnlVOAlpS0coH5MYvmlHgyQ2hxpo6j3y4d9XPQhoOWK3uwAs+
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_202857_805699_662BC731 
X-CRM114-Status: UNSURE (   8.76  )
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

This series adds an explicit "syscon" phandle property so multi-SCU
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
Billy Tsai (3):
      dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
      iio: adc: aspeed: Use syscon phandle for trimming data when available
      arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes

 .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 28 ++++++++++++++++++++++
 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi     |  2 ++
 drivers/iio/adc/aspeed_adc.c                       | 20 +++++++++++-----
 3 files changed, 44 insertions(+), 6 deletions(-)
---
base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
change-id: 20261001-ast27xx-adc-upstream-34b3d9e8e27b

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


