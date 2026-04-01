Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797051076361
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TTpVNm6mKhuRORfvWFehpqSJRzquDpB5/uvlMx0PZ4g=; b=q9ObAlT16m/6gh
	rSK5pZKZ+h0w73edZ6znPMQVrO+UCNlV8hdV8v/GoKBMjNi7Z78Xkx8VENIF+DiiESfmsWah21idR
	NwLSh3mmbKAA/cXvgiGZbWgdWJFcNTLtlxChwoUhPuh67OjTxPUbCZRpwNgv7LPxf65a14iJJ23WY
	8HV20jxhQlrjgqp8L+o7G7eTIr5YL870LG7S81DNY6Rxz6R4Hh8BboIkc9ks7rIk2tWkOMlAcOa4+
	+Mm+kaq5pdbleGkRuFy9gzvrhXgvMPBaknjpiH+nlKRGPQ1nFdvB3K495E456p4DTpVcIZqYOaxCz
	wBKfIwOh0j+r6h++40lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYf-0000000DxNO-3ybY;
	Wed, 01 Apr 2026 04:52:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYd-0000000DxLo-0JZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:52:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso2703485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019116; x=1775623916; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTpVNm6mKhuRORfvWFehpqSJRzquDpB5/uvlMx0PZ4g=;
        b=OMFDUOy+9V0cdbL3bQoqvy4cZBxBfou2uqLgomGHu4+GrvU2quLTwY6QgCuseI6ZAH
         Gks48vPbArtwmId2qZHCrPQxVGY1qF4BLrei6yPSCeqb4eb5LRzy49A7pj2PjYCQxKve
         hz3S6VpLdQgVAtQUNzBvKr+hPwmx1T2bt0DcaxfH2SjEllnbZPyk2xk1nZHbAX7rteSu
         Af9F4nS6j347MMiGyhLAI62Xb8Opfs/wMJdBETvs5ulIQfOm+21hU6AuAp/nY2Cya0qi
         Dr731EcxcG5ZaJdrxThLZuh2WSVYJV3SYJLcUL4uRGKcNIVcxMKS4+q63SNV/jzoJ9J0
         SO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019116; x=1775623916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTpVNm6mKhuRORfvWFehpqSJRzquDpB5/uvlMx0PZ4g=;
        b=KtxW/+wLgc5UwRuZljdNonFOOssTu4KjRb3d64YNmEwbvGn/YWQuxIvrl0747wd0fR
         AVhvLUsouNblP3IMEUIfCSYCO6WbHK274AhTzPrvnb5gRDYPHSKEu9IYvPVb/KR70F1P
         mHRQbg0/n/9rv+qv3Kb1mVQW7OW1TStQ9KtPKwF6LkN5j++UjLaqLveLgjht/L52sc3W
         39PJqAQy6qOErO40CXMRLDsRdXboRvNQR3BqlscFLvc4R+y8GdPGz4n33bozwSjsK3B5
         jwYlZheJDFWO/MnzOUslc/iS7kSH5fkaqyBpbll6E7RE85gav9trmn81/HXSaKo21Rxc
         PVTA==
X-Forwarded-Encrypted: i=1; AJvYcCXeKPExUtkVhuFcQS2F49x3m7ppMFFpZDx+VdAH8S4Io6rUH2Kfjm0DoN9UEU6Tjafcdtcw6fGlWwFK97tQSSg6@lists.infradead.org
X-Gm-Message-State: AOJu0YzdE+NF+IMvTQ1Sm0XQN+0cE4uXTM/Jv7gAR9Iad+5mtmJ8es5t
	iV1hGfWSLdaOzYu8+cLyrYcTcZ/nY46IK8CiUCS4cU1x4ffQXIo+qS3PKHMtGWyX5Nk=
