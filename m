Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F28CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=349qNNoByqVYF++DU+sob8mJAJG0TZ1Jpek+vaeVwCY=; b=1TqzFNwNpjo3H1a4YgTNmXc9q0
	lH5va7agMTrWwPkSnQdLcSYwjQDcuNWAY53DmnFxs6qXkCty1XL1cQxRpXWMPMexYyq91g7VkJzgG
	/BKC1aevSLwGKuLq+MjII8IUGrJUC4avYhA1EzPah9MiDagDHdtwMdgfuaWfh5tt+PVxsTH+aSPBQ
	7BLyPHOCCl2ST9V4a9Fa2I+MqPpzktgIFCQp0mE2E9zSeTQSQyN20OP6OMg1kc3p2xEgZ20X8yztG
	al+lzUQGMOlIoPH1gZ4ROBZ2GR/2HA+Y9VKFmXwekciXHApY8qiP3+wq/d9d4Wc6OO/KFSWwRDtbJ
	rBPR63fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISNP-00000005y28-1zKz;
	Sun, 18 Oct 2026 15:00:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISNI-00000005xyt-08ku
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:00:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso10428125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335634; x=1792940434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=349qNNoByqVYF++DU+sob8mJAJG0TZ1Jpek+vaeVwCY=;
        b=CFCi/E1uCPn+AuvOaK3uRjErpoQEr9MpTNKdFYW1b3zHI8LnL6zNitCmDBL+Vuy2WW
         6BzFaoHgImXK2hNuAGQc6szGni2fLeymOGG6FqBIC8zzJV7Ch8kwd8qPJgxDdtme5vz9
         LWh+kZZq7KUYwCb9a4zPgdKmrqeAxuRZbY07hElhAsoHu1HMn44UIZmFOudV9b0HH+mX
         2Gon7ctOyVsl6QpitA4cOOITxEwjL7IYJRCW0sh31Qtzdw3IYBUHkDL5CE6A6/WfnVvB
         qS/Pe47OdMCcTIiaZMqS4WWOYMEYUQ9Aymv71o8sGD8+XCeuvMjiaXvgDxRZFoTzs40q
         O9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335634; x=1792940434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=349qNNoByqVYF++DU+sob8mJAJG0TZ1Jpek+vaeVwCY=;
        b=JGfMWmNIxRZtQv83utKgH+wZcOGCyKEYxWiQxB5wuBO30+v8xlI+XUUNn7l+VL/ufw
         +0Pqd/tzHsbgCN2C3ZfBDWfxwqTNcq0XUIACzI4EE4hcYSd7c5XnFcklJPBIfl5tD7ns
         NEBR95Bry5p4RvlJanYbvn+9sZ4yUdpMwZv0Wjna3HTd+O//pQBije6AlpEBhTdOUZQJ
         sYyEWUEkElbofvyON9wbpLPxPkp7JKx5IQMNK9Kazgx9AVqoQm/EoF4CB38Wb8X15xaL
         H2XONCRlATLb1Wi8RV873q+uD1BKMvz54q3X6PjaOuPjjhmePTaKTyAW9tvn9TDkIEDA
         fFMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8VGdMvT1oxfzSIk77w8t4XiJ1MVRn4SSidY/oX+eSvaNtC7Ty3vy+JIA7yhIXFU5cgfAVJqs0/0EMaxkQTosG@lists.infradead.org
X-Gm-Message-State: AFq9FYKNP6D1FAxHtJGFBoL8r/5EEQh7LLonVQtPMoUGoamKZ/8lkfV1
	33JA7hXDr0uTLcrnT6SUC/6fvTQvhiaRvB6Y99nBgqQRVL1Wsb88d1wp
X-Gm-Gg: AYBFou38w1Y5ueYkWqyPo+2PAOqtnQT617lJMw9AsvrZWHtPyBEgBLe4CImt+hp286F
	LgezZyMmAI6r0p2x1h26pChlRALX3mTUQMZPzs91tBPjryvRPQah9AFGwPwrIKFqS6hgm8GXsAu
	Qqpetx58hPwI1cxvZw3XRwuKg0j615cjXdapNYxoEy5eIipexbOyC9kWSUvo7gNYD3skbZ3zG60
	JOaCMu+Wd6mEBOpCmWb7Qf5WKSi0w2yl7pRX6x9gQgI4G5l4K9T0h1TXFuMpXlcvi0BvSwKV3Qq
	a9deWJEerKgogSAn/AQyDr/LU8QNMqHRXwy4P2fCI5GpShnWTR7EIvlYlZGaDv9FWAopv2I8BEI
	57zka6V595tvDDoB7DNPjn36jnJ2atUzAMjjx3vtOx+zaefcJ6zyVoSQEeIxU0adY/zRKdcExCr
	x0MwbAV+MiikPOnCc0NtRFz+BxOsdQiWAWKn128iLi0497wYfp79N5P2FG9J4sD0y8YP+T7rDds
	AtXfTB+IytCeX/YHlT/69Qzr2AikWDTZ1dLQxwXzbl4s7BRvGjlV/7o
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr115503175e9.13.1792335634123;
        Sun, 18 Oct 2026 08:00:34 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm212868925e9.3.2026.10.18.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:00:33 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v13 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Sun, 18 Oct 2026 17:00:27 +0200
Message-ID: <20261018150028.1047172-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018150028.1047172-1-sander.speetjens@gmail.com>
References: <20261018150028.1047172-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_080037_583157_3376228C 
X-CRM114-Status: GOOD (  11.78  )
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

The Raspberry Pi 5 has a built-in RTC that can be battery-backed
via the VBAT pin. When a rechargeable coin cell is used, the
hardware requires a trickle-charge voltage to keep the battery
topped up.

Expose the trickle-voltage-millivolt DT property so the driver can
program the correct charge voltage for board specific configurations with
the attached battery.

The property is added to the existing raspberrypi,bcm2835-firmware
binding (rather than creating a new RTC node) because the RTC is
accessed exclusively through the firmware mailbox interface.
We only $ref the individual property from rtc.yaml and do not
reference the full schema, because the firmware node name does not
match the $nodename pattern required by rtc.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V12 -> V13: No changes

V12: https://lore.kernel.org/linux-rtc/20261018143712.1040152-1-sander.speetjens@gmail.com

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..dc71fd57834e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +149,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.56.0


