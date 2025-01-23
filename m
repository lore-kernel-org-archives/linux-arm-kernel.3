Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A277C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1ToMyTjMs2jLgsOp4dn6EsxiilccUPfzThLkca0KWU=; b=FbSrGFhnFhjZaBOmKVixF0r5oU
	JfHxbf1Z9/iMb6lsoQyjLVx8vwLjLpbZzRwxlR86v9s5DA1uPsFBPnca/oyYyCEStRR8JjcbK1oUT
	ZjoGgWFw92RyoOB9ikbrMKIO6fxRRyMN+Sk6WBENYmNS9rqZqmetLlCyon/sipyS6s0tzj/oEO/HL
	9T5C8t2N14rmn6+e6aH0zHfPnj1lFYU36nfU+d5/pZXJ9UcKVuioSZPKgGj7SMuKGpB014uRCrcJ6
	Xc6y0LY4/37kxmif32nH776jds64bLMadKTS9h2zSJji1bMDT6CRXhWwhhBlRenQ10BmmN2T5jG5r
	R4IVo+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tay15-0000000Cae8-0vHo;
	Thu, 23 Jan 2025 14:17:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxzm-0000000CaPj-1NGM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 14:15:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54298ec925bso1170177e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737641744; x=1738246544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1ToMyTjMs2jLgsOp4dn6EsxiilccUPfzThLkca0KWU=;
        b=vLjgU/qS6xgaWy6YoTTNGGEqZjrOosabP4ILIBfzrXXa2hKJMKZjFYeFne807i95+l
         hJPR9ef9Dn1WdcRgHZNAscKlDgcwTX6EaPhZ1qnUV+GRrMCmXz6yDfeK3MWROxyxkJs7
         0QGf4LNc+P4EX1Su+WkTi63vueChrwU6TAYQrbgEjOtSKtD6RYcZM6rsNnS1hI5ER9lY
         dnDmia1ShtWDJGur8aFkYBBk1ta83w6+PKjQipAMPxKwZCNiu9bf9WoMWun8d1QMvBef
         Xqkv/tmNrJ/prThprAlz1uQPvBIfDW+IAXfodz/6OWscEFBGlI3etD1w32Tknui4LQRZ
         s1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641744; x=1738246544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1ToMyTjMs2jLgsOp4dn6EsxiilccUPfzThLkca0KWU=;
        b=B4YAxqXjbheXEmet8wRHy9QYcUzJqBaJLWeR9hLKtdASDbJHSIhCHRyvMxM6E0RS/k
         jcnkWkjml/ys/V4oG0ojbFIKvJprz/MjbLAx6Cv29cKYPa48Pn0Y/Rm4GFaxATYtuT3a
         sKSVX44jkpydbGPiwZ6qflUm6G0wzuKVcgPZYPo7d2cZvlgGygDrT622E6LnQCEyleI2
         6SO7fNknvgdX0PmtAQ4m9rwpLc9wzwriOOohbPJ9KrkNeITcbuwCz2pueQ6NwmjWB30E
         CERYJb02jSO2mH2vSbA6NYDkRQbEssjiOAJQbM24UkJRoQV+JqXjTM/RDvVHuuXVxr+b
         TP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTbiVmG3Sbx/61Ei1HAxWcDMcn9JUC+W2eR9On4Zb3tp2x4ww9ghtOHHFNEJrLgljlptCo6+plS/dafWREm1rU@lists.infradead.org
X-Gm-Message-State: AOJu0YyPmYk0z4R2Ao3HAju5k8cW+6ecDcUZhC1dXt+TKdyjI0h5W4xl
	pqpVXIaRj/iabsfFzQyF3clSHwmQhp7OrXe2lGH1CNaEezkkGMyeYcAn9pv/CfA=
