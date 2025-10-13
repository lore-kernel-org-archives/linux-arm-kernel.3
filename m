Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD50CCCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVxL6knS/QoIlniKlZyRnCkeYwHSs5sjJkdYB6irPo4=; b=aIqAlIm2osGylDpR7WyiczYNL1
	+2z8wg4o4KL+SjmEcNczEv2XzIPRiYvFbtm+72Udq7gMhsvnyT45saguLl7wDNist+Ymujee7dwUQ
	gyMgQuUug3i66udQrV+gqgUpOBtv1yIxg4sDX7GkXNkySgxaymgoqdnXrGGJ5SkHcqlQIxBJ5Mu9M
	DD06jpbyJa3eGSCUCOD0+FlUQ8De/ah9YQgochYIdAP1xqW8lw4khMO7IMs1X/S/fqzwKjxCv6w8U
	WCCfYIy6HnxzI3gomM7gQRXXvTvhajh1qlSi46Hzwh3Z2CtMf30x6GFguzbjujb0OlE2GR6eCWXIY
	qbhazJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L1n-0000000Dnan-3JL8;
	Mon, 13 Oct 2025 16:04:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L1j-0000000DnXd-1hU6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D1BA4927A;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1584BC116C6;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371438;
	bh=b88sn5mMVCk/oe5CLT9hyAX+U6n1DTFMv6pGutiyXM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=psItepZlr5BidPnhnrXeKzfcN+bhsV8zT7H/KZogbgEXuuPLi0JHfn5v+/FJkOFtp
	 UNhZM36g7Kcou49QDr6dv38inMPlAIz7SZWGKbvStunUBf4Q6lM09rNUYyy39wQP5R
	 wZV9eXOWLQjSEI4ujbumA9+KXK89nQ7JGYFZqoZqEQVDFIeWzCq9cLOUH6wrBOFiNA
	 O2JnKt2xUOdWXGwJcZ4qgPMW3cJHywdKBZaank+2mnIqLITsgyq0f+6Q9cKDcIeIep
	 rxncTFTbHKrN0TH8fXWG/NQUa0LAanJjIaCsxgriO2CBfoSDsQ2um5nDoWvkQCk1EU
	 wDg/zPtfMCsqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07735CCD183;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Mon, 13 Oct 2025 16:03:27 +0000
Subject: [PATCH 3/5] usb: dwc3: glue: Add documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-b4-aplpe-dwc3-v1-3-12a78000c014@kernel.org>
References: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
In-Reply-To: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=b88sn5mMVCk/oe5CLT9hyAX+U6n1DTFMv6pGutiyXM0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zbpeez9SvfLDxyJURQn3vStN9Rsh5lJ2ZkP9//cuWvO
 YEbd25g7ShlYRDjYJAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBM5HUrw/+EnzNf9P47v+js
 /+//tFbfE5wZdqUi5ojfU+XvpeYO13oiGRme73yzLqXW7vGi1OxAvaxkhYrCEDNxnhXXPDIOKUj
 2B/IDAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_090359_486276_BC93DCE3 
X-CRM114-Status: GOOD (  14.65  )
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

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/dwc3/glue.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 2efd00e763be4fc51911f32d43054059e61fb43a..7f326cff12458901904d4c32f62ed9357d0f6e3b 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -22,9 +22,36 @@ struct dwc3_probe_data {
 	bool ignore_clocks_and_resets;
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



