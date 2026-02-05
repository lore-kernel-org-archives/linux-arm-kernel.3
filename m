Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561FBECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qXPRumbBfZZxqaCk0CZTR3vdblmJxj3Gzg1b+SHujwo=; b=37Vu+hROxKn0Bt
	Qd7a0puK6y1FB35aqzy15sx44NK+0BDBbGiL/vQRTRDPMwHCTl+uhHQa9d7NQYIC27vrkVbfYPil5
	dPacDqT08tLk5YPwBufeOF75kALCq5ue8L1xn8itKg/i7CU5IoTRA41QKijjA4mQtScyjtAa/MuLH
	FMUeGfTNNrO93mtk8RfyT1jfheSzqZEST0vdGtARmm1BvFy525aLa6/oGzgqKMdvFTd63UrTenY7G
	IoFSmBDzTdmoL9WczaL+qttkpaHHVNcTX7Lmnx1AQehsqX2Rnhn/bpa8bP+5Wri8RJmhF9kSbP4RB
	wxpPnYjnCwnGULZK2yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77W-0000000AWrz-01hv;
	Thu, 05 Feb 2026 21:42:38 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77T-0000000AWq7-0JSy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:36 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so284775766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327752; x=1770932552; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXPRumbBfZZxqaCk0CZTR3vdblmJxj3Gzg1b+SHujwo=;
        b=Ot7tK8Co+Fq9NNkt5eU6XZs+pbxngYDc/XFyIy+NUcKMuG9WIPw54NnVvGKn5T7szv
         eL3EEsLLuaWKkOAvdCJngEwF7ylKpZFODNLDFMJVrbfu3La3CCgdv+mlhN8mvEmJTpK+
         1m2mtCmcdZa3R99oa1fem8xPEaMKXAAMjzg0ZiWW29K06l6BeSzLe7AKUU7kh3RnBNuH
         TN7HypyOnFxF3e2f9cEqSlUGjpmkGUVK6klT7eGxvElazIXQd5HH/3TFlKF+3ejxkzre
         WD++gV3PqQy2w/ipmbr3M8BgbBVh37lSPOR8l8QDtuFXEMsp8knwr80AUaE9r+gKYmGe
         BAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327752; x=1770932552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXPRumbBfZZxqaCk0CZTR3vdblmJxj3Gzg1b+SHujwo=;
        b=bLXJL6A8H+8y0EovxYOd3fqtjq0xkGOi9z5bEb2jCCLp2c3zugyNWcQPRgichYiEXV
         6RpxnhiuH16waBnohlc4RgfJyj0q9RVMtK5eoOk96N90MOf5H9GqvvPmRsm9kTHGvUf0
         prY3h0x7K2+W/Jw08/TsP/MaZazCvSomrtIUIA4ZafBLTZJQCLSQfyxLL1YnMrFisvQJ
         46hQHTLcfMOtHhv+oytVgbnQdYGQmVGTO9Q8ttQRsiJSThtb0A+QCPsmjos/S/BWbegk
         E7FJq48QNJDX5dgG84rND9S2+R89veAaxBIX65W9hudUpp9o2jf8uf5e0TQ7LieaxL8t
         XpAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKgQbAlAdSjQZckVxCuWLtMUM54fgbY6teijyazu2094119ssG1qUaiiBX23131QxxIJZHk4BGnxrYebgEUcbd@lists.infradead.org
X-Gm-Message-State: AOJu0YyryoFKpXwaWGhPI7oYnduWcOEZO8sXDQpOe7HU8mRyXCObEpQE
	cjqta5AWEW94esbsuKnK/3zESa53zI26Pelszhtzgm2Es4+duxkhSEYUuaoebFXZlPQ=
X-Gm-Gg: AZuq6aIKj+XLMKTsfVuGVZT4QbOyc01CT+8gK1oWPl9hAo0mfLspin+rY7EMRCjg7eq
	N2mKO9lCeWvMOsN75lClPLVzdsJB6hIPb7t5qupLX8n5+SdhfQPPXS8FcIAggOgjzAUbioiepfr
	nCmUF+2sWp5ByMMB2c+Y1PohquxZaLtWi5vYkvNL9KnYmJ9R1/ZmMVessFZpuXPnEKuPA4tpSfb
	KsCCKpGw05H0vRx2rGklsn+wqAlIBRssKC9iQDDIq9shfrlbUzXhbxJCECr0bZwAkOwYZBRLqhS
	AoN7GQciZwduzF53/eU8metNzflnM0/WnAIEztrUl850U0wwKUQSu6rf0EGGJVbWVjTQTZu4nLm
	lijwnD8QQ5o9hei3TnnkDBGOO123s8Ur0VF3rwah1y8axiFh9XA4oYIOqgZHy7eRUhZpd3b+Mj7
	rlAc6cTTBZcbauqFh4WUadpCtqe/M1d/rjWhoWxPRkacypEFL2vASU53HUzoOEwibDpS8Ot0fUS
	FeGDQ==
X-Received: by 2002:a17:907:a4c:b0:b88:637d:aa75 with SMTP id a640c23a62f3a-b8edf378326mr26959066b.30.1770327752121;
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 00/10] pmdomain: samsung: add support for Google GS101
Date: Thu, 05 Feb 2026 21:42:28 +0000
Message-Id: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMUOhWkC/2XN3QqDIByH4VsZHs/x9yPNHe0+xg78qoRRoSM2o
 nufBTFHJ8JPfF5nlHwMPqHraUbRTyGFoc+jOp+Q7XTfehxc3ogCrQgAwW0i+RwddtxZJZ0EXXO
 Un4/RN+G9pe6PvLuQXkP8bOWJrLd7RPwiE8GAG7AGLBCvpbk9Q6/jcBlii9bKREupCkmzZA3Xw
 hmqG6YOkhWSlH+yLKVhIJVkSnh5kHyXAgitC8mztMZL4yrNQcCfXJblCyIOtptPAQAA
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134235_154750_76C820CD 
X-CRM114-Status: GOOD (  17.89  )
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
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 ++++++++++++++++++---
 6 files changed, 399 insertions(+), 49 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


