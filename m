Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363A7FD9E3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G5LPcgnHDezYmAmQJ8ddEK0GxF+9IPAjtDeRxnNjo3E=; b=TccKv1yZ2FFb716JjKUsWOhdj6
	wVRZMuhVgGpeSBU9aMYfTR6tDsiNPRMFO/1TNAt/5ah2z+GWxcD3Adoc2GCSHKglRlBHIMPUq91T4
	jRsbrxc9JqVVE8pXsSa5NHATmMWa5FcELokMPYF3lVPC8FnlNJ/j+iPar5q9ILzzcqSprIS2HX+Vf
	xHd5QRolLChZBiQyzQJDHJtZsOLJ1p6V/WRvVvHeIp2a/mPnzKDnVDQY9xz/WFcQHOkUjc+1OPbY5
	9LpA7hzqASGqksYxrqdqpKT/wJcYd7B+qIOWW8IZBaPtTy4RmDHwYvPkbpDfYoV0PuneqGATBcCOx
	mspkMhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrFA-00000007lfz-3TRb;
	Fri, 27 Feb 2026 06:22:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrF8-00000007lfQ-16rp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:22:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b8d7f22d405so257889066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 22:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772173348; x=1772778148; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5LPcgnHDezYmAmQJ8ddEK0GxF+9IPAjtDeRxnNjo3E=;
        b=zP+Ripd7l3yAr/C3xtp8SG6cvzKQsApiDonsrZQJw6gGdarD8kWkrByyPvMlNQ3IaP
         C9Eyz0xHzGvbDl06GkwdNWw31E/GQL1K/k7T/dvMsUGN2tuNU+jXS0OcPtjM/eFHnzfk
         As7C3KFBuohR5pQttDbbQwpo5uwCa3hJQrLn8RPznio23b/gS+zwfDqjj99/sN3TmuXl
         kvZe1Q78tGCXxqTpCK+No9FSX8wJW2BXiIuln6Menn7T3jHQTzHcfJRPSixSfZ3L42Sk
         Oc9lMUJf5EdMPN96QVObLSgvTJX3yBhMU9Xg1ugFYluPoCOwgFo68NKLLGuW05YJVPR5
         Y7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173348; x=1772778148;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5LPcgnHDezYmAmQJ8ddEK0GxF+9IPAjtDeRxnNjo3E=;
        b=S7fLwBVHAGdC42Tc79NhgpuIyqnP/BaMg0wsq/l0P4glw52rRgUW3DFkczxziCz7Ez
         VHVrMsUBDaC72O6WmISEp8WF81g6Oje/oV3ZNW7qSyTsfuzDIUvC2r4gDcq+ZO/T7DMr
         qkfpvMqEQ/YHt0xBtthuIWhOvXzC31xFmT3GVPhA1pwtIu/lOykPWhc2kukAfy33GSLY
         +FCfpbQI4bpMvdY9Nouqk6yjCEoHVI1fEpiXHgnhIEBk8Va3pBKYEHuD9SA7pYgQVxK6
         GHmiG5RpGJJP58AtsI52sVoDu+oEal6QfUOizzKFFvYh4sQrVhNOZNlm1RRebKeuQMd9
         Yb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY/rfV7o+fXdJ6tVgXZXe6o7hBnWkqFLXlV7677sUmOmo+JDON0WULJQg5Gyp4PVzY0Nm1blyeutCrwXUiS2tH@lists.infradead.org
X-Gm-Message-State: AOJu0YxqElgMZrdWTWqvJfT5ZSOTxr+C8CtVU3QPBZRVz3LLEnID/n0F
	4UfU9wSUAoGiydY6WxmyeECHTqPrp81c6AQbgFh4/XDG45/42ePQbw07ZyJBeGi54EY=
X-Gm-Gg: ATEYQzyFfsjwE9jVpyFQDnIYDGMDbH9OrNIv2f4QFZ+JAY8uxI3uyELHxBeIS78YTQF
	MiPA2Erc4PXdSf67ivKgdDPr3KniWOZBlEQFvvpXCVpcAt1Epk1bvTXTw6bQa1JUw9KGmuOGFdW
	rFunlYct+CybJLBc/IekEzCxPyZlHq5VDE1HXdCEoXbdqPoE2jvk2g7c0mW81HE0yO9KvN2lequ
	nnOwq0O5vnQGz2MkJ2el+udl7UkBRU3VgxIuYNODRVo0SLZ9ZHyFO7Bj9ZDKSMaqTNZUQYi3mno
	seVD/kzSmIRlkFrzZ/DZow+MoOUzEXB8/04EfQHgzzCl86gr8B7wsYIQyb88glbl8ncKr5b1JgT
	7lyRhHIgfSeeyH8jcqFUZ9boi1gNu3cnCW/Gop1aLyg1kx96erz3NIninuJg9ly50/GkRwylTUA
	ZC5VNrr8bdeTWPeZXuRoABHdyBKAr/1CC0/6ySqQIhKCtT+Gp/Na2GIapAQgXYSVPBSCPZ2Ap/g
	Fqlt9G3Tqf8svWrPw==
X-Received: by 2002:a17:907:847:b0:b93:5ad2:c6b3 with SMTP id a640c23a62f3a-b9376365c9cmr103968666b.2.1772173348221;
        Thu, 26 Feb 2026 22:22:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm118432166b.44.2026.02.26.22.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:22:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Feb 2026 06:22:23 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add Maxin MAX77759
 fuel gauge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-max77759-fg-dts-v1-1-16c5733e946c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB44oWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNz3dzECnNzc1NL3bR03ZSSYt0kQ6PUpBTTREuDJGMloK6CotS0zAq
 widGxtbUAi+pzGWEAAAA=
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
X-CRM114-CacheID: sfid-20260226_222230_331210_7A31FB06 
X-CRM114-Status: GOOD (  10.14  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
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
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260227-max77759-fg-dts-b12ebd5a90b3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


