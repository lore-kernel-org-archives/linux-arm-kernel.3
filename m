Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02016E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzbzO6CJwLccPfkWtJ0+CvDng44py3nFdjMzI7Msc48=; b=id+XvnRDwTgvBGKzb3jK8WnYvr
	ndFnvUSnUpgnmGoFi0G6lzi2mLmr0mhdQyrWBi+045fzT/KoCmmPq2zo81furhfY74ZKOY5nN1gNn
	gTOrp2xTqmSFpS6GhEnUqg6LzPBW1VYA+Cd6qhHR6+Q8u66Y/G56bT9oEU6x6Jj9xH0HAbdGViFXl
	2GmLNyY8WzQJKuQ4Kd6FpDUmjlXD2W2PJ7jngvVFl7JNv15a+RP2VqR/0Wi4vkI57SaHZ91qSAHhB
	qBhNHuPiIVOHqwjwgoQw+xQJJvMngB9swDNr/p5sO1SusGfXH/Al05m17uisLuBEYOcROaWImrt5c
	UN29m+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39h-0000000Fall-2IQa;
	Tue, 23 Dec 2025 14:14:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39b-0000000Faj7-1rdf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:14:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0b4320665so76152355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499263; x=1767104063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzbzO6CJwLccPfkWtJ0+CvDng44py3nFdjMzI7Msc48=;
        b=lBVDEOTxGM8hwG0iIC8G3d1mV4oBJo99WgXxa9ORURTLiSf9V9dtT1lCogihSsr4Qd
         /pM4AAQ1ZjbLkRqqYSeX7h7YcC4jCHsaSHwFLtTb/eOL1Dp8tcDn5g9o1cU+PZ/KnQ0l
         UsqWhMoY8LmnXLd43DgF66R6CYQwJS8q1RSY0iQ8Dgg2LI0sdwm1QByUVN0ipb3Mj2Vd
         L4o75qPBrj/kwJSb3gehXz1LS2kkxol4K9POp6Ze6OiAkgsCDqprtvh7Sg0jO6fVglfM
         UUgfCBv9omcFh9J8Ikljfj6WvvjTdAjpo8Q5i5MpCEFk1QrXy7yfkjuRtJEx+w1KoTXI
         cNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499263; x=1767104063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzbzO6CJwLccPfkWtJ0+CvDng44py3nFdjMzI7Msc48=;
        b=N/o2lrWZGdT5Z3dgQ5wh2KlMCmusGCnljaMrGtzd990TLubYW6MGsERpV+hGpRc+/G
         msA/6chRKWtb5ELTxOkd1FxRQ3HtlzebE7Wowx3OKHZmFMZS0jmMrggPBOV5rVhsaaG9
         ZgFnvg1DPJjTivkOZ7nZyPMQQlchrwEDmOiMpiVIwAOJBjMcbErd0arNrAgJZhpEnvrv
         vT0LC8BDex9LA8WN3F6BatzZX9GD7uB1vnMkagp5eLpyTJMSdU4C9Gyikn6bBytVdmHZ
         MLX7B7nJGZ0QMOnnkzma7sfbzWWDj8ICHPTzS476ysBXYLw6J32feCWHC7rDwaTqSNmq
         0+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjhM8r+lUu37km0oQf33Bjel93357JfCI3IfVpLWgR8IPq1qW8AHlZ+Pc+u5ojPKU+1YwaNUf5tOcfm0roNG5t@lists.infradead.org
X-Gm-Message-State: AOJu0YxiJ9k+jpEBn2GG3PKe+b/gVL0FNTAETlRaFw6sbAeA1jhLplpa
	bxo93zz+ldRaPWl0Ke7XvQaaUPhbtaD6kLtBWyMNvT0NTOg94JTpP0rM
