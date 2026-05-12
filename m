Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B65CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/eFg2wB4o8zIZHpJ/y0oO5PL1bzy98ptVsLeFLg87yE=; b=MTdcBUVO2mNgGHO0N9PyC8R7sQ
	GAkluholPK0Ar0TV6/OFmCtpMixPSWelhqszsdf0Cdmzn2re41QDwnoePoYSlYa/C2U+uPC2m9lEJ
	jAVCrFW5GrUUTeFjijHlDECo4WyuJq3cMVPv4w8TcmgGljsaYJpeHBptfAw+ErYx/8Mx9vy265dtK
	BSosweUI2QADdx7oCMbky4gNrowJytMUwZwoBioMkw3CD+qesEl/44hhyH8VpQCukor0KQQv8w1xM
	X5ujbjJ2Ecx2zsF3QWp3awTFiLya2LaBKvlEV0fDckpXRSOSaUJEGejPwIPlXhbfQfuQtELvV9/II
	yQ8iHX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhil-0000000FxBL-0QZ7;
	Tue, 12 May 2026 07:40:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhii-0000000FxAS-2TI9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:40:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-366375c43c2so2958827a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571599; x=1779176399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eFg2wB4o8zIZHpJ/y0oO5PL1bzy98ptVsLeFLg87yE=;
        b=Zpcg9v8M7k4vtJNdzVzuc0R5syUVexkLjlG0MG8jXIr6BhUwbV2zS//AuNQw3J0A5Y
         iUMQCTL2fenzb3IwMn/XROM1rQuDMAaTYK2xRC+3F3d9n894xEg/Den+41hpF0eVz/iJ
         jYZNCTR1EK198hn5ZM/+6vnNLyH0iOUgZevhhJmHLjXUq9FlvjzY5Y3Esom0glDI3ECS
         3kl3F9OQGz/irEGvWU0MJGrSXMu62j5ie5sgBLay7ZRrHRnfCr1nflJW6VZx17LSkYar
         d5ntUvIDTOu/lFhqaXj7Au4pNPPEZpKOQ3DJ+utBPOSd7FCjoT7mzYgatTPA+9X+8S0m
         mOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571599; x=1779176399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eFg2wB4o8zIZHpJ/y0oO5PL1bzy98ptVsLeFLg87yE=;
        b=AI4zjMN+r6XfRQhx09n9eGzNxJuSCm3G81x15nICx0zEZph8xwJjQHELn8eQ5kooej
         oCKHS/uA/zKZjyeKub9fUCMMDTybNApnuAOJyQLmYIyqGspL74OBvc2sbA9xLfty1CiK
         r1F2zkBksVUTM2sqndy93xNN+h4CFAxhYRlMlRSd7EzZAj94Wc2JoCE5CQiQKYs2JZd3
         JLFzumsVFJgDQppsffGaZIu1VPoU7iOhNYCQ7THTCpZc7cKAYtz8cv1xB1qaVDwn6qJH
         aJPOvawuDtenTVumCu014DUpwp9XX50Jxj78FhITADe83yhSCX1QjqkXiNwBYJqj45zg
         I73w==
X-Forwarded-Encrypted: i=1; AFNElJ9bM9Z3hD1RaIQONi5VxPaIibFUIE+5x4w94gCms6ETcVEktMeakMwPOSx9+OIB6MVb0mYAYojgqxkIlDgxoyYE@lists.infradead.org
X-Gm-Message-State: AOJu0YyKATQCXZuY6D9/cO0tON3QYNXQnjdBePNtKOb51FDOPXc/9eRv
	RF4WJHkmL0hwUZJM6Say7LuHJqJKnmCFGmJFYUofKwH9LrjiIVkMKFEn
X-Gm-Gg: Acq92OHCSqIIAAGS+bNCc8OIoLTQ9GXQdpsKIVtr3zTMnqPC9QpKz7NUCIisC7ls+9+
	y0tDj4Au9v30sbZoqWpyeQQz3YsLnQ4dgakj1Cb1EuBlDqDQYjPWHhqK0L5WH35MGJASapUjQ+S
	XX+rHfKs3ELKEA0QW0BUm3I2oziDLiW5VCT33wV0uJeqtUXRPVfnZVOMfukFDIk7fWvojFGQSM8
	IpzPyVaD/gRBXgE4J3pP8ESllvHn0JZkbSJOyiUP+copL830lRWd5TTwh5rGGDhRcHJ+bwpscEl
	mBHv5jMnA0CpYM5z6dplFgZ2O/KufuOLXLLwpKOt6yqm+nwNny3wx6lTagOoQSCD9hYVpZQ/s5F
	m4oN1UOhNEVo6B3RS7hY/cAZAjbUnNOF10PTZ7unKwQcrca46FrrcunkPQEAjfvKTDuYkKhXswl
	/srPAQ2XOYS+V3VSI6J4XBrzgeM9eaA1ufnG8bm6PaolBahhjEoLYXmCGui15W/TPQLGvu0VXCf
	pgvpiygIQ==
X-Received: by 2002:a17:90b:53c7:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-3664c8db78emr18615005a91.6.1778571599128;
        Tue, 12 May 2026 00:39:59 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm13264489a91.14.2026.05.12.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:39:58 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Tue, 12 May 2026 15:39:50 +0800
Message-Id: <20260512073953.564323-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_004000_633269_281D116F 
X-CRM114-Status: GOOD (  14.01  )
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

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Changes in v3:
  - Fix minor DTS formatting issues (whitespace, missing newline)
    
  v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".
      
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.

  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
    
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.

  v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com
Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  15 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  60 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 792 ++++++++++++++++++
 6 files changed, 944 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


