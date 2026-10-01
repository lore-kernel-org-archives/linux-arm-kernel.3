Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C409CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=Q+Mag2KyuDoYJ2d/0i11Xnq3L5
	Rbip16AR/uwK6Qavy50jpdW0c/VnNe8eNw+zuADNVybulUgDNhA1d5TmawYnQxoBTi+mb+GIC4+F0
	zDGZ9acVdi8AijfoqKGcq4cASc50r2+BDzEAVPUkJTom4e22ah5hVbHelqRZpiCX08xom4ElpmLC6
	GBZHyBKvecNOUibyGtvwlxvSARz/g+J5NmD/NmMsdHFk4i+S5lTW5+GQOiLm8TE8W+oNzo3axkg+7
	p+qN1MIuVyW+dn3dXyhVITMyAZKD/05o39ixvR8lSyPPNPFsB66URnHE9SIpGPvFb7XUrONP6GHVS
	hePwP+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBaA-000000083mB-0fsx;
	Thu, 01 Oct 2026 07:51:58 +0000
Received: from mail-pz2-x28.google.com ([2607:f8b0:4864:3b::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBa8-000000083ky-1Lik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:51:57 +0000
Received: by mail-pz2-x28.google.com with SMTP id d2e1a72fcca58-888e95f3e96so69226b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841115; x=1791445915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=ORTAqftXnQYfkF0XmE0Z1lF+Gt51vkk8RTTWWJREIypGCCCdH21MG7QHUOKEnt7p7n
         e+6nxJ+DM5ieQXPCY8yr++AA5prwLQHB8d4PE0H6tZXoNG/DnBqr4BicTRMFg3XJg2c/
         BRX5k7zUbtOlvCBTQCXEBb9Ds+CNxjxM/+zzmkskgk8mtrk0hDTrFsh1Ecj1Rrz7vJxx
         qr5S2rp+TsD+dCTIDT9O8aubmR51qgzpqA/IizmdbdQIeg0bx0U0IrurBD6l2zxgfxDi
         g+4pWYliFlCGsSvWH3Df1ISFm91qMKa4vFCOVZWxQS6oQBY6C0h8ZKTHmIHxBdF4kAjn
         gF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841115; x=1791445915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=wvY3nNIfO4n3FDYTMLbEBYaM2Mu6ABvWRQu8hEaEsbhhCj3uMd8iKgU6Yt6ih7tjBu
         RhR+mR7A638N8hb6w3cShcBjjkxXV2jdb8eqZCVB+iCfz3a0PsVKToHzi040SmSjsGMi
         6PTcn+kRDIN3XsM6IlPUTlKk7obv+TtwuI6uyD2puhE0OaC8N//GDMp5M4he+wLVpj7l
         PLZ7P4HZ4huwVUGaKDMcuYX5MuhuAUNPnaXwqQtwXaFpobuy9nnFT7KwSdVSVezAvvQ3
         lcxKi3iS/GSkoobsJr29UtitQs5m99V4FNX5rR8KNtwqNmSvB+jPQokZTJkfzi6eaVUJ
         TJjw==
X-Forwarded-Encrypted: i=1; AKwUvBwzbZI1IiPZhKzE5q4PKbFlstwV6uebs5reC7DQcJNR6a11b/ezS/IxV6pU6ePX/ZJPBK19m7yHRUEbERC0x2Gz@lists.infradead.org
X-Gm-Message-State: AFuF++noH5fZrmlJ0Ok1B1rxtMHnaLHLrabjVc40mxq8RXaACEUM0Dm3
	RmNjfL8IbDZ5XsIbaEemOlKoyLa4ktSSjyyJfUzR4R7B4ZnsU1Weohk+DlSS1A==
X-Gm-Gg: AYBFou3L8azcIxkSGvdQCjiIyNN3jGitjrv9IfrK2jrWd95BXAD8vl0B83gePHYmve+
	pMIPAQ4QBWblIYK77qjC9mydOGMzzwJYO5MplFKBqMCeabLz+mmtFp9dp5IeDNOtAPOd32PoCNF
	0jZVftpO8UyELNk+S4ADDjOktt08yAqmevuWIqTuTSgklrjmPHY9fQ4Cs/GKwDMJuaDenX4uXxc
	xOY3PVDi9wp3B83XFgxhsAL+sBO+aCEoUnC1fbXPZ+y2GRpBw/UB1j8TCQjLf9r+GkKeV+fV2vp
	+K1WdMIrLpUxR77B++xbksYOkvui6MvFW7JAhwEoMz7Zs6RMgiFf5En8hdR9N/73o01NqztrEO4
	WMjBDambGLSwbV6vDBtnCDXI1cJojV6n2M3lWFK7nIPZhfl/WvTjB5x8R0bpD0r9GQm4yjVfZe0
	OzUAwe0LCZ+jTRdgxg3yLbuzhRg9pvcEg1TeKjRjNvz3HwSY6ksndbV3ryGaDXk3c28wX4Io7mN
	kB65t9jEkwh7S78R8oyFQLwNcjfCm/5yxfK355ePvEE8z8atiCQqSMq
X-Received: by 2002:a05:6a00:218e:b0:879:2a08:99bb with SMTP id d2e1a72fcca58-8874dd6acddmr3330370b3a.56.1790841115325;
        Thu, 01 Oct 2026 00:51:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm666843b3a.60.2026.10.01.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:51:54 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Thu,  1 Oct 2026 15:50:59 +0800
Message-Id: <20261001075101.489660-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001075101.489660-1-zychennvt@gmail.com>
References: <20261001075101.489660-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_005156_385662_ED93AEF0 
X-CRM114-Status: GOOD (  14.14  )
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

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..0713e1c1ecb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


