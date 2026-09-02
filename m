Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6345C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VstGMH+clvE6OSCjH9oL0GGKXD+unvqTKSVxvTB8uDc=; b=DUI9xoS8QocC3c/0Ssx6ub59bp
	QtSQrpeqNuy/p8ziDMVDF7RL7bfCTkDcyO75oa8uSGbYV0A8VGHHwfE61B0g6peHYFqcnEZEB1j31
	MSMYKWXlpFYApXwLwv6DsL5Pop96fqzl/LetH4NtAnwVWW2CKztpq5W5hK8b7PTHIABPAgV+Y9IPU
	r5YDHsQb2cbA/LuUtN3+skO8ECbfGWZCuofVcoVTQp23OuuCn/zLVMuw70WB6z6Bw6zKftNQxWB9M
	rVFbRWU/mRXmvBJmIwmFakZWJ6myMREqs0DQzHwi+r8/3ahmCmskqZYsrXV26ADlBWhJd+A/LTQ4u
	+0cdTb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khM-0000000El8w-2vv6;
	Wed, 02 Sep 2026 13:08:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khK-0000000El63-0mp0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:08:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1080982f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354492; x=1788959292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VstGMH+clvE6OSCjH9oL0GGKXD+unvqTKSVxvTB8uDc=;
        b=Ub6kOyRzuvvD23LM2h69/a3Ayhs7OK3FXsCNDXnBpPd84Ys5EzGtH0JEbX9kyEuu7A
         Ylq8OKcY17J44H1Pryd+U9bsLQ91RUu7/Pz0Ig+KXZUGd95+0hMTRo4zDj98u0u1pyc5
         nf6Y5plMHa+gGmXN7XZFWsqwIzLIAqILN3oLuIYsTUG2Zj8fO4YWxfJo5zQLz2RB2oZs
         lcWEC18DPe3eHshuIaTrav7zJGlIQZH2JoRLYCxsGKLicruo9sWH+HNvbuyDYH5PHB8j
         m24d1yw8mT34D5PhAma2yhdgJROexRrvVfaQhb/1AmzfibQUmlS9e8IfcStzjSGn6f3k
         O0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354492; x=1788959292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VstGMH+clvE6OSCjH9oL0GGKXD+unvqTKSVxvTB8uDc=;
        b=pmFGGhzuX71SJC2dmgomUwJut12D5UM7RjkYeoYWfpJpJBJUwEogbz23f6ESPZMDAr
         wPNW4JB6Kq8uxevjN0MhLq0sKJiEM2UIK3ptlEl0w7pcbQo2nYNm7r9yJPJqZb9P+y7J
         3Ih6h30Wux23/Sw5pymXaD5v0838Gi87AG/EHGiecMTxfwWSkwORX90SHxAO8HHXa2oW
         1fjzU1DaytHOsP4wZlmVW0nsf7If07tfC2TycaGdcA3vfkYqKdTMwVLlvT/BFkVKt/Fd
         EvJYlc8UByrH4sBAXVrKzR3PG07nw26oqYcf5cHBMi6i6pfaUL62PnVL9RyYNrSKT63m
         bEDw==
X-Forwarded-Encrypted: i=1; AKwUvBxNXxAbilJrd716VQrzJf5K5W7tsQ/5PU71+KJpiuZbB84pICzFWF8t/yE3kGxu7FT6VztmdxmayA0cw+pl0Owx@lists.infradead.org
X-Gm-Message-State: AFuF++k20sJhBaZT1kXlZ+lYNgJyyQxG6etIQKpdaG5qQWI8XmtNbmhr
	JiSP8ADZ5ro1o/yNrVaCPgQ0iy3fO+ODQpVqHRRWuV4CJd52QcwUjM2rUf8rfFUPTdo=
