Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BA5CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=; b=1qUoJ68LBuo49J
	a2yUjQJUxtWFXX92IOFU89kAqq3355ArY3tt3K/ENSPepqNZsU1OSrrv/GXpWYjV/aZv5a7Cs+GPj
	9sXf1EcxWJUnyWBevOBtcQaaPqBjnPi23bS3cPviTlBkNFDplUWK//gx1f0utdmBixB5W7TUN5YbG
	Y/8fh/wUUP/D1muRv/GK8k+MWotLdEuj3IS2hgkHNLx3T6TuGlErEAXZE6Qy2FOWWzfsq/+/tnhws
	G/tL10wRSBjhffQ2O6dvxta+UBepf99elqxnhXX05nDrgHTQNB4qslc9/C8rR9RUMa+XdKjVWdSZt
	VOZPnh7Iuyp5sRMO40BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIA9J-000000046sS-0nGU;
	Wed, 29 Apr 2026 19:00:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIA9A-000000046oC-1AsJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:00:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso1012435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489230; x=1778094030; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=;
        b=qieMkYe6bPYGhFad4TzGGxxVp64vdWLpCVkJhuGaiH33p1j2+I+BKq7IQURgDvcKDj
         Qz9G2izrNkSEQu9pDwRuP1/qmk+9Jgr1ty3FOCtT3sQJCsr4LGeDOSQNMkSrcN03FMFg
         U8u5Jy/m31qp8M0PJJtQe2SureZhnnvMEdqip4y3GEdP//MS6tyfzrnVxh8GX+OKeqv6
         1btGfynhFrjgSPf4SMP55PyLVX1JWKKeK49AWybNJp6EwO3J0Gcxwpa8NskRJ6YVUykO
         k51+8hPh90EPq6PZn0gwprciX/75du6Bz79WNcsH4JgCW7vO9YES+Mt9Z2zGqpdMXmaY
         r+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489230; x=1778094030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=;
        b=FeAqcZ2vtQwCT1p/Bkx7O2WqadmhkzIL12STW7vWE8aEsJcq8pYAS4bUE3LFJsq0YS
         wT48fzmPUZeFaNRfeNWMpXKqD/+LTyq9BUqbqwCt00zd8SrXsw7ilixUsom1QtxNQLzP
         TcFHH7+rhlyRMl9WI/9aTt86JM3v8/oLUvPxzhJZ0BjD2HlkaxArfqW/CdLEo/6rcAZz
         QBH5sK58reUDfz2nc6+r8LIIWGz7BYk0KKgHjm1WmMUAoUmW740P89E6fWOAmfD1EsmY
         ZXCs7XTk5iJW6mkYJXl687nCaS6pU1CrPYE0/l2i4RHcxk+rmrYc6/bD8li58CSDf6Wv
         hC9w==
X-Forwarded-Encrypted: i=1; AFNElJ/Y/Kk7kIMyVO1gtHk98kZKzpn9zFMrJ6c7/mvQ2nck5Da/jfvnvcDTnTK1ofAG1/RmCGH/1bh7m2hPIvG+pJwL@lists.infradead.org
X-Gm-Message-State: AOJu0YyWP8XPNwpQt2h+3uqLbJy7+ev36p5oU60wn7zuy+F2dc8IjajA
	2JOODFSDNNNRnvFCDgQtcJ7v6ypPCpQRPCb8tCfMjVuKxyMnsKEIk05SoF+iueIfCe0=
X-Gm-Gg: AeBDieuxWNPhwzkQwAH1z0LzZ8h5G+AdLob+M8VCX19Xj0nZjcuxKF0zypIRi8laOAV
	Zz0o4/YaYft0zbM1AR7/hw7rOaz48lTtfqE2xZm/1Z3BPmmv3lr5qi7zfxLYj7M82m0mZwNSEV7
	Hz9c/z6o+HwaEVt6652mGhTLn5s1wYYtcbVfZs0DLH1gZSefEyvXn75PIjrknA01Ntj0Bl/OEZa
	LF0MQSrmk7mrovzdRHO3KcAsNMivCR+iebwL5AdJFj4qtE3JfTXifxFMp7m+zAT+R2E7lItZkTU
	L6WTXwQ32thlJRdVEfbxqpC6pzif/Wl3voSDIPlceNuNkjDnY6hd3gQg/+bPimX8uWlD46xIVfO
	jfiMpUzh4Uux6JggKIbGCR8MQ9LJJtH1UH3sh0DD3P4QlJjTabNAKQGIgvUydHrbhammZiWCvya
	VB7+t9NUkLyqANHsCAnwWGSv2A/t7/p058R2Cl/bIqeWqzi1aCu4WCGGPR4nTDlNAWhd1rbE13n
	CvxcTIxtjzqbSilsMFJKatsye8=
X-Received: by 2002:a05:600c:1f13:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a7b546cf4mr85601935e9.26.1777489228834;
        Wed, 29 Apr 2026 12:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:27 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Exynos850 AP-to-APM mailbox support
Date: Wed, 29 Apr 2026 20:00:23 +0100
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdV8mkC/43NQQ6DIBCF4asY1qVBUANd9R5NFwiMTqJgoDEa4
 92Lbppumi7/l8w3G0kuokvkVmwkuhkTBp9DXApieu07R9HmJpzxhgnOqFtWH5KsGdUT19NIR41
 DGxZqAJiRtlFSSZLPp+gAl5N+PHP3mF4hruenuTzWP9C5pIwqKVwrgKsGzH1Ar2O4htiRQ535R
 6oY/yHxLBldA1gApWz1Je37/gZAfZJrCwEAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_120032_352412_3F792F5A 
X-CRM114-Status: GOOD (  15.08  )
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

Also, it requires APM-to-AP mailbox clock in CMU_APM block (which was
already merged). I also dropped clk-list emails from this series.

Will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
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
 drivers/mailbox/exynos-mailbox.c                   | 59 ++++++++++++++++++++--
 2 files changed, 59 insertions(+), 4 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


