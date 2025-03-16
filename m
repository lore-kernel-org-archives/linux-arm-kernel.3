Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5llhXWaOgn+P9hsoG5ZPqzI/ueY0T33WAdcLaUmMduY=; b=MZB2krb36Q5TQB
	46LQ4/pdzkqLH4o23OylEO+amaIx55OA1XYA/Jl8zdOt0E189MsIIcQgt4EZsQkduTVtf+1QubN8Q
	Ot2YnpgCkwbHpvF9ld9IOHrYx8RuqIHaXHTqMDLS1L4TT8LjMI1v8nP8xPHsPCz8O7DZ6hrQ2phUY
	eX6AkohMb9QDA+8g2r7eGr/0Vm7Zu+Y8Sqp+aYPWhj8DXJE8IGt94ErNlsPoVUzEftcwb5lXO0OSC
	+5EWcq6SDlk+fDsq4jCz+8cL9VNPN3ZspG5Sm3F/+LInklFh7lomDNJdh1kt6i9C/UxAEc3+hcnmo
	cvDITu0SF8s4AllrGoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsbd-00000000SQb-374f;
	Sun, 16 Mar 2025 18:21:01 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsZw-00000000S3m-2Ccj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:17 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac297cbe017so875873766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149154; x=1742753954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5llhXWaOgn+P9hsoG5ZPqzI/ueY0T33WAdcLaUmMduY=;
        b=RAv6nfpsz8iND9P3HlGLSvKNm8moNkwbIOKdXpuyA0HMBhvxTX7jL/5firmqFcMnOS
         mR6JPhyh13zB6Xis1+493x97xy6taonZvmBFAYQFdpCCNgxJ/bbIhxCOJzfVMbJyV6Jq
         h2DL+aaT1kE6J5JjyTZw9pSUJCrTVoQdTfgzJyz+cfQbjynrl+AL/sz+DxICeBaETWHq
         EHmNXMxry1HGx7xiz4bH/aQVpKIEIp+8NH1ZLXtzF9yGz6STri9tOOMYSiQEHjF3MqeA
         Bm8pgPCOHYBsrIlQIgn9CjnAOuxz/vayY/Snkp20ddt0r7mm5OhGieATCbMF+d3cKUlx
         ZOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149154; x=1742753954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5llhXWaOgn+P9hsoG5ZPqzI/ueY0T33WAdcLaUmMduY=;
        b=Uk7og7FG4Z5ArJ4IMIyjb9tmwNHbqchqm/T5BmJEEdksef3v9lcEqO7GuTEgKSUja6
         sc/A8LG5WLpEOR4ABkFLOqZLiDZQRCqCNBn3Qacf4awdLZbKVMmgpWLTghBIQSRAsyXk
         O0I1PeLTRgBWGIBON7zV0Yu0MnqQcaA/Uu0M3MpkaXdg60kPKQu8VJaMqmUaUeHyS/6L
         1eOV2uMOHxsVjjRK7hag2gpTjyZw8MX44dafzcJWXa2SyARYETNqMp3+0bgwMl+6WSkt
         jC9WrSXObQXk7zh/nA5CmfG1JuA+kTu3KUuOyZuksW8vQBwC2IaxRrqBkCioXzpkE1+U
         4bNA==
X-Forwarded-Encrypted: i=1; AJvYcCWoAd++QT9UcY3uM414ekRe1YnRw46D+6tDR7H8vcMPgp+3Dp3Q9EWhbJQ+D+Jyp6FDQk4DP+FiduqsXcV79fVc@lists.infradead.org
X-Gm-Message-State: AOJu0YzSXhd2Yz0eyI/i16SAmCvGglPOaAIISXH7EcQ/tihJHqYZDXq0
	cZwxxGsFioqUKss8sGJdptFv46rhH0KipperS2E79W8Us0I/qeKF
X-Gm-Gg: ASbGncsN0y4ekq43HWsowhJZUMAL14e4aBH5gjzSQ4ws+ZElJDqS2yYxB4EN4p0EaL8
	bS2GC5cJ0T5YB6Gziggizk5yHyTg+rqOwyS1cHhdX/J4tsAH4CsCNcsgYqLaivQHAg755M79+gJ
	KXTzSmLxzkYBVuOHTo57KHWTl8vjFIN3eTa0xxtMRPeQIPAlTTz8LHxF7un8C9QWyVUnLsJ7FAG
	NIpujX0lX/Wtiah6Ou2/+qifZ11GhGYoZkDlu8cBNWU084OMpPpPEIYCaYPzumWk2f+qLxX/H9w
	hkFa4HMVtivNhBKVT9SWJcCIRqhhd0rduQYEfaECGMPHjLPzb3bsrA7+lusDF580Nb5EX5o1LlE
	407ycIGv0Q0sVQFexeg==
X-Google-Smtp-Source: AGHT+IGjBEUa5TpBWQvliNMZG68SgtFyRC14IY8B3fWdscOsontLpBleg5zWcEHDjbOsrk436S97fQ==
X-Received: by 2002:a17:907:6b88:b0:abf:6a8d:76b8 with SMTP id a640c23a62f3a-ac3122d2166mr1285016666b.11.1742149153915;
        Sun, 16 Mar 2025 11:19:13 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:13 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v7 00/10] mfd: bcm590xx: Add support for BCM59054
Date: Sun, 16 Mar 2025 19:18:48 +0100
Message-Id: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgW12cC/3XQwWrDMAwG4FcpPs9DsiXH2WnvMXaQHac1LE1JR
 tgoefc5hREvsOMv/P3Cuqs5TTnN6uV0V1Na8pzHawnN00nFi1zPSeeuZGXAEHh0OsSBW2DS4j2
 4lhNh8qo8v02pz1+Pqrf3ki95/hyn70fzgtt0K7EIFvaSBTVoy9j0rYeIyb6eB8kfz3Ec1Faym
 P+gKZB7IUAU4SBHaH8hA1qsoC0wBIlsxFPjmyOkHRrkClKBXeiD6RonnvkIuYKm3sgFguOe0Uk
 LZI7Q7dACVdAVKMnb8nv2RH+Os67rD7sxzI29AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=4285;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=/2qC3ys8iqY4ZhnW9xWMTHOrRpd3z4gIdVRcOiTewoI=;
 b=ZNfRtDgIBuMyG/Lbw1yMmSFngKHMU8KfJSYgTTvTpciFnYSzh4e8+9i6kYQPBw/CWqt1bMY2L
 Bz8HP0QT+0jDMhnal4cAJNilgxZQ9QL64bhGGsuv06TA9H3785fCCYy
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111916_597264_50C86344 
X-CRM114-Status: GOOD (  18.07  )
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


