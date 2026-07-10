Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D61EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0bN6v8eGJgxh0UMBZdKXnkyxHli98JDxbQELnicHe14=; b=MPMA5TaEYzTf6Q/ikZ8DrFjDsi
	u8+Gb0Ivwuh3x9qdwLmTOdAUHWAdnGWqbTJop8pI1MPU6zxo4XzTBBIlwvUkJxu9kYVqC/53IqkXT
	2W6ey/SCyW3VE1U+LaH+PbhxcX8Yb4SU2ohH+MxxfjQlDU+lpwaV9x1qIoNpsYlDRIINqsE4dd8qK
	keYIjYnvTbiiwxpZKc+5JQ2twtyGoFA+6gPVm+WvXymYk1aMysIXYaClBbAtY/kzX7Y8xNlQRXMId
	QgnSIp/RjEZJDTK6BhOzqYPT/kl53qM4U/0LH/WdQ6zuwLfQufmez6/oCVIk5yUv3D7rPRcAtYDyV
	lOWa4/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1KO-00000004081-0lx5;
	Fri, 10 Jul 2026 02:51:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1KN-0000000407h-29oZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E879243791;
	Fri, 10 Jul 2026 02:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9A91C2BCB7;
	Fri, 10 Jul 2026 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783651858;
	bh=aODdWPG1KVDsekFasCPhOsfuDyeNBfnV4tNVRyo8Hw4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jffrZAk1cCOcuOAwE2Ku/8aR2H9kgaI3b4eYtZFDJSmIH1ug2xNjIe+2UaXTbYH5P
	 +jWM9bLZ2ijcjK8hDvYybJcHyuyNiR5nRYlWpXl35pzW9QOvzwtNCMLHObXKE57DY+
	 HzPeENL6FDnVk3CgplovQmOuP8p1ZOwLqb//0wmCwBACf+Fe7F3lASXD2qw2lHom3Q
	 +8p21iusgXjCeNbZlgrssoxRlDW7sjT7FGRMer8sCX3XkGRDPB/42SCJWK99owHonK
	 QmsMVijmdCfUXyVtEKUjjuXzgIGLjRsThS0iCbKrbdWaNac1SY4kC79ho1eg5+O0Q7
	 Yff8lE61UeY7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929F9C43458;
	Fri, 10 Jul 2026 02:50:58 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Subject: [PATCH v3 0/2] thermal: imx: Add calibration offset support
Date: Fri, 10 Jul 2026 10:50:39 +0800
Message-Id: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP9dUGoC/62OQW6DMBBFrxJ53YnsiQMmq96jysJ2huKqxshjU
 BDi7oFkl227GelJX/PeIphyIBaXwyIyTYFD6jc4fRyE72z/TRBuGwuUWMlaNuA08Bxtb1GBUrj
 dEO9QOsrR/gKPw5BygXHgkslGqEAZsNLoxugbuboS2+chUxvuT+vX9cU8uh/yZVftiy5wSXl+Z
 k1q3/2tYFIgQcrWmFZjc5Lu0/dHl9h3R5+i2CMm/AcNvjRtjbo5E+o3zbquD1NL4MlyAQAA
X-Change-ID: 20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-a084984deb76
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Haoning CHENG <Haoning.CHENG@cn.bosch.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651853; l=2874;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=aODdWPG1KVDsekFasCPhOsfuDyeNBfnV4tNVRyo8Hw4=;
 b=PkcyNNzQ+OW9HlRJvj5w5eBldCfQZvoiw95gd8Bjr8iwTbIogbR5KzsilOKpmfbSt152kpsh5
 1OWm9D5qJr2CrCnWuwqEYBKNa8JJ8Jp/fEBe6b8siDsbW9/kR9K0lxX
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=ed25519;
 pk=glQGwad/fosRS5gZUJYbLDPPLGe7rFTrTV2VxY/ySdc=
X-Endpoint-Received: by B4 Relay for Haoning.CHENG@cn.bosch.com/20260709
 with auth_id=860
X-Original-From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
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
Reply-To: Haoning.CHENG@cn.bosch.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Some i.MX boards need a small per-design correction to align the
reported CPU temperature with board-level measurements. This series
adds an optional DT property to specify such a calibration offset
and implements the corresponding support in the imx_thermal driver.

Patch 1 documents the new fsl,temp-calibration-offset-millicelsius
property in the i.MX thermal DT binding.

Patch 2 reads this property in the imx_thermal driver and applies
the offset to the i.MX6/6SX/7D calibration formulas. When the
property is absent, the default offset remains 0, preserving the
current behaviour.

Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
---
Changes in v3:
- dt-bindings: add minimum/maximum (-28580/+28580) for
  temp-calibration-offset-millicelsius, as suggested by Conor Dooley
- Link to v2: https://patch.msgid.link/20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-0-00ff72495e24@cn.bosch.com

Changes in v2:
- dt-bindings: Removed explicit `$ref: /schemas/types.yaml#/definitions/int32`
  for fsl,temp-calibration-offset-millicelsius; the `-millicelsius` suffix
  already resolves to int32-array via property-units.yaml (Rob).
- dt-bindings: Fixed example indentation.
- driver: Replaced C integer division (/) with DIV_ROUND_CLOSEST() in
  imx_set_alarm_temp() to prevent off-by-one alarm threshold mismatch that
  could cause IRQ storms on i.MX7D.
- driver: Added clamp() bounds check for alarm_value [0, 0x1ff] to avoid
  corrupting adjacent register fields (PANIC_ALARM).
- Link to v1: https://patch.msgid.link/20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com

To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Zhang Rui <rui.zhang@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
HaoNing Cheng (2):
      dt-bindings: thermal: imx: Document calibration offset property
      thermal/drivers/imx: Add calibration offset support

 .../devicetree/bindings/thermal/imx-thermal.yaml       | 10 ++++++++++
 drivers/thermal/imx_thermal.c                          | 18 +++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)
---
base-commit: c50a940dcde35c647e097e89a9150003abd48329
change-id: 20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-a084984deb76

Best regards,
--  
Haoning CHENG <Haoning.CHENG@cn.bosch.com>



