Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84673E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jyPCCbXGwL2HX2ZQQ75iZPGtqkwk+FZ+xBNeL3SfQvk=; b=qdeUOvDQz+KCKu
	bpaDCPkrNQ9fGhjIqB3JjxTasBTYCs3iDOuI1sxy5Sondk/4z7jEsSZ06PWmzjarqeIEgu5IaC+2g
	gV6cGJGGsaDsKbj1m0zYbqpmafcq0DdHCbFQaEMpOGPZ65JbGg1QEe2WugvCg8HuELipL2v9LiqeO
	Pp9b22aJKc971H/+hguVT88H3OttLsqknpCQYelLoCuELqrsMx/iT634CX94stcFogUX6YW0aNWYb
	NN/fmZQu09CBv7AhbO3eaFG01Oll+Sx2ct30Ajlw1ziAyg/O08V0Zgz471jtC5TfnyMNaFKd+WS02
	gd7jgt89y2fB/B7t5YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Nr-0000000F2Em-1hqC;
	Thu, 05 Dec 2024 07:34:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MM-0000000F1hA-3YUs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:17 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa51d32fa69so78487566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383993; x=1733988793; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPCCbXGwL2HX2ZQQ75iZPGtqkwk+FZ+xBNeL3SfQvk=;
        b=ZXsaHppg0rACEdHk4jsIzGM+26GMEZf3W+DRYIw6XEg40e7B6pIAbWOOsh7lUf9PNu
         LDKLtsNKwDp1MjO6AYl73FAUhcf1LVU5DwuCcDM02etS4Jg7CXCrODn39JrV4lvHC4Fx
         D68DgDOaYiTblq+kV1Ik7UvXv/fLpvaO0nU5n3glcNx6MHiMHtnO43i5p4Rmn6oVN1vO
         UowW81XcesnTuKStL30KDCw8dLxJW4uvHGzhYtcG2BCBFvQfBRbo0E+7gdn/57E3EW6F
         NV90V/yX8yXKVfr5MmZ0SMyf1Qct974AIfJPPb647vS/2bwnT2n68gMLa1yBUNjbsGIK
         egcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383993; x=1733988793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyPCCbXGwL2HX2ZQQ75iZPGtqkwk+FZ+xBNeL3SfQvk=;
        b=cZq+bCf/tGEKTcE30aCCF7SmmjHJt0v4STTXA03GKBE4/oi+qgkE9Cw/6Vq6IOR94R
         +QE5bTaj7brPW6LeGNQcncMX1oU+aX/03e73wv9YVi1ynXnFXjNr94qNNa1UCf6xtNcH
         MHZAcGf+LmJZHzqMKL6b2EeSyx59P9e6owTKLufEDymLSpBz9w18d3aj3wtQ/bnFI5z5
         gAbheB7fIWyOd/iuTMyNbmTKr14PTGQNg7fwY13ismL+q9jOP8dfEXM3dNRdpYCr4uK9
         nDeIPk39fJm1PUvw0KE7LTnrDg2ehnk1hStMmeykK2LlhDY5js1F1aQ7xWNRBdOseHdS
         B84w==
X-Forwarded-Encrypted: i=1; AJvYcCUQQ26dAl3atDpUXxJPyDTRR0KDH2ZlbX9zwLb+MXRSmLbwB8VyiieuTd8pu3Qm4f6Xt5n0LfKmejZ86hjm+0dA@lists.infradead.org
X-Gm-Message-State: AOJu0YwgUKsJX3fm2cdHEcmgyc05HjSUqZ1RWFI/tIknoXoGaHEYeYDR
	jUd3CoKGtZy4+Wu2wxnAEOfKb0sPmFB+AZHieCnjaixCF9IN8AEsqIrvaH92DvM=
X-Gm-Gg: ASbGncu18Ti9frnMOyWrB2hLHnew/hSNkWu1NpNLu8AyP1cxOg3tyTgHQSYGujRhnLJ
	XExAs7ynYbuWasRnhOrGMcXWMq1Ibu/0Qt/N5b1GLxyE438OmwwkAn3uhyIceN6wkesuoxkOhUv
	ma9TJjMgk6Irm37kCYom6HVQ4CoDyRYcajC4aTVu//joVcY8t2jR5oz6LPB2KCmekEuI9iNcsEI
	jXuGXLMr/unJ5rZiOVXu7FSIry2pw8ENcEsrJozqIG3qpElfEFgdFXLPGYMyThcwXODRTE/ibeG
	NiMTPf6rejjuT4csp8Zr12RfKVYNrlYJ9Q==
X-Google-Smtp-Source: AGHT+IHfI+UCHItr2vvHKPBrNf3u5if9tiRttGFiL6E80p15Kq2YgAQozShUjLutF89S1nrAwt0aIw==
X-Received: by 2002:a17:907:1ded:b0:aa5:2d9a:1528 with SMTP id a640c23a62f3a-aa5f7f40800mr661936566b.60.1733383993082;
        Wed, 04 Dec 2024 23:33:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/8] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Thu, 05 Dec 2024 07:33:11 +0000
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADdXUWcC/43NQQqDMBQE0KtI1k35+QatXXmP0kVMogYkkURCR
 bx7v25KV+1yBubNxpKNziZ2LzYWbXbJBU+hvBRMj8oPljtDmSGgFAJrPiQBgs/jyiflbeKB5n5
 RC+3OFhuDoCtzkwYZKXO0vXudD48n5dGlJcT1PMziaP+3s+DARVf32qJsKujayXkVwzXEgR14x
 g+IUP4GkUAJRvekVjWYL3Df9zelo8+vIAEAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_233314_889666_0398F96D 
X-CRM114-Status: GOOD (  13.94  )
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

This series enables USB3 Type-C lane orientation detection and
configuration on platforms that support this (Google gs101), and it
also allows the DWC3 core to enter runtime suspend even when UDC is
active.

For lane orientation, this driver now optionally (based on DT)
subscribes to the TCPC's lane orientation notifier and remembers the
orientation to later be used during phy_init().

To enable DWC3 runtime suspend, the gadget needs to inform the core via
dwc3_gadget_interrupt() with event type == DWC3_DEVICE_EVENT_DISCONNECT
of a cable disconnect. For that to allow to happen, this driver
therefore needs to stop forcing the Vbus and bvalid signals to active
and instead change their state based on actual conditions. The same
TCPC notifier is used to detect this, and program the hardware
accordingly.

That signal state is based on advice given by Thinh in
https://lore.kernel.org/all/20240813230625.jgkatqstyhcmpezv@synopsys.com/

Both changes together now allow cable orientation detection to work, as
the DWC3 will now call phy_exit() on cable disconnect, and we can
reprogram the lane mux in phy_init().

On top of that, there are some small related cleanup patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- patches 1 & 2: update as per Rob's suggestions
- patch 7 & 8: drop init to -1 of phy_drd->orientation (Vinod)
- patch 7: avoid an #ifdef 
- Link to v2: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org

Changes in v2:
- squash patches #2 and #3 from v1 to actually disallow
  orientation-switch on !gs101 (not just optional) (Conor)
- update bindings commit message to clarify that the intention for the
  driver is to work with old and new DTS (Conor)
- add cc-stable and fixes tags to power gating patch (Krzysztof)
- fix an #include and typo (Peter)
- Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org

---
André Draszik (8):
      dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  21 +-
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 215 ++++++++++++++++-----
 3 files changed, 190 insertions(+), 47 deletions(-)
---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


