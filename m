Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21288CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=; b=hQ3TcYHnCb4Ky4Vg8tWH8u3Cd/
	RfUJ4Yx2o0Wufjn+VD9p/tJ41GNN/Ota8fJrrE9HrHFW4pKe4QF6VwEi3CR0WMHJksPgPsXwN3o7L
	sDUtDEIP9yTJWxcUPnY26FblX/n2SCwc7S5nrhAiQsRDpHcL3KxvdjxjfGJly+WMfZmbXKGzpYMB9
	9l4VtM3ZA3Hxe4TZ3MNJVoO+ElhkgTcUBMJUq1Hof9AyjFWVAZdRoytb7/jlySQU5OUQEOxRW54yu
	Etc3MnrIum6tgfgsz8IAs24jXErxfzyWduf5tHVd193lUduqoeF3OB+7J1GIztBZste+cc75yds90
	+QCAsBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmY-00000005O5l-3Dfz;
	Mon, 10 Nov 2025 12:14:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmU-00000005O4B-3Plm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:14:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429c844066fso336050f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776837; x=1763381637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=;
        b=Ecz70GBmNZH79tRLztBHz5PqzVHmMQyHd9g0RbzszC3qThu9Ww4S+1mEM66quWvzWE
         Zf0WfZwjezL43xFr1bL5EK3x258leF0Q8Ied5zZJSS/k3SHhIkr2Ls2f2bFHC9dOrq3W
         o5hIfLrd0xoNbW8xg5fHzBh3E5+hqwr3/j/ZQuX8GtCkOQ/rmOeSgLLZZtGOUO604YvT
         4AhCZi8bWOkyiloZa8pgQIjalx4SyUMQBZ3pV8wh8qHGtrSG7a3TH/dZpofE9I9Dd0br
         QvalK4eJrPWEpFMm4mIIo/xPwiS2V6c4ePl6Omlwl13xtEQMdrR2LHeC1Jg0kTzZ95b6
         PZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776837; x=1763381637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=;
        b=KL8PrVXzLB2np7jBLNZF8UBx8RkVWSDSjQDzGGXk/z9wn9jGlo0X/TdE3uVKQdoEFa
         Wv2smyPOO97QBmaxKtqJkeB/HDlSXtEie+wDF8FtalF8Iy6pMIuhdYeWNTh2/8PyhkJW
         RVIk3LlFuctuD9OW6BHIboLWNl4QVWE15WbwxUZBgRDK+bxvja69NOQEHd8KdLMzjcT6
         wXJJdZEpRvkcm9RmsyIowbUdUeFtzMZED6ifrwbF0qHhcMhzSkR0oIgzS3rMPNbZkH0F
         23u8w8V0/SAo7kvHDnjGNGCey0WUiOFHWLb64ab1RzIKWaDC2wtRjgW4gzqoIYADBKtz
         y81A==
X-Forwarded-Encrypted: i=1; AJvYcCUW1pAzHTo3JbhTJKHiriwYhkiJ2dZs7/UBqUJ39dMVhg0EXovzzlKTdjNjdZz1UoplYDa2uuZinLG2JVRXFGoQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIGKZtk01IPIKcdfWA7HMLIRn/EUnJq5tmFfjBR8OKck2kdGDw
	E+mWMzvxxtUXaD1C2RMCyxrCYXkbdD/XC8NSwmT9QP6CeF93uU60MoVHWWtMguHZWL4=
X-Gm-Gg: ASbGncuXmBfMaykfenFZtaUxTS3AOY8HU5mKqyzZUROnLX6ibPjh/gn+kzzuvC20wOE
	xUb9SsOXBk1inv66Cm5WRRBwSgVcqvbfxuPWmVw7NoeK+EPU21qq+/esA4VG8zZYDkuSNr/244q
	XCUbkQvwxkuVfVZrtcpiHdRM6UR6Ic5rQmfpaJhJjbfvKE8m4NgB4ZTODiUJgwoD7EXbR4a6zbp
	HqR/AUS7dYvsSR5izGqxkaYvoJLTbCVkGRH9jQFydW5rB2f7PPrXyXn0Qe075627ETCdlQBQMk8
	+Idyg24RjPcZzzzyiHuRM6LBcoOTY1Q4QyLCZJ6ATx98rEDy4iFkjJzOznaYt8wc2sznHmjULfR
	HIHX5csgX0XYqJMxpcnCJa+3ThnZ5swF2L1lKVUZwlZpgFPqeSJ8rB/FfQ3bahUtqBi4VNGq7aY
	k9/Jpcn8lWvG8=
