Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702F5CFA44A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr/XskJwABWEjaSIE0O5A6j6G7kGiwuQg/lwCc3XY9w=; b=W1R4HOFFDZsftqeS2tPRRgY4pl
	gLYdU+9M8U5ep3+GEalmuYbvcPulDxJtCnFBlA4i8xwVcDxGAORqeK/dbqkiofRkK4dVtBcHB6qSC
	WrVV92i1lpy+FAH2pqyt95hDYEkb1q35aeDMK48hPEKm6bK4ywEy5rSIOOQfngdgEjjrOz/HIp7cY
	avcEALm94t05qq+GdsF0ugAGpQspAp34prtOjt/T84B/LBPh4kiZbPaLRyCkERIUt0Cjd9/FORyY8
	/Kx43xGfITxa8HQHdgcjA710M2sUJ5olyQwViQDRpXKzIk4AfwD7MK7rfol7ZXDP6BxM1pNY9fKef
	TGFfjt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrN-00000007Oty-2LMM;
	Thu, 20 Nov 2025 21:06:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrJ-00000007Orf-0Xaz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:06:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779d47be12so10789735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672787; x=1764277587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qr/XskJwABWEjaSIE0O5A6j6G7kGiwuQg/lwCc3XY9w=;
        b=utToraUQufLO/7m5NLmN4aVSLLwCJHdpv31neOrnJbawTZVDP11NPmABPj5X15Eu/5
         qRsSXZiB7OWHBtzzCM2l3YdpoNgr5/bvQHNnFbs6/rHpCQjQbuR8aFiVpshlTMz3ZBv5
         pehKMeZtUvknF6a9nHW8pOl9ty+LnkLryaP/vdSkGklnl5oQj0eBEESGlwuGls93UZGi
         NRfhTtBQDNgPukcvoJU3brm6c8zykKHCR+MexQRqTRiLWP/ettKvE0WWM+tBfPEAi0db
         i18Nbkk45B3Dnae2/019QKG4AFDSaEef+rBr2C0sgJkDCmlEYxcDqwIazUTZ+cSTpCDt
         v9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672787; x=1764277587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qr/XskJwABWEjaSIE0O5A6j6G7kGiwuQg/lwCc3XY9w=;
        b=m+FH03JQ4MPaCOaHyJ4Utj2YTMEmu29y0Gy5h5LtDXK05D7I8Quj0HAIftZcQFMh3I
         I0BXRWgLdQsXab0WMa2docw9i8bg2HZenPxpgLuT2dtdbaOgGcr9udWfSWT+l34TqHAT
         gEZc0EVASV0CeLqQKttKQpm76Rxaqw9fQGwcUnOvL2niLeXu+Hkv86O3EBsz6AWpb0RT
         747ZZ+zSZnIrHJwS5PaZiNp6CXRF2lLNlWZrWAVYEMgb/qnjuBExkxiq1g4hbpFhtb8p
         Y02JJUQ7n/vbxOPqZwGSbtZ7TeJVp8T7ti+ZaSma3x0V/13tV43Z45csq/r2qOyrJhHm
         OC9Q==
X-Gm-Message-State: AOJu0YwOpHQ5gR31yYJVbrNqBaTACGYJXZC6BhKrIAggHs/J2fa/3BnO
	ntYTPXO6t1iU+cKTiCj/tLVgHeAfrKsJI0Iflj5tDjz/8eythAHZDxJC56xW7CfFy3U=
X-Gm-Gg: ASbGnctLUjpB/GNzD29xZm/9U6DmOFGOae3GoxwPZuFI6Wf7qI1pmGGUU/eGXn2m6Mr
	rL2GWWnkIXp9l31tLjPfvdxEtr3BRyJOe8KwPPR/LyW+tSQfOUwMAW9RD3dPS4y9yKJRitfqGHG
	6IoXZzKqG2CIvspMNXvr2Wmvg2Ayn1XpoEdKJSGPfnLtDIWeWIWz3XcV9INYoTZuSYRE18X5NHV
	NULJOPRXpI3zMeZqLPgakruMwyXfS9F6MFYqwrlWi4FKefQo1YTkMAnzIUrQUJxMQGcx9j/TLLn
	8CoYJI77YAAssX9NYZGK7iSsl36DHIRWIcuxJi7kAnvAnU4PlLUZCzj+sh42qu5H4ssYrD5kEg2
	fHDHvBQt8I0EBZYy1PbYvc+Pt7YRuClERLnHcQ65jB8g+39es33pVb4xfVmbhU4o/BWMY0VrKU+
	MWbxhABq89ip9fegqfS5IZxf/MJM7ZcNjQzLXtcWs=
