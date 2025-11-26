Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBCD10391
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+vJ8EaE+nu0lIUJABRQHfDnIDkTZEuMj0mTHD0scIYU=; b=pX6vXIKo5hW0QU
	Z0MMp83Il77J49TYuXDqlQGRxXx1JXA5m1Uv5oFedX8fv0RUf1uwP9iQW9z8RQqivGntlgGHHndxq
	jdPCSTJKxRmbkNfXJ1V0kthUgfH53Q6xDOa4KaQIk6VFT7cH3Ue4GI61RMR53Vg+vhp9jOhj1nuTn
	2Kwl+xkg0ZIQvIOX/SQtUtAJHhxcq9BwK4g/r5I6Aq3T/0xtppjFS1QCSWAztZ04fFup4dWS3R/Nj
	u3h1/rnAHmEnwSjRhhhQ1Tiy0shRO+mo58LggSClwuQhUwnRPhnyQ6hPh1SMsSDFFHuFnhBcPnG29
	u3rkIE2otCPDL3xcsfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOArP-0000000EbLj-2dDj;
	Wed, 26 Nov 2025 08:26:47 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOArN-0000000EbKy-1I6w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:26:46 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 26 Nov
 2025 16:26:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 26 Nov 2025 16:26:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/2] Add AST2700 support for Aspeed vhub
Date: Wed, 26 Nov 2025 16:26:29 +0800
Message-ID: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALW5JmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNT3dKC4pKi1MTc+LKM0iRd41QjAxML40QTU9NUJaCegqLUtMwKsHn
 RsbW1AJvgbwNfAAAA
X-Change-ID: 20251125-upstream_vhub-3e20483a455e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764145590; l=793;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=7cC5jeCkWsYO33bINv8Y064Z31IpWkHiFJYzubZI4AA=;
 b=vEIO1LfVfQsPoR4eEKhpTG48ZIF//W0qo8MEjrlqB1chhzuwEI/NdKsBkFpT4MhOn0WevIT6E
 yUvLUm5ZfSiAy8uqh+Uh6cFFrNf8ODVkst3oLi1RJDHX9pHr0D+kZPu
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_002645_356264_04EFA4FA 
X-CRM114-Status: UNSURE (   7.14  )
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

This series add Aspeed vhub support for AST2700.
The AST2700 vhub requires a reset and uses 64-bit DMA.
This series updates the binding and driver to support these two
requirements.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (2):
      dt-bindings: usb: aspeed,usb-vhub: Add ast2700 support
      usb: gadget: aspeed-vhub: Add ast2700 support

 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   | 14 ++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/core.c          | 30 ++++++++++++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |  1 +
 3 files changed, 45 insertions(+)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251125-upstream_vhub-3e20483a455e

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


