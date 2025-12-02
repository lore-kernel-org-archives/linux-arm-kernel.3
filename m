Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AFBCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibVRUxyCluJmMr3CdYHYBOW0Cd6qxRR043lOFRmJAPk=; b=eHCR8GnlZ5Csl8
	uwm5iDo9Z+mmx6b1+RPOfZAqeTS4FbK/EUU2hVLZBq6z4pah3rZ24D90/5IZ4vcrKHT7VSKTCrq2g
	RVmaBYY74WJozXsx5sR9GtvkYJi5XtfSO0H0bj7WTDsKo0KD1MrByRVzTqTjcgaanCQM4n6JFXm/D
	Kn6LMsg4jTaGw0x8/b7ohNHbfyXN0qeXkkxZfxq7H2IDebXUCPhVHRMMAzay9kDQI7LPYWkSjQAYS
	CyVZi+Bt/bdfoKlWdXV4lYP1ceWUHcBlGAoi9/cQmvQiFivPvoKkrFUvCHK76PK2XO82Aq0JA2S5k
	lVysjykHQSULKSQVHiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQhb-00000005Sbe-0NIT;
	Tue, 02 Dec 2025 13:45:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQhX-00000005SZE-1ba0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:45:56 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQQgZ-0006jO-Fr; Tue, 02 Dec 2025 14:44:55 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] i.MX93 phyBOARD-Segin DisplayKit AV-02 Support
Date: Tue, 02 Dec 2025 14:44:52 +0100
Message-Id: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTtLmkC/x2N0QrCMAxFf2Xk2YCZc05/RXzI2mwLaFsaKRtj/
 27x5cCBw707mGQVg0ezQ5aipjFUoVMDbuEwC6qvDu25vVIFlh5pwG9M6lA/6/2CadnGyNmjyaw
 BuWDNvFp684aO+uHGTM5NHdTRlGXS9X/4fB3HD48t566AAAAA
X-Change-ID: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com, 
 primoz.fiser@norik.com, c.hemp@phytec.de, s.mueller-klieser@phytec.de, 
 n.wesp@phytec.de, c.stoidner@phytec.de
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_054555_423524_F0C2CA27 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Hi,

this small series add the support for the phyBOARD-Segin DisplayKit
AV-02 evaluation kit. This patchset depends on the following patchsets:

 - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de/
 - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de/

My test setup was:
- phyCORE-i.MX93 +
- phyBOARD-Segin + 
- DisplayKit

and I used 'modeset -r' to validate the display output.

Regards,
 Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Andrej Picej (1):
      arm64: dts: imx93-phyboard-segin: Add peb-av-02 overlay

Marco Felsch (1):
      clk: imx: fracn-gppll: Add 332.60 MHz Support

 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 135 +++++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c                  |   1 +
 3 files changed, 138 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


