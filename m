Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=; b=2CrxudXKjqxijz
	/qxBxrPGYH2yZvfXui4+Jg2QFqQv7Q5R9EeSsQKurfAK4Zv/TBgWPF4tkt1av/x8DgHu0n3cZ0Sj8
	hWnLcRe5AxJ17M/nbbzu/Jc8iBg78E0TtkGnLoZPWR6cJD1HOF7gHj559iKwTZwx3LEK2DqtKDAok
	PvykVbK/8cHJ+zsGBc/GRy2n8M2G4bWZgVN5AD6TBhvWmL+z2gaqLHWrJryEshusyHqfY5PIN6PlE
	2RooOUYD4iDt7DZarPUSDAeNLBR0YaSM4Zmw5GhDFfAJwCvVla9nOt7MJHC5WPR+VUa+Bso2m5xS5
	LybOufpFgD3WFtJ7cQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq0V-00000002orQ-2UYG;
	Thu, 09 Jul 2026 14:45:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq0T-00000002oq7-1zLs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:45:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47d70879764so1397161f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608339; x=1784213139; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=;
        b=lFwGh9FGI8U5wQthAY03nFJfjivnJj7L1bI2MqK0kXH5VQU2RFiURbSa6YLs6JA90V
         8GTU8YbH7Yjj8G9tDVgjMWbLMGVI1tD49Xvx++9SFdhQSO2qW8Gt3Qpv+Kx1cyug/0kR
         bl9tg4Mr5jSmxDtHD4aHnrfIOIWOvyZnw+vpIkb6sQaBCH8+zfhMuOy2UqD/BC0gh5eb
         HzjOudFdlLcA9GcwPel5SqywRbrSYbdbT6J0zJxX/cU3SXLYzkTBpWz4WYKK9697KgjJ
         ssFAB1doMaaEBnCvcad9upTge9dFt+bmSa6YI1/d3XpJdW5xWmKIs5imoJr+oF5xgdrv
         AB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608339; x=1784213139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8evbnQ4bByTeP1z+8SG4L+efiBu7EqVA4ISoNL6wzmM=;
        b=ET1M8n4fdz1b8PFwzz1VPqLONkMqme+vH1lC6eFkY1Dk3jnV0biTPSE3qX+wcGc561
         dzjKsCAmRCleIn/1zMzg+4f+RFgCL3vA341d48Lx4LO2yVqiSdGA5lTAzSJk1YByqfU4
         VgHCGKbSaAAg9mdWuBMoo7ZVghJrDTNm4wiXpLrpO5WGdgzApg9Tpyeb71x7lqlreO7Y
         EbwqnduD0Mmmoa2mQSJExTM11eyXYUqldMqFJEu0rLsJ8LmsFix4G4LHKkazgLXECKa5
         E0LeVw6gfDiU5OhgfsJT2P1cz1ekS5YrDBzQmj6CFHeC3s+nNwqExYOFL+ZfnPV6WoLm
         6KCA==
X-Forwarded-Encrypted: i=1; AHgh+RopSUIB+728ahTxLFq64SLRLf8sWBkFIBtChDSe4UJjzJV4MU4NM7nRgxlBLtTMT/RlVtc+izdYxkTYzB1PJMdA@lists.infradead.org
X-Gm-Message-State: AOJu0YwNM+fO68MkqLow1ml2ES349Uja89qzv5LqnsguIGyXARqPTeeD
	zdvFfPrITCMi63bEyrb55EMDz9XkB7rFrICeapyth87ZudBllRwFb+9qnIf4K8iHi60=
X-Gm-Gg: AfdE7ck4HxUyU90HAg47/XufEiTmUVVoyRooHuooNKpgjUZeJ4+KmKUVEleuViz34+q
	LFdrZeBXct0aMe5P3Nd6c9nLds5ZHXQKxw5yhlN3WCO1oXm37DLMFcvSDjkrcFT0E5lzE6qukgp
	pK9PkGppJvT+W/jqhB9GgTkG/hJmW0IXH4H/hC6OuTWjOz7cQn2HJgPg7qki2nzENRa0+6XRAG5
	Rbsl8Rs0EZPXgGJJWXrE5BIf0py7a8/LBzxcsQombCUUJQWt0pAuxRwngERCn9RMP1X609vxxZN
	JrSwqxuISlYT35eVlXD6YQUf0DJNwxHLpxxuXFBx/Lmh+ix8JdcbFbBlhKxkA8c2RxHnmKmgOkq
	tvYwuQ9ge8YCcqLeY1B/Nb7bEcb9Zz+/zTB2/WtoFugPKZB7VRlY6ZJcNuROz6f7AsSjgTmN9x8
	AiyatPvMAD40AaVUkNHceRibRq7yb+ZLtOwh49JwZrNf7smTbjYRXAqE21qJCQJQpUXYWWHFWlu
	IUa
X-Received: by 2002:a05:6000:2909:b0:476:504f:7a8 with SMTP id ffacd0b85a97d-47df081e2c4mr8073399f8f.55.1783608339161;
        Thu, 09 Jul 2026 07:45:39 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/2] Exynos850 AP-to-APM mailbox support
Date: Thu, 09 Jul 2026 15:45:35 +0100
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+0T2oC/43N0QrCIBTG8VcJrzPc0Uy76j2iC6eeTdjm0BiL2
 LvnuqkIosv/B+d37iT7FHwmx82dJD+FHOJQQmw3xLZmaDwNrjQBBpJxYNTPtyFmtWfUjGDGnvY
 mdHWcqUVkVjmplVaknI/JY5if9PlSug35GtPt+Wmq1vUPdKooo1pxX3MELdGeujCYFHcxNWRVJ
 3hJgsEPCYpkzR7RIWrtxJfE3yTQPyReJOXhUGnJlBXyQ1qW5QHqSyCbVQEAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074541_559050_D79FE8D1 
X-CRM114-Status: GOOD (  15.25  )
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

This patch series introduces support for the AP-to-APM mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

It will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- updated regs, masks types to u32 (as requested by Tudor)
- device_get_match_data() moved to the beginning of probe routine
  (requested by Tudor)
- number of channels selection moved to driver data struct,
  added description for that field, data->num_chans is used in probe
  (requested by Tudor)
- new define for Exynos850 is added to hardcode the number
  of channels
- updated trailers via b4
- Link to v3: https://lore.kernel.org/r/20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org

Changes in v3:
- exynos850 dts change is split out to a separate patch;
- updated commit messages to a proper name AP-to-APM;
- added comment "ring the doorbell" right before generating an IRQ to APM;
- renamed regs callback names to intgr, intgr_shift, intmr, intmr_mask;
- Link to v2: https://lore.kernel.org/r/20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org

Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (2):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 drivers/mailbox/exynos-mailbox.c                   | 72 ++++++++++++++++++++--
 2 files changed, 69 insertions(+), 7 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