X-Gm-Gg: AY/fxX54jAXJtq8FwAtOLW1XZoGiwdMyRqLh76WPPuJCK4kcnF1dw3RqPkMC1aRtRWr
	IVnV7p8O/UJkagvvCE+2G3EMemeJRbAHEsdh6OwSwA/vxNuTCSn2HRuC1+Ints3kdCWELvYrIHa
	6mpesawDF+T+SQV2YGPOE7g7dMN8HaZ7645mqjcmCYaUMSaTdncMZ+NgPO/8L2s6Rl0oy7DThae
	gIVH/94FiLzptZSFfuCFaQ/HsSsQoyWEPaow7LKtWfKBGFv31RLXuUc6HrwJYpbyB9K97zF/Fzs
	4fcyxzSyzhy4s+KTFblRYawKAvh2tPRRnUk+qkydfq5XuJVKcVPs1pFY4uqaMyz824YK2cr+CmH
	RPV8YR7TjIXGpQVS+lFKHO/xXXbrzQ61y2j2tA0CS32Mf0PSZFuGP+fMYyEt7nrTNy2Ch+KN8wJ
	p8b2sZHmuTjqH3
X-Google-Smtp-Source: AGHT+IGQ72Qv40VXzWytpO8QexsPaVNcVSgbu9++QRVSPgfELMtmnY3IL6BZct+pHXLP45EtI7mwDQ==
X-Received: by 2002:a17:903:3b86:b0:2a0:8966:7c9a with SMTP id d9443c01a7336-2a2f2c5e17cmr128978835ad.58.1766499261071;
        Tue, 23 Dec 2025 06:14:21 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 23 Dec 2025 22:13:44 +0800
Subject: [PATCH 3/3] mfd: macsmc: Support variable app endpoint start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-rtkit-v10-v1-3-12b4783d6403@gmail.com>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
In-Reply-To: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4098; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=M8K2zyn6hgbZbYWDWq9d9LHWwqY0uxaEJ1APjbEF8uc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqO0FVpbSnWy2ywhYchunAaQhBkTgjRFRp5so
 ykp/7/dG8iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjtAAKCRABygi3psUI
 JIEoD/0f3NCHVZ2r8ele5bqiSXKPtHaBivP+HJp6qU5/SgN+2PTLkkR8FGBjk6qCd+1BklLR2lx
 YgHveWm7ER9OJn+oq/kdjl/Qc9J3csrgRdnpH5LJWHF8bEWoEfmZ/rP/NQrAd8N7FFJNkhhaRVN
 sUT63qgPNEPIV7O1w75BTVaS+xBXsDjE45D0pOmyMixLEX8bRpToAtMeWIiU51YrlxtDJ3zmbwl
 f9zPJK8OHe/cAH1JE9E+s//hWxzM9GV3tjg02NGv7bUylHHc7skszdfH5UUWAtxy5zX5vTswKFW
 CbKr7606xyLB42oJM7ccaJYsBBAAIlLZNhdufUlawnPofJyHy9qxRpvtSrKH64zkN5nwUBU8o3Y
 yWCxQyj2UBw5lq+7vlrUtKVCnI1n8r1vlzvc+qSzMctfnNVVU4NVWYj32FStCm+bC+g8P0WLOzp
 qg9Q/UpZe15HvQOQp84YHipBRVSl/6ganKd8LG7Fliqe4XV4D7IwOFbgO+Koxc/hj437iMGrhvc
 LTTmT+K3F/2j40vUrR/H8mIRtHkVa4blaYlmXsoc6QzZUvEGwJaz08V9OEnL+Nv+U9csORd6yOB
 SURtZQBqNHF3JCQWeaCCagEHpm0Khnn3kYGCcl0vRRECxoZFnnqK+NOPIOg2tvXpEsPQIdKQfaU
 asmCSLfjrPHh2Tg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_061423_514168_F0ACDF55 
X-CRM114-Status: GOOD (  16.39  )
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

