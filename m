Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD903C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8LvETlpvfmRLPMNJAZRBxPv0T9l44dUeg5xWaQVYdU=; b=EpAObSPNuOZsahDRpyDyLP1SR3
	hXDvsZdnkr4SsFG8waHu3C5lF1vkm6azoKqehB+tDe9hmERqsvL/f2ptkHhP7Sr3D4Cvdl2KpjDmW
	9lUY7alKxwpOHijCuFkAsAlZcvSJs+a0N1oWdyzTlqu2xgIZmQ9cRtmT9Fs9x7btEwJWZkegXlZ2G
	J0WGUjd+rlO3J2FACapGciKH77MK3p07chA+uX+sjrTwOCfeT5ygxMhzSsQm88APnNGs3rBS3FhIi
	DtnLoYD8430gBTKmDTIoCkITemnDjpLnwGnuEuLiUVjjLjf7Vh39SAecqRwsGRvXBbD91dZrK6DhK
	vjIS2sgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxt-00000002m1i-2gf0;
	Mon, 27 Jul 2026 13:01:53 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxm-00000002lwj-46Re
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:01:48 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8LvETlpvfmRLPMNJAZRBxPv0T9l44dUeg5xWaQVYdU=;
	b=CO1dZ6d3He9vQlEdzpNbQPtlg4+lI9huQZw3ktsB0YhRMkITc64MwPbpIWmi45o8H1MzRo
	PJuHhbV07Ofq1UKURi3QrIRODfD81ImJcoqIiETqfUzTtOGd7BVNUYCsj8eFKwWxsUCvM9
	w/e9RwPiJqWI4QqbpWUIiPJvmCgG0oaGKx6RcoDWrv3sclQ/nVcxyqm+Jur5y8hQKxB5XM
	Gh1FB6DQeswPjmTLZaRiDJZ0eyRt/o64wyItao2N7XsW392sUY2L72DZZo8R5CToNjYcMG
	JBDQlIcY2QF19faAgOKczdDKvUGlQ5pzuEi+RTk6ClSeb8MIoo4hCmzHYC1uJg==
Date: Mon, 27 Jul 2026 15:00:49 +0200
Subject: [PATCH v4 06/11] nvmem: imx-ocotp-ele: Use scope-based cleanup
 helpers in imx_ocotp_reg_read()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-6-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=uV7ENiMD1Wh2iEaVPUtHrZxGI6SC1sRbjqoh1DEWumU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bPVHptpF64VLi/8HXNi6Zp/5x4S7J26V3PXXcA+oP
 vqbfXVLRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwES6JzD8M5OWcxNvvPW7/fqp
 k+mLRXe6/LR+EhmksV3/j9yMSR+TXjP8T1Xvd0hhNdBIPsRdFPcu5fDcyMfKmpw6lQrzTuxfMKm
 PCwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060147_174303_EFCF968C 
X-CRM114-Status: GOOD (  10.90  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This simplifies the code and makes sure that buffers are cleared and
locks are released at the end of the function scope.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 9d3f94e35508..010b53001323 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,7 @@
  * Copyright 2023 NXP
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -71,7 +72,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	u32 count, index, num_bytes;
 	enum fuse_type type;
 	u32 *buf;
-	void *p;
 	int i;
 	u8 skipbytes;
 
@@ -83,11 +83,11 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	num_bytes = round_up(bytes + skipbytes, 4);
 	count = num_bytes >> 2;
 
-	p = kzalloc(num_bytes, GFP_KERNEL);
+	void *p __free(kfree) = kzalloc(num_bytes, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 
 	buf = p;
 
@@ -106,10 +106,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 
 	memcpy(val, ((u8 *)p) + skipbytes, bytes);
 
-	mutex_unlock(&priv->lock);
-
-	kfree(p);
-
 	return 0;
 };
 

-- 
2.55.0


