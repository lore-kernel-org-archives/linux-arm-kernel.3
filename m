Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB050D69117
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfeSJBhQWP8l7KTP5vZE2iSz9LkwdawgxtvBfvQp1xo=; b=H+jKg7Suu6LkYGzROqp8EiU0y8
	79NjupIpYeGPH2KU80whSzOP/ChMvcHu9klJlXNvjsPcjVol4DTzf6m3uOvvLIZZV2Od8DoH/czbx
	sHKPu2cCYBrXlVBmkh643+lZ34Wf/SkqdlRsAMEs62OwlIvtPWMWDxii21p7HcbvkoFkZB3ldSYoB
	BGxBmTN8nfejyEuvk/73TeueG7/vgG3fyi3gK8MWYnBYY8hJTvX2Jo3BMlVAFQXHXLABIlpoiC1Zb
	uTMA7uyo38Hq//9U4PjFTo9L7h5BiqxV/K/YKb9Hmdc3HYIoSxol8gul4HongF9IL/h76gfvtLenh
	SM224uzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgQ3-0000000FtBn-1XHW;
	Thu, 28 Nov 2024 15:27:03 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGB-0000000Fr5F-1BZ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:52 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso998701e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807009; x=1733411809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfeSJBhQWP8l7KTP5vZE2iSz9LkwdawgxtvBfvQp1xo=;
        b=NvNqWZdUJMXnEn+/EqoKWvngPaLBd54w38YNiaLmJAAn6nhF2ql8pYGgATYZu3UUaT
         VsmL4lWC2IAT5xCLZXTmn+zVCO35zzgvZW/o0XHLteWXWqY0i+Ga23qk+TOt7S1BKn+d
         GheaQCG42EjaJ+xGaIRxB5Y8x4pluonE2B08CMsE/WJ07xUk2st8GLZdPlpuozIbH5nz
         ipRgCYsJK/It3kRo9JuBbwnHuTgvwU15q5vK0MoWw0O5CDLoWyPK/3xaZXENvWVaR2z1
         mkT7rVEUdNZ/IYpDbB7wMucdnPT1seMhjvX3fkImwFhyk4e3t99n0tNBGLnafXTciUM+
         TmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807009; x=1733411809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfeSJBhQWP8l7KTP5vZE2iSz9LkwdawgxtvBfvQp1xo=;
        b=rYPfu72y3kAoNmu6+voP9jdEAPT1nmH/8NhloIyo2NyX6oOvQjhPqlIOLzJY5ZE8fT
         OpitfixFDhJHHxsQ7pDFWuoPON3pWgobj9MsfULpwqp1J3JDXWwgadkgnHVE5/oVVQ3A
         uvzXeX29wwk0d63TI6vv+FLhpnp9dad2s72iCWCru/sZzqFgcf2pLa48FUxIX+qPPwQv
         gH8yk+1UipAZHq+hc11ZdrHMHpHqjWLz68z4uXqY69IKoyjV07Q4FnbbtAtmhaXTdOa3
         USRveI9b0oJAV6UzU7yCAG84sIwEpp1ghC/QyonQ0RGnrNkor9RqKHZR72VoOoylDiuA
         qtcw==
X-Forwarded-Encrypted: i=1; AJvYcCV1w6f8t03V1KUEdRxbkUBPV25k2wN8W/Jlo3l9tPX5RuFJnI5KZ1014XxszvzLRQnO+jIujMGHsvvAwOV3ippR@lists.infradead.org
X-Gm-Message-State: AOJu0YxKJswB5fkSsFX6xrxPhJvBLo8tslqE6CCMchNwUS8sIkGj0HwR
	Lx46g0+BeSdQTrf6evPbZaGwl05xcAixqmoaFMAhIY/vW+UsWyNDzaE1yFu66Xo=
