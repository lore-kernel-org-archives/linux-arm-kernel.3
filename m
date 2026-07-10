Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF656C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 03:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tglhvhnZ3oVdCryMXmzHV9KDw8CuNMUhlN4BYN9sz7I=; b=zIofwoURUUTqH+vPPzauwIFR9R
	G1Ziv93Hm4LQ7Xm5N3iS0w/rz6mFty8BfwFhKMKI33ifbYqr5fLVoA+qOtr8IIrM+8xGq6j8OsG78
	oj888hI9JlMKSzS3UXdDYD+c84OmjEuBLpTfzPqwRT9YfTzd1VCk0P0/HF3ud8CKxHRGkHuAnZgwu
	m6BcVzj5CUWEZzzNKQs9XVRGOOidUxTWAVG5EjQMnu2u4+WgBuKOe2UG4bHFiCjblp3v3mutF7wJ/
	QKgMMyjpnD7e0eJMfI9g5z9vjz77Jchp28qHKTqyvF0RKWmqiMvPFEw9PlE5lUMDeAWPj1U34nMJc
	spnIe5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1Wk-000000040wC-3j39;
	Fri, 10 Jul 2026 03:03:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1Wk-000000040vt-0Oai
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 03:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CF6B6001A;
	Fri, 10 Jul 2026 03:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BD5CC2BCB7;
	Fri, 10 Jul 2026 03:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783652624;
	bh=rg4p8WzLCF5HXOkepTKkJwIMDiueeObYYdvXoeSmZdo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a6UtQStiBSUKthlNSqG4rsX++3EBxe4pkFhJXQBD0+gybehUfmZlw9sKf/9jBJoAa
	 qMsZCrnBVLwfI73Mp19zxsWSp4AFPXJ3rXEEf0St26CtUJoW9Z6Z2K/V3EQcsnPW7P
	 fe3P3yXHEra03v55C4LkBlNEafq49EwqJm70v1cxcQyny5jwimKiERfSa7jLmuJIY0
	 XVz8Fna93FHK0pTFrKOFy05d3QV6kT3qB2yKF3aRYiFDbirVsWhVBiRWMd474VBifW
	 bTxevO4OGonQ36MXqCBy125CUW/ystpJ+g4SV1OID46p5lUTSbIqB9ubJVw3Do8PmH
	 Qv4jVOcy65JCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059D3C43458;
	Fri, 10 Jul 2026 03:03:44 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Subject: [PATCH v4 0/2] thermal: imx: Add calibration offset support
Date: Fri, 10 Jul 2026 11:03:35 +0800
Message-Id: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-0-1fef97d1c750@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdhUGoC/63OQW7DIBAF0KtErDsRYGxDVr1HlQXgoaYqxgJsJ
 Yp89+BkU1Vdtd2M9KWvef9GMiaPmZwON5Jw9dnHqQbxciB21NM7gh9qJpzyjvZUgRGQr0FPmjN
 gjNfrwwXKiCnoT8jLPMdUYJlzSagDdMAkaCqFkmJA03ekfp4TOn95qG/nZ86L+UBbdmpvjD6Xm
 K6PWSvbe39bsDKgQKmT0gmuGmpe7XQ0MdvxaGMg+4iV/wPDn4zruVAtcvED03xhGP0d01RmMMp
 ZrkRv2/Ybs23bHQleUbfZAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783652619; l=3134;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=rg4p8WzLCF5HXOkepTKkJwIMDiueeObYYdvXoeSmZdo=;
 b=Wr+lu8A6NEKTvfhlm6B9bEU2mQ2TEgmWgt4WzKRSdqeD+HeKiFuTk6heY1jlwfc7pkjC+1wqy
 7J4IxjZSNM6AjZhASbYU4CeuWOVrQwK665wjNfzgCdeO17Ib4AcV4BK
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

 .../devicetree/bindings/thermal/imx-thermal.yaml       |  9 +++++++++
 drivers/thermal/imx_thermal.c                          | 18 +++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)
---
base-commit: c50a940dcde35c647e097e89a9150003abd48329
change-id: 20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-a084984deb76

Best regards,
--  
Haoning CHENG <Haoning.CHENG@cn.bosch.com>



