Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793EBC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=; b=ZpfGyuaWnlavoKvn7qpC08cqq8
	HSPAduA+cdz5+CDGS0XlZ6gif2cMFF9kBNMyQkPghxiUCHDp8213yKFWBCdnkmN6QL+Hp3MXJJyP9
	o/hsn5mhWFe7Kvyvfi+VwBHCo85aeZMBkRJv/7BtMfPLMwb3TKJir3bbEbtKY3QBTxTqXsb9Wy8ly
	TAMYtOzsfHTLpmEv0urCftR7l8m8nDWqtrq3mURtBn9Gk32oUpZtEJns/RaPcoFvR/cxHriutifUZ
	YHYq8oFg45U6Ck8DbxuS00ZIswrYYsmSeRygs4B+zHYxAIetl2bEP0pMMBIKZR2bDu9LRqRhJ1jVf
	AqkKrUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9C-000000015j0-1UOk;
	Sat, 12 Sep 2026 19:12:22 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9A-000000015i9-0w6a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:12:21 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d249c6so1028094b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240339; x=1789845139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=k58jrngUlqH6cMygfOO4B5yJyOazJUp3+I8RqAtGcomUl0DE+GWAVnwHPeqE6z3Nia
         57RIr9DEQ/lg7T6eIcTpJcuxtPkxVdlq7masKdlpX4N0a3MZxY07xN7lP4r1k0+ogdeD
         3SjMpTeW6orvG3CuBY4KnN9kC72G46/Mpdp7abLWG+5zk6tjLrbR7njlDJyuHr2Upk4J
         RLgi0OCpL68X8NVGqcgxFdRSv88JLsIZJS16++Vjb328upjSnAajbU9VLDtqxq/AK47p
         ELXJA5Kk9tNxqnrbe03tYskVVm2aGakdxrKygYi4RmwHhk67z39WTCfenHT6r1rFUsqs
         PvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240339; x=1789845139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=LyCnQGApvFNJnufERMvvlrDr1oblW8gzVPYj7hCBhXQUlWEnTYxgn3N/ZbauGkcodS
         +9aZIWJL6N5JWkn9fVm9r90GiVXTQyh1pfwDmLlhnr8ILmOSNzSiq+bYIvDQk/7LhfhA
         vvyWYmFg5+2S5EOtiib5uesKdRkG08yvPwd+BylKjxa1WtHwi/qXtQltgoLsSXTie5ko
         cA3P9BJJ4dDzK9KkRgjVBKaEpIZw6JMbSU2MGVxFoAApqdjtz8GugiqcI9VW1a/gSP6p
         TCmPRqEY4Epf1qCO2iF6+4hWmVNLZXIfucZ372H2BThMH+6Oo2DNdHo0jqKsHg/V04oK
         hzDA==
X-Forwarded-Encrypted: i=1; AKwUvBwrSAUPjJGnwtmOn5L23IOgZ08oFOnMMUccA/2Jp07Qf7SVSoaXFJ3sDMPZmS+R/2XrVx5q9awz8wJfO3Plol9W@lists.infradead.org
X-Gm-Message-State: AFuF++nC5FzCdyiSnXhG6ML9n8c8qLhFsJ2u88RWKz+jRXFVXlwFFfU2
	GY2zVDuu4S/tTQriiJsa2VjkYA7ZNdJoCbOXsYR1CZaaM0gme3Mf6HOe
X-Gm-Gg: AYBFou3vHzbW+rY2FwRY2KowcRtwPz3KcvgoGtZcB366B0Wk3UIPYE9eYxe3g2H9nJR
	kIDYwjT02cDKo7qAjDb8TuQKqfGYZNy4pPMOM/anFiQuLSfcmQDd8W4gpNEowS36Sd6MEjEf2nr
	3WuUaM8V2ksuBx3Ldws4DFdMl3kuyNuKlCZ/9FaDqKsUNPRAnHmrPeu8qQgBzuwD4qUKypRzjUP
	39DVUXqMVcyvelfoWTFNQ4Bqx/AdUhxto7n7qDhCgK24uIdAKW99acfBEaSyzsLq/hwaWYLvbdr
	9jjyMIN1iF/bUXAzJIwiCG5I+d6BUG8PjwnUkG/yawSG07mokZ50e+OB7zqr0joTKzGPJbdSH+C
	Ix7793bWzsBFgR/kZGcYerl+zgndQE39xUFhw6b7Iwq2o/BQ4aVy0ZkGacq7gQUb3lPYJa5YCOC
	o0kFGCQvrwR4mPIyNHSqfi/A+vOUzUxYCErUZVVT/5eMdvvUu9KgLzpfwWUAdQtK+UpMW1
X-Received: by 2002:a05:6a20:a128:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3daed19f362mr18812158637.9.1789240339105;
        Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:18 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:50 +0530
Message-ID: <20260912191156.185448-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121220_286265_FF0F5A2E 
X-CRM114-Status: GOOD (  12.72  )
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

This patch series is a cleanup for subsystems under power management
(linux-pm) that converts several instances of error pointer printing
to use the `%pe` format specifier instead of explicitly casting with
`PTR_ERR()`.

Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
print error codes returned as pointers. By switching to `%pe` and passing
the error pointer directly, the logging subsystem will automatically
print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
`CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
numeric value otherwise.

This change significantly improves the readability of kernel logs and
dmesg traces during debugging, without introducing any functional changes
or side effects.

The cleanup has been applied across the following PM subsystems/drivers:
* powercap (intel_rapl_msr)
* thermal (cpufreq_cooling, devfreq_cooling, qcom)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc)
* power/supply (various battery and charger drivers)

---
changes in v2:
 - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
   for *_probe() functions during review of v1 series. This will be done
   in different patch series.
 - Here in v2, reverted the changes for dev_err under *_probe() functions. 

 - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4linux@gmail.com/

---

Sumeet Pawnikar (5):
  power: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  powercap: intel_rapl: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 14 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.43.0


