Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED8CD2CE0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 02:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTK8vEFI0CjLxRcJubNhZxVfYVJdPu7BvYrObwAnRlU=; b=FrghUbIJPwuX4ysAE/6x7TyyZl
	aPdn6JfYk/DBGXM0Kxf+9ulujI+YBwTGiPBOSw/agmsWTKGn6U7PnpSTnesugYOUwvAMUMVRZ6dB9
	U8ikrl8Xk0GSKnCVSQs0P+PgeRdPERxO5hpf4btZuAO8CHp1Oe6hPCgOt7uf8DkNCg+QuKW3hFoN5
	O1aNWr6nneRptxcDcmO3mnzvO9uigkl/34QJWcgA//UL0x0tWlzNw0sZ84hsg5OIR9LsNL8txjX0n
	8fZ7/1sijEtEkzuACCdAmWSTCrH+Z8/6C4KdXNbNpz2zcluT5QLO3qhqqLgKmxOnriHXseCGzAWIQ
	wtfT+xUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRLXN-00000008uor-3jkm;
	Fri, 05 Dec 2025 02:27:13 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRLXL-00000008uni-0S8S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 02:27:12 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b90740249dso2519776b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 18:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764901630; x=1765506430; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yTK8vEFI0CjLxRcJubNhZxVfYVJdPu7BvYrObwAnRlU=;
        b=12RdamjFbuUWMJdVS4InaOVCGRfQX/ynDzkQ3v/y7wgvkSO7hCUX/b6UNGhZrRsd9b
         4sampVWtCuI5tAeIHaHF0kAHOeQQvo7vQYJGvEpNofAO0JtkMZWUDaZXoV5Ax2nFeFFg
         qkt9ynz6lsKcVpi1ycRwBplzGivlGtFjj4djNJKXUa7TNXaRPlCTJzfM9vuVw88i1Pph
         OgFH+hj1lxFq4vL7h6oap8rBh+QFyvnmxMTplskVbm4iNyuxU1kavQIdaJxHN2rKsk7l
         V/ibWe/jwVlqJaV/OtEtlgoB/+jn3vKWThklEXoT5IaLUTwAq6JZhcaUDylzXuSfxnU3
         4ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764901630; x=1765506430;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTK8vEFI0CjLxRcJubNhZxVfYVJdPu7BvYrObwAnRlU=;
        b=jnt++304BS6If2AO5c8KsAh5eHU6PILo8qccUpt5Hn3kOY7oZEtWKhkEgEjMFEWUaW
         MQ2JOT98sCORyiU0gxFqioNS8s613IumPiMOCjIw7EFEdHMd78McfKTVnH1/81Wss/Ay
         zI1hseovsIGduR9h48hrsxq6wb8B5FxIWlYqUguKvMF6GMazW0YnYIueBJ70L3sJaqGf
         U3UUu0bc2saffah5NEjhJg1m2zYeahv/Np729US0huEJw/L41LwUcl6psBBIrPVuIYuS
         mn6tG3X0YgFNT/Pcg9xyWEot4MaHnr1qlDW8s1O5p4xiG0+jT0EZB+Bkt7fEbhBE17U3
         ZOWA==
X-Forwarded-Encrypted: i=1; AJvYcCXW4c2XWaXmWkNYDgkObOqjvjX197V8pkzuJ/XXPWQDtNhI150xYB6C2FWtJ1Y7Ob8zKHItitAMAvjHMfxsvgIf@lists.infradead.org
X-Gm-Message-State: AOJu0YzM3uxyQPKtoUdkPw8oSEDQO/kCJKkw344RKsTAH2VUF4g9qtMO
	HhliBRfvN3ifEAokvQehGcwsGEnoap4LJG+XOjcRtcvJUZKjRwfGOfcaD2aNA9NUKFagBHUL01o
	xbVgmZQ==
X-Google-Smtp-Source: AGHT+IGQ4LElx7uU5MBh+1/dyf/+KwM79ULhN+f14A5X68GyJqiRjIFMWicTRFECxPftMFDUJsVXFd5gFog=
X-Received: from pggr9.prod.google.com ([2002:a63:d909:0:b0:bac:6acd:818a])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3389:b0:2ca:1b5:9d45
 with SMTP id adf61e73a8af0-363f5e24b28mr9201790637.32.1764901629786; Thu, 04
 Dec 2025 18:27:09 -0800 (PST)
