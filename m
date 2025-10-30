Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378ABCCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFtRgYRXxP/mzITKF6sWtIt2jKdS9Co4RAIfvA6nSNk=; b=wuCJU8YT/BjVHvnkHq7O4OP/yc
	0P6Lyus9jcgAdQgpeq/EFkW1SwpgmJKUnoYn5fy0TiWdmRbmRXFOkJyb1XsLmBTaAZSmgbBy12aKJ
	w3gYXzl7nk9CEPkv+sO38qhJSVlaKeboevAqZs/Hx2x6VuE39WqBJok1gYUTRGiGIkFj0Hqg9m1xF
	yAFHiCuNiqPNm3+P5iTsXXy9NW1djRdOcJDeklnJV4FHAiDg6NJKp3zdBR2fGsuD3gN7uKJK+l/A1
	DzeFj5Ggjn5yhaCeH2Ury1AjHMSC2WcRcsCUZCAKKvqdUdHaO/bI4RqarYHi7ab2YnilTJdfqkWkw
	+Dn5k06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMGJ-00000003ZGh-2jVj;
	Thu, 30 Oct 2025 06:35:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMG7-00000003ZCP-2K6X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 359AE455C7;
	Thu, 30 Oct 2025 06:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFE08C4CEFB;
	Thu, 30 Oct 2025 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761806142;
	bh=xxL8kTS9N9rQw2fjzBJgC6K2U2mkflgT2ueV+BN2vxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KtEIMIPP/4FgFVEJc/dCJB2DXyAVlGZ7OnUBYL72WPToTklrqFv1Z9aSM+1ZBXvl2
	 vr8PyrNb3FZv0bs3omOZmW0rxkaNIdLD8feSZkhhFafOdvVTwrMLw1bEfDl/1Uye2I
	 FcykgKcI89pDF6ibbqeS4JarLuYvG/YqaiO3MWJz0QF3egm1SOPi0OErzjJrVNL3Vg
	 lIyavQyz4uyukBGD9vrgHaxU66D4lzxpVJixSipoyNslMV88awqWMY5cBujgz5EXDT
	 sg3AysQ7cDQ+ziTvp03FTggewLvwYDlcG59M9PlFPaz31z9K0LrjG+vk+b3EkoTRMG
	 H6SSKnQ6pm//w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84E0CCF9F6;
	Thu, 30 Oct 2025 06:35:41 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 30 Oct 2025 07:35:38 +0100
Subject: [PATCH v3 2/6] regulator: bd718x7: Fix voltages scaled by resistor
 divider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mini_iv-v3-2-ef56c4d9f219@gocontroll.com>
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
In-Reply-To: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761806140; l=1067;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=tuKfLXiuKVJmrScuYv67N/GxQOk6XTz9dS5/tFi0lBM=;
 b=+LGPkSfwqhDloJj9Elfn+cdPBbg26FW8C9k93ZFY/maawtjxrITscXXTDy/sYrW8WQEidINh6
 og24Myhv3XcBXsfy2nYWUcViUf3olUdKJT++KiSSb2QQfevkFwSju0E
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_233543_725131_BE97257D 
X-CRM114-Status: GOOD (  10.09  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The .min_sel and .max_sel fields remained uninitialized in the new
linear_range, causing an error further down the line. Copy the old
values of these fields to the new one as they represent the range of
register values, which does not change.

Fixes: d2ad981151b3a ("regulator: bd718x7: Support external connection to scale voltages")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 drivers/regulator/bd718x7-regulator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index 022d98f3c32a2..ea9c4058ee6a5 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -1613,6 +1613,8 @@ static int setup_feedback_loop(struct device *dev, struct device_node *np,
 				step /= r1;
 
 				new[j].min = min;
+				new[j].min_sel = desc->linear_ranges[j].min_sel;
+				new[j].max_sel = desc->linear_ranges[j].max_sel;
 				new[j].step = step;
 
 				dev_dbg(dev, "%s: old range min %d, step %d\n",

-- 
2.51.2



