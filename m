Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7102CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=; b=pZkMX9i3VDlmT1
	KxuklwLWnkMGUFBayY7Wo20ggzSxtbhs8gPdDSC//KhtZVjVS8LksQJFgGfdRmPXbiFN2PF65OxCF
	oCyNgChPjT9rbDhla5NBPWRYk1QP5f1p6pNhUeavEWssdm1EDGYyaa8PtJT15Xw2RSZCSdLMT5DFH
	muJj4+9YQ/4TLmRMS/VN4W1TF0bJKDY/3pgOxL0IhTgSxQ8gNXV63e8SkDbU5NvGwEDlwigIv4KNO
	CA9XChZMOO0bDrl13FUwNz6gbbTPAflgrGNo0bYzXUDZkOrt8Qm8L4g/Gk9c2En8lwlHmRzgwtjam
	KHa/sYBVSqV04JX6LfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFE-00000002BAn-14aX;
	Tue, 29 Sep 2026 03:11:04 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFB-00000002B9c-36bp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:11:03 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a00713639cso11874735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651459; x=1791256259; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=;
        b=A3aLKAEbqejxeBetyI4NjwVg5Vm510rX3UQi2tzzYcHKEhL9Ix5jvte9maBmGtmoBS
         ZdoaTgALL3KZ04SMp3slwKVh8ZSUBd/0L8Exgq2CdcZkKS1ebTcBHPEjFXSBg1rHBi+y
         1aQaT9AGSjZMQ2AhCX+cW/8CNaEOAG6Ifr0Xd8O0uxDwZ4Mb9WJT0laCgr56aPBM4RDj
         9PkS+adxl3+q0TMOzjuFocrAWKNCXGwuPotOW8TLzZGKFO7OMMBrZZkYaFHki7aBRbHE
         7OKTG5gjmHjJfbIBV3wWB0ykzSL2EAsiVmsR9yLLYIb8DnJAfzHmOLxJxlagjIb2qBWr
         ntAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651459; x=1791256259;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=;
        b=Tas4HiRaaUt+Fxo3nxnTxFdY/TN8ioyI08ZsPJhIDV3HUzmwJEscmAnuf7x1m7hxDV
         CsU8w9Ihu/l+DQzDigpmG85ljCKtDh9mlJBeAmYEDpEgkb1ajZZL/ONlhiAPTo8uiqL/
         cmxk1irEi9///xE3kK0knT+ef93MhZ5RzxITUCriH7Glxx7ZQUMRTl1C6gQbn2hA4nRH
         qjv5GN6lgdyeUXZxMr0VAXM1psEY6OGEbjTSHQuuUyri78XNNMyDL+4A0Xb/dnnFoOWQ
         T4ks5gdgl5pKEDI0LKPmnaQnwcdA1hRYBWVrisyEBGVL5ZV/h/Q9movhZMyrFK1OzpGE
         JxPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9WlLFOdtFoDIrlMKbtR77ASWIU6orJLj52CdBR2dTeP6Htnyg4GgdvhSTRaI6fFnPuBseOGCOYrKbUNxGumrH@lists.infradead.org
X-Gm-Message-State: AFuF++nDg++1/WtzenrWif57qyheYfj5fVYYZhqsXfSSxxvdhKoZuAC8
	8blAx2NB52pFf1LjWjwsfp6/5JJcGS4QvSPKctLNqc812HT56NX95exqLuxRVz9eLII=
