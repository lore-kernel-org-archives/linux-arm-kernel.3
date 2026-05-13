Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52133CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KimBNnvZIExu9m7Gn6O/J5U055DSJkXcv1Df4OGtexA=; b=YYzoRtZScaJwWD
	KA074E9PnlQLPccJDq9C9XsaCPAqe5dRari3irRdV/o1xkFrkkZ3UUjkSN6cDluxBjAV2G5BR86bQ
	+MxGzAwGo2juVIc+1OG39SstfCPibGVU44XuFNDgcdBbZ2HCsizJ5mo8d0P7UY1vzbhBk5gkYHYUo
	Jq7nxIbrxYeD8OapCjy0HgAEg+sNS4RZDbkRrPQk9TmX/VIEsqqRvdyZF3fy6gTCDizjVo1UMlTjY
	Jqtqu+L0gX5N2c0S4RoGSJeaHlvnw7Q2zvYVoctHmOQ+pedfwKkb1An/yXb9wxYmRPePH2nYYj5gi
	nJG8FcqoTx6Vh4OSAEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q0-00000002VdR-1INZ;
	Wed, 13 May 2026 12:37:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8px-00000002VaR-3ASL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-453903ee4adso5847100f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675836; x=1779280636; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KimBNnvZIExu9m7Gn6O/J5U055DSJkXcv1Df4OGtexA=;
        b=askAzgLvyNikKKP7vTO0siHeHJDYhlqzDqZ2FEQWBecjkQZ4+/nwMVyCeB1Wyv8Ahr
         V/u8lOA55CL8GKbbl9Owjxx5B7idG45hgimMA0M8TsszQXxtsa4EjQoajK3eNOt7wn0+
         gRi8+hKcV2MQ1B68YZjXzfeBfkaPEUQ7O87F/lic5TCbLQ+ArgEsI9Dq3NeSVVDA5ST6
         VmLTTMdho7NbvQ4wriFWAd9t5wFnN2bkgzZ7jxqiudx8rV92wPUxsxgXq1YWDQ/G4sJT
         BzHf5ln+dGr8zC8FFRNGfWjCNejRcAE9jT3AsCuISH3kYlc156XmP1QxE331r2PeTkfT
         b4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675836; x=1779280636;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KimBNnvZIExu9m7Gn6O/J5U055DSJkXcv1Df4OGtexA=;
        b=KyFATzvdn8qR2cphNOCrml0loQQP3o/8QCC2V19TguCyZapxV47TsYoDUIIJwG60MT
         W4wqp3/qLvLzxHACZBa6x9ZTqdN1H1LC4CO+wY8OeB9aQ9qrXoGudU2IpKEB8BJWGU3W
         aHc1ShOrAN/W0zr6ZhH3aMDycyLf2fDt0+iXbf0Y4TN9cv3dRmkoCIeyxvY6a4dq3B0p
         kwjj/cdjikm0uscAbEGA0UAPU6ZailD7UiMsgz0tV0KtWbjEc3e602+6eZ+vg8b8NQ/Y
         uxyaW6AOwgdfGj4dix06TIqISkXxsDaA81CSjvdv7cO75hU1jt0I6bOnj1gOuvvNut6j
         8ycQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MWjoCuUewBNvu+GK08rOygiF4Fd+xNGhtJiTnuPlV/byi88JFNYcQ6OzvkKBz3GbB24COPGCw3r5Wt7GjjFZm@lists.infradead.org
X-Gm-Message-State: AOJu0YxvF3iqBmkgoPfqglML5y9ReuhtQexc9XE9JiQK3VzupvWAUiGp
	mZVenKfwSizNNQ++XOQdEIvxcpYjI2KXprOcP9agCq42LLoW+5R19/zMGIq4nPWigFE=
X-Gm-Gg: Acq92OHrG8LF4PQe7VBVCWwAkSlL6zfowBiTDuOFDrdiFlXJhiSnp2SdEVArA7Zjz+S
	a6SNxwIlbLV0uDQNM54HLpEl8tbZMazi8EwevammdJN/uYE4yxrwC0xC2GWlBx++MK6jg6EB/1J
	X8Y9v6oNBOIhBy3zFejYI1NuCs3fBY4Wrd+HpQNziZ0dVW60wkNtxdV5OS/Pp2sBlSBvUHRPNhl
	ZaqPdYWq2NCJdZaH6hQ3jqfIaBnTfNGHCdWP4RzMU4jZ57YXM8O7ciBw7N5pv+FbKPkFLThKaoq
	/X/cltrBXBkcYSEQn8siS/49OE1h7LoDlakWahWU6SWzD6esz+gd9zBaoKJepvbl4gJOoQSdDos
	impAU6/bdC7Op0AQGdpcGskcES9xlDxChjeoFWYMiEnTCm1J1UtkmKGttwOUcfnSagXuJnzRSGx
	i8xfIw7ECPhlV94S5zI8tLiuFKu3vVPetvNKPEM73XImrO2PtFRpLRdfYL2ckOYLthQBqr6z6f8
	Er7HhFPVke8SkpJsvy2iPbQADg=
X-Received: by 2002:a05:6000:3101:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-45c57edf73amr5082318f8f.9.1778675835858;
        Wed, 13 May 2026 05:37:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 13 May 2026 13:37:12 +0100
Message-Id: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhwBGoC/4XNQQqDMBCF4atI1k2ZTDTRrnqP0kXQUQNiJNGgF
 O/etJu2lNLl/2C+ubFA3lJgp+zGPEUbrBtT5IeM1b0ZO+K2Sc0QUAGi4rRuowtlAbyelt7N07B
 0XFWtqLQiak3J0unkqbXrk71cU/c2zM5vzy9RPNY/YBQcuBaNrnNQUpZ4HuxovDs637GHGPGl5
 CB+KJiUujBagZGERfWlyDdFwg9FJqVtFBaiATRCfyj7vt8BDJDUD0UBAAA=
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053717_828311_7F762209 
X-CRM114-Status: GOOD (  17.70  )
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

As a next steps it will be possible to enable idle states on top of it.

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series was tested on Exynos850 WinLink E850-96 board:
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
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 ++
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 119 ++++-----------------
 drivers/soc/samsung/exynos-pmu.h                   |  32 ++++++
 drivers/soc/samsung/exynos850-pmu.c                |  78 ++++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  57 ++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 221 insertions(+), 106 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