X-Gm-Gg: ATEYQzxP06lCinwPcIJhRjOKItJjqz/GhcLAbR67yXY26bYPefJjCbPFwPLbLbRZg0t
	F5yyssAWq8zti0NrJmaC+Z1iWUp5xq2bIzmRDQFWMYIEAsdFvy1XUD7gSCHdh6zyUNtcIJK2TpF
	NyjZMJiqE9V3RxifQdJ5ALuKV266tFLEbMrr+FGVJKUuSd6gZ0iWACcdkfNOppjsz2J7b/LYMbm
	l8e0KNE4JLAiBo93W6c+E2liFpak/i0EJWX5MhFYboVkLUmh0SRkynvwPD/LUpMkWctHq7jsOp4
	smArU+1M4TFHzjIUlNCgMsB51ohKCiZifC8kjPUCMrnV8ZRqdRcVy3qrbunMGVJUGXdx9meMmG8
	p6NqWA2USuKqSQkaA6pM1tZCb2LMDwXBgr3TJqkmz3mE19/Gw1I5N0mkNE0RVwPLiO9GhGoVjlI
	06fCeMvVduAZwMh0s7Kn5JhUEttmTawMp9Ekn19scQYAFtdjzy5YtDBpEnlTZU/UgZUjpL8phJO
	zHJAPAApSkIQBj0b24fy2J6wB4=
X-Received: by 2002:a05:600c:300b:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-488783d24aemr64522825e9.10.1775019116310;
        Tue, 31 Mar 2026 21:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/7] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 01 Apr 2026 05:51:53 +0100
Message-Id: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmkzGkC/4WNQQ6DIBBFr2JmXRrAFrSr3qNxYXSASQwYUKIx3
 r3UC3T5XvLfPyBhJEzwqg6ImClR8AXkrYLB9d4io7EwSC4Vl1Ix3HYfUvPkbJhXF5Z5Wi1TrRG
 tVoimb6BM54iGtiv76Qo7SkuI+/WSxc/+CWbBONNi1MODq7pu5Hsi38dwD9FCd57nF3fwzEy5A
 AAA
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_215159_164560_D48E6A5B 
X-CRM114-Status: GOOD (  19.18  )
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

(b4 forces me to send this as v2, however previous version was RFC and b4
uses RFC as v1; but I don't want to break b4 tracking and b4 comparison)

Series generalises the GS101-specific cpuhotplug, cpuidle and PMU interrupt
generation block support, which is currently implemented specifically for
the google GS101 SoC, to make it reusable by other Samsung Exynos SoCs.

The PMU interrupt generation IP block introduced for google GS101 is a
standard Samsung Exynos block found in other SoCs, including Exynos850,
and it is not strictly exclusive to google Exynos-based platforms.
Access to this block is required to implement and enable cpuhotplug
on Exynos850-based boards.

As a next steps it will be possible to enable idle states on top of it.

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one, introduce new samsung,pmu-intr-gen-syscon phandle.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series was tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

I do not have access to a development google Pixel 6 or other gs101-based
devices to verify. I tried to implement it in way to not break anything
for gs101, but testing from others is highly appreciated.
Otherwise, if it can be tested on a "normal" pixel6 phone without breaking
userdata/android there, then please point me to instructions.

Will check sashiko after submitting this to see if anything can be improved.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- moved gs101 cpu {offline,online} callbacks to gs101-pmu.c, updated MAINTAINERS;
- added new file exynos850-pmu.c with cpu {offline,online} callbacks and
  exynos850 pmu data;
- new patch that adds exynos850-pmu.c to MAINTAINERS;
- moved pmu_intr_gen to right after pmu_system_controller@11860000;
- merged two patches that update google,gs101-pmu-intr-gen.yaml together,
  now rename and adding exynos850 entry goes in a single patch;
- commits 5 and 6 from RFC series are merged together and reworked,
  cpu_pmu_{offline,online} callbacks are moved into pmu_data struct, and
  callbacks now need pmu_context as an argument, exynos_pmu_context and
  CPU_INFORM defines are moved to exynos-pmu.h, gs101 callbacks
  renamed. It is really better to check commit description.
- Link to RFC (v1 from b4 point of view):
  https://lore.kernel.org/r/20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org

---
Alexey Klimov (7):
      dt-bindings: soc: move,rename google,gs101-pmu-intr-gen and add exynos850
      dt-bindings: soc: samsung: exynos-pmu: add samsung,pmu-intr-gen phandle
      dt-bindings: soc: samsung: exynos-pmu: deprecate google,pmu-intr-gen-syscon
      soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |  24 ++++
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 MAINTAINERS                                        |   4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 127 +++++----------------
 drivers/soc/samsung/exynos-pmu.h                   |  32 ++++++
 drivers/soc/samsung/exynos850-pmu.c                |  78 +++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  57 +++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 245 insertions(+), 108 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