X-Gm-Gg: ASbGncsVFqCJ+1Qn2X0NEBiES97W3i29C/IwTKtXuKSSPWdfgDwe21S5t/b+kEyJOds
	EjbNS/MyqqEgKXE1KF5pNULdagrIdn5bae68l4Bm+3NwhASirix6BK4PI1hweNHGVdK9SXcUQ5V
	C8U6l92S30Jsnrnj6HrhfzBaO/sRqYJ4JMYfBd6RIefjSZs1McXxgzUl/fua6tKSr63I/nUIpKk
	ahuz546qAWYqmdxvfRpLPfptrGBCvTTGYyKSS+pRh/jN4RvrrOEpHbsO2PG1V68wQB97hE=
X-Google-Smtp-Source: AGHT+IHn/lhzJjmymdgS/6JhVUH3swS4RU7HodKmDhCdl7gS1+/+6IDbGFSb0wYctmuAw5hTQlb8vw==
X-Received: by 2002:a05:6512:32c9:b0:53d:e3a6:ae82 with SMTP id 2adb3069b0e04-53df00ccf7dmr4177851e87.14.1732807009070;
        Thu, 28 Nov 2024 07:16:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:42 +0100
Subject: [PATCH v4 2/5] dt-bindings: mmc: controller: move properties
 common with slot out to mmc-controller-common
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-2-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=24571;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9Cp4EaFYwrm1DNXgnlUgE7sxl1OSRdzWSsgnFAohqcw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlbc7yqMnrqGxFvNnxzkXxqTwiFJNf7uK9DLlp/
 atWTuM2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJWwAKCRB33NvayMhJ0VZ2D/
 9o6CQHuiULqr2VYsXeaOojYUEMMgeykk+S2v+vcq8ldZAGIdkv1r/VUN/pRDz/c+886U6uYcSMtYa7
 MNcKs2x9F2WhsD7aB3t9Cu8vIXVljwwShf/0DAn1v+OzTMjdjkB6meA4tVWahbChihI5UzTAZQr/zV
 NMCsTX9ZJM8mElhV/ctlZT6g5gPzKxYvdpN3yEUvhMsSP3qvwn1s/Ds9JF+AjGYw75dBnEHiMI4YIn
 exdhM2yNCAC/f4tGHEjhXw+HyP5oJ0bnVdc4C117SMlu4la/fceBZxiQr4eHuZrkotHcd1N/fJFeUA
 gbXlw1NGYYkw3DHz+UCPE3v9vIytAWJ1xMCoz/4PZgXj3ClViWv4+KyaMZ0fTi4r/W20ovC3W47Wkb
 Va5gLIoWZ099siEwAh0JPIG8Sla9LKDIx9iU8VgEwwXFNTQqPmjskTMFwuN+RJHjnnmQ5FA6IjZ9PP
 1B5oXeyAVd/MUtTOLC9GkrENE3I3mtrhSiFaCs07nMDKCJFsgbdEU+x6zONj8WIWlUAlc2ex+uXV4L
 bJk+idzIVMpyg4xGAgQeZ+l4+QmsVPJE9x0jhyJVLn/6wt37mTVHajlsMeOs2EImaZPReRpJAEHY7u
 p+/O/M9g3fvHPEwVwG2RA1S93s6bF9LwPcy7K9b3zRup2jCSB05B0ba8CNaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071651_342783_7F7EE601 
X-CRM114-Status: GOOD (  26.02  )
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

