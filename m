Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0927CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dWaWlAkVkxxtNp8XtdjEXOPbm9bbwr+dApW7xk3kbvE=; b=ujKjvdyWP1TQfLCu+EHp/bakLI
	rms/fGR+aiY56ePNWn96QWvqVvnDGAoHkh+S4xS6xzw2pMqrLcF4+gw+usakFgEi1DDNC7Hno/gqa
	4iovxUqEKHmZaNR/hY9jL2Cc5kX+Ri1dkxP0n/GV2y64PJ93u8fbvx0IWZhgLxEDeIfFqFKsThy6f
	qAOEj/CHHzZGffgrPOD/JjwoLKz745aYJf8IKH7USCUNrVsBtYDpOCJJhOIvZhhgJ35B+3HEmumy1
	eXjbUcVSA9fBo/ABEsXNDoQsIaIpcENLY1eQJA+ivTnRhSsBIcgQ5MhwtCch10tYyHHaAjRbftj2c
	2UV964DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a9-0000000AFkA-1Vtp;
	Sun, 23 Nov 2025 08:36:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5a7-0000000AFiY-0OCL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 08:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA08160154;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C90EC113D0;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763886984;
	bh=BpGpxP773zsyhDqiIdTbkt1LHwhw61h1r+wf9K8eXBA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hQ2e94LaWlWci7Q2fJQVO0RbwNmlcAiWS0JKfKgDd1tMjCImRXuTmxt57poYlYSSA
	 ILX0dRv3sKWG/8l0R31AoAd3PQWPEWAnpZpW0GiuuhXdYtrIl+Of2vqnSRD27uHhLE
	 /c8S9dRVbORd8DXUoFs5VGbCfhUztn/K9KG2mQbDrJnjRcZi1Tdk2eDA4FZNyUe7J1
	 jABSOiZOvdAsCExuLcUBtwl1QE2NDg2viN9D3Lyi0ymiNOu9W8tMgUasJ0R2MG3BaA
	 xYFJis95h5HPt8CSAIMTUwDGogH8RRpNoKwye9NpiQoQeBMM406jj3zyib/ENoudg8
	 nh68fYuRS28+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394EFCFA46B;
	Sun, 23 Nov 2025 08:36:24 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH 0/6] Introduce MAX77759 charger driver
Date: Sun, 23 Nov 2025 08:35:47 +0000
Message-Id: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPHImkC/x2MQQqAIBAAvyJ7TlBBrb4SHaw220MWK4QQ/j3pO
 AwzL2RkwgyjeIHxoUxXaqA7AesRUkRJW2MwylitlZVnKN57O8imOSLL3prFGbc5pwO07Gbcqfz
 Laa71A6K3ftdiAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763886983; l=1935;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=BpGpxP773zsyhDqiIdTbkt1LHwhw61h1r+wf9K8eXBA=;
 b=BWVPQuQsjLSNkUQqrd15xu/QTq3ozxwwQ2vwMMcB/GYDKnpH5yHZo2OYSKPSBUfx/euLcrJbV
 nJPACkoU7CFCwihqtmUdLp8NRbWZ13t2vr/ibMQv0GZBPk8vharpQqE
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
Amit Sunil Dhamne (6):
      dt-bindings: power: supply: Add Maxim MAX77759 charger
      dt-bindings: mfd: maxim,max77759: add charger child node
      dt-bindings: usb: maxim,max33359: Add supply property for VBUS in OTG mode
      mfd: max77759: modify irq configs
      power: supply: max77759: add charger driver
      usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode

 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  12 +
 .../power/supply/maxim,max77759-charger.yaml       |  36 +
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   4 +
 MAINTAINERS                                        |   7 +
 drivers/mfd/max77759.c                             |  27 +-
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77759_charger.c            | 866 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h               |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |  48 +-
 include/linux/mfd/max77759.h                       |   9 +
 11 files changed, 999 insertions(+), 23 deletions(-)
---
base-commit: 39f90c1967215375f7d87b81d14b0f3ed6b40c29
change-id: 20251105-max77759-charger-852b626d661a

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



