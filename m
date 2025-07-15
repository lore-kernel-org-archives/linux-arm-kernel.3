Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56951C83F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EyhYMDLqwXgcBfbbxVXjHy0ZVk3xruqBs+IQYUNqyDE=; b=FRAx725znqtIcgnTYcWsI30O9s
	Q1F4bUVLfg+SrNlXr5sD7Oilr6WO4UX0obiMWSsb6sszGrZ+RFHgX3su4wPb9JtblrZxWRe9XXifa
	623w2DeXZ+gwMCn2FNR2BlkxS9C1//Qqsudacp8zdK0pogNRFb384JoenizMblWupqFU/pu559lQM
	hck33ozk61r/ps7LtXQ9fOO8ozSJc78H6QnHPnneVWR1Z6aEXgMpebhndkdHAjMpZyQVLdys9pE7b
	rkaQyKuf/pcLQm1+SdnDvJWhhiTYO2HS+725k8coWMWiVrnXrnsJNtKSzstzEUYR8T+RYZmfUlxNq
	Z551QxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6p-00000005xqO-3FW7;
	Tue, 15 Jul 2025 19:14:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgPP-00000005KKg-3Sv9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:13:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3198139f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1752588806; x=1753193606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EyhYMDLqwXgcBfbbxVXjHy0ZVk3xruqBs+IQYUNqyDE=;
        b=aTZTs8/BIFE/Bzy9ovaVV50HtpbdkfSvOoaAWwtO90yHMeGdipE6RGrd6ucQcLOz52
         gdjM6HKSKVDy4uVZ69Bv8yzjAAUjrznAs0EComxhWA1Nj0R9SJxGDj1kE7gcPdYPnqdw
         rBrhDvrVe0NoIuWyU8L1gDjB6YXjPo8G0+HZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588806; x=1753193606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyhYMDLqwXgcBfbbxVXjHy0ZVk3xruqBs+IQYUNqyDE=;
        b=v66kVY0lXxEqbu/uf7jBliEpePnGtXDKfXoX9S6JLPA0a7MhgUmTGDkMMvxQ3QFgOC
         TJdjK2wY15uAG+ulbaFvqb9Ff8SObbQYTO5EQovdxjxfSzAkpDUwMgKm21vtv1CKhWWW
         X6iP81NLKYwlBDl8ErVkI/dZ+Scm51CJeF4gKsLQwnDIOs4Lz8g1HKKkYCH3FmPnn62l
         sUngTtj4sYaGqAWZZPZ1qd3Y6aBHnI8vfj4mlZW0caVSS9L5rGtMHgGWWNeCvDzdthfK
         V+H3YGKyugLkAh4Q/VC8T0jBmoYF5RfC7yPZ5Lly+GaDoLBhY0MBwQHffKzVerp/AOwT
         50EA==
X-Forwarded-Encrypted: i=1; AJvYcCUfv2KEFi90YibfPTF7rid6NrDB85eDtM5xwnes5hydexM8GMuDQqwxYIEvweyDDWB3VOTKw5ldZv+bQP6e4Xv6@lists.infradead.org
X-Gm-Message-State: AOJu0YyaotxhdDqaIbM/UXA6s2RWjedjdNCX6IxHyI/09s4xQn2LD/Cv
	HEoEwmoTALhzfZcXLv8qq75VIhbCiKFGcCtSFrp/J4nDDA70PKu7krAhvyZKcd+qWhs=
X-Gm-Gg: ASbGncs42EmFItpLTDdb7xm0O5IJru4h+dwXH0PmTVal4oJsDwyu3xJZkRmZKXlYv2g
	ria519wvglxWGmjdE31A/yYEwITm4sNRoHVis/pfnBHhDC1D3EAV5G8vf6YTkggouQfA1JHY7rf
	k3cEMENfW3zZqzmOctiuv8WsnMBtRj5wvEPQzraBLIbnpwnh+gm2cZHFaCAxrEN3OZ9Mm7WfbLJ
	SuEIRoc4yVHIXlpAiQ1FYJ+PJKESYhqJeFbqgtt4xZt/lxHmzp5olpAHAmOYDJZVyqWtJtZ7iPK
	bA8YVdBErrN4+dVfVgjYap10ZE7ItCeXjiy5uDzac5UwzkWF0j/eAV/iO9ITgr7pVNroyIaLDXb
	WgL0CIBtVJRQgLU94aF6/5LLKhaImPFcmu4kEF8kQZF0R/UA7qFDdSfD08St5S3tNE4Av9qRPYl
	irw6fSVnSYKcEg
X-Google-Smtp-Source: AGHT+IFxM20bqobvrOmTpeuI6kCK6N804fuZxfrBaPXGOvFhMW/WLgasuyeSoviyvYEo3idTS5/aaw==
X-Received: by 2002:a05:6000:24c6:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3b5f187a48cmr12925840f8f.12.1752588805687;
        Tue, 15 Jul 2025 07:13:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26daasm15579557f8f.91.2025.07.15.07.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:13:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: fix resume via console
Date: Tue, 15 Jul 2025 16:13:10 +0200
Message-ID: <20250715141322.1305512-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_071327_869566_99216DBE 
X-CRM114-Status: GOOD (  12.46  )
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Despite the current configuration being compliant with the technical
reference manual (TRM), testing on the system showed that resuming from
suspend via UART4 (used as the console) fails unless any other UART
is also enabled.

In our use case, UART2 is enabled to ensure reliable resume when UART4
is used as the console.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Improve commit message
- Drop patches:
  - 1/3 ARM: dts: imx6ulz-bsh-smm-m2: Enable hardware rng
  - 3/3 ARM: dts: imx6ulz-bsh-smm-m2: Update wifi/bluetooth pinctrl

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 6159ed70d966..2d9f495660c9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -33,6 +33,10 @@ &snvs_poweroff {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-- 
2.43.0


