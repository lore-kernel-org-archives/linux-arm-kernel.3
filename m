Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE04FC0346
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=; b=kYhF64m+qz639uY40HL8w5bAV/
	gOFfeve2P1o5wkzYVp4VzPOzy65d1dGCdVKuTEpLu3V2xSKGKDyJ/Pc6OPcKji6+5ttf1WfacC6DU
	C9NMu8tKD1zyfIx6n2l9jHBKavWlgta6M9El3n1gZ43dBao9NHGDFARszLenbPy1hUAnJ6BklmtHJ
	c71cxsImirQ2WUwSqgFoSMNrZtXfriq4sAtqPay2VnxHGN78Jr09unnMcog9F/TWIof5drQyF7Z9D
	p7kQOVycBL0LRcx3gDhaGZTtF/TXcBBtgHI0cAJ49P6vIKpbD29JK5YETEROp2bA0rvKbzRxIFtuD
	PqqSuNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtn-0000000BsnX-3S71;
	Thu, 23 Apr 2026 15:23:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtU-0000000BsY6-3cdC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso70864605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957787; x=1777562587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=;
        b=U+ANoNJY1gTwEk4v7DduB/Yjxl0eLwtGZvjU6K4AZt26xNzTMVIQsBeIOEqqfbFc6z
         YWdxKdwUqkw2QvQzQprhlNUHfhNTGZBYx3Q+2wKv0+XEGjnHtCWger8qae1Yed6gAgkk
         riFHDba4hJgwwRWLBB3pahVqOTunc5UHcAlYNg49SclMudmY5W+bONtuIZD4IYfiKthZ
         b6/0zJk8Gc2jZ4ImYd9AJJBgq+2262Hi76x7a0f5qmWCOUBxawu9YJ6l/OEcksceZuxF
         Uw8wOxtAdVUw72sccUnpJ+/3MNzg552POWOhQdo5lQxge2VEaqeQbbAkXhSkWvUptUIO
         SHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957787; x=1777562587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=;
        b=FGePYN/4SlOnmkAfKrBGm8fvCqxPHu+9SyhM0r1m0ghWOBRtJdOK7t8qfON4a5yZ3g
         JowhJgKdP4OB04FA6l+VpnUHA7hV+rohdSzaX75/iX2+YTUU6apwytQmjg3uAwMfPaOa
         LMn4HIKoMhJgqDjnIAeZ2VSAkl8EUey9F0HZ7YKBdn27r9L9zjo4Z4BIuo53vZ7Sz6UG
         lNPnmMwCdNp+NhTMkLTI/XwePg9HrKgCLB3NG1MC9hyZKUgeSSEL1dnK8g95yNJc0Rg5
         4HMDKi/a8mi0s+2203xc3ue+Gqg4EH7kfpl69hJu6hTSKNrEjDwHY8GryCphnEqMJFeq
         NUmw==
X-Forwarded-Encrypted: i=1; AFNElJ8AXgc6KQSeMyrzuelKS+G3vbWhaTyF6mKbqkT2PbK9WPAt0S6e1B7WNKLDDKg2K45SpzHOcxiqByR5NN/j3Z2m@lists.infradead.org
X-Gm-Message-State: AOJu0YyacXbsF0OpwCjoTog1+aZ2fQfZFR5REoTzitiriL7wQg1HvW4s
	ZSTkk9l97S07PXzTXrujmAaLSxBkvcEbnneLXAfyDGriUPmRAplOWK4aCAl4p8rHXeM=
X-Gm-Gg: AeBDieuGK5lQW9TAt4GCvqNDPU+fEQEuaikyzJrNOKtk0T3sFy+bMljNvMpjqRk1eka
	E/R5kNlpfd+4nVq7OhrTUNhWpBIYEjnv/bUjiBbgLut80Cd8A2GNvQ5p3e/EwQFqS6XSnaCHhGu
	WxBHCq8O+apwtRb9JCjrvbXuIS5GnK1IFv2Nw0T0nOsPZFta19fzY+86fyo5cdaZuVEKdLxByx/
	C/9kpmPkt2xhQtVJ8RlaxLhI6sJ7d5E3VTYaq/vZe8XNy2ZQsx+WT+vuRyBCu4vz4FUC4ArxpFK
	RtSAxNXsKitBIt19xDmqkQ1VoxEaSDt3eAyX8j7sc8/qOxPUiPBC3KP/E6xcErg7berT61BYV1X
	RiAobUAeF7BvfaACXpEVgV0to3DlZKYQiBrBxurZ6F5qUz6/r8q9hBRnCFbqfyQg0Fz9WB1KwdC
	PUMxx9VMXGNl2DiOzpbliJBR8hohNXAhA4yFjrBzgQxLUntwdBV/nN2ay845VMOQLbqc5FD7cs7
	8vtwO1/V9JpKvr2Tw==
X-Received: by 2002:a05:600c:8a08:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488ff369a1cmr299536255e9.30.1776957786885;
        Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:59 +0000
Subject: [PATCH v4 11/11] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-11-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=812;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7AhKBHwg3sF5ZQfICMhVBtTO5MM//2w9hYFIb8IP1yU=;
 b=5VX9qU+w1MAGCTcm/KONCzXTpE/zawPv8s4NGdTf7+yTo8O2OSQ5R1ITDc/bhnFX4LjS7V1lm
 qjj5hM1FeU8CPP2c5DU5SvgZzv7wBhNlnAt3R1NZBOCz6liqK8uA6Jp
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082309_004505_5820AD74 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.545.g6539524ca2-goog