X-Google-Smtp-Source: AGHT+IEz77AFQRfOz9D9vMUdFJ4yGf63OlGCx9aS4W+OUx3VSIJC3ZvMc8VWi7zfzOHOEQpRahi04w==
X-Received: by 2002:a05:600c:4e8e:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-477c017512dmr1362985e9.2.1763672787259;
        Thu, 20 Nov 2025 13:06:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:13 +0000
Subject: [PATCH 3/4] arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu
 dt nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-3-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=aNCzham8+aVa4ydfofiJCpY6230eXXu6sfYAAe0zyFc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LLBaSMM+CzWBnI+jbY8yriXjZIgzTuqgBbt
 XOueJtJHVmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CywAKCRDO6LjWAjRy
 uultD/9/WEZe1LMumFGfEPAYEzFSldfvB0k+LVj0rv0zPwwvTx9bWMSMphDpfG/vtDnRjDlqHq0
 lVjj0ycrXuuHr8qSj+CfpWyJGAgMOX5Q6zyVPqRIZSFZZ6GKXhhlOpJFMiX/EefDQ3R3MRHTqtm
 gBN2qVq62RHuC9N6ML/tpDy8FFyZowi079wwudvgH3vMIxzofB8uDOco2ZmtLvuB3ljgsvxqjre
 S32IFyuScIqC7eGNn6cZSOO6wkNBMQ+8jE8JLcUyCEcfQt/MSSG8AJtzVRPHm3H9frQJ9kxvt9u
 pPtPiTzDev4YVKvj3JuP92W2fIBDa+w76LS2/qXOtfeVMLYzxauowIOoiuIT7pdX3KBcw//+G4F
 wZlpQQHKfQ0emHnE9uy317YaAp/8Bn4tNq5VvJnIy4MqUnhE+3+W3O9gAziK4CM7ls4KrkyaNIz
 yty3Erw/zBNTmXn+XThp2u3tMi+uyKczmtBJVAVJI202nz4CihHA2N2DUscKw54L4ev8isGmM/+
 4ZrOzOQGkcbk6daBOTfGxx8xe/6mQEvjVp0eFnIpSxYz1fgl7zi5iGcA7cjdGGjJhdJYtxbC3RA
 tWH3oYeUKBM/Tym1qSnnfWUt8f8NXpVuUJSgyp/M7h69CXLd+qezf2g+Vaj9rLeyW64suoUKNBH
 GIJKENkgYHs92ag==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_130629_215416_03C4B0B6 
X-CRM114-Status: GOOD (  10.40  )
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

Enable the cmu_dpu clock management unit. It feeds some of the display
IPs. Additionally add the sysreg_dpu node which contains the
BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
dynamic root clock gating of bus components.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c39ca4c4508f046ca16ae86be42468c7245561b8..ac326db437fa8fe437cf11167bd8c1ce5c2ec186 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1798,6 +1798,23 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			status = "disabled";
 		};
 
+		cmu_dpu: clock-controller@1c000000 {
+			compatible = "google,gs101-cmu-dpu";
+			reg = <0x1c000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_DPU_BUS>;
+			clock-names = "oscclk", "bus";
+			samsung,sysreg = <&sysreg_dpu>;
+		};
+
+		sysreg_dpu: syscon@1c020000 {
+			compatible = "google,gs101-dpu-sysreg", "syscon";
+			reg = <0x1c020000 0x10000>;
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SYSREG_DPU_PCLK>;
+		};
+
 		cmu_top: clock-controller@1e080000 {
 			compatible = "google,gs101-cmu-top";
 			reg = <0x1e080000 0x10000>;

-- 
2.52.0.rc2.455.g230fcf2819-goog


