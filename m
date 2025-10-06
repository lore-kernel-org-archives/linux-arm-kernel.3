Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE9FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oKtphuJ/4di9yNIsz6yNlkrtQKgCMc1BLXd/ATWAWto=; b=1pmfy2VNgjVZQc
	dnNOoN4272nL6Ys/aJt6lzCCtshtagrpiP0IANBD58XzakMV3kIF83TY4MsGZzZSKHbuvVjO7xo/z
	ZdrjSWbZ2TrGXO9rybNbYF0TtCwp76S2H6xiiWJtyuQNG4Ry+RY9o8iwYgOjHhqObtC2ikZjJZQNo
	e6blwMYg5xqATk3z3qrdGRCPqwH/desybk/IewCOKODpwlj2OOlZBA6S1tXiqdLlaNhzbSri/TI3u
	M1TIRC6Ed3MdTillRGkbu+SAiSSvC7YiYnWWpd7ykm/rVMG/SCtLuLG8C8BiTjePIVv7CwnMtWyyM
	pTPVFLaiJqBEYy4daVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJB-00000000QTF-2bNK;
	Mon, 06 Oct 2025 16:43:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJ8-00000000QRI-0z50
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b4736e043f9so924368066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769008; x=1760373808; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKtphuJ/4di9yNIsz6yNlkrtQKgCMc1BLXd/ATWAWto=;
        b=g1o/OK2pMc12oMsTdXjI2Oeb9kGCOIcKwE18xT2omtoq1RAeuMUD7RzX+k6z1yQvE+
         PrTAZjiFuVS4poQwcp2l3rNjwzvNpnJlZDbztbxnQQncDPG92Zi0CdVGT/cqqT+eNZuA
         5UnubRxUp8/HxdlXOQMTF9MfsHYzsDqxhlU+XNQaxnLHhDhDtA8lU9kO6nnooIMc5emZ
         5/O565BISyej/t95F7CKLCD0stIQi0GsLTjG9Uhxxr8M2COyw7dUTnTDBQ3lDsN1Wq6o
         sD8jl+ajm+JJizafNjUn8ygpOd2T3aWKY4b/x0V/5yP/eBvD3ZhvfG1zhnwb2Aa7t2Ps
         +wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769008; x=1760373808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKtphuJ/4di9yNIsz6yNlkrtQKgCMc1BLXd/ATWAWto=;
        b=V+eeHQuhC7x+dhlXMOFeja4SGFdQwFnlWeEyEnV6HioGI1pQADHCRev0GBUovNAKpX
         5eJ19KdE54MdQdUXD3V5YpDP3xHBG/XPivH4BiyqZHvL0Qo0/2Mq3CNKFZ74QhX6QvCi
         NijPiCXwczy7Hg+NhU8Hk2ek6fMt5KsIuI3/LzoMfC9wSjzvpyUcT9IDninAOuLev+d+
         RpvaqH4vooTACP8aSRnL9crhb5Gj06IimCnR5yoIcshnUV9+3/QY3idL4zwFN6EMD3py
         IewoQSzmz9Br6Vgz4by9PcQgnj5aZG+xpSd51vYAhG8CSzl5Ex1aZDTA0LVNHcvNMUtg
         c3AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVw6GuH1sAS2qY3IHCeOzbMgLBFjeIlTcnCvLeS9i3OkF/WCDdi10qN0y0sM8oYsJLlA/GTHpYlBLZBASFvRPx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywiq3svrXG5rKUVfgep8io/W4gcygb2JWxTQBE9zC0EsMQaCNMA
	BAJAPttV6AcgaqNdg5IofmG657zwIAstFMqevN+Addud15KXy2uZUka6YUvDP0tRvCk=
X-Gm-Gg: ASbGncvmN6od+byUcWROAsU3AP+F3IOyQ6Axx4Hct8NCY42Ucn+5kdqh+U2kS3kE/Rm
	Gwk3UxwVLOcIMkF6+C0DPutVmQFBlVLHvcvwiwm1FOD+iT1QuDy5wpftvW5j+LGYDP4JKtTKZ9H
	GHh2gukA+LAaHB+wvMMW8j6q+ZGWttyXpmFh/TvPikUNAQJ7YaVIGm10iIzXjbcXMTN6ZABYxPt
	ggn7+7flY0av4yHXx3KiM2YRLoykV7G5yYcsphPvB79BDLAH6vUSbiqq2zj84mWIFZwXCe/1wP6
	0XYZpkPifBb0sfraN2TEOMpRxSdMu6FwhxDEiXIl5RI8ixdjCNNSYRAHlYc8eobAxYjPmwKM4Xz
	eWFlbx4+utLQWqRX/KGILPlSVgb3KpzDyxWGkwa/gTLP3Bh+OGCPP0odz/dgL7jjN4FEby75P9X
	N883MSJpDuo3WlEQV9ZqyBxrW3ZcEeekutMQUXRu3/qBw0BB1ZEtw=
X-Google-Smtp-Source: AGHT+IEH9sBJd0VNAAJtz9rRu8u+k/yXhel69FaA4JYwSprBvbLGJFT33oMJuv5fmnK6KbnU7ExmwA==
X-Received: by 2002:a17:906:7951:b0:b44:7c83:cd9 with SMTP id a640c23a62f3a-b49c47accbdmr1839696566b.40.1759769008357;
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/10] pmdomain: samsung: add supoort for Google GS101
Date: Mon, 06 Oct 2025 17:43:26 +0100
Message-Id: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK7x42gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwND3fRiQyBZkKKbYpKSbGmeYm6QaGGiBFReUJSallkBNio6trYWAAe
 OGYtaAAAA
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_094330_450321_06097765 
X-CRM114-Status: GOOD (  11.53  )
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
André Draszik (10):
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: allow power domains as child on g101
      pmdomain: samsung: use to devm_kstrdup_const() to simplify error handling
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: convert to regmap_read_poll_timeout()
      pmdomain: samsung: don't hardcode offset for registers to 0 and 4
      pmdomain: samsung: selectively handle enforced sync_state
      pmdomain: samsung: try to get PMU (syscon) regmap
      pmdomain: samsung: use dev_err() instead of pr_err()
      pmdomain: samsung: add support for google,gs101-pd

 .../devicetree/bindings/power/pd-samsung.yaml      |   1 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |  53 ++++++++-
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 126 +++++++++++++++------
 3 files changed, 145 insertions(+), 35 deletions(-)
---
base-commit: a5f97c90e75f09f24ece2dca34168722b140a798
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


