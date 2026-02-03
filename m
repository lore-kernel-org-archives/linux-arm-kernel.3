Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0354DE8B377
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 22:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pu1o2sLuIeml04NmhwiHNPjvgUHKuziuIqGVjJEEt1Y=; b=Cq1W4mN7/gYTNa+Z3AWIIfcNtU
	GrflLDI21Pnsajm/TTzk5HDHbfqJ1Va4ywmH8Ydh69hG/fyxV6+9QthE04eSNpnzXP3uIztyHwWM2
	KKusyX8im3wixhXn7wp7i1DE3GAWmuqFA9uNXIC64w1QXtVTxXafUFNYti2SqZ4WAbye5shSwGPNz
	X4E21kLCfZKV9CE6G5ixza/nYR7hAGdx/cpfuOC+cTStrp78c5R9rwAExe22ovT/RNz2UwGVgAC2w
	325c9uiiize7CaEdhS8JIVPNLy4ggRXC776+ro8Ubrzn6ufsbJmCETKmmxM6xrnO14FCU0nTADXD4
	Yx1qPpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPEu-00000007VTF-2nMm;
	Tue, 03 Feb 2026 22:51:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPEr-00000007VQe-31PZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 22:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26E094352A;
	Tue,  3 Feb 2026 22:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9551C116D0;
	Tue,  3 Feb 2026 22:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770159076;
	bh=2Zp4rfp0Kd9kcSVQR1ZIa4DmydM+c0c7shcAIyikU7A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=o+kVPJgJSu104A9qJIXi56u4Myr8yWfO+GjztEaD0os75dpQTDGkNwnx/FK9E/eeD
	 GGq2o8OW5LypjXNnKk9SUqrO2ZfVw6XYnf+pqUBamvD72bj1qtFVspe0g20twQkcmc
	 g3gFBsGN/rzCbZMdVCRUxADk+MIHqn6JRSsjl/hCBBmdUU23z4bahwBsX1Pis+caDo
	 pxeMjn2BvGaf6Nmll2XSjunuaqdUjuGxfOC/sGnftyvyhQ419X3hiTMoa67O62ZsNf
	 Wd0u/bb7ZTUuJLSYtXoNGaC/s0Afu+lZrBYaIMy76X23fzeKjlTg65pfqoC+Mczbb8
	 37Bs2MFLXTFwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDE3E8B379;
	Tue,  3 Feb 2026 22:51:15 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v5 0/5] Introduce MAX77759 charger driver
Date: Tue, 03 Feb 2026 22:50:26 +0000
Message-Id: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALJ7gmkC/23PwW7CMAwG4FdBOS9T4sZOwmnvgTikrVsiDYLSq
 SpCfXdSBNqm9vjb8mf7LgbOkQex391F5jEOMV1KwI+daE7h0rOMbckCFKDWCuU5TNZa9LK0c89
 ZOoSagFoiHUQZu2bu4vQkD8eST3H4Sfn23DDqpfrCoFpjo5ZKUg1satfZDs1Xn1L/zZ9NOotFG
 +FXAO02BCgC1IDeOxXI0Uqo/ghgN4SqCGiYyHTYBA8rwbwFUuWIDcEsX3gDlWlcy63+J8zz/AC
 pCmSfdwEAAA==
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770159074; l=4473;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=2Zp4rfp0Kd9kcSVQR1ZIa4DmydM+c0c7shcAIyikU7A=;
 b=Dtgr9lcr/dlkSXzh1Ur4nnrsfz78a9WBtTSGMMnyXbFZRL7me9qe0JZ76IStrkrSmiCdz4/kg
 43jvKAoSL9WDTxuxfZn6BxTZ55ad8Pnh+B9ZA7HEdO9z4Lq67MtB2of
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_145117_801991_7BB97FAB 
X-CRM114-Status: GOOD (  13.32  )
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

Dependency list:
Patch 5 depends on Patch 4 which depends on Patch 3.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v5:
- Use linear_range library instead of reinventing it. (André Draszik)
  - This requires a selector_max value so modified mfd/max77759.h to
    include it for CHGCC and CHG_ILIM.
  - Removed "reviewed-by" for Patch 3 (mfd) due to above
- Use asnyc probe type. (André Draszik)
- Retry mechanism for psy_work. (André Draszik)
- Minor nits (André Draszik):
  - Use named initializers for instantiating structs.
  - Use static qualifier for `psy_name` variable.
  - Refactor if-else ladder to remove else handling if return in prior
    "if" loop.
  - Remove redundant `unlikely`.
- Link to v4: https://lore.kernel.org/r/20260121-max77759-charger-v4-0-694234c8ded1@google.com

Changes in v4:
- Removed a stray tabspace in mfd/max77759.h. (André Draszik)
- Fixed the following issues in Patch 4/5 (André Draszik):
  - Re-order Kconfig entry
  - Refactored to not use global variable
  - Use of clamp() to clamp values instead of duplicating logic
  - Return IRQ_NONE for unhandled irqs or error conditions
  - Remove debug messages in irq handler
  - Refactor code to use dev_err_probe in *_init_irqhandler()
  - Remove unneeded irq_flags
  - Check return values of regmap ops
  - Other nits like newlines, not using greedy init, using print stmnts
- Link to v3: https://lore.kernel.org/r/20251227-max77759-charger-v3-0-54e664f5ca92@google.com

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
 drivers/power/supply/max77759_charger.c            | 777 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h               |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |  54 +-
 include/linux/mfd/max77759.h                       | 204 +++++-
 10 files changed, 1106 insertions(+), 59 deletions(-)
---
base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
change-id: 20251105-max77759-charger-852b626d661a

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



