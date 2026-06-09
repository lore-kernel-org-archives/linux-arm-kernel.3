Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4581FCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HXI8ebcI1laHpv8StR8ZbOvqbXt6rEwPLhMGagqpgZk=; b=dq25ZNjMeFVhkD
	/j+B0u7kcFsR/C7+dsvh2G7/0qeyWv35UpOM+VfOtQnPmgd+d6cP0TgUqcqZI6Ze1TP/ulHhKu/Jy
	sDlQ3YhTGaL3KV5iwqJek+Te06EXWb7KLAii/nc8Zt7CEAX19fB+NYvz+qVYHEADl++uZFuOP84FI
	UCEBmDXhwLV6RMoZkJWjd92fWwj3qVKaOafpuACA+kgBb/yHS3HGHVbqPtOCBFzXltyXvME8sC2kn
	pVnT2DnKJPP1UjUnOA8pwDK0qnaD8F2wE2lbCZfZAUafExVYy4uc54nHU9v/yvVX/G+UZQ+kI4osi
	mEtzwQST4lGER2nwLKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QK-000000068KQ-0UTY;
	Tue, 09 Jun 2026 17:39:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QG-000000068JU-3wRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:39:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so63272665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026770; x=1781631570; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXI8ebcI1laHpv8StR8ZbOvqbXt6rEwPLhMGagqpgZk=;
        b=DGjqM94fc0AZQj5WmAQ1KM++k2vFAmcszQZOK9NOGR5VeZnbYoYccGjMyxmx+Q7InA
         cHeG7N9n0kzaPo+M7yTuZeMDv+HjvJN0UkYOP5HNK6Wufor98YsXrlGEtLt9h3HGLRv0
         5Hr42lTSsUkyOzXXd427CMZmqFr3TmOhAXirV9u/KpDbUdB8sgVp9oeCFsJpBishoL4Z
         wkFSAcNk8Yjjm8QmC2nBYg2ok6LII5DrBxBr8gbdkzWt1JsGOIdgRc4WrZUjgjaRbTzM
         HiDiFahFHauwTza/5xpWG0qs7CbCgF4xbFRbag/1k7VP4HGLkPsmjVkPSuqc4xR7EOdG
         Q+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026770; x=1781631570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXI8ebcI1laHpv8StR8ZbOvqbXt6rEwPLhMGagqpgZk=;
        b=lxxA4vDdrIqL2x4OclZiqVjMwGBh2+bTefNsPFYfmuFK8+1Oafof6hb3h08wXSRLfP
         Kynz/dwQlOy8nTh9Rjsfv3xDcz9BEyYP3+jcc8dYeRzZYXBsMjj2dvbEDuid8cWq8gpT
         /NAlkJI9GLDgfzucO0I4Dj7nXpc2JkKFD1qFfrf/BRwx4NdcKJ4YvObq2E+P928YR9AB
         cKX/M99j9wDkYhS78B2rP4fshdQ8bIgJtrpEKD8nHdU2EuTtD0MxFdHj3JlptVT8wR1P
         yzNe+CTmmcKS7WrlXuYhzVtU9ZEnZnPn0uxafYV9dEAfm7SYFoV2CFZkIp0W5FH6kWrk
         pSww==
X-Forwarded-Encrypted: i=1; AFNElJ+cgtcRsyGETHWrfVakqB8+eC0lhpMgtRumAWXtbWjiPzsc3lDamNn5ktANc010aWN6HriTy7M9AiQy8jCBR4rO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6lnbYUD2+HYNBKeJTpks4PSsixWFNUM+6IB1Koy4LcUSLBDAY
	GfJCMhgVes9mtYtwnClGuEcXry9+1SHYTXZhdAxnuXozA8iH6MbNDTlr+a+IIxkPHjA=
X-Gm-Gg: Acq92OFXM+QlBGKq2IBLkZ9y77Dw4H/1+HXmoZS5MxPXVoMzf58H43MydHdPBN520nQ
	fmXtwXDzz71p+hKvkDVxvRir4vSSM+uC0hR17AqzSY/GQZw1Xd4Xxp8C3ZTr60sANwhavB6s0oF
	2PT8w6OnVap0LrmMhSfbgCmNVcXXBgfo0dY+OoyaL07ARmKXLmqnr8prFV8f8Fm6F/yKo4TdFfZ
	TCY8PXUENiilGT4xFn6JXhia5AkOHLKWKrwaLyUCttvNLXau63QsLcO4+MmDc981VyLZU9HP41K
	t9IntRu6rE1T8kZEbJ9BdIAEK0T2FXm2BygoI2AY4lekSpO8NShtAOim++SmGiqPfZER7cRaopB
	qLIiTdcUNy17NrZKfDgjanbANdhgLEFNKUYuxi9+u5zWRWtfHDXRF1H6DdK9DrCtjpBjD1OoVQ5
	5ItR9rSKE4jmIwQsWa7rXmVzdk6FdFW65OQjcLL9dqoLLuk86u2Ds3Dqm59OlYyiwEIG7hYZnBN
	BWX4LrQSOhO2lyW8GlffucqC3s=
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr343307615e9.2.1781026770436;
        Tue, 09 Jun 2026 10:39:30 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v5 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Tue, 09 Jun 2026 18:39:22 +0100