X-Gm-Gg: AYBFou1RhCTNpuA9diqTpgtW5FSqxC8pkJVh5996K4vZFmzDU6A80eLgjXfyRokcNIo
	23aXHXjoTu/zZSvB0YP/vVxz74fgiv7iJGQpv0GPQnGRzWypNXoDQUcu7nBw2UdHyDgZs6MSziJ
	l1q1XxtoLNy5JJBEGMEN3M+yw2UyhkYuSO7HNaRW4f86dOxXbSVbKLYahj6ylrl5h90Z85smvCD
	vm6kO+Qd7eGQpOjLAvLtzl6zqZI7omAfxTDRsRYUpq6lGWMdr9hp134il+IUXj3YA40YIkEPYha
	+IHcRmKos/CmblS+/sD0Yq7YhKhqj7hlllTYM3Mix77AeQDf55WLAUAOLR0DrPzLL6aURWzN+ca
	RGNUYMw7BHrX8G0C+iDbIvducXK3umkXqKAHPks4jDYFB4+TZO1i+wmrvclAx0HH5CazdOf1Jn1
	ORQzlzq/d3TayowjCdHXfdz7lbSdeM+r73a1RLq26iFdE4i0E2f/3tRjsQ9YkFh1+HhG/lB2kUs
	V8mziUjzT1HSReT4GaIFVxEVqWkEM4hR04u02k+ug==
X-Received: by 2002:a05:6000:290f:b0:484:3310:9ab0 with SMTP id ffacd0b85a97d-484914d8435mr8297857f8f.25.1788354492009;
        Wed, 02 Sep 2026 06:08:12 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:53 +0400
Subject: [PATCH v2 2/4] dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID
 layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-2-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4722; i=alchark@flipper.net;
 h=from:subject:message-id; bh=/RzWURUSlbLsxwiuIazTsYvvak9uXPkuT7+9wqJHcUM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN98wCL61IsMQ7/0dv97TsGZmfZJz1W42WaKZtU0M
 Rt5c6Z1TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNXpLYwMy83XL+BRTM0vC1bx833+6pLjDmXt45cSjoV1f2O+cuhrKiPDj1/BvPa
 JFlwa/7vjN7y+NLmKzZgx8uDyNzLpKcrtjNPYAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060814_250559_F741238A 
X-CRM114-Status: GOOD (  19.37  )
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

Rockchip SoCs ship with a unique CPU ID programmed into their internal OTP
memory, and Rockchip bootloaders derive Ethernet MAC addresses from it so
that boards with no dedicated storage for one still get a stable address.

Describe that derivation as an NVMEM layout, so that the resulting
addresses become available through the standard nvmem "mac-address" cell
whether or not the firmware got a chance to patch them into the device
tree. Keep the compatible SoC specific, as the location of the CPU ID
within the OTP memory differs between SoCs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/nvmem-layout.yaml       |  1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   | 73 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
index 382507060651..ab94dbb41aac 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
@@ -21,6 +21,7 @@ oneOf:
   - $ref: fixed-layout.yaml
   - $ref: kontron,sl28-vpd.yaml
   - $ref: onie,tlv-layout.yaml
+  - $ref: rockchip,rk3576-otp-cpuid.yaml
   - $ref: u-boot,env.yaml
 
 properties:
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
new file mode 100644
index 000000000000..85153d480950
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM layout of the CPU ID in Rockchip OTP memory
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description: |
+  Rockchip SoCs are shipped with a unique CPU ID programmed into their
+  internal OTP memory. Rockchip bootloaders derive Ethernet MAC addresses
+  from it, so that boards which have no dedicated storage for a MAC address
+  still get a stable one. The addresses are computed by hashing the lowercase
+  hexadecimal representation of the CPU ID with SHA-256 and taking the first
+  six octets of the digest, with the multicast bit cleared and the locally
+  administered bit set.
+
+  The location of the CPU ID within the OTP memory differs between SoCs,
+  hence the SoC specific compatible.
+
+select: false
+
+properties:
+  compatible:
+    const: rockchip,rk3576-otp-cpuid
+
+  mac-address:
+    type: object
+    description:
+      MAC address derived from the CPU ID. The first argument of the phandle
+      selects one of the two addresses that can be derived (can be 0 or 1).
+
+    properties:
+      "#nvmem-cell-cells":
+        const: 1
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3576-cru.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        otp@2a580000 {
+            compatible = "rockchip,rk3576-otp";
+            reg = <0x0 0x2a580000 0x0 0x400>;
+            clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+                     <&cru CLK_OTP_PHY_G>;
+            clock-names = "otp", "apb_pclk", "phy";
+            resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
+            reset-names = "otp", "apb";
+
+            nvmem-layout {
+                compatible = "rockchip,rk3576-otp-cpuid";
+
+                otp_mac_address: mac-address {
+                    #nvmem-cell-cells = <1>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eb4e5a61056e..f3d07ce7b3c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23722,6 +23722,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP OTP CPUID NVMEM LAYOUT DRIVER
+M:	Alexey Charkov <alchark@flipper.net>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.54.0


