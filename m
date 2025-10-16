Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66597CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gZIFtHvs7F/q+BdnxOwwAZugPQcTpk+W4nyCeOYTpMg=; b=F3v8UCXxJzUwv9
	DSnaADRPI8M1PQjfiWa+eeNu1EJZ9WW7M86niDgJ/8NL4zf9KOPmBZZkpizyg5DygWGWvKyB4LGTw
	K0HXyyYZQL+RnyeOXJEqjI+M28opE5bhCkbMKG9VrFqfMm7U9/a7J7L6cybpWPuVzW6/gq04ZDFRC
	42Vy72a74SC4y8W4mEoKzoKDN75ZlbaEFPt1+mdbn452zx+DyoXYZKeH84SyjT/BmgQ1OtNljrj83
	CfuQxB6+LL+VHu6mNsmQ9/2hZQvra7uKnuNq5nsvsrczcIGFaSs8Fa5oAI0aQEQLx+91Z+i+5x+ro
	3CgoP8Fg4+eVP3yMTiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNL-00000005IVB-3w7M;
	Thu, 16 Oct 2025 15:58:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNJ-00000005ITS-0sFh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:46 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b472842981fso118458066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630323; x=1761235123; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZIFtHvs7F/q+BdnxOwwAZugPQcTpk+W4nyCeOYTpMg=;
        b=yUOWpZYByrwcyNgNMI4Xb7UK+ik08YEyI8u0PEsqv5dJIMN3yuD37Wvm96dCdz0QWU
         OCpbo7Qiz/M8Q4UewIGTNv/x7avBDV6t0nclDETViA+kLMf7+tA31flUi7gvBFUCNJbE
         e6BWw6lB8/aXYWfQC1SgyZ6d0MUchUeiV0WeP9x+RlplSiEBIriOvJsdm2TYpDzJF3wq
         T+7Hm53SPT8CwKC2TTkCBmQ9ZXSu79KUfMgGD6RkCeibumwj8Agx/SO5TT679wRcQIJu
         6VrI36jkD4UgiLdFeSLYDtwzkhcx3jjlJ4FiaKalw85LNbty2iqW26TZubMvAy4LVT30
         Tk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630323; x=1761235123;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZIFtHvs7F/q+BdnxOwwAZugPQcTpk+W4nyCeOYTpMg=;
        b=K2c3JfQZH0xckGsdMmmFBb0w2ZopVkUFoSV5iN7Lm6PkNFT/iDOB2gOzkKumE9iupT
         go3KCi6HyURHVz4aOPx7XTo6qMxjnleFuxiyeEEaGM5ujUr1R7PY4G9QgMkFdRgLAVov
         xdcu1gutTfsYHHphxodEgUhIHobGd/WDmRrYvxm3NJTobYqM0zTbCBlWKg7ESW3QeuMu
         4HNu/DEEcQob25iiOI2nNBPci0HHvUfzmGVqO4Hx5fJhHUb+MDzoqrm5aqHyBzb57aHf
         GaidWvYrFo0mZZnzZVbaLikbdF0iOrDGAuwG003KnG7ZgsNkejDXVEVxkY3LQXk/wBVL
         qrsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMnB3Fo3Zh0YJa+SmmP0Z8uvvYEC8RFQCH+VpOQwXCGkEMTa6GJF6X6pAlxlMmd66De2jWso+1bpU5MBQkmpjT@lists.infradead.org
X-Gm-Message-State: AOJu0YxnbtHyjAjJnEhOKP1kHlAvDEblVw7jDeH3tCGGr4X9OqIRzFny
	5f3+H867bHDQy/CpabmYhZ/NDfoxJqPdAikeHXKfn3fq0Hg6je1Pn+kf5EXdiCGZZvk=
X-Gm-Gg: ASbGnctk5916CGt1ySRro0293+WvGdCNR3qDSBrpfLkI9ZHXueGlK/5uD45aQ1+QN1j
	lRzM+H1+23dIuPkBM+vOH6n/e+g3GbGqVIRj9nsIguiojsu0hfaxgl80Xk7gK3vgIFRJLUTHucS
	8UQRiTY2TxRdAbm6wDJ2G+dX7qavBipZ6FsI1JKaH/QHol+yifD/I4R0FIfz275puhLs4ivg/HN
	sS5CjwzTOJOCrPeFFZfJwfeLg8qLTqoC0DOcquFm2C5hZgXyg1SICrKPq7y6cwIAaykfv8vrA3J
	HcbQn4tgOcEv49EAhUT9quhiT7Yk1UpOpgr4HaAZww8lwE8rp14HhRxAABdSFCbGhwDXaJcxSe+
	Uay6IYqAecUb4LDhLT67ijuUhUwFFsXb6E6Q+uXOQFQlvEFYEyGM7j1Vye0tiTSQLW66Afh+QB9
	mf2BrT+IGTNpbHO+b16hWBzKkQ84KgCeSg2w4rVNwKfikJLiVBYt5GvzczrumJ7g5SrGW5DL4=
X-Google-Smtp-Source: AGHT+IG4HRaUmyVAr/Y8mfqN8pN0d3XueS9onISZHfbE+N4+RTdShVGlTthizBkJnoAWjpKCiPeqBQ==
X-Received: by 2002:a17:906:f589:b0:b04:61aa:6adc with SMTP id a640c23a62f3a-b647195b6c9mr48758066b.7.1760630323195;
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 00/10] pmdomain: samsung: add supoort for Google GS101
Date: Thu, 16 Oct 2025 16:58:33 +0100
Message-Id: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACkW8WgC/1WMzQrCMBAGX6Xs2cgmja315HuIhzR/XZCmJBKU0
 nc3LYj1sjDLNzNDspFsgks1Q7SZEoWxQH2oQA9q9JaRKQwCxYkjcuYTL3cyzEiju9a0qM4Syny
 K1tFrS93uhQdKzxDfWznz9fuNNL9I5gyZQ92jRm5V218fNKoYjiF6WCtZ7M1uZ4pi1k6qxvRCu
 br7M5dl+QCIJ7682wAAAA==
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
X-CRM114-CacheID: sfid-20251016_085845_263412_F1F518CB 
X-CRM114-Status: GOOD (  14.10  )
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
 .../bindings/soc/google/google,gs101-pmu.yaml      | 106 +++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 ----
 MAINTAINERS                                        |   1 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 126 +++++++++++++++------
 5 files changed, 200 insertions(+), 54 deletions(-)
---
base-commit: 58e817956925fdc12c61f1cb86915b82ae1603c1
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


