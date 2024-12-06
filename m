Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D4E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b7nSjvUx63MADVpt7oEUea+FY7rhNfLzD9bh4ADhfVg=; b=2v+ki5FN+qFku/
	+kdgs56qAr0Zwvu80Yhfhmxm2QB0fUgR9NBxf/ENJzKCFYVp0CY1k5U4/TMiPr3weA2XCcxYLX7j5
	DGzqGU7g6OpucOWmoD02rkTKL+stpNsJ0TuOPSyZx2o/uYqgFsfa/5aOrdI8vsVm0GA7GJVhgLWq2
	w8unEytYk+guFWzMbLFBlRa4yFoXr33BRvadFtHmsDxKEE38DrZOn9bbrhC05/698yZLWGHNsqcZM
	9J/Lmw7U5Rc8Jh+xWcgmoVNaLVf6tQi1QpMMgFLFp3Rz84nTnuukaLLcXBPVCDxBJKaR/z5We9Yad
	8RrQ/wwo1YcOZuxXZoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbFR-00000002Ado-37Ed;
	Fri, 06 Dec 2024 16:32:09 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEO-00000002ACt-10Qq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso442976766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502662; x=1734107462; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7nSjvUx63MADVpt7oEUea+FY7rhNfLzD9bh4ADhfVg=;
        b=lMUPLVHGv6s85YQiloZGCe0B9HB2KMHKDBkd7Ih+844snCrUSRo4LByNlF3rEITtNR
         E0tuRuvY93RQDcpl8ap91bYoiR3sQ1O05NuEeeQv37AKennkSgDAj5aTBXuhlgtlfxyB
         x5bat5L+TDR5Ng1b0M0teYf5CNvk7Mu1p8KhjV/AJd4lOmwlyJlFKZmz9naQDWzfWfLJ
         kjYNqUJ603jBwctkwco0aKZ9OrPZYzkdt3tprSw9TwgMdGA/LS5mhD/EYwqbod6qZ7W1
         ID+xIV3kjtjiD70+msqUiiGpYzLcYV/WIb8yvy9VjKDriZCl3WYwq8nxseBzxN0LO3TM
         5ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502662; x=1734107462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7nSjvUx63MADVpt7oEUea+FY7rhNfLzD9bh4ADhfVg=;
        b=UqBXhMDhiE3KDT4GlwWO4xZ8ptl07vP9tNLDvisXq6d1dGG04X4k3tuCUglrSUuKQ1
         MZGvya5DKqdserwHk2F9fgUwFFV00j6FS37Oyw4JfgFJvOkRAbammcYw50PyErrJN7CE
         LUvL/M0Y2YHyiYN7cYdWMAKJs3dd08b6PXGdyyf9hhee34wEATx/fd4lAQCxxbjDyi33
         SFAZ6xVt6CGE0Oy6GRqLu0JyqpsJu8SoOoOTYGQ8Q8GQYNtnyxjqgM9+DdTv2HY06xIf
         s2QKOceoig3RG3/qaLNwA/5yfNPnVcrysI/3PxTsYili/bUB6kBnug6RDk9QbWeMaCm/
         q8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG/fcK8MbYIHLTWTcdLX+/yJGDlrGUyGI1vOvnN7Ux5/OUS9KIjJomE+qBtHjWW1UcH5zhUzUg7MXLH5anSX+n@lists.infradead.org
X-Gm-Message-State: AOJu0YzpEog8xxCwTkNmMMqgg8L7fBrnex7baNc68gfFmiPwLnPiWvZo
	sytWvXF5tRcY7ZeliqGdriwKvjtVCk5ZiZQEywdYLTFUdAArnG9oAIkwzSUNB2A=
X-Gm-Gg: ASbGncv98xEaF92GLaTyu789oC1d8NB8ks66IEUbMhozbghweXQ53Q886GPJ9QjEk97
	DKKo7ibPI/oLrwrx5isBjfQTClVJO2kd8OHt8065hUsLC9yMY6FrjmzwS4gkq1+H3ohZyZ2C53O
	MotzbNSWWRE4dNJ233C1UFxsnIqobOqdPVySoOW92wbcMg1RT5DzJrGOWlE0cfzFsthhaBt6OYE
	UdmcT/FLcRHT8GY2negbDw98npiPITe6ysQOG0j8dJ6YwNbwrjjrpFN0nX9qwfaZpR1NxnC/0hK
	jKoO9+/tgfE8s+6FrqGFsl0UAGiq2RAFLg==
X-Google-Smtp-Source: AGHT+IG5YohV/4iJ4GCzEmX7QvPbyvRE1dHLvIsPCNB971me4/Bxko7NAtS9jjY0kEtDTyMZljoJ8A==
X-Received: by 2002:a17:907:770d:b0:aa6:23ba:d8c4 with SMTP id a640c23a62f3a-aa639fb1a24mr339321566b.4.1733502661682;
        Fri, 06 Dec 2024 08:31:01 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Fri, 06 Dec 2024 16:31:00 +0000
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMQmU2cC/43NQQ6CMBQE0KuYrq3p/1QqrryHcQG0hSakJS0hE
 sLd/bBR4wKXM8m8mVky0ZnEroeZRTO65IKnII8HVrelbwx3mjJDgRIAFW8SCOB9O/Gu9CbxQHM
 /lAPtthYLjaLO9UVqZKT00Vj33B7uD8qtS0OI03Y4wtr+b4/ABYdK2dqgLHJR3TrnyxhOITZsx
 Ud8gyiyfRAJlELXltRcCf0DZp/geR/MCMzQKoTKaITiC1yW5QUJoFYgcQEAAA==
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083104_268458_E6129293 
X-CRM114-Status: GOOD (  14.24  )
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
Changes in v4:
- separate out patch 5 'phy: exynos5-usbdrd: gs101: ensure power is
  gated to SS phy in phy_exit()' from this series, as a stable patch
  shouldn't be buried inside a series like this (Greg)
  Link: https://lore.kernel.org/all/20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org/
- Link to v3: https://lore.kernel.org/r/20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org

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
André Draszik (7):
      dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  21 ++-
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 202 ++++++++++++++++-----
 3 files changed, 182 insertions(+), 42 deletions(-)
---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


