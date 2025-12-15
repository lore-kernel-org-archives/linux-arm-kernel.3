Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88083D5B172
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7w71m+Yutd1Rx8zeRcwVUfhCgi1u7OW5zZsBmj+N2M=; b=txTuL/pGSzNNituOEPY47YNYR1
	9nLq1jA3RL3ZCdCCy4J673YarwxiRFpNTELN8GDIy87GQ4LMKgwUO1hdlLCtv8TIf1eSS+3lx7oCb
	JEtnfbBxnn/QPNSHeHc2U+dj8psElq3o+LXcTmf5OJmaOvtX1LPl0DPZQM62D/uPhf2L5V/NaTMQ4
	9/l8YRJpS3m882+yjC38GoL0MCrgzFZ40EX/iu8/rQBhMniJy0GFmcl8YCUCtXo4M0ea2omVuwqUI
	5IuHvhnH1+PIyL4pXZClfFvm4ZYW/8c9Uzx9usanPSs+Wmv/reb4+Ba35RqO0sV/JqGvk+RvXEjKd
	ZD16vOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aU-00000003njb-3DWS;
	Mon, 15 Dec 2025 14:30:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aQ-00000003nfa-2iPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDFC44429E;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA977C19422;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=wFu7HDRMAdpVlowB+kOuTDIm7pWaAUtn4h3uu6I0uGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mVlvm8DG13DHRlf6pbQ0CwxjRX7e1QBXoyQ4zS6YYr4pwOUdlWxurFqgBKXGDtIsG
	 Ez78EesXd/mLsNT5lLW3o2DgVPlG8fXDRuygtDjlC154UDHiNbkrgyxRkos3ifCrnm
	 BYtZfmOevor613ejDsdJLsT503qrS/i3kIiDOeI0rCKtyuiSExeO4oJtDzwu/jXQoq
	 QfKqhMSvajMBTbvKgpO1/iae3BGh4HstWrVKUe8Z+MhE/kjrUYyIs01+Tg4pvauLLH
	 RQNyuEVC+c2Ed4ZKOOTFpQoOSzRoVo/n+/bg1jVEOYLMn/IYYduvNv4iePGnlhqdCk
	 44CJUh4W1+RoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CBDD5B16E;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:03 +0100
Subject: [PATCH 3/4] Input: stmfts - use sysfs_emit() instead of sprintf()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3xHAswUTtGvoQ6NmHBshFsBrqnYL61pqa0b3OMWeB7I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrnuNSlCDEp3U0AMCL9StDPaBZkQm8UpZo5
 tdO7QEjWDuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 ctYxEACflPTTG5VIeyFgwBgtxU3aAkYDozrwSyYm7rqhN45yyb+3Lj+UkzWI1NLtbuG1vk1o8Ql
 wcRbmjLeFtLKzOWvGprKN57MWOeQRduWiYWua/ZES83aVbK9SekWaxB3r7CAdMrPwjegBrDu7Lc
 cJDIz3yMv1AIEpwlN/eNxj85cpJP7F8+URLSuwE4NEGZcQ+AS/+nOmG0ri9WXvMz1WCs7GwZSL6
 AbOfbbHS0NVVJnSI0BqY1IlSzqBeQl9JSvGVqxgPiWXatmDFaWw+R/MDOiD/Eebfg6/S6onh4+Y
 K7ALIXs8jyrwovmA1FU0vVeHi/hRTvfQONG4G4r1vM4XceEVZyd8u4VHoN7O3M0RGIpxRa+X48/
 JYrrw0Bfe7tNzsl/m6tin9niNbdOQ6IULtAfRbA/E2PVaZDvm5VYRA5bIbb9fmWTnARq0vjshS9
 Cdk5P8sbVjT9Z5AACXDF/0cMszhIU1lnq6NA0rfIO2wfqgPqTPOI8sRdld2lnG0rz7F5NM/Pc6X
 nioeug9YnEXFUKhdPAfEGq/xFPNyE6nukMO9zV10WU/Duc0uE1n5gapGiXvuiwVUlbn+wYGhqpx
 D8vVJvrBlXjrtEtD15BONuFCNhJLSfMOrccvCSbTWRQyChqsrIOVVGkMHzQgZknDgF7OMM5pXMq
 kci2Br62lLhawTw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_063006_728410_525DF229 
X-CRM114-Status: GOOD (  10.60  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index ad363b3c344cd..4b166b0a9a5a6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -410,7 +410,7 @@ static ssize_t stmfts_sysfs_chip_id(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%#x\n", sdata->chip_id);
+	return sysfs_emit(buf, "%#x\n", sdata->chip_id);
 }
 
 static ssize_t stmfts_sysfs_chip_version(struct device *dev,
@@ -418,7 +418,7 @@ static ssize_t stmfts_sysfs_chip_version(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->chip_ver);
+	return sysfs_emit(buf, "%u\n", sdata->chip_ver);
 }
 
 static ssize_t stmfts_sysfs_fw_ver(struct device *dev,
@@ -426,7 +426,7 @@ static ssize_t stmfts_sysfs_fw_ver(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->fw_ver);
+	return sysfs_emit(buf, "%u\n", sdata->fw_ver);
 }
 
 static ssize_t stmfts_sysfs_config_id(struct device *dev,
@@ -434,7 +434,7 @@ static ssize_t stmfts_sysfs_config_id(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%#x\n", sdata->config_id);
+	return sysfs_emit(buf, "%#x\n", sdata->config_id);
 }
 
 static ssize_t stmfts_sysfs_config_version(struct device *dev,
@@ -442,7 +442,7 @@ static ssize_t stmfts_sysfs_config_version(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->config_ver);
+	return sysfs_emit(buf, "%u\n", sdata->config_ver);
 }
 
 static ssize_t stmfts_sysfs_read_status(struct device *dev,
@@ -457,7 +457,7 @@ static ssize_t stmfts_sysfs_read_status(struct device *dev,
 	if (err)
 		return err;
 
-	return sprintf(buf, "%#02x\n", status[0]);
+	return sysfs_emit(buf, "%#02x\n", status[0]);
 }
 
 static ssize_t stmfts_sysfs_hover_enable_read(struct device *dev,
@@ -465,7 +465,7 @@ static ssize_t stmfts_sysfs_hover_enable_read(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->hover_enabled);
+	return sysfs_emit(buf, "%u\n", sdata->hover_enabled);
 }
 
 static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,

-- 
2.51.0



