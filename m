Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B46CA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=; b=Kf4YUGPANRt8t482vA/z+WaA7C
	y1Wb63B+4cSNULF+n/vweTLO3oeuOQK2zwtyXxEzm99Tx6vcixWU0sdwK3OAcINr9kxb09a3nHJpF
	gaunAnBIRolIrmhsKfw0h9+fq9XhXQI/IEoBELwwHx2E7LB4rYit2ClV6EVd8/1UM30wp7x9nw11u
	en++O6UzagogsNpaXQvZGnjZRkZcUCefzfeSVFZNbM8r3aE6HD3SYPQJXDZ/wlXuWnwObwwI5YRse
	eenlt9b4ZH4vyvKKaAtfBOSjPTq1wJCqTzVyRyJDewVTBlMc39x2M7ef0CzzC7fGka/SfhuAvkzJb
	VGtPLQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYUC-00000003kMC-1Q8T;
	Tue, 29 Sep 2026 14:07:12 +0000
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYU9-00000003kK9-0UoD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:07:10 +0000
Received: by mail-pz2-x2a.google.com with SMTP id d2e1a72fcca58-883a16b758dso469756b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690828; x=1791295628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=;
        b=AreyUwuM9acNxwCTtRUB7afDR5osKNldWLHCu4jAeo5IK5iGTEwtI1d4eJvCBhFUek
         ttnnXiMSy5znGBLYSNxXYjNAyGx+vZ0JNEi7lreQgwMreKHxf6eCIQR48YCwdwESrnU4
         1EvXCR/lkDrqs/nRMpnGubBxQ/Nhu1hwPYeQDRL5WynNmlNn9wk3quywVlAuLzOmFJpO
         k55YOC+lh1QiRPIzaRxVlvYM5CQDIhJfMdQpzODGBAdaAXm9YFWD7L0Vy/r+KlKccU6e
         M0jMcksDu4MS3CfnMS1pMkAwZMGfXnvIma/ueQ+/hBIE/D5g3Yx+MREOAHDPdCezfIbJ
         kx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690828; x=1791295628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=;
        b=SfqEax/BaOFt1RAZlOO8JivcM7MHox4/PjxXgW8v2mGff+Gkadjuo3jSM8IBGsVele
         yg1/+OdtIp4KDaYpQQ0haHExdmEkZKMqB4tKO1KJ/VxJrsRnrREmPHsrjsrSUzIQ3iq4
         ka31oFhs3hK6Fk3SCIwZ+0u7yL+plTN7yk7bSxPI/+8wqBOFuH7VEIupfBa8GvZ2bRzA
         raQdwyRD1xcHghBcEBFii7mkpMXvn5Z+zAVMTbEQ69B3Lf1RZ2914V96J3DIz0n3BpSr
         8xoCQp4Q/DX9WHZCaciQasZ3w349ZtDciLo0UEFqrgB+usv7ZGNW3WPDPgT4vx1WS82u
         HU0g==
X-Forwarded-Encrypted: i=1; AKwUvBxiKcA//mEXXijHFSR+kEPXIhaimTSvpRvAeF5jf7uS+OFqFRg7s19S5/YFT8iFnWsx+BqtuIYD1ZKzqjeTj+gK@lists.infradead.org
X-Gm-Message-State: AFuF++lEL+Icr7rHrkPhz/uKV351olNfY/4pW55m5clxeI/AuPp8WqLp
	Fc8yK9os4IYLyOr0XXZ+ZxOw5LZjEw3vldylIy13nCOzZWna/4BjcdSR
X-Gm-Gg: AYBFou3noeuhbGoQ3YNSbdDiPq3X/iFwl7Gm2KTTzNkDL0WT/ASstZSMY4dxfxfrDuB
	a2aj+bTYmOnbeDY89wYzdx/EC4jaw3W5FKEwUNJM0t10U9jsWZaT2HI5tV6wLTRBvlhFN4UgZNR
	KTM06pr9qnefxEzC4IJRP70+FxqYUNLsNyC/WHLBaWqeQeqrdIifRMSQuN7L1MlsTabCFpT06Q0
	rkLlTmqntKF4YmWExML4ASjcVs72vKekNAbev4na0Vbry6Z0806jz2eKXTPvN9bsLZ9lL6HllIo
	L9LhZwCsn4UXbPR4UfdfQoYIib0PuhGqwTxbtvkFa6i6abPh098EFPqZo6LEd+6MVh9OAkc9LtD
	JCUsFhlteQAMI9s5fXneLhpEPgZPcmR64FegiLlKoJgrZWuc4nbdp96Ui4xnjHYnJ+m0hc0a2nD
	ZaHUrCVhxCeB6xCQHCwKa1Vm3LVIcIy0riHvfkUer+0kCBAtzAhg2LnO2rA4GEiMoUDbyPiO7D1
	htf7qN+kZM=
X-Received: by 2002:a05:6a21:4d02:b0:3de:5897:ef9d with SMTP id adf61e73a8af0-3de7c889886mr2099166637.0.1790690828140;
        Tue, 29 Sep 2026 07:07:08 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:07 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Tue, 29 Sep 2026 22:06:46 +0800
Message-ID: <20260929140649.55-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_070709_181275_D05F0F60 
X-CRM114-Status: GOOD (  14.15  )
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

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that,
accepting both the current and the deprecated spelling of the property.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..9120222 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,24 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +131,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3


