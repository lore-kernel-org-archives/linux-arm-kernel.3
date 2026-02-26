Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09E2FD8FC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=voOK6OZwZEX8WOdHmmT2ZmjcPsrF9B+18Mhvcppjino=; b=JPfphSmJ4XwY30
	LwYNjkQgWKrvyqCaHi4RblxjfZLoscuH9P53o5QmLm516i+htfZUzi+12EcHIcVIcv37WAbE/BEee
	9rOizdKLhC8UW3CmqRVO7Vor5PBXGd0wHz9Sgx8t+VkjNvLp3PRB7YoHEQ6jB1iZeQpEPYmS5kb1G
	CQBYPmZleCJGWpmtq2EN3v79gEXHfyjO31hT+jtzNKGkGmSoYbIjfFo0+65PD9ED4pqMFcc11MWD4
	/q01KGWT+GsR8RMEfsX3fAejArzsSqxJ3ibYUPVWE63FfaVOU4imj7XmZc7BtKn7QZaHybrSt8PUf
	rUTcnI5SDiZhKjsLvjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda8-00000006Y44-2mH1;
	Thu, 26 Feb 2026 15:47:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda7-00000006Y3j-06pM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=voOK6OZwZEX8WOdHmmT2ZmjcPsrF9B+18Mhvcppjino=; b=mZ+HPKHcRA96rejJPZA/8YWJmI
	f0Kq3ekGALrVMtpm9aHsQ1o+BpblCyncX0ARSeQAeYdBPz6J24kGlWgDO7jeRLNIP/Y+UJI0vc+6j
	zZEmH5WqbYqdDIruRrHztQD9Bwb0yuNeUAUhUYm/gbvT8y6aC7I6BFG6PcZ74r83XueTT0dyyQO96
	5Vxc+6NtigHLCN2SoUTnvZvdd4qkL+CYmynAfTU8zU0oK9/iKp/IxFF4yqqIQS9KGZmmoh30l9v5B
	Me6tSvVm5vKFkXDG7gS6QVt2ygLVhZmLq4isoTZ4rNJNDR/u9gvmiOePEDvZt+JvN2hFAeJ2nF1AU
	3xE2SVmg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda3-0000000BMx7-3dug
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-483a2338616so6708835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120829; x=1772725629; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=voOK6OZwZEX8WOdHmmT2ZmjcPsrF9B+18Mhvcppjino=;
        b=YIMYRgt4hEH0rncSv0jAky+vpXsL8efbxXzGW4JvsNyftdyZBje1Rx4IhvMpKFjuyE
         pA20aPrG2w8GffCAtzMcRRlGkJSiIMC/XDeiWr4zXZrcAbltFRy1Ob1MScTftMcyncfa
         MsU4tXTDWE5IfpVhu+XuNDNUM8Ao1kR2VAcuoCkgx4OPqrNI+FJhklXNnKKFm5No0sXH
         QIYFo7rO0tk/oe449yK2V6Savmtu252a1d5YaBi5dLreZMWvKW9cpUyf3aKxzaPYcUng
         R10/ap2s+ftswyKYUysh3LSkwUm0V0Q8kd9Z+vbG6GsRaoe7MRh76uABHMrq6TFnDjLA
         pg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120829; x=1772725629;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voOK6OZwZEX8WOdHmmT2ZmjcPsrF9B+18Mhvcppjino=;
        b=Ar/42nG4QtbMmUwQzdmYCdH7BFPbs9gfDGAay6uMH8yIgGZnDRwZVNORbSBAqAR5hV
         Un8wkyuj+KygxT3W2bqV20Mv1J5SPDjK5CqKqGv4FS38vqjIUG9Wzzmd2D37X6C26r4+
         yQyqOjyIavJ7Gtc3X0HHQYenOh5WTsVhFqK6wWnRwUxRNCnA0zJaQ56aWAsWf3SYB1Ea
         bg8ndb2e3bFO0Qsre2JKjGVIvPuevvEU57WuwXbDqUNq/ZNa3a8n4acQtDCMNiSVmrJz
         NUoyXwpM6EtrJ1oNBcD7K9dQSZlMoe0+7hrtQGw3vvZIIpdQMRJ9/1f5EbQ6zPGRduSq
         DuOg==
