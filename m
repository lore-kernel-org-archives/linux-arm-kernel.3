Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1488AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqyjdRqZi/cfpQBeYXttKHb7UezS5hjnOE+1CwQMvwA=; b=jaMjQa0VmtPfKE7LYH8lbmgz85
	i1RQj6HsugkOkW0RS51aGKBoeEjK/YkrLZ90qvohTzdrvWPaIA5Eki+5IX3oAJcgO36q0b5P4PvKj
	+ut1phXl/9gLgPdKYlE/wXxTmJPTLG7cRUPM412zBUMXtk7azCOVVEfl6NVhBaxfgfnvdj/Lcnnn8
	1jrVfrTWbHk5P1KYUwfStPxQ8wuYkgHvXMQ3qslzO8wnvsEXCKQ+/yaBl+CZqzzv0e7vcYg2Fnjwz
	dLTodAtHZFuyUdCktWtYHUpRgfbQww/Fji9i59J7rxdf9XlDYWqcYPY66tApd3WO7y66HwQXy6Lb6
	SPPaYxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MnG-00000008MEl-0TWk;
	Wed, 23 Sep 2026 13:13:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MnC-00000008MCk-2qcN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:13:47 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so6105325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169225; x=1790774025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqyjdRqZi/cfpQBeYXttKHb7UezS5hjnOE+1CwQMvwA=;
        b=m1k+2uOb8rvIouQ8O27HBFQnvRMvT3hHaZ9CxbgsOKGOr2Kyc+ip6hj7lbS1YZrmHL
         AfuzGVCV9wxneZwcCMGlvmfutt3zekYk5mEzI5Xi//HJTleViOaA6mSxlwmGZQcGS4gY
         vlnOQo6VpcHADnrnDC1q/3iKme687/nzHLYYxKmK6AJ7q2IS2oAyV0+DTNDyS5PF0tHe
         Cy6zVff62ZkstN0So9v9cqjvxEOFzN8einI2CwIcA+s/r+GgkPaC2P1B8z7mQAr5/d+F
         Ivxs+flaXLYlWrXUvOfAmg8Kg4qOpjZZWpbQBblbq1SZkgrKMO1FfUWMKSkU2Ui3/QqW
         nSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169225; x=1790774025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqyjdRqZi/cfpQBeYXttKHb7UezS5hjnOE+1CwQMvwA=;
        b=RNHE2tIlmqdWgJz0Mb3ihmjxZGO0hmYb8M0wjI2NmcejE71Tf9QpakbtAbs3M3twEK
         OqsdBiXR5umJhSg1gxmGvhuOa1L69T8cCbABLTby3smPYUmI8gpI3894Vbu71Fd7HaYA
         PbVkuBRTSPC+uYsl0CjeqLZb8PlbxbNJynCcXwBLNC1chPkRvs3h2htSeMRnFaGF1JFZ
         H3WoYhXAVNX7NfqIadQG7+aN7p7z6FaG7mEm6ZDYY1StnQV4W/z0Ud9+WQbSDKDHxXC0
         SnFmpxQbLb0FVkFk3+6NI3a5iwm44iyFA26zfDn6M3suRXyP0wQ6jQvzELGM3f6LxTn2
         ONvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcWg7Ws9qb+EU/dKVdT2sHhHbUdfbTeWLi3ZAF94SB1n3wsWLKSNbwIqbid6WrwkQd+7Rh+mI+U3AS9vWgSCn9@lists.infradead.org
X-Gm-Message-State: AFuF++mZDu/hiuztuk08o+sAq9AMA35MHw60aSnmjYPzY1Uxe5QhNKn5
	xSPGEFOauwfccgWYqhyVkaIX902yGL+St7Ve3J6UJphKywHcW92jSpz4
X-Gm-Gg: AYBFou3MlnIU5Hrs25fNIAyobNYbrIBZinyUPaCAj0S/B2+g78LsVQA0MeVG5Gfc2fw
	ABdxsaUYmxSVZakb9NH2W/HyqpbYkvhBc5UGxm/tbLW76vVhQqi4m+i3iioNkrulCH3O19rQ6iN
	1KRdqJMG2bZ6spCxNwEQsiTWyjtu/+l/hV37MDFB04VLw0jOX00LGtIpxolitATldQPWgAj7Ed6
	WHn0gJ1MC4vr0Coe5jq9+dJAxcDjG4H1KsVhIfOmJCjoDDMp35JWvPMaS2I5aPDzqrYR2qoDHyn
	3RA0rPTYdRdUvX2IOyTxzLIMhVtjGgbL4o3Hnev5uL8CY50qh92yGI04UhbpYR69btQGTPOK8k8
	QVaN+lS5EBWjQ8XmzbO+XJT0ttOiDhqdbsxBJH8aHjW/C0g57+Ui1kmqiNabUqW5ldajI0cXbHe
	Pv018Ay1xgFKQxKMZ23CLWQCoqWtSuief/XKc5VlCl8pAaOTFkAg8c8/8GuFGFFWS4bFJtl9l6r
	WjUmnOgC+jh+Po/MjbRkxXoCSpTny5dcNguPIVzAFEVT1oKlj6xFmLC
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fdf152e3fmr33200245e9.33.1790169224607;
        Wed, 23 Sep 2026 06:13:44 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm57230235e9.2.2026.09.23.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:13:43 -0700 (PDT)
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
	sander.speetjens@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 23 Sep 2026 15:13:22 +0200
Message-ID: <20260923131323.1099979-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923131323.1099979-1-sander.speetjens@gmail.com>
References: <20260923131323.1099979-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_061346_750899_6D44AD75 
X-CRM114-Status: GOOD (  11.43  )
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

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V3 -> V4: Add a reff to uint32

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..9349fc8908a5 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,13 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    allOf:
+      - $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1300
+        maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +151,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.55.0


