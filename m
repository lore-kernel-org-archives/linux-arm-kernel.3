Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012DED609D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FnSBghT1PQvjEoqKzE6lYaSFxfTQgIMEYx5M8qLoZaE=; b=PNij2aSiK/bY4R
	O/vMOaCXSLYZJ5ScOq6t0NKZ3b0cws/7y+n1fg8yoKfwbDAjvkVGPIzqyZaKx11SYhs0Q+qrqBifq
	0HLVUPPGz3z3X5bjjFbuDwTqJCeW8VmmNCHSx5MdFeeRWrBs0kGoODGPE5HJFgcFz9r6jdwcn4SC4
	ffuurwdvBOSTLhVHgaFUdlL1/14vh36qAxKI2668CWIcMUVA755zCSzmS6bl7B4CBQL44zx9KK6Gm
	hvFT8rH2UL92sAOGoVhEyhoPiH6oln+hpM8j+kMPu/sPBqjqQNuZSd4ngsraZosAdrSFzP7FYpO+y
	Gx0dYA6yE8WSxieFnQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFlN-0000000CvTI-087W;
	Wed, 27 Nov 2024 10:59:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkM-0000000CvBW-1nL5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso621928566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705092; x=1733309892; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnSBghT1PQvjEoqKzE6lYaSFxfTQgIMEYx5M8qLoZaE=;
        b=bqEHQRIdOeBN8aMZQ8+uU9psoh946dD6ssfoXFMWN6t5WWedmwgi/4q7jgfRlLELlV
         Y2LpOxAe0QPmOdUbIsi/ZXi1a8gRwsOpYYOkH8lhPSz6iA4nO9PThgrU5oczZY7Tzerl
         +ukHf8aOzygWZIRZpojCsiEpuX6a5D4ffZju+0KQ7NYMhIBcl1W6Y0DfxKZyMJ2ggOPB
         eEIo4blO/7H2jKtnKVPyVuUhAFg61AaVpbC3+mvNWJo6Pj8v2BZIu7U9U2K6hO47tQlm
         Lw1dXEYjFrccKmUCBOsVAYHKK61fmC30W7KQztGdIGM30vgG8EFDjVCeJCbhObrCiw1h
         n0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705092; x=1733309892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnSBghT1PQvjEoqKzE6lYaSFxfTQgIMEYx5M8qLoZaE=;
        b=rjaC8F+OHbCYOwbiqwEQDTWgfpP6I8efa0sJRA6nG4h6I6c6+QRWR4GcyKdHeCZ4TH
         LcQ5vPH2LzkNG6djIVADURIB0j0LGMJmqTwSRogHT72ipGdjAK6X/Zlco2PFposcLfTX
         +8Lftsw4l2XwLOt2or15YPPC7NdV0AoR2I5B0y67o1/b1iSDTyV2EE63Cve61WjjB1lE
         z1KBp+y0N9rQrNhC9JBYkjI9L7vZ6vFfQxs4pKWm1COVyOGBaHla6iyLC+3OBdCcNqjn
         iwaeECuho3sORw4tSajbWI+E5+oP/BOuPloMUH1jDQCJAAo06KrCl2LxDXa7wXCujdOQ
         CAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvE7i+gV4v2vzkmxAVQnis6WKTPvX7d1239IxCwZRwoPzpUhiSGA6zvV5bZhjChXVgw8Zuz70DXfAY6chGbREv@lists.infradead.org
X-Gm-Message-State: AOJu0YyDSxbstUTPEd29z1L7Wb9/UvkNrRd7rPSLZ0ANFfaP5i42K+Vv
	KWC3Q/4GkrkboFyZzfqNkPPYgWEnpGUSlTLxgH+2FR0a01T5X8WVAkV2SunSfNQ=
X-Gm-Gg: ASbGncum0FoM3stoDl/noLJnHFCII3vDVSbmgBfmfeBK8b6DFRvQ4mQR1zS7Evoh8wY
	1y+82MUAPCdcHFJMnRpZV4/h221tMxsqhAjqY8P/8GTiaxhuUiY0id8U293N27bWF/bLj1ivcEj
	MPONTxfJedyqe7n1YIIzVQz0rwhpn0EPNkwoMyuF8y6HI/pYY36t8sIAyv+259MHcENBhEM8+ie
	Y1UgPtiasvgWtCdJe79d182qmD/mHJrE6vN9Rbu3HG30rCr1TlR34fH/KhqZesSKv6/wNQLnQ1h
	cdPaT51d+/YanUNdrdw9qTvyOIcUCOlM/w==
X-Google-Smtp-Source: AGHT+IHtqYL91H6SMMvksK3ZTB/2Fzc9xaGKysfgcuXFtHMmqYC6TditIFw1AYITQuYQn85K2iSkAQ==
X-Received: by 2002:a17:906:1bb2:b0:aa2:c73:3720 with SMTP id a640c23a62f3a-aa58107846bmr200250766b.58.1732705092241;
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:11 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/9] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Wed, 27 Nov 2024 10:58:10 +0000
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEL7RmcC/x2NQQqDQAxFryJZG5iEoa1epbgYnFQDZZSJFEW8e
 4PL9+G9f4JJVTHomxOq/NR0KQ7UNjDOqUyCmp2BA0cifuJkFAjX+cBvKmK4uF62tLl3r9xlDuM
 jv2Jm8Mpa5aP7/fAerusPwzyMdXEAAAA=
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025814_477263_CCF8689C 
X-CRM114-Status: GOOD (  10.47  )
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
André Draszik (9):
      dt-bindings: phy: samsung,usb3-drd-phy: align to universal style
      dt-bindings: phy: samsung,usb3-drd-phy: add optional orientation-switch
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  20 ++
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 222 ++++++++++++++++-----
 3 files changed, 197 insertions(+), 46 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


