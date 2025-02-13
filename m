Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32666C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7s1AnEsbDOxMifWlKKO96YvdNulNwpNMwNrlUq5WAgw=; b=xz2C3JriWUkGpR
	H1aYO9uJ/YCHAR4OeRt9KD25uB2EVbiyFcfW2ft2SOaS50tPk5+UsUXbv6dtKy0RagB8Ulgmo3fUZ
	cUhwYZlsequiW7sGx0LH4Knc9yailPw0UhLBF0egjgryQZIeqjHbnEmPD2bXER9P5AIYCXjE3F9Jp
	O2AhEt7ezkjXfsbkmVY6PnecTJWN2my8deeJJ7g2QNo6y6AE5Kygk3EuHw91sEE7SUFnQINaALmVn
	sAxmB5ha0AVFvTz6kDXgSZEbSq2xWzzlR8xOfBotvYyAIhINoaH8D80gLMp7RdJFklNGV1Sw2oHGx
	2T/mQH30sz6hzrgVGP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaN9-0000000BNZ9-0QGm;
	Thu, 13 Feb 2025 14:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKL-0000000BN2L-1Toq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 14:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=7s1AnEsbDOxMifWlKKO96YvdNulNwpNMwNrlUq5WAgw=; b=mxMlOoYw7Lw/c92af6adkSYQH7
	jRYjmF3kM8IGZkmegvE3MGhb9b8c3oL/0u5E4N6z59+NWRZmImMpZFaX32qweoEeq4KHNIhakL2Hf
	xppVDpI53P9EYbOiVTu1pmfpl8fCw91pGqXbLQCzwXvCEbEKRG5n7QagUDI59K6zD0fGgiBoyTFa+
	qaOAiIUXjcO1QInQipTc6kdS3Lbv7+zPhVhhZrcKI9/Mab75zpmoY+FxJ/Bl249CJ8VGk5p7xmy+K
	6JSUzqkyMP9/zJZSPOe/GA0zgq/d72z1BiL9c6zHtwutacJzGY2/fTy9ecESXFjSBy6z+B5YHIhXi
	9RIOX+LA==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKI-000000011I7-0mec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:36:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so1864085a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457383; x=1740062183; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s1AnEsbDOxMifWlKKO96YvdNulNwpNMwNrlUq5WAgw=;
        b=k9HEYKoQU2bXe9hmGhQhpsRnrHVS6Bk+fMpbQEnX5eIZldjsamEybpdKVU07mT8oFg
         KCL05QU0khLaAqZYIMN35OmOiDlAslG7JXY7ow4wSAA+hEA9pC/o5p5W0jw4Zc6Z0zPR
         e1p4rEprGUTPuo9eLo2uUk7ivcXrwzgGc4dg6CpIgFdnNT9UOzX/0FNUvjxAlhqjI86D
         m4beMmK4k8radNpuk6zLi9jfYBaBgBP3+JK7HJE0tBmDXq00JHxEWTpkiT8KthKxoGHi
         XGesow5m5kQETw26A8OFOClM90wHCR9CGVTjkKFns9amMtT07IuEg7nyeZpxCLkNRFhP
         tVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457383; x=1740062183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s1AnEsbDOxMifWlKKO96YvdNulNwpNMwNrlUq5WAgw=;
        b=fOpAJbYw76YulvECxDzVi73y0inDyzS+rbEMaJMZKJg+h5vMeu4tDCY253q7ioSD4P
         RkIGNCHTnuOVnL2Yfn/2wpUWyoepJP+Nk09snTXmkzClRiVmcxpqK1fdNKkAepdenQwB
         kJFNhnvHndpMVaAVJVQRnBxIfdXKsTIkySiKtKqTyVvhWJHtYccDxQ1vT4RLgv1wOK7M
         IG5SRNVWqLJfys1nW2OKKJfwTtF8FxKxjr6YOFhrBj8eWtDAPCF45DcZUS3ikA/Tno9F
         XLSoVTYG924syMVVx6TPhrLgFG4J3mV5/gxgm5b1yIrT5fIQ44vVtQDAau5mZSAUK3cS
         Bv+A==
