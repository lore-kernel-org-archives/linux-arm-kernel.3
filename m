Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348E1EED628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X87cwCCWZjshqk0f71Zpbr2Hwf6QMx80ZDoysBFiT2k=; b=NFp7AqhC6cCq+3
	j/r0xJ6eUbAO66vYfldp7coj4W/5/5//5zc4TgWQtY8vHbdBhlCGjM4rkblt6Tukts//8OcwDp3m6
	Mj4WEMFNcWNOzCYjpvMr7NvOyIz4CeNrBE23yAkT2v7U9iXAs118M6wNWV2uFEA6VNqXbany/xcN6
	94OMujOm5+0UDvkFu+gfecOKEy9dLwH9oUzzCrYnRnopRjAwAqX2eWqsCBb7iflcIXq+37FWxnf/H
	K/dJspq+zoO32fIEOlShqzCxcq+A5p/bLvSaiu5ZunY/zZ1cCG70paWEyE1R/k5Vhw0mex8DLAvWN
	caE0Unj0S9d8QmCMEJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSQ-00000008ay7-0dWW;
	Fri, 02 Jan 2026 18:01:02 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSM-00000008awg-48IC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767376836; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=R81mB6Z9VJ4Ii4xrsDL2irsPcgBOsbJz07vtZawbGzA6YZni6Qly1GlhkCk0Oe6aEf
    K1ospmM6VS8uxlNFBabVxNBIN9M2NeSi4kSjE354HTFm/JkM3Dc6UBKD1Z/TGYj8o5ht
    QK8zahcX8yPQglF95glDV/E/8RPWAKlxvxekPmReZI6/OvjLwW9bWITfOZCY3evDMPKL
    8X+wVXKa+NkNhh/9STowuGUx6k/XpwlcFxgieLoguqoM0qlOxGrg+aKNsi8gfsKb4Qjl
    wCFGCgf3gDyFvTQ0TKlCFieqRT8g/Oeh3C4WEqgK5T1qT5ALNO83PV5BdUnbZoP13t5H
    nOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376836;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=X87cwCCWZjshqk0f71Zpbr2Hwf6QMx80ZDoysBFiT2k=;
    b=hZIQEIWX74OYWYtETkjqHTm3U14u8wCE/lczXeGMQvgT1AhaYxjCCDt68O/PoI59lh
    w5jO2pMrSXkV1VebcxdLy981JHPfKRs1hhxiXUT+sYh1B3VyKnRXBffy1yT2y8JG8Dvp
    MF164vYjzRohkcxymCD/g0lMt13k6lmwusiVz/lWcEcxYbmU+bginDBuJ2mFzYN2Gztu
    3fY+DuOsdv2rlwy6YO2pdP3G8AlSLUmMNMslLIY6J4TVRrQuQoZuS11oLqtCKBJcoThh
    EbFjeGmj8SvlsczuGvSZq5cs4PhkHzmyTzKOyocTTF3IElEjn6jzssgpQLI0EsDXc8t8
    m9vg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376836;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=X87cwCCWZjshqk0f71Zpbr2Hwf6QMx80ZDoysBFiT2k=;
    b=q41phBFqlZBicChEMpeuuin+iegmOKujno6JpI3HfQGexfGx5E4xxOjFQEq8E4U079
    0tM/5dgjosm6SJVXwWrmu98u73PyD5gLYMIyl/y2mvB7pW57wEfoyRm1VlrB0xsL/hvN
    j7vWbC1T8+Cs0esjTEG2LCuP8ScXVB4wzYF2ny3bkHuvrzHOxcsQVGTiKMxwjjE3XQvN
    B8rgq02L+w/qTxFSDv76AWL7IzX/gvd144CbojCGTvBDJ6neSM5ArEsbMkf2jvY3xD7Y
    O91TgGznMvWKhOrkZRAFyy7gTJkIbAdpnuEa1DdbOsnCiV2wvTP/BuP36GPOo1aXuOZj
    rVlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767376836;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=X87cwCCWZjshqk0f71Zpbr2Hwf6QMx80ZDoysBFiT2k=;
    b=TrOOrQJ11RmMe3y0TVhn3tkCGDCKMAdN0wS/iRGFHIZ8O1aEuVgLhTY5XgyJJxsZqP
    AzFtV9Q+9bQKZ+42tzDA==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQivJ4sfKeu9QyRDNI="
Received: from Wablet.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec202I0YEU8
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:00:34 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Subject: [PATCH 0/4] power: supply: add battery driver for netronix ec
Date: Fri, 02 Jan 2026 19:00:29 +0100
Message-Id: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL0HWGkC/x3MQQ5AMBBA0avIrE3SVhCuIhYtg4lEZYqQxt01l
 m/xf4RAwhSgzSIIXRzYbwk6z2BY7DYT8pgMRplSG1Pj6p1He4pFZ4+D5MGCKuUGXTajriB1u9D
 E9//s+vf9AFGv+c1jAAAA
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_100059_276429_D073CDD0 
X-CRM114-Status: GOOD (  10.18  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds a new battery driver for the netronix embedded
controller multi-function device.

Bindings are updated supporting a monitored battery, and battery
description is added to kobo aura device-tree.

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
Changes in v2:
- Fixed identity mixup between from address and SoB.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- Changed patch ordering, device-tree first.
- Separated new driver and mfd subdevice changes into separate patches.
  (Reported-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>)
- reworded Kconfig to explicitly mention device-tree
  instead of vague firmware tables expression.
  (Reported-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>)

---
Josua Mayer (4):
      dt-bindings: mfd: netronix,ntxec: add reference to power-supply
      ARM: dts: imx: imx50-kobo-aura: add description for battery
      power: supply: add battery driver for netronix ec
      mfd: ntxec: register battery subdevice.

 .../devicetree/bindings/mfd/netronix,ntxec.yaml    |   9 +-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |   9 ++
 drivers/mfd/ntxec.c                                |   1 +
 drivers/power/supply/Kconfig                       |   9 ++
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/ntxec-battery.c               | 101 +++++++++++++++++++++
 6 files changed, 127 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251227-kobo-aura-battery-3e60bc159d16

Best regards,
-- 
Josua Mayer <josua.mayer@jm0.eu>


