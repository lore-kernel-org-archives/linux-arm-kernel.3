Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F63C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 05:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/Ez8ee3fzMJA6Jnyp/6MKBWJKOqOKiRlKHgiFW2Kr8=; b=n7Fh68ykv5/wB35+BQ10gppMz4
	+F1t1DaCtnrh5Jt8bk7dW4I4yTRFPBxnjXaas5h1sOt0AO4ksTxLS0o1sHfT5C4qnQmQPc46qGiSz
	1KfNYMldH45l5BXsiyeMKBtaguCOIATrlh8bF3KKPumP1/qGjTapAZZxAJn6ovYIae3e0JDquiYB2
	20uZp5Bmu1JwoHrCrKnPJNpSVFspOMUxc/cej26fcTkPC2AimTn7SZrm1xuOn/kEcieYdJLctkBKf
	MHrlbzSd8zqfX9e62CdKfVTOfn6kulNdd2wVSHhezSmr9eMka1sIf0VKG2yI7mYLkYzhylP6Qcia8
	r3dUAisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9Zt-00000008B2v-1DdT;
	Mon, 13 Jul 2026 05:51:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9Zr-00000008B2Y-3B1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 05:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0151341E5B;
	Mon, 13 Jul 2026 05:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9E4BC2BCB8;
	Mon, 13 Jul 2026 05:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783921898;
	bh=x1ouoMDXjU9zrlMtqhB/DizDSIZDHZUmljV37kwXVU8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JlmG0rlyZAgpzm8jhTpCRiy9B8vuvKdrtRTrV8Odz8awtjJxT8skpQNfvP4bDUGMe
	 djOrS1dmEy9KfLCJcACwDm3fPGlBllfiweIxvyvTF9RnjQqy5k731lNXmhjWCtzFWE
	 G6lyOiFCyvFgZ1qA91hHx8hD884eZpP6pn3zLWXj7QlzMiOtVoVD7U156iRw5K/Cyq
	 z0RcwsSdrCAph51ohJYM1b+51xc6rmqq0oTLZ8h+BgLOw1Ys3JiuzrHd7/htLGbDjj
	 tZ79Ubovr756QeAxcHbw/pLo74mT+FvlgWNJIdrFgM6zyENX0REYo1ZyrhytYj25PD
	 RwW+gxRR55sjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6836C43458;
	Mon, 13 Jul 2026 05:51:38 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Subject: [PATCH v5 0/2] thermal: imx: Add calibration offset support
Date: Mon, 13 Jul 2026 13:51:32 +0800
Message-Id: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-0-69405c306c6b@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOR8VGoC/63OQW7DIBAF0KtErDsRYGwgq96j6gLwUFMVY4FtJ
 Yp89+JkU1VZtdmM9KWvef9KCuaAhZwOV5JxDSWksYb25UDcYMYPhNDXTDjlHZVUgxVQLtGMhjN
 gjNcb4hnmAXM0X1CWaUp5hmUqc0YToQOmwFAltBI9WtmR+nnK6MP5pr6933NZ7Ce6eaf2xhDKn
 PLlNmtle+9/C1YGFCj1SnnBdUPtqxuPNhU3HF2KZB+x8icw/M54yYVukYsHTPODYfRvTFOZ3mr
 vuBbSte0DRjyBEZVhHr2WPXOypb+Ybdu+AXn8fc1AAgAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783921893; l=3635;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=x1ouoMDXjU9zrlMtqhB/DizDSIZDHZUmljV37kwXVU8=;
 b=zEORCPgnvUZJmstpHx4Sb+lJ9RE/h7bvLodmGCXmDhdPF+ad7u9dHdDFAFm1lF/kszuI5Zvur
 CaSaM+zJvKKAYOHN/P8zs0eK16+acc9x2JWXiVhRQH4oZ7RDebXmdzB
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
HaoNing Cheng (2):
      dt-bindings: thermal: imx: Document calibration offset property
      thermal/drivers/imx: Add calibration offset support

 .../devicetree/bindings/thermal/imx-thermal.yaml         |  9 +++++++++
 drivers/thermal/imx_thermal.c                            | 16 +++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)
---
base-commit: c50a940dcde35c647e097e89a9150003abd48329
change-id: 20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-a084984deb76

Best regards,
--  
Haoning CHENG <Haoning.CHENG@cn.bosch.com>



