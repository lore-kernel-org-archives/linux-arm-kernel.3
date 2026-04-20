Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57FDF5A8AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fwlZkaqAkipgy6piybX/zlZcoSztD08jPD+bFmkPvg=; b=A17eGZf/lE0fXXn26qR8GaOZ6s
	Rq5bIUwmoC/aSF/e4Ez2bF5VZ/EU+m/T/nPoFEsfJUEd5oqA7nwWbXL6Il5vQEy6/FY1fNtVv269v
	yWRWg3mpVWeEHuEkG+8b1oWPz4mPgROjlDJspFF+9BJfDrTIjs+il/iZSrhETQcE9IItHjbHB3vH+
	eeO3+IL6lOIi0nCjbmL2gKzo+f1+Zv75ifjeu7xCGRVq+vCZS23DCXX0WDlrosp1rVL/ksPqhEETO
	MmKASkQ2VpfP+A+FdkFyIQsbM7XUOQvUyr83DyJnPN0JKYVl6ENYd6yjRNmHcr746MW+dxXCdRGpm
	jmezwdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbc-00000007V8k-37Cu;
	Mon, 20 Apr 2026 17:40:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbV-00000007V2a-3qnm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso8047975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706812; x=1777311612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fwlZkaqAkipgy6piybX/zlZcoSztD08jPD+bFmkPvg=;
        b=OQCXdPJJA37Yoyk3Ev2Z5WOojAnV4FqNW3L4Pkhqt5+D3lPmDASr7CxxnvhZMEWleZ
         LoccXv+FmW0FY+sWpScheoFmZN8+i0r1AJOfk3z5Qc41Nt6JAZ6VlL4nFOjAhdIZbNjJ
         ba4fOAojXA6POoS9lDDnENkDWKu5/2knAcubI9FXG1zKGMCP+eV/sM4OQWf6i5cHRHty
         QRhG2fZC/pCIEdYjcuu9ajNPHNtWbuvqZXW6GdP/7zeDxx8jGq/wZwYx9bR7qHd8H+Kr
         x7Xm83U/1jbiVXVBN8dXxxlmWlqu3YmHSnEfL+q8YhKyjF2pfD9tJ2dp/76Di7CnQ/KC
         R2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706812; x=1777311612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fwlZkaqAkipgy6piybX/zlZcoSztD08jPD+bFmkPvg=;
        b=lGg3yNusIlI2k8I0Oboh1iBWuZD4BElEbaUZpbVbkQCdB2VfTC8o0zGvrzteqDCgiR
         fBTEBctImdPQfXUeez4H8IbAIEKaEBzM8QLGPhlj47OOht/jaORP82uxYLvaJO0xlwYD
         u69aLwaiuqqDE8VHZk0A/tqkjbIcQH/Ky7qpDsvx7jSlIiSsCpSZFX9zDUsU0yjuhH0P
         j0hNiLNPLTtsTAIzAOSTFfB3d6h/0I5DgwlpQKuPW6Ny1s8/BR0GMigtO5LHy+bmXdtw
         CTUoCH6Eyy6LQJLbNU0r0zjdg4YVI87wTESn7UxmY5cTLsHkCzL0Nw/6i4bjKp1Y4JMK
         C4RA==
X-Forwarded-Encrypted: i=1; AFNElJ/XQeSvnNF7KYWhdjMCzyApqkgafkoSTupVTZLDuW6WVYBzkrBNSVi0N4UomZwrLzHj1YWN5qt9mQauTrv+3Jw5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ZM3X/j8EmezxnRLSVvVCHquvV+ywsBRosP39hBsl10bbSri1
	kiJnAzpBzJWWpElqRHZ5XI2r7Jd0dh9xzdI6khHgilkXH5cMqUpA0Z3gZyVXqHLL4fk=
X-Gm-Gg: AeBDieuMBkIcz1sZtcMHyR4AXGiNmj630NDPWJHzlc+dt7xmq955dvTYMBiStDjTfPl
	TCeDg5couK2Vs0bzAK5K5BINuGcIGRc+KOEhw0kwOpdE5MX4SuWMCi1qhKequIjdwPyzrXYn72A
	HkQ2ZmIQQGLyMFU+EUEbTEz83LF85WWW4l8JX+KoT0SewqtbuxfRc62vQaxzBaBgEunOfOxlbqU
	+PxR8WdA9VmdHEIpAlxVPxHU6wth/6SN0h23U+C3Uk7FQOY2W5XNmDAVgAVgufncmJXYm9WuLR3
	fCrrIfC37POft0lW/5n7EnMQH987QjGr2jjVSeRlDx73ZG+ZwWrfv1edDcUqAOUknPNVjg4FrWB
	IvMpGPlyMUb8bl2fDaTH6VuHbGIoN/d+GlN0vOMhZA/GRlRPkJ61STmovgoaGMQEzrNs+ICni/y
	n0W9RYBsWDGRg3mk5mzW0lyC19d3v3VZS+Wop7oYDG3177npIZMTS6S4tV3HKsRl6fwLrHyytOR
	LzkeYUF85PbKQ5N0w==
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488fb78ba6fmr175032275e9.24.1776706812164;
        Mon, 20 Apr 2026 10:40:12 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:56 +0000
Subject: [PATCH v3 10/10] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-10-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=816;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=b4zN6V69pfC0jSn1B6TPnsLWLax41ajhjGEGhYeLmtA=;
 b=WOxgRvOtzj9KL76srvu0GVEREFLVVJ/F/w3yzCSjd20IjCwgYQ6jiBj/Qn2GHV5jR3DQEJmfQ
 HziKyX9JAqtC2Ws4BV2sIldy6WYYbWuh1/1Pc0VmL0pBFzg1xMme3pe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104014_043853_D5D22BB2 
X-CRM114-Status: GOOD (  10.46  )
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
2.54.0.rc1.555.g9c883467ad-goog


