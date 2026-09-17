Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F718C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y2bda2hrUG6hQ7CFdDx3ecwHTadsaa86mvc+4OAGxTA=; b=lGoWvGqnn3kzJPvUTh4cgsKw7u
	azQXdMWWAHSAfRAga6org0E/QvIuTKqCI3D1KrXDtSOPAR9P+FwM2GZnN7B93/OZwfjIwhkboZvjn
	A3S5Iqi0wj54fjFTd21/6uXYfCXKmv0lrbLPPCAfXhDKiTZMQsralcspWrtP7e5lG2p55bnuhtHDB
	pnyUQ75YCgb5NSXQY4Bg2ggvLR792HS0Ud/sNmY4mqcYYEshlVz01zxrkHjC2L82D4S4v9DCR3cQ5
	8OsKkjYSQHOo7ZpaJPK/BNxCp2BLj8FGPi3A/UNlI/umN96DJLigaqJ9JIrwK34QoJ2hr7+E5syFu
	n1TrJ9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zx0-0000000AKJX-0026;
	Thu, 17 Sep 2026 00:26:06 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zww-0000000AKJ5-3Ooy;
	Thu, 17 Sep 2026 00:26:04 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hlc481rMBzKmTs;
	Thu, 17 Sep 2026 02:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789604760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2bda2hrUG6hQ7CFdDx3ecwHTadsaa86mvc+4OAGxTA=;
	b=LVcM73Eem2G3RPSRFOEqsWTEPHOi5cBm7PAXLHakvQqkNTiq+EdUGpMCoYQ8aAA+aoXKEj
	KUVgL4F3O7MjinVZsWkuMcnMXmlMV1MFof4PMyXghZQ+hfXrMd2hQXJy0JaIy+4afJZY7/
	u5ySArX3tSW0rkeV5f02M1KHSnHv6ByLtKSVwj8z5MO6Fgg0Gm8+6BKwxZvYS6w0vf0Kpg
	SIex5ASPOayKrj0gKEbLbUC8AnRw0ODhhQGZ0HMTveazTa+eE8ltHm5eIxqXAiaGbQl5Ai
	dALrODv/HBBesxezlmJDKpV+qcocr1Fq/AjSEMHaqNbhvZRkYbRIn+DbGR8ueg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789604758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2bda2hrUG6hQ7CFdDx3ecwHTadsaa86mvc+4OAGxTA=;
	b=EZqcg+WQUyvUtdv/nHiupPdm/deT8EPGSs5rb7EK478h7iEZo2IneHSf81b1gRbdFUWVDt
	lN42hhGn/nZ1lI6jD2DWY1VngW2vqwrnzW/G5s2yDpuvHo4cdBLD+DnArJmBc6nTMhhr4T
	UiWjkk+LLpg2n8VN7Nlq3CP2CuhWzblpWFLhlmx0cgFVQmg91EZXq00X0g77+7Ai8lJzaC
	tygj3XrXsgCdhH7cAo2ljESfYJWBILVp7GbRqkM0YmIPZnCkm+ZceUcR2kBg6ibwemoC5U
	OHxUOO2KJ4Shk2MGMmOVSvAppndUOUPsBLaIXQg+RAjJrJkLxK50JsIbn9KMAA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] media: dt-bindings: raspberrypi,pispbe: Fix example indent
Date: Thu, 17 Sep 2026 02:25:18 +0200
Message-ID: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5qp9m4k81hdz7qiox1nruwzn77rx3jcs
X-MBO-RS-ID: 08714f8258e988e5b26
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_172602_995670_6DBB5E3D 
X-CRM114-Status: GOOD (  10.13  )
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

Fix two spaces before { in example. No functional change.

DT checker reports this as follows:
"
./Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {
"

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
index 1fc62a1d8edaf..5c0f2f7b1d957 100644
--- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -53,7 +53,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        isp@880000  {
+        isp@880000 {
              compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
              reg = <0x10 0x00880000 0x0 0x4000>;
              interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.53.0


