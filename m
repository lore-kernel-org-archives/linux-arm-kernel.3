Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CE6CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDh8cyCuG0BvRFs/KskkYUXoHG61lWt4Q8mGTanX63I=; b=TMdosz7c1emDp9Wg8bNpfKFoxk
	YtZNkln2CeeLLkazADFuPXJnwCUT/VmSItWedGqUci4wMOCWijO5cBkPyf/IjuQvkJ2ug/TI2ulnR
	zdq37QR+V1wBkvyeKFufHSO4kr2t5nsD4YcR6bCysXNTekU2z0tVuYf9bWknscVf/hCQnkfr1J6li
	X1vX4UZXLY4V1gTaZ2T583/U+7qFgqbWXgAXi4n2FRHLMAVKH46W6Oz29IG5rAbFmcUd6c5bxLLzl
	6Y5ellk4RUH6FELc2P7HgYxGNDi8d1I3hOk0oNRZy0dmUjJJrKiMst7mvk31jNSdA+PEC+4SshVrs
	n/x0MRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb41-00000004li4-1GsE;
	Mon, 22 Jun 2026 09:35:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb3v-00000004ler-108c
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 09:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QDh8cyCuG0BvRFs/KskkYUXoHG61lWt4Q8mGTanX63I=; b=lY6lhD8+9iShnRd5x0Bp/gKAfV
	zZaR9SYiAJw4szbZ0hJmENOE5KDVvpnJS24ho9svbYBbqO1dZZRF+F2OB8+Rr8Y33dK2JInV6MX9o
	6R3t73Kwhj6ASDcCZBtcRIsreqomOXGvf+uTHugp6sclHWb7y4LF1NgJCVQwkKLA26i2YHvTBVMy/
	33nPHAbz1xeZbAyAaY8GmYplFiZQOYDR5XU8+wYnWZQvEKsG+9KNo2zUDY9QYqfxWNK/VeZOB5nMO
	80kjdq1CW2bun6ZfJ7YY/tHl5oWwVLZymf8toein5cfH4DutS/cF0qXKq2t+UsVZC0LQSzY9joNPp
	ZGjZIaWA==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbb3r-0000000HHY7-1XM7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:35:25 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B0C2E1FE54;
	Mon, 22 Jun 2026 11:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782120916;
	bh=QDh8cyCuG0BvRFs/KskkYUXoHG61lWt4Q8mGTanX63I=; h=From:To:Subject;
	b=lMpDLwRto8FVTIVQFZ5qHScNPQEX4h6jcz7YL6kReq40+Yahq+8YmrBihWAQfbc0X
	 Y0kUQZAI29s7i3gqQkWUGmtfxMcryYE2MLUpykI20cHVAAQTwdXq5+Tx4QQYTuyRr0
	 DTv2yvV2l+kIYdonILIpiw8j6GLKURnHalAXJ34PAmF+omiLK9cnLR1PrKYYXvLp6/
	 kKvjlNzYSq2dloEwDUkh68UVzuLPUS2n9e/E5ypjgvzyUwMCyUvv3uGPhT9MQmxntg
	 zD6kYYtK7s0aP1JoRasSuqZ+G6aYel95NNNycys5atONlV8L88uQeDpTyCbKR9W7Vm
	 UJhZYA0tdBdLQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
Date: Mon, 22 Jun 2026 11:35:06 +0200
Message-ID: <20260622093507.44132-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_103523_870906_3481D2B5 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add alias for lpuart5 so the UART gets a stable line number.
Without this alias, the lpuart driver fails:

  fsl-lpuart 42590000.serial: failed to get alias id, errno -19

This prevents the Bluetooth controller connected to this UART from
working.

Fixes: 104a391bb6ff ("arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7d760470201f..a6c5398a81e3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -24,6 +24,7 @@ aliases {
 		serial1 = &lpuart1;
 		serial2 = &lpuart6;
 		serial3 = &lpuart3;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
-- 
2.47.3


