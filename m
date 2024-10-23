Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B1DD2E03C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uqMTUrlhS9c2NaDPYna570q7ZTXS8TJm8rks4GyeT0E=; b=JVi3Y69eCSr0whwLddbqhzDsjO
	KPIZUU+devtCI8wWKITpZEQyAIisCoKsL1dFYxNEhdnu0ORzzd28MRZU+nA6Q+ZOIInYKLOe4vAbZ
	40XAWRm7Im6ptGuuXLJaeP/i5NSkAV8yldy+c0w2Plqa8hNb8pdeNRurXeivB2baAG+g7tnt/aaMR
	Vm8SHyuO4PIVuGFVdAKxCfDbZa8r5q2Iwo+NbwjagJDFIxC2AYuWc7sV5gPgwjM51kx5lczXZIASY
	IBGjssIJsc2ivgt8F/jE/nvTwKzoJ1et5HOfVn2SyD4X8YXYnX7I/uzQwEQkvw3L3hH5YjF3lZ42z
	eGbyXccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y3W-0000000DsMG-1NX3;
	Wed, 23 Oct 2024 09:53:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XdH-0000000Dmp5-3cea;
	Wed, 23 Oct 2024 09:26:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c7edf2872so5118405ad.1;
        Wed, 23 Oct 2024 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675582; x=1730280382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqMTUrlhS9c2NaDPYna570q7ZTXS8TJm8rks4GyeT0E=;
        b=FziBP8NtNyTVFHWwspxLVp/iJpfUcJt3ymviz4Q6L+fA7XvBW/fkXq6DlCb4kkQe11
         LsXvolutLPkiX4FI8rvB5MqqWR3+FAE6bV9zMcBEL5VD+O5Mnkb/o3nVcgN2cHx1iy0Q
         I243JQ4SIhWXO8JiQoR48DRL97a1uY+wL7xP+8gUKFNcVYhTWizgDSAZxQvwSOj3k4ui
         hu2R3HoZvcWbvHqL6S7vfIxuOoYnU+HecCchpqFLrnVFaDUxCgG/kD98nEwcTPVTZ8wz
         rwHzt6w0Yw9Wo4U7MhYgY5Vt3tdLW/bBpmid4fjTT6w6lj7mX5DE9n65YDqFQJwA2UTc
         KcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675582; x=1730280382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqMTUrlhS9c2NaDPYna570q7ZTXS8TJm8rks4GyeT0E=;
        b=VqSy/xq/BB6j13sSg/LNcjkjpc/oB8bNF9m4+GR8jSIMmPKNmjEkMq84nz/seHkpb9
         v7eScJE1LCaJIaRQM+OYrvcSXHVXRVM9dgdFyMWhxNmuIptCqVaWAnhhIsgowyrCVHb+
         upMyuyu4P3u+5dxmlkbC6r6ZwcJ+MfqM0IV8icMAwWmCScwUTCuE84nRI6mzbqgz8pEj
         BxHAyz71UpF9XllmZ84hGA156hHmJphfp0a9QpGc41MJj9Qd5OP1dedO430kugU9UdNj
         vYfd5UTi6T5mn0DdPKKa72A713YCCzT5MWJ4yCkw6FHzCP5mZUDM7EGoAUZZV29BMyVs
         mHgg==
X-Forwarded-Encrypted: i=1; AJvYcCXa66ElL5C+6oos40UMuZuGnv0EK8pgRJrNuXzAe7hmJfAQLa1JPMbbJ8pq0heCrP5DMXuUif/0Qjk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwFMPr1Ta9NpDdFFSM6IBxZLWj8AFpS0WvfJJHmWTIBDjFyzw6
	pkRprFJyMLT4LcFGbPwAmIZLnHGjf23TJuud4uu6M6wFEZLpcSGS
X-Google-Smtp-Source: AGHT+IFfo4At+Jz5FFc0TuU6S0hz6vT2tNATHOeyiCdyh2kU4xwiqLCx7UFSkT/v7yeJ2rOtQj9TRg==
X-Received: by 2002:a17:902:e74d:b0:20c:9026:93a with SMTP id d9443c01a7336-20e970c63c8mr103663025ad.19.1729675582581;
        Wed, 23 Oct 2024 02:26:22 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd376sm54041635ad.132.2024.10.23.02.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:26:22 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v8 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 23 Oct 2024 09:26:15 +0000
Message-Id: <20241023092617.108021-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_022623_922566_8F91826C 
X-CRM114-Status: GOOD (  14.32  )
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v8:
  - Update ma35d1 mtd nand driver
    - Rename to nuvoton-ma35d1-nand-controller.c.
    - Use switch case instead of if else.
    - Move some parameters to be set during initialization.
    - Fix the ecc.read_page return value issue.
    - Add enable/disable ECC engine before and after reading/writing the page.
    - Return IRQ_NONE if (isr & INT_DMA) == 0.
    - Move the HW ECC related settings to ON_HOST.
    - Move hw_init() to probe.

v7:
  - Update nuvoton,ma35d1-nand.yaml
    - Remove required 'nand-ecc-step-size' and 'nand-ecc-strength'.
    - Add 'reg' for chip select.
  - Update ma35d1 mtd nand driver
    - Update space and comments style.
    - Add chip select setting from DT.
    - Add switch case which supports various ECC configurations.
    - Set reset before NAND controller enable.

v6:
  - Update ma35d1 mtd nand driver
    - Remove extra blank lines and add comments.

v5:
  - Update ma35d1 mtd nand driver
    - Remove unnecessary definitions and comments.
    - Modified DMA API call sequence.
    - Move the ECC check out of the interrupt handler.
      Check it after reading a page.

v4:
  - Update nuvoton,ma35d1-nand.yaml
    - rename 'nuvoton,ma35d1-nand' to 'nuvoton,ma35d1-nand-controller'.
  - Update ma35d1 mtd nand driver
    - Rewrite the NAND driver using the exec_op API.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.



Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |  95 ++
 drivers/mtd/nand/raw/Kconfig                  |   8 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 .../nand/raw/nuvoton-ma35d1-nand-controller.c | 932 ++++++++++++++++++
 4 files changed, 1036 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c

-- 
2.25.1


