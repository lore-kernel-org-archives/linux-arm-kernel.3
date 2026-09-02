Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B8C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8ZXM9NvPNjn0CrmMZWIS02GT1iL8y1wk6OrYEe/DvQ=; b=yd4X5h0LOWwKQE
	CvLbNjUK9slTfh6bQ78hMvxUU3r7H+h4cjbWoVdmyS/kgjkF2S1iAod9FlYhPSWZZJntA7N6hrRJG
	gK2b2Q730Dt8A97EN6g7zUcQ7YGRBdt7wIU+kEvyoX/v+nI4LYkd2pP1YpEvtn9V5wuDHx5+NJy1w
	ExecO6QIJCsX1hTwE0BMJSiCyTcTXPo5YpGimhrvHh/+f9A6Y+3Cg/+sxwEghIYKMDJ10DMnh+Rix
	2rt1iO7NgGo5F0H5GKJsXN+asIaGyxTfCIudo+pkcHsKDT3x4VDSEp/JKY1AnZWevB1dKmK3GtERO
	Co/3kahnfYq258Q5nQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cET-0000000DkGH-3VNc;
	Wed, 02 Sep 2026 04:05:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cER-0000000DkET-2MU0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:05:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso3587095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 21:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321945; x=1788926745; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D8ZXM9NvPNjn0CrmMZWIS02GT1iL8y1wk6OrYEe/DvQ=;
        b=qC8XlS+TyJFFccYuLTK61YkQslBT/XzkbNDFaZKucAHiTmZB0KSwBPXaAj8faFWhPb
         H22hURB3f8hlFE0ASSsqHskbbFBP3/yfBnuR9I3HWpCnJDTTpaKYmZa9gJg9RAxGlBIF
         scZ+8GLtySIsZNGyWDk1gF/QJIhTBTSX34x0gqAKrFN3sUcdzVcjKwyJhQc0CyFjVrD1
         ZDRufq9m1bNkJFJynTKzxu8TPpb/e4iBjNcOXeGOgQMlu4yw3cDcvU7YIqq042Pmok+P
         3AZTehh1yrXSycDDNQFlwOe1HklLz191xRSAyoPB5FhkIIDqjLbvGhtV7rbUxK5aaahB
         yagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321945; x=1788926745;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8ZXM9NvPNjn0CrmMZWIS02GT1iL8y1wk6OrYEe/DvQ=;
        b=CqufL/aS3fKRf6uJToGfM8DKC2kQwruCdAe3CxlndV9Pyob21wq3lM2GmjGeoMudaL
         Zyb3v3wDlzX746euKTIng2d+PKWvJ345RumVfoqGbcKMXY0we2jghBnEqRNi3qHiuR6j
         B2AHvYL01YyRfVFoL1fUDV3PkzyI4vgwJeSR1chaZGHvaeHugGvPg71e2Do5tRuU08dW
         8wmDZ/iycKN/6Ui0zZ+hTkqh2/6/2Vfo/n0vSp7UDcCT1LXSD4BuJ2q3TT4S28MZkFb7
         5xgiokWAGep5sKjuizxD8JEzqt75nmCsLg5YuZWk1ZpjFhpIWB2b9m9xZK5h4r5hQlKI
         vIjg==
X-Forwarded-Encrypted: i=1; AHgh+RoEIwKs1vOpKS2uPckkC72N1kWYb+p5EYaLvhtdl/7HAqHzG/FEJ1UNejY8UwB8fYOwwRJBH53OydGCjql5uHYi@lists.infradead.org
X-Gm-Message-State: AFuF++km0e3WbBfF9KGsSLTDgucOoLLalrXDcWtTH0sgNyINzScFchaa
	eHRmUGc145mOXXY6rvfUuoQ/0xv4UNpeoBnNWcLz8VAe3LpN50q6xVQUfm3oDve7fkycCFU1ZOY
	eDvwM
X-Gm-Gg: AR+sD118EGIjRxjj6BP/SX/7NSfKH3lavhr85Qrx1tXZXHAZPps5xxRGpCljsFD69ZY
	JpkCrJa+L1lUekLV0NHXtQryvm3FWWGxUuQV1CZW5xNxs2AyM8KnwrslNzGw0nAbF/zEW3ObiEY
	DoyGIrsEJo5ob/bY6vK4Ag+sUL7CxyU/ynrAXFJE9vGpMxKOsVYODxhhLqA4KiPmwk8AkjkVH4X
	xLuCIGLf13IJNWOog5pyNQqZsPdrquPCv5ciRcm12f39+jOydTHoqKSeK0ZwnKH+oUFuN3RjK57
	QVO3T06MNuVkRWA7k7WDQtRCupQd5C+pJfYD0b+WNaThguNDRGJGTonLZbJW5V6rMcP2UVTzxKS
	ypvtRGJoyq4z4PcC/lvtA69MrVczPvEo6H2SKwvVQltXhYvnjioOjZ2BsSyG3Ypu6KmgjydHb2v
	igLrRkE+Ots7wHmO7KZTkeacX1iJyHKBo6gZEhHhOPT/BgdfhrqBxLm9VQWhc2pa7WgS9dCQfvE
	LIbY6YyJEX63L4pGQCVjlEKZAHL3XwUFR3x+PaMJjnR84Fi7p0l
X-Received: by 2002:a05:600c:4e49:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49ce58388d2mr33540405e9.9.1788321945432;
        Tue, 01 Sep 2026 21:05:45 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v6 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 02 Sep 2026 05:05:37 +0100
Message-Id: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKgl2oC/4XRS27DIBAG4KtYrEs1vHFWvUfVBYYhQYofNbaVK
 MrdS5xKSRVZXQ6Ib5h/LiTjmDCTXXUhIy4pp74rhX6riD+4bo80hVITDlwD55ri6dz12Sqgfpg
 P/TQc5z3VdWS10YjRWVKeDiPGdFrZz69SH1Ke+vG8dlnY7fQfcGEUqGHBeAlaCMs/jqlzY//ej
 3tyExf+UCSwDYUXxStnNDiBXNUvinhSBGwooigxaK5YAO6YeVHkQ1FMbCiyKEpG9CpqJfTrROq
 haKg3FFUUKzn30UKQovmjXO/Rj/g9l0VO9/xJizm7dZG7atUtt786Hdp55Ydye0S6Lu0eG+jGo
 2ZgmqCfm5QWjctIfd+2adpVIlhhlJWCNwo1hlqBUQBOGYwNROGiZIgmlN9dfwCWzXgcbgIAAA=
 =
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
X-CRM114-CacheID: sfid-20260901_210551_656755_5A7D9EDD 
X-CRM114-Status: GOOD (  20.76  )
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
Sashiko bot reported issues here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=4

The are basically no updates in this v6 series, just a rebase and
correct function call placements to be aligned with dependency "fixes" series:
https://lore.kernel.org/linux-samsung-soc/20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org/

This series was again re-validated and re-tested on Exynos850 WinLink
E850-96 board:
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
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8
prerequisite-message-id: 20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org
prerequisite-patch-id: c4a05942975a21b8e817edcd0891ce0da77ed677
prerequisite-patch-id: 694fae0b7b8ae73161e67f49599235c80c30c392

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


