Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AA1C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=; b=2jNF0LlCEz9TXW
	usDVjkoUkRYr/T2kgnw9iXkQVyKDFP9dxYwB+ur6wR9OOjYlPbp4J7H9UDUkK1H6tjVPyE11rIoRj
	8fqjAnSMfZvAVNywcUO5cm01viQ4beyXxy2vVjQ/wVt1cfkzBMr6Ke6Bsk+CXaCDBZ45shm/Ne8TS
	RWzUdh3QfrwR0WJcPHSKbeducFIoSTJVWM7FWp0VXtXtTEdqyHIyjl/E5j1auCWb/YJ6gnAiQ/lud
	VWn0aGpHNm/L63arAil9Dt6W0wEjer37lPyb8g1UHYlS0gAf5UzUQpU9x8/QdAieAbnSO62+dDcsF
	7jCZ1UBWodUxMncqUX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyk4-000000034dS-239R;
	Mon, 16 Jun 2025 01:34:32 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyhr-000000034AP-0suv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:16 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2858447a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037534; x=1750642334; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=;
        b=i9PtXKxJ8059oHfB4sx1c4wWHph8bDdC4Boq0koH81uFb6d5mwuYqEhnQcRe1M2Bdr
         DphVcT8DdqwU6nEoVSV05424/ix0ActvH0Ec//JaaTA4laNlE1b3rOV1L7hr3NURfCgQ
         6WwBwOjoZJi2PfkS19zIQ8GGvrpuSzm7IpAQdL0l9fMSPG9rKm6UvIrvXlxgUfQuTxTK
         Mg0qAgDpWT637VC9Zqmp4veYrNqSB+4fbYedPM84ut9J7Y5mhvuqXEmLK36PiH8sZM+q
         3MLexaYzwC0ikF8HQQrpoQ/f0lN3sBPkYOZSepbPoO3VcWn6lNg4qhez9We/WHwdS+QQ
         13EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037534; x=1750642334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=;
        b=jZiHQjjAJBn5fyECdg+nRj5estzuqgW2jwkr9hmfJsqWCECsdcX6cVcycYJ9EYgLs1
         G0UN6PxEzKxIA0vR/RZEVkFUklORp3xbs8Gt2P+xhpDbLPE7PW6j8PLn1VT0q4OzYbab
         zvdDUA4bwXo0mQR2rXg9Kw2QMpx7+DmL8ccth2b8PIiCxfwBDc2NYyHLqLBJnF8+XA4B
         GsnSLoqWmn7+E7+lQU37g1HzWJ6XhbStwR2lxjpon14Xom1Ix3Wk49cNMqn1ru5c128J
         oX6+4zOHUeHMHjXWy1wNtF0d6/A0aFZ6pJl+CcijjZqqlYpl58A2ZSXn4f8I7no6X9tJ
         hHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkj5lI9igVjZhRpD0Lez/mvBjXW44BKW8Z+376C3vFuWeexMFRR0Pr1kbg/JxJEIl6Pjl6Up9gqT/m6koljpro@lists.infradead.org
X-Gm-Message-State: AOJu0YyMYOmZtEaSxHEK72qW7zCr2T00omh4XiCIMbw5p4NsenGT0ZHh
	0YtLYZ79UJNeZkx8EmVtxBmXrVcuY6Fxl/UnadGhoIGeVNXymvKHHCw+
X-Gm-Gg: ASbGnctVc7/xisWSAJ0gaPlye/YJrjaLGrF9rAcDxifJoeenC5OPIdqQ2cjP82aMPfM
	jKRmYA6H7HiKne0wYR77iiYvhnzKYGj30tGq/dIpnUojKsvNn5kAQQjZcmgT3SNmdPgyR+WaAPz
	jPIik7fmH4L759VCyMyopFVCVzpWNpayrMJhTQYScS4KOjZ7/a3IPxFHdkCmzgiymu2ycDusRMF
	zTphyQbj3QnUv/8J1ma2ZZaujsXrX9+kJcsrBQtVopRmkPxGFiDwez7hqEJLxTuaP0hSIBVLU7d
	ER8kPMV3LmIt6LpalXTIrb5+kWflbGm4IfKYd5Ki+F1GIbIFQFQW8AdanB+s4mpo9yYEydb/jHd
	O3kA=
