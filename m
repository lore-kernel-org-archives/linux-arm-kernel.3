Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FB4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWGxRqXYwXVjQF2VgpDkF8UFWF+toXnMX0eHKDEnOmg=; b=hUE0O/57jHK3Cw
	4lnZLZlZQWJnIlZZGN6rmTLtlhWqWzcSTTjePbNvZWJddF9RYsy3xMBZCwOuymGymJj5heNxoOSLV
	HiAXRL/PsRBQ8znWSln4lvIw6mjOi6/W/rmnYCDfndb0Bkos0C+z5kwgNVj32ARskjFSJUevAYnKX
	VMmg9wCtW1GvHXKTztR16cuUbkQk4pq28i2/x7qfBM8z2r8gGUkQ4ZHbfF6x5jeZsjii8jcmv5Jmn
	jrrN0d7z+cdE2spWgX4CRdfMjdDIT2hc7VXUivN8gZQIDtYvFSQan7/4CjYzxfR8cBd9lNWvLGP7H
	P6MaG+Tn+/6mPZI9ZS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLh9-00000003Fwg-0U9K;
	Tue, 04 Mar 2025 06:23:59 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLe0-00000003ErG-2WgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e50d491f69so3728846a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069243; x=1741674043; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWGxRqXYwXVjQF2VgpDkF8UFWF+toXnMX0eHKDEnOmg=;
        b=CVRfaL08fq2dyJUwPvpJ+l2CTl3VHkJs/PKiCQDkOpMe6KPU1wKrpxoqt7NAHDPFOa
         /KGL8Q43koaN0PjCTrsdDK6Wd7lI6etULx4TKFW5WEV7oE7ywx0kKet1WC1l8FyTUA5S
         O7TDKCNUu3PBA6XC+pIL7cxCfcr3YE93b9SObmf1sDoqnH0T0f8vnSVo8+U3y11eWAlv
         IjQgTksB4TVJuLDDvBtPICN/ZrY2LwyuxJ9BDdpDRkQ+ZNzSgBpa6xRZ/xlbTVZvgVwi
         LZ17QkjcoX27heW/OUnpk7uxLuKZRYySdXgD1h5kUrYDYM+cXI9L8LDAzicy91o2HwmM
         n82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069243; x=1741674043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWGxRqXYwXVjQF2VgpDkF8UFWF+toXnMX0eHKDEnOmg=;
        b=N6IQD8KpUH7ncPQIVY5ctQA2wX2QfOWZvYyTh8uPwZhsld2A6pZalVzoZZnuIyMTSM
         Gu5Z9k+lz4yqsjl8gYrMNelMC9HTPsjs1ESaXtFIEjcrNpIXWF98GrobxGTwAlLvqYRb
         JQAXvj8mfVBqeZ+/ATtEXX9hBXwhQQPv33GeiqxzMA/1Hxn3qdc7deUBka8xo6hgYEbD
         ivOiglHgEIg4LpFLG/dFo97UUK/fGTGrBfYFeOvpdzRaupFF5KaD5zN8N4t2cTD9+mNU
         GFLSijv590f04MvrfdAsfcMBfN9XK1bWqvwCnbFlY9VpRDpbixrqjsBFCKSxoP4DNwht
         Mwjw==
X-Forwarded-Encrypted: i=1; AJvYcCWDpQHWE09QPVwtvlnwM1LgPZ17unOhn9y5tmVkfAizHwZOOOGUdlTFf14Y47EMpXZ/7/m6FJZ49S/HD0t0fm1c@lists.infradead.org
X-Gm-Message-State: AOJu0YyMzd63lSxAxpvZYefqrFVl2uVBm97kwvBWaxmt/hbBK3Qpdv8B
	p0Q9lsJLGZgkZM1OjF9yavFv1Yb0nTh9lEX0HJpB2wT1InpNzhqQ
X-Gm-Gg: ASbGncsNGowzMxRgE/FHu/xhOTnHf1aqf0dOiJ/IWbEl3DEEUfQiXoWdKDrp6zKUNri
	VfyLT/aCgEgO6EGOtLtPuwYDaa2Z1VfX4TqtjDgkHiIbrFkJMBPU5hoCumBGSmesEvx5k3FGVMU
	3Gy65l/zHnKaJVZsfA1OdyWcomcQG6oX7yjDa1QMrB1zfML3sPtWCQ0sykPFeDXjz3EJcYt00TI
	yqyg6irF+F4675RDbEg58Z20PbPFOXoE6/WMpq/pRa6fydzlMHlrM8YP7blX4UL66scgg06FzNb
	3gyEAHKLhPwSNw0pl5wRjQpEJDi3TKLuJOfMzXKj3/Es/rqMzhHse6f9whO04/oCi4J/DPhzVpW
	R3YPVfJW/xNTkNoA=
X-Google-Smtp-Source: AGHT+IHPqYvIb0WFOWiV7MEh3Cm4vFkXr2XKwuCciEXdcMZInaLH7urDEXy1v5oXsJLy6d62i9zjpw==
X-Received: by 2002:a05:6402:1e8c:b0:5e4:95d0:7e1f with SMTP id 4fb4d7f45d1cf-5e4d6b75f1cmr16105945a12.29.1741069242594;
        Mon, 03 Mar 2025 22:20:42 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:41 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v6 00/10] mfd: bcm590xx: Add support for BCM59054
Date: Tue, 04 Mar 2025 07:20:31 +0100
Message-Id: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCbxmcC/3XNwWrEIBDG8VdZPNcyMzrG9NT3KD2MRneFZlOSE
 lqWvHvNQlkJ9PgN/v7e1JLmkhb1crqpOa1lKdO1Dvd0UvEi13PSZahbEZAFj06HOHIPbLV4D67
 nZDF5VZ9/zimX73vq7b3uS1m+pvnnXl5xv+4Rg2DgEVlRgzaMXe49REzm9TxK+XiO06j2yEr/Q
 aqQs1hAFOEgR2j+IAMabKCpMASJTOJt57sjtA9IyA20FQ4hBxo6J575CLmB1P7IFYLjzOikB0s
 t3LbtF0YZ+MOEAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069239; l=4021;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=29e1foEzVUT393VyN7CvvZrGq5WWpisvVO6kxre8Glg=;
 b=Nuw0ZhUmMHFnovXiZpVbRlxc/06GUSzDGbD0tl1k0d3cJwti2ACiIABpaEszUQM+a1834RJRi
 wS+clW7KXlfD1FBnmJ6RYSpMecGawWxgNsi/YqCGpRcdCWb7R7RKFr9
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222044_650780_4A91269C 
X-CRM114-Status: GOOD (  18.59  )
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
Artur Weber (10):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      ARM: dts: Drop DTS for BCM59056 PMU
      mfd: bcm590xx: Drop unused "id" member of bcm590xx MFD struct
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
 drivers/mfd/bcm590xx.c                             |   75 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   28 +-
 9 files changed, 1366 insertions(+), 407 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


