Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DE3CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ejjXNuvOY4qHqOLsDaR4tDbzd5dU03zyuYMmAd/GyvQ=; b=KUkRsnz6TRq+h1
	NjATT4jTA5S/MyxvGR3UpCGZnowlfMsi7gGBbE4kDKZCgqr4Gpn8ECupZXCEDpT1hA5aAdVF8gMGt
	7DCqHzM6Xrpl2ueXeIxmZrpEMOLuw0mGrsrpHAKjLwwS2Gs8vvJm9IDWRizQwA63j+N7kwuWU2yiu
	w+SE/R11mY869atqw3U95gG6Ano3r6JCETYVNvyRVQPLseRT3y7fB/GPBYfeB54djYso3PoJI0b+W
	ff6FoolPwWH5n+8hQn317OL2B/jrqoY+bLWkJRlO6BATlEvShgnXmDL7HicvXj3YngpJparyCSxEA
	oC/jL7Kopb3MZwGYvKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWE-00000008TsA-3V7N;
	Fri, 10 Oct 2025 12:46:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWC-00000008TqX-298F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:46:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so20194275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100403; x=1760705203; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejjXNuvOY4qHqOLsDaR4tDbzd5dU03zyuYMmAd/GyvQ=;
        b=UGpbdwfdWzKYdszd5RjI3MqQ2XmtBRRh2GxHHaBeJxos6tA36UiJqu2dztiCyPDGUa
         VMIIl3heMNOuoFMgx0avjLdPAmPGHEepmnmMDzMGBqeNt3YbR3B0bXYy3C6JCoE1pnnV
         tPa/XHirVaEfJekhBLvt1IGEN5W2opKPJNRpeAplBvJNb4n8+HMxc1ziQM+GZIDd9b1+
         fDxvCS21ALGi4dS0z5zK42fErgm2gptCwB9c/NyTym1zxlgehzZnzXEwbP6BpH5spSAN
         NRuiMjlIRkdLTTeOX/pZaf9uQ/5EgVwbd5uuBGFarU/IGOMY282YWL8LsbTnqPtaqStl
         c32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100403; x=1760705203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejjXNuvOY4qHqOLsDaR4tDbzd5dU03zyuYMmAd/GyvQ=;
        b=g+RY6apnYSwaA3rVvMkwcPU9bs0NCGGiye5k+eaAvAbd+c43j9Zn9Kbj7sSVHIHEH8
         wq2VWhICTnTOZ56gG4ylRRJNM3pCE1lyB/MV5twPuZKnzXK0Mq+PIkXR/QV2XxfYMNdO
         6O5BslEE9oA9SmlnTqXpUGJGcTof6d3gYSzyrbY1NGOuyTkDxIkOYiAO27qEJDUrlIvv
         0HAOTG0lMFnqii1KcfNUwq2IffuEpBekbF7bdFYSeS+sR0jkPGxpUXu/rvbuevZpvm+q
         yy9v3pQnLwstTt/FYo02ZwjWLP+YD5k8EiNBfWVex+Ii6Mmba/3iLtRWo2Wqf6a146TD
         DWyg==
X-Forwarded-Encrypted: i=1; AJvYcCVDuVsTV9oce3MhqBK58nVvJd1Ul6cD3tzEhtiqGXUdjExOFjNAc9AJDxWdLJ2pkr4DIAr6xusG4MCCDPzLW8zM@lists.infradead.org
X-Gm-Message-State: AOJu0YyGnK8HSjliwmukqt+K2vhKgjTXLO6Q5jTXQ3tl0/x2kEkmxr47
	i9w/a7RbpgzPeEMytGYMDwaM9ifR3QYVJDTLmNCsfCpHS/I62HhjQBkNcTZUq2yQplc=
X-Gm-Gg: ASbGncudHj2ok8igD3JCZ1dCzSNrbbEdtudHY8cxsUutMoq6HW0Cflg/zRvT5egloGl
	kq2SPC1OsSL5vkwx8h/L9UwjtqFYIpVMwDqMSCX3ryJAK1RUHs25ZXyVsbHCAdFHlp1eqHc8aqY
	H1F17gCKYqHxHS2hktpadgnciWcIK0QpXzAJ+vD1KvA/GHvzL12DxhX37Qsdk0Qjwd4n0H0BG/K
	Bsrhm8I+cmNUqC5r0PPpZo7Lxo/EmnIqwdO6+YeJ6Tz4jrjTaxi7KzgiVG7I119utPncfJC7PvG
	IHJComiv9Id4eG/sbY2+nEJBAkjx3N0J0yjo8rOCEw3yZps6qVnTjS5nQHJwucf7dACJXuOxZyu
	Gb0jYTx4pWZX2OXAXPzroIxn3eri4gVwM+QvZh0wl9Ttve5pvftW8mjW9o0zKEgHLL+C0YLkkWT
	E76a0WkLdhExjx7t/fGJ1Log==
X-Google-Smtp-Source: AGHT+IFFVh+qVBdW5ElAZZfgvNHjG6SIuxAjy6I3c4ghlrs6mBTWOZSzV+ytuvT6FMhPPEuwTiq4Gg==
X-Received: by 2002:a05:600c:529a:b0:46e:3802:741a with SMTP id 5b1f17b1804b1-46fa9af2d67mr72482845e9.22.1760100402653;
        Fri, 10 Oct 2025 05:46:42 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/6] exynos-acpm: add DVFS protocol and clock driver
