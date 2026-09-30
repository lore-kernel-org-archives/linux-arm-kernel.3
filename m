Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE7BCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwoTkJs7HCyeZUjKiL1dlksDyeA5N9XlMCDu8/M46vU=; b=jy9X/fBbg0OyVRyHsx7//0Pdz/
	WYv9xhF6PRiyOmKJcSdwXTfHq7VDJaXW6PM74JCnUcIDCgfUl/zmfEOxvPS0e0Dtml41Ixgvz8svr
	I8qA19b9GlF5snZA5h062fxwdNE5mTU31LZCXwP+f0sT2pcHcEyLdX71+xSCkwrDUpiMM8ePXiK7F
	NNlC/m+oDYZXK8VhO73nrq6fTcJWCHEGeP6iVUEpTHpCQruVa4wYvsj7bZ20srFBneJG6YTCu3U12
	Nc/gtfo4sQbN9FgaYQkMmgDy9H2vkWHWItUrRyS1bFxfHtE7bVfuCb/3CON2+fM54fpOZEL7LQyav
	/pQTl1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqyx-00000005cYc-2vOn;
	Wed, 30 Sep 2026 09:52:11 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqyt-00000005cX7-3i8M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:52:10 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so38419265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761926; x=1791366726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwoTkJs7HCyeZUjKiL1dlksDyeA5N9XlMCDu8/M46vU=;
        b=MxoGSuLmMPJvrXjRpE4VWEpoWxY7Q+SerPRF6GT6C/jOzEI6r/wUaC6LZJ+O4isIBO
         g1Yv6Yog4n9z46IpQQFOWRrxMnGIc+G/w04W8Q9d8OsmuMS0HWud3iRd5kLCI8/Lkbqm
         WOLFS3C5jByvoK1NZOo9pSeZ4vDKrSGz4zDKMySEvgEdAtA5CaemRsk7PKnh8RLID78f
         3VQFnFjUI9sC9lp1Xoqlzx6xm3dRuNLsBxDec8+L89CPPjW6PZjWgnbOGoQ0VtpnjG/d
         oqAih4H6ycW/WTPCCqg3YCneVdDe/YxmT2V+jE/YBjr031xnB2k6VKSy2FkzoTUdRc/4
         tJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761926; x=1791366726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwoTkJs7HCyeZUjKiL1dlksDyeA5N9XlMCDu8/M46vU=;
        b=JoR2hkDEi7h+HmZIIw44dT9BX3JTVhxbffn2kwNr706LG3qRuTwFDvngU4GvOapChC
         lX2MNp/PHD58bgUD6s31v5P4EYf9RdkKisWoG3DVQ/fpwEjEbVDg2o77UhHigVE7a/We
         yyyF4vr7KsgG5OUy3E9BE7ORcl8yKFuwjTqROhPqoj6u2t3+G/Qv4M/PIwLJjcdIvpvN
         i1ZBu1o3Y8b+nKFUdeC7/pVxSepEa9QP+1vTjuHLDkrp8z+4nELbwIsJ8adgps+kwF+R
         7hAMX4NiVLlMvmDr4kIvazqdfqfIP4X6T/G5D6aPOjIVCMhr3M/W/uoK6C/MUQ4aXwyE
         yOhA==
X-Forwarded-Encrypted: i=1; AKwUvByCYtQUFDf68IPKvXAWSZm7UWo0w1dQ0aIMY6xEsOAp85PFhyKu+G0jYe9G3cLwthDUGQkYn1roIu1wjmBeEXJv@lists.infradead.org
X-Gm-Message-State: AFuF++kCGmFNZ/CMwxd9yIecjf4R/bZFHErDvspldtZxAVhqjPeYyJKu
	57JlSGWxXcb46jtRyHi3pZCttZJK3WkC6y3f+j7x0LwzrRSL2suIRjCi
X-Gm-Gg: AYBFou07m7gfsy7Y/uAZV6823Tle9IYCoiPg4Gs/l11zduenP/I5E8eS+FLX4U2yzNs
	7sWdAnV3wzIidizzHnNIuMubZKJfPxjqJin6GOCEh97MpV684WL+uqT6Gg8bUh8H+9pi2rsfzMz
	Qz894wiDdCuMPK8YxkDBlKlrOg40caxscCrkiJgrWICcFeEIEjD6iE4jmSQW1LwGuawdzL+H8Ju
	cxXyElxgm2qyxJeC4KkyL7e5bf4l5XzioOJyqu1kEhJmErwqGAjR4QbiYyGtlOxZMFyATDDpAwW
	V6xt288WIlkV63SqdhBsi62ug8szjTZzoxQfb4Vvt2eT1JCo5z67yp5OUKLkZ4Qk2g21+gfjmQq
	oVPvyMwNa4AjnVuViNkhLLhgNfFzI39IA0JD4qTTJ5cdTDMBwji22/DyFxGMFPT3ff7hoGqA2Zs
	eWa+eSZOuitMPPI09NPruYlX35aLC7rvKE3haRuFFXyV4+zcq9gGqNTz81pJDdrQMV+9BndNoZg
	W8z+JEhqSWByNRAcEyR4clOIQ+v6v++O4cUFlL0Tyribg==
X-Received: by 2002:a05:600c:c166:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-4a01ab4d864mr15364625e9.0.1790761925903;
        Wed, 30 Sep 2026 02:52:05 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015abd9ffsm43859655e9.2.2026.09.30.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:52:05 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 30 Sep 2026 11:52:02 +0200
Message-ID: <20260930095203.492949-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930095203.492949-1-sander.speetjens@gmail.com>
References: <20260930095203.492949-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_025207_950646_6E4ECF90 
X-CRM114-Status: GOOD (  11.38  )
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
V7 -> V8: No changes

V6 -> V7: No changes

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


