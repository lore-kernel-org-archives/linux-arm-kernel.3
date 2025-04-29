Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D128C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=; b=s3dhyZZRW66GZE
	xJikYjXP1e+BEBEZlJPcD4Oj6bHg5WFZ/wVogWquI8ttDcHe3MTLX2Z6HpgzbU7TEwuEddHg9K++6
	yqd/U2S4ycrqzGXDmLBWIp66hyseNnoU8ZfuW3SKiuHeIKgQwVqPiVjrrPoNQF2maeu7QU4oXpnDP
	zpPahQC7bfDGX26Jql0PeoSgqhqx2dl+joW6lKoNbEwQy+C2q21Pv7ySi/tf47F6SZcYcoB9G3wEB
	zgkLDu8lsrheHJoDR/M8thbGACNoaELsMPJIx+5wu9rcDJxldCyw3kqkNcxzGP5GqLsBFza+tI7Qa
	SIw3tarxC/oCmEjzquDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bud-00000008DT6-2o1a;
	Tue, 29 Apr 2025 03:45:39 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bsh-00000008D04-1cmh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:43:40 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so4057247a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898218; x=1746503018; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=;
        b=l4aFuwUsGdJZsioyhb81Mvy2V4xJrsRIvKp4iQ7m1PM8FCAvh51SqazxAXu7epuPiu
         Mr7IpPKkxr7Dffx4x8aUcGN01wVUJr0/IXWyI8SoAB9uC63Piaz/DeZ5gF5eJORAwTMM
         jkDX3k/y1VDD8ijM/9DY0drq8zo3KOWjtEikpkEKFfCFjq9tA5D2uRf4JeI6haAgWqtt
         ndl7gLp1EHuE66ZU+i7cHQ0Z28arIIs7RBw+vWT25RMF20WHVp6sJP7MU2R4eIxA/7va
         KpgWGEwim/A8sQjhzdGbz6NJhTG+ALbacVx8qNjr1T2ZBkjZpK1ooaNWenr+uksxoDLG
         69Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898218; x=1746503018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=;
        b=ebUJq+KRvddtmyI0asWLXAR5H5mWbGkUphYSBNHEDMEzuxkR28sV4mhF10CWrjpLWS
         h7yDERtGeRxU+ioXrS37yxOA87VuvIEjl9453hQ05RzIrIZMdbilNUSF4PXz5UOl0jcC
         y0HqnF9+AioeE/w5ucJ3beKPZZ2vh6C/eiGqAybibzysW6lGL/PmLBJMBztuQ5Wye6Ho
         RGpb8wJMBinOGwGdyGM2whqEZgFLsC+JMwB1kwHrxnTlwxVkha4ymhxUbthuLyX0hvt1
         L1RI3QFMNYbzK4cHACsZn9+srg1M+QqgXfUoz6SRRVS5W1xC6HAskHkN7hkQ9cEH7b5w
         Zh8w==
X-Forwarded-Encrypted: i=1; AJvYcCVCQr2bXUDzeEZcWzlMNa9KFRW9ntT5dEyeS+dLzVsV/QNAk0UG+ZKFQRcZd5PAewXM+pOf2aPZKOfqXxKWWHdb@lists.infradead.org
X-Gm-Message-State: AOJu0YwrSqFy8l5ZuChjDK6LtEB0K8HZgwlcm/ZnKirh37aaZnfetN2k
	rOejGEWq8VHNflKunfpl6KAhlrIGdj9E1DOH1/+Pwh0G1dXp041y
X-Gm-Gg: ASbGncuT3whovofz7CDBtPvYnRDYnuo2TYsWCIAr/PGNUDPQtSLvjQ4gcCq9Wvj3G6p
	ev6zqNgwesJF2tW4O0raeO2dG+tcVvpaybx3FyIwDB3VOba76BhZQW4hyid77KgC6RmlJ0zng4h
	x+95ZP2EXhc5C24qS4T9z4tO9Ts4zFsN4JR6EJpWp6eKwBtRvgchUqKwxKvQtUBXve/ruLtqwdu
	cAIXGyvR4mPIq3sgFSLejOX9PLxn6Ou378hmfnE6ZRqmzdqG8ybj5sbFjyvn5wRDhQ49OYmYexU
	78I/ItyUIB9qaAlYL6KYaLHxgqSWi6dMq+vVfen3Ar7HvSsdqWjgpQZxIw==
X-Google-Smtp-Source: AGHT+IHDlfH5cI7f1OQklMi9xc6LaYpwXhhqvPBfBvQ0fZ4Ac0OERq6XWV3yO59OjjnYFowNpLs0xw==
X-Received: by 2002:a17:90b:2f10:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-30a0102977fmr18745487a91.0.1745898217839;
        Mon, 28 Apr 2025 20:43:37 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:37 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v6 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
Date: Tue, 29 Apr 2025 11:42:24 +0800
Message-Id: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3865; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=A/h8OXs8Wekr7gbuWaO+81ojzwQgObVHH0lNAKAIdNU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErbsRiI2o9zO9yGgrIDiPGqiBCwQ/exVDgtU
 yLxoDGk792JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK2wAKCRABygi3psUI
 JOc6D/9YZLf+qLgGlcRIAvMjZ0bDXDsXrSD0YBt2SLzeB7VjTMMw+LFsxMbOZPgDmIHDx8i8AtJ
 MkeCh/kYRZE4OGpvb9wiMGts7rjIRZZKL07IiMHHRlG12dRlSnlxWouS7ycpn8vom0TltxhHbIK
 P0RByJ5zt9SFyUcU47cf5pCIo3Wx0grcqRB2ls0DtFbkVIvEd93UXUXMOA2Z0t/BI4eWR7IJMw3
 1ew95gkM+NuMb7G+thfluv7GLZb0SVt2d3KXtMAOrk5bgFsxzHH5XNYT+3tE7ljk0aVk3HkBkY7
 do//A5q5xglJKvizGtz8NzRSmYojIVxBCRTHn2hQMZtfoXzZv7pnIqaI7zvtu8PX6f+g8uZK5HX
 SfEucgyW9U6W6fJs308ifDSvZP62wFw4sfJ0ygw596PONfJhb/tRzGnJvo8DQ0mOYrM+4UBmBdO
 EExVPj9br0dRY13U4c5Xrqc6SmM3ffQ7Vy4lVRQ3wOWxkUpxcNttI6r4kQO0XWkOKV6UvBW2+TW
 fHK7BjsHgAr/G/nD7gSH9za6MOHULZFd9Js6idty98w//3uzXwwbnefcA9FdmL/RlsjPUec26iX
 nkPrPAA3GVbF52t0uaG8++C4ca1w9b/0qWNJUbBgF3492W+/M1ucVj1pRB9JQScNkrPNuzHtcDa
 FOrYz7yCtmIbOdA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204339_435358_A90BF9A8 
X-CRM114-Status: GOOD (  14.13  )
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


