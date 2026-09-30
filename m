Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC23CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+41Kw8n5nZrYb5TW5ZIYPjdvMg9T8Nts+lEsUDThvXI=; b=R1Su+yTQstAGhDNXKhS8lXBRIL
	Op79JY7thW7IPFLLbDXI9NRRkHKh0o1CoubSY7pBvp0S9WAwwpW0OCDvrhuN8S2K8TdaKOAuoFwK3
	qSC1Qcz5DWEGARabxlFANIcp4YAUIFN1azgqJaIXs7L9xOzPlLyS7mb2Q4HpOd0+VRc4VN24yRmFk
	xLNbhmlMtqP1nI76ntbJDmaaH53NwRMC9Wp7PK+3NuX2yRImrHfAobocvaz6inEkYP0yHIAIayHlC
	b5fOd54MDLeniyFsodatGOhNebAUfCFhYW60yvHxUBWchLIB1U58eR55Lp5as436cJWAS8nLQwVz4
	Q+68jVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp2T-00000005K2S-1nif;
	Wed, 30 Sep 2026 07:47:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp13-00000005JPk-1rQ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:46:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so3025219f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754371; x=1791359171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+41Kw8n5nZrYb5TW5ZIYPjdvMg9T8Nts+lEsUDThvXI=;
        b=rZWqVUp/S9ZnTlNY2gtWm44S4EgX4aYLjwLTDmnowjKgs86IQ1W2B+HzzsLuxJ73mX
         SdcuV0n0EMMAVSWEzv36LyxGVIopnuspugstMDwoMke0HTGfLIn8qa0o2XE6oUGI/cp0
         EAwcjy9TauRRWtXl7t6HvQ8HyakKO5ZG0jZaaVxtZ+vi+9uKsLa3+0Yhf4lZ46+YQCbs
         wOfQVhQGIij4U4QhDTdkPllyBHVCOZO1w2r1eYTyQYkkPtkNBFdCeNIcof98pYTwjjjs
         YzIym4mNqUx7xIQO0LIWF7TCI6eCgF0pCITJN95nLuaV5nB/8hhcBiV24S9r31yRe1cA
         9WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754371; x=1791359171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+41Kw8n5nZrYb5TW5ZIYPjdvMg9T8Nts+lEsUDThvXI=;
        b=qHdP6RSg9Xhg7E1bfavWzwaZa5n3wrgGhB78hg6EdfmjGhvqU8TgYnfOTnf0Do+MXd
         8iNLrqg45otkMhOi4Vtz7SVGWWAQqNATwM/K6kPAt2/DaNQKbvRXJupWs4L5BhuvKBRh
         p0dYW60+DXDwIBjqMzTiBgW2xW7hNe0u8DxW3Pd5yzdUERzvRalOS5avsjH5LQEHBN44
         XXIuqCgx7L8uzc5bnAVfA4BEN77wbyGmJFs3TsJXDGDJb81WJ2PAyPHdHptbuMSIa7zk
         viAwRWXBf8XLb6r3/OVqIZKHfqA2tYxOrvL94EORGz52MkgDE4pA2R31KRg+Q9y5EUXN
         PuFw==
X-Forwarded-Encrypted: i=1; AKwUvBwdKEDOAkKDzWSrq9LK0P8bh/B9plmV2R8EEAm4j4TEwGLxe3Rcujq+S9XpCfhjlm1AumxNbyNHxhpNSoIhUyeB@lists.infradead.org
X-Gm-Message-State: AFq9FYIL3Vam+InGU0fYoFfBZdvCH6NYrNyPLpuVJ2fqt2lEZvkv+h3w
	wHKWgSHRIEpl+ncSkl2F2iopMjTQMtd6oBWxmoL2I7hdWIW9pLO7n6Vl
X-Gm-Gg: AYBFou2OMYaEwiWrdjF6UTlhfIb7Ox87Mn1JVojdSuEX0Pt76u0jCBypVGzXjj/FYtk
	xUOwoP0VI3aJdg9PQLuiXhJcf2v+zcgGLsoS9RN6QvaZ0cOhjJ6be2jPABq0dCAlYU72TJ0IZDJ
	o8X8Fw+8eQkxb/KnWSiCKxjm13bqxBFaqyoWKD92YR31sVhEUMDcsR4xzT4AmD07nAECiW2G5DX
	y2MozxoTgU1phzbFosZ4N9QWNvcGspfePcoaetzPiAcDChcOHaDMMzAsCuG0DvXhgjzWfLxdlLP
	LqV7bBONKR5K5r+blkXuZ7FTVjQ9r2oEsE23QKO39XuKaj5Sg8aQkyeJNKkc8bJFCQoIBnghY91
	rHCV4YdcFIjbAbnXho6umLAdndWnMzBxKK6SDCXI7GcuaOwF9M/ZmLzb9LDUXqydSHrYuueTkAr
	x29sIRhm1QN93426qKd3hrnLzyx42+O94m0OA9fCWzOv9ldxDHfMBSYuezaaA6e8pYOIr33mO5h
	urVEgGe48/RLndPqQa3F2nk6M/ulEL25odMrCVHwp7DBFD/5qffZgFi
X-Received: by 2002:a05:6000:25c6:b0:48a:faf0:bdee with SMTP id ffacd0b85a97d-48b0252bc90mr1084385f8f.45.1790754371276;
        Wed, 30 Sep 2026 00:46:11 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0185asm1487480f8f.32.2026.09.30.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:46:10 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 30 Sep 2026 09:46:07 +0200
Message-ID: <20260930074608.479089-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930074608.479089-1-sander.speetjens@gmail.com>
References: <20260930074608.479089-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_004613_970209_A4383345 
X-CRM114-Status: GOOD (  11.39  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V5 -> V6: No changes

V4 -> V5: As discussed with Conor Dooley, the reff to uint32 is removed
and a PR is made on dt-schema adding millivolt to property-units.yaml

V3 -> V4: Add a reff to uint32

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

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
2.55.0