Date: Fri, 05 Dec 2025 02:26:36 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANxCMmkC/23OsQ6DIBDG8VcxzMUAFZFOfY/GwcqpJNRrDmtqj
 O9edHJobvoP98u3sgjkIbJbtjKC2UePYwp7yVg7NGMP3LvUTAmlpVSKtzhOhCEAcansUzinTWM
 Klh7eBJ3/HtijTt0Rvvg0EDQnQlphr6awubLpSi454RI+eO8R+wB5i6/dGnyckJZj11zt4t8Jc 8UFB6NLBcJ1pa7OTL1t2w+XTjb34QAAAA==
X-Change-Id: 20251122-controller-129b0dd57a74
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764901627; l=4580;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=TqvI1+EhfFR6oXIbUZQ/1JtyXdud1DfSeTXuuSX7Htw=; b=tAc00f4hLwjWG0tXrhMw8QTDqOQ4ehBNIMYAh5XNMTUu+/dvM5GEvhL+SpriE/+ad7y828DEc
 lkycZBv/X7UBzVBq4Gku4LmTNYD6mN1QkB/sZWAkz0LCDE1tC/OjPkE
X-Mailer: b4 0.14.2
Message-ID: <20251205-controller-v9-0-9f158b18f979@google.com>
Subject: [PATCH v9 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_182711_172423_BA25CD4D 
X-CRM114-Status: GOOD (  17.79  )
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

This series introduces USB controller support for the Google Tensor G5
SoC (codename: Laguna), a new generation of Google silicon first
launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v9:
- Update the Kconfig dependency to depends on ARCH_GOOGLE || COMPILE_TEST
  Note that ARCH_GOOGLE does not exist yet but will eventually
  be there when the following patch lands
  https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid/
- Mention SoC codename Laguna in Kconfig description.
- Sort the header alphabetically.
- Add driver and binding files to the Tensor SoC MAINTAINER entry.
Link to v8: https://lore.kernel.org/r/20251122-controller-v8-0-e7562e0df658@google.com

Changes in v8:
- Add COMPILE_TEST to dependencies for build coverage.
- Drop redundant default n in Kconfig.
- Update Kconfig help text to explicitly state the module name.
- Use container_of_const() in the to_dwc3_google() macro for type safety.
Link to v7: https://lore.kernel.org/linux-usb/20251119093749.292926-1-royluo@google.com

Changes in v7:
- Follow driver naming convention and rename the driver as "dwc3-google".
Link to v6: https://lore.kernel.org/linux-usb/20251112123257.3755489-1-royluo@google.com

Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org
Link to v5: https://lore.kernel.org/linux-usb/20251111130624.3069704-1-royluo@google.com

Changes in v5:
- Use syscon to access host_cfg and usbint_cfg MMIO space per
  discussion in https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org
- Make warn logs in dwc3_google_resume_irq() dev_dbg.
Link to v4: https://lore.kernel.org/linux-usb/20251017233459.2409975-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Rename dwc3 core interrupt as "core".
- Remove u2phy_apb clk/reset (moved to PHY)
- Configure usb2only mode when usb3 phy is not present.
- Adopt pm_ptr PM macros to fix build warnings.
Link to v3: https://lore.kernel.org/linux-usb/20251010201607.1190967-1-royluo@google.com

Changes in v3:
- Align binding file name with the compatible string
- Simplify the compatible property in binding to a single const value.
- Add descriptive comments and use item list in binding.
- Rename binding entries for clarity and brevity.
Link to v2: https://lore.kernel.org/linux-usb/20251008060000.3136021-1-royluo@google.com

Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/

---
Roy Luo (2):
      dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
      usb: dwc3: Add Google Tensor SoC DWC3 glue driver

 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++
 MAINTAINERS                                        |   2 +
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-google.c                     | 628 +++++++++++++++++++++
 5 files changed, 783 insertions(+)
---
base-commit: 43dfc13ca972988e620a6edb72956981b75ab6b0
change-id: 20251122-controller-129b0dd57a74

Best regards,
-- 
Roy Luo <royluo@google.com>


