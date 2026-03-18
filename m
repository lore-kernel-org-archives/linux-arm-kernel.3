Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB54103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1/n8hfafo3jEdh+I7U3FlFU+S14ha9GjdZSLZ73puJg=; b=eFR4KZmqjZ+I2T
	xrS/v2j+SGXgDrF93D2C8PiErXs/QTZkYu6DLTWPRnclCnTmqRs2qimkbq9mQjzYJ0ygKsvNp+m/H
	0BODaX8fXkvlC0viGI9u6s5JqgN9gTcJZ2czxDfJ34kITzirbQiW/tRQ/LLoe3bCHJCPGXCbpilad
	2HjtQjHDQcX0SFTaW4GanZdeS9HYQiTqco3ej4Yyz90M/JRCprtsV148PeBn1iQq6yoSozidyNcEF
	tz+kYcpf9EIjoAVs+U0M/uYKepOjBnIoH2l5gb0XW/FYIZutW9MvGxfmVsSplH3uZKtF+BZWbtHD2
	LCVbcW5Mtfc5+EsGL0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soV-00000008hZ4-19Tn;
	Wed, 18 Mar 2026 15:28:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soT-00000008hX7-0a7i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b976536806cso141626966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847679; x=1774452479; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1/n8hfafo3jEdh+I7U3FlFU+S14ha9GjdZSLZ73puJg=;
        b=nvCNfK1+kA+SwpZJt+Wp5SPr43Ec+edveoZv4SxbZ/mF2vRHa9VLNksMEaboI4lT6Z
         b7TtttoC8IqqqxZAiB6kaONgFiotgVsObpnZfZJ6CSt2CL6aPs6ba6wj0QUIW2iGyr1/
         Eo0Xw/KT/PXi+tQUam/WmIT2Gl3HLzSOxslOOsAithAq4Ap7PpKxNmsU7J3g4MuBYnR4
         gYtWBIeSjt6U7VUeTTiqWSAisbebx5wnDrztxOHDtgKyL28pdGe/gWX0vCYz/LzmdIak
         G2vY+4EPJ3LEeroDvoApX3n245XW5wawlgSUQY31fW+waUDBZT4Jz9jleBVxSo6CP8WB
         JTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847679; x=1774452479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/n8hfafo3jEdh+I7U3FlFU+S14ha9GjdZSLZ73puJg=;
        b=pbzKyjt8CiCfy/dWaTzUt5nln8HKjgy8tqwc9bBkbQFL65qm5efId2xwVLXAR+LJY1
         S0IfChlEKBJ4NzGpsIgswcjjPELwD2BIPLZJgklPn/xgjO+oVcFKysoIcf700+m97Z33
         FhZTGd26zdSdttfJVasAXRqAWbyAdfDORLcvuyROocVPoOzpYrAvcFmlnB0qN7nO4sJg
         72IGCR7RxGsi596wdpDDfBxohQq5E21cyk70kLuwxYsYOnqvwQJ4rq0KIv8tshRnUhQs
         ujN6k74S/VgkGx90oEiloUFN8WtlizW/2DSCI5TMZW08nIdfWo7iAJs2U8pRq2xkWKqB
         8GHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTtoO3OZmOHpgQa3QVAyUv+ImS/8XX3gO+fQYVTsESeDYMO/wppgptPIurI2u0GHBwWM/iwpoF4tAQ5ZPrTf1J@lists.infradead.org
X-Gm-Message-State: AOJu0YypVCVE2TWvtO9uq9F9D+mByD44c4uPB03YNoGfWMLH42bOoMH8
	qaqDj2Ph/x7yretvZPPo4+OfHBBm3Wlbf/ooUQBFBy1pewX/AwKpUg9MfwLv+HKg0m0=
X-Gm-Gg: ATEYQzzqvBs2c9/rsE0H8+3Ixl3WqhtoLT6H9K5ji1aYb+vQZ/MNrQrVkQ8yx/UChH2
	ycowrpbwp11AkfNhdmeXMqYA6OUfCJFWv5awpuREBVcg9WmGR0bf5MqfbgWeNYesDouk9B68nxA
	N3VUP8PQYYzyZQZz76pOd4rv6yR5Nig0BUxPaO6qhYNsTnaxfk66SoFlOFEdGiq4b1OJc9PAFAL
	dBhLF9k4nvjTZFdYunWuOd+iFUaySSn24zzzhkGJTuEY1l2l++xBqW4K5prfDH0vvxVI0Yuqvyt
	uzd8BLRiQojTLN7MDtjaTMj2pvEmydcmXoUgltY6XTHzFQQNmc5HZgOY5fq31bQ1zccOrNP4luz
	q6LaWE0vAfsFDwuJSDjCQhbhk2JwOjKHSv2gJ3bJf69+vjCo49dQgl483J+kHJIxsCKYfDch6rK
	C9UKulPkIBYJnkOvEtGhjLasd/o/JtPs0AO/DObK9YFL1EfqTHCDXna1PgSV4DV4iL/lctsZ3uR
	UHMQMVlDZdkOFU=
