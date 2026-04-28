Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD79FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=; b=tCy2thOvZImJGcrs6Uh8cV6224
	iDyixrhlUSFd4kS21QnDM4EXbURLFviDuwyjtskiQ9aZ9NlBxONs+nMgoOFltVDeYytJufFtyhtvh
	Fk5KFYchkOtV9gFyU7NQQC3Ux52HAAsNOuFmyvdmB1WpGGl5NK84sW06HDcleFGPk7L/x45dfYCip
	vVnU/Q5PJ0xx9cLo5qY7Db8N/TJdAEVjmEPL0h2dXwWFh8yZqcC30NgsoElzeJXFFnKEOxpR3jHoT
	VbGuIaliBPmU0PaxOvsPYssKdWA34HtQ7rKUpH07+m5I1BTeu6OoqiAyH3bDgGFTcrOFkg55YQw3M
	0uXOglaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHojk-00000002E7K-3XtY;
	Tue, 28 Apr 2026 20:08:52 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoid-00000002ChM-1Gje
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:07:45 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2dedf5f88adso124480eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406862; x=1778011662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=;
        b=LunnUpRRjPYcsJfabJRCcsHfqSybb0lb0tQVdurNo84y8Y+SmVLXKEQdNSre67rWd/
         hX5CngrnQ8J+42hFMvwYIyl1rrZbreFoSgwGyvH5y3jD+k5PJb/fnS97tXE8k56fACPP
         xWwIpXIzYasQnmVPj4rOB3q7suddyc0EmvIPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406862; x=1778011662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=;
        b=CZsgNIrr+XwRyNYfxyCpM5KtcEm1XKscEQS7gSC+xiXCUEEANVfYtizNPyOx+lOwnu
         xemxNu7kgJo7hr97O/1/KJAgJPGHgwUZTim3eAKeXAGNQvuyc7MDy12ua9uopocVL0eA
         heK0hB3wuibY0V3MtZOEZlTlnyI2sbsjyJVQ0U1xSJngzJSJJ09FlpzSnfgn/jfmCrB6
         JNi68HZitL0Icae2uKokI9zIxmBO9wlt5nrfYsY0Oz3Tj53xkEcsYbass+OHeiQrihbf
         3Tcy2ZUYNS3tnVn2BdsgYhBX0Ta/oxIyyjblJerMuVmbJDPYDVXuEtDK+HHxODHNp3qr
         T+7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8YW+fTjemCS1/jccnInTKIgb84AbEfCkIi5A82SJr8zNy5y9wLRfX3SOYA4I9RxyZGgy9fwCk1hCcExxCXtE0L@lists.infradead.org
X-Gm-Message-State: AOJu0YxxiOmmNHkP9lh+q16u6+YeEwEHRe8y4tL76K/NvESXhHBOOxvw
	+fKF9Z3M00OF1fdIr9RfbI7i3QL/BthPnBddR5q1jzK/KXxLPmNePEce4i4MkgZ0Ww==
X-Gm-Gg: AeBDietz0jUsPNWdFipbbere/0pqQ/eAL22KICTZOulseOwe4AQ6qFuH+8UpYnbJd5T
	R7KWmx9F5bYLVb3uihqDA8QZbrMUIqfRZmHiWl+SGwwInF2LZUcRg1b1RxDivsK0O6xrqm5kBYz
	Ei2o6ehpYONRLUufiMqT5dwyqkDOIGny/BdleALkduyuYKF90RHV2yffsFp+bK0NYJ3J/XJB53l
	hHKPs41hUfs01Ev5kgajZbLDFGzxEhv79xlPoBeX6heF4mm+hqd1h1SvNl363Pwi7fLqarZ4jJc
	zSCospVCQ2psQRLRnoo238Ntq3oMTD2I8SY+gi3NBIwK/A8iD+we0+HCojlWLKx8TeO0hhkTOGd
	qr9Ox+/PHy3DtNaV407sSQ0D3Ws5BGbdT/G7nlbZ/X3GCaHoFlq+FqjJSquoo1Qu7GdjvRdXIMX
	TCL7afkbd8h2g9TVwJPJGW86zsj2gisfzpaqjRL78eE6so5ULfHBO25fNsvwjhPrCjMoAZgZYW
X-Received: by 2002:a05:7301:3d17:b0:2be:ca4:e114 with SMTP id 5a478bee46e88-2ed1b4057a0mr129402eec.9.1777406861689;
        Tue, 28 Apr 2026 13:07:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb712bsm3068754eec.12.2026.04.28.13.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:41 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:56 -0700
Message-ID: <20260428200712.2660635-5-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130743_448568_C300FD36 
X-CRM114-Status: GOOD (  15.52  )
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

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 65b000df176e..a64cdec3a2ef 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -30,6 +30,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/exynos5250-spring.dts b/arch/arm/boot/dts/samsung/exynos5250-spring.dts
index d126fccdcaf3..a337fd9e3473 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-spring.dts
@@ -33,6 +33,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
index 3759742d38ca..f24356784492 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
@@ -50,6 +50,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
diff --git a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
index bb019868b996..3df27eddba15 100644
--- a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
@@ -49,6 +49,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
-- 
2.54.0.545.g6539524ca2-goog