X-Gm-Gg: ASbGncuyLtagr/CGBtpTFDTZMiElz0JAzMwG4VHg4Q/EjFnYvwCxpxUff9lv3rqFW/r
	7PNU1kR+4uRkGTMzvhFxhmXH+MOof/77Kh3pekYa7G9TTyjuSq2I7XbdHuGk610mxaDf/tB/wq8
	JBCLUcDLzsyfP4BhGey8kJhKDmBSERebAKjJZmrH+SWE43Oq1EYfpv6FP7Jk1mQDF3g83fde0OG
	wqbQ13vUuLlkN1q8IyHuHQpTNYzsTWepSkSjGyi8Ur3H7+GHMAYQa/+9q6O5nFsFbZ/IEf4K2XX
	kwzrnt+RQh4pPIXhThuHm7IeIEvKXT+631iNk+Z6WQXbBVXx0hmHqtY=
X-Google-Smtp-Source: AGHT+IHplopuHQYOeHKQxzSgMWlfVO0WOZMzXUZ9QofYSuMY+TN8CSqm5hG6oBjV6GjzjpVF5ldH2g==
X-Received: by 2002:ac2:4195:0:b0:540:3566:985c with SMTP id 2adb3069b0e04-5439c251121mr6875642e87.26.1737641743965;
        Thu, 23 Jan 2025 06:15:43 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bb6bf5b1sm778726e87.118.2025.01.23.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 06:15:43 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci updates for v6.14
Date: Thu, 23 Jan 2025 15:15:40 +0100
Message-ID: <20250123141540.265172-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_061546_417699_7A6CAB1E 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Linus,

Here's the pull-request with the pmdomain and cpuidle-psci updates for v6.14.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 726efa92e02b460811e8bc6990dd742f03b645ea:

  pmdomain: imx8mp-blk-ctrl: add missing loop break condition (2025-01-16 16:10:32 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.14

for you to fetch changes up to 885f5669f2abd0db34c9832259f77240d5350e36:

  pmdomain: airoha: Fix compilation error with Clang-20 and Thumb2 mode (2025-01-21 10:45:24 +0100)

----------------------------------------------------------------
pmdomain core:
 - Add support for naming idlestates through DT

pmdomain providers:
 - arm: Explicitly request the current state at init for the SCMI PM domain
 - mediatek: Add Airoha CPU PM Domain support for CPU frequency scaling
 - ti: Add per-device latency constraint management to the ti_sci PM domain

cpuidle-psci:
 - Enable system-wakeup through GENPD_FLAG_ACTIVE_WAKEUP

----------------------------------------------------------------
Christian Marangi (2):
      pmdomain: airoha: Add Airoha CPU PM Domain support
      pmdomain: airoha: Fix compilation error with Clang-20 and Thumb2 mode

Kevin Hilman (3):
      pmdomain: ti_sci: add per-device latency constraint management
      pmdomain: ti_sci: add wakeup constraint management
      pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups

Konrad Dybcio (2):
      dt-bindings: power: domain-idle-state: Allow idle-state-name
      pmdomain: core: Support naming idle states

Patrick Delaunay (1):
      cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with OSI

Peng Fan (2):
      pmdomain: imx8m[p]-blk-ctrl: Suppress bind attrs
      pmdomain: imx-gpcv2: Suppress bind attrs

Sudeep Holla (1):
      pmdomain: arm: scmi_pm_domain: Send an explicit request to set the current state

Ulf Hansson (2):
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next

 .../bindings/power/domain-idle-state.yaml          |   5 +
 drivers/cpuidle/cpuidle-psci-domain.c              |   1 +
 drivers/pmdomain/arm/scmi_pm_domain.c              |   8 ++
 drivers/pmdomain/core.c                            |  15 ++-
 drivers/pmdomain/imx/gpcv2.c                       |   2 +
 drivers/pmdomain/imx/imx8m-blk-ctrl.c              |   1 +
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c             |   1 +
 drivers/pmdomain/mediatek/Kconfig                  |  12 ++
 drivers/pmdomain/mediatek/Makefile                 |   8 ++
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c    | 144 +++++++++++++++++++++
 drivers/pmdomain/ti/ti_sci_pm_domains.c            |  81 ++++++++++++
 include/linux/pm_domain.h                          |   1 +
 12 files changed, 276 insertions(+), 3 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c