X-Forwarded-Encrypted: i=1; AJvYcCWuNa5+WzmaPOsfMkafUodi5YKF+2a2oaL8U4SXMRxKt27LDnSx+UM3jVrQPnp43usSdS4DHCWLT5R1lrccUUkH@lists.infradead.org
X-Gm-Message-State: AOJu0YxEP2K8upcMBKdD3inU6KjqeVrPlmo9GuiDaDYVC5dSIhxMZPRU
	oQZ4LWlWbMfuAgjmjNLAcFZKOEgV/s2bKbyIKckLDkFyAuE+dx4J
X-Gm-Gg: ASbGncvrQS1Pf/c7Vsy+y7X7fn0318FR0akg8E+l3tVte9JffuSUqYfnGnBSCcLXQpR
	FHNqBRNDnSKQ8dFKhWPdseKP+XtQgaQn6bg8yJ1QDQUzm1dknJQFLATetUR29xYac0KPxu5t/nB
	Skv7nbTIW+kvJzN/tAmMeT9ne54cfZXHrb/9w+/vXABQ3cADglK9SXGgOiQZxsUh300VKe4GClQ
	Rwp5Qp5iPpvMLriEpmbNrg+XXNpz6FKzoY2TfwFA9HV4O2+x+/7dQanAypnBTwoTp5aTDmALJxc
	NrlF4PEr95/3ZhF9IA==
X-Google-Smtp-Source: AGHT+IFhfs9TjAcjn/ErTnxMN1WJfk7JOQCk0pFIocG3OaK+NCISwQFpuudm6tJWQ1iLr3j32Tlxow==
X-Received: by 2002:a17:90b:2c8e:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-2fbf5c71357mr11037562a91.29.1739457383189;
        Thu, 13 Feb 2025 06:36:23 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:22 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 00/10] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 13 Feb 2025 22:36:02 +0800
Message-Id: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIDrmcC/1XMywrCMBCF4VcpWRtpZlobXfke4mJM03agl5BoU
 Erf3bQg1OU58H+zCNazDeKSzcLbyIGnMQ08ZMJ0NLZWcp22gBzKHJSS5FxvpXHDS5ZUEtaE50K
 jSIHztuH3ht3uaXccnpP/bHZU6/tjYM9EJXPZaFM1QEZVBV7bgbg/mmkQKxNhn+JfCinV1QNP6
 oxgtd6ny7J8AfHpc4DfAAAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=HlJsqhb8XnHHNzy8AdqFixPhoif08uRtRpp/JRim2Eo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiM5TkmibLzic5zEE81YsjeEvk1L/dOVFUD
 dU7mRTs/A2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JKjfD/9mscaarB494OgyW4uYq1QJXorP6V5eRfYcimmfTN9369PcFCxeFReuiEaPK98qUT+2YF/
 CBI/e3iAMHFZI3YcOgVE7ZNjBuYvLxxaqFPqhxYQRcJPG6MZZnZFDuT3tdL62Ue4NEGdDYeShaC
 Er7IK91opJjC6qqaNrprt2d2GkuStvOK9TbZLJh+/OCVJSXzp+TsSzLurHBWHm/Bo4lpPf5RVhJ
 oqXinanCkSZbovdZUJlPb+q6bpge/+kNpLSsc3/Zl2tfnz8zNXpr8MpPj8MRKYrwITwRKFnvDSp
 uFNecTEscCTbURrjoFq34VMUYACEheQlq2v4AkOTA5jLpMWp3zmcayTEKsQuY98vBAvcoGeixiP
 dhxsIKSMTSmEKPwNssoRtrdKMJCGKVSNlZP46Uxp3A18p6W0VOvQ7IMhvQBZG/B1px6CcXxD/di
 rmCB3ispE2rueghdb1CgBCIK8UVdXYY6HCtFoUtKQBs+o6BXPBMMr2sPLIyeKQ49hs8fj9vH+FF
 DsAn8Sqdm6Uyj0aUIxXA4eoiuOuc3C16QyvsL6IG427z/oEyGqEr4z/K10gkY5ZtWHKjfm1wTjX
 3M/d+NQZ8VCscIuB52fHn2zrHmsx3o9RdOLquraPTzyiKMto9DQiU2D7HV02uq2wKe6INiUl3vu
 hC1DzYdr7M/KW5A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_143626_320800_D4CF5D12 
X-CRM114-Status: GOOD (  11.64  )
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
Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

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
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 779 ++++++++++++++++++++++++-
 3 files changed, 756 insertions(+), 32 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


