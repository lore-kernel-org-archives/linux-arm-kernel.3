Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE4EC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wXdjg6p4V9uiME4tLo80vK2ihiwuVvknkQ/VAJ8U0ew=; b=gapOmXn3qlk/m8
	UJSQe4Z4alwVT8B87ek/QLz5xQwtSKCX3NWaQHNhZ1Hc9HYjsut7mM/Fn2uRD6IgV7mQfVgKytKzx
	3Iou7SuZ0IgMBBLK33xDnAZwMTCtpFh80CyO8MKWH0cuCSM80UEZLKyUBzZwBu0FcPWeUKa34jI5T
	+qXVWHWJiJJwt+RSX9N/D45GMguLlkbV2Lca99oHrRbTr3Zp82cfsEoux/3+f9ARD2RnHwYjCLvHe
	hMegtpH+mFrmzf6ozw4qm2c+wPr8O92vNU6Sv9J60v7/gmNUjrB3E5a9C816Pz/C668LlVhWsWZD7
	wk3fCuaRENLRl+AeFv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Yg-0000000GbUS-1ijJ;
	Mon, 03 Feb 2025 21:00:42 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Dm-0000000GYY7-0dou
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:39:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D9D5625A84;
	Mon,  3 Feb 2025 21:39:03 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnfpxlxpcAtI; Mon,  3 Feb 2025 21:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615142; bh=xwtOKTUBcQC4jWTBtIrOtPINitVO/oGKezfgJlBjumg=;
	h=From:Subject:Date:To:Cc;
	b=WwX+eU7LzjIdxW8NZm1GvF/p6BdvTzUTYlFmdaqWIPOaqSWdt8TAOU0wi35fi30Z4
	 CjNEnCbcuTPcm2Vb/PGdtZ2uaNAhIdOwgyyUbeZnNhPuEQQtl2OjEYcbWwQjqPuoL6
	 n5Zjts93nSWE4C7OiUztnWW5NyrMGTY6YpmZK4P5bCy4yJunnI9qXIU+rALUiS3TvX
	 z9eQ+GbaWKnG2+XZieoCHfPeKMvpqcE7oZxiRArBr4fnNfvT/LDay5fjLU+0oDOE/8
	 Lq1o414YESIq0gqjO0n4LgC5S1qkinCV6G3ZNMxFBj4wGAJXap+u3WLL/CmJXUlHcV
	 SmSg9zIN7nsLg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Introduce UART support for Exynos7870 SoC
Date: Tue, 04 Feb 2025 02:08:44 +0530
Message-Id: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQpoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPd0sSiEl0zozQzk+TURCMTC0sloK6CotS0zAq
 widGxtbUAR5S8w2EAAAA=
X-Change-ID: 20250203-exynos7870-uart-62f64cea2489
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615135; l=722;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=xwtOKTUBcQC4jWTBtIrOtPINitVO/oGKezfgJlBjumg=;
 b=vzu/LdC3pxEnkiUAtVWL36omc+KNCQgDuSraq8ILeDY5lO4KG3w/LvzL5zDzq7tSal5tH20+u
 899Cg6H81zfAZUzdRBg0VS0hzJD7Svh5e19SYGRaaGKjHmF5ZWB9L16
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123906_326544_B4116841 
X-CRM114-Status: UNSURE (   7.92  )
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

Add support for Exynos7870 UART. FIFO size is expected to be present in
DT.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: serial: samsung: add exynos7870-uart compatible
      tty: serial: samsung: add support for exynos7870

 Documentation/devicetree/bindings/serial/samsung_uart.yaml |  2 ++
 drivers/tty/serial/samsung_tty.c                           | 13 +++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-uart-62f64cea2489

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


