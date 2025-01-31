Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429ECC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SDioANdvXwNuTfGfbnchsEWp0ZwSPM1Eio8Fai3fOQc=; b=LW7ieJtUSPgpgj
	sL6FqxC3NAFKiH7B8sPLWmugD8zPcNFviOC1wp5cXT+QDOAKcncMTMjEm9I68crtCNq7Ar04sWew6
	8dYLPML5eW9cYLnH/rnMowPXWJfdJNNVRl+RfpaXASH8K77R79waQ7NT+PhoCeVgA/LAyTVjoM13o
	1P7XzdGJD8i8C5qRsFshuYJV/BdAO/wneVcuTComBjHvvUL8Hyqrj0HBfrCAZYAkgj54MwIEHs/uz
	Skfm6hCNQUOIbtG6hWngG7+5Exml/z5qNBEci+2nmqntNT+KwY5NlrKo4jT/tIAD868cBv/k6Nl++
	A2FhUjF0xPlAZgBKt6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvXx-0000000BBYA-32q7;
	Fri, 31 Jan 2025 18:15:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvWe-0000000BBFH-1by1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:13:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dc7eaaed68so3139729a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 10:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347234; x=1738952034; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDioANdvXwNuTfGfbnchsEWp0ZwSPM1Eio8Fai3fOQc=;
        b=JExxN8YXnUcdarhIv/3+srbn/FH2U5inCLgo8PcvH/mbo5KwCtSb5QOKHztCPPdzxQ
         pncBj+OFG1Jk0fyctT+kIWgLTE15GFj5bSbE692nXAoUvuohk363L+wApuWJsdd1K1gz
         /J1OPSsSCzykpjK2vH5bq3dO8pfVQh6OuuYAKQB4HQ74AOwlnWZc1OJAY29awvtaGu6m
         lVXZDM4JHQ02BoylFHojBUMxZE79CK3O4TRt9fAk3q+JBxD2aZOqWD4tQfGFHm3G43q+
         McQgsvJswE42RaO6zCpJQHa6+gcfE2MWYp5bUr5f9flJs8HG4/6cVmosz89TRpcfsZJG
         dIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347234; x=1738952034;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDioANdvXwNuTfGfbnchsEWp0ZwSPM1Eio8Fai3fOQc=;
        b=aPJ8NukxYGeScU/wOIUsQ9nRMH00CiZ9fU5nFyKAQXq8Y2OqKc0YE7jaF3Mg9ADrIB
         0BoxpULoDftWLz42KJW2IS4VI22WZnCdiVAvih8p0GPMFumvlQDjCUVU0fydMYcn9+Lg
         ufNiG/rxcyZZRrr2sQigR7qGbbrwX7bvDm6m0BQjyXSpveYbcryaLHouIQvskoKjN1dj
         rwh4IDyUvzDVZnAurKqrl8k7fKgw+AhuZpTpdJIPI7Cx7FYzPDleBg2fGfnuvgnWxRu+
         +ky1M+64oHwj4g73UhL2hkJv3ps+vNoQ1pqjmdoKEXTfPecfYD1rhayhXFzDgsinzIP4
         ZbFw==
X-Forwarded-Encrypted: i=1; AJvYcCU6xH8nK2Mb6ElmFUwdtcE8mpuENNNYRKclAPXBahhbvkuzOd0hVKS4ijaTOWqDkP4lQOtXWzl5KvgYp8U/xZPj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy71xC6ex2ngqUuJ8Nrvw5oopf38VjJ5IRt8ubKiB8GKiu4+Rle
	BIQ6i6rzikJeTqgPnbtWmnFBH6zMq3Vd/4R/DUHU0Ohy8MiwOXiH
X-Gm-Gg: ASbGnct6fpzh61OaJcu0W/16NtuOyIMHYzhjOaKk4SgHGtGG/QfCamDLOKgaMqAjxBs
	cToKWDXWVLqlJOaPti/LRqN58XSrYyRgUjwdUZwsdvLD2XZfceM9kceabxErtEIsi9jlBq5N2Kp
	EdFHg030BbgtsnJkQT0Aicr6kVCHen6z8gEUlAgFPRGdncZZwmmG+tcGRtH1X35/UZig1rNIIY8
	XQfblTVkm+TKRTBZVC4j9u6IgOxVlQBF3DtqrTUwMfTYIeEejGPWbRl/xfaxzmnKkZ9myD+M3bt
	c+YNzG0pC0PvZmFzF84w44Xl42aln5YnVJ3rEk2VAJby28tVBYFQiHqYes9z1A==
X-Google-Smtp-Source: AGHT+IEQmEocMbJNJ0PdRJ15kLtw8dvQ5rNV2cOSKYrkS79S6czxp1b7N9XtcxDPTx1C2ptq7qG3jQ==
X-Received: by 2002:a05:6402:34c5:b0:5dc:89e0:8eb3 with SMTP id 4fb4d7f45d1cf-5dc89e0919emr1967310a12.11.1738347233986;
        Fri, 31 Jan 2025 10:13:53 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:53 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 0/7] mfd: bcm590xx: Add support for BCM59054
Date: Fri, 31 Jan 2025 19:13:48 +0100
Message-Id: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANwSnWcC/3WMyw6CMBBFf8V0bc1MH1hc+R/GxVAHaCJgWtNoC
 P9uYaMbl+fmnjOLxDFwEqfdLCLnkMI0FtD7nfA9jR3LcCssFCgDDivZ+MHWYI0k56CqLRtkJ8r
 9EbkNry11uRbuQ3pO8b2VM67rGtEIGr6RjBKktnhsawceWZ+7gcL94KdBrJGs/omqiLYlA4hEt
 qFfcVmWDxRrf+/ZAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=2641;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=TZW2cM+0eXm4cJxjHahhQNsg/hpuj/YgRHBS74BfIpY=;
 b=A6Dbj+uAl53ukznQEtczQco43P/7cmTdK83+oAxA2Dl66TarI//ANev9LtzSEhPVkwzuUftBQ
 hbAr3C4jA0aC/iS2wisQkDi2uLI5YpW4xWNoqzWZk/suZhxiSlZCHP+
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_101356_429979_0F3B6E91 
X-CRM114-Status: GOOD (  15.52  )
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
Artur Weber (7):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      ARM: dts: Drop DTS for BCM59056 PMIC
      mfd: bcm590xx: Add compatible for BCM59054
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   55 ++
 .../bindings/regulator/brcm,bcm59056.yaml          |   58 ++
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
 drivers/mfd/bcm590xx.c                             |    6 +-
 drivers/regulator/bcm590xx-regulator.c             | 1029 +++++++++++++++-----
 include/linux/mfd/bcm590xx.h                       |    7 +
 9 files changed, 1028 insertions(+), 401 deletions(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


