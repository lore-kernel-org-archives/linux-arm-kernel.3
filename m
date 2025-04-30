Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0CFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yCZezkL1GW+eHlpdTmG892fGlIjWcoTOGCzL3tZBGt8=; b=ypDF5M4aa0Ybsh
	sq1x4JKN0P6yx+/E2oW1dFuds8QBiE3fwfM1lsu8NayWBoxEjOqkx77GGflvDIuPhEWHebmBwaPd5
	NQJJn+vS024s72mqyYOF+rqeAFAS6N7ZxBdivG0Cpj9VDEdSmSC2mKZ+43CWOEJ5nCfRT5dHyvmGa
	q6BvsKQ5UiC+6nGghimT1Xqfl0rhJzeunNcBa4lp19HZ7Pp67XN1r7E01E5zZQZ6NrjV135N9LNgD
	6n6e143hoAseN5v53gkbKpts+h7FrL//59fu5usMJ/KFOm3jBjwfRHdJIrmyzAgBw+SBBQCkxtULF
	6YgNpS8ZfH2CkQ3kVKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1ZK-0000000BwpB-2Rlp;
	Wed, 30 Apr 2025 07:09:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XP-0000000BwSL-1QZP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yCZezkL1GW+eHlpdTmG892fGlIjWcoTOGCzL3tZBGt8=; b=F/ULbVUxErwOZMnITjDewr9eLJ
	Sfpd4J7TrHTU9Gqhot1Jsod6Z1X/Lgod4vZlbhjMmlI92ZuYLzbCWrVItT7PlHNSKtMV25/hZyJVw
	ZBgH5l6QCFR8aW/GiJf2SUb+3yuXcv37rQcXtvuEBSBO/39DVnePMOGjKAJmXylptYYFOa6LqlWrU
	ABYX9FHYj0IG8SZcUykNFAB0E/Vy6ia2EzuzExFhFcXtoy9tsst4qkV6AQtuQW1QOL6w4jJplOA4S
	M603WgOKgp/2pp2lV6Sn4hlDPt8s3Ot4qKyHi+iS+I7ykWXManixF34hcYCS5ynkEGrDA2iuhBnlf
	lwnjRXOg==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XJ-0000000DiNm-0yXI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so8905491a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996834; x=1746601634; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCZezkL1GW+eHlpdTmG892fGlIjWcoTOGCzL3tZBGt8=;
        b=C3V4VgshbZv02T5P4tTV9pe1gdzK7D6c9f6AhKr9qwVwSqqeRTY7eaOXITBs+/iYvw
         QZSJhqKp0nP5cvwmm7kGe5Z9uKdtn/wI+DNFsFinFmDcNDmPPLdfRV3s3Z0Wm8GhvcyU
         1cvAOMcT/m5dQj9Qk2XZrkMhFcXJe9bWgoxh1DsNZVgq3NJwbeuMC0BViVWbsLP794Jz
         xuDo45pGtvr5dPeRHkCN3vmxjUCFLBcvL+TtQPtRbT2k6oHr6fU+sYPx3wwZWy5kx25G
         6/XOEOXJ+ne4fOGXD6dysoWRg6tIMBDp6BrrilI3RfB4V4/Q548eDi2r2LztGcZjnF2e
         RqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996834; x=1746601634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCZezkL1GW+eHlpdTmG892fGlIjWcoTOGCzL3tZBGt8=;
        b=h1ZQOaAsG6geJNvj+4hLAhzBrrhZFCveRMgcO6MI1Fhg+GzPF0XskQV0PDpraCNa8q
         R9pg4uAWFdQEl0GIU/9ffF5xV3NsMmUdN8tXV0FwsUWZcRmbV9TAq0O/9fwrIvxgENrE
         JpzNgI1MnKMkzUcmpsJ8tTqWuVC2+krnDI9JWe2/dDPoKGWnt2ObxSE1SMkQFsVMmPHx
         EpI9B3v/h0qeGg7eJ4VUgdNr2TosxIJKGH6kzbOh+PsjeP+4Rf9l9C4TWa8WESR63mBP
         bStV6whRIYjqMi+xk/DU0n2Zx5mABXCm8cynydJc+BRqqVFmUFq1WqQFZAexbdTW7CJ/
         pu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwxNpnQCb0QGDdS5MLwIoiuIa569+JnEUqdoE2A8PI5dMYEcbFCfe58N3II+Uphy9wIctzG9g+H28dohVEW+G3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzob0I3mzU6eIc7MhyPUgQJzhGVm8jYS7/0A6mh9ZS70AGGMQpI
	fYkWN8LiUQvNf3iLzPYprnj9Yqb3eTjmqk03r/wZSwXYrNCadU/V