Move the common MMC "slot" properties because they are shared by the
single-slot or multi-slot controllers, and will help defining a simple
mmc-slot bindings document with proper slot properties and nodename.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
 2 files changed, 360 insertions(+), 341 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d8297af578049b2bf71cf6e06f45aac1e42bde56
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -0,0 +1,357 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-controller-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC Controller & Slots Common Properties
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+description: |
+  These properties are common to multiple MMC host controllers and the
+  possible slots or ports for multi-slot controllers.
+
+properties:
+  "#address-cells":
+    const: 1
+    description: |
+      The cell is the SDIO function number if a function subnode is used.
+
+  "#size-cells":
+    const: 0
+
+  # Card Detection.
+  # If none of these properties are supplied, the host native card
+  # detect will be used. Only one of them should be provided.
+
+  broken-cd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      There is no card detection available; polling must be used.
+
+  cd-gpios:
+    maxItems: 1
+    description:
+      The card detection will be done using the GPIO provided.
+
+  non-removable:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Non-removable slot (like eMMC); assume always present.
+
+  # *NOTE* on CD and WP polarity. To use common for all SD/MMC host
+  # controllers line polarity properties, we have to fix the meaning
+  # of the "normal" and "inverted" line levels. We choose to follow
+  # the SDHCI standard, which specifies both those lines as "active
+  # low." Therefore, using the "cd-inverted" property means, that the
+  # CD line is active high, i.e. it is high, when a card is
+  # inserted. Similar logic applies to the "wp-inverted" property.
+  #
+  # CD and WP lines can be implemented on the hardware in one of two
+  # ways: as GPIOs, specified in cd-gpios and wp-gpios properties, or
+  # as dedicated pins. Polarity of dedicated pins can be specified,
+  # using *-inverted properties. GPIO polarity can also be specified
+  # using the GPIO_ACTIVE_LOW flag. This creates an ambiguity in the
+  # latter case. We choose to use the XOR logic for GPIO CD and WP
+  # lines.  This means, the two properties are "superimposed," for
+  # example leaving the GPIO_ACTIVE_LOW flag clear and specifying the
+  # respective *-inverted property property results in a
+  # double-inversion and actually means the "normal" line polarity is
+  # in effect.
+  wp-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The Write Protect line polarity is inverted.
+
+  cd-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The CD line polarity is inverted.
+
+  # Other properties
+
+  bus-width:
+    description:
+      Number of data lines.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 4, 8]
+    default: 1
+
+  max-frequency:
+    description: |
+      Maximum operating frequency of the bus:
+        - for eMMC, the maximum supported frequency is 200MHz,
+        - for SD/SDIO cards the SDR104 mode has a max supported
+          frequency of 208MHz,
+        - some mmc host controllers do support a max frequency upto
+          384MHz.
+      So, lets keep the maximum supported value here.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 400000
+    maximum: 384000000
+
+  disable-wp:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When set, no physical write-protect line is present. This
+      property should only be specified when the controller has a
+      dedicated write-protect detection logic. If a GPIO is always used
+      for the write-protect detection logic, it is sufficient to not
+      specify the wp-gpios property in the absence of a write-protect
+      line. Not used in combination with eMMC or SDIO.
+
+  wp-gpios:
+    maxItems: 1
+    description:
+      GPIO to use for the write-protect detection.
+
+  cd-debounce-delay-ms:
+    description:
+      Set delay time before detecting card after card insert
+      interrupt.
+
+  no-1-8-v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When specified, denotes that 1.8V card voltage is not supported
+      on this system, even if the controller claims it.
+
+  cap-sd-highspeed:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD high-speed timing is supported.
+
+  cap-mmc-highspeed:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      MMC high-speed timing is supported.
+
+  sd-uhs-sdr12:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR12 speed is supported.
+
+  sd-uhs-sdr25:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR25 speed is supported.
+
+  sd-uhs-sdr50:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR50 speed is supported.
+
+  sd-uhs-sdr104:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR104 speed is supported.
+
+  sd-uhs-ddr50:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS DDR50 speed is supported.
+
+  cap-power-off-card:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Powering off the card is safe.
+
+  cap-mmc-hw-reset:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC hardware reset is supported
+
+  cap-sdio-irq:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      enable SDIO IRQ signalling on this interface
+
+  full-pwr-cycle:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Full power cycle of the card is supported.
+
+  full-pwr-cycle-in-suspend:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Full power cycle of the card in suspend is supported.
+
+  mmc-ddr-1_2v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC high-speed DDR mode (1.2V I/O) is supported.
+
+  mmc-ddr-1_8v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC high-speed DDR mode (1.8V I/O) is supported.
+
+  mmc-ddr-3_3v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC high-speed DDR mode (3.3V I/O) is supported.
+
+  mmc-hs200-1_2v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS200 mode (1.2V I/O) is supported.
+
+  mmc-hs200-1_8v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS200 mode (1.8V I/O) is supported.
+
+  mmc-hs400-1_2v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS400 mode (1.2V I/O) is supported.
+
+  mmc-hs400-1_8v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS400 mode (1.8V I/O) is supported.
+
+  mmc-hs400-enhanced-strobe:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS400 enhanced strobe mode is supported
+
+  no-mmc-hs400:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      All eMMC HS400 modes are not supported.
+
+  dsr:
+    description:
+      Value the card Driver Stage Register (DSR) should be programmed
+      with.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffff
+
+  no-sdio:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Controller is limited to send SDIO commands during
+      initialization.
+
+  no-sd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Controller is limited to send SD commands during initialization.
+
+  no-mmc:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Controller is limited to send MMC commands during
+      initialization.
+
+  fixed-emmc-driver-type:
+    description:
+      For non-removable eMMC, enforce this driver type. The value is
+      the driver type as specified in the eMMC specification (table
+      206 in spec version 5.1)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 4
+
+  post-power-on-delay-ms:
+    description:
+      It was invented for MMC pwrseq-simple which could be referred to
+      mmc-pwrseq-simple.yaml. But now it\'s reused as a tunable delay
+      waiting for I/O signalling and card power supply to be stable,
+      regardless of whether pwrseq-simple is used. Default to 10ms if
+      no available.
+    default: 10
+
+  supports-cqe:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The presence of this property indicates that the corresponding
+      MMC host controller supports HW command queue feature.
+
+  disable-cqe-dcmd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The presence of this property indicates that the MMC
+      controller\'s command queue engine (CQE) does not support direct
+      commands (DCMDs).
+
+  keep-power-in-suspend:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SDIO only. Preserves card power during a suspend/resume cycle.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SDIO only. Enables wake up of host system on SDIO IRQ assertion.
+
+  vmmc-supply:
+    description:
+      Supply for the card power
+
+  vqmmc-supply:
+    description:
+      Supply for the bus IO line power, such as a level shifter.
+      If the level shifter is controlled by a GPIO line, this shall
+      be modeled as a "regulator-fixed" with a GPIO line for
+      switching the level shifter on/off.
+
+  mmc-pwrseq:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      System-on-Chip designs may specify a specific MMC power
+      sequence. To successfully detect an (e)MMC/SD/SDIO card, that
+      power sequence must be maintained while initializing the card.
+
+patternProperties:
+  "^.*@[0-9]+$":
+    type: object
+    description: |
+      On embedded systems the cards connected to a host may need
+      additional properties. These can be specified in subnodes to the
+      host controller node. The subnodes are identified by the
+      standard \'reg\' property. Which information exactly can be
+      specified depends on the bindings for the SDIO function driver
+      for the subnode, as specified by the compatible string.
+
+    properties:
+      compatible:
+        description: |
+          Name of SDIO function following generic names recommended
+          practice
+
+      reg:
+        items:
+          - minimum: 0
+            maximum: 7
+            description:
+              Must contain the SDIO function number of the function this
+              subnode describes. A value of 0 denotes the memory SD
+              function, values from 1 to 7 denote the SDIO functions.
+
+    required:
+      - reg
+
+  "^clk-phase-(legacy|sd-hs|mmc-(hs|hs[24]00|ddr52)|uhs-(sdr(12|25|50|104)|ddr50))$":
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 359
+      description:
+        Set the clock (phase) delays which are to be configured in the
+        controller while switching to particular speed mode. These values
+        are in pair of degrees.
+
+dependencies:
+  cd-debounce-delay-ms: [ cd-gpios ]
+  fixed-emmc-driver-type: [ non-removable ]
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 23884b8184a9df2da3bda5f86916f2e0a5d502bf..99c01ce318d3e5aa914ed9b1b71e620538eef29b 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -18,351 +18,13 @@ description: |
   (and the corresponding mmcblkN devices) by defining an alias in the
   /aliases device tree node.
 
