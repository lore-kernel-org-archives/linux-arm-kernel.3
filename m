Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AACC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=86egy4ZfrN4CyOgF63gNBhcznnxcuqKUfVdI/qpLUQQ=; b=GBLw1sKqaak/fd
	tqCek6D/auwXYu035rvNSZ6hY0gW1z1BN0fIO7xD/cjjIQUx8Org1lbVihXp/AwCCvHwA13hQZnyD
	Szjl7D8lwrRW62Fr9a3Sz89EA7mOm8DYCp7BdvHNmY4zF+yB4nIvtRYwFBdUkKLjYB0AAiVJvmmGl
	Vzn/NeI8sZe96X5JUYvLoqMjREdMSjTgd6mA0C11ySgUwfmF6asHwAynh0zyaP6I3Pz8ITrqvUnAF
	ixcCuocQE9z3JyX03VBRLK6kchIDOD7pBFWJ4u4P9dPPqPaEizWaw5IrZ2JP4udoeONgSaDi41w8n
	daxZkvB9UE/94UrMkmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEfl-0000000HLwf-0DUn;
	Sat, 15 Feb 2025 09:41:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEeI-0000000HLZt-11lP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:39:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7f42ee3ecso558203466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612384; x=1740217184; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86egy4ZfrN4CyOgF63gNBhcznnxcuqKUfVdI/qpLUQQ=;
        b=UFh0t3YLX56rXpx0s7s3h2ptRTiHhsUr8TZU6unNAzh9moZRtDhcDxSFbu0tp4OlPX
         hfucQd8NYud4OZ5sjEzlk/+vQD/+/m8VfJbOu/I0hGDgORg1hIDKJH2emJda0qlPoMYd
         OYgPJ84yZq/gPK9NB7ckVcDP6WEngpvjhjDKIJI/Osl/PbT0z1qWT847E23oVNfks6yZ
         3rECrgBLcE//XhT34VJIihqbeFI84sSxVOKUv1DC94eacX7WFw7w8CKxqGun69dC0Hs9
         nXEqVfQVIKv4SopsX8kIhvp0B2+eDIrmeRL98gBCYYP2jhDrGhMppWwSzeHy4D1GDEX8
         GORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612384; x=1740217184;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86egy4ZfrN4CyOgF63gNBhcznnxcuqKUfVdI/qpLUQQ=;
        b=qcdaBplaRUHvPtislxv8Ufervl4UDKoKuYV09+gOIs3vUpDSrC8wpyWZBx7deKathO
         agP4liIbkln+2MjtNMxMrW5/RNuy3wF/oEBg5VuMtVWDTZOYIRqmvDXl61My0yEUSQoK
         WkofQ73MYjp05ScAlcKm2+PDJZqMuK7cHhXi+/0wDE1wjqE0cp3FkLtLgeUni50XqzVh
         ZDzvfsB0bZpfgpBbDSE5faNyhtJdER/2EoqI1aHGoz2BY7TrBRp4WMrNWVBHG6ncOxv0
         F2T7paviAHVwRhrEX2jMhbIf8WFOpn+MJXZggcW3kINvGPumm+g39O6vSOxXjD19aWlY
         aiZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnr1M2p9m+WEstCUd2rx4orf/p1Ab4UlN2RsyqZKAsSSR4uVAqV/A4+TzZD3kxz4tcLCly5XW3EWMLDGM3GSzF@lists.infradead.org
X-Gm-Message-State: AOJu0YxTU6i4xtnDLCGFE4OOPJfTRN+ChKSFFSe+TIYGZ8X/MmMq3Zur
	dmNvuVtOBFr/edwc59rpDkZ6Xe0hLOys1cg0qLH38hKiF2liHqni
X-Gm-Gg: ASbGncs64RklMhwiw4DKdNVcjVcwkMi3r1ao4N2gGKxAj6eqZBTHY2Ok7AZ5RzmYFgn
	vrn7CUQAYMY1snO9vUf3bAYUSj2V4mJtY/iZF7t0XfO7zFaN2X9P1VcN8XAdUZg888VElMt2i53
	XEt2Y+x+zMLuYjfuHfm/sJCei4EFoxWc0bQRkwEef2OAfyxL485UBezcuc4eW8gEFdIi+Qd7W6S
	l5Wg4D4muDtB9KgYB+N48N84UP+cDmwWFJtMr8AuecKbz2hcGq+BLdxBOoEL3YuGCji7tyLiLn9
	+JIgC9VTlhX+JBkiVE2PrSlEkIzKNlxeg9IBkDH4wKaeh8eh71tGtGBrMbJ0PQ==