X-Gm-Gg: ASbGncv/J3GW5w8LzDY8aUKKrHF8JtyuHoAmgwZAc1BxMuKhd3VsyFwjABjxH/84Cxo
	Pg81qfpCe1Z9lvWgVojB7qdyo46ijz6qYesmdCURNft1AzYSRDQx+POoS19arDeELQlbrwv/WRy
	tvcewOFGghYECoX3oVhn3ZHdtMfLRgiEpCkV+n/v2p+m7qeDYwGnZQIY8QxTnmU1VKClh7ccjvP
	MQqLTrCT0umx42OTmWGsGVdiXIbqsO/mb16eJusdcWAqq1aK17kyTd3CV/OSHM9M/MG8rm40LKF
	TIkwusvwUnM54r1FYZjta1SqaTKbMYJY8UIRwcCz08iEPdCK7RVZ2eLUt3ihSh9XllEzsSnIxom
	y7ELuQwUjFng=
X-Google-Smtp-Source: AGHT+IH8AWzlzZJPAMnz09jAaWWKRGsufLNtWVCf7t2a9gB25c8aE/jh3Th5ts6tU+ILFI5+KiZnnA==
X-Received: by 2002:a05:6402:3509:b0:5f6:218d:34f3 with SMTP id 4fb4d7f45d1cf-5f89c116d3cmr1744138a12.28.1745996833764;
        Wed, 30 Apr 2025 00:07:13 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:12 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v8 0/9] mfd: bcm590xx: Add support for BCM59054
Date: Wed, 30 Apr 2025 09:07:04 +0200
Message-Id: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjMEWgC/3XRwWrDMAwG4FcpPi9DsiVH2WnvMXaQE6c1LE1JR
 tgoefc5hRGTseNv/P3C8t3McUpxNi+nu5nikuY0XnOQp5NpL3o9xyp1ORsLlkDQV6EduAGmSkX
 ANxwJo5h8/TbFPn09qt7ec76k+XOcvh/NC26nW4lDcLCXLFhB5RjrvhFoMbrX86Dp47kdB7OVL
 PY/aDPkXgkQVTnoEbpfyIAOC+gyDEFbtipUS32EtEOLXEDKsAt9sF3tVZiPkAtoy4mcIXjuGb0
 2QPYI/Q4dUAF9hhrF5dezEP1ZTl3A8muWOkOygmh9iBikhOu6/gD13TWT9gEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4550;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=VS+xlrw9Zg+0emm6wlTPjAFokaDbaMcRgsU4cs4QxcQ=;
 b=LkPJJme0CeOuWGxdl/UEmer7IN2WIrREelfrgk/qqB8Aqo25JGhq61RDghEGRU+wxQe99lPE+
 2YWhvsAq3rfCEo1yh+b1fyLAfOg1dZEEEivrVYPlerUUQYX+Xpjt5A2
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080717_517082_8BAF2534 
X-CRM114-Status: GOOD (  18.96  )
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

Add support for the BCM59054 MFD to the bcm590xx driver (mfd and
regulator) and fix a couple of small bugs in it that also affected
the already supported BCM59056.

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
Changes in v8:
- Rebase on mfd/for-mfd-next
- Drop "mfd: bcm590xx: Drop unused "id" member of bcm590xx MFD struct"
  as it has been applied
- Address style nitpicks on "mfd: bcm590xx: Add PMU ID/revision parsing function"
- Link to v7: https://lore.kernel.org/r/20250316-bcm59054-v7-0-4281126be1b8@gmail.com

Changes in v7:
- Return -ENODEV on PMU ID mismatch
- Drop "Check your DT compatible" from ID mismatch error message
- Pick up Reviewed-by trailers from Rob on DT bindings
- Link to v6: https://lore.kernel.org/r/20250304-bcm59054-v6-0-ae8302358443@gmail.com

Changes in v6:
- Rename mfd/brcm,bcm590xx.yaml to mfd/brcm,bcm59056.yaml again
- Use PMU ID value as device type
- Rename rev_dig and rev_ana to rev_digital and rev_analog
- Link to v5: https://lore.kernel.org/r/20250221-bcm59054-v5-0-065f516a9042@gmail.com

Changes in v5:
- Make regulator binding descriptions reference mfd/brcm,bcm590xx.yaml
  instead of mfd/brcm,bcm59056.yaml
- Move regmap type enum to common MFD header
- Link to v4: https://lore.kernel.org/r/20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com

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
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
 drivers/mfd/bcm590xx.c                             |   67 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   27 +
 9 files changed, 1358 insertions(+), 406 deletions(-)
---
base-commit: d0eceba4d13341a1d2d52a1ffc31b6987174dfd0
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


