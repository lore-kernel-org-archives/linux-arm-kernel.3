Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67706CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvM7pahAjxlhrr61LEyDzqcCT+Fc1a/WkHWS05sPsSE=; b=BtG2THqR/ZGVT1
	PpxQzq15otLIeYiKywiGaeE2T081R3bg4Xc0ucddcIhveMbMhFTrKX6azUlQgsLgEkcfquM1vrqgW
	wstYfOXurYKz5pqMXksBcxnJzmMAjUkJUQJw4mq0GRsh/3OckC2B8iZSIRFw+qvVukqVv37Ki/qOW
	gNX66RlCaAC2JMQrVzWD3oayS7uV0DPe6i/VM4ot7cniAQixm44YKLpKz/bs4et0/PqG4tmFar36W
	0jEXDhQZ7UAg8s+sUGzHTFDdBRvpEr9xIJQbaZrwf9mpzQ1GgMTjCs76YHD5fYKX8FHhNFt9NAzOi
	pacdgNlu7vSH+77AGsrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtaw-0000000ALc7-38DI;
	Fri, 12 Jun 2026 04:34:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtat-0000000ALb6-3BkN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:34:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490ac10e337so3039115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 21:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781238849; x=1781843649; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvM7pahAjxlhrr61LEyDzqcCT+Fc1a/WkHWS05sPsSE=;
        b=yyKX0ON0C40KYw0HSMXvWO/LxlZt65Q8MIBeyar5Q4mjoTBFlu3LlMAiYUvp4gv4xL
         Z4mT2f8zcBFWFvQlyvFkYzkXzHJxY6H9nDZa8m4L43BX6UOG6rWSBXeqxyfDtiXBopkX
         v7NdRcMaoepzxFAlLwPOa1Lemld3Ri/rV8lu2DfXKu9OkJuGSZoUQm0hES5vo2OaBMGC
         XuTKqCqpQZlTf1L+UEox+wPoadyi8OgOLhrhPVDKZagr2c5FaaIMZvrY6nHSq8Er6bs4
         X5CXaCgRd0ub9lmP+e8wHDqqTTdQ39o17mr/F1GV4mDwcup3ZRTqRSNDYT4rmNlq3G4t
         g5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238849; x=1781843649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvM7pahAjxlhrr61LEyDzqcCT+Fc1a/WkHWS05sPsSE=;
        b=SYlRaub3IPa27vh6S+9UssslB7jFAx7FP+DO5UxUhSV5sJ9r9tzWh4jQeVLaKQOpJ8
         5OyF/ejcDpOEiIyBdBA/Y9mJfgdq9w5daX4Bj8nQFbVwtUBtnlXntHy6fC6T4Xn2SrCt
         XD6tFx0IibdNT8CRpp+SCSgJzAQlkEzorEgNP8QvIwLPrjWq3I44iwrxs8xcDQJN+j89
         7F9rfPvlIUyz7fXHaognDQHcHC+dbCPcDs40zWc1LKv4+atlPwVGxiPiSaqWk+63Qynn
         LdvmGkcmt0LHlQ4cscyzfUu6Y/OXQ1CkcJSYT3Gj4vgH8ebmeM9di6KiiUhMWN4S6Fc/
         oPpA==
X-Forwarded-Encrypted: i=1; AFNElJ8QF5zHeok6OcZnDGN+l208Y7FfAIVbtLXeBoFGTp2mWXiqQkxLh+cl0SjuZoGPrj0SJY0Nx8XSRESTIN/GsEJ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzst+SAgXm7QBD8ZiaCw+NfMKcCf899wVAhFKyFNkm3m0v/toUd
	6PXOQPjog57frFIJc19FlXn/h4Wn9ZxjWLy5NTJ+ZTQX7OiZfVnE9X23rhUnKWS9WG8=
X-Gm-Gg: Acq92OFeo9isYzATSH+5TKBy/ECeLmIu7CUltf1gUQqZoV14+elSOKWTpCW8nX54lKN
	Tw3JrzmFqDDFTsSqndOCsr+oLLkyDq7guiQeUhW4NUbh8BTwjj3suA4+BzIAItPlwHjb3reR9jA
	YqXEfrLzoJxKL63ViS9EW9mA6EcukmedbDPG/U3n+yXxkm7fMmBa7vBWIfP026CgTXjTSg5Embu
	GgHBb6GuKnoXhfOX2lqTUPmvm/AMhFIKTJc2jhqN5g9FRXAKsy3jyxdR0bdg21kjuKHRIBg6g/h
	QqnVfnSMj/8txqKYhMOI91KmuklOGuE+t4M0fSzJdPZTKz5+KSfO9F/wVhMxzA3UlhyR8kexpmy
	unkx7aky5UuPCOTCSzNOyLP8Gpd3kyGQE0+/LGW7uHjvhA78JnOZmOWOpbxXSzwFQg7ERKcb/ij
	HXKLdVX0/sfudjSlxRDaYfBfAK27/StKGUD9q8zmGh+MqFYk0Pw1BDPXi71NNq5NGZKu4vIYPPr
	umTLezTpe2sCO+F
