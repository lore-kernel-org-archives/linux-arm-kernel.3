Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74EEE77183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KV2xbQSHKJvj/DTKYIg0pZucUjVVxC63u16azmPWVg=; b=OfpS+DxT20REkuoVq/i8gP3sTW
	HqTxGhGQv2y1vkobSgQme7L4ssdwSbw71Km/aq39a8EaWP3iSYThQHhki07Rjw61RyhLvLwIdkMYI
	U9z4EyArdfp0SNZGmfs32jrs6LqZwM7MwXFnbKm+enO76TlE+eQXCoJd2PicZOX9IcbnVmn5BH/gS
	rOiedAJ7d3RVz4Jc7a0kQQFB4vuslfir45YsdfYf3sT9mk+cKWuqGRb93KT8nhDXon0rZ9MQzGNCk
	Px4ZYvdHtyK9MK6UnXcHAQl2HaBgAEUOjMwFPiMFwfOdRv3gReHZow2yifukyzLpB5FNuVmROcQhN
	ueeDtofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNZv-0000000C0KT-1gzk;
	Tue, 17 Dec 2024 02:44:55 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNXm-0000000Bzru-1mqU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 02:42:43 +0000
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0CFA7160E15;
	Tue, 17 Dec 2024 03:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734403360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KV2xbQSHKJvj/DTKYIg0pZucUjVVxC63u16azmPWVg=;
	b=wR95ql9qIuXR/kO/Sx2tUoawOYHaahfOaPX575MFHun0NvBiCFGmqMQH75AbY0kSFSdHvC
	CEmxgwFH8TDmdDbgOjjdzUmYYtpJADqDsp2mQWB0ehn8NaP8izJchk/VNpY8ScRSsv3ZMB
	d7iB030lOxyfNnvmWPFNFFfmVB5fHdg=
From: David Heidelberg <david@ixit.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: media: imx219: Describe sensor address using the reg property
Date: Mon, 16 Dec 2024 21:41:51 -0500
Message-ID: <20241217024206.1700170-2-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217024206.1700170-1-david@ixit.cz>
References: <20241217024206.1700170-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_184242_617051_B9EB2EC4 
X-CRM114-Status: GOOD (  11.68  )
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

Use the reg property instead of text in the description.
Drop useless description of reg property.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 8b23e5fc6a24..066eeb7af5e3 100644
--- ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -12,7 +12,7 @@ maintainers:
 description: |-
   The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
   with an active array size of 3280H x 2464V. It is programmable through
-  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
+  I2C interface.
   Image data is sent through MIPI CSI-2, which is configured as either 2 or
   4 data lanes.
 
@@ -21,8 +21,7 @@ properties:
     const: sony,imx219
 
   reg:
-    description: I2C device address
-    maxItems: 1
+    const: 0x10
 
   clocks:
     maxItems: 1
-- 
2.45.2


