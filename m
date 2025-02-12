Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27876C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1lFTrP+BonqZ6RE+K7BgikeM2R5BYOXIWvccxtapFFA=; b=GzYN11bSNcyWuw
	MP9fy+8hwgr/E4LT/ON0YipE/EhKJrQt/iAvKacak+POOAnHpuvAusApk4w/VN1LgyizI7wy3ZMnn
	VO9CSgbWA0J8O8GDj2CIYDm16Vj9X986GpTwMvY1jZdHQYYl20eB8qdw/NsFFu5N0kW/UnzVz3X0h
	MxGXvLScU7yDAo6fM/NV5JbJ1TkTXNN26+Se57p2B+3uljY7k7cELUZ4OSTpng0ROJNyJD4I5eOO6
	2mTto1MhoRcZ6JOCzoIQH4ZfH8eNF8sJwVaVRVgHEh/CFMPvR++++LARBIpyAjhze2L9Sllm2IX1M
	BRURG503bt/LHByzE/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGVO-00000008JhQ-2fuq;
	Wed, 12 Feb 2025 17:26:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGRx-00000008Imo-2EbJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:02 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fa4493a695so52213a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380980; x=1739985780; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lFTrP+BonqZ6RE+K7BgikeM2R5BYOXIWvccxtapFFA=;
        b=HQOSjXQm04+m3/JXfw9qHCFTaQbZEkZ4Dj8eNbetTaRaB/7O9IpYGx/SH2+tAZuoxd
         /SdPBAg3T+OVPqr/fnVxXz3Qj2ZNUoOHwYgYuZ6Xnb6NX18L5QBT2sZmEPe4mItSy3kT
         DTteXj3e6MHnSRyaB1uLUjB6fMxMCdFz+crspND/Ne+LoCSTDyorxHeb0bUXGpJLf4w6
         88JfcxlHxrIp0cXoEJiCTcNm0CXtdlIGdK6f1KT1GI8wrjvOsQORUDKlS0cTRWlPxbWX
         z0lOoZ2NVxSQDYbcUUE6u5a9bwRqumEH1GYQSbLo3DuoUwjvRNg5AYsa9lL01BEbIhZd
         8dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380980; x=1739985780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lFTrP+BonqZ6RE+K7BgikeM2R5BYOXIWvccxtapFFA=;
        b=rPRKCHWOZtxA3SyIGhmZ8V1qf3AuN3jiSf04yPW07xT0x9UQIod+6IaLWqmLQpB1T2
         qxuLCA5hbYDt0veJFJ82h2bdNmmdOwBrMtZ6kIybA0u2ytR0U/pKUbYMOd9GkH8IbCWz
         uyqhrwdUqz8H7GZp23mgsXnjbYd8tZ3teppgeOR0vJggTDm4qZh0jtYa8ULfBG3iAwE0
         l656Y4DvfIWxnHaDpG3VkSsbuec18yEOxsLtzbdtMq0VSnlUFrN0CcEW563ohkFkJQyF
         Hlrto/RkAfRRVSy+P70DL7ZNYRafUyfMdcHpywJZwApU7TiK/1gmI1PeK8W0+pEru072
         /nPw==
X-Forwarded-Encrypted: i=1; AJvYcCW2bZFfTcD/q/EOKWP6JWIYeqznbkuOQfcNEuKnhIib82g6VY069pgkEEAAU9zxhT2MLlWIpH5B4ZFdbsJCR+Du@lists.infradead.org
X-Gm-Message-State: AOJu0YzfvxkO/q+jVgOF1PqBVD7+Gb4FOxqWkk6X5xgBAnhMp1/U1oAJ
	Ex1Zb/dylXUWz0orErydhrRbsisZJL0EXraHUqXUjmyttk/IkXMN
