Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB74CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCdgiZ1TyX/pYhFXNqPTJ8AhKmze2m6Q5BqIjBmo8ps=; b=cVRLEq6cS0ChfTVHo4AOwjOXpe
	mID8+pboZIKBajGPVTAUTs7ztL+E8TwWWsZAyqR/uf3HglweIPAV4c8cDTOWTcu5Xyl2vqdaLOPCz
	Eag2ckTZKAQyZ70Zox9YuIIAb740Lc9U0z9oFWN8/IvS3ixCllQCSQyd86deee5377lZjnPD42tlt
	BQ6rmaoun9rhz/v0Qm4H5cV/YlNX+uXxJfNKx6+O9QizLX3GRNGWMOVT0Dtn6vYc/S7PNG7nqMBFU
	fLrOk5llKpRJQgOAO7Ci6m78pSwNmbuejFxeVBlKdXCYxaoEnepKpC3rgAebNIoblUcuEziEq+mGq
	43Na7BHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjan-000000011PG-1ap7;
	Tue, 26 May 2026 04:40:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjal-000000011Ot-0y6y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 04:40:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bd9c3b550aso70550365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779770434; x=1780375234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCdgiZ1TyX/pYhFXNqPTJ8AhKmze2m6Q5BqIjBmo8ps=;
        b=I0Kn1gje33uELuL1Ujn7l6EaeEfi5bFjhGrAEpdPm/i2/gV8byLL+jcZLioPblWNT8
         XO36dnGEIHNMPuzk9Kdeqf2z3hQhDf2TbQAzA0xBYxrF7Z+WF0MfAFmHNRTZcZBUNuTF
         Q9tEW/FGSyASTOvpuwR9+2Oo43O9oKxBUYmBDIUn5tnIaEwIl2+YATSFsm1m8dz/tk53
         YY6n6HsPx5wonV1hYJaxR3UocUgOHdU1uBZJNP9M3iJNzviHHosEJ4H9tFE9L4eWDfy0
         N6RBvv5ky2O2+thsN8clOtzjok7DqFd2TEz29Tuj0Mz9IL/2CGDFh9BGZehN6BzJZn+Q
         LwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779770434; x=1780375234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCdgiZ1TyX/pYhFXNqPTJ8AhKmze2m6Q5BqIjBmo8ps=;
        b=CAoE40eUGBA3vpfgSBn4vFxfDqzv8uUOUGVCQXkhLarBDa5CEvSXy8VZA+Ho8qy2gz
         EwiRoAOngkWezUPiinD/WfhSoRCMe7ZhXxE91Ob3o6Uagry4dJyTPe5xvCKZ41eqOBp7
         XTZ6RLlubUNQriBrnnsF6oGtTQx8/xAr+8uX8eiM31Xe1mNCYU2AT6soYrRvmwI/PftR
         YxXYbdRfnUeImXHIOxasknQA674Zdj5WyCJOKL1OMQV59BWryS8kZTPJE1ozVr+2enZ8
         8/qqykN2FblOKCpLS4pIVYPk1Yi/sQIf0oXO+18WYr0NJQsCZxlZgKOwFSQ2nF156H8A
         mtOw==
X-Forwarded-Encrypted: i=1; AFNElJ+h6F9y3eG0L3BQ/mlsUU1X5SmMXSimt+WADtDUHFxCDZrlISFjazM6k3vBI30Ypk2kRZb+t4UvtDiSOdIda9KK@lists.infradead.org
X-Gm-Message-State: AOJu0YwYHo8Mjzl4USEUQNpMqis15FnzqpqL1zggn48cTzrcyn9WbXfA
	nTVPfVT5UTGmaxTRyE7hnIODNzDTIG4p8lcNoyOvIz8lhZXTwhxwpSyU
X-Gm-Gg: Acq92OG0OfyJpsWiovMZMHu2NrhS9Te6ZdY1j6avCnQWdODVMksg3EHgkUZB+CqcIhY
	KGVRUsvwBKwsWWzoZFM32p7NgXHslpnai1jY2by9Npz7/AkGyXpcVeqaWh86cYbrQw5gpBGC7ZQ
	Elwhiu8V4S4lx4+JR6zU3jzaZr48ittZ1DKGAxvoN6RAILUy9FXwTtzrOm9EhXOoU5OlseMUFZi
	ynC1xa27YBUg+VtJC59Woer160phsm9Wh8vAkXrjwNR7thKiI5gBVCxI+LlIDXqgIlMYTfnDOBG
	X2dcH3WeGb6FISaQkTKqCYNysWuVYfZTstxGxX4F1AM4GHVE0Fa/aa3b2Xa1/h9w4FfOZ2pfmeG
	a8erJzLYREScSNSHhEhV9MIZaIhER7wmKGi2GZpIivI6thEGEmQ98Y8jTVZl+1frpaiNfIY/7re
	YtYelP/goNPZZXJuBqZCA4p76/r+3dU37HopRmF2roc7IzvyfLilm9xaf8gEnRSVyP3rgiPDnnD
	sR4wU60tpS/up7eHsw/2W2+pzpE1ePN/Cs=
X-Received: by 2002:a17:902:c951:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2beb06fc2c0mr203575625ad.22.1779770434350;
        Mon, 25 May 2026 21:40:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c4f20sm107692285ad.61.2026.05.25.21.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 21:40:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linusw@kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR MVEBU (Marvell Armada 370 and Ar...),linusw@kernel.org),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] PCI: mvebu: Use fixed-width interrupt masks
Date: Mon, 25 May 2026 21:40:16 -0700
Message-ID: <20260526044016.1025613-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_214035_282799_14B23655 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Use u32-typed BIT and GENMASK helpers for PCIe interrupt register
masks.  This keeps inverted masks in the same width as the registers
and avoids truncation warnings on 64-bit compile-test builds.

Fixes this and similar warnings:

drivers/pci/controller/pci-mvebu.c:316:21: error: implicit conversion from
'unsigned long' to 'u32' (aka 'unsigned int') changes value from
18446744069414584320 to 0 [-Werror,-Wconstant-conversion]
  316 |         mvebu_writel(port, ~PCIE_INT_ALL_MASK, PCIE_INT_UNMASK_OFF);

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove sys_to_pcie change
 drivers/pci/controller/pci-mvebu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index e568528bad85..f5a3f7370552 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -57,9 +57,9 @@
 #define PCIE_CONF_DATA_OFF	0x18fc
 #define PCIE_INT_CAUSE_OFF	0x1900
 #define PCIE_INT_UNMASK_OFF	0x1910
-#define  PCIE_INT_INTX(i)		BIT(24+i)
-#define  PCIE_INT_PM_PME		BIT(28)
-#define  PCIE_INT_ALL_MASK		GENMASK(31, 0)
+#define  PCIE_INT_INTX(i)		BIT_U32(24 + (i))
+#define  PCIE_INT_PM_PME		BIT_U32(28)
+#define  PCIE_INT_ALL_MASK		GENMASK_U32(31, 0)
 #define PCIE_CTRL_OFF		0x1a00
 #define  PCIE_CTRL_X1_MODE		0x0001
 #define  PCIE_CTRL_RC_MODE		BIT(1)
-- 
2.54.0


