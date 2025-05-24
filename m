Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA83C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui0KhIlyquezZhJiDpee2fNm3Hi/rRiVWs7RZcA5FHk=; b=twS4qqe3w4Bu8x3oY6eNtIiCe8
	Nl9HMvpnLy2wwQ/oi8DrCyFPJsZvGjl8hzOKve+7Zh8+NIqm2kHjHP2oMJVgGDHNJRMNU8vHjIOTT
	tB3yv2rfqW2GPGYdrf7SPlPYsm/Dk6njoDLMeogwPktTjiQgPNtKQv1pidm3+rk6Gh0VwPUDp3NH3
	Q1qHyeE56EH8tLuuixmH6lu8QxcJ9VRvrqjnNqh8+FwtnNp5dsEm8yJjAlH0Gq1ON2cMCXEZM0+Da
	HtTtyDtFiGG0SQdctiIRjjARGzGwPiSJN0LBrw+4XWG+f8E1RyxgsxeeM+iZrR3DtB+WjSCCGW8zx
	Qw6e5OPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIl29-00000005exX-3GUY;
	Sat, 24 May 2025 09:19:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIkxo-00000005eTE-2ZJa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 09:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C95C4ABE5;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EF20C4CEFC;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078083;
	bh=QmJJzXeg74/tDMm21ZE8ew95kEfbtH/qiljqYhp4/+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V5w5otD/CRTFSQT6LRbqQUyYXhWIrYu8GOpFp+H3QRDL53u/r+j+qTNdgqX41IcCH
	 5pXFsdrZa4I0lN0aeP/qw3MUDWQBZMqLUGKhRqPVD/jJO1mEEYmDBTWiAn5pIaMgX9
	 m82zAL3yVYYEz9hFhhgCI4W3hIIkUrCt7woODA20+wfDrgHu0JuzKCES7EtXOuVT7/
	 EtsoODSUPWXlCuMd8CVGtys+b4l7yze3NYpmLnFqkvMrqUj9scMy6bNp/AtxUUlive
	 8UZRpHcF7LHsSRbR/nfVym2Dzn3mJkc9/lZr03FFpZfD9kPtDJVY9tHDnBtCle336u
	 XZLPbRLF1A4yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F2FC54F30;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 24 May 2025 11:14:40 +0200
Subject: [PATCH v4 5/5] media: i2c: imx214: Remove hard-coded external
 clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-imx214_ccs_pll-v4-5-f7dc22e5255b@apitzsch.eu>
References: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
In-Reply-To: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=1261;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=roC/yqnwu/rypBv0AK9sWLYwwI91i9Cg/QD5HFxyhEk=;
 b=oS74+YSuz1SReKw3CMPcyGgH0e39XipgsbpyBEb7LbIsCW4gVPPvUkf++YOdCF/KRixS3ghIm
 a69VX8DNsnlDw2IRx/LvZUf5NkbElBqrVMM54PUja1q8jDL+6CoClTd
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_021444_704112_27BE1C18 
X-CRM114-Status: UNSURE (   8.58  )
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
Reply-To: git@apitzsch.eu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: André Apitzsch <git@apitzsch.eu>

Instead rely on the rate set on the clock (using assigned-clock-rates
etc.)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index fd03650a5b2bbdbbc677d5797380285f1832baa5..a0cef9e61b41be8ea76a6d6e4b8c9fc4060cfa0f 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -32,7 +32,6 @@
 
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
-#define IMX214_DEFAULT_CLK_FREQ	24000000
 #define IMX214_DEFAULT_LINK_FREQ	600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
@@ -1402,11 +1401,6 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to set xclk frequency\n");
-
 	ret = imx214_get_regulators(dev, imx214);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");

-- 
2.49.0



