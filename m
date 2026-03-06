Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD3F01827
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5PvtQLAwyimVW6/tRnss8RiKpGBnGc7biXK7tOFe0QM=; b=zLf5h3yiNbePgS
	cRam6Qw3LD2pAVe6tzTwQ1ubw4k3b4Awx2ur2e4copbI0OvZFtqLapYBmo68S8jWWyqY6OmKG/ut8
	SmV97RtadTgceoaFxYom4vhoC7xCQBd7o1b1EfpxMxp3HDmpin7JdH5ZL2MRa09uunzDg44OInifw
	hTPi5HmCh14gMXZviElbWdDZcvYNM429J17GzoGn2eDRhgi8sKcOHpztArAzORVQzP/jUTGbdBpRq
	fIyPUYOdpLZAHW+ms1Jm6Yh7e/lM6UrN8uPFEjeUnccvzsCgpbSnkGmVnBL1WjhPwr0Z+/phXUObz
	O00aK1sAV5XRtP9sV8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRT-00000003SW9-0muW;
	Fri, 06 Mar 2026 10:29:59 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRQ-00000003SUf-2ZAw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:29:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso3046077a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792995; x=1773397795; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PvtQLAwyimVW6/tRnss8RiKpGBnGc7biXK7tOFe0QM=;
        b=dw0n0n7wJ1BLJbvTBKoTf8aXtabrO/WC2pRFd1j4XppjkfLMxgw4rKoMAuX+dIou9L
         p9zOTcC2Djhz3vRs8VPBpdbfjOvXGMoD0hwi6kr6kGtZ1QCs+Nr+YMn6KjI5K1m28MDF
         fHJ2fjV9u9uKC8hwmpTn6/f1oQHTIwiC4EsYdIAVbYc7n5B4FWe8Hmkbzh9LjO33knrP
         xJ5ItfYoJ34BMP2f5z4Oeeqv3Sb+LPhCHeVxY3kj7qwY0wIj+x1COzsCNNmmpg9UpNW5
         vzOn0oOt7zFUWGI4J9wRu0Tlq0mcWbc4+JfuB+4uyv1ddFmRIhuzxvxdSf4YwKDdVFCo
         9NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792995; x=1773397795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PvtQLAwyimVW6/tRnss8RiKpGBnGc7biXK7tOFe0QM=;
        b=rUNKjMg5otIdjcOHskzaFGKPr3yeX7sHG4djWFpM/LVHnC1YMOuTZ5pj+PlkU/UGVG
         wZB3MdDCVZjwuHJvfrZcVWujjg5G7GiG4kBRBcwn6K+RnIFFSGaEEvb3LGtdAy+oDdax
         FZlR3gYtufe+sV1d9r1YkjOSwi7jm8cFpGWZdDZjhrjYig9HVj/4JZtEDiZH9yOAxEYP
         0w0W3md0f3U2rpoKOmr4yfO6Iob62qnYaigmYLOUcQd16qK18M5e4gx+6UdLw4XwoD5S
         P9928IcAVTZh8tJ3Z2c4KVsEZPgM/+zNE3jLa9VptxFoPq+o/NOy0XQxiNjiQq5rFB9f
         hY1A==
X-Forwarded-Encrypted: i=1; AJvYcCW0WcSNJxL+dqAmkHLmvRJHAOwpAqn3kqfNYZWuCTAEOwjD+jxAYFBYNWPtsO8Xb4z/ckuuZ4MFHrK2X7qobNIf@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ/1I99CDIK/8EahYiU7DPC3pHaRGf7M1Boqp8nSglbOnlCzJX
	NTxtC8PVYs2+kkdMwM0lTV6TkZoswFr2HNPPVYC4yV5ov/TsI9Uev6gl571IGDbnIJM=
X-Gm-Gg: ATEYQzwSXyevP70Pt7vZ77DHWo9ruOo/DZvUvbbICOPKfJSJT9lAG8mNU8H5VA1I4Ot
	PFthAIRZN7nR7jOLdNz+jF/5HRPmTscxqKjcjkqhjKTtAVkTE/8hlDvpqs83CKwyauTqlb0VJH4
	CSzqc4UXM69u+idd/NnoXhs03ha6v8T2AKrNlHk+JshUE7Xk05iJRHB7QswULmv2/7pG6A1syux
	lU0+1Q3ObylwURLoP9cdEiFZnDt8VQZtTFICSTjW/zInrl6krAM0ilLPL9SGbFNXo5wI5wWl960
	57T1ZzQj4YHoU389P3dIN+BhdQjEoLT8uhdGlcQ80MdQ7gahy8/iFZ/mwjWm0AZIU4b2PWFhSx1
	EieVJNgczd26vhpFSwLglvKWhpApRVw0luSHqe6KWSQAM+PNCf3nCRYUU68W2P4uvZisWSgYNfg
	MXKzsYXAcM1qKvPAxErwg5GDhW77il1AfxALfbSYL0lvrNiOkbrUDmb1dh2qZZgPjBhs28V1bmd
	CDtNqDsWBqU62Q=
X-Received: by 2002:a17:906:7307:b0:b8f:6696:f81d with SMTP id a640c23a62f3a-b942da7798cmr93636766b.11.1772792994492;
        Fri, 06 Mar 2026 02:29:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v7 00/10] pmdomain: samsung: add support for Google GS101
Date: Fri, 06 Mar 2026 10:29:51 +0000
Message-Id: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ+sqmkC/2XNy2rDMBCF4VcJWldldB0rq75H6UI3O4JiB6mYl
 uB37yQQrOCN4Ah9v26s5VpyY+fTjdW8llaWmQa+nVi8+HnKvCTaTII0AkDwqQk6r4knnaLDhOA
 Hzej5teax/D5Sn1+0L6X9LPXvUV7F/fYZsXtkFRz4CDFABJE9ho/vMvu6vC91YvfKKnvpOilJq
 lF7m4L0o3IHqTop+j8VSQwK0KFyNuNB6qe0IOTQSU0yhowhGa/BwkGaXUownTQkc8raxRQMenu
 QdpfqRVqSQwzOqCg8SvUit237B1h9hPfDAQAA
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
X-CRM114-CacheID: sfid-20260306_022956_682360_8E28FE78 
X-CRM114-Status: GOOD (  17.76  )
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
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 ++++++++++++++++++---
 6 files changed, 399 insertions(+), 49 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