X-Received: by 2002:a05:600c:83ca:b0:490:aef9:aa3b with SMTP id 5b1f17b1804b1-490ec523ef7mr8700565e9.32.1781238848787;
        Thu, 11 Jun 2026 21:34:08 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83da91sm36134865e9.10.2026.06.11.21.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:34:07 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] ACPM cpufreq with fast_switch support, fast path xfer
 in ACPM
Date: Fri, 12 Jun 2026 05:34:00 +0100
Message-Id: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADmMK2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mj3cTkglzdtMTiEt2KtNQiXQuzZJOUVHOLZCODJCWgpoKi1LTMCrC
 B0bG1tQB8iyBQYAAAAA==
X-Change-ID: 20260612-acpm-fast-xfer-86c4de78c20b
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_213411_846697_9BA045D9 
X-CRM114-Status: GOOD (  11.72  )
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

The series implements acpm_do_xfer_fast() that does as little
as possible to make it usabe in atomic context to eventually
use it in cpufreq path with ->fast_switch(). That's basically it.
Cpufreq deals directly with ACPM dvfs instead of going through
clk framework.

This series is Work-In-Progress / RFC.
This is currently a working prototype, but I am sending it as an RFC to
get feedback on the approach — specifically the ACPM fast path of sending
messages. If ACPM part is no-go then cpufreq is not needed.

Known TODO items:
 -- rx/tx channels locks rework;
 -- initial frequency fetching: Exynos850 firmware currently lacks a
    clean get_rate, so the driver falls back to dump defaults until the
    first freq transition.
 -- potential mailbox channels re-implementation.

Any thoughts, testing, or feedback on the architecture would be greatly
appreciated.

This was tested on Exynos850 with example of DT nodes described
in [1] and [2].

Dependencies are different series that adds Exynos850 ACPM support:
-- ACPM mailbox support for Exynos850:
https://lore.kernel.org/linux-samsung-soc/20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org/
-- sram DT node:
https://lore.kernel.org/linux-samsung-soc/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org/
-- ACPM support on Exynos850: 
https://lore.kernel.org/linux-samsung-soc/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org/

(the above dependencies pull some other series as well)

[1]:

cpu0: cpu@0 {
	device_type = "cpu";
	compatible = "arm,cortex-a55";
	reg = <0x0>;
	clocks = <&acpm_ipc E850_CLK_ACPM_DVFS_CPUCL0>;
	enable-method = "psci";
	operating-points-v2 = <&cpucl0_opp_table>;
	capacity-dmips-mhz = <250>;
	dynamic-power-coefficient = <70>;
};

[2]:

	cpucl0_opp_table: opp-table-0 {
		compatible = "operating-points-v2";
		opp-shared;

		opp-130000000 {
			opp-hz = /bits/ 64 <130000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-182000000 {
			opp-hz = /bits/ 64 <182000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-247000000 {
			opp-hz = /bits/ 64 <247000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-351000000 {
			opp-hz = /bits/ 64 <351000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-442000000 {
			opp-hz = /bits/ 64 <442000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-546000000 {
			opp-hz = /bits/ 64 <546000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-650000000 {
			opp-hz = /bits/ 64 <650000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-806000000 {
			opp-hz = /bits/ 64 <806000000>;
			opp-microvolt = <656250>;
			clock-latency-ns = <500000>;
		};

		opp-949000000 {
			opp-hz = /bits/ 64 <949000000>;
			opp-microvolt = <681250>;
			clock-latency-ns = <500000>;
		};

		opp-1053000000 {
			opp-hz = /bits/ 64 <1053000000>;
			opp-microvolt = <706250>;
			clock-latency-ns = <500000>;
		};

		opp-1157000000 {
			opp-hz = /bits/ 64 <1157000000>;
			opp-microvolt = <737500>;
			clock-latency-ns = <500000>;
		};

		opp-1300000000 {
			opp-hz = /bits/ 64 <1300000000>;
			opp-microvolt = <781250>;
			clock-latency-ns = <500000>;
		};

		opp-1456000000 {
			opp-hz = /bits/ 64 <1456000000>;
			opp-microvolt = <825000>;
			clock-latency-ns = <500000>;
		};

		opp-1586000000 {
			opp-hz = /bits/ 64 <1586000000>;
			opp-microvolt = <875000>;
			clock-latency-ns = <500000>;
		};

		opp-1742000000 {
			opp-hz = /bits/ 64 <1742000000>;
			opp-microvolt = <937500>;
			clock-latency-ns = <500000>;
		};

		opp-1846000000 {
			opp-hz = /bits/ 64 <1846000000>;
			opp-microvolt = <981250>;
			clock-latency-ns = <500000>;
		};

		opp-2002000000 {
			opp-hz = /bits/ 64 <2002000000>;
			opp-microvolt = <1050000>;
			clock-latency-ns = <500000>;
		};

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
	};

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      firmware: samsung: acpm: add fire-and-forget xfer support
      cpufreq: add ACPM-based CPU DVFS driver for Exynos SoCs

 drivers/cpufreq/Kconfig.arm                        |   8 +
 drivers/cpufreq/Makefile                           |   1 +
 drivers/cpufreq/acpm-cpufreq.c                     | 195 +++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c               |   3 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  14 ++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 142 +++++++++++++--
 drivers/firmware/samsung/exynos-acpm.h             |   3 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   2 +
 9 files changed, 361 insertions(+), 10 deletions(-)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-acpm-fast-xfer-86c4de78c20b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


