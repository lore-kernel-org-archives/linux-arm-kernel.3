Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB73D711CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5aRZRL7X+tA+KXtvBFfVO9edv1vT7Ahv/kSzyVBfEdM=; b=UFG9Nx4O9NOsN3HM++dVxqonwX
	x0CviIiFqeKWRp0T/E3QUkr/272cGcSUP0KnIShQpM9taDMUrrS44Igqdg4fG6hD7hYbdOiv+VAFh
	kBbiO5ov0kiSfPhWz12RKeZW/nzMybdaavz1h6MfaMmONTU9vAivk0ObmgPIA7QokME30j3KHs1jq
	t1/P6Y6FNpWZBxwfaPN0MVK7EUusmTShIm5m3QyCK4VxNWlTECypeyGo7fCfDYnsUjgyse/QmWdN3
	D7ptGCxdkxyTlameuKN7vFjzXwshm/L9JCOCSMAOtXMr/AEawMUIIXBQnzpeJXZkMzUfT72IqcZff
	YYiwtZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMob-00000009HYS-2HAF;
	Thu, 18 Dec 2025 22:49:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMoZ-00000009HXC-3s3t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 22:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C73366000A;
	Thu, 18 Dec 2025 22:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DCDAC4CEFB;
	Thu, 18 Dec 2025 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766098182;
	bh=pC82eqfu76ux0epNJS8FANzPY3la5Ggo/hStiOoB+QU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P4N4329jBsieS0MZQ6LxlPi8MMKSXiCmyyfbw9FmN41j0alMPNg5l+ifYgk+q1GHX
	 LnjJ4qx73Xf0ZRsQuF7ic1ardmZvE3UDa9tQY6Cz2y4HWRsZtfXp0jlHnvW/uONxMK
	 le4L2bySs1j+ejnZ/6etp7K/gzO93zCl7IwcbiR5x+0OgLs1K+vVHMDHSv/oRK4sQh
	 irIb//pFreKfo8sSg8jUC0xWABuXFwo9TqZkvrJuA0Y77l3vWPdJw8hkfT1CIzDGjm
	 9DjZPxdYM+AgydzV8Tpd+IeFCcn4jJjAIr6/D0soIBSvffoJOnTm7Mu/+MxF3z2QNs
	 QEQzWBfPBHrzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DF7D711C7;
	Thu, 18 Dec 2025 22:49:42 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v2 0/5] Introduce MAX77759 charger driver
Date: Thu, 18 Dec 2025 22:49:05 +0000
Message-Id: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOGERGkC/2WNQQ6DIBREr2L+ujTyK2C76j0aF6IfJKlioCE2h
 ruXmu66fDOZNztECo4i3KodAiUXnV8K4KmCYeoXS8yNhQFrFJzXgs39ppQSV1bqYCmwVqCWKEc
 peQ9ltgYybjuUj67w5OLLh/fxkPg3/cnw8i9LnNVMaqRGt0YZ0dyt9/ZJ58HP0OWcP7Rb5wGxA
 AAA
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
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766098181; l=2751;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=pC82eqfu76ux0epNJS8FANzPY3la5Ggo/hStiOoB+QU=;
 b=lbIcP1LKHq4okfWrT5bO3wyYxZA3KbK+ci7CLSJci4yPIY5/UBu485YUDYXZH2kYUaC/ilJUh
 n7d3iDhvCvzB4ythXTWSquSkPeS7zU2RDKTAZblumV4kLTUkXOMmcc+
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
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
      dt-bindings: mfd: maxim,max77759: add charger child node
      dt-bindings: usb: maxim,max33359: Add supply property for vbus
      mfd: max77759: add register bitmasks and modify irq configs for charger
      power: supply: max77759: add charger driver
      usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode

 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  33 +
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   4 +
 MAINTAINERS                                        |   7 +
 drivers/mfd/max77759.c                             |  94 ++-
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77759_charger.c            | 754 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h               |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |  54 +-
 include/linux/mfd/max77759.h                       | 202 +++++-
 10 files changed, 1102 insertions(+), 59 deletions(-)
---
base-commit: 39f90c1967215375f7d87b81d14b0f3ed6b40c29
change-id: 20251105-max77759-charger-852b626d661a

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