X-Gm-Gg: AYBFou1o4qETkrINgJ1JCixx1x2T/eqjBy4rgfJFUWqOZwo8uC47KIrfqAYCugmpB3y
	TFNHVI2GNgp4zHk+vt5nzi9Uae2O9XyTIfX2wXqira2P4qTF1wmNbd5ObCORBLZ8ky6X/76sjt/
	B70EOCjXEvD1Zao6v6AUG1dFNdywkNV5Cw2WIQzVXY9TZjbMVfdYmsQ/sNRbSoYHmfQG5KEvQAZ
	mdmEGHcSAFsAYYAM3lgT2J+qb5X72vb7FmiVHXC9y4c/DTT2xAoAMYrwo+KauSZI3SPNmT7I5fi
	huWSftxfWyEUv+rxlPzL+keK/PIWCF235wHDFNRwylFbM7fUZPaEJJXP5LA1zQJVZuLaeOdV0Yf
	srDUpaA24Cqe7B5DEDUXjnoEQOdEXlDZK8U2LMpcS/Xrm706RmHL3YyBR2bXL1KN2MTi9+eOToS
	FKLVMZaP2BXPPFesB7UCPvHh7fwcOYpNjc06Ehg7PFCUT9OavJTJNN5A0wccJ025MuSYnLXdYcB
	jFgEG+BB8NFtwty3LEv7ZSMYmNBvLkc/nghdhu4h5ai6ZGlH2zpEAKTbcm+3VVLCg+Kvxlf
X-Received: by 2002:a05:600c:1394:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fe66bdefcmr278754015e9.15.1790651459537;
        Mon, 28 Sep 2026 20:10:59 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:10:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Exynos850: Add ACPM node and enable cpufreq
Date: Tue, 29 Sep 2026 04:10:46 +0100
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYsu2oC/3WOy27DIBREf8ViXSoMBhuv+h9VFjeXS4pUHgU7T
 RTl30OTdZdnNJozN9aoBmpsHW6s0jm0kFOH8W1g+AXpRDy4zkwKaYSVltPlmnJbtOCAJfKUHXE
 su6/0w5VaRiuURT8p1hdKJR8uz/XPw4t7be+S7RWySK3BU7IO/yl8qPEXKvG2l5Lrxs+KCz7NC
 oz1uIByH98hQc3vuZ7+tEdo/VOOMWzroMFq4xxpLQ0YNTmEGRGcnFHokY6IShixWHa43x/4Jam
 NDgEAAA==
X-Change-ID: 20260929-exynos850-acpm-node-cpufreq-33819039cf43
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201101_859794_6EEF0A26 
X-CRM114-Status: GOOD (  10.65  )
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

This series adds the ACPM IPC firmware node and CPUs operating performance
points for the Exynos850 SoC, switching CPU clock sources to the ACPM DVFS
clocks to enable cpufreq. Exynos850 has two clusters with four Cortex-A55
cores each with identical OPPs.

In theory, we could have two OPPs above known nominal max frequency (2Ghz)
but in practice the board becomes unstable with fully loaded CPU-bound
tasks and hangs pretty quickly on OPPs above 2 Ghz:

	opp-2106000000 {
		opp-hz = /bits/ 64 <2106000000>;
		opp-microvolt = <1106250>;
		clock-latency-ns = <500000>;
	};

	opp-2210000000 {
		opp-hz = /bits/ 64 <2210000000>;
		opp-microvolt = <1181250>;
		clock-latency-ns = <500000>;
	};

with random data aborts and illegal instructions. Maybe SoC can survive
short bursts to these frequencies but this requires a bit more messing
around with cpufreq_dt.

Also, it is currently unstable on 2.002 GHz OPP as well so this one
excluded from the series too:

	opp-2002000000 {
		opp-hz = /bits/ 64 <2002000000>;
		opp-microvolt = <1050000>;
		clock-latency-ns = <500000>;
	};

with the same symptoms but takes much longer (~1..2 hr) to reproduce on
E850-96 WinLink board.

Sustained testing overnight confirmed stability up to 1.846 GHz
(opp-1846000000). Higher OPPs are omitted for now and can be evaluated
when we will have thermal zones.

The dependency for this series is:
https://lore.kernel.org/linux-samsung-soc/20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      arm64: dts: exynos850: Add ACPM firmware node
      arm64: dts: exynos850: Add operating points for CPUs and enable cpufreq

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 237 +++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 4 deletions(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260929-exynos850-acpm-node-cpufreq-33819039cf43
prerequisite-message-id: 20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org
prerequisite-patch-id: 5a3c87e368d6bac968f16a0e56fcff5eaec60dea
prerequisite-patch-id: 8d6d1564a919eca361aef19af5dbe1cf3205198e

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


