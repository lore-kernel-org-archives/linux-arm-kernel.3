Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=35aTfl9eEGV17VrFB86CmV/usP3FQo76VFTBz22tACk=; b=uPB+XIQQN+da6Q
	Ku3NPmJ3dHzRiolCg0/OWy2LOQjx3DXr0udaQ6E9vpaJSjQhcA3Onu3AZ8BWRkjz3oahj2ZJJnv9o
	EaBw5gy4/PjSloGR32zbLg1mYLDbL/M1TZhmohIkwp3N1fvITfbSxJ3p4LN4pw1kPV8HdZXSp/0+k
	cpDJqhfHhYHQo+7nqb+hC1ICpapcp/GUzQ5OiU6S0P3KhoDvW7NTNJXJ6kuIuEgobhxCzaONWDCnn
	CJ7ZJTI3jq6dt9NcugRwSnOvFWzw7m9ex9/ZruwaWIK1gQc4X55mjSuiVU4nRwg+gb5Hy7OAGJHr/
	6IokRu1n9bjBWGi3J9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwjX-0000000FA7j-3ZTS;
	Fri, 14 Feb 2025 14:31:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwi5-0000000F9lG-1Kck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso1680462a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543428; x=1740148228; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35aTfl9eEGV17VrFB86CmV/usP3FQo76VFTBz22tACk=;
        b=BLr0IqJ9alSmz92njG5Qhn3yK4ipaIWE6wQr/4kPRy7ItIulpBNMAgXWuSuZ5PtxjO
         FFqzXnNpVGCiMyExnHnK7QkRtVyxZA8fxmGab4MxdjzQH/1J2r2Dj1WFUB7rFPEM4HnV
         ou7zWPbDtMJ2vESas/QRgGcouyNNijf5RqwZ7VMkfI4VAZRnNLEPFNHR7D2aNmDklyoc
         F7Mji/EkhXcPjA6jT+uMvBg4AZ87R3Y2CXFKbFGtSCvcxUiwH+8oGpFeoveoyzYtSSNY
         8V8qrmo/lhhWLkeOUK7qLIeVypaWDDsZSLIVGNIUGcc2YzHAAl10dJ7Ga7osVcaTD0Iw
         PdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543428; x=1740148228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35aTfl9eEGV17VrFB86CmV/usP3FQo76VFTBz22tACk=;
        b=rH85i45zrENIbB0OhO6te1vhgxwtiPLViEMMcNa5OVEQiuP2W7tn8OJrffg+oUVc+S
         xEqTTgD5wih17WwCKR6m0Ry0TQp7d+4EzuK5NUlU77hNYhcm2g6RHViDcExdffQEAgiD
         YOc/TDVPB8IxE/eZbGTGO5BiTGrAWvT+8kKTWe1XLiODVQDu9hmkt//0CZgHvSX5sCkj
         Op5kWgPL3WxKe8ojDTjvfVCB5iThwHCC7X4WfruoObrifeSGIOfB7udri04g/q2tp5h4
         xeKUbLTfYM6NBlBmRfLmx0S3sbNuVWbkti1uglq+vMFWUdk3pJzJZIO1R8mxOXRKJi3k
         mI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrZzOabqElbPbjNQiSSVVrChIv2cAHxS8eWb2Bu2AI87+wCEP8JCi4qmByMOmToz3hWin9qXFq+Gsp+OWcoBZ4@lists.infradead.org
X-Gm-Message-State: AOJu0YwGelCam3gW8LTc7eAGfU3BFlzCVMPDFK/Vrvo1Jno0RLKQgHMt
	WYr/vSDb6zOAH43K9Lqiu4r13W4f4Sxn15YTzkEEIbGNVC3NJa3Y
