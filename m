Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2228CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6opwUVOPGXBFiHif49iUV/cuGJwm1ECibxjiyMFNcWM=; b=1KkC1GnC1x5s/F
	/4mme4fXY2efod/yFN7C361qvYKsJywaIAk+WbFEuKJIGUbsdtdqlX+U7r8tKyYNmSefcqpsi4Mz3
	Lbdh+FgrG2GKG+HODSHGIjPPdbRysnBxZdGBtcBIph5py4w3bjjXSD9wRX7buWvDi2r233fMXC1rk
	986t9zLlazCePlFmbaZUwjAKmRYMsdPi3CDSFW35nHi4tOfgQXQ89qBp5TlSCH9MTVPbUjvFUUWZW
	BUlVU5RNMTUu3vKhbTpPlhlxwKjMbeqMtaFynwMLFowa1Fg9zK1NcaTdzQYZKwp1eilJS9ZHDIvat
	Bk2FasPteBfTysFYQzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwf-00000004ndn-46EX;
	Wed, 30 Sep 2026 00:13:13 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwc-00000004ncp-3GUW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:12 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so35210795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727189; x=1791331989; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6opwUVOPGXBFiHif49iUV/cuGJwm1ECibxjiyMFNcWM=;
        b=sNcJCXZIojvhLhL2oBR1frs6GDqbrPjY/ZFiLj3f5pvHV1sW0Z1R0lK4xLbpCa4usX
         bF7x3DT8FecSte0aUAgDtwc0L4Zvz1pZGn59n7UiyJ6GTvhwDb1gCk5npQ/VgvVILjVI
         w4lxXvwLU+P99+pjKGj+EfJqkSAkq+M3E0Kf+mzHDwWjGEXB0O6g+GeRmcirw/J6O87k
         fTzbuleUC8MZzxuWq75eqvkcKYZFDvMnQ1v10btdRbxSB7STRaBTv9cd3Mcy3Jk9thba
         s86+g0KHFRTLRrf47fpP2/xWbHfkj3hn9jipul0wOdPEjJq6ehMmZw9SwPRC4NVbP34Z
         pc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727189; x=1791331989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6opwUVOPGXBFiHif49iUV/cuGJwm1ECibxjiyMFNcWM=;
        b=0nEvvigeV1Gz30RJbdR9AVOhFLo8S1I3x5y69UEKycSWxTTRjYoT+eOccMAbX+PnwW
         5wnq8tIFmsBqDEr0XJkCePfCgvg4Btg7GpZLZQPggAQC+X8iAh2CBSqz/5t+jTkzJD0h
         VdKUhkf/4m5prjA/8GrALF2oeFpiRGrbb6CsF3CXO1S+09UXr/Rg1Fl9x0F3IdymzoMJ
         vmdAlBz1fS0zgwXGKEfxlH/2CkNL/+mzCXqYdjlI9mp8kWN180LGP1EzCKWN1rQlx2gi
         gqHUGnam2tZk1/qPLmDCFaOVJMmX4flT0Nfan8jCSaJw+d/jMKFFniDJfGs7j92SmQuJ
         bKqw==
X-Forwarded-Encrypted: i=1; AKwUvBxsU/lyZ15eWaCvuATr+ZqlA6xe1XHIl7V6wrsuWZVoU1q1ce8hEQg/yzHDRBKhREp1/VmXSxm5o5LM7HrHJr4W@lists.infradead.org
X-Gm-Message-State: AFuF++kq0oA2CKDTU9kpW6IMRLjooUDZJClf+VMQmmVf5ZWXTuiRQ4Dv
	dgNXfYtKBYXtdaJUpTuTeXWCM2BaO4+f5TRkz78pOB6nDVo9q39LqnJuskTuiz2jMNE=
X-Gm-Gg: AYBFou1hQ6NFHAW5xniLQZXAKxaFKTEz1LxBIbtSaT39CI76xziJwjnEFQBHuvkDzml
	a1Q+EvJ6wjY+RoN07ohlHIK2hHHumXeuChZq/kvtAyWQJlAnaCI0zJZEAAxp/NUte1zRtCZyU6w
	QLRgXKqvVSyLm1pnhSMWvNnhZVLjnV2XxWxKzwn0o7oxM8lcxlhxQc5ehhB+mfDTuow8KYfOtzZ
	UMs6vE0/NlN3sftkQKC1dXddSOfM0IMe2K2yOfaVaK6OV5CPd2Xzi6vHgIl+GzhEqEGwWDJ8GRZ
	EnvJ9emxj470G9fjB+ST3oey8YTxZfDl7Q4GifC74zORlqk6PVbH+usVKSnOQOyGb8lE87lcVUm
	jla+pycYqj0W+sisSdw0YW+TgAFe0UtikBH4wqku+ByyzMtSIUo0f+QorczaqM7JvHszwa0UIb/
	XMl7+WiUzVWa2rqIk14aV1zp06rGiQRpKjoOjvm3NvBnMzf1NbBW+DGb3prYldcE++dp6OaZYqO
	CZRzABwMWScdsuz+10rKaXotG3dDE5A3X1p60a1WBfxmkGSw1ZxipfOVMmYQA==
X-Received: by 2002:a05:600c:4744:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a014fd1fd1mr13203315e9.4.1790727188823;
        Tue, 29 Sep 2026 17:13:08 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:08 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v7 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 30 Sep 2026 01:12:55 +0100
Message-Id: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdUvGoC/4XSzW7DIAwA4FeJOI+JXxN62ntMOxBiWqTmZyGJW
 lV999FUWlZF0Q4cDOKzsbmRhEPERA7FjQw4xxS7NgfmrSD+5Noj0ljnmAgmgAkBFC/XtkulZtT
 306kb+/N0pGADtwYQgytJvtoPGOJlYT+/cnyKaeyG65Jl5o/df8CZU0YNr41XDKQsxcc5tm7o3
 rvhSB7iLFZFMb6jiKx47QwwJ1Fou1HkH0WyHUVmJdQgNK+ZcNxsFLUqmssdRWVFq4BeB9ASti/
 SqwLM7ig6K6USwoeS1UpWGwVWxTKxo0BWXKmrSufFefmi3J8DHPB7yt9hfE6RNJiSW77DoXjqv
 /2ifTMtfJ9Pz0iX0T/axqkSYOtcr7bmJUlOUbmE1HdNE8dDAdJoBO4ZRytRakTjfC0lOCit8zw
 4VJVmNld3/wFgJaWAtAIAAA==
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_171310_877382_87B7EA82 
X-CRM114-Status: GOOD (  19.84  )
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
(if we get our hands on correct firmware).

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series depends on
[PATCH v3] soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup
https://lore.kernel.org/linux-samsung-soc/20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org/

Sashiko bot reported issues here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=4

The are basically no updates in this v7 series, just a rebase on top of
an dependency patch.

This series was again re-tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

Thanks to Peter for testing!

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v7:
- rebased on top of -next and patch (it is dependency):
  [PATCH v3] soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup;
- retested;
- Link to v6: https://lore.kernel.org/r/20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org

Changes in v6:
- rebase on top -next and "fixes" series, basically no other updates;
- Link to v5: https://lore.kernel.org/r/20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org

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
 drivers/soc/samsung/exynos-pmu.c                   | 149 +++++++--------------
 drivers/soc/samsung/exynos-pmu.h                   |  34 +++++
 drivers/soc/samsung/exynos850-pmu.c                |  95 +++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  51 +++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 260 insertions(+), 110 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8
prerequisite-message-id: 20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org
prerequisite-patch-id: d9ac215f16060e07e9cfe193e7c9af7c8913bdae

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


