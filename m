Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D5DCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B1xEqocq617yA3Nhtp5XMsU0wUBI4nxN63OSaZK9x2k=; b=1zSJKw02vUsY4MD+jY7NlkBIN2
	XgmtLnoh4pVSW8emg+CeyyTcvzmH23gSoe0YdNRb1dhiIPBIedDNrP56teTnnd8aSbRlwWdkADL0g
	G744GXQAx1NhbdJYhbQtadwhxt6EZTMaBCX2idnSVKM7AOFhM6k4Y1njwNXTw2vlpxeCBXgtHVdzr
	07WrQRRdhRnB4hLJxIOiCHtDuiGzpjbOAwRr+LuNSrbDgZC5aSKJiws53niIazwxWQp8VnWv0Nh3D
	h8zVAYreq/7DG1c7b9rGxMWP+ljmM/f9m0qEwEh049mfTUS+L9MUMZDT0na2W4bWvAObP4MOuCz24
	lEMD7jIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9En-00000006iOR-0pau;
	Wed, 10 Jun 2026 03:04:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Ek-00000006iNn-0VlI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:04:15 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c8585ecdd71so2240111a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 20:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060652; x=1781665452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1xEqocq617yA3Nhtp5XMsU0wUBI4nxN63OSaZK9x2k=;
        b=amjXVz9p1Um8fkXzc4X3HTbYgalPaSC65RTIgSqhlbl7pqA5VoylRDEdLWQr+/+ndh
         CI29a74eYCMkLTA1IVnsPYVWbwKtkYbFmeeQnULuRYVxdv7uRYbj6kHSURO78EFA9j8h
         XuVP65Is0ual+/eLGhLvbXgbMgykvbg7HGR+LOEJAheGYbAuP9e6PQbSoywl/6HXR01h
         dWaALcqNS+FubRRTJkya1tX01iTvt/GQvoJ6Fpgr3/aiBDxLTAdBZUrgUJNRe9zCDOVl
         PQBQvB1wC2NCj+w8fmppst156fN1YU8a2ErExVSpKWPqutkPQADy4hoWEceL5SOBJdTq
         tyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060652; x=1781665452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1xEqocq617yA3Nhtp5XMsU0wUBI4nxN63OSaZK9x2k=;
        b=XHAk0f1Uu3KC2UyQRmXzr32ILCLndSLrxzMDv28izcYN8Q4IBNmAcTKYNLEpsFwKs/
         XyaXPPw3KznfOUxWhx7/6vx/mc1NTmYQ1RPfmKLauG8tpddtsyEo5Tymzfr98n2LEBQq
         JPsgLXuf3L4d61DuerGcoxTZOef527UTyt1EgFaaAK+tEPJEPpE0r0yu8+ovjLEU6PA7
         wY8b8rmKO5aLpSHApzThJeC4Jz8Mi7C+npARbt1tOz3BeH+vPRh2xoIU4eS6+J2H1VZw
         UyID8Qwlv4oAu3Gh9G5ff2+tQkObrevOaB/Ufa8DMjWFWBBrYWM9b1WdVsnj/doZZCY2
         NF/w==
X-Forwarded-Encrypted: i=1; AFNElJ/mFeT3rJQGlxidA0+joIGJYekUsRwXsawS+v6bUMx7xXQzzGSJjj0392aSNlFMA63VioMi5Gh0E5+9+zkWYSAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwU+QhQ5k8+NC7EREqFvGxcIWFXHAO5pj5XD829Iugac5IigtrP
	k4YSIOaq5qyX965k5ZnjLf0MCMKI0UCGlz7eOuBvNFcQcP+He/khOGDK
X-Gm-Gg: Acq92OGT2s8ZM8Cm1pDUPyeC3nRNLOluHkPsYZ0WVxafiCXD08Ra8ZZeB8lhMx5fGnt
	awFc0VUcAi3HfGmWRo+BGvB4BkrikrreVi/g01oxQ6zVCfgRpE7uEDnXNxfUoWdBIGkjrYbbXuA
	bzpP1gcgvOp67qOYEN8J4+DmFpj8ppt46epWzQabxIvEufoZDRkG0dP53D9K9ln8xaNXJjXMF6Q
	1lrubPeXtHrb/Tz0hYNLHcLKd7fsNhvkQmNQkdXcuyMkJ46+y22qDEIzZvUwulRFOySFTYEge66
	vgDwWr8Z7sHduJEPzFvboZPG9OEOqEMleZHJ5fwFq9NLG0qyFlFXfgZF1KumRh6UmiXCTyPsGaP
	1fdQ0IMcQoScVd6RDufZY5AKFeNzs9MBt3reQdKxDTK/XpRSDYqe/VQX05aVO/SHzuJ4vrtVi/z
	I0tVGxSRKqO5n2gpHUJNFY7IbrNtMKfNLkucqERE4gf2iL3r8W7FUCPBV+K3MZanWacop4KKk1x
	Z5wV9O5732yey4PDfdp
X-Received: by 2002:a05:6300:6d8b:20b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3b4ccf4051dmr17145756637.24.1781060652242;
        Tue, 09 Jun 2026 20:04:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:11 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Wed, 10 Jun 2026 11:02:05 +0800
Message-Id: <20260610030208.2020275-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_200414_167095_3AEAB68C 
X-CRM114-Status: GOOD (  15.58  )
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

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Changes in v4:
  - Patch 1 (dt-bindings):
    - Update example interrupt number.
  - Patch 2 (driver):
    - Remove redundant spinlocks and fix 'irq' type to signed.
    - Fix target address recovery in ma35d1_i2c_reset().
    - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
    - Fix timeout UAF via explicit IRQ disabling during recovery.
    - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
    - Limit suspend/resume wakeup logic to target mode only.
  - Patch 3 (dts):
    - Add missing i2c0 node to dtsi.
    - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
    - Add nau8822 audio codec node under i2c2 on the SoM board.
    - Drop redundant i2c0 alias and clean up dtsi property ordering.
  v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/

Changes in v3:
  - Fix minor DTS formatting issues (whitespace, missing newline)  
  v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".  
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.
  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.
  v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com

Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 778 ++++++++++++++++++
 6 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


