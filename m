Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D21CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=euNzNi2+8hGcblKlx8oKoI+4PgNfizE50VEjZnuwFB4=; b=3lMNgd9y3+0oBQ
	xPz7Z8x8uoM6MaIP1CrZseeguj0NHAHbU7YUxWm6YeSyNZL3OGhO3T0w+TeHKGNY+oz0M5vCyLbIg
	8o4GVsrScdHQgNyWGAyTfL7I6J02w+0Zl56sic09CyeTLRbOU1q1rG1tKIijTJEx8FZDxF1hblDep
	pHlEcoX3QU2vbMyK54kzWdOLoJOS82IEYBzViUG45XxKejTdoPTooaTfVo8frn9WjjvvpZQso8B0H
	GxjqeHg/rgc3s1F7GK2BAMk9texjb06UPxwxsK8GqYH58m19R8suM0kue+10rBGUrT28mMGzm+IUh
	U4derDbcNailSnI/XDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOB-000000014Rs-0oEl;
	Mon, 08 Sep 2025 17:10:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbg4-0000000HIOf-3h0l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:13:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so5840515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337179; x=1757941979; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=euNzNi2+8hGcblKlx8oKoI+4PgNfizE50VEjZnuwFB4=;
        b=Ynx3wv30EiDwneRVRDmopVFhkGXmPcZ8dLg2Ay4iXeOG3kA+JC7kEWuBGOQffq2+2l
         zseqJsx9ICUqMSJ9cVH8pZXL75ZluJFoHvyN9gTiERMd8UWnu8eFzW6+sp6F77XlyeGH
         IODtNYTCCKu2jNi97LL1tkvtqrst6RUxXIlM3xIqe4AQslcibfef1Ylbxhb5nIRL/5jm
         TUAaXx+S/Y2GRsTkrWdJguY9E89rR3a9mTg+GTXs+jTHtSZFrmKloFH+YRcSa+1XhJ2c
         lU6Eot9GVkFNh+CPdeJ6gYpHl1BDzo9d9xEWm14XlpvOeOafuitC0+6UPvLAvEHLHhct
         chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337179; x=1757941979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euNzNi2+8hGcblKlx8oKoI+4PgNfizE50VEjZnuwFB4=;
        b=FdlHT1KCZ7r1B9TlBXCsnd7/e+FmFDDRHL7SH0AjCsChGYLrfrtaUtU4lfbg7jV7wX
         mITkWLb6zqdvQviESxbGZaqS7HC4j9tgsXyEZvo7pRc6TCW2CogipwRUu4d3dj6GvQmn
         QEyQDP5lLVq3I1rUBx1KrkkZymdZobZAclbqhJ84BzuxUo6VF6zoC2mh41nq528J9VaS
         RDvGcUrygWrWCyRVIKordEB8QhUTDW5h8sXpm0wgcpYjSUkuyOtELbrcNCoFT0aeJKaa
         Zr6z5XXqw7BrsTm9BNQ+aRxlWcewlikERFDcUHuX4MEiPLAlesC93V6A7uM+CdPUeZ6n
         jQfA==
X-Forwarded-Encrypted: i=1; AJvYcCU8AmxUBgNZYXjqYeFkQB9rY67+dwkXYZq93VMtaYTdXVZhLPELOhHxFv0+POrl5kYYP+X7Z6O7WA4E5+DvE6DC@lists.infradead.org
X-Gm-Message-State: AOJu0YxcbGj6rdGFjJf8c5uIEtQIebH/l8/0C5MHtSgL3w9q6uPX5olm
	IMSEDR7w6dFd1tEkw1a6fMUUVrnz5IvFM7K1Id8BfBDOcaXM1QvoqY7qr3lp2IFFuQw=
X-Gm-Gg: ASbGncs7j9WnEb+354SJSWK8Jkh65W79DIFsOZbXO0P39M4POPXp6iZk13CH7vjdQz2
	71yUw2jsmoXwh+vdDVynSs3NsWZd38UKjqEVgwFWphb4/PgDOhpmZ3bBQMgikS4gk7cVTe0I/PU
	0eoTOLjh48MLnI9epmxoq/q5f9vapZImPCcTFu8jqoMUrpthQlliLxUmAfEygKEyoTXMCIES2Am
	sB2t/ONOl3JLcrodsIgNY2fRPoXsW87RW55GaUnWZhG436Gm3ai6IkBufiySaJtPHRtj7acxELe
	9ZVh1IfhsCuq2zBjBU5giLVhZrwgI/C50/+ESyYA43panI/BvZIX3uqFQzJkYkfUsTGHlPRozeZ
	/To/4QTN+ztCOIILXVGa99n3R7v0KUAlJwqheQzpDFK0eGmVWv8r1JnAsXABDLEwLvTtH5uv7Fg
	oECm5KAgYi95JIjJmvdg/QWSw=
X-Google-Smtp-Source: AGHT+IHYOeXJ7kL2S1pO2C07X8d64bw/OMH9vgtjnahGnxt7HgXXYrfjcsnaLr8FftHR7cKUZ3vsRg==
X-Received: by 2002:a05:6000:200c:b0:3e2:2dd3:f9d6 with SMTP id ffacd0b85a97d-3e64ca780d5mr6256069f8f.55.1757337179163;
        Mon, 08 Sep 2025 06:12:59 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:12:58 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/5] exynos-acpm: add DVFS protocol and clock driver
Date: Mon, 08 Sep 2025 13:12:41 +0000
Message-Id: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnWvmgC/23NSQ7CIBiG4as0rMUwlcGV9zAumGyJWhowRNP07
 tJurNHl94fnZQLZp+AzODQTSL6EHOJQB9s1wPZ66DwMrm5AEGmRxApqO96hvV0hkY5oIT2iSID
 6fEz+Ep5r6nSuuw/5EdNrLRe8XP9ECoYIcmOcEkwwLvDxFgad4j6mDiyVQjaSiI0kVTrfWskNU
 4azH0k/UiG6kXT5s/XWMeKktOJLzvP8BlhmPf8VAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=4646;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=k/rYEqvoUHmQsSFnRWJthGrqkooxPs75rw/T6s9nl2c=;
 b=MBibO8bOauSF0KxVN1B/clJFWfdF+BQrGCfYfDTCMuR36/9gpDIQ6z5kikA8VEdpKxlYF/Uj3
 dvJ6kP/+SsuAEDD9ACTWR6NVwsGr5VVhx6/RvgiYGs/oe2cYiPwc380
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061300_926031_2E4268F7 
X-CRM114-Status: GOOD (  23.92  )
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
No dependecies for #1, #3, #5.

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
Tudor Ambarus (5):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      arm64: defconfig: enable Exynos ACPM clocks

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 184 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  83 ++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 11 files changed, 376 insertions(+), 1 deletion(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


