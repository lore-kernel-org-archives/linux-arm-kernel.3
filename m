Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33027E64A83
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+D27OUR16Cl4TWEJRos/7LAnM8aBb1wRGjF74GArkfA=; b=DHmPf4fJpXcmyT
	HKlg021DtOzNBhK9Vm97MTor45JIk5Tv/5gDGc2ZLtf5oCpp8PjvP4LrA3y014qp2HVr/t8b6WeDr
	/B7OSCrU1QFw7bMvxsdrOso/3XQ0qA90x0EAHP99fMOKL0u8EE3rqEfFrxzpMIzQNnic2EeFIG/QU
	xL/DWP4mOnUHQpPpgFs1YmNmAbcGv+4dU4OcDD3v8BQ8+4BetkZF4RBsJuw10QgCanrJcyPOuywmG
	IqCSfC5VJalatuYOX3PkCoTLxwPMlnHn2j5dQUn7c9J88ExhiYQ83UqRTNIfOTJqoyKagaGU3vSWX
	kj8QdZiK4tgKyRoXobew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRns-00000009Nx0-1Igr;
	Tue, 03 Dec 2024 12:14:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmq-00000009Ndk-3dlT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa54adcb894so704433666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228031; x=1733832831; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+D27OUR16Cl4TWEJRos/7LAnM8aBb1wRGjF74GArkfA=;
        b=zYQV3xX+q0z/qNWovaXf7XjtzoN86hywiB59k7gf1SUtkIF2JKHc0V7J5HW23PyWgc
         CW87iTkYvgOPwKUUdBom0e+9PpwJ1P5H710JEBuPegIyLWKmH3qUJsG0is3pp96U5lOL
         +RrBqWecoHZOHteSOyY5KNDLFHAaLi0vqqkaayGbeN9+Xq/1Ux4CJJcfN+97j6ARLNhm
         uI5MjqgDzEgjwxy6r41gBMwiA26NJ/DiPF4Rur1DnJtjRUu6ZC0Qfxq0IggLg1a08XZW
         4yEN7XbqtuPn9jNjlLFkb2wa7lcAVr+1JAVk2lpHCAUpeuiGW0N+8rNaJ5Yt39ZE0Dtr
         e+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228031; x=1733832831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+D27OUR16Cl4TWEJRos/7LAnM8aBb1wRGjF74GArkfA=;
        b=EGnDw+IhxBywK5Zq549MqCyNuxzkJ07lioJICRjarq9zCUnbYEz3oTBHuDtiXACoj+
         BrAMfKbAAV7OnGKwEm0DPpNgAWB2JVtLYwEq7hwCxNXGU6rGCuTDTfD23vOZsC3XK5kS
         dhn2HnPbyZnQHka122Fe44SXnCjCfJGFsY1AGb3KaudakgnuEZXC3xhZrzOjhBcrLjW5
         owLMiDOOmtyNxkq53aCVE5l2l/56EOX5rdcI+LblQufQNaJeaEPvs2QsDk8c0LsIalXo
         Z4iK+uHaX4Nyb07+m/e9EsD8/7Xy7trU0NNLkHyFJEq3LuCkxAZ5hYScIiwwETjYFLGs
         Y8ng==
X-Forwarded-Encrypted: i=1; AJvYcCUfw7eW1dppySTQAz0e8LjZJrEJyEMtpw2jtZphzGXptjrizDEwmJ59Ta+bFRvYLlj5mfv6qHWNxtLqpsxK2djp@lists.infradead.org
X-Gm-Message-State: AOJu0YxJrF4so7gYZZdTgbQok9lZmYYp+NUaPEM5tNxEHuIWR7tB1WkG
	2rltA8KOvKCdQxl/dq09E9JVdYYNESX1CPe/MjQ1UooAi0C3lebnqJDr+VdgoT0=
X-Gm-Gg: ASbGncveDhs74tSGto2q9W6ebtTV5rJo06PqTrHasszC2yxLNQW5y6rjLUOVJ3q2zYR
	Qkd+QAixfoj8sJBklPUgRVG9K5mr4O1VGUkP3R9dATSNTkOSLVFljDL4p+FJnv9mNo+RjKa1jCy
	bCgp2PvWGllDj+7/9FmU5aYx+JMa4HYwEoVJCyt7RvfDYDWnNabNt9PH6IDQ01f0uL7rLNcEqGm
	ax/ULJEbwjU7nIHsK5UgQD9j8uMkyr2sObMwI7yf9vHRcIfuhjby/pSc/khWbFqV4DIDAMP/+2B
	ZOIzxVzP27ZkYZa7tE+7uuSCXNaE9eRBTg==
X-Google-Smtp-Source: AGHT+IG/LNiQRH1H/AD37FJTCdb/ukxG6+4AcIb4aIX7NrDNY7ETqg4yetmoSzQOoqOa1fQIjvYgLw==
X-Received: by 2002:a17:906:1daa:b0:aa5:1661:1949 with SMTP id a640c23a62f3a-aa5f7f2413dmr188219066b.40.1733228030629;
        Tue, 03 Dec 2024 04:13:50 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/8] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Tue, 03 Dec 2024 12:13:48 +0000
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPz1TmcC/42NQQqDMBBFryKz7pTMIFq76j2Ki2hGHZBEEpGKe
 PemnqDL9+H9d0CSqJLgWRwQZdOkwWfgWwH9ZP0oqC4zsOGSiGscExnCZdpxtl4Shqz71a7Zu1Z
 uHJu+co/SMeSXJcqgn6vwbjNPmtYQ9yu40W/9/3sjNEhdPfTCZVOZ7jWrtzHcQxyhPc/zC6gJ1
 QTPAAAA
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
X-CRM114-CacheID: sfid-20241203_041352_905868_7D13AE9F 
X-CRM114-Status: GOOD (  13.79  )
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
      dt-bindings: phy: samsung,usb3-drd-phy: align to universal style
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  24 +++
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 223 ++++++++++++++++-----
 3 files changed, 202 insertions(+), 46 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


