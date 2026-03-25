Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C1B109E527
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvzLgHCKhwuOvgtHKEa5IsuR8dUjqUPRBYqoDnBlzcU=; b=0WFjy7hEVbH4zt0JXIFYIfwfQ1
	CsZppO6jnE7txm3oEfLDb1w6GHQTeD6mbxA58q0zaQH/tgwhQI4iRYod/GITnyUm6D1Q0dK+xayo4
	ACNJ9lReNE2GCDYEZdsKXkPd4P8S/AGMTgqRbA/YrQYEYOkiXaac5/PkXl6YdAHVYMjXLmyjTTcxQ
	IX+UhRCYpE+KKGNaO0/5jBO8L+GvUsy+nYDhNLKP9Q3q4og4LqUp5EjLpk1hubd/ljSx7QuNsWKZ2
	/Wr9l6AlHCVWZvuPJA/mHKVp8YdVbv5gk1WtZGj6zKsKh1hkW19j/l+dCKn1BkcH4KRRuKbMh9TZW
	PoriJRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WcX-00000004M52-0F8Q;
	Wed, 25 Mar 2026 22:22:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WcW-00000004M3o-1WQb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 22:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CF0B60127;
	Wed, 25 Mar 2026 22:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A207C4CEF7;
	Wed, 25 Mar 2026 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774477355;
	bh=wr80KYo5vG+oY5OuzYhkOh8zc961m+DacPboYs6g2zA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RjCchrBLSnDkwOzM3Wkuj5APNMp5Hx7xRhhXkKtq9XNf5dJ9UVwyH1n2khDKjmdeL
	 jNFoB8OWMllOaSFepTv4OEw8nWAERgN1yicHUFqOPnk3xUM+GpQ34Pe/o+4pr3K88L
	 PCVfxAkIymKSmzoaQH7s5GFr6DDSzIZ6oBlko4bOlzAWL+eOh/zvmFZiNkWNS3JacZ
	 aInP4Wc9xERLLRqzcu8IFeFHHJmE8dRjOsWVXOJdqJIDnqTG3TR9upM0tLLeI7LDte
	 2LsXDSdFvre8G7H4hJC+L9UOoenjoX5inafbrv5AFGJRaTLcklsJc8mb6QmctYAu1k
	 vSIYG8nJCafiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A8B109E528;
	Wed, 25 Mar 2026 22:22:34 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v9 0/6] Introduce MAX77759 charger driver
Date: Wed, 25 Mar 2026 22:22:21 +0000
Message-Id: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB5gxGkC/3XRzW7DIAwH8FeJODcTGGxgp73HtANfSSOtTZVMU
 acq7z7SbWom2NEg/7D/3NicpiHN7Lm5sSktwzyM51zYQ8PC0Z371A4x1ww4oBAc25O7aq3Rtvl
 66tPUGgRPQJFIOJbbLlPqhuudfH3L9XGYP8bp8/7CIrbTHwxkiS2i5S15SMqbTneoXvpx7N/TU
 xhPbNMWeAggTEWALIAHtNZwR4YKQe4E0BVBZgFVIlIdBmehENSvQDwPURHUtoVVIFUwMUVRCPg
 QgNdywCx45NKi1OSwKwTaCUJVBNpyMIFbH51WvkxS74VakjoLyUTLdUhkAxaC2QlQm8FsgjfkI
 2qebNgLh+a7U4r/OgEo5NVN0PHvH6zr+gVLsPIVuQIAAA==
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
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774477354; l=6774;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=wr80KYo5vG+oY5OuzYhkOh8zc961m+DacPboYs6g2zA=;
 b=sm8VTAh5gyjneG+gDpJx/HvtUrlSkC+cdEd4VecAQ/o3kae/HjfCYeBoKOAYCb5U/uEoPlIwx
 fkGEj5iNlTAAwxvWDGVI+a4fTrXYDXYaG48qWRAyOe22CrTw/5jPFF9
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

Dependency list for patches (directionality indicates depends on):
[6] -> [5] -> [4] & [3]

The changes need to be applied in order. In this case this probably
would be the USB subsystem as that's the leaf in the dependency list.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v9:
- Fixed nits in mfd/max77759.* (Lee Jones)
  - s/max77759_chrg_irq_chip/max77759_chgr_irq_chip
  - s/bettery/battery
  - Fix alignment in descriptions in kerneldoc comments
- Link to v8 resend: https://lore.kernel.org/r/20260314-max77759-charger-v8-0-226ca5f8c7d2@google.com
- Link to v8: https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e9c@google.com/

Changes in v8:
- Add an newline char at the end of dev_* prints. (André Draszik)
- Return PTR_ERR() instead of -EPROBE_DEFER when devm_power_supply_register()
  fails in max77759 charger probe. (André Draszik)
- Link to v7: https://lore.kernel.org/r/20260218-max77759-charger-v7-0-e8d907ce69c5@google.com

Changes in v7:
- Add register relock for protected registers in fail path. (André Draszik)
- Switch to usage of scoped_guard instead of guard. (LKP test bot)
- Link to v6: https://lore.kernel.org/r/20260214-max77759-charger-v6-0-28c09bda74b4@google.com

Changes in v6:
-  Linear Range usage (André Draszik):
  - Dedicate individual arrays for inlim, chgcc & chg_cv_prm to simplify
    code.
  - Use numerical values instead of macros for linear_range array init.
  - Remove macros defining current and voltage limits due to above.
  - Didn't use Reviewed-by tag for Patch 3 due to the above.
  - Add new linear_ranges api to leverage it for obtaining selector
    values.
  - Improve voltage and current getters and setters functions by leveraging
    existing and new linear_ranges API.
- IRQ related changes (André Draszik)
  - Dedicated names for individual irqs.
  - Refactor irq handlers.
  - Ratelimit prints
- Retry mechanism (André Draszik):
  - Initialize error retry counter to 0 when psy work is scheduled on a
    new notifier event.
  - Protect the counter using a lock.
  - Add appropriate prints.
- Link to v5: https://lore.kernel.org/r/20260203-max77759-charger-v5-0-b50395376a5f@google.com

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
Amit Sunil Dhamne (6):
      dt-bindings: mfd: maxim,max77759: reference power-supply schema and add regulator property
      dt-bindings: usb: maxim,max33359: Add supply property for vbus
      mfd: max77759: add register bitmasks and modify irq configs for charger
      lib/linear_ranges: Add linear_range_get_selector_high_array
      power: supply: max77759: add charger driver
      usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode

 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  16 +-
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   4 +
 MAINTAINERS                                        |   6 +
 drivers/mfd/max77759.c                             |  95 ++-
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77759_charger.c            | 774 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h               |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |  54 +-
 include/linux/linear_range.h                       |   3 +
 include/linux/mfd/max77759.h                       | 166 ++++-
 lib/linear_ranges.c                                |  36 +
 12 files changed, 1106 insertions(+), 61 deletions(-)
---
base-commit: ecc64d2dc9ff9738d2a896beb68e02c2feaf9a02
change-id: 20251105-max77759-charger-852b626d661a

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