Message-Id: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpPKGoC/4XRS27DIBAG4KtYrEs1gMGPVe9RdYFhSJBi44JtJ
 Ypy9xK7UlJFVpcD4hvmnytJGD0m0hZXEnHxyYchF/KtIOaohwNSb3NNOHAFnCuK58sQUi2BmnE
 +hmk8zQeqGseaSiE6XZP8dIzo/HllP79yffRpCvGydlnY/fQfcGEUaMVsZUpQQtT84+QHHcN7i
 AdyFxf+UEpgOwrPipG6UqAFctm8KOJJEbCjiKw4q7hkFrhm1YtSPhTJxI5SZkWWDo10Sgr1d6L
 bFlrE7zmvYNqSIz2mpNcVtMWqZ/9Xp2M/r/yYb09I17i32MBYkKZmuub2uUlu0emE1IS+91NbY
 FNbzgyroANmLTqhlAMuus4ZpzrBJDR5nyL/7vYD1TX5bigCAAA=
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103933_449777_220024EA 
X-CRM114-Status: GOOD (  20.62  )
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

Series generalises the GS101-specific cpuhotplug, cpuidle and PMU interrupt
generation block support, which is currently implemented specifically for
the google GS101 SoC, to make it reusable by other Samsung Exynos SoCs.

The PMU interrupt generation IP block introduced for google GS101 is a
standard Samsung Exynos block found in other SoCs, including Exynos850,
and it is not strictly exclusive to google Exynos-based platforms.
Access to this block is required to implement and enable cpuhotplug
on Exynos850-based boards.

As a next steps it will be possible to enable idle states on top of it
(if we get our hands on corrected firmware).

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series wants Exynos PMU "fixes" series first to make Sashiko bot
happy. This "dependency" describes sequential order of commits.
https://lore.kernel.org/linux-samsung-soc/20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org/

The main updates are custom regmap for pmu regs to support PREEMPT_RT
cases -- we need raw_spinlocks there, minor adjustments in exynos850-pmu.c
and "fixes" series mostly reported by Sashiko bot here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=4

This series was re-tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

I tried to implement it in way to not break anything for gs101, thanks to
Peter for testing.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v5:
- updated the commit message of ("soc: samsung: exynos-pmu: add Exynos850
  CPU hotplug support");
- the if-check for the presense of pmu_data->cpu_pmu_{offline,online}
  callbacks in setup_cpuhp_and_cpuidle() was moved to before acquiring ref
  counter to intr_gen_node (the initial issue was reported by Sashiko);
- added pr_fmt to exynos850-pmu.c to have more meaningful error
  messages;
- added parentheses around the `cl` in `EXYNOS850_CLUSTER_CPU_OFFSET` macro
  (as suggested by Sashiko bot);
- custom syscon regmap with raw_spinlocks for pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- using topology_cluster_id() and topology_core_id() in exynos850-pmu.c
  (the initial issue was reported by Sashiko);
- removed smp_processor_id() usage fomr pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- added/resorted headers in exynos850-pmu.c;
- Link to v4: https://lore.kernel.org/r/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org

Changes in v4:
- remove blank line in file exynos850-pmu.c, commit (as suggested by Krzysztof);
- only update trailers/tags in commit messages;
- Link to v3: https://lore.kernel.org/r/20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org

Changes in v3:
- dropped two commits where samsung,pmu-intr-gen phandle is introduced and
  where google,pmu-intr-gen-syscon is deprecated (as suggested by Rob Herring);
- addtion to maintainers file was moved to separate entry, change commit message;
- commit message in "generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs"
  was updated since it no longer touches samsung,pmu-intr-gen-syscon;
- added missing asm/cputype.h header to exynos850-pmu.h
  (reported by Henrik Grimler);
- new commit "dt-bindings: soc: samsung: exynos-pmu: Require
  pmu-intr-gen-syscon for Exynos850";
- Link to v2: https://lore.kernel.org/r/20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org

Changes in v2:
- moved gs101 cpu {offline,online} callbacks to gs101-pmu.c, updated MAINTAINERS;
- added new file exynos850-pmu.c with cpu {offline,online} callbacks and
  exynos850 pmu data;
- new patch that adds exynos850-pmu.c to MAINTAINERS;
- moved pmu_intr_gen to right after pmu_system_controller@11860000;
- merged two patches that update google,gs101-pmu-intr-gen.yaml together,
  now rename and adding exynos850 entry goes in a single patch;
- commits 5 and 6 from RFC series are merged together and reworked,
  cpu_pmu_{offline,online} callbacks are moved into pmu_data struct, and
  callbacks now need pmu_context as an argument, exynos_pmu_context and
  CPU_INFORM defines are moved to exynos-pmu.h, gs101 callbacks
  renamed. It is really better to check commit description.
- Link to RFC (v1 from b4 point of view):
  https://lore.kernel.org/r/20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org

---
Alexey Klimov (6):
      dt-bindings: soc: move,rename google,gs101-pmu-intr-gen and add exynos850
      dt-bindings: soc: samsung: exynos-pmu: Require pmu-intr-gen-syscon for Exynos850
      soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      MAINTAINERS: add Exynos850 PMU entry
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 MAINTAINERS                                        |   9 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 146 +++++++--------------
 drivers/soc/samsung/exynos-pmu.h                   |  34 +++++
 drivers/soc/samsung/exynos850-pmu.c                |  95 ++++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  49 +++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 258 insertions(+), 107 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8
prerequisite-message-id: 20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org
prerequisite-patch-id: a36b838f6524b89818ead01648e27177f002b1b1
prerequisite-patch-id: 85901b4ed10abf67809a9f28bd2be52356f93526
prerequisite-patch-id: 6e4d2217a7231375df85a12910badb8b2b8e1fd6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


