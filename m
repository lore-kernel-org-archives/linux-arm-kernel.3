Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49916E8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FHQpOUTyV6cn8MmC0EdhLEVAT/F/j+Kj3+Ou+RWtofI=; b=hz5t5pceZ3MME2Ib2Crk9ltU5X
	B/0qHaUnwMEmpQR+TV+ghwZyvOsUjPS+39KJxiOoQ0+E/oAZ3s0uX1pD7cv1CaFMdQA8oHDFmpNbJ
	RT3hzfo4MlHN40dmGdSF47CM0d75xTZ2Fyn5QIACZSUtpVtJX+V1iEW8MPTadd4JupaHSztS8EgHD
	HiRg5VjrpA0pSQh3HKat8hp/xqxnPXzilIjrpiAn9elF3MlePvYMm4LpF8pI1eS/yuRLFiLWLEQGf
	1/1qMxtRK3R6BT9kwlFfB3F8eehanyKlACqSEuP50Iqj7KdxU9YEmlj82bDF70bAUAbkCZ8NJ/7OI
	vlfaXsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHnv-00000001ZsI-2JSK;
	Sat, 27 Dec 2025 00:05:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHno-00000001Zoy-1QtS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E794940348;
	Sat, 27 Dec 2025 00:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A4AC4CEF7;
	Sat, 27 Dec 2025 00:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766793898;
	bh=l+eK+53HFS6Nf1N+WzqWh69/CWIpr9CIKF2aOQzhUPE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qjQQ0qIUhWW8aOCRi5zJ/5DhGTXTBop1xqdqUVTkTSgfmmPK2JTAGt447hxrJIEev
	 bw759ytgrtFQeMAGiOP92vvIFUsQ5I3yh0ppgpxXexT0YtQodXauWZ/I02qC1nh2bI
	 dKdXNxOL31FhMToP1Z/rlP7ESrf/xVDfOo/5xj46tfnDc9kl1LpuiLxPqtDUgObwwu
	 wdlxBIrYNkKnAKg4Blscs7yY3CvxXqpUlNHQv6/AhVGz+NhqZEnjLoU59t0cjyEOus
	 EwoF5K2p5Li0g7o/tijVjY0SckGsMJNzJ9PLli/VzWrPJjv6dUzxLaA8zWtrBbQTjR
	 OtE/S7BHwHScw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C9CE8FDAF;
	Sat, 27 Dec 2025 00:04:58 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v3 0/5] Introduce MAX77759 charger driver
Date: Sat, 27 Dec 2025 00:04:20 +0000
Message-Id: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIQiT2kC/23NSw6CMBCA4auQrq1pB/rAlfcwLgoMpYlQ05oGQ
 7i7hZgYo8t/JvPNQiIGh5GcioUETC46P+UoDwVpBzNZpK7LTYCB4JwJOppZKSVqmtfBYqBaQCN
 BdlJyQ/LZPWDv5p28XHMPLj58eO4fEt+mbwzKXyxxyqhsAKtG96oX1dl6b294bP1INi3BRwCu/
 wiQBWhA1LVmRmr5Jazr+gJoktcj8wAAAA==
X-Change-ID: 20251105-max77759-charger-852b626d661a
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766793897; l=3010;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=l+eK+53HFS6Nf1N+WzqWh69/CWIpr9CIKF2aOQzhUPE=;
 b=v8dBC0vdvLgYRAJ47ZiiomwUGFw58iVgkYJp8pVD8h8B/j98E/xV5G2OAoJkxhHyABv8ppu86
 +eTiiO+nyNoBUrO0p1xSNVV8iuFkwjHAduzkWjeHkoNWM4+jH9ereWg
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_160500_447719_6FDE8BD5 
X-CRM114-Status: GOOD (  10.16  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

MAX77759 PMIC is used in Pixel 6 and 6 Pro (Oriole/Raven) boards.
One of the functions of the MAX77759 PMIC is a battery charger. This
patchset introduces a driver for this function. One of the unique
features of this charger driver is that it works with a USB input where
the Type-C controller is TCPCI based.

Changes to the board files will follow soon once this patchset is reviewed.

For reference to the MAX77759 MFD based patchset (present in upstream):
https://lore.kernel.org/all/20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org/

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v3:
- Had incorrectly folded the charger sub-device with the pmic parent.
  Corrected it. (Krzysztof Kozlowski)
- Link to v2: https://lore.kernel.org/r/20251218-max77759-charger-v2-0-2b259980a686@google.com

Changes in v2:
- Fold charger binding in maxim,max77759-charger.yaml to its parent
  node. (Krzysztof Kozlowski)
- Renamed regulator supplier & consumer. (Krzysztof Kozlowski & Heikki
  Krogerus)
- Removed explicit setting of irq trigger types in max77759 driver.
  (André Draszik & Krzysztof Kozlowski)
- Complete bit definitions for IRQ registers. (André Draszik)
- Consolidate all bit definitions for charger IP in mfd/max77759.h.
  (André Draszik)
- Modify the handling of charger IRQs such that regmap IRQ chip handles
  masking, de-mux and acking of interrupts. (André Draszik)
- Remove unused macro definitions relating to Charger modes in tcpci
  maxim driver (André Draszik)
- Add dependency on Regulator class in Kconfig definition for max77759
  chg. (Kernel Test Robot)
- Link to v1: https://lore.kernel.org/r/20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com

---
Amit Sunil Dhamne (5):
      dt-bindings: mfd: maxim,max77759: reference power-supply schema and add regulator property
      dt-bindings: usb: maxim,max33359: Add supply property for vbus
      mfd: max77759: add register bitmasks and modify irq configs for charger
      power: supply: max77759: add charger driver
      usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode

 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  16 +-
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   4 +
 MAINTAINERS                                        |   6 +
 drivers/mfd/max77759.c                             |  91 ++-
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77759_charger.c            | 764 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h               |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |  54 +-
 include/linux/mfd/max77759.h                       | 202 +++++-
 10 files changed, 1091 insertions(+), 59 deletions(-)
---
base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
change-id: 20251105-max77759-charger-852b626d661a

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