X-Forwarded-Encrypted: i=1; AJvYcCWQJIo+5nrrl1wiRshiIqYvXfdicA5W4nlisk1j0a+X0OvlqrgU+rQUQYXHG/HzVaxXhK3kRoJcrVGgZNnFScPc@lists.infradead.org
X-Gm-Message-State: AOJu0YwxiryAEdVpXaJOkM39o/VhJoeufoZyHDjaJkzf7LD1dfhU1ZXa
	z5wbxWylRKB/UfnWyODA9iRP37Qhp4hntP9cXa4vxRCA8oWMqXxt2zHCrv2vCS+Y2Rs=
X-Gm-Gg: ATEYQzwj6fmR/LxjE8/Ud/+0wy7s7DpxJ1owqoEFmN1WtHH/gEoKxclMuv6D7PkgRCS
	az3nddE3vuZ2lgC4ilG6uPXa5uP/x6Us/26bnTsMSXhXVaEIu4j6goA4iZcK9UTGOoZauiZlEQm
	LCcITFJw0JzzE/nNjykal9I48QcyTnAYNqzDP1kgMuErjiq9QIxDrRgAZDqVmrGUyoGkQdea+sF
	mneAEalo9iIfCcAnW/T2m/xxiSjJjXlsNqF3hBEo7TW7Aw7/uI0eQ7hU06+S1rlLpdukW9rGJdO
	UxYxCAGwOBUrSmYGUxWAMy26XCncFPDJhs6dp1an8k8/G+JhJSmLsAMSznnNiIi9IY3Sv9Elk1x
	LIRQ/co8unhHzyPOzhuOEXmVWNzvw+aSxdVFMqjuOW8AqVfaFSTzAYNiTlesOIqwHt3pp8kfaCC
	tRwQW94sNlaGZrdoYNEwqb4saIFEjRx6ipd89wSqQw27N5Q/8X83wmJ++4dHNRfW7eOA05ckQI1
	/1mm8dzczJHD/Q=
X-Received: by 2002:a05:600c:8211:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-483c3de3dd6mr48592575e9.16.1772120829407;
        Thu, 26 Feb 2026 07:47:09 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:08 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH RFC 0/8] Exynos850 CPU hotplug support and pmu_intr_gen
 cleanup
Date: Thu, 26 Feb 2026 15:47:06 +0000
Message-Id: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpqoGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMz3dSKyrz8YgtTA93kgtKM/JKCnNJ0XTPLNENLc7PU1LRECyWg1oK
 i1LTMCrCx0UpBbs5KsbW1AF9OfzFrAAAA
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154712_010809_120EFC3A 
X-CRM114-Status: GOOD (  11.82  )
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

This is RFC series in order to understand if it is the correct
direction in order of moving forward enabling support for CPU
hotplug on Exynos850-based platforms.
First steps are generalisations of similar routines and device
tree things for gs101 to make them more "Exynos" friendly and
last commits add actual support.

Tested on Exynos850 WinLink E850-96 board.

Some commits need to be squashed together probably but at this point
they allow to better understand the thinking process.
I was thinking to merge deprecation of google,pmu-intr-gen-syscon
into the previous commit and renaming of GS101_INTR_* registers
should not be a separate patch.

The {offline,online} calls should probably be moved into a 
SoC's DT match data since they look to be SoC-specific at this
point if we don't bump into any surprises here.
Please also advice if, for instance, gs101 calls should be moved
into gs101-pmu.c or exynos850 calls should go into separate file.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (8):
      dt-bindings: soc: move and rename google,gs101-pmu-intr-gen schema under soc/samsung/
      dt-bindings: soc: samsung: exynos850-pmu-intr-gen: add Exynos850 compatible
      dt-bindings: soc: samsung: exynos-pmu: add samsung,pmu-intr-gen phandle
      dt-bindings: soc: samsung: exynos-pmu: deprecate google,pmu-intr-gen-syscon
      soc: samsung: exynos-pmu: rename GS101_INTR_* regs to EXYNOS_INTR_*
      soc: samsung: exynos-pmu: generalise GS101 PMU intr gen for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |  24 ++++
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/exynos-pmu.c                   | 137 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 5 files changed, 155 insertions(+), 35 deletions(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