X-Received: by 2002:a17:907:f218:b0:b96:ef71:49f1 with SMTP id a640c23a62f3a-b97f48ed986mr213030066b.15.1773847678617;
        Wed, 18 Mar 2026 08:27:58 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:27:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v8 00/10] pmdomain: samsung: add support for Google GS101
Date: Wed, 18 Mar 2026 15:27:45 +0000
Message-Id: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHHEumkC/2XPy2rDMBAF0F8JWtdl9Bwrq/5H6UJPR1DsIBfTE
 vzvnQSCFbQRXDHnDnNja6olrex8urGatrKWZaYwvp1YuLh5SkOJlJkAoTkAH6aV03uNQ1QxWIw
 IblSMxq815fL7qPr8onwp689S/x7NG7//PkvMUbLxAYYMwUMAnhz6j+8yu7q8L3Vi95ZNtNI2U
 pCUWTkTvXBZ2k7KRvJ2pySJXgJalNYk7KR6SgNcjI1UJINP6KN2Cgx0Uh9SgG6kJpliUjZEr9G
 ZTppDyhdpSI7BWy0DdyhkJ7GV7Z1IEmTGgNZo7/SL3Pf9Hz3ALtX9AQAA
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082801_205097_71917C56 
X-CRM114-Status: GOOD (  19.24  )
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

Hi,

This series adds support for the power domains on Google GS101.

There are a few differences compared to SoCs already supported by this
driver:
* register access does not work via plain ioremap() / readl() /
  writel().
  Instead, the regmap created by the PMU driver must be used (which
  uses Arm SMCC calls under the hood).
* DTZPC: a call needs to be made before and after power domain off/on,
  to inform the EL3 firmware of the request.
* power domains can and are fed by a regulator rail and therefore
  regulator control needed be implemented.

Bullet points 2 and 3 are new since version 4 of this series, and
related changes are in patches 1, 2, 9, and 10. I can merge patch 9
(SMC call) into the gs101 patch (patch 7) if preferred, but for now I
kept them independent to make it easier to see changes compared to
previous versions of this series, and because patch 9 actually applies
to not only gs101, but to many newer Exynos SoCs, and to make patches 9
and 10 themselves easier to review and reason about.

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v8:
- correct use of ranges (patches 4 && 7) (Rob)
- add missing \n in some of the new log messages (patches 5 && 10)
- Link to v7: https://lore.kernel.org/r/20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org

Changes in v7:
- really be consistent with quoting (Krzysztof, patch 4)
- drop invalid tested-by tag (Krzysztof, patch 3 & 4)
- Link to v6: https://lore.kernel.org/r/20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org

Changes in v6:
- collect tags
- patch 4: update commit message footer to clarify that while
  old/existing DT are now incomplete, they'll be updated once binding
  is accepted.
- Link to v5: https://lore.kernel.org/r/20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org

Changes in v5:
- add domain-supply to binding (patch 2)
- Link to v4: https://lore.kernel.org/r/20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org

Changes in v4:
- drop unneeded or already merged patches
- drop patch "pmdomain: samsung: convert to regmap_read_poll_timeout()"
  as Marek reported issues on some platforms
- rebase
- DTZPC related changes
- Link to v3: https://lore.kernel.org/r/20251016-gs101-pd-v3-0-7b30797396e7@linaro.org

Changes in v3:
- use additionalProperties, not unevaluatedProperties in patch 2
- fix path in $id in patch 2 (Rob)
- drop comment around 'select' in patch 2 (Rob)
- collect tags
- Link to v2: https://lore.kernel.org/r/20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org

Changes in v2:
- Krzysztof:
  - move google,gs101-pmu binding into separate file
  - mark devm_kstrdup_const() patch as fix
  - use bool for need_early_sync_state
  - merge patches 8 and 10 from v1 series into one patch
- collect tags
- Link to v1: https://lore.kernel.org/r/20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org

---
André Draszik (10):
      dt-bindings: soc: google: add google,gs101-dtzpc
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
      dt-bindings: soc: google: gs101-pmu: allow power domains as children
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: don't hard-code offset for registers to 0 and 4
      pmdomain: samsung: add support for google,gs101-pd
      pmdomain: samsung: use dev_err() instead of pr_err()
      pmdomain: samsung: implement SMC to save / restore TZ config
      pmdomain: samsung: implement domain-supply regulator

 .../devicetree/bindings/power/pd-samsung.yaml      |  33 ++-
 .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
 .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
 MAINTAINERS                                        |   2 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 262 +++++++++++++++++++--
 6 files changed, 407 insertions(+), 49 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


