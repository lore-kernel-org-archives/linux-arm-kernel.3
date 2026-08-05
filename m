Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD2C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=; b=ufkoCKEQGQE6rczHUeldyssF0g
	lm+lF7wDYljyqenKKZvG5ETjiJVuO5RqzqdN7HyGSAiMUodrdul5Y64nHj0LpNSiAvg3gCcK1/JKQ
	SZlqRGN4ecGdQN6+H3KhimA/7uLu/Zj9sbkZONziLX6hFkleYjALs8HUXiS11rbHBcVZ6Ak8789+U
	7vxv3XZnqlhlW24N7UX6vOLHJKXRFWNlKXSjxv9g0DHBtaSWGt6NbvJl4O8OgvpbKn0MCuql+b9+l
	S17EuzPLZRfTkh5V96sr8zXNxxF+izKGzTg5fobvun6DK+EmRdTHTwt1Su6zJlH8qY5Y2TfhM3fqo
	E6sm/CPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMx-000000037Oe-2ob6;
	Wed, 05 Aug 2026 02:28:35 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMs-000000037J0-0OJM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 02:28:32 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so464367a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896909; x=1786501709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=;
        b=KTToc3Gp/P04fDP1SGH9XtlfKvnpfForv4pYsYUtkFJKMZX34omRV6imziaaEg54lj
         qRbcDb4V68kRs2sojpHsJnxdczhzV+kdZZwlklo//UF67mUkPfaCBcFohmkmGTwVPt6N
         Kxx6up0efmI+b9D+Y4HLGzPfQKd5yGzVpcSBIrZplKnt46QLA7J8cwRAlyM1ZkFRrPEo
         BKmu9WIf08xfnUKzeUYyJArdR0b7gyI4KFLV/nwW69QbKflJfM0Xg5zA7O5bhKZ6+KOT
         LjkSw3YQEm8iwnPY7QZnWtbNWPf/dYoha4om69KHDK/XVplqrjbKfMLT4FFJjpyMXofP
         9eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896909; x=1786501709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=;
        b=M3kSjj35HZUDsRQ+J9QwjbILvgdPRamz+FEUTR98ez28mGH6EIkZiNfw1i0fj1wfJU
         DX8Aa/jpRdSoEE0ooQLxxtn4I/eigeH6RvP1Tfv6jIc7nBEEAWsEUlkAyKqpkarPO05L
         c+OhYFad8uLoUInapmGGmxyWQ8P4bCZySA3QdwmzTVnFdGFlvop+MKY+UwonjfuNz2U1
         oCqkilZTnOIGmbysZSEx/N8MkzBIYh9j8Ab/sIo4L/m2dqC2pLnVVuP7R6F4RXx55Zaq
         Wdbd8NW7Dtk2n3qWlhMpCjKV41Vx9eYwutUGrSdDtbg9FMGuhU0S0NspNUf6l/YMU7Fx
         ivmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6nABbFbMKSQetTFL+J43AzKu5RT0gwMmI9P8Is0HtzO4+I/h/Al1DrFvd57ur+3GvfLkO1+ZLKadUAtBKcKZ0@lists.infradead.org
X-Gm-Message-State: AOJu0YzNfIIs2UVzLzFEinO+i1r2ogB7VERuUA9qu+8olNFjYZzq61UA
	r0kyZAsVTSHhyhLTlC9TnvpEniaNrEJSopPXBLwjH64UzqTeoG1IQFgB
X-Gm-Gg: AR+sD13T+sFDxhyoKuG5ggPyJM0wnHK7r8j6swQIsaayOKxYG9fe+gMpz6bkN7fMZKm
	0xPiovwerVGuYn7C7XgPjRw3ZmRtsULp4OAuLop6xnGiGO/vR/Y8x6NemNogPVHdaAaywvagjwD
	7CrOMqv7env4O6LeTTt5kYkjEXd1iYSlt1HD3TYVqJuwnWpOXcpJJwpacF99pP48g7mb2lAuVRc
	BcCe1kT6h/R5zQhOUC+am1H/ScEwUSA79Dc1WSIOS1DVtZVk4IUWXUlKsPA7d/NavsyDewRl0rp
	fUGsZ8km+FfdDLWdRx2VrvdsNBJCJGiCsombSINOYF1JiadMCAl7GM5+1ByJ6Z/Gsvnof6ylL6z
	Lr6x3LYdtDH5s0lfw3fVZM9QKWH52Txp/KlAua3A6vjlSQ91zRXWOrGyf4PzTWowoUcXBAwT1X1
	1R4IASmhqgyOF0OEnqhfQ404gCpOiMsM2ScWNTgI1+md+TxDgMuLJFRy9W5WR7/bzEOUPIQR3pT
	d/p4UocvwRI84KAFz8IsB8XXy6g7kDeEDBhEbR7wLVHh32xgsU6wqyVm2TyYcseAwVLq7zmYmVU
	ffCJF6vyJk2Cs2tInncKhhxLsJv1zsy1YLv4I4pyZH7GyqGWQkXv6MQUi1v70tlS8lA1pA8wSnY
	hmQTiBAz6SZh3v717
X-Received: by 2002:a05:6830:2116:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7f1e5d0f2e8mr2637298a34.5.1785896909187;
        Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:26:59 -0600
Subject: [PATCH net-next v2 1/8] dt-bindings: net: x-powers: add AC200 EPHY
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-1-3eef49ff1d8c@gmail.com>
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
X-CRM114-CacheID: sfid-20260804_192830_155118_46A82C75 
X-CRM114-Status: GOOD (  13.80  )
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

The AC200 contains a Fast Ethernet PHY whose power, calibration and
interface-selection registers are accessed through the parent AC200 I2C
regmap.

Describe this control function and its optional SoC SID calibration
cell. The vendor sequence adds three to the calibration value modulo 16
before writing BPS_EFFUSE. If the cell is omitted, the driver reads the
AC200's internal copy of the calibration eFuse.

This node represents the package control logic, not the Clause 22 PHY.
The latter remains a separate ethernet-phy node on the MDIO bus, which
supplies its address and the MAC-selected interface mode at runtime.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
new file mode 100644
index 000000000000..5bb60542030f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac200-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 Ethernet PHY control
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 Ethernet PHY control function configures and powers the Fast
+  Ethernet PHY in the AC200. Its registers are accessed through the parent
+  AC200 I2C regmap.
+
+properties:
+  compatible:
+    const: x-powers,ac200-ephy-ctl
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the Ethernet PHY calibration value
+      written to the AC200 BPS_EFFUSE field after adding 3 modulo 16, as
+      prescribed by the vendor initialization sequence. If omitted, the
+      driver reads the AC200's internal copy of the calibration eFuse.
+
+  nvmem-cell-names:
+    const: calibration
+
+required:
+  - compatible
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+additionalProperties: false
+...

-- 
2.53.0


