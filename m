Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24362CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ub2snCiVZE8jzqH1nIij73jcu2bxSWb7Zl/RGJIk6T0=; b=mzsdcd1D0IksR8
	4Omu2/cT8Kpsu1lWw+J3sJyPhzsLZxcs8aA/DDhjeiSKOW7kOP2mmPXutt2fcevVQMVLHKwhj06oJ
	yko+uaG9vZvXYMhXFDuyLFU1lfdvsOkguUfJxDpQQIUSwmrt6nrFnQu0SjFkOZ0ZPGf/Q0KYwTLiF
	UXTZituWSCRe0PyeqX0+AyZu0XmFHxOnJQYSaC9xF3y7Vd/XUPTtfHXL6MXb/vUxLEO1df0OQT7Iw
	94RrLWFplPLKNEFADZs4kYeewCE214OwP11IC4RXJFCj6VOGvIC8tcg+gw/s1PIWclFa+k9yQNtis
	YBBDAw61bt0CX3kq1aLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVx-00000006Tsd-02Ww;
	Thu, 09 Oct 2025 15:25:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVu-00000006Tqy-34er
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b54f55a290cso101252866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023505; x=1760628305; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ub2snCiVZE8jzqH1nIij73jcu2bxSWb7Zl/RGJIk6T0=;
        b=CMZNYPOSTj+bUq/SCpXHDrkMkDt7uaNYsEKAsnViZV1RDCw7Ezev26LHNLaUYUVFHI
         Ahu0bzIdcHc1sJ6VF64XqNDlmODHiW0mI2AFxV7J7Loi6I0qaWZYV4BjvdHAPGzMrBZx
         Uzyl5iWtbG+cg2/jSfNyTuBxKGySiTNH08k4miJV4xqAYjDYaC1idkSFrhSIDgh9CZna
         SzMJdmCsLsNfNdEfDbhDTnRDFS7GFD1XiO8SfGcZBCIN4/gBBhFqx/7sC9hVg8liDk+f
         Rt5/tAkKUi/1bGdx1hO04sAkYhT7E4TBWlZ0kiKWq71GLC+wso9sZwWgDVxo4OuHNXya
         7ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023505; x=1760628305;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ub2snCiVZE8jzqH1nIij73jcu2bxSWb7Zl/RGJIk6T0=;
        b=JwaQNHrozdnGoyOaY6rYMK4yVSgMmYQLldCOLYFL2SHCFXmEGtMmsrd9HEA/xSHV46
         /GNZKBzjFKVkQHy1W2FYgiJXg4FRlDaJ/V/Vgp9qbjrUZEV+9vf8KZki97Hyne3yjzgx
         B1LZ3EX8Yqgwef7WNk7xD3oSqjS3GQNsUSu1WHtcR6HURwD7EyQqZVEhOmFI22i1dAGv
         rTOmguQS6q3At8bqRTLpBWt8BZYA5fYZz8hEJ4lqi5YesdZalyNQpw9CP0ykRYlBlc/G
         KJd+5waeU6riOCyumqaxROQIJsERO2jsr9F3pkmm1eoUPMjGLOjC3zU0wkIZa1unSB/t
         Dgcw==
X-Forwarded-Encrypted: i=1; AJvYcCVjFyvKvgnvXifaXYzwZUjMgBhfK4B5Es2U6f90MSE+eVz6wu/nyZflXoXEL42BnjHHIjak3wPhl/mxZXhDjYsl@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ9HdKk1wMSfMmxQGtjqaDNvB1RVs9FJ/DXrMQ6fRHugK26sBu
	DtpFBzQaWKxOgfWLwVge7A/f/dnGFHWHAGgVhfgPDkpk5eZ1ND0hopUuZZgbGYEaJsM=
X-Gm-Gg: ASbGncte8osfMaQG8sDCBp+gAQSxnaKT/nCxhsdMgv+U2vdkYqivXvRHE8+A55ns3Dd
	0WcTr/o7Q7393sOTYzcZQhK6oi0UOSwAwrBsBC8FSDELciLgpIwI6OZROTX2vhfh7b/Rt1RUWog
	e2H3eajV79BGCyEI1fJJUtzcKoOV841eSahrczE+98WjbGGCY0Jw4RIFLu66Bq3f6fbWjNOflLS
	Ds6iocI2mtOpbhlP4UTUGiT/p6Gylb2H9N9KW7Rrem4znK+tyAM4acclo/jszNbvipldIv0c2hR
	3ItfjPjDZBu1YuYUhC+JgYTKS5sL+hieCfpfzvNuOZa7eaHW9+6NcdrGPUQjhzlbT/4AviQYwBW
	QeLgIogWZVa0cMAMM56qDh8PqT4dmyDZSwf8PBSsAix011KfxqlNiYVrZa4tdMtcuYdS/JljsC5
	PsUHa+zRL9JkbftfPq4e/sxcKf8OwgII2lTFgAH2+d
X-Google-Smtp-Source: AGHT+IGm9Ug7HLTZ2JUW5hLT87xqLZ3YfSMB46riBMEdnpjNPrdz2fQrTHR8E+dbh3onnyTmrWbKxQ==
X-Received: by 2002:a17:907:94c3:b0:b3e:d492:d7b8 with SMTP id a640c23a62f3a-b50acc1aa45mr699612566b.64.1760023504704;
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/10] pmdomain: samsung: add supoort for Google GS101
Date: Thu, 09 Oct 2025 16:25:02 +0100
Message-Id: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM7T52gC/0XMQQrCMBCF4auUWRuZhGrUVe8hXaTJNB2QpCQSl
 JK7GwviZuAfHt8GmRJThlu3QaLCmWNooQ4d2MUET4Jda1CoThJRCp9lu6sTrnf2qp1Gc+mhzdd
 EM7926j62Xjg/Y3rvcpHf7w85/5EiBYoZ7YQWJRk9DQ8OJsVjTB7GWusH1LZva6EAAAA=
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_082506_788934_8C3909CC 
X-CRM114-Status: GOOD (  13.50  )
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

This series adds support for the power domains on Google GS101. It's
fairly similar to SoCs already supported by this driver, except that
register acces does not work via plain ioremap() / readl() / writel().
Instead, the regmap created by the PMU driver must be used (which uses
Arm SMCC calls under the hood).

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
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
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
      dt-bindings: soc: samsung: gs101-pmu: allow power domains as children
      pmdomain: samsung: plug potential memleak during probe
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: convert to regmap_read_poll_timeout()
      pmdomain: samsung: don't hardcode offset for registers to 0 and 4
      pmdomain: samsung: selectively handle enforced sync_state
      pmdomain: samsung: add support for google,gs101-pd
      pmdomain: samsung: use dev_err() instead of pr_err()

 .../devicetree/bindings/power/pd-samsung.yaml      |   1 +
 .../bindings/soc/google/google,gs101-pmu.yaml      | 107 +++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 ----
 MAINTAINERS                                        |   1 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 126 +++++++++++++++------
 5 files changed, 201 insertions(+), 54 deletions(-)
---
base-commit: a5f97c90e75f09f24ece2dca34168722b140a798
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


