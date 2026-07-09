Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8F4C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 05:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/pnBaYCpoYlWh4QL74OJY/E90fMJ+KmnAOHnQeWuVfI=; b=y35maGAG41TSQYOhI6CaykTyho
	oGUyg6kl2wTkmG8m0dyKXyoGAn9EJXbN7VAhw3lpdz49+8ApPqhh1L7cRsRjqwUKJvCupe/tidVRk
	/qhgnAcbBz8GxyireUs1Ac4NgJjfrSjpLKjDXcAPjo093y0ANzVBqiB2CK16zj6B7zvaP9MhTAGXx
	3H3L+KB8LzD/OYgEGjY13KuKspC3QMIvs63M9RPZ9VXDvTWRhf+lbg3FQtCdK3OvNB1a+IZ+mwMt1
	/bK9bGTPwerhs8ksCaQiN7LGFKaLEQUfoMma+L3ysGVxvLyCwrVsX8v3yw+I9eKMjl/G6m5v0t47h
	Kq622/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhZb-0000000154c-1K8G;
	Thu, 09 Jul 2026 05:45:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhZa-00000001547-2P1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 05:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8EA86001A;
	Thu,  9 Jul 2026 05:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64C1DC2BCC6;
	Thu,  9 Jul 2026 05:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783575921;
	bh=WbMChnrVJ5hLjteSDIcwpCRJ7d6FUBqAjyKBvueOBbk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=G06ykPQdF2bEvLEaIZfns4aNwe6V/hyy8+VmBsch3GqLiu/JulFxmJUdEJXiqAyd5
	 HgL9kb2KGpblOajJbw8GHyoArzbvhpR07xHe7MIQhtDSl8HQkURWqgtDjrVuhevwq8
	 7jGesErIpVSTlsjNUvMhagjDhzorLe+XsGF914Q7K4L3OabyAUhO6zfJcSzS8fvM7g
	 HBTDbTr9wTNSnwAeFxZjwDTlNWU/VwN13UAw1hdlx09nYSN+sWBRpQzG5D5qe5qJS3
	 vpkMPy3bPA9xWijItik8DDQLThgim3ISbpg83gDIQEjvkziVStBOgtbrvvOYTihx0x
	 SSa8iAId4r0oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D3BC43458;
	Thu,  9 Jul 2026 05:45:21 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Subject: [PATCH 0/2] thermal: imx: Add calibration offset support
Date: Thu, 09 Jul 2026 13:43:26 +0800
Message-Id: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP40T2oC/yXNQQ7CIBCF4as0s3YSIIRSr2JcQDtajLSEAVPT9
 O6ibl7ybd6/A1MOxHDudsj0ChzWpUGeOhhnt9wJw9QMSigjejGg18jv6BanJEqp2oa4YZkpR/d
 ErimtuWBNXDK5iAalRSesHqyeyPcG2nPKdAvbr3q5/s3VP2gs3xQcxweapxislwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783575916; l=1237;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=WbMChnrVJ5hLjteSDIcwpCRJ7d6FUBqAjyKBvueOBbk=;
 b=WqH42b8JtaKetUkHD06W8GNAZAw0KozZWsslG7Ipqvnb+EYgHYP8NqvJfBOBEGbSM6bSooo1o
 nWVtP19QWlOAX+w3nngyrP1CIkHZCbSldQtk5eiLEPKYL8xtICKNCmS
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
HaoNing Cheng (2):
      dt-bindings: thermal: imx: Document calibration offset property
      thermal/drivers/imx: Add calibration offset support

 Documentation/devicetree/bindings/thermal/imx-thermal.yaml |  8 ++++++++
 drivers/thermal/imx_thermal.c                              | 11 ++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)
---
base-commit: c50a940dcde35c647e097e89a9150003abd48329
change-id: 20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-a084984deb76

Best regards,
--  
Haoning CHENG <Haoning.CHENG@cn.bosch.com>



