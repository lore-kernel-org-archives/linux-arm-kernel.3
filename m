Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCCDCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcF8JZ3hxoubiHdfz7A8sdhKoxTejC5I3xx0KcFawK4=; b=uBH9mqDz/hlQgv1EyNBoUKhLJT
	6p2tepVMCW/dMt3jUFr9gIwqWTELT3MOX7DZ9nRz7kZgSqJ2xg0gw5SWHHb5e6XSGH5ctW1aPm1Tc
	e3hmj9XxWSCVUznjV9NcHJ89S1OCkPEmBglsvVOllnyyBVmsVCspks96e5H2pBosp9c+9Wx/GcNrL
	OtJKapwsmlKVDDZAZCKpjgS61VNvkqrV8gY+Cku4UWK8qx1jC7yh5GTcc5n/aonZO1IGdkjIVlHP+
	YMiU8VOIcDWjkmPPMwGgRaQ4YTvA7aFwNTbzXmempTOkuK7YGd4kD77gbUhuzYZkAM3tB+DW17B/U
	+JEcE7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN5u-00000006p5I-0FN7;
	Fri, 08 May 2026 15:26:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN5s-00000006p4u-1Y0F
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wcF8JZ3hxoubiHdfz7A8sdhKoxTejC5I3xx0KcFawK4=; b=C9OkwanW23JEWeeENBMizefm2M
	1nQTRyhV1QhNktRWERqcIwEJw8/tE/nhjaqPDU/7Qwlw6weG0CwX2wbuB0I4MuT5nf1QdYhYUItGf
	+PNtJUVYY6icK/FwHTCqaKKTVjHF3HlyAGyP/1vsk/pU2wb/7W9fcUoGPtxN0sefaUj9n4A1wTlus
	ieckNf525GVYRhrI5woY9YmaxEusb6Now6Yf2sLS1fe9lKUZPFsryuSA0d+5KfH+7HXUV1BUD+6HD
	TlfCFcFWGS1FmBgqUtIJjTuS0VvgoaE3udQBsQ+FJmZJWHs1YPD26VcwHPSJfbP9pw81vkLchH8Qh
	ZJeLOpMg==;
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN5p-00000006hB0-1FQF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:26:23 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2869882eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253979; x=1778858779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcF8JZ3hxoubiHdfz7A8sdhKoxTejC5I3xx0KcFawK4=;
        b=HOamf/y5EHUeNBviV+XIjdoxiTEaOwuW1o9sVam5L3Fiac7c22OHg56vGdCtdwp7Qa
         Y/t+gtlqQDYZnUnrQcWdqcIx56MDYMIdOhFJt5pbIJpgyJsGfdkrs9idgJC9cKzzRghf
         8IBNV0aUWupXc+YhA5IxNXUod7fmPURVQ2/SI6GhdnHBIiIghGx9JoetMgi4faX4p8xD
         Yy1GdrmKKPUuq9lOOnD6976euuMleZYFTSA60VvdcGZ01NHfxOEdfuNXRSWIW6pY1GXh
         bAJf0IKR2YAxZxjjz6Ik/Yjm67sDYVk7s/uhKBu5X/yN50R5I1zm6AroMo3NgJLSKNDZ
         zKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253979; x=1778858779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wcF8JZ3hxoubiHdfz7A8sdhKoxTejC5I3xx0KcFawK4=;
        b=hDHPPiOVMYXivS5Sf8VJ67ce9lLwOuvRZNGIpaiw2loC/I8S7sStcfq1xGHFPd9Xk1
         8DuwUVWqinOwmeK73VrG6mpt9+yqH1uFkHzfeSu3jhoXywZqxN0t6m1XxOPvY9pX9d2J
         r4weUH2NMvYHYxUZ288/mG8w1lux1sSJD2t6fs5F89/UOSRrdTymSP7gLfUGfLslc0tT
         j+qUGSYVf/jm8JoC2lrhLGAQZWjDHJEwD6wc4P2SBgi6cpSYHCpNtlR6/vJsFsaf2KKn
         G6Cpka7TWEMeW/U+WiTDYkkZB9Y3+FbeWCYM8ESsoQ0fefE1fHTBTCeizVvlGrH5ec5G
         hohg==
X-Forwarded-Encrypted: i=1; AFNElJ+HfuNbkQZexth5443jwdlyJ6FKEngxaFzJwEjCHig+ZDlmfnpAl8RpBzen9PFBVhJ7ylsy2jq0kejHWQ5mWxLB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+t5YYROi3NbzCzwLoHnH37rraMhg2tuUK/yd1hD4jki3MyTvn
	fzCmr8pusxWgqiMDVmvcKOsLJ4hd5x1JokqVZMHMgeUzm5A3rZqRd9VH
X-Gm-Gg: Acq92OEAx61oE8lbZ15TDvJvT4pqRHiSTbo2Mvb0eJ6wKDFgcwh4++rMo3LX4nmFCnN
	8a6rK8j3w7aQ5i/SsY4xlb/NzGqUGeQ5RJ4hO/0kgjjro8+9MehzeIRbM5Ca7EPvDYS7/cmeZUR
	/DONx9kYFcn1vmLZ8NvJ94KatrQp3vK0Ew3JlaLeZ0uBDYi6fFGfGmji66aYh06Jw8QvAWrRda7
	1u4iu5Fq/D/Pa71q0k5lM2Lbt0qbDZEPSopMIfHcl8UWvxR2OoLjGIhrJqbbq5qBxtg95IrorkL
	wkRJ5LWrDKihyOreG9WTZakETnm7LvXZi4QEnKKgTYa6y3fCJAIFa4SRQiZOqZ0XRTs01pbQ6NT
	QSzxlh+bgaBD7O8SxFMugHQWjUPZcep7Eo5VoWi5L7OHCwHBijAVborPMe/i7BciRAsMWt6z1+T
	20QEE+Qk6RJG2zMQn+riw7YZujMHbk5AKX/oBeeo3yCom+/MU=
X-Received: by 2002:a05:7300:8608:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-2f550e4b212mr5939964eec.32.1778253978989;
        Fri, 08 May 2026 08:26:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Paul Barker <paul.barker@sancloud.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: leds: issi,is31fl319x: Add description for the shutdown-gpios property
Date: Fri,  8 May 2026 23:24:18 +0800
Message-ID: <20260508152435.21389-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162621_693898_4770B1F5 
X-CRM114-Status: GOOD (  13.34  )
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

The IS31FL319X series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Add description for the shutdown down (SDB) pin and fix the example
device tree binding.

Fixes: dbc801b472c1 ("dt-bindings: leds: Convert is31fl319x to dtschema")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 906735acfbaf..ebf2bed51e7f 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -39,7 +39,12 @@ properties:
 
   shutdown-gpios:
     maxItems: 1
-    description: GPIO attached to the SDB pin.U+U+
+    description: |
+      GPIO attached to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
 
   audio-gain-db:
     default: 0
@@ -174,7 +179,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
 
             led@1 {
                 reg = <1>;
-- 
2.54.0