X-Gm-Gg: ASbGncs0qP68hipJvODDhwqO/Y8Ea2PnFwylnMyxrFPbAPui2eg+aSXqYA9BGySspMW
	7+9jG9lZZTEAVBnS4l8YFQcZLzgyoHrgOFB4NLKwdnquaH3QMih5vkmX+YRvBeXlj2Aoc1mOy9l
	FDPhikVdcj84TyJgPNS3puNt1JjFgWVYizyjZ3U73UaFakDgv1fPws+bbmi+FAH37plc4BlVrDM
	2Amkx9DamhGRSb+aFwJKHMJEVd51VSlb2EZh54eJ9t1iLgJdKD4dDiEfDBs32zb2r2HbtBxByHU
	QetJtQ/5sZpPFoVt8w==
X-Google-Smtp-Source: AGHT+IGs2oJbWsBd2mmLA46RkL5aQhsZza/epKIJ6zzfwAjcLXEGBDxv7SMnURG3VhsbOrnsni1MWg==
X-Received: by 2002:a17:90b:3904:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-2fc0dbbcdbfmr13243789a91.0.1739543428566;
        Fri, 14 Feb 2025 06:30:28 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 00/11] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Fri, 14 Feb 2025 22:28:26 +0800
Message-Id: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAApTr2cC/3XM3QrCIBjG8VsZHmdM3625jrqP6MDp6ybsQ7SkG
 Lv33CBYQYfPA7//TAJ6i4Gcs5l4jDbYaUyjOGREdXJskVqdNuE5L3POGJXO9UiVGx60lKUELaE
 uBJAEnEdjn1vseku7s+E++dfWjmx9Pxm+z0RGc2qEqgyXilUFXNpB2v6opoGsmcj3FL4oT1RUD
 ZxYDRyF+KXwn0KiDVZGSI1aMLOny7K8AfzAuRoaAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gtQMWCY0nW0A18HtWxRoKoFtQ4tFPKmIdXgTS2ef1gY=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1N7RBkPZAp85QlcDJZT0ti1VtbqLJHg+lrbB
 gcL1iCD6yyJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TewAKCRABygi3psUI
 JHZaD/4ydiNHvX1RevtAsKyPrnxMj4JKddZn5+JxVXazvY3+KP9r8pJOqofBxsasQb7jSUqyRRY
 MrC784SMe8P123v4vCmDG5/ODIBVWrXZdAq+08Pu0luK6K8FJF8bBLItkkeGSTjyS1e5ifGdGvX
 /PHxGeTI4/temzJKL9GcnxE7f4vAf9qMDqglc8vuDoX4I6zHb2KnbbcHkrnNXwNkSB/wHO4l95d
 Ly5ltUSUXNusvz/EmijnAZWFq3O9XiVd72hvGMHhFjNPxtIsbMPOOY4jiWHmrAPWQTgaK/1dJLL
 4/W3fBB8EgAMEcWFJrB6cFEn8fsuCaWZJcIHQgD6UlInDmV2xn0tMbVpvCPH9rdpXDsMwwdoEZ7
 IU8BV48qsuI+YHwATC8UGwxJd6GOI3bKGMIyqXEvKCH4wm+vapFJZV43cYmxoJW1HqmzqgEcrBr
 hLEBAu3v39zQS7JLx3XZv1Vf6ikmO9d1neUJFN0XJjItRx2OMGM8W1madyswXX34dWtQBenkHh4
 zHyYtkM+DWO9MMhAKjHItA9UZrmA8HfiF5r+lQcZ8q5PiEE43dXOc0ydKb9zR8fPJ86r2iRBB5t
 aSV11KZKbnHBqhsuN43t0j3L4t31QzdrMs0FZiii9nXLZqyO8+Ac/ggcKKmntMI1QAOBU8TPJA8
 LndGEHDir7iZk/A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063029_362126_5DE114B4 
X-CRM114-Status: GOOD (  11.44  )
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
Patch 2-6 prepares the driver to allow adding support for those 
older SoCs.
Patch 7-11 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
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
Nick Chan (11):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
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

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 801 ++++++++++++++++++++++++-
 3 files changed, 777 insertions(+), 33 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