+$ref: mmc-controller-common.yaml#
+
 properties:
   $nodename:
     pattern: "^mmc(@.*)?$"
 
-  "#address-cells":
-    const: 1
-    description: |
-      The cell is the SDIO function number if a function subnode is used.
-
-  "#size-cells":
-    const: 0
-
-  # Card Detection.
-  # If none of these properties are supplied, the host native card
-  # detect will be used. Only one of them should be provided.
-
-  broken-cd:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      There is no card detection available; polling must be used.
-
-  cd-gpios:
-    maxItems: 1
-    description:
-      The card detection will be done using the GPIO provided.
-
-  non-removable:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Non-removable slot (like eMMC); assume always present.
-
-  # *NOTE* on CD and WP polarity. To use common for all SD/MMC host
-  # controllers line polarity properties, we have to fix the meaning
-  # of the "normal" and "inverted" line levels. We choose to follow
-  # the SDHCI standard, which specifies both those lines as "active
-  # low." Therefore, using the "cd-inverted" property means, that the
-  # CD line is active high, i.e. it is high, when a card is
-  # inserted. Similar logic applies to the "wp-inverted" property.
-  #
-  # CD and WP lines can be implemented on the hardware in one of two
-  # ways: as GPIOs, specified in cd-gpios and wp-gpios properties, or
-  # as dedicated pins. Polarity of dedicated pins can be specified,
-  # using *-inverted properties. GPIO polarity can also be specified
-  # using the GPIO_ACTIVE_LOW flag. This creates an ambiguity in the
-  # latter case. We choose to use the XOR logic for GPIO CD and WP
-  # lines.  This means, the two properties are "superimposed," for
-  # example leaving the GPIO_ACTIVE_LOW flag clear and specifying the
-  # respective *-inverted property property results in a
-  # double-inversion and actually means the "normal" line polarity is
-  # in effect.
-  wp-inverted:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The Write Protect line polarity is inverted.
-
-  cd-inverted:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The CD line polarity is inverted.
-
-  # Other properties
-
-  bus-width:
-    description:
-      Number of data lines.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 4, 8]
-    default: 1
-
-  max-frequency:
-    description: |
-      Maximum operating frequency of the bus:
-        - for eMMC, the maximum supported frequency is 200MHz,
-        - for SD/SDIO cards the SDR104 mode has a max supported
-          frequency of 208MHz,
-        - some mmc host controllers do support a max frequency upto
-          384MHz.
-      So, lets keep the maximum supported value here.
-
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 400000
-    maximum: 384000000
-
-  disable-wp:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      When set, no physical write-protect line is present. This
-      property should only be specified when the controller has a
-      dedicated write-protect detection logic. If a GPIO is always used
-      for the write-protect detection logic, it is sufficient to not
-      specify the wp-gpios property in the absence of a write-protect
-      line. Not used in combination with eMMC or SDIO.
-
-  wp-gpios:
-    maxItems: 1
-    description:
-      GPIO to use for the write-protect detection.
-
-  cd-debounce-delay-ms:
-    description:
-      Set delay time before detecting card after card insert
-      interrupt.
-
-  no-1-8-v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      When specified, denotes that 1.8V card voltage is not supported
-      on this system, even if the controller claims it.
-
-  cap-sd-highspeed:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD high-speed timing is supported.
-
-  cap-mmc-highspeed:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      MMC high-speed timing is supported.
-
-  sd-uhs-sdr12:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR12 speed is supported.
-
-  sd-uhs-sdr25:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR25 speed is supported.
-
-  sd-uhs-sdr50:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR50 speed is supported.
-
-  sd-uhs-sdr104:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR104 speed is supported.
-
-  sd-uhs-ddr50:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS DDR50 speed is supported.
-
-  cap-power-off-card:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Powering off the card is safe.
-
-  cap-mmc-hw-reset:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC hardware reset is supported
-
-  cap-sdio-irq:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      enable SDIO IRQ signalling on this interface
-
-  full-pwr-cycle:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Full power cycle of the card is supported.
-
-  full-pwr-cycle-in-suspend:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Full power cycle of the card in suspend is supported.
-
-  mmc-ddr-1_2v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC high-speed DDR mode (1.2V I/O) is supported.
-
-  mmc-ddr-1_8v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC high-speed DDR mode (1.8V I/O) is supported.
-
-  mmc-ddr-3_3v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC high-speed DDR mode (3.3V I/O) is supported.
-
-  mmc-hs200-1_2v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS200 mode (1.2V I/O) is supported.
-
-  mmc-hs200-1_8v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS200 mode (1.8V I/O) is supported.
-
-  mmc-hs400-1_2v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS400 mode (1.2V I/O) is supported.
-
-  mmc-hs400-1_8v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS400 mode (1.8V I/O) is supported.
-
-  mmc-hs400-enhanced-strobe:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS400 enhanced strobe mode is supported
-
-  no-mmc-hs400:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      All eMMC HS400 modes are not supported.
-
-  dsr:
-    description:
-      Value the card Driver Stage Register (DSR) should be programmed
-      with.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 0xffff
-
-  no-sdio:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Controller is limited to send SDIO commands during
-      initialization.
-
-  no-sd:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Controller is limited to send SD commands during initialization.
-
-  no-mmc:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Controller is limited to send MMC commands during
-      initialization.
-
-  fixed-emmc-driver-type:
-    description:
-      For non-removable eMMC, enforce this driver type. The value is
-      the driver type as specified in the eMMC specification (table
-      206 in spec version 5.1)
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 4
-
-  post-power-on-delay-ms:
-    description:
-      It was invented for MMC pwrseq-simple which could be referred to
-      mmc-pwrseq-simple.yaml. But now it\'s reused as a tunable delay
-      waiting for I/O signalling and card power supply to be stable,
-      regardless of whether pwrseq-simple is used. Default to 10ms if
-      no available.
-    default: 10
-
-  supports-cqe:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The presence of this property indicates that the corresponding
-      MMC host controller supports HW command queue feature.
-
-  disable-cqe-dcmd:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The presence of this property indicates that the MMC
-      controller\'s command queue engine (CQE) does not support direct
-      commands (DCMDs).
-
-  keep-power-in-suspend:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
-
-  wakeup-source:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SDIO only. Enables wake up of host system on SDIO IRQ assertion.
-
-  vmmc-supply:
-    description:
-      Supply for the card power
-
-  vqmmc-supply:
-    description:
-      Supply for the bus IO line power, such as a level shifter.
-      If the level shifter is controlled by a GPIO line, this shall
-      be modeled as a "regulator-fixed" with a GPIO line for
-      switching the level shifter on/off.
-
-  mmc-pwrseq:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      System-on-Chip designs may specify a specific MMC power
-      sequence. To successfully detect an (e)MMC/SD/SDIO card, that
-      power sequence must be maintained while initializing the card.
-
-patternProperties:
-  "^.*@[0-9]+$":
-    type: object
-    description: |
-      On embedded systems the cards connected to a host may need
-      additional properties. These can be specified in subnodes to the
-      host controller node. The subnodes are identified by the
-      standard \'reg\' property. Which information exactly can be
-      specified depends on the bindings for the SDIO function driver
-      for the subnode, as specified by the compatible string.
-
-    properties:
-      compatible:
-        description: |
-          Name of SDIO function following generic names recommended
-          practice
-
-      reg:
-        items:
-          - minimum: 0
-            maximum: 7
-            description:
-              Must contain the SDIO function number of the function this
-              subnode describes. A value of 0 denotes the memory SD
-              function, values from 1 to 7 denote the SDIO functions.
-
-    required:
-      - reg
-
-  "^clk-phase-(legacy|sd-hs|mmc-(hs|hs[24]00|ddr52)|uhs-(sdr(12|25|50|104)|ddr50))$":
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-    minItems: 2
-    maxItems: 2
-    items:
-      minimum: 0
-      maximum: 359
-      description:
-        Set the clock (phase) delays which are to be configured in the
-        controller while switching to particular speed mode. These values
-        are in pair of degrees.
-
-dependencies:
-  cd-debounce-delay-ms: [ cd-gpios ]
-  fixed-emmc-driver-type: [ non-removable ]
-
-additionalProperties: true
+unevaluatedProperties: true
 
 examples:
   - |

-- 
2.34.1