X-Google-Smtp-Source: AGHT+IENdkHZpBflakq0UhjZWZEzOJw6B5m80Y1ZAs6Zut0H92VjFPqffHpMVosJyAZk5ksaHWsloQ==
X-Received: by 2002:a17:906:c10f:b0:ab7:97ca:3276 with SMTP id a640c23a62f3a-abb70bad02emr186346866b.25.1739612384203;
        Sat, 15 Feb 2025 01:39:44 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:39:43 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v4 0/9] mfd: bcm590xx: Add support for BCM59054
Date: Sat, 15 Feb 2025 10:39:35 +0100
Message-Id: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANdgsGcC/3XMTQrCMBCG4atI1kZm8tOmrryHuJjGtA3YVhIJS
 undTQtiEVx+wzzvxKIL3kV23E0suOSjH4c81H7HbEdD67i/5s0ECAUGC17bXlegFSdjoKi0U+g
 My+/34Br/XFPnS96dj48xvNZywuW6RCSChG8kIQcuNZZNZcCik6e2J3872LFnSySJf1BkqBtSg
 Eika/qF8gM1oMQNlBnWNVktyKjSlFs4z/MbJ+K+kRIBAAA=
X-Change-ID: 20240816-bcm59054-a880695e41e8
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=3425;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=RvFKjUXvMlJHaw4Y9IUcOiSRqQLAk7/bwVL+DP39wkk=;
 b=88mIlCjjPlj/GIGI1gc1wDt7c3aesuxLI9/WzIx6ZhQQkodOm6fp+3/hlDvA0J0CFno6V9Li+
 z2v/fs7jNWeCZnG3ayzCjXNdi+iIMiRPn3Mc+koFvwcrIclLwDKqqQs
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_013946_292878_6C23272C 
X-CRM114-Status: GOOD (  17.93  )
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

Add support for the BCM59054 MFD to the bcm590xx driver and fix a
couple of small bugs in it that also affected the already supported
BCM59056.

While we're at it - convert the devicetree bindings to YAML format
and drop the bcm59056 DTS in favor of describing the PMU in users'
DTS files, as is done for most other MFDs.

The BCM59054 is fairly similar to the BCM59056, with the primary
difference being the different number and layout of regulators.
It is primarily used in devices using the BCM21664 and BCM23550
chipsets.

This patchset has been tested on a Samsung Galaxy Grand Neo
(baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
Testing on a BCM59056 would be appreciated.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Fix yamllint warnings in DT bindings
- Address miscelaneous review comments related to DT bindings
  - Note that I did not end up moving the regulator refs from
    allOf compatible matches; I explained my reasoning in [1].
    [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
- Add PMU ID/revision parsing to MFD driver
- Fix instances of regulator data not matching vendor kernel for
  BCM59054
- Use different voltage table for BCM59054 VSR reg based on PMU
  revision
- Link to v3: https://lore.kernel.org/r/20250131-bcm59054-v3-0-bbac52a84787@gmail.com

Changes in v3:
- Split out regulator DT bindings into separate YAML
- Use tables of regulator info instead of get_XXX_register, reg_is_XXX
  functions
- Drop "regulator: bcm590xx: Add proper handling for PMMODE registers";
  it adds unnecessary noise to the series and will be submitted separately
- Link to v2: https://lore.kernel.org/r/20231030-bcm59054-v2-0-5fa4011aa5ba@gmail.com

Changes in v2:
- Fixed BCM59054 ID being passed to BCM59056 function in the
  regulator driver
- Dropped linux-rpi-kernel from the CC list
- Link to v1: https://lore.kernel.org/r/20231030-bcm59054-v1-0-3517f980c1e3@gmail.com

---
Artur Weber (9):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      ARM: dts: Drop DTS for BCM59056 PMU
      mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      mfd: bcm590xx: Add PMU ID/revision parsing function
      regulator: bcm590xx: Use dev_err_probe for regulator register error
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
 drivers/mfd/bcm590xx.c                             |   86 +-
 drivers/regulator/bcm590xx-regulator.c             | 1294 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   22 +
 9 files changed, 1377 insertions(+), 406 deletions(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


