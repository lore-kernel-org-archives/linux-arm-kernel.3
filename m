Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A84C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq5LNL/kSi3uBykeBQ3vsMgUAnWMOb379Wxg3VYtEFQ=; b=FE3d5qzIdFJBRdrbI2DQUvt5dQ
	t305HM8hHsSFrQXKZJUGIxhOmrnT/r02PT0dxEjVWhb/7F68ObV147Q/0mK9hWbqI6A04ZtaxUVQs
	oUA73LD2VM7qGQmuBzKhtYfK0TU6slUI76cTiplsfbGWcE66rzCmE5TfL7nhAi+gAX+vCv4CFSWaY
	9PpcimKpYJFAmXMATdc9zZYb2aZdiCK7pi8olFO64MKYXk7fGFz+hQ1LyoQf0uxBGBH3TT912qHQq
	4fov8NmJ6ueuDnMNJn3R8z8lKkuqdEn7ww+n//PY/AWXubiONzW75b8u/KzKz6Eqe1D6DXnqAVH2M
	0e7LlJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9mP-0000000ErkC-1aEM;
	Fri, 27 Jun 2025 14:10:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV995-0000000EmPa-2tMk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:29:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3111974a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030974; x=1751635774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq5LNL/kSi3uBykeBQ3vsMgUAnWMOb379Wxg3VYtEFQ=;
        b=F+44opCXqyGdxsOmpkUVq1j+TOTTyKx1okMGnU5FLveIBhu+FGMpMhQufgeCSprQ5o
         LZl94KuSKtbNXySOO4wwrGKGigTuLZnTzKAp77zM+imhOWSMCexBhgrk9QAs8+gh1lP/
         qN1g990UpjgRHs0S2aCf9iyW/ey1OWbCltI5Orin6015J0hE/KcE1yH1nwi4liNAlSRL
         iBrYjXPwpYWCcpVKbND4h1YRgxSwjD9Ixk6FSit0RVursln/fxb+Vi4YRUB3Qm153yXN
         zjIAwJpQayl3c1O/w9PFa+hOgQmZDZhWiEi0GMnAc2mmUmZWlVTXj4OQnOMVY1qWWioB
         vfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030974; x=1751635774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kq5LNL/kSi3uBykeBQ3vsMgUAnWMOb379Wxg3VYtEFQ=;
        b=t8GarEq4meUxPX9en3uGKcN/V03ZDNdOH0GrziMs/1dojJrstU0afBGbp/Mdji6Sxw
         KTAHdA/FTCL5N3yBbDX3fQEFJN7TJ7q/3W8k1emfe5WhBnKKjVfCc0LXGdMXqHklBPbV
         j4/tJwrJGTk6O3bh23YW8uM6vNT6rEWyUVMGapTb3D2zDV5i6uPC4Vpy8P7eHhuDzis+
         ZsPv46uq3Plkwz04o31hNgLre7dvM1CIe1gcJVulvm5cKJVmLN0gv3KbiXDBxXqvZhw8
         AUZHwZ17ej9kE1mdn6ltjrDMu6rWxwGiOyE87lXHRjVAcGsUN+Qkn01jjwS+xmfaoQsw
         a2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcQgxIvgryZAY0kPdm+FaSTUVPeeWCu+Crm+y2MkDTGhfHt+SYgXTcBPO57VOtJz65Fi+es6lKJOuLYMAB6JUq@lists.infradead.org
X-Gm-Message-State: AOJu0YzdfRATqiu4sP2Qt7SAR4fvlCBBWaatLU5s4QCcGnRajYy1kvvI
	ReEOGO/8nqL5ghxQnF76SS+M9FLo5Dd176VZCGul6/42x6at1lSz+p7utl5A5p0SSx4=
X-Gm-Gg: ASbGncsPPv1Go8UTgoH+cQLtlfGHfjdW+1fAgRkDZ+qGF+njlzWPCztD9Lr6ZOKajiG
	iS0qwflSYTyVhL2oTJiBu0l3UzKd7fz3WAeyfPfiVfyO4a0PnLAb1bgUW1upHHy+eFyZS26jwxD
	CjmnzlyQp4rjXBuLJVIBl8aLItswTG1dCvy6HddBquQnDBsJNs9JAnA7cBXSsWgZOZtx6uceeZf
	0u1J1TPMfc8WMVBdx8+eGaCl7ilnZesFbIFqQIA402qd/bf7G5RoFxw5QWM8k/AHGsHkzrW1Aeo
	9Cp3lv7Uhx+c9KML0sACMdF6DAlM66qYpV4Qj0fWW31MekpnKdn/q0wXo/pHKXpjqmX8eGlrn8h
	Z7RM3pjLNjttub8WEhqV+CPfDdcuohsJrN2feiOFtwziadA==
X-Google-Smtp-Source: AGHT+IGd2c4uK8qXV/NnRe/7QQfP8S5dEOVPWCDF2KTWWSLjQcHtuBqYQ3SI9sPGJlwdlQ6x9htklg==
X-Received: by 2002:a05:6402:2101:b0:607:116e:108d with SMTP id 4fb4d7f45d1cf-60c88e72f3bmr2327472a12.21.1751030974100;
        Fri, 27 Jun 2025 06:29:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:32 +0100
Subject: [PATCH 3/3] arm64: dts: exynos: gs101: switch to gs101 specific
 reboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-3-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_062935_733700_A69E2603 
X-CRM114-Status: GOOD (  13.89  )
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

gs101 (Google Pixel 6 and Pixel 6 Pro) supports cold- and warm-reboot.
Cold-reset is useful because it is more secure, e.g. wiping all RAM
contents, while the warm-reboot allows RAM contents to be retained
across the reboot, e.g. to collect potential crash information.

Add the required DT changes to switch to the gs101-specific reboot
method, which knows how to issue either reset as requested by the OS.

The PMIC plays a role in this as well, so mark it as
'system-power-controller', which in this case ensures that the device
will wake up again after a cold-reboot, ensuring the full power-cycle
is successful.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi              | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index c1b51f4cfb8c174852b44690f84ed1aa0b4057c2..84ff3e047d3b31b5f96d4d6c78ec933bb05f3e6b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -106,6 +106,7 @@ pmic {
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int>;
+		system-power-controller;
 		wakeup-source;
 
 		regulators {
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 7fc3d803de39e654c1e8102b5e0f68995c3ab8e2..79a15fe7d336af3dcd9104d286bea525bb73e9e9 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1418,10 +1418,7 @@ poweroff: syscon-poweroff {
 			};
 
 			reboot: syscon-reboot {
-				compatible = "syscon-reboot";
-				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
-				mask = <0x2>; /* SWRESET_SYSTEM */
-				value = <0x2>; /* reset value */
+				compatible = "google,gs101-reboot";
 			};
 
 			reboot-mode {

-- 
2.50.0.727.gbf7dc18ff4-goog


