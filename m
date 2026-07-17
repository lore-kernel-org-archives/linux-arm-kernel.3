Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB3EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELt0MfQLjZFbrqLWWCpzp+R50tli1aEaMUz8ndthRUM=; b=3Kd3kpSwqXSe5uOdjwgtJChFDG
	M3soSQqO3TutqbdCm4bZZXUgaz8aj13nJ50MycK4S7hxZ0BOMRqI7lNDJMFamqXf2muG2Lgy9WQNH
	RIIuWRrdlxaG4gXQL2r4E1yPDS/3PFVzPToouxqfz83OYtZwu9P0mRFqx6lSAXuG/gKOnfmIsx0ng
	IHNMd3VAG0h9kQgrMDpuEMlfgkbX+9md7Q0Acr1BAWtJNhygdfm8HMfrCaclvJe4RDAVmg7kClvQY
	e8RJhSHebNoySwyAl+YNCtbfeix+YyRj+sqWWjDUZUkqhNX0TmfcIhdwxIXm4lqc136APThBZsoWK
	GhqEPlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcAj-00000001HTM-0uh7;
	Fri, 17 Jul 2026 06:35:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcAi-00000001HT1-21ZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A16D040B74;
	Fri, 17 Jul 2026 06:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74383C2BCB8;
	Fri, 17 Jul 2026 06:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784270143;
	bh=RRcs+ox/+l+BNogr/PA/wCNLqq/mugFwKw0T+RxD2PI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LAZc8Q/CCJUVIhHkpjVke/p5CRWBWFI1AAO2DJEYzHqntSY4Rkl3p+U6VRgGsryUY
	 aFoHXWIKO3muu2K5NBkoCKUcrkFw04oCcsu45IDTU5O9tweh9WhYWaJd1ePDbxQ0PM
	 jMfqHq/br7qwgJLioKVp3sshleqPpqCQgv9CzIWfJx/STpSblbo34IQYliLwh51VtV
	 uBlAZINdt50tfZcEJnZrI4XlYqlocZ1GCRrjn1lGV2bp0WOj7ctFuQsbGR6B0NeaDS
	 /Jkb/synt8Zrg9RoyrZBF8/UQJ+IJeZvcyag9PHQb96fN6lIgT9knaXi1VYOkYNVnV
	 cWFy/syj5p9og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51427C44517;
	Fri, 17 Jul 2026 06:35:43 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Subject: [PATCH v9 0/3] thermal: imx: Add temperature offset support
Date: Fri, 17 Jul 2026 14:35:34 +0800
Message-Id: <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-0-75f4af8974f4@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADbNWWoC/63Sy27DIBAF0F+pWJdowDy76n9UXQAeaqr6IXCsR
 FH+vTjZRJVXqTdIVxpxRnAvpGBOWMjby4VkXFJJ41CDfX0hoXPDF9LU1kw4cAUaLPWClnPvBsc
 ZZYzXM/UnOneYe/dDy3GaxjzT41TmjK6nijJDHRhhjWjRa0XqzVPGmE439ePznsvRf2OYV2qd6
 FKZx3y+rbWwde5/GyyMAgWIxkTBbQP+PQwHP5bQHcLYk3WJhe/A8DsTNRdWIhcbTPPAMHiOaSr
 TehsDt0IHKTcYsQMjKsMiRqtbFrSEDUY+Ms1zjKyMsgJkaEAFtfU3agdGVcYY12gTHQa39Wh6B
 0avFbBe1a4r65FtMOaREc8xZq2AFK1RFpAp/MNcr9dfkqm0MdwDAAA=
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
 linux-kernel@vger.kernel.org, Haoning CHENG <Haoning.CHENG@cn.bosch.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784270138; l=6002;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=RRcs+ox/+l+BNogr/PA/wCNLqq/mugFwKw0T+RxD2PI=;
 b=sId27MHdWmFGaRgCwMPUSwr1UiTWv85UPhMJiuQkKZL7NE1iASb0gCGloLTSanU3/2pQ9bEgJ
 ENdSwe1YA3UCwpP8qvzAyTyocZsrlfmnEzqGmBNdLYrw6xIRtW3ibXq
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=ed25519;
 pk=glQGwad/fosRS5gZUJYbLDPPLGe7rFTrTV2VxY/ySdc=
