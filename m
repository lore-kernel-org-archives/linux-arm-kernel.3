Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB815D3F08E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNtEsD/7Ir/dUUyhxp9vhIGp+bMH6wePQ4vuvyFT4dU=; b=hSS52hKg+sCaOi
	rCijv6BicfshjPsnR8eH3IFe5e71yP0wlxHBbauoNuar56WNeeNFjJfUqaI7IJJsBaD12R0myX1nZ
	xYBjXU1Pz1luwvIvwKQshMXFneQ2Qj7hFDsKcASz77p1+v+AakyKrKkmhSpisYa1VJfj19GBfqZ+u
	eRCeGp0cq9uaIjvfJWW2kmNwhBslZZjDQZiDdT9DoXtykclxba3bBct+DDkD2TN3fW8GjcRKhlROb
	GWKHYlzG8s4qClMIBaiQTRulM31YwwVPIRlX7cOVPV58ezignS/Q04M4AYv8DmyhRn178+JXUfCs2
	UjYGDWfykDlxJP0sfodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88A-0000000GLs5-2F8X;
	Wed, 28 Jan 2026 16:10:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl887-0000000GLqV-1hCa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:10:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8710c9cddbso850174266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616653; x=1770221453; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNtEsD/7Ir/dUUyhxp9vhIGp+bMH6wePQ4vuvyFT4dU=;
        b=Ygjbp04jTzBRbVhGTcMM4vFkmZfVdlqFfEeMItwJPo6JqXjmJBWTCKUEJPDhadUKVx
         wPVw9xOpKGvogLKOKK/FhaOe5NMxXI8Q8zIQWPzXuBpQ7BUuPD7yE9PZQo7bg5ZWwI2x
         DaXI2e906uCngZX805mZO7Cmt3/UdKLgEFUH2YgMZD93MgS+2R1+1ySWxvxa0d0+66yl
         vnHSRJoVqcwOIwHpORt0TdKReDVVnGhAuMOdsrRYrKe8z3ULJNf3gk5gC4PF2IS8FLd2
         Is1NVcaH6a7lf5lXzf6bSuNRk3JuQfBwAmKyt4BdLr+mPOBAKgcqM2Zp0fUYn4SIfG9Q
         fpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616653; x=1770221453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNtEsD/7Ir/dUUyhxp9vhIGp+bMH6wePQ4vuvyFT4dU=;
        b=U5UsUV8lziJQ3g+gKZqiDKo5UHrX/Qe3QJ35xsSyzjYQvvIAJ/rWvBemXBiGSgbi3L
         cve/XpgRVJBKAk7ML805KXHCold/WdZMlBOoACXBrQAvF61HKEqx7vF9YF1gvPqmzUz6
         IDmTUwFjgu8i1hdWZ6ibqacXM5IDPtXVGYKYq7dnuEb3bUKx2I4jLtZ5MSEPvL83fZPi
         D5syRl30MdZorbXeWicZxTihQBS2eAMuEgxfT428IQCBBJE9JEzHdOb6mxJCwtZGxPWr
         qNf7GFjA8s5yRl8sOFpodRRCzGJRFL86Ch17+iVlclOe+TPlugfui42eaSgBT4+dvBvO
         Npzw==
X-Forwarded-Encrypted: i=1; AJvYcCUFQLlb6VJF4UIZ4yAhctz4laAvZekGvR1I/h14hB5GCDllO3T8N//G6oqOTD4fdfgHMIbJjiBSCuEB98ZLLG03@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kMtfRsIMObVH8ZUkKOG4P3StUOSGo1BRpf6NDmiUaZZJspc3
	RfmvE2Ty6uasn82SvXNCg1OzdR7Pkt1rJUN+g8EjIbA1EYLSC5tDMm2SjLK4SayD2Sg=
X-Gm-Gg: AZuq6aKhw+masneQppPDfMbKGU6tjhPUZLRYfvAKo6tAMpPjsDttJM1vNMxrsEkcpYT
	gH5qpzxmOB1rRxuN8xovNvEvN1r6/Y+Dw/NbDEIWJAXQNtAVOcsjzOmo+3vqEuY0PStkwJm5v3h
	mcLKSyMzl/3Cc58rW3k1r//CFD6PnNEGHxUi+qJXWeewNuDcsL4m13aEj412Ns92FITKHfDTf61
	zSdrwXDzk4jn9sZLLT8mb43FrbxV9znzJ/IhgY45Kx8HtbZZ6GqeAhskkJRcltN7dIa+fiN7yU8
	k2NaRNVsEfsKYkSWV9sEDbOuhDD2/CK90ysxfKARPvDNeEMbHVpyPrbG1ns3ikHcHB4Nmx8eP8u
	iy+H1bvfLNk6luO0v8sv180VsKBY9ZmGHsHQNasTMQedKLcEMcGVWK7wzseSdUME+tD03loz+Lt
	4pAq9k31GAbekeW1osaL2oWfhwvQkF+Iw74dPaUXvYY3vLsWXiqqOFJmNWNYl6nBr+kGrv6yB4p
	Cjqog==
X-Received: by 2002:a17:907:da6:b0:b76:b632:1123 with SMTP id a640c23a62f3a-b8dab33b16dmr439788766b.42.1769616652975;
        Wed, 28 Jan 2026 08:10:52 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 00/10] pmdomain: samsung: add support for Google GS101
Date: Wed, 28 Jan 2026 16:10:49 +0000
Message-Id: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAo1emkC/2WNSwrCMBBAryJZG5l8bIwr7yEu8m0D0pREglJ6d
 9OCGHEz8IZ5b2aUXQouo/NuRsmVkEMcK/D9DplBjb3DwVZGFOiRABDcZ1LnZLHl1khhBagTR/V
 8Ss6H55a63ioPIT9iem3lQtbtJ9J9I4VgwB6MBgPEKaEv9zCqFA8x9WitFNqasjFpNZnnqrOaK
 s/kn8kak7Q/WTWFZiCkYLJz4sdcluUNl9IgBxUBAAA=
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
X-CRM114-CacheID: sfid-20260128_081055_478437_C8BFFC7D 
X-CRM114-Status: GOOD (  17.59  )
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

Bullet points 2 and 3 are new compared to previous versions of this
series, and related changes are in patches 1, 2, 9, and 10. I can merge
patch 9 (SMC call) into the gs101 patch (patch 7) if preferred, but for
now I kept them independent to make it easier to see changes compared
to previous versions of this series, and because patch 8 actually
applies to not only gs101, but to many newer Exynos SoCs, and to make
the two patches themselves easier to review and reason about.

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
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

 .../devicetree/bindings/power/pd-samsung.yaml      |  29 ++-
 .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
 .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
 MAINTAINERS                                        |   2 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 ++++++++++++++++++---
 6 files changed, 395 insertions(+), 49 deletions(-)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


