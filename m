Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6DCC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=; b=RtNf2Un5G+aBl5jF2ykzYjaDC+
	1Ukza2gZFLETlPn8+DikM6cFhRwXXi3rZI+SHPuOSmQHWRcjkU1pZz9iC8esiPYN/Xb+yuauzynqX
	G1hgtcZbt5YzDmEE2SI1cCfPheVLdOgQdyhjb+cYxNY59w5QzBUqX0LyOp70aSXcAY3MTDNJsy6gI
	i0P1ioM0VowiQKIcf/lbGB7xulfOiyA5Nrb+D/PrbNLhpGFwdpZeC7waS5DNxmZ3sYjja+4yGBAtF
	erYrK1w+9r5YXpCRBW8KU3X1nU10q3yCX9XwonM3nqvrG9ZLVARoD4PGUXFM+VZ9RHrXNFiHLCDse
	1LCVECog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRN5-000000037Xa-0yXK;
	Wed, 05 Aug 2026 02:28:43 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMw-000000037Mq-21dn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 02:28:36 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7eb61bbeb25so383337a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896913; x=1786501713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=;
        b=ejbdrZKO5tmSO0J0NCTtEeNAiCemMiw5kx7J9IR8uMRI2qj3WYUuxyZSFhKRdMDqjg
         eZu0iJnHeTXR50SgsaHKuJLv14B87KeGMWczTWQ54Gv6JeCN+bPkNr4aQBefPj/TPiE7
         O7XVkJlO04xV+n+El9qieSYPx3aQetvFz16uGFiaDKbMJXnm4BiwcT9qP830Lecj5l/z
         zdhJP7KEbi1e+uGi1lNRGDjLUt5kkyUbfwZI/TpfsAIv5tfhQhoQNW0WEsrBYlFzeo/W
         yRuX4aEqFxCJttMF0jyCyb2BU73mqbfSzmTvGGRyK0Hq+HcC7sDTi7QvkRLAWG5xMuUp
         Da7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896913; x=1786501713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=;
        b=L8wujvvs9nXJw530ma8UVXti6XAiGFQFuKO6MCKZyJVxgeydlcqj8P/8mczI/sd2DZ
         ne0hBkei90gxq0IWc6yv4Dg3kwkadmFr2NiHUzmUCMmXOBHhEFm6VpkmomGz6injz+MB
         06BOhZ16b9Cnj85l/axPlX/1RpKxlb8s9TfsAowW1jQjsBNu77Y9SJwoC2nyiU0M+0QT
         gE+bvfODUP689haA+Amw68/yVQH1ii2avC6BrTUBw7wSOcgPByN809Gy7xjr4SaXFp5W
         yHbhiiLVhy+Id94umMn081YyQDUO2OmKPcGE8fZyypcplctXFu809qBgKTLHG5n/ryWm
         qkvw==
X-Forwarded-Encrypted: i=1; AHgh+RrIsnflGOK8ERsxqZ5MSXqHFQkVTrDdgqThPHdDW8Wzw/T8zcMbmxlbMo5ugL/Z4cPMFn3NIyjHTxMX+mM0P5UT@lists.infradead.org
X-Gm-Message-State: AOJu0YwHvCxX/Pvlpmh4s9oVd1ytiK3mIduFL+msLsDXMQ7Kz6ObShGz
	sMKziu0nZdV/uE5ZK8NSAvHzvcpsWVgHr5Ci7u5ZRYj7IhI9wISrTUxT
X-Gm-Gg: AR+sD12wHyJQ4RBlKP8Rkmrzwrc896Ahj56FJ8/642tAwDtGNJBTvy74npDm2bKITuY
	GZVSqcfPp69XnXYg0ob7xtIWU6H4gSDJTzPTyRoKvTRwcTJDmZbXeKQLxYD+puBKdM7rX+XeP8h
	8vvQ6GKakUMwyTMC5K7JLD6LwND8KPdy95Ks4sxj6qZZ4efIX1mfcTOhm6k/S0aAzba35C92RIU
	y7aSjhk5/DjYVWun3Iqx5tKEaC0ldwu+Bkjr9a+G5z/e+aLHbwfLurAHhC7+NMAnBftMOQFuoX1
	ZYFmoeRVZOrr0ll52nBoHBfgB77yosmU6qwp9PNtJiSpCkYl7Gh79cwTso5U5p2mNhJB4TrO1b/
	HFypWxSdrcYB3xVvzkXXIysx+/QsXL0mjDNddiHAeP46a+qAlBDxhygruNPHmCMXJgSzQUh1YBa
	uQX+rTlViCAKxIJFWYGiqesOR74pLgBMUWMz4GCjdTWb3ewFQExlQG1UbSxJOOvw7uSFiHjSPYE
	EENupL0vfPY9hSdVZyEdFbVovdRTf94T1ohzek0hNkpBtfz3/MPvMbUezJtghVvLWy7pEvA7tl0
	9+5PrHb9g9K+UBk9EpCRe7/vhyV2gi2A1//xLqUOVd5NpojIc7h5Rd+Q0fU1dVAFPCfx3ZnIfHV
	heywTRmFAWGxQSX1f
X-Received: by 2002:a05:6830:7010:b0:7e9:d634:77b8 with SMTP id 46e09a7af769-7f1e5c13e8cmr2629082a34.2.1785896913436;
        Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:03 -0600
Subject: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300 EPHY
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_192834_592496_BA400342 
X-CRM114-Status: GOOD (  13.71  )
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

The AC300 exposes its Fast Ethernet PHY control registers through a
separate non-PHY Clause 22 address. The manual defines that address as
the link PHY address plus 16, giving control addresses 16 through 23 and
link addresses 0 through 7.

Describe the control endpoint, its required VCC1 supply, its 24, 25 or
27 MHz input clock and its SoC SID calibration cell. The actual PHY
remains a separate ethernet-phy node and supplies the MAC-selected
interface mode at runtime.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
new file mode 100644
index 000000000000..8a616ff3e89f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC300 Ethernet PHY control interface
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
+  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
+
+properties:
+  compatible:
+    const: x-powers,ac300-ephy-ctl
+
+  reg:
+    minimum: 16
+    maximum: 23
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
+      determines the corresponding EPHY_CLK_SEL value.
+
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      SoC SID cell containing the Ethernet PHY calibration value written to
+      the AC300 BGS_EFFUSE field after adding 3 modulo 16, as prescribed by
+      the vendor initialization sequence.
+
+  nvmem-cell-names:
+    const: calibration
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcc1-supply
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-control@10 {
+            compatible = "x-powers,ac300-ephy-ctl";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            vcc1-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+        };
+    };
+...

-- 
2.53.0


