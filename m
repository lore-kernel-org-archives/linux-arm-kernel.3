Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C046DD5B169
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 23:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9yoT0f7ot31AnsAa6tAG2J9yqkpoDFMArAPTB0wTZw=; b=Fz0BZWNmHAn5HqmQGQS59I4Nvt
	gBBPqbALUwWt8ZgrWYGhtG/7I/iHdfnPjqc4b24m18UfRj2LaveB5Te7wdwMa7n4Y78y3V5YAU8aL
	GT2CUWRIg3e22YGWb7aQmWQw28RM/qbZF9/aMaDwryHhVm5we2bAOzdNKa0vtAI9VigSenQ93XpFI
	7Y0oGpw5tp921L2BT8lc/9LBEbbAXSgCY5xfCy7R9IM+dQllwtWZfuXmYou93OKWp1v//G9Pib3w+
	cQKfYmEeAHwiDWeo6xRTkaD3d+cbi6MN/HgQbScxnQKPnYIVlqTh8eE5miU/MwL4iw7vgsUtk6bkO
	G9AXIpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk1-00000001yl6-0tz3;
	Sat, 13 Dec 2025 23:09:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYjy-00000001yk4-2ez4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 23:09:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso28647945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 15:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667368; x=1766272168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9yoT0f7ot31AnsAa6tAG2J9yqkpoDFMArAPTB0wTZw=;
        b=fsEsokkUywx1qFfRUJ8YXhuzFFQ7SJrU2c7pDFrhyU0P/rPnDNIY+rp3LP/aGuO2Q2
         g6GMnRW5QiXuf8wGWUbmGsAEvSTj1XwXrY0D6GK2sK55uwDh8p3i+NgGrT4drgOURcD+
         gedWhEHVSk0Oy79OwcgfnJXGlN/45J2PAMfbXSQ8s6JakZ6dBE4U3Y24eTnQCFVYbORM
         qjel8PdK0FZtDjWCEmO9wS2LmpK6YxbGUXlUFwlrlITHgbDYPPTIX24vQugfcbLKlJ1u
         okzqvR7DXkZZ7qApG7WchXqSzjdh6vpCCdRBrYWeo5kzWL4SGxxyQuygQpzl5CkrH46I
         bDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667368; x=1766272168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9yoT0f7ot31AnsAa6tAG2J9yqkpoDFMArAPTB0wTZw=;
        b=Sm8TqQ5Qvmg6fuWKi6CAPCwSMDAEnHh8V/gMVTb5eV0wUuBYDCamNQAOco95jiKEZl
         LLdjwHO5AjLjhQ15BzVRh0K/HW1LCLa1yRu2fsQF5Yv2ROibeZ0ToO+Hmo1OW0Yf1S9F
         uDRhhgTmiHwYEsjtLzyDreY+E7La/V+L71O2qnibwtAFcQMqIpJzcdsMt4h1xrtvFnpd
         YFcDr/CsoUd9lACGEKGix4nGjIMqcj2Q539fnHyyRr6BSwrgF3WXqozCy1i8R7B4g2oD
         dw4UpauDCjRGLgPhxzG/OshdzinJFjaCrYTQ0YdijoALo4Renvt9bd52HKhJDXRSxGn8
         yJaw==
X-Forwarded-Encrypted: i=1; AJvYcCWAigner9yij0foedJMdZW4C6A9TiFml+3ErIrctpuSYhMamf41H5nGQ94A9iNzY7mgg+VIVfh5SLzRCmJWluOp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10lVKOHZB+QYd06mlXE2H3+xrcptBp753m7Z1l+CCTiJTRPBc
	xfknmoIaU3utP17DgSvoHjE0aLaZUNrRu+nlyBDMiJJ3Htvt2aFzvG61
X-Gm-Gg: AY/fxX7LEH7xF8i+NSXv1u47nTq+6PU66YR8jwS+R2nuGVLOYUPfaY5YG4Yv1uQFu4Z
	K9QHoKc50ZQuz36U+hQ4Qo+SVrhQgbD/I11K4c5xW01ZPai1zSorEpadwNWIq1idI7zkb4DZ4cm
	Ng0tHrBWYKn9mGUNA82BeWtW3oa7obHLbuumAfGZGe0pCpnuTMgGFfg78xQ/dlM44Euq8xy4FJE
	QeIanpfCc0hKD1qWmcgiVHUrMZtEuzEylrBiV6wt+A38NkMcNAb5Y256wwIYqn70EiqnNY+X7u+
	aAzMZs30s+S1BB733sCGKjMC6EagJ5jVlpPIm2e8wkOfJmkSDKEZIi8eHJf2xTbTRUc2RFwdm9W
	8jJbHQaaAQ6z2mVfV0Dpsr8u1QlwKb0tqW0NaJ7WxoJs+aWPynvRv4fKjoT6+l0eqqJVKYWo6Ei
	3kAQDeUwp3OFzKU98REo7TZR172XQJ8tzuPZYKq/tIWH1vtCL9fMbqAFaqJnVllyOAF9IM1E9Cl
	rMe0EQv7coFqB1UCUxBPEvQ5A==
X-Google-Smtp-Source: AGHT+IGpEJxMWXJK0Z6xfBN3FbA9kMxSjh6i9r8YNRiqMHyGuLBmu3GkO2YQXNG94dpdEIrd70iVbg==
X-Received: by 2002:a05:600c:4f89:b0:477:7cac:508d with SMTP id 5b1f17b1804b1-47a8f8d22b4mr78828565e9.16.1765667367837;
        Sat, 13 Dec 2025 15:09:27 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:26 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Sun, 14 Dec 2025 00:09:00 +0100
Message-ID: <20251213230909.16810-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_150930_708212_65CBB2DD 
X-CRM114-Status: GOOD (  10.36  )
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

This patch series aligns the VAR-SOM-MX8MP device tree with the actual
hardware populated on the System-on-Module, and separates SOM-specific
descriptions from carrier-board-specific ones.

The first three patches move the USDHC2 interface, the PCA9534 GPIO
expander, and the UART2 debug console out of the SOM dtsi, as these
components are not present on the VAR-SOM-MX8MP module itself and are
instead routed on the Symphony carrier board. Their descriptions are
therefore provided in the carrier board DTS, keeping the SOM device
tree limited to on-module hardware.

The remaining patches add support for peripherals that are populated
on the SOM and commonly used across designs, including WiFi/Bluetooth
connectivity, the WM8904 audio codec, and the ADS7846 touchscreen
controller.

Overall, this series ensures a clear separation between SOM and carrier
board responsibilities in the device tree, avoids describing
non-existent hardware on the module, and enables key on-module
features.

v2:
 - Move deleted nodes from SOM dts to Symphony carrier board

Stefano Radaelli (6):
  arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
  arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
    carrier
  arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
  arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
  arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
  arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen

 .../dts/freescale/imx8mp-var-som-symphony.dts | 145 ++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 332 +++++++++++-------
 2 files changed, 356 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3


