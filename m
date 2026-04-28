Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E022BFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=; b=Sc1jU9qxtOdWm0Ixjl8AVtVdf8
	0y0ZcZLYXFtDqQ3d5ZYF0qd69f40ddzdAg+sPJz9bnMUtFJisbO/u+E/3UEN4wU0T3nr9gvUPLKMi
	bel/8KtG+/4nlnZUVrFDU6UH/5RCxYyO9dMFfRd3XdEvd8mTBm2JUdzuTGMPXATJEf6lap2zKvJCP
	hFPbkhML5RfOY+ffymmcb5ot0qESpAdtlkzAeoDVZ83194s5FXHgbV4Uxq4Z5NdmmsiG11qoXq0Cu
	yZXAj8xRJ+SPW2avXI9UkKmq94sGmHfXJz0jQhLYhyNNYjX7zd6IovFCESl773xkMiC0l7/hacFXU
	DkqKx/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoj4-00000002DIi-1e4P;
	Tue, 28 Apr 2026 20:08:10 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoiZ-00000002Cb8-1vfq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:07:40 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12c8ccc7755so12672458c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406858; x=1778011658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=Vxetu5mytK6pzMqSYfdxVVhF8B9UuijOtAGjnoM3EolFRNed75WvaPpWy3d8/2fc+/
         FfStl9fmfZ0ivr9KIr22DdnHYuiSHXqK7WVhcA8WeTd2kzC89+ivlTK4XDavQUvuGXB2
         f0HUaGERnCrEnp2SSi0b77hGZUcJ5pgznkJAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406858; x=1778011658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=BPONRucbNQEXZjxDjpbbfAPFlKcc8EbFcW/7iWydntKx7XQZhGPV2uBUQgEoazLDQh
         SNv5SPpDKQQbt8bB5jpVltenTHnsh/I8CndBawFvfnJmjkah0QlHPsHi932UvFSTUAbO
         TF7B8Rkakkx4/AKZluhfnGv3fpgwshzNP8/PXyWTCdxaWEO7AMRkDrIzdRK78smvYzJW
         4OnzoNED8tWFRmjTmoY0AO8/JgrsCuk8Yfzw1Tio3TOBopU9acpRBFCc8arkSgPX8/e6
         VhXMGN26QHoGERcA7YP15zxZU6wH2yJ0vbGRFEKPyZyhSoUpsk+rtsdJc/SMut6Ldmyg
         H4CA==
X-Forwarded-Encrypted: i=1; AFNElJ8+WLX89rHHQ1UBd1MMcWN+1NRurmZMob67xwI081RSlPRbpFW2pdS0Aqt0WDtjv4RXJixPmy5HXqnRvM/hq8kJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyH4EFaSR3cGNJi+krp/Z3Vb/tcuorQqGgAvKaQWUYQThJvjn0H
	ZL6yxfq1/4EWs5IJrP1SCXPHuFZCnussCaztaXnIBZqa28AUP82FbbcRyOAC/waO1Q==
X-Gm-Gg: AeBDietT6jS8f8/xMH8YU2cEhU+AOzal0ROz5sisqzGomQYK6QlEYJL+vTYVyA+BE+D
	BQkot6fxw7xQKPcyC4IlkpL6a2CYBJhmVWhOK6tF/tHmePxXtGCmI3a/LcEmoV+PtM3X1CAhcYF
	bMw6uj8dUO4B2OTlaERFmTPbGr51yIxEuk/7iJLuV6jCxFKWOwjsmiKmbY2wpg4ZS9yqzPdts8b
	ddpbbmyeICFB6MWc8tX+yuSKakh6q4y0R8vG0R31maTIb+OcbaLs96Bw7zKkt2HWHWLziFgnzFN
	mfuk3R/AwII9UFaPlhRIanInJXNE/A3TDvPmENPy8QoU9A8tI1ozNKSQvELHyJOR5FINKuSNlKQ
	1loR2JyJ9S225Y1GBOwroTskelmCxWHdsvykqt+BC9X0Hk04GGcprbr5ctgy/hQnyuNllIBKYcv
	4EEJT3o4DYwFgrXifUnHgiypHPPNnwWXSmJNTIyfLNMaJ6BeuBJWOWbPFbR8mBFytFKjayxRea
X-Received: by 2002:a05:701b:2505:b0:12d:e126:b7c7 with SMTP id a92af1059eb24-12de126b941mr735154c88.14.1777406858194;
        Tue, 28 Apr 2026 13:07:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2796623c88.5.2026.04.28.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:37 -0700 (PDT)
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
Subject: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:55 -0700
Message-ID: <20260428200712.2660635-4-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130739_508697_1AF75806 
X-CRM114-Status: GOOD (  15.88  )
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

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 974c76f007db..89a749cb8933 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -14,6 +14,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * Note that recent version of the device tree compiler (starting with
 	 * version 1.4.2) warn about this node containing a reg property, but
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index df98dc2a67b8..059ee6c5b13c 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
-- 
2.54.0.545.g6539524ca2-goog