X-Endpoint-Received: by B4 Relay for Haoning.CHENG@cn.bosch.com/20260709
 with auth_id=860
X-Original-From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
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

Some i.MX boards need the reported temperature to represent the SoC
package-surface temperature rather than the internal die temperature.
This series adds an optional DT property to specify a board-specific
conversion offset and implements the corresponding support in the
imx_thermal driver.

Patch 1 documents the new fsl,temp-calibration-offset-millicelsius
property in the i.MX thermal DT binding. The offset is board-specific,
determined through thermal characterization, and limited to ±20 °C.

Patch 2 fixes the i.MX7D alarm temperature conversion to use
ceiling division (DIV_ROUND_UP() for non-negative, plain /
for negative) and clamp() to stay within the 9-bit register range.

Patch 3 reads this property in the imx_thermal driver and applies
the offset symmetrically: it is added when reporting temperature to
the thermal framework (to produce a package-surface estimate) and
subtracted when programming hardware alarm thresholds (to keep trip
point semantics consistent). Out-of-range values are rejected with
-EINVAL at probe time. When the property is absent, the default
offset is 0.

Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
---
Changes in v9:
- Rephrase the series to clarify that the offset converts the internal
  TEMPMON reading to a package-surface temperature estimate, rather than
  calibrating the sensor for better die temperature accuracy (Frieder)
- dt-bindings: update the property description to explicitly state it is
  a board-specific conversion offset, not a sensor calibration
- driver commit message: distinguish die temperature from package-surface
  temperature in the symmetric offset mechanism explanation
- Pick up Reviewed-by tags from Frank Li (patches 2,3) and Lukasz Luba
  (patches 1,2,3)
- Link to v8: https://patch.msgid.link/20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com

Changes in v8:
- binding: s/behaviour/behavior/ (Lukasz)
- New prep patch: use ceiling division (DIV_ROUND_UP() for non-negative, plain /
  for negative) and clamp() for i.MX7D, extracted into a separate patch (Frank)
- driver commit message: add offset mechanism explanation with a +3000 m°C calculation example (Lukasz)
- probe: reject out-of-range offset with -EINVAL instead of silently clamping (Lukasz)
- prep patch: handle negative alarm_temp with plain division (C rounds toward zero)
- Link to v7: https://patch.msgid.link/20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-0-09b6b7669be1@cn.bosch.com

Changes in v7:
- Align the author name with the Signed-off-by trailer.
- Link to v6: https://patch.msgid.link/20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v6-0-88a378faeca5@cn.bosch.com

Changes in v6:
- Align the author name with the Signed-off-by trailer.
- Link to v5: https://patch.msgid.link/20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-0-69405c306c6b@cn.bosch.com

Changes in v5:
- Move calibration offset application out of c2 initialization, instead
  apply it in imx_get_temp(), imx_set_alarm_temp() and imx_set_panic_temp()
  for consistent style across i.MX6 and i.MX7D
- Subtract calibration offset from alarm_temp before the if-else block in
  imx_set_alarm_temp(), simplifying both SoC branches (Frank's suggestion)
- Link to v4: https://patch.msgid.link/20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-0-1fef97d1c750@cn.bosch.com

Changes in v4:
- dt-bindings: drop maxItems to allow minimum/maximum constraints for
  temp-calibration-offset-millicelsius
- Link to v3: https://patch.msgid.link/20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com

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
Haoning CHENG (3):
      dt-bindings: thermal: imx: Document temperature offset property
      thermal/drivers/imx: Fix rounding and clamp for i.MX7D alarm
      thermal/drivers/imx: Add temperature offset support

 .../devicetree/bindings/thermal/imx-thermal.yaml   | 15 +++++++++
 drivers/thermal/imx_thermal.c                      | 39 ++++++++++++++++++++--
 2 files changed, 51 insertions(+), 3 deletions(-)
---
base-commit: c50a940dcde35c647e097e89a9150003abd48329
change-id: 20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-a084984deb76

Best regards,
--  
Haoning Cheng <Haoning.CHENG@cn.bosch.com>



