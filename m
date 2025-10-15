Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBFECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCt/Fvnt1qBlOKSutGuAoeuGXEKfCXGiQXLssPHZnoQ=; b=yaSmsg5BmsWYW6FHHkNvWoyeBK
	i47T5rC1bUK3q1/MkEC81EPSq/nrqhtwdhk1Ju8Ci6jmtjw9W8fIC8ojTajEJpObct77VQDfvZBSj
	ZrkgjIYs4GAvpP/8iyZwqjMFOMFy5XZAa/5SYcPAIzBoxvgOpXqPn4r5RmK/e7EhySRu6M3tObFnw
	vzUSPXOEyXQzf7LQno1nTL6f1ni75kV0GXF8lkQtxuWVAPFTgH68T529m4V4aw7+SoOyrFROdeYzq
	ntAZtsOGN0sCO86mLtzlM1mrg45Q0i010lRP5foSxBwEYjjw4SKuOL4o8LzLxaGbg+RfIVifFF66A
	0mtnB1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93cr-0000000289z-1JhE;
	Wed, 15 Oct 2025 15:41:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ck-0000000283k-1T4k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:41:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEA164A3C2;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BC6FC16AAE;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760542869;
	bh=DMGFEJn/13K8pCwgFfOu2qPEs9uFdthFJZx/jrrxzCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UJKinHNkHuv/YhT9h/SGrKXTNHeypMG7qbLqNxoX0fSrT7IuLhQTp0nXMAEaUpRDH
	 NKfhqiRX/PQmMR9iGrO7DII6VsPDc1nrmZbNxVi2mLgS2WUbHa5W2WVvpKsp4RWEf4
	 X0J5PLWZKhoz0wO6/L3DsNqg+QJX0PxIZmTurWRpRn/AJ3JE6r0oV7jn7E8QJWqUMi
	 ZCHJvZC3domSXaVe8SFs6cIoNF5Uzu6vE7eo9p2guRXeOzWtJFxThLjL73Wh549D6+
	 Ea0Llu0HQGY30AC8Xp87Od31o2YcuF4jF59pcqjJbbiUgCZfcHTo3m6PigI9ealc8t
	 V7q/t+apbVjzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AE4CCD19D;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 15 Oct 2025 15:40:43 +0000
Subject: [PATCH usb-next v2 3/5] usb: dwc3: glue: Add documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-b4-aplpe-dwc3-v2-3-cbd65a2d511a@kernel.org>
References: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
In-Reply-To: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=DMGFEJn/13K8pCwgFfOu2qPEs9uFdthFJZx/jrrxzCc=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8b7AxN27CuRbuBSvboh5cUa/m7xUK/kymuzX22YsPO2S
 PY8rfS3HaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJ7PJkZJh7crHvoRfbJvLK
 Ts7JCK01Spd4G1ipwDij7rP/HlbBsAhGhjlvXxvVZnCWHE7kCr7OohSv/1JYjSntzOnLVwL2GHg
 ycwEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084110_444627_D5755944 
X-CRM114-Status: GOOD (  14.73  )
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

We're about to add more exported functions to be used inside glue
driver which will need more detailed documentation explaining how
they must be used. Let's also add documentation for the functions
already available.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/dwc3/glue.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index cc6e138bd9ef2500215aba665300e7638f3d5214..bef4d9d68558f130f36a9088d7bb3b1220e4c048 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -36,9 +36,36 @@ struct dwc3_probe_data {
 	struct dwc3_properties properties;
 };
 
+/**
+ * dwc3_core_probe - Initialize the core dwc3 driver
+ * @data: Initialization and configuration parameters for the controller
+ *
+ * Initializes the DesignWare USB3 core driver by setting up resources,
+ * registering interrupts, performing hardware setup, and preparing
+ * the controller for operation in the appropriate mode (host, gadget,
+ * or OTG). This is the main initialization function called by glue
+ * layer drivers to set up the core controller.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
 int dwc3_core_probe(const struct dwc3_probe_data *data);
+
+/**
+ * dwc3_core_remove - Deinitialize and remove the core dwc3 driver
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Cleans up resources and disables the dwc3 core driver. This should be called
+ * during driver removal or when the glue layer needs to shut down the
+ * controller completely.
+ */
 void dwc3_core_remove(struct dwc3 *dwc);
 
+/*
+ * The following callbacks are provided for glue drivers to call from their
+ * own pm callbacks provided in struct dev_pm_ops. Glue drivers can perform
+ * platform-specific work before or after calling these functions and delegate
+ * the core suspend/resume operations to the core driver.
+ */
 int dwc3_runtime_suspend(struct dwc3 *dwc);
 int dwc3_runtime_resume(struct dwc3 *dwc);
 int dwc3_runtime_idle(struct dwc3 *dwc);

-- 
2.34.1



