Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037ABFC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pM4veKlw7sYc5J7DCc/SxORcyDfB/eynQvq/fzVIvsk=; b=rnnJq70LvYKeNU
	Lq91tX8ghOvZxGhAforWW3djdpTgxQJPFKAScUbewrFwNzrW7u0s64Ma//sRK8+XS1vPslqkdKjZL
	S7tliddrWDuhdvXoNP+vK6yDF9MrP8aoJl+0npgnK7bps5JyriVKc00L2dKQ0GZawrS8edcKGlSGF
	jRo48+Dhmaj/Zqz4Sj9Oc5HNGylAi+0t1SIqqqNpGhl7L6ZRG7HWmg76ylUdu3ubDAdH+V70zneng
	/Ie99maG266/7YQrueJNANJj70OSethuXXFUYZ4vovemV5bTVUHNRg7W59XqZ0lFZNZ4Np9kgeI5n
	9eCGrmaPKzuneQzWb/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynlw-000000052Ef-1kh2;
	Sat, 07 Mar 2026 09:16:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynlq-000000052Dw-30Ig
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 09:16:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ae88e16485so5441695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 01:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772874985; x=1773479785; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM4veKlw7sYc5J7DCc/SxORcyDfB/eynQvq/fzVIvsk=;
        b=ZM3afZ7MzBqnshD18ZjwQf8fMfb1qMFN1iU5Tvzzklp9yb3lPQ5EKjnXxDpYlQNX9x
         /CBs9139LGi3Hoxkv4WhccCb9+QvNOzIYyn68gOH9ssHfBkkZk8SmxTX08Cs09QSNVS4
         T22DlPG2pCmZcPsWQM+YXDv89jCXJ9jNC5FH8BQhNY0qZiXQyj6pvLWCcV3QoYD5Qwi1
         PmFp6Di1Aort0fXNWSRZoGs4/rji48z7EsxRwC41D1of9Rt+D3OW5MZa5uloeiNVA6mB
         ZXzN4LDnLXOAY+T4NyfdsxZo3e4FIxH78RLWVNbYZSZU1wi6bVKs+uIa2dFNFq68ZzpV
         Kffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874985; x=1773479785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM4veKlw7sYc5J7DCc/SxORcyDfB/eynQvq/fzVIvsk=;
        b=sulM+bzCIEHe9WwXdi+yGdRAGQeaDc3vxPQHntqM9VQPkn5E8h4lBJwbz64NLRM/T2
         pHfq8akMUek8vf0VW8reWCJ/DeTBwJbIuQW/9jpFJGjLbsBGH5RdlkPOM1/Gpxmygavn
         adRRTlNO42qO3pG8wuQrC9Pt9ZM1midrjFf84Q0/c56G790NBuTYInMFKIXxK8teByiP
         LQZODsj1Ys1ilteAQHcU7zI+BHelsG3EyP5V7AcjMWSakDCBEcKOqUap/2uG+BfP46K4
         EDGqgI/E/eJjEP4AQ0w9sRV76iXGRc/uJlvKsw5Fp83ZMUncfLDfRQNk+BMHPEMXxzl+
         LasA==
X-Forwarded-Encrypted: i=1; AJvYcCVv92g6ZZtZzT5RypVuYOqaph13U2bgDAV7j3CryjwFfIZevRuuBIpFk4wO0QSh9B1MAmajLOrTrkrFx8tHXLWW@lists.infradead.org
X-Gm-Message-State: AOJu0YwwhecPVSLVaVYezIeuB2LOm7/GKkXTPzt64Rp/lR4pmPHMPsq3
	voEgYb6wWGJ0t2gZ2HoacbeLkWxmZlnyIqNqpjAGSs2J6wCU5SPmXge6
X-Gm-Gg: ATEYQzx29Ei5rHbhAcExyNMZ1J+rvvYzhzX+SlRmvPz+qhp4y/YykaYaSwj0RWoJacP
	VGufvzJKVGpEr4Y/3n19p98regAv5oTEJp+4cjrC7RkG8eVylJjmeQiE48H4YmES86G7u4k28M4
	q/MEKeXe+vX1WzgZbL/1ZVd2WUSa7nZdnLMSsA4cTVadvJPio8/zHjrfxNzAlsuFvFQIFgzfliA
	GI80mhnO5vW6S9hxPfceZXSy+23Lt+iwFsFgvFxp6h61EB6JobJjnZYCGOdlp5filJYlw2u2uWW
	+c7tED2mLGgS/r0KLdpiH0eTeTGYPefGY+vlru2kJHnZcQRs1eFFrYzM3a2vpgujllrWfcuo0Gd
	IRaRp5GAp350nr4DL3sxzjRnTLRNmNDJx73YLegc22YjNAyBm9SOpOiUsmo5qz4IbOZNbvBTE5x
	va3mjR/VqP4u0jVS07noemwVYdLRjHdx/IHYQV/ORezpQ=
X-Received: by 2002:a17:903:b4b:b0:2ae:3a77:a1f4 with SMTP id d9443c01a7336-2ae8247ed08mr49240215ad.24.1772874985576;
        Sat, 07 Mar 2026 01:16:25 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:24 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v3 0/5] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Sat, 07 Mar 2026 09:16:17 +0000
Message-Id: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHsq2kC/02MQQ6DIBQFr2JYl4YPFKWr3qPpguJXSVQasKSN8
 e5Fu2E5L29mJRGDw0iu1UoCJhednzOIU0XsYOYeqWszE864YsA1NcuEI33HJxV112gDElA2JP9
 fATv3OVr3R+bBxcWH75FOsK//CmdQVBJQRlswArVgTHRw6yfjxrP1E9kriRcml6XJs6laZRRcr
 LayLs1t23577oIC3AAAAA==
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
X-CRM114-CacheID: sfid-20260307_011629_040405_A387D6F9 
X-CRM114-Status: GOOD (  11.18  )
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

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  77 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  75 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  33 ++++++
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   2 -
 6 files changed, 218 insertions(+), 140 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


