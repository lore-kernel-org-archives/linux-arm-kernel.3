Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF92C5ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc1ud4NvoSk2r2XkR507CAgHdz72HRaNe5gFe/sJK8E=; b=uy+AgyT7EXF3B7Ky7JqGv1Djyf
	1n+s8rmzS4GgxLPuK8ogxw+UyFQ7Gzf0T1WwF3Uv7CFYP5PdEg0f2TMqiO9PyiZC6tFTAddIjP3cq
	1ytOa2DT1sYXkkwiWoPWPrdOwHuj7WHzP3/1GsY0fDoO4dHbzW2pLuN/Gq8Xqt+rOp9l9M+FNGEVv
	sbeeqnlcHUkerlfwZIYQhPoXIJDVAdh8ijN4iG5/jon2zUEfLWQ1EJP7SKwvFIjkoFcFhOs4DG8bi
	3gVWB35pMRc2GC5EHNMM9r/py5JCJKjvHNdqs0Cp55JKks2YvfwEHDzjAfYLDANtrtK3QPkt+YQUc
	dkSAdjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5V-0000000FBX9-2i0Z;
	Fri, 20 Feb 2026 16:10:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5Q-0000000FBRN-0Z8x;
	Fri, 20 Feb 2026 16:10:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A2ED84E40945;
	Fri, 20 Feb 2026 16:10:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795395FA8F;
	Fri, 20 Feb 2026 16:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7882910368D1C;
	Fri, 20 Feb 2026 17:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603832; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sc1ud4NvoSk2r2XkR507CAgHdz72HRaNe5gFe/sJK8E=;
	b=a6i2RJyL2lZNjW2hv3kXp3DpYkrzMP6CA6mYlLELH1wOzZVx5Ruuh0ikaKvklhk+jzm0aL
	enWEmtR5phIczunvjo4Z5LVL5aisAdukPwHJiil4v9lza1fiNHJP9PJa/K5NWl6DBktl4l
	YGksdqN/u2vlgxvEwGBv9OJQb/Wc3KYVx/VBAiTtA5WRIpju7vlbgwgEv9f7JBZz32zt/z
	sIfpn/4MaE1gPj6JXtmMyWCo58FaY4azt7vapiW30EHX/+TIto0tXaPW9ebANNa4SYBFtB
	jnoYN1RMgS38Qi75XgMp+pmfQPCCjnR7bndOLgZxo/eouTa1n0O+AKrgWABZnw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
Date: Fri, 20 Feb 2026 17:10:06 +0100
Message-ID: <20260220161011.999642-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220161011.999642-1-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_081036_303600_AB3293C7 
X-CRM114-Status: GOOD (  12.67  )
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

The available length is really USER_DATA_LEN - 2 instead of just 2 (the
user data length minus the BBM length)
That doesn't change anything now, but if USER_DATA_LEN changes, it will.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9dcdc93734cb..c420909b944b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1761,12 +1761,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
-	 * only have 2 bytes available in the first user data
+	 * only have USER_DATA_SZ - 2 bytes available in the first user data
 	 * section.
 	 */
 	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
 		oobregion->offset = 2;
-		oobregion->length = 2;
+		oobregion->length = USER_DATA_SZ - 2;
 
 		return 0;
 	}

