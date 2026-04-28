Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ED9FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=; b=Rei3ZF0zloagHnu4gDAJG1iO5K
	FIUQK/eISv+0UVC23NCIM8yVdA9XBfOYcugtE2cTp0poaEY+isza+pHxZYi8JulK6P3M6ap7sy6A+
	ejd7nyGOJgF2OF3wlUDs5URbj8Vie94ajMDuvbJTlP01pKAVHVIbcapySK2YAXf7R12ST1fYVcX5z
	T87QXOzy4tcfmCGACXWM9Vy84YZnhHiitSl+rMwsUU4GnJBOTyMbNI3YKpRlhHypcNV4Jv7ysCNfh
	g59C3MaZiRbjmwsIcdJo5JpuopxyRAoY8zT3AKmYAhv/nPUGLIaYzPuOXo8OtLTkxtnBuUWmS2MrS
	hhYSPgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoie-00000002Ckl-2phF;
	Tue, 28 Apr 2026 20:07:44 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoiW-00000002CV7-0R40
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:07:38 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so4709908eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406855; x=1778011655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=FO79mpJrP/PVGulQ5HXyZad9M0D+yXZLDFbJAIbP4aOxN0VmuJYz7fYKI6a34ZCFwW
         gn3uGI8nEdQEWg83zVl1Ph74YaaLHcpcOmpdtMjcjYyqqIouWXxeY99LV0J8A0Xheap2
         rT9MAWsXe0N5pukX1wyY0pyaaZbGwK4BQMOlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406855; x=1778011655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=bj72t+1ghJFAmu7wX0nTQJ8Ya2PvjILJv40C8pYs7r+DRFRGujkjeS1pfKe5zmOTdq
         +3oO0X0o4GO/0YTyBsHNOksR50JaXZjK3ali2kUBKMfVJlU5v7o6fma4gl2/UigKbP5g
         WOPKG/M9r3cTwpkSsr8dcnXNQOovvryALxYXzw4VsSLOOchqMVqaIDZvX4QVUvQe6scs
         h69RgFHxLnDYGOr3CgMfOpPEiKtRo0dhEegHgKisRMisZ3PHM3jzhArD3wgWoj7yw57c
         PFFRvjU9FTwWESAcO0PZYJu98/ZvcT/v2cm9gZrGASxVs7gV1wfc8/J9CZtNYE/rtEiN
         Bl7g==
X-Forwarded-Encrypted: i=1; AFNElJ8hmhisYBdtQq2Uz1WY6BuYU8TCQrkeUQO7HUN4N9kjxpoXiCrY1LCcrBb6kWgqCkXidzfDF1AqqxN8Dp3Y88cG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp6uXga7vfV+qbyXswd/YFs7RXiyjeHkkwpUbs4vbHzbi5HIyo
	9x/P96+RraLpWBjNQ/IWsMeEFAY65NQ0lcd6aR0Oi/IOOBmUgVcr177lQi/6Qr6x1A==
X-Gm-Gg: AeBDievE9yiEOmlacGOktTtL0QeYcsFNsfjTBFQCl2ERx8PQtjlZeP3lVgLCl7z0GqO
	Kj8ASdt3BHqKxLrsO+HvamPYCl2d5HX5lTSzkGR3ubAIk+abII4lF0Wd8LvhDv9m0eRTdkH12yS
	9KMZlFF8bwQuiAk3HVK64xw11wvQtURxS8Ow1XulD/hgMvJILrHbD5ZKeZQr8I1q9Gsi+gWBS9s
	6pr9SmRtE+6wvy4pj7FVnJRhMPfXRwPyDf5a0oHgbSEHmpoa2UpQthplCwOgiO54hAwSliHXS2/
	UEHf7AcIkfRMsADOuMLAhBYymT2+PJrHmYb+XXonZ9jPjkikHpkJpyge1tk1ByrfUXEKFOEg4Q+
	TqeNI7SpcuNzEpkDB6mmWDuDJSdVcoZg/qdBMwfUzKnHSzSRqYYdswioWKE/j590HIcwXekOwoi
	qhGU+ovNI/f+iCrOxbnwKKmgXyuUhUxk63WABd563doKpDI/lmM7C87Evd9GXZy8pGoj8CmhdVb
	nT/gbLn984=
X-Received: by 2002:a05:7300:5707:b0:2ed:e15:c924 with SMTP id 5a478bee46e88-2ed0e15ce32mr1940281eec.32.1777406854721;
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb6b8asm3015155eec.8.2026.04.28.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
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
Subject: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:54 -0700
Message-ID: <20260428200712.2660635-3-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130736_158226_E15B3488 
X-CRM114-Status: GOOD (  16.45  )
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

 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
index 2d6cf08d00f9..ca8e8e735078 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * The default coreboot on veyron devices ignores memory@0 nodes
 	 * and would instead create another memory node.
-- 
2.54.0.545.g6539524ca2-goog


