Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE31FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=; b=RO1pesJThNN91mzUg+vp6RBC08
	KtNIoPMsQvZyfxDaY7dGzyRzI4TQ110k4G54xae7FQxuRZtNKyVk0PELxUA3Hh+mSRMX8Sp1mtzm6
	mJJcsLu6H2pYllyT9uhvKGNiIq0y1PZYXRoenH4veaOMc/YzNts7236C1rvU3e1NGaxm9WxuOEKOb
	ljXb2WbzBDwf74S0RbHUUkiJQpi8vfbJvonEHuewjoeqwKX6q6y+DrnK4czD7y92jS9LraPrUJ5sX
	avrSS+p5T8j/XXzyMDHb/OIuduXSARm/yH5mvHMrYI81RhaBrb38bHzJjGb/32gt8LCHLvQSA7AQe
	/cdXmVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHok7-00000002Eex-1i7n;
	Tue, 28 Apr 2026 20:09:15 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoil-00000002CuB-1F55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:07:54 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2eadb000b8cso3156678eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406869; x=1778011669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=e41u0DG1rgLOU+PzCpZNKwGMQ0K7RJSfQe3+Jpmj3ZpqmxpTXl+PlB9PGk7CK/AIW3
         bQta+9q/iQ2qdJCLwDJmRMPM4bMrmNmxFM/j560fMoTJAM2Yic3/COwRtpyiY2eWk73E
         fWMOECMD0pAM4Mo3dm/7fdG9vaiYtFEej+e44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406869; x=1778011669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=HkWUETxRTO+jPCsxFvXed4YqggqEMwDyBUqUTp0LFNHxG0IzeyxoQQB+n10PvkNQ4q
         5kQL89JvP57PpX3j5uzclTt29VF+y19L5KNYAQeDou81rQHbIherDShLZTK5axhovEwa
         p+W/5GLjqEsclWzgTTVNj3GGKwZPy8TxcM7r4/7mL1CtN3Sdnr/YZzgCMURWYzRl+/rA
         Q3gtQPdpjiPwUVitEMJg2DTvqBXcrjvoH8uAa6Owfx/iGX65GsswR7STWQ0oIie9rMZM
         wcFTEssl3w53cciGKnLKOZ4B/VoxVOpCpcUf9X+eb5nJTUpgha7bRfH3HE8SWM7+5c/i
         tVoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gCh5D1XCpX5bmVJAV9PZb0MJQu6UF8NqfSPuYrP8cGtgsnzLiw8ep8zacptGoShCLLObsdXHudLlGce4QalMz@lists.infradead.org
X-Gm-Message-State: AOJu0YzgTitAPGcvhgSoqxnhpkhx51JAvWXgONOz2CEuy5+Nqr0avDgZ
	PpsYtWvcBMyXteOYHEFkSsmrnX34Vj9Z95wzFMcKKsn3EuMn/UMgla2AcOLT1jut2Q==
X-Gm-Gg: AeBDievnoE58WbbAzsureW/XNXcZnujs3k4eS9H9B7lR0JOe4HO1cx0V5zSLvGY+jQM
	w6JNS1fX8Di5m1w/yvPth4sc/XWOngrTV/QkqZtzTvd3dJdM5m2NQJd7On4tNzONtrU1THe7AUo
	sSraTEOAU07wdropiQ+8KR49XErtz2eHzOydWd9xtRo8bW26r3VgpsPVjzAS7JmCgY2yEiqIg3R
	RyXBdNQP9nydlXJaeemiBx3x3dIvpG0tjV1i66QtuzK8+zpdU05az9U2SIfyEsIR62yRPPEXNkh
	tiEfM69xyuzoFG41V5odylEqIyxq00nlU3EwJO19I6x35H7MX7rEvlyJnihFTwSS2Pd16O56JhK
	Ap+G6t1/ytfvkXk65zQrgLrjJytUV4z38IV2c6cV7/QPI3/xbbDpFV3jKwNeqH192Kx7o7VNAJ2
	Ub2JqCgmYyNimH2JI3Ehfa+09NX1qMML51esir7qT34aA/ZzQwTgfwz/OtNLJqrqWWIqcHK9QL
X-Received: by 2002:a05:7300:7255:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2ed1991b2a9mr467588eec.33.1777406869213;
        Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a0ce761sm3064459eec.15.2026.04.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:48 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:58 -0700
Message-ID: <20260428200712.2660635-7-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130751_520237_B1BBC7D8 
X-CRM114-Status: GOOD (  15.01  )
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

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 683ac124523b..1f5222d43e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..a6d31650245d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.54.0.545.g6539524ca2-goog


