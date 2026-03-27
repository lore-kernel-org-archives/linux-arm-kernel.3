Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC1410F284E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=; b=GpEHRWiBNEu+jK
	WVf4QmE/j9Rr43qHo050Gi3t2aCfWdOvDzGPuTAuPDZOt2b9bOfM/GwpH41M3kobH5TI2e9v33lrv
	zQ0LJPtkG8O5q8bRJD0DwTt8GqssSt5bS2sIS6M8fE1DXK+/cLMwpBe4TQU4IjL9ePyArrG0K4/Ug
	0cPbcNGXRkH7MpFGAcBjj8Cb8v1IlWbigRPUysxsOdL5W6MOyGidAFFAMafCqeiI8hmFSrptDuZGm
	hD4paJMcKIwWI0jpyGsX31zEbvLnZNxNxdVLhMHyMfMSWNE6FshtPBLv7lpb2qr3qu0ntbYqlCaZc
	89hckmgXQlhjzxtFOTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALl-00000007nYy-08qv;
	Fri, 27 Mar 2026 16:47:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALi-00000007nYY-12D3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:47:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ab46931cf1so25951285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630073; x=1775234873; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=;
        b=tIZ2H+ANDzBkdELqWlr1JQ+OQ7BGHo/9AV49Ui3aYnvle4N27R5S9z0aWHdm8FvRnF
         Nfjus92/TZozOYeTKP44T2t1Eyhy5aQvEZtA3HTtfqqwCnxShMsaZ1kU7H8LWQAE2dSu
         sD/YIlyQWv06O/611YqfUkMzOGmoktiCTCjoPFEzw42rDnEHgT/2nAsKWNzQlZPEfvm6
         D9NBk95utNrVM2AEoYpoSKhCGN6hPKW2PB/mjZ8Z6wzaDBlUAgvmhcdgCNnm++4O8aZZ
         FgZ99kmsoOPjY6WHRCAPppHE9RfyGWioiGsvQCQgst2vvAOUkBstwzzydXR50eIffVKJ
         1gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630073; x=1775234873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=;
        b=j4vKWl517kZHTGXxK8pcUxd8w7N/1r8+75Ts6mEfNs2wktbX4FWcmJkAw+z+2TTO1l
         SZOQMhs6HZ8rDu4u4wDDyLXXWX2pd5fj2MgcOJVprqkboVX9CfrtltAOOeSS9o9dEA1R
         6yz53KQgjcOZ28rujxAjy+a+VxDtVZ+hfjZiZsRvh+6PQCti7gEu0K6kVguCVh+Qif9l
         w+rP+3F0EKKrJwZ/6dvHVzWZETAshRB5yo5jPTY/icGmEecl5wxxjz3KLHIY2kBWUYvl
         kAblxxVXUWZf+LYXkyej0O1AMkcnJ14+GcOUbED1onm5zk+h9OYvtLZRtB80HnRm7xw5
         htwg==
X-Forwarded-Encrypted: i=1; AJvYcCWg5K+ZJvhstkFtMnvfQM+cgYxWCvF9wsNg/pA+rN8E1x83JR6gzFIuB430gwebJZZAiUFKnu2GXwQDvtCiJFtE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx59OIdXnbabNHbsUDMlVBOjseFiVGzJVpU+JdP0UD16KGutDxw
	vJnA8Whg+aRZFetIkhFkplz5s06+THB77J1OEFz84Txk05zJMs1ohoYc9C4QiA==
X-Gm-Gg: ATEYQzzsQ0UpiWjkNchI1jnAJNgVs7YUgLTwr3NOcQ1Bb4RqquxvMDC4MG426pVUr5Y
	OwiEbF0xTqCgmqWvxCMMBwPUbRRu8PnuTIxWyzJny/g04FlgN4vaHV2joZzmRSYP0+RgXxram0p
	fCgNr5ustToN1zQkiBNxqNb2FmgpRaTAWyb1uq2Va0qhPymUgAjW7OT+nboPEBZWmGvS+Te5XNl
	22xSBT2ux4wb9Puy5WH9dIz63d+PX/vVZS33jkrUC42J/jXIlb8iGg33gfRkr4nXOuCPSoudPWj
	zgNHzI4B3ZpJXk5L+hdGccL+nLG0GJ8sl1Qd/fF6XdfUzklOQ2C7FZK6G3XsVNAuVcre9NQCvrV
	m3Rzr+fLapsHg9GbnzwYkUnGqX7YStp1TIab7PrsPaiiRVEnMJTFWnL+/Cbj51nUECVxmt6zvWd
	F5XddHZJcilpzJJ0qy3a+tPYzZRJP/0MSz1Dnybuwpakzb
X-Received: by 2002:a17:902:e94c:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0c48e9a76mr63024805ad.15.1774630072724;
        Fri, 27 Mar 2026 09:47:52 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:47:52 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v4 0/5] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Fri, 27 Mar 2026 16:47:41 +0000
Message-Id: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK60xmkC/13M0Q6CIBTG8VdxXEfjAIF21Xu0LhAPyqbZwFzN+
 e6hXcS6/M7O77+QiMFjJOdiIQFnH/14T0MeCmI7c2+R+iZtwhlXDHhFzTRgT5+xpkK7sjIgAWV
 J0v8joPOvvXW9pd35OI3hvadn2K7fCmeQVWagjDZgBFaCMeHg0g7G90c7DmSrzDyTXOaSJ6kaZ
 RScbGWl/pfiJwXTuRRJisbK0qHWvMZcruv6AQYTrBkWAQAA
X-Change-ID: 20260129-atmel-usb-37f89a141e48
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_094754_305778_BFB9BAA6 
X-CRM114-Status: GOOD (  12.27  )
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

This patch series converts the legacy text-based Device Tree bindings for
Atmel/Microchip USB controllers to DT schema (YAML) format.

Note:
The patch "dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema"
depends on the patch "arm: dts: at91: remove unused #address-cells/#size-cells
from sam9x60 UDC node". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v4:
- generic-ohci: Modify the commit message and modify description for the
  properties "atmel,vbus-gpio" and "atmel,oc-gpio".
- atmel,at91rm9200-udc: Remove minItems for clocks and rename
  unevaluatedProperties to additionalProperties.
- atmel,at91sam9rl-udc: Remove minItems for clocks and modify commit
  message.
- all: Remove the corresponding text binding node for each patch from
  the text binding file.
- Link to v3: https://lore.kernel.org/r/20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com

Changes in v3:
- sam9x60: Add a new patch removing the unnecessary #address-cells and
  #size-cells properties from the sam9x60 UDC node.
- atmel,at91sam9rl-udc: Remove #address-cells and #size-cells from the
  atmel,at91sam9rl-udc binding properties.
- generic-ohci: Add an else condition to the generic-ohci schema properties
  for improved validation precision.
- Link to v2: https://lore.kernel.org/r/20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com

Changes in v2:
- Drop the separate YAML patches for OHCI and EHCI.
- Add the compatibles "atmel,at91rm9200-ohci" and "atmel,at91sam9g45-ehci"
  to the existing generic OHCI and EHCI binding files.
- Link to v1: https://lore.kernel.org/r/20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com

---
Charan Pedumuru (5):
      arm: dts: at91: remove unused #address-cells/#size-cells from sam9x60 udc node
      dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI binding support
      dt-bindings: usb: generic-ehci: fix schema structure and add at91sam9g45 constraints
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  76 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  74 ++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  41 +++++++
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   2 -
 6 files changed, 224 insertions(+), 140 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


