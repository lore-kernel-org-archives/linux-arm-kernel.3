Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4354FE9B36F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2rDUb9e+S6LVzbXGDafH6Ju6lYi+mwgweBRhLhcVRjo=; b=DnjhmVqpm+rht99WIQliHkyXc2
	Cj8yherpE4Qng/f5B9XOQwMjRIic6rOHBBMj1SUoaunqX71cVAXRFdCeSNusgkTFg0uL3XMaDFz9u
	GITch0I1MT1jqjuTKJf4aY+oxw/Gv516wEdnplD0KY/l/n+o0NmCcQNCNxtF2gjaqvrh0yZKFmxhl
	0lA8c7dYiMqnJVP8w29E1A/rT3EJRRLPSsIjraiCSzJWbE5pYrdDw9yoyXWZab9NhfgJKU2YXh0NY
	ctnP5RVLjUFmef2adwDgLnVJfLw+CPIBfddAUK6Q2xvRk3nxSJfNR336/ECU9xoFI/iGSf4NuaXlp
	wcec7XVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Uj-0000000Czlx-1EJq;
	Mon, 02 Mar 2026 12:35:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Uf-0000000Czkr-4ADG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:35:27 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-65f94011dfaso7707900a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772454923; x=1773059723; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2rDUb9e+S6LVzbXGDafH6Ju6lYi+mwgweBRhLhcVRjo=;
        b=H7l7fCavsFDJ3HRJ+xHryVxgKfK/YblUJwuITcSlUa6lVBrqIyDxG+MplYe2Ovp63g
         5ZBLrTGF5WHG57Xpcnx2HWviPRjbLQ6IyryWXjsDDz7O9T3Et8gK+sRKvDs1r1Ga39uT
         z0//N5UKiy3Xoii6MjPw0WPoY4x1vAg5wwoFA5k4xLeYp2wuA3UovQMCkx6Yaf91izHj
         La+2JmN0c1SN7rMAbXLSkCjcLo55gz/MOKDSte0QoLD+STAmxeViiH2KqU30lXI1LQLi
         +/a98QoIZDnS6XlN971YNaMAFfQzbvo/tzj3VR3C3w16T6+5eUDxa/Rq3X2p4exdPMb7
         xbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454923; x=1773059723;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rDUb9e+S6LVzbXGDafH6Ju6lYi+mwgweBRhLhcVRjo=;
        b=reT+FCzXDEX+ufyq79ej6ELYxnuAImP4yR+HJYKXIyFEvjnaezWeDJqe4W5MPNq7zt
         xKHAbi6a4hVd+JOIv6unvI32ZHoC9cmumx/mAKpnB7mXMP+GRjZ5J5WALDes8p1b8M3T
         3LINRAfuGVT4aH5w4pm6VPX944VVuApJ/SxtZZbwZifT9yOk08W8+XUDfJl6tpjmu/Ik
         3ln4isarM+Y/DEfBOrnVA/hVgdQrycTQ2MkXxpdBUXazfq1kSNJEMXUlDSY+asg5Ugnl
         APJABix9eBIU0woTQ/FVIAQuiFN9GUF44kwK+lIf9oMA7ziueOGj5PUHPzcxP30L3Sxc
         yZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVac9h/lzt8FADo4m1pz1KnUf7wM0zMeJPNhRBs8aEnRUxKKUVsiZ/HbPCsUhvFW+uIZ0siH4NutWNIAI8dRTUk@lists.infradead.org
X-Gm-Message-State: AOJu0YxgpspqwQQS2YsN6LAbZu5FsNO+l9GGAxd0Hsf1UEYJnrkZCf9s
	b/TGhO0oEM/GAwRTjDj+kcxcCnnTzySCELFqLzRoIZSxT/gQ49YJHwgZ3WQ5+KCePPM=
X-Gm-Gg: ATEYQzzZZ23m45fFbrrbXzCRgLc/a4bkVOVwGZJGdXdBwJyA72nWlX2kiRV0AJuqXJh
	MthE2r7GguY29UjFkg+SxP+/0ZodYvhkWqPTskHc7Spmo9hR2hk2bhxi8cIUrgFnik9sSOKz9XR
	nGDouSQ/E8pEHzz8wuTZZgfrmEPbxT4kEG6OEdIrJOTRBRB+WZYra4LNsAHZMHxQ401crDAkqFN
	zDdaiKRM0IrPrtwOeZLsf3Q3QoVofjSk3L3Vidm8XcT7q9H6HLZ4kW5nYgkpLCp+0vPHc4XjHNs
	zU13VhlDpbACiVln0UKX47CS5o+XOC+lRqcNvKvDLzRdkAHH9CQclDAbXkpgTcC5IO6nsijLumu
	BUxtiWqPulAb5iTKEQAKQ2hCqhjZiz5yb8N6eRGkk4Hq/zi4/13O+52f/TlgJmNNe0Y+b385UtT
	R3LZAwpN3Ags2vSaAbT9cNWZ5nsaPxLg5JZEb8/gj/WxjmWnA1jlvhclkkkObEifvY0eLynSbnK
	rXlgLdozMkeUH8=
X-Received: by 2002:a05:6402:e8a:b0:65f:a9fa:cbab with SMTP id 4fb4d7f45d1cf-65fde0e6110mr6740003a12.32.1772454923452;
        Mon, 02 Mar 2026 04:35:23 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660057835e2sm1979643a12.18.2026.03.02.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:35:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 02 Mar 2026 12:35:22 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 fuel gauge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAmEpWkC/3WNQQrDIBRErxL+uhajjWJXvUfJQpMf86GNQYOkB
 O9em32Z1RuYNwckjIQJ7s0BETMlCksFcWlgmO3ikdFYGQQXiguh2dvuWuvOsMmzcUvMtQLd2Fn
 DnYS6WiNOtJ/GZ195prSF+DkPcvtr/7tyy2rU0Gkp0dzU8HjRYmO4huihL6V8AeyWI0mvAAAA
X-Change-ID: 20260227-max77759-fg-dts-b12ebd5a90b3
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, Amit Sunil Dhamne <amitsd@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_043526_062877_0FAB35EC 
X-CRM114-Status: GOOD (  11.34  )
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

On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO & NVMEM)
  * charger
  * fuel gauge
  * TCPCi

This change adds the fuel gauge.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- typo Maxin -> Maxim in subject
- collect tags
- Link to v1: https://lore.kernel.org/r/20260227-max77759-fg-dts-v1-1-16c5733e946c@linaro.org
---
For DT validation purposes, this patch depends on the binding updates
from https://lore.kernel.org/r/20260226-max77759-fg-v1-0-ff0a08a70a9f@linaro.org
They have been ACKed, but not merged yet.
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..c01fec7c867d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -225,6 +225,17 @@ usbc0_role_sw: endpoint {
 		};
 	};
 
+	fuel-gauge@36 {
+		compatible = "maxim,max77759-fg";
+		reg = <0x36>;
+
+		pinctrl-0 = <&if_pmic_fg_int>;
+		pinctrl-names = "default";
+		interrupts-extended = <&gpa9 3 IRQ_TYPE_LEVEL_LOW>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+
 	pmic@66 {
 		compatible = "maxim,max77759";
 		reg = <0x66>;
@@ -317,6 +328,13 @@ pmic_int: pmic-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
 	};
 
+	if_pmic_fg_int: if-pmic-fg-int-pins {
+		samsung,pins = "gpa9-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260227-max77759-fg-dts-b12ebd5a90b3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