Instead of hardcoding the SMC endpoint number, use
apple_rtkit_app_ep_to_ep() to convert a relative endpoint number to
an absolute endpoint number in order to support protocol versions
with a different start of app endpoint number.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/mfd/macsmc.c       | 18 +++++++++++-------
 include/linux/mfd/macsmc.h |  2 ++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5e4bb4832d80ad1fc002d413a291a..4e0fc5ddf9293ee7281680e964fc5f9b80260b3d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -21,7 +21,7 @@
 #include <linux/soc/apple/rtkit.h>
 #include <linux/unaligned.h>
 
-#define SMC_ENDPOINT			0x20
+#define SMC_APP_ENDPOINT		0
 
 /* We don't actually know the true size here but this seem reasonable */
 #define SMC_SHMEM_SIZE			0x1000
@@ -72,7 +72,7 @@ static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,
 	       FIELD_PREP(SMC_ID, smc->msg_id) |
 	       FIELD_PREP(SMC_DATA, arg));
 
-	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, false);
+	ret = apple_rtkit_send_message(smc->rtk, smc->ep, msg, NULL, false);
 	if (ret) {
 		dev_err(smc->dev, "Failed to send command\n");
 		return ret;
@@ -262,7 +262,7 @@ int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf,
 	       FIELD_PREP(SMC_DATA, key));
 	smc->atomic_pending = true;
 
-	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, true);
+	ret = apple_rtkit_send_message(smc->rtk, smc->ep, msg, NULL, true);
 	if (ret < 0) {
 		dev_err(smc->dev, "Failed to send command (%d)\n", ret);
 		return ret;
@@ -330,7 +330,7 @@ static bool apple_smc_rtkit_recv_early(void *cookie, u8 endpoint, u64 message)
 {
 	struct apple_smc *smc = cookie;
 
-	if (endpoint != SMC_ENDPOINT) {
+	if (endpoint != smc->ep) {
 		dev_warn(smc->dev, "Received message for unknown endpoint 0x%x\n", endpoint);
 		return false;
 	}
@@ -366,7 +366,7 @@ static void apple_smc_rtkit_recv(void *cookie, u8 endpoint, u64 message)
 {
 	struct apple_smc *smc = cookie;
 
-	if (endpoint != SMC_ENDPOINT) {
+	if (endpoint != smc->ep) {
 		dev_warn(smc->dev, "Received message for unknown endpoint 0x%x\n", endpoint);
 		return;
 	}
@@ -427,18 +427,22 @@ static int apple_smc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to wake up SMC");
 
+	smc->ep = apple_rtkit_app_ep_to_ep(smc->rtk, SMC_APP_ENDPOINT);
+	if (!smc->ep)
+		return dev_err_probe(dev, ret, "Failed to get SMC endpoint");
+
 	ret = devm_add_action_or_reset(dev, apple_smc_rtkit_shutdown, smc);
 	if (ret)
 		return ret;
 
-	ret = apple_rtkit_start_ep(smc->rtk, SMC_ENDPOINT);
+	ret = apple_rtkit_start_ep(smc->rtk, smc->ep);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to start SMC endpoint");
 
 	init_completion(&smc->init_done);
 	init_completion(&smc->cmd_done);
 
-	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT,
+	ret = apple_rtkit_send_message(smc->rtk, smc->ep,
 				       FIELD_PREP(SMC_MSG, SMC_MSG_INITIALIZE), NULL, false);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to send init message");
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index cc09ecce0df7424b288d4248d869f4c9bed3e188..1a462baae0e38ac099f90988afda0f3f5ad968b9 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -93,6 +93,7 @@ enum apple_smc_boot_stage {
  * @sram: Pointer to SRAM resource
  * @sram_base: SRAM base address
  * @shmem: RTKit shared memory structure for SRAM
+ * @ep: SMC endpoint number
  * @msg_id: Current message id for commands, will be incremented for each command
  * @atomic_mode: Flag set when atomic mode is entered
  * @atomic_pending: Flag indicating pending atomic command
@@ -118,6 +119,7 @@ struct apple_smc {
 	struct resource *sram;
 	void __iomem *sram_base;
 	struct apple_rtkit_shmem shmem;
+	u8 ep;
 
 	unsigned int msg_id;
 

-- 
2.52.0