X-Gm-Gg: ASbGncuyPKJX22O5qzzad16Zjq/3LCH36MKNd9Ia6qMhmiTLQi30rD1+geypnV3M9pA
	6RToWP6u77Byd7beCWnMLVI/vQcH8uR/e5g0hn7Nwgn1mJfI4iuzxP3S6oyellACWlCs70eSRAl
	in7ZchE9gAPI/mWcW71NfWXborigo5tWN2LBe4FL8nGm0WrHUYCMftzygVWh5p9IomUSzs07VBZ
	yOQt6HYVN8SOkScmyswqSdUvtS75bqbVrPuFPX6qlMck6uAcmu1rNI604IoPnVT7TZJLXonAmkB
	oF7DnKHVmPlnb117oA==
X-Google-Smtp-Source: AGHT+IHn0FJgAgW3EXqfL57h9xApzlzHjpYghcGnfSVWGl24NW8c0UStwz3RHGsKchK5LzWYax0kIA==
X-Received: by 2002:a05:6a00:f05:b0:730:9334:18f3 with SMTP id d2e1a72fcca58-7322c411b76mr6606040b3a.19.1739380979926;
        Wed, 12 Feb 2025 09:22:59 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:22:59 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 00/10] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 13 Feb 2025 01:22:23 +0800
Message-Id: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/YrGcC/03MSwrCMBSF4a2UOzaSR0OrI/chHVzSpL3QtCHRo
 JTs3VgQHP4HzrdDspFsgmuzQ7SZEm1rDXlqwMy4TpbRWBskl5pLIRiGsFhmgn8yjRrViOrS9gr
 qIUTr6HVg96H2TOmxxfdhZ/Fdf4z8Z7JgnLnedE6iEV2rbpNHWs5m8zCUUj7kPNbTpAAAAA==
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=1xhseV3eZQGwx01B1GvNTQYFNKov2efQn4y8njwtipI=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvY246j9H6DeRb0g2O3j9o8zgzHfGbZjPdV
 2uKaekESv6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JDBRD/wLPfzXMs9aVY8on5tPGhLo3DjPOGnM0XC6F2UvrmfaEbLz+D/W/RCe85Ix4/tByB+XDRa
 RuTaDOaDP3NoWXTSNimsNtouZjGpnh1em/d4yG2okJakIfyxR7/dckYimS1bWCKOSqbBggP3TVe
 KWy7qBFEX0czP80k5LS81eNULS5leSKM4Ugqtcu9CqWvEGESred6TdibRRzeby913DG24e6CH5H
 0jIr7ytAOPxEA8ZOzudgUkHWVB3PCI6FKdstJ8BASmjTXKVIp/3JjmSsk/56LeHq5oUYlVu5Xw8
 O0KIXbBDvY3JxD2aEJ7MwH4ArX7FdFZbmyX9B6H454OUiiqJPX83ibfSxzWSIr109vZoktu9jrE
 atXdsvBHrddB6wrEdR+V0fNmXy8wYqSG4c25U7NWsW869tVtqwjK6fPcgllpLy5SctQe4fQ6lEr
 vqu7YzQzmySScXYwKgHBAU0NnXq9UsRG2mKWqY7HlcXpSNvHUBx5MjehHVeZCokMQvv75rdQsyA
 tvDG+STTEz0GmzpXp099fFoyRQLurWn75Vbz7L2eketulKuGCN1R8pY/1ijgLSAlCQ2a4l/+dXl
 pRKGSX++VQF2pbU+ORxY4ULcf+hR/jSgrjDcnayyIEzGm/s99I7//hINoCQrgpvguHG8ivw1l6A
 a52AqZHGNXeH18w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092301_576915_F8B9509C 
X-CRM114-Status: GOOD (  11.55  )
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
Patch 2-5 prepares the driver to allow adding support for those 
older SoCs.
Patch 6-10 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (10):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU start
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
 drivers/perf/apple_m1_cpu_pmu.c                | 776 ++++++++++++++++++++++++-
 3 files changed, 752 insertions(+), 32 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


