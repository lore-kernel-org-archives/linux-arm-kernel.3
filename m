Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58122CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YXUQyFk3/gkaOHXxMJL4LSnKxu/TPQvEZNmcErPubxM=; b=nFZqLHFlmKhGuK
	bLQBWx8Irg8mw0SU6ot3z1OrMhTKXh1K1pb8fa+vC/YoG5lmhX56yRYVxgZogOQgLwXjCw7JGRX6U
	dEqGOQWxa2cxHfkmjfYqdZz7ud3OOg2ekbc1wzZYhDJt3LAUxOg8YJ18CEQu9luA+V3zXeI5OnBM5
	Oy+yJ9pc29tHInmlZarDn6BOpxVv9coHI1MxWuPhLwm7gUTAivPjEiGzkfCt1fv9cDSDHZlsKF+vA
	TeHZvbb+xMyAPDWrCaGqOnSIUjn5GU19y1Xz1moWbSz3Mi3aGLnKiYX9iRnIUxFc6O1BFPm+jGm28
	BbJqBIx5TuKbX+etYzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOv1-000000077iI-2lSZ;
	Fri, 08 May 2026 17:23:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOuz-000000077h8-0lgS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:23:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-365d8e43759so1350740a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778260995; x=1778865795; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXUQyFk3/gkaOHXxMJL4LSnKxu/TPQvEZNmcErPubxM=;
        b=QbFCYHx1x5tDXBm2F+TL3tK6LmkqHjBXxGLln25+6q0gJ/jX7ffuBheSha8+Kz9m3m
         TAEHssOD4u2bRAGCmJywp9Z+JIcXkTrQlKTcCyL8CUZgD94+fP5OJ1Em9yH8b5kl26By
         R2HZXqfhXSRhWcsai0owaZc/uTvyUlg9S6/knzZRRx/pY7hdcSaTRrMPZrH0dI2R3XnR
         KWxmFWL81bWlFLG/vbb/gREeN9+zG5XsP5moIOC2v4j9e2BnEWCNfEgC8fxlcqsKgZlI
         fJITnarwFg+j0HVVDtMdwkPSJwhZyKEPE4BEmp8jS6iX2EKH6f8gCicuUxchdHRyPqMq
         p61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260995; x=1778865795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXUQyFk3/gkaOHXxMJL4LSnKxu/TPQvEZNmcErPubxM=;
        b=iNMbkD7bbVySXfp4gt59G6/bcMImTF0BDxyWA6IkyY0yO7JkjI7O3r1nQG698FCVEF
         xUNsn8JUC6qbd7l2xuBKnnDVduilODCTadzyIX59FTK7Kd/SgbL7NAXvDsf9PAY0dguW
         nvyCYyPDNZaTsRjjqtx20uvl+W0YQB5z2HYFBOQExnu35d8h5vC7MsuYnLsymVJHwtSc
         SNcg/tgTFWBYWk9TpBuYzaVCrTpxmkXL8zj0vvGLOa8wnLu+8xQyn3z2+2tUAoeUJ33o
         wDmiKpKJEvbZ9wuMEsH7FdfyHDGpyMsT6zuciPYmlOgFq5+ezRgRnYuUXIL7vwgF/TLs
         Zqjw==
X-Forwarded-Encrypted: i=1; AFNElJ8paZCJqfgqpPa3f/sEyg9WCUmj9Mu6ZtTVv2BKvlOJWFoMCv1gQrT6foI34JLWtwNQKE0/qm9oa5lrJtd0S7De@lists.infradead.org
X-Gm-Message-State: AOJu0YxOKevojzjzg53LdXjrAGxVJaOCQHYgP179vRQLMHFKR+mNk6cu
	Rolg7q9LmzMnKp110GPQ4xTggrhJHXHy9rSGS73e8Sxgzm+XIihLPSOb
X-Gm-Gg: Acq92OH/+IDp7kjlGOTRyvSGSJEtFsYn29FaoDg4BpQvtT1IIGCpBexVDSHYGSsJGG0
	LttmR/jpARCOLwu4nl/3SeXxF6D+snBFKInpuuLtCYD3cK2xmUGqWnV29JY0K1Q3mncem9tXBKA
	xqUY9iqP78Wo3FjiiCFJ4taBhBYIqa3WudFtX4VBVPS51+liaqR/NAHDEo35nXAyY5/XWXSdDk8
	yQ7h6UpkIGX/0/ZIQSP0c+O4JMaa/HXKMqfoFKdO33ert/u6A/i55HUUi1tE+SD7zEnnSsCTCx1
	x5WVn9abNJt0b5MNKvPpOK85fTlk+s4SG8CveXtBi1yEs02Tg88tWUDm8/7qRdQt+aGBYbHsFfk
	s26otabOZgh/SW3z+nsrbGz46K8xK4UaUHVJy8FyLGbnA7ystOMDKe4M8MRIbZN2j3SFWAB9n0E
	k5/h52cqwLTX4z1dAr1mPFt8usE1PMt3EDNRiySUJilTczLr5+PuXPsnE=
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr51407625ad.17.1778260995443;
        Fri, 08 May 2026 10:23:15 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2baf1e35487sm24907985ad.46.2026.05.08.10.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:23:14 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v3 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Fri, 08 May 2026 17:23:05 +0000
Message-Id: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkb/mkC/02Myw6CMBBFf4XM2jFth6K48j+Mi6YM0MSCaUmjI
 fy7BeNjeW7uOTNEDo4jnIoZAicX3ThkoF0BtjdDx+iazKCEqgSpA8YJvbdoa1GZptZteyTI53v
 g1j220OWauXdxGsNz6ya5ru9EKepPIkmUWFpdkpKWNOlz54277e3oYU0k9dO0oK+mUKCUhrNWN
 cryv7YsywtaZuRZ0wAAAA==
X-Change-ID: 20260327-st-mmc-c906ad95ff83
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_102317_233497_9D2BF8BB 
X-CRM114-Status: GOOD (  11.89  )
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

This patch series converts the legacy text-based Device Tree binding for
STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.

Note:
The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
depends on the patch "arm: dts: st: align node patterns with established
convention". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v3:
- st,sdhci: Edit description of reg property. Modify reg-names. Add
  "minItems" for clocks and clock-names properties.
- Modify the commit message to match with the updated changes.
- Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com

Changes in v2:
- Fix node name in DTS for the MMC to match with the estableshed convention.
- st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
  "clock-names" properties, include an allOf with $ref to mmc-controller.
- Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com

---
Charan Pedumuru (2):
      arm: dts: st: align node patterns with established convention
      dt-bindings: mmc: st,sdhci: convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  91 +++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 3 files changed, 93 insertions(+), 112 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>


