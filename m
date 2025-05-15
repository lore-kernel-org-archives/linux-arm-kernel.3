Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F13EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VEBQIjrgTegErrmLSXKXMsIKpZnPOc6CSNuuKkQttLw=; b=S6BspQWz/Jh7bM
	g/xkx4hwoR8QAYNK8W3lGYZOkf83swdyL7UhPXyvcXz7EKL23ym460jDggk4UlhtfQXINXMylirah
	QuWPQ3iGg5Js91SzDksImaO2gRqzutxg96PS5XwEvfYWSHJPJH7KBXO+1+ucd3FWobW2eiuJxXeK+
	yU/dDCaG21+5PVHzUZP/u0N+HXiolyR7YQGOcSFxeGhWxYITjb0eolASs8jEUhwO0NboKfyOvjdEk
	DYqm61z2gixSmutLAC0ZcqakuiTiXq5hPUSJkk+ZE1vXUyImw6C8W503HLeYA94hSxBjAAgiYjqi/
	lCwndXPXgVbOQ7m8eVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZQ1-00000000rJs-0xb8;
	Thu, 15 May 2025 14:18:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZNz-00000000qv2-33Jb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:16:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad24b7e0331so169964666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318594; x=1747923394; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEBQIjrgTegErrmLSXKXMsIKpZnPOc6CSNuuKkQttLw=;
        b=cvRmvLObW23hemYaH+TGvvgt2uMCNda6y09XzfN2Z4sMHdd50UKyrJksO7rM2u2bIR
         wmaXjFfVSsI9cl/VzmliaAXBLPx/lWglw1+o/60pYOntY8frUj8T79Q82xVPk0afNtY/
         TalDuVJtxc6Fcyf9f/MUH6idXv/N5Vz69rJxWfWxZ2MXr/BLrLAccD7I0FngrcKE4tyU
         tKeTaJ8uPpZQJHkbNOfkzNoUf2hD8E56vNQMj0IQtXhRMViY4CuWxS+K/6F4BfxjUj7b
         5JRABQBqi9mqwPXyVrAcmQ9g8tb8C5O7DsVi8YhjBDPrD7Be7rndClxnD3U/im/r3OI3
         vphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318594; x=1747923394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEBQIjrgTegErrmLSXKXMsIKpZnPOc6CSNuuKkQttLw=;
        b=HpdN24ftdraw2vE8Rm9Ea8NjF7zh7/dJ7gTD0uZKzGGObgO1p5ou9zskDpGTWvCQf2
         He9k0AZMYxck/v7hMpknMV3pEBSt6N27/7TIxZO6IQbDXmeD3qAjTHBLKJqmXxAJLJEP
         4WmkZX3KGmp7+SFgObqPfM/HGlYlcPNlsuyMRAgtlnw96Aq4CmsiSAo+rWNW1OUKa+IS
         ltZDTWof8kjCuiGQux/Znqzm6WJiKekMi9F7i1xpZgBSNuqKcL0pdufKsrf9QqEBgHx4
         woPry8d3Ai+6q/WMaTI2uxv9bfn1GfWYGXkjTNvD70pt84bGtMF6xiD0z5KSXTOPJmLO
         9d1w==
X-Forwarded-Encrypted: i=1; AJvYcCXAKcpGLKifDjgXTWuQ3w7J9T38h5lxfP/EqS+AdL8KM4uIdy74vtMqB3EajR05CtaTfcM/QJJg/EcTCaPkb0SJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzBcceVw0bubEuLLK5KMVSPBqPMtB3c82SJG5zORT57qvwldTA/
	xfbCgUm8BITb+SiMsIG1ALJZi3zq4gdjElpUnQ2/9YMJJGti4eDj
X-Gm-Gg: ASbGncth8N6QU+KsPstlQqQGCoIDx34FyDc5mVW92fogvuvbb1k/Qb7f0KWhNmiGYsZ
	zocK2QCMdfAlAF72jZw3TQ1UCNjXWenJN5TOReyiWAyBC567XkfpoQ8FPtxdYXM1hoV8pKhv01V
	lVWm0qMOrtu+5fhVG6RLotfvWMzDM/0dsrlzlpp7YmWsRT+pqQIYdZm/Tcc7f//+XpTgW2yZzy1
	MGKqjVTAU3MPe3bxymTEVU/RkF53TJyJDdnkGMT/WbVeOgDYJVKBGDm9lgc2eLPposecL2q0NuU
	U/YgwTkH5h/9nR9uMhGOyUCEoacPDpgEiSt9IQrHR+lJS7YtBPSjLzgnyuXu6WW2+9j9lsG+9Ot
	9+d4LLb79PHqIfsinslVX6A==
X-Google-Smtp-Source: AGHT+IFNwAr/GS2TMFy+3AZVdmMiBlmMSKDqEwzoB7f5jvM8WXyqmQSQKseFNvcA055ZJ2Myun2L4A==
X-Received: by 2002:a17:907:d310:b0:ad2:4f81:65b4 with SMTP id a640c23a62f3a-ad4f7523191mr578780266b.60.1747318593587;
        Thu, 15 May 2025 07:16:33 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:33 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v9 0/8] mfd: bcm590xx: Add support for BCM59054
Date: Thu, 15 May 2025 16:16:27 +0200
Message-Id: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADv3JWgC/3XRwWrEIBAG4FdZPDdlRmeM6anvUXoYje4KzaYkJ
 bQsefeahRKb0uMvfr84c1NznHKc1dPppqa45DmP1xK6h5MKF7meY5P7kpUGTeDQNj4M3AFTI86
 B7TgSRqfK9fcppvx5r3p5LfmS549x+ro3L7idbiUGwcBesmADjWFsU+cgYDTP50Hy22MYB7WVL
 Po/qAvkJASIIuzlCM0PZECDFTQFei+BtThqXXuEtEONXEEqsPfJ67614piPkCuo6xe5QLCcGK1
 0QPoI7Q4NUAVtgRKdKb9nR/RnOG6H9Gs4rsBIIVlTVtYJ1XBd128xwGK49gEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=4703;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8oygh7jMpux+UzJGWRuCX3mVT7I8LIQFy2zqdzPix2o=;
 b=As/jQKILnZvkmHW/FwfAn74S3e8To0t55+vN8zCZBbCmAQShIHCQqh12XSAK+DrrhYn6314ay
 909IK9jXZenCVUBNsx9cFw5pfgqvbB/YT2x9mkh13pIW+VX7NPWj1dm
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_071635_775730_DAD18D29 
X-CRM114-Status: GOOD (  18.17  )
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
Changes in v9:
- Rebase on mfd/for-mfd-next again
- Drop "ARM: dts: Drop DTS for BCM59056 PMU" as it has been applied
- Address another style nitpick on "mfd: bcm590xx: Add PMU ID/revision parsing function"
- Pick up Reviewed-by tag from Stanislav
- Link to v8: https://lore.kernel.org/r/20250430-bcm59054-v8-0-e4cf638169a4@gmail.com

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
Artur Weber (8):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
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
 drivers/mfd/bcm590xx.c                             |   66 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   27 +
 7 files changed, 1325 insertions(+), 279 deletions(-)
---
base-commit: 6103b87af895954882de162cc652d02a6f65c074
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


