Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F59CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G54v6TiPc+U/fCQbocoPE3RC3yhsE0vJovdrhl3t4Y=; b=cSE4ghVa4y7r4WE7ZPwk6nsjJs
	vCtfdK8IKOx/XLuyLUp2NQ2mIZSrOo+HooEfWz4f5oYTLoyyuoy/UnSGHzDcee9TT4Is/lDTCcPSl
	J3hGRLyHeSW6F2ARE1lGTJrTsgA545DrVlgh0e8z1wj872u3hbPRTlW8V5GZPsp7nCdQtxFe1CfDo
	jYWuts1aPSWIsOmYdIRf3Jx5oxQKVOehAA2Orvxf20t4dluKaewBgRY56CJ4NhXT+xsfKQ5nMzwXs
	LWW6INe19jF9r4Ajv6EQzj70Z3rGHRN+NmnlOzR9+X+rH5b+DceJrnIqnh6fibOSsS+u8QG+d+C1X
	gO54+Qbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuvqb-000000087sW-0ZJ1;
	Sat, 06 Sep 2025 16:33:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuv4o-000000081hx-41gW;
	Sat, 06 Sep 2025 15:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D3B245223;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CAD0C4CEFC;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173420;
	bh=6hJc+1Kc7zJ4dqjuwSYvv6Ldou9XTFOwmoh/VJLGXVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bC8B3EAwHvLt7mvv0lnE0JCLeq6XG7U7HmYMonRKsp0U+npLmfFVobfxBSnQ127yA
	 7hFjgaMyA3XS/n3DZEIfK45gkhY1kbsb0YH9EG8wTGfefDLMManF7TJQi/QNjSuiit
	 TJTDzlOb6rFc6hjpJNLRbMu54yOsWCM33fB05ZJ8syVZximB02gpPtdsnV/+9t9V/X
	 1MdxeI1HOC6VcKT5lALzhOkm4xTtXPGH7Vi+5adbMvRWSOo1nSOQAGytgxxXEZMAEI
	 RENzVAcZjOTo6LQtAg2kkxnnHmhd7XVWNGhp9D/Rtq4+5XEBybFf5lESJUySmxe442
	 OlojJBGuIwwKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D0DCAC581;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:26 +0000
Subject: [PATCH v2 13/22] usb: typec: tipd: Use read_power_status function
 in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-13-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=a8r41F+GXMooCUu+KjgVBdiu8UWVrFpb7Loq9EHEDqI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesIV/d0vKnJ/dnraFIay9qvF9XIIp29ULZyyCEpu2G
 5X6hhR3lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACayOZrhv9NakSfS94v+J8+5
 ErajgbnGc2f2u9PfX8a9/K6t/GXHSmWGv9IPOr6nP56efXPBXW/RpVsfSBtPOXuwN/ffv375ivc
 T5fkB
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_084343_070240_E6CF6A60 
X-CRM114-Status: GOOD (  11.13  )
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

From: Hector Martin <marcan@marcan.st>

We need the initial power status to be able to reliably detect connector
changes once we introduce de-bouncing for CD321x next. read_power_status
takes care of this and also forwards the status to the trace subsystem
so let's use that instead of open-coding it inside probe.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index cd427eecd8a594b7e609a20de27a9722055307d8..e6e9730ee6dacd8c1271b1d52a02da49ff248d3e 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1549,11 +1549,8 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_role_put;
 
 	if (status & TPS_STATUS_PLUG_PRESENT) {
-		ret = tps6598x_read16(tps, TPS_REG_POWER_STATUS, &tps->pwr_status);
-		if (ret < 0) {
-			dev_err(tps->dev, "failed to read power status: %d\n", ret);
+		if (!tps6598x_read_power_status(tps))
 			goto err_unregister_port;
-		}
 		ret = tps6598x_connect(tps, status);
 		if (ret)
 			dev_err(&client->dev, "failed to register partner\n");

-- 
2.34.1



