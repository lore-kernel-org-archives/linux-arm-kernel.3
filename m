Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5281BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=; b=oHgTUUMz/RNkc/uZilfS8h2xxi
	OuKCI5x/lx4tWFbOC5MDGU/o24AR66/QUVO+tWW3R0tXyTph7b/s6wPoSXgv/vongBBNdXa7DDZbH
	x2vn1YKPLSgrIlPCchhVfI0fOFXy0JN1J6GBN9gDLUEsTRvWf4yVmHZ9ifLzX0oHZ+Uz3fU59uvYO
	uuIQGR7qnSs7oOgsYpS7obO8DH/Y5r/+QTnUeU/RN4HRSTUs52GsRL0rdLioj0ZJQJ/m1dGWOd6DB
	bzuTM/lQEBUsi8dGCAdmzVm5GL3t3FWtk4mNAceUsCVFeu5qcPRhMDaMB+dTg0JnR+wtdlXrrRKKa
	IIB/SAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdte-00000003mER-0NSp;
	Tue, 01 Apr 2025 15:51:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoD-00000003ku3-012l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:45:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso37845145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522347; x=1744127147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=;
        b=ljon0A+7kXVX4+I+NP/kgw+5t68GsvesQ9zgo8PWClAem31IYS6IisJsCLq9pmhxwa
         RBBM5TpHQAlPZxilNpDCAHeSMFdvfBSBJLg1kdKG5COxQMB9FfZtpNd3JqotBYsQinpU
         vkn4UtYDZkYsvtvNueXjFmmhLhDnhokcd1Pup6GZyxsL3uX5R4nouBbkY4le9UEYXbSl
         1KnGBXq9j7j2RbGV1uuo+nrH0EZofozz/Wguv9QWqUEkvaYbOwRvZbsejN7vn+KiS1vB
         9pXiWAjWbd9wh8CLtujaLqf9IYT0ccBm/Pbwnty74iufYQB3NUUu+sUqZKkM8nlLvVw8
         btNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522347; x=1744127147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=;
        b=DvnqFh5UtrNWhG4/s/hWy5HbURD4n6rK+LB7mMdWYs9NqPe5K8/H2w3dTbTbuyu2I1
         2Qggvo3//cON13T2hnsHodlJMxz98epyjpfdZnT7QW76XnMJypSTWkwPnucBRS+CbnRo
         XcgoYvq3+z9Vf1ETtmaaovGx3Fi1x2X2taJYm9InFpHPxaIHC9nq5G8pHDcpekgTAA5y
         +8p/2ILJg8mQCBG+UYF6BIUGVBa4ifjSQnsJrLE5jSN0QcJin+csVw+Kj/kcwQE17Jro
         viiyTHFZ2+geqbDNOg3ZVHXWQ3Q7YjcutJ+V80PXQV7Bu86xARuzHXY7TIjGCQUxYWnw
         vU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXefInc0RRSVxymtPLaaIFeFOnoAInAs1SFs45kY/e6FfDP4ljGpsJG+rEkgWtHE5MT8MjezRJ+ZI2iCV8LR6gk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr5/LruV77ZPAKXnNAZjYByhe5S0i+75SDU3NdFjopgYCf6KjA
	CpXc23hA+SPgrB0WKzRIIaJMbCoQgLlV1BHXD/hchXCWbjJXzNBh
X-Gm-Gg: ASbGnctLxmHeQ43AMy+iCX4eTWqZVZz99PrwPxCp0aQLKBr7vbq3ChTyFmEaCbcHLAh
	/ALRbDsJUKt8vm6y0SsP+mpp8fCQmgn9oyLqIKYYJhVBB489wXNDfIi6QqDa19t6Y12eUqeu5Mo
	Spe6j8mh+lZtTaYKs6DzD8zUoYTR2Nj4jBH2r1ya4mAMS2DSGX4S4kOQ5ACiGn+j6IJyASPtu5O
	WoZGYEqjZ+B7d54BddtM+aIruWxyyXADnROlaMsYb4FLvNb7pv3m2dw9dfcmcxDlQqQZ3ChzVXQ
	5J/6clMFvFTurnq5GZbJ/Lfme9tzHTrs4IjiTlztQCoLotOwxZ728uE6FQX9wUD+HpxSzylR0rt
	NWq2cTYA=
X-Google-Smtp-Source: AGHT+IFKiVxzUU2B9RPhqEV6JDP87B+NzuBTFyeKmjre2c1ZpVECp9TuSc269NxnKveemRjQQW/DLw==
X-Received: by 2002:a05:600c:285:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43eb055b4b9mr3423905e9.2.1743522346657;
        Tue, 01 Apr 2025 08:45:46 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:46 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:43:58 -0400
Message-Id: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084549_045873_1927198D 
X-CRM114-Status: GOOD (  22.40  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the 
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz master ID definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  25 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 include/dt-bindings/bus/imx-aipstz.h          |  25 +++++
 8 files changed, 264 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c
 create mode 100644 include/dt-bindings/bus/imx-aipstz.h

-- 
2.34.1