X-Google-Smtp-Source: AGHT+IHXmMAMgHGLYPHdNXeuo+MZBbEjpXPzE5xhKoqUU5naZQ2bnEDU9zb8O6kz0C5VmdKT1m/FAQ==
X-Received: by 2002:a5d:584b:0:b0:429:b4ce:c333 with SMTP id ffacd0b85a97d-42b2dc20b7amr3337629f8f.3.1762776836988;
        Mon, 10 Nov 2025 04:13:56 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 13:13:40 +0100
Message-ID: <20251110121344.120785-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3147; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=prTJ8Oc+m1RLqjNAKESRe03pqfxl99t8fUIb/LcjQWk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb54uvgcIsvJkyeUuAsVPO83CjVSmDVgud5l
 2LOf1gbAw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+QAKCRDBN2bmhouD
 1xCwD/9fQop5LN4wvcGWsg5PtGyKeubevwoDlObwaQN/15SYy87W6CxtCNV9dU/3SM3XPUCmLxy
 uawL7DFzPR6UBCAz7+k115KcJsrWJ58J8ZN/sq6svzOwBU2eYXkGWaO4eAGEyfYWgX/of3DDa0n
 Z0M0AifAC5lkYD2gnppGvNQUa+xIUelZD3jB3ObaZ265L76q8gtLdwImZ1ab5ceJ96tn+eypUgi
 qDiOaWZUFR2ymvuY69ivf21U5/MkM5X3862NhjhQH98JHywbcdB6XT98a+OZRXo0z88cD54OPKU
 uqHXlZEEF4OzDd6/qys4ESBxMzYUEwvDc7k+tZ1phMgORBgkQPl6D1jOjVrO+ZWgdhLwMMrk2WL
 cuEqbXgxdL8MhDOMfrtFoKTsMklYtQUXyBqCH/3OB2hyAFdjeeZt4xsL0j+fWLC1bQ5rD7M4zbP
 rw8+XEqZOLWKVa3wjMDlmg1PsLpsfZrcwjI+Yzf/lIVprnKmBkCtLxSaMCBoNvUhIyj0gkQcc8i
 7G3LQKWCYj7DM+f4RvdbrixjruolAA+rJHNQ0jEa2OVlRB8czyUHKOqT42Itll2JM32X0VcEzxe
 PgJc3iP3M1JZ96vJkm6qgZyuIy3IceO8y474AgSC6FERBGdNoEEoOvR+BpCltuZ5eV7S8ANZldx moJ9/Njf6RuKBSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_041358_876495_30DEC26E 
X-CRM114-Status: GOOD (  11.08  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.19

for you to fetch changes up to 81280d39a2f9e7dc12056db889da52cce067b1b6:

  dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU (2025-11-05 08:20:21 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.19

1. ChipID driver: Add support for identifying Exynos8890 and Exynos9610.

2. PMU driver: Allow specifying list of valid registers for the custom
   regmap used on Google GS101 SoC.  The PMU (Power Management Unit) on
   that SoC uses more complex access to registers than simple MMIO and
   invalid registers trigger aborts halting the system.

3. Few minor cleanups.

4. Several new bindings for compatible devices.

----------------------------------------------------------------
Alexandru Chimac (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
      soc: samsung: exynos-chipid: Add exynos9610 SoC support

André Draszik (4):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write
      dt-bindings: soc: samsung: exynos-sysreg: add power-domains

Denzeel Oliva (1):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles

Ivaylo Ivanov (3):
      dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
      soc: samsung: exynos-chipid: add exynos8890 SoC support

Kaustabh Chakraborty (2):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU

Krzysztof Kozlowski (1):
      soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold

Peter Griffin (1):
      dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles

Tudor Ambarus (1):
      soc: samsung: exynos-chipid: use a local dev variable

 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  23 ++
 MAINTAINERS                                        |   1 +
 drivers/soc/samsung/Makefile                       |   3 +-
 drivers/soc/samsung/exynos-chipid.c                |  18 +-
 drivers/soc/samsung/exynos-pmu.c                   | 138 +------
 drivers/soc/samsung/exynos-pmu.h                   |  37 ++
 drivers/soc/samsung/gs101-pmu.c                    | 446 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        | 343 +++++++++++++++-
 10 files changed, 863 insertions(+), 150 deletions(-)
 create mode 100644 drivers/soc/samsung/gs101-pmu.c

