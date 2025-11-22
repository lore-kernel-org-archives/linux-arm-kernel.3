Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B938FCFC521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Qr1XZc6ev5PJXNcXgSUGaM77iliFZ4AKyDLqJnKDJg=; b=4zW0zCQ+K84YW0XfUusUV/Y2I0
	MTfHEsu2t/iLcvGuyrIHqFZ7Gbxu8eDalQ5Ubu43cicWj95lIWKDBo6df33WzjE2Yz5WQCd5nsBSt
	MH5CYwcpwLwcK0KphzMXyy03QjQI8cFtgFbP+n2S5IsarSvCllGcVXIW5l0p0XYE0E5Sdp5GklK3t
	wh4CO5Knj40AUqHmZZFMis0LgmSPVjnVFTj30M7wQqH40Hrn8KcRWcOSlmYIpePRLUgNUeVJ7ZKBI
	+tZTwVMaBGlmSRyxq6262hxofo4oSAMzrHRz5r51MRo5kpf9acc2lTqqS13wmOpQGSMfJQbUKrzOl
	yvpD4RZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjyg-00000009QEn-0448;
	Sat, 22 Nov 2025 09:32:22 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjyd-00000009QDp-2XmE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 09:32:20 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so6304386b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763803938; x=1764408738; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Qr1XZc6ev5PJXNcXgSUGaM77iliFZ4AKyDLqJnKDJg=;
        b=bY31alfTANX35dIDlJ9O1H+QxMj69TrBGmK5XxD5+SXDT6KFvlqvY3Mc1JUg+L0g2T
         zicft+FoMYP6es5SVdcXLwap5F9a4uzK5rywOxkAo9/w2LwxHMu/ChBMnPkcURauPJ3+
         QvmWERS9v2IKN2a42giLwsYbgdcpEOHTqAHCJ8dSAQZ9+CQOxyhLbrLEUyS7RizE58aN
         DFkdEuCWMelJBFQIGiRd1py/qzvhwWLVmLaIoQcah/wjL02/7icqjbYw8uj1GbJ7Wt2D
         jTVB14sfPxo+hH/XoSWJv9GvWQoDLrSIJYeta1N+go8MeAG0VF29zPnXdBoNyIKH+XgO
         VEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803938; x=1764408738;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Qr1XZc6ev5PJXNcXgSUGaM77iliFZ4AKyDLqJnKDJg=;
        b=UhSJ9sx2AiYVOIKHccaoBvcGMmwBkvRoP1Cd+5UzaMJPfJFRL6dJfGaACAEuI8KKVu
         wQDKNIw78l0r6SfkKD1ApKR/aeHRS9QHzfE1OB4cAXSIvNGVy+7VY/xE5q2xnYTqi01m
         JPzf5OOYRKNu4oNZn4NAEnp/qPiWAaekN5quinVI4pClKmh0mDpgJmjX/2HywsYaWk4N
         UQOqOEgGufVMsTVmjN8EVuLTXXpxclZH46BT4lzTDawoVh2lZBLMzkjs5jh+nWcnAuo1
         S0jlCdirsiOmeAU/+ZN6rZzKXvS/oJHgO9fV3ezJ4Nf50CMMzxPsoKUCo+b2P3GGtiL8
         Lu3w==
X-Forwarded-Encrypted: i=1; AJvYcCWNGac9vPHK/7hX/2W8Y6mKQmUWk/moVqENgHpRMYoTG9r7iq87d193n4qtHZEqyQ5eIoKCWYnC0/e/t0VNVI/c@lists.infradead.org
X-Gm-Message-State: AOJu0YwtrW0CErWh74LVe4MEs/vCadFyXktadjT6cjOwfJ/qPFqztBAG
	Qv1VHx+EPLuZUXPM8DGFe65Dly3YKSY6gGywOdS5FUgFzO0hr3xzduTjQcNIhTMzH5HbhROMJEx
	khiujTQ==
X-Google-Smtp-Source: AGHT+IFg6ZgrRXBiJXLQPAtRI2PxbDQWmg0QRjQGMj3ytZs2rF/E1F4c8P3UFoCetAorKDd9pzUqpyTHP9U=
X-Received: from dlbcq18.prod.google.com ([2002:a05:7022:2492:b0:119:78ff:fe0f])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4288:b0:119:e569:f270
 with SMTP id a92af1059eb24-11c9d8530c2mr2454577c88.25.1763803938044; Sat, 22
 Nov 2025 01:32:18 -0800 (PST)
Date: Sat, 22 Nov 2025 09:32:04 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABWDIWkC/03MQQ7CIBCF4as0s5YGsBVx5T2MiwpTSkKZZqhG0
 /TuElfmrb7F+zcoyBELXJoNGF+xRMoV50MDbhpyQBF9NWipe6W0Fo7yypQSslDaPqT3vRlMB/W wMI7x/Yvd7tUj0yzWiXH4Sygr7dF0ttW27iSUYPqkJ10DUUjYOpph37/ydFcomAAAAA==
X-Change-Id: 20251122-controller-129b0dd57a74
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763803936; l=3975;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=oJgoRCcsl7Ld3GyB5zmfSn3D/dubRzVSvimNvflfqL8=; b=eXkpcKtxNEknJRDqkFeDEcWxN1Qv5VDUMbjbIGCYpqoA3dLbDO6Nf86SkmHY4nPpnk9jNbl+8
 KMHTxP0/FLGBBgaDMmnRJpARGwDDNL6MWqFuzfqTC8I3+6/h6b5LBBg
X-Mailer: b4 0.14.2
Message-ID: <20251122-controller-v8-0-e7562e0df658@google.com>
Subject: [PATCH v8 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_013219_668787_DCA45D5B 
X-CRM114-Status: GOOD (  15.79  )
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
 drivers/usb/dwc3/Kconfig                           |  13 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-google.c                     | 628 +++++++++++++++++++++
 4 files changed, 782 insertions(+)
---
base-commit: 8b690556d8fe074b4f9835075050fba3fb180e93
change-id: 20251122-controller-129b0dd57a74

Best regards,
-- 
Roy Luo <royluo@google.com>


