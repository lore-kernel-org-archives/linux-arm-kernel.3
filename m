Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7FEEF48E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M8dnnrrcEDHnIimVUAM15GI9TwFy54Eqb719DGpYZB0=; b=nTeFTJ005U+6Sv
	LkuPpJxG4ELvOAQog1OQyuoir4cevwEWMor4sQihCXWXQefHz/PwoYK/L41GKr+M2byDpKC/Vmdjv
	fX/rqtTU7gkkdNtYvmp7Cw1zGAn2bVL2/IKbSnssTjQkkN+KTae/+nshZYiSzEMLWe0KcKwe95LAK
	JH42rdX9oB7B0upJnRJXNH8FmFcsJxgOaxB8OEuHPGL1Unc9RkRmqkcKJIw9FXyX0otZsKlufYkUo
	Z5JyMtqoNS0xiaEenpViCnjhT3FVeO2GZt2RrC0Qgl3wk/c5lCv+P7OEAhi8NEZfK5JNzu7VtNk+r
	p+0p+3jZZuubnnX2S9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoNJ-00000003A02-1VBk;
	Fri, 13 Feb 2026 08:18:05 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoNG-000000039wG-2GLl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 08:18:04 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Feb
 2026 16:17:55 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Feb 2026 16:17:55 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH RFC 0/2] pinctrl: add syscon-backed packed-field pinctrl
 driver and DT bindings
Date: Fri, 13 Feb 2026 16:17:41 +0800
Message-ID: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXejmkC/x3MwQpAQBCA4VfRnE3ZEeGqPICrHNgdTGlpV1Lad
 7c5fof/f8GzE/bQJC84vsXLYSNUmoDeJrsyiokGyqjMSCk8xerL7ejFrjvjLBeaiVS+UEW6LiC
 Gp+NFnn86QN+1MIbwAdRy5kxpAAAA
X-Change-ID: 20260211-pinctrl-single-bit-da213f282c95
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770970675; l=2131;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GyucnYRddM+KPEwtfmXcesurg0IS8btBZhDNqZcs91M=;
 b=wnr8PkYCiaj6qIxDNo2bobprHQFZzxKZe4ITj4bP2A7etp7tWDxgaI1FFV0ZkCF8v/Mzh9EvQ
 i9jFMJZ6T+wBt80YTsSiVUTiqGAEBSJYEh8C4XVx4HGcMDlWw2KJ+jV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_001802_583770_3573F69B 
X-CRM114-Status: UNSURE (   8.35  )
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

This work follows earlier review discussions around extending
pinctrl-single for bit-per-mux / packed-field controllers. Based on
feedback from Linus Walleij and Tony Lindgren, the direction was changed
towards introducing a separate targeted driver instead of further
increasing the complexity of pinctrl-single.

The prior pinctrl-single series is at:
https://lore.kernel.org/all/20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com/

This series is a replacement of that approach., targeted pinctrl driver
for controllers where pinmux and/or pin configuration are represented as
fixed-width fields packed sequentially within shared registers
(packed-field / bit-per-pin style controllers).

Although pinctrl-single contains support for some bit-per-mux use cases,
it was originally designed around direct MMIO ownership and has grown
in complexity over time. For SoCs where the pin controller lives inside
a larger SCU/syscon register block, using syscon + regmap-mmio provides
a clearer ownership model and naturally avoids MMIO resource conflicts.

The new driver is designed to be instantiated as a subnode of a syscon
device (e.g. SCU). It obtains a regmap from the parent and uses the
child node 'reg' as a window into the syscon register space.

This series includes:
  1. A generic Devicetree binding for packed-field pin controllers.
  2. The new pinctrl-packed driver (derived from pinctrl-single).

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (2):
      dt-bindings: pinctrl: Add pinctrl-packed
      pinctrl: add syscon-backed packed-field pin controller driver

 .../bindings/pinctrl/pinctrl-packed.yaml           |  166 +++
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-packed.c                   | 1168 ++++++++++++++++++++
 4 files changed, 1348 insertions(+)
---
base-commit: ea24857a76ad90632f86f1e8c8465f96c9f2e407
change-id: 20260211-pinctrl-single-bit-da213f282c95

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


