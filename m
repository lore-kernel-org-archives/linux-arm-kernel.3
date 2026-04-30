Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6836FFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=craaEuxmon/gIzz7VmLF3Map/SNQR796d++hsKvx9NM=; b=yWSeP2cvwqjotY
	ktmi7drx+oXKyJGA6IUdMyY7axkqfoRmVMrR7T9lDIfv35g9sgvOreoGvwIipqt2zHJb91/maFCIo
	wvXYSt6E1npt4ya529FOQ/r1qjDcQ9vfz3s5mBAt5yK6P/GGbLXlIRq1VBdqWX+oX1Ol6oQ68a1+u
	a5aVJhA19ZK/+lmEgPLtyqXDsaXdzB/HHmn28Ho/tjVdXe0jQWw6ymdnFDAuQfM5KEtxj9ltYoNHC
	MN4An4e9mPEuFcjI3yKX7/NHNw8+qpaTqcPeg+zEo+GnfWsSTnn5PwQNnNnif6Y6fBEhdq1IwsIFo
	+2ifbcctP/bLvpI5eAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeC-00000004Om8-1Gbt;
	Thu, 30 Apr 2026 01:57:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGe9-00000004Okb-06G5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:56:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d64313c39so275155f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514214; x=1778119014; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=craaEuxmon/gIzz7VmLF3Map/SNQR796d++hsKvx9NM=;
        b=MkHWSn4hvfjcWT+oeRigh08786ej3r6Ivrv4+9RM5/lfgbar2ZUYeu+o5LYBw1hVst
         3vsDmDTQd3m6rEjIoh73aeH2FSwR2N6imbGaalf2Npu+z8Ibs3N20Nm7RlurPsTio22T
         o1i5VFJfk78xEU7eCnqoUpITuSWUW1+QnJB1ONMAjpbCyp3jf8GgCEwMZ8m8BLu5TpbK
         g5TRD56sYqMXYAvtCb2y8Sq4crNGgx38KPtZhUz5F8YDeS3Ht5qw6DRaBObp3jMFE/dq
         3mh4LUNMJxV/wdIAjubJ1AyGOZVXTO0ObpcvBV5Ymqn9bPnnTaW1qCqzOx4md9ZVwKUL
         U/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514214; x=1778119014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=craaEuxmon/gIzz7VmLF3Map/SNQR796d++hsKvx9NM=;
        b=bQxhpErFVZkas2diZp5awE66QNQVUNMHEzLNgIzoQEy46z2+2IwUbceLJef7K6f4gi
         tDRVGEHMcpGBmXI2W8HqRxWPo5iFxV3RjWQAJJ/BCJlg6/PQh0xywPku4QvnvX4EEZEb
         JvPgmfm9hGcPG4Y4BihX/nlsW7eN25krGi8llnpQgPbHZ3uMFppJQpntJYxJMDhjP9gO
         Jhj6wrQuV8UgDMfP4CrcLKmY4KdycTCwf1YHnNbWeNPmjH3jkb7Wsc4VxCjGqurap15O
         +Bqm6/Qf8F6oDydjlehtoQ3Hf6Uj2FcMgJ5InnhqO5u1gmkvJrDcptRUo0b35+iahPaG
         ITKw==
X-Forwarded-Encrypted: i=1; AFNElJ+u7VFEkKRBBntlI78g9aQzyEBo3kPY4iaTi+bEVs+ORcK1asAJYq7PLMUjZsfunFzPuRQ58wC4A+um3parzhE0@lists.infradead.org
X-Gm-Message-State: AOJu0YwEUSsQj0aTKgtvlsR7abM3dvaDK+1cHrxfJhL3M80vr5127Lqt
	I5VpwfukloMdWD1dn33OSQTTWeWy9YG3FiEcjWyooSfuxPhM8N8dIBDRnMG5icJNU9nxqAfn8Md
	1LhzdoWQ=
X-Gm-Gg: AeBDieu306WKwv2y7RNp+PxhtEsuffX1TsgaCTMkwsR7ltMsyXRZmjpmYrPMMTYIgB9
	XtJlIX2P8K2EgVIdrkWzhEX/aLRzoYpiZ3I4M+KRdYaO4xuVT57DsdZd3TYIDvvaEBG18aJmF++
	vQrst0P6pdanmsbQNtjEsjk/LjvLxWNS9S7mh4Q+Xdu+LGzUqzNQrNyEEsJoSmFb/B7lrd/xMoX
	zxD3zTJ9ESRHX0d18KBaFPJXTbByV3BrisLxEtgdtpkYQwVrNeBdj7TrJrDkJPY3jHSQ7CiFPEY
	KOTscROWn38Hlhq7fiJgmCyTWuD2yEnsU1mDmPzDx/wPAxRt9f8XUUqtFNrvoh/UDpRoRdgiyff
	cgbekH7c+UM4OIFGShhZPQhNl+pKWie0JJmnFn0RE/vGyhU5lTREPSaA0u0m3P631xKSjyo7J0B
	Xc/mgBI297CBHMHTOaTsHXwXvn8NulTikw4opjQZB6WsZ9c3+5dCguQ/efiE50n1Q6FhLIPwudF
	AYVewu8eXld3080GThRD4TIJnE=
X-Received: by 2002:a05:6000:2211:b0:43f:de5a:eb63 with SMTP id ffacd0b85a97d-4493d02ac54mr1206548f8f.11.1777514214225;
        Wed, 29 Apr 2026 18:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Thu, 30 Apr 2026 02:56:50 +0100
Message-Id: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOK28mkC/4XNQQ6DIBCF4asY1qWBQUG76j2aLgiOStKAASUa4
 92Lbpoumi7/l8w3G4kYLEZyKzYSMNlovcshLgUxg3Y9UtvmJsBAMgBJcVmdj3XFqBnnwU/ja+6
 pbDreKInY6Zrk0zFgZ5eTfTxzDzZOPqznl8SP9Q+YOGVU8VaZkkkhari/rNPBX33oySEm+Cgl4
 z8UyIqptJJMC4Sq+VL2fX8D/BlZb/8AAAA=
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185657_097753_4252EBEB 
X-CRM114-Status: GOOD (  17.46  )
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

I tried to implement it in way to not break anything for gs101, but
testing from others is highly appreciated.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
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
 drivers/soc/samsung/exynos850-pmu.c                |  79 ++++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  57 ++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 222 insertions(+), 106 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