Date: Fri, 10 Oct 2025 12:46:30 +0000
Message-Id: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACYA6WgC/23OTW7DIBAF4KtErEs1DMOPs+o9qi6AIQlqake4s
 lpFvntxNqVyxeqh+d7MXcy5ljyL4+Eual7KXKaxBft0EOkSxnOWhVsWCGjAq0GGdPuQ6fou0TM
 G5zNocKKN32o+la9H1etby5cyf071+9G8qO33n5JFSZA2Rh4cObJOvVzLGOr0PNWz2FoW7CS6T
 mKTnE3yNtIQLe2k/pUD6E7qbafJiQnZ++R2knrpO0mb1FobSO3F/bWmk0idNE1SSkGdAjMA/5H
 ruv4AKonej4kBAAA=
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=5658;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=sMfv3TLRGxjMXD6OCX5QEzplP012kwoWjahSV/92jHU=;
 b=qIvKlqHpyoQD8t1YCdVatudYDt0vnXZPCCRI4cw/L2+rdVui9oFehURMKYsHJVJPt5tlczkC2
 KHJTUWeUpK9Buu5wQYFtHWLo7PaaM8LqdI/vZ4VIJzJ0VlwmbxSur5d
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_054644_602660_48A03C50 
X-CRM114-Status: GOOD (  25.70  )
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

Dependencies description:
All patches should go through the Samsung SoC tree.
The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
If the clock subsystem needs to merge the new clock driver, it will
need an immutable tag with the 2 patches.

The following DT patches depend on the bindings from #1:
https://lore.kernel.org/linux-samsung-soc/20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org/

The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
are variable and index based. These clocks don't provide an entire range
of values between the limits but only discrete points within the range.
The firmware also manages the voltage scaling appropriately with the
clock scaling. Make the ACPM node a clock provider.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the ACPM firmware.
Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v6:
- acpm-clk: s/b0/bo, (big ocean)
- acpm-dvfs: drop dbg_val arg from get_rate(). It's unused upstream and
  we'll probably choose to introduce a dedicated debug API if needed.
- MAINTAINERS: add ACPM clock bindings and driver (new patch)
- Link to v5: https://lore.kernel.org/r/20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org

Changes in v5:
- acpm-clk: address Stephen's comments:
  - drop of.h unused include, add devres/devres.h and container_of.h
    to avoid implicit includes.
  - r/acpm_clk_ops_init/acpm_clk_register.
  - remove period from error messages, drop comma after sentinel in
    platform_device_id.
- collect Peter's R-b and T-b tags.
- Link to v4: https://lore.kernel.org/r/20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org

Changes in v4:
- clk-acpm:
  - remove GS101_ACPM_CLK_ID type handling. Dead code, it should be
    introduced with next devices.
  - remove runtime check on clock IDs. Instead add a comment about the
    assumptions the code is making: the clock IDs start from zero, are
    sequential and do not have gaps. Slight changes based on this
    assumption: s/hws[id]/hws[i], remove the inclusion of
    dt-bindings/clock/google,gs101-acpm.h and the use of the clock IDs.
    The clocks are defined solely by name in the driver.
- move firmware patches close to each other, in between the bindings and
  the clock driver
- update the description of dependencies in the cover letter.
- Link to v3: https://lore.kernel.org/r/20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org

Changes in v3:
- dt-bindings:
  - move clock bindings to a new bindings header
  - update commit's subject, s/add #clock-cells/add ACPM clocks.
    It also suggests that the bindings are added.
  - prepend "GS101_" on clocks binding name. The bindings name are the
    same for GS201 and the acpm-clk driver will likely include both.
  - collect Rob's R-b
- clk-acpm:
  - move clock definitions here instead of keeping them into the
    ACPM protocol driver
  - use platform_driver.id_table to differentiate device type
  - fix Kconfig dependency, || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
  - update commit subject, s/dev/pdev
- exynos-acpm:
  - move clock definitions to clk-acpm
  - use devm-action to unregister clk-acpm platform device
- Link to v2: https://lore.kernel.org/r/20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org

Changes in v2:
- dt-bindings: clocks are not longer a child of ACPM protocol. Instead
  make Alive Clock and Power Manager (ACPM) node a clock provider.
  Update commit message.
- firmware: exynos-acpm: register by hand the ACPM clocks dev (new
  patch)
- firmware: exynos-acpm: use defines intead of enum
- acpm-clk:
  - switch to determine_rate
  - drop __init, __refdata, __initconst, this is a module, we need those
    methods and data, after boot as well.
  - fix the assumption that the clocks are defined by ID in ascending order.
    There's still an assumption that the clk_id < nr_clks, but this is
    now covered by a sanity check in the clock driver.
- arm64: defconfig: enable Exynos ACPM clocks (add patch together with
  this patch set) 
- Link to v1: https://lore.kernel.org/r/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org

---
Tudor Ambarus (6):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      arm64: defconfig: enable Exynos ACPM clocks
      MAINTAINERS: add ACPM clock bindings and driver

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 MAINTAINERS                                        |   3 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 185 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  80 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 12 files changed, 376 insertions(+), 2 deletions(-)
---
base-commit: 5472d60c129f75282d94ae5ad072ee6dfb7c7246
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


