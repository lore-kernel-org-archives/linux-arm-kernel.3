Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CFCC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+HmpXKPAD9ALBIJIuYji9/wPjq2kkxzldwrjVPCxR28=; b=tr8XZdE5GOj/8LuUZZNVgqVuwt
	CfMsE6GoH7CG2m+6bhAzPhNnKlfDGgCvE/FlBwoxbNK3mX+RUX3JFXfddfqWbVo+rrUeYVOeCEcRS
	5rz5BMXxOuDLferv5AOAypaVhRqUUAmHrB5YdSHqwsevQkZtkD+AI1N7frKtV30mloIGYaSEurlow
	GmbCtQ/RHFNd6XQJyhGFAxKxsSCcU1PHvWiLWl+2b8IeETPVRp3IiLbRZ6SX65tOroocEUI2isXxO
	QxqkjQS3dHh8u99EiP42UyFCkyZxeEAX6AVQWMboQaPjvfhvgQLMk99DDpWfyaWcO/aFW7nX7NYK0
	uy1KNIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkf5a-0000000BPkZ-1umA;
	Wed, 19 Feb 2025 08:05:50 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkf2l-0000000BOrJ-0uHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:02:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0A4CBFB4D;
	Wed, 19 Feb 2025 09:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1739952165; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=+HmpXKPAD9ALBIJIuYji9/wPjq2kkxzldwrjVPCxR28=;
	b=jldIeh9Bo4Rrq9MdnBTo0xAocBcj2Iin0Xgk0Y0oHrMk0TxEMuIpMUqEx5KveF57Mu2dDd
	BhShyOY9RRWjZfADJlz2q1hy0nD47pzrIY6UP0iCUOv+IZpOeyzHYIsSVbxYluytO5bOWx
	Pv7BVrvgptD7w7/IzMQQrIn7VfOd1AeM4CJttcJAlksoLmQ8tMZ0btBS5LHt7izgguMDqG
	DLYVr+niyfO1W6xsXon/otZCHG5V4OtMHkbHO7bk5aNz1JNJbUNPIudRTGuF0KONxkXf3L
	QNkLKT7gqTsKe46eAr0Uo6YAxoRMcvxbFRwiKcHCMe6xx93BnTnwV1PCEF6RIg==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>,
	Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH] regulator: pca9450: Remove duplicate code in probe
Date: Wed, 19 Feb 2025 09:01:48 +0100
Message-ID: <20250219080152.11883-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_000255_695072_59A0543F 
X-CRM114-Status: GOOD (  12.64  )
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

The SD_VSEL GPIO is fetched twice for no reason. Remove the
duplicate code.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Apparently something went wrong when preparing the v3 patch
that got applied to regulator/for-next and is now in linux-next.
---
 drivers/regulator/pca9450-regulator.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 4519e725706cd..8f81d813640d9 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -1100,18 +1100,6 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	/*
-	 * For LDO5 we need to be able to check the status of the SD_VSEL input in
-	 * order to know which control register is used. Most boards connect SD_VSEL
-	 * to the VSELECT signal, so we can use the GPIO that is internally routed
-	 * to this signal (if SION bit is set in IOMUX).
-	 */
-	pca9450->sd_vsel_gpio = gpiod_get_optional(&ldo5->dev, "sd-vsel", GPIOD_IN);
-	if (IS_ERR(pca9450->sd_vsel_gpio)) {
-		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
-		return ret;
-	}
-
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
-- 
2.48.1