X-Google-Smtp-Source: AGHT+IEjqUySqGRQmucLa3hYe61oVihGWXZ54gO48AIrBbAmxb4PLDq2yHwjYLsiPdfkyoftEBxaKg==
X-Received: by 2002:a17:90b:1c04:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-313f1ca7f9cmr12489670a91.9.1750037533701;
        Sun, 15 Jun 2025 18:32:13 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
Date: Mon, 16 Jun 2025 09:31:49 +0800
Message-Id: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4111; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IImZvUkpMAnwhvmBNPBZuUuP3+ZC7bdMT4Tj48zkB6M=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QWFDqwdlCT87E/lnHN0y3uxYwVNCrcfXdEv
 r8W31VQ5I6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FgAKCRABygi3psUI
 JHOcD/9aqE6YzKXZcdiBW5LIR1CLL8vrnqMP86Z4ipOHcMcJQdQT15eeRJduzxpeFzUHsqqlVko
 S9wtuUkyLZlSRNuwIzyh9bkSDMvgTIMCcmGqpNIgNbqZ9IN8AeYyxjfJUUqoZ6q9wn7e1j85aDS
 BRAYn0al8oDlTlWq+LPbEvMJtGdc+oYqt5scMf9V68svvEdjqsSqL/DpUGtH7obA6hYmx77etoa
 FFPkshJ8PGB+WAFWxQkSm02PU8YxFzv0TZtxJwH3t2J7i6arjJfAURZt26JL7rFNZXsTq1hCIlK
 bN5fFrzAMwFtrLAox+nZ4wUDBJLTl8bWvSN9ur9Ny3MPvlBxifUEtnsEslTP2OsGXzhVF22Xesr
 bFoA8m3ZdGrrFH+VNsLJxys1NNkiWHDzh3wj8c/JENOFtDdU08WLZr65UatfL10vzvCNyJHYSKJ
 oU80Bszn2ITw2U3knG/X2MTklcmDHK7/xkWRmiTnPJrNBQu6SJOAJkhvKtJ3cTWaiwnBE/qIvfh
 C+ECXbFaoNIwW+56dUdKRRGcFpFz0LWt1BhKa5QZ6Q8qxYSGZwr+oc/8TOpSNaCNWnYpIRpi8bY
 F3EhnhR6lLnxPffH2+YqunJwEFDPWlVgZlj/E2AaX6SWiS33WoDsKo7uL/zQDDFybZqbvEU/iRZ
 9EkuYkCRyCg4khg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183215_320953_5286F056 
X-CRM114-Status: GOOD (  14.11  )
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

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-7 prepares the driver to allow adding support for those
older SoCs.
Patch 8-12 adds support for the older SoCs.
Patch 13-21 are the DT changes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v7:
- Fix a W=1 compile warning in apple_pmu_get_event_idx() as appearently using GENMASK()
in a function prototype causes a warning in GCC.
- Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com

Changes in v6:
- Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM on Apple Hardware)
- Add patch to skip initialization of PMUv3 remap in EL1 even though not strictly needed
- Include DT patches
- Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com

Changes in v5:
- Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
chronological order.
- Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com

Changes in v4:
- Support per-implementation event attr group
- Fix Apple A7 event attr groups
- Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com

Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (21):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU startup
      drivers/perf: apple_m1: Support per-implementation event attr group
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support
      arm64: dts: apple: s5l8960x: Add CPU PMU nodes
      arm64: dts: apple: t7000: Add CPU PMU nodes
      arm64: dts: apple: t7001: Add CPU PMU nodes
      arm64: dts: apple: s800-0-3: Add CPU PMU nodes
      arm64: dts: apple: s8001: Add CPU PMU nodes
      arm64: dts: apple: t8010: Add CPU PMU nodes
      arm64: dts: apple: t8011: Add CPU PMU nodes
      arm64: dts: apple: t8012: Add CPU PMU nodes
      arm64: dts: apple: t8015: Add CPU PMU nodes

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 871 insertions(+), 35 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


