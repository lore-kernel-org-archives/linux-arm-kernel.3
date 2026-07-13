Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D49C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLKy4/lc6RWuZdWEBJE/MyvytyeZhRjeazudTjvS3k8=; b=KoI1t/N3dR/HF/5sz4Ue4BSSJ7
	5It07R9m1EcjNXB3LMmQN1ULOSTZngane40zZfyGkyR245mrnvilAcUCSKcTjhj4mVCYbjhj9tzQG
	+e6f5+AzvlhpDNMGWrt9B3l+z29oisgUjfbn8eoKkrI6qWpntLezGU9D9VQ5FopKhHxN9zgP2irVe
	YJPIkNzw2fgFUTLnABKiTmmBKvhWzpBVtR+QxxdT26lyJ/HvlEhBypl4RVdYAacPbaUG5R+gE70w/
	2WGiMbkil9Enc2Wf8JoYr6wjCtUgplsi6WUHpy9hiKvYOLqCTNoMTrXver4wdQ2g+EZxIzRvczr2p
	qotpL9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDes-00000008qXq-0W8l;
	Mon, 13 Jul 2026 10:13:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDeq-00000008qXT-3iAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2E9B40655;
	Mon, 13 Jul 2026 10:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78DF1C2BCF4;
	Mon, 13 Jul 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783937584;
	bh=l4IzDk6AZekoK7hv30j/AYCaWvKZp5AFjNWbd7EU7QQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BZhuxcKI/QEqO7bVHcRXNc8BkcONL6ae5x7kybzXaYFXwPHlB2xAe7uZwuNe9gnnw
	 t7OulalpCnsgk94NV05kE73/hurI8PoI5iGsLz/uTR2d3Q+Vj14yUke8ZNeE5np87M
	 Kvkka64EgWHJN45zIiRpZXZLIGUQJO4EWKxHlfId4V6LLph0yOApQ/P1dm0THW3Sim
	 52f8R9GqtECGiF4UnFMhUJv++A+GcIZMOMtIpzWFMhdhBMvpy7QqmNEJzDav2KGZsl
	 PgPW01tW/C2ENtVV4J+8yFYdTZzSw0nNcscJd81YRy+lu7GK7Oiwo/dr7iZ1n2Qdd3
	 cBB9Kv+h2ZCWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D0BC43458;
	Mon, 13 Jul 2026 10:13:04 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Subject: [PATCH v6 0/2] thermal: imx: Add calibration offset support
Date: Mon, 13 Jul 2026 18:12:38 +0800
Message-Id: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v6-0-88a378faeca5@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABa6VGoC/63Ry2rDMBAF0F8JWnfCSNbDyqr/UbqQZKlWqR9It
 kkI/vfKySYUr9JsBi4Mcy7MlWSfos/kdLiS5JeY49CXIN8OxLWm//IQm5IJQyZRoQbLIV860xt
 GgVJWZuzOMLU+deYH8jyOQ5pgHvOUvOlAAq3BYM11zRtvlSTl8ph8iOeb+vF5z3m2395NG7Vtt
 DFPQ7rcai102/tfg4UCAmKo68CZrtC+u/5oh+zaoxs6spVY2AsYdmeCYlwLz/gOUz0wFJ9jqsI
 0VgfHNFdOiB2Gv4DhhaHBB60a6pTAHUY8MtVzjCiM1ByFq1A6+fc367r+Aq0QfPCnAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937579; l=3842;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=l4IzDk6AZekoK7hv30j/AYCaWvKZp5AFjNWbd7EU7QQ=;
 b=Y+1A4VSGjNwHX6GT9AxYZvWvlNdTyRd+qYBU2fUsCF+vr+9uVfMsvDu6LySP6j+opS8bp/SR2
 F3MgbGwSnTSAbtkLo9evgdZ66/4+IR9Lw4OFieYpmP1VYz127TlHc1y
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
Haoning CHENG (2):
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



