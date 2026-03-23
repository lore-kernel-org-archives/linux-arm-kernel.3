Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6D6F483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAFVmIYqCpTk7YHQuUKCiaGw6d7SaBhhkzvznBNGhns=; b=Y1s9XOWoCjfUhOBx9ON0VcBo5D
	DbAoAxx2mhtZ8LTrKXzR3Ou6rCGtEd2X/iR5dg0BE10U0L5hjw0i9XBhWSN/SuWUlXBh+RszeyPXu
	W5ulxbZc7XC4HlDBdEe1PuwJI0nYrjFVdRQje1kL5fV2XD4+HG0y4JsbNt2C+nJ73ZaGpYLiTGN8L
	QXO3qtBFzqPuoNdTW3OOS2MQFIv5O+ix8XE0/O+hy9CQc4hq7BZQOw/X7YfGEPdmMuJ5hA9Kkli2s
	gvmdwqSH9WyIkPWtnShGZ6xLatC90BWfo3tdxI8qomO9GF30Lsygie4KNuZmarzzJT+gnAmSCId3n
	qZ3oupqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jXU-0000000HHr8-0vDv;
	Mon, 23 Mar 2026 17:58:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jXS-0000000HHqb-0Xua
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:58:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ab46931cf1so46156885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774288685; x=1774893485; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAFVmIYqCpTk7YHQuUKCiaGw6d7SaBhhkzvznBNGhns=;
        b=no7QuWTFAW9G+BAPyvOEd+owpYP65WgFo2zgzVnLW6vYHSM8mcKCFee1pNMQtsY+Xl
         +UgfDDdum1J2E28Kb4oxvcjqCoG5VHUujC8spCv/lBfzX3SONjLw+Sc7UCcEcNX+o/Qr
         ssyrKCPtDgmLT43KrI18CFsrnvee37fN/H8u2enu/7QH+8/Qqort7d3Z6uaKrplQmIL/
         yvr6zC0RhJQLYsv9lZokRmYenLYBrCSM5VLp3F0imxRIdstqEJaq3UPxzC+dUAvWPC9p
         Bf/osSR+ZoiiyrGPjl7Z5CBg7VekGs3zf++JhgvGpgDIijzKEwAc0VCJz1bzQQbpgAep
         VidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288685; x=1774893485;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAFVmIYqCpTk7YHQuUKCiaGw6d7SaBhhkzvznBNGhns=;
        b=L/3Jz4kVvUFS9QwuCVAYefML6vSQeknTg97aoGDVUyDCJdOrmIb4u8/qiqYywcQk7K
         RtYUycwXWgRQ4eTWU9jDZhve5sKA0EiIM5fKPlBDJezAUAC77Daz/yoECMFJcjpdHvDU
         aQ9nN06V/IpC4DT3QDV0olqRztCm1bXdKJvZC8E2eBVxZfpDK49hMO8N6Sta4Q7bapwq
         CU2i8ekwXsPs3KAZlbWqSPULwlY1Lnh6RKn1e4TRqzJL2GWmAgA7bxFaXKjGznwVGuno
         T/wJP9S9WEdKLDeQBxVvmFqcNUDnkHl1A2F6XgHOHOVLqpRbyblT7myG7iAOk4QDVq/Q
         XAuA==
X-Forwarded-Encrypted: i=1; AJvYcCVp0WuoPKmr7IvSWY1cniqcEu5Li49BlvhfbGrK9za5Kr9u4flgUc5hS4F/yM/dwgAzs4xDszAftcwCnoZkwaQi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1FJSE6tMRu8nKhRA/n1NR++uhqOS90DjsOf0yABxQ2Qs5tenj
	lNdUaDcLZoOkRafyRvTnKLYzPkHGrmOZByJN3I4tK3X8yQmcCjvl4uHL
X-Gm-Gg: ATEYQzya24wLZhQ225RnrXky+7BQ8oIhhoMg2ms0hvRJHPSVJt91y6q6IrNW2GHP7uz
	pfHqGgw6ulXXuHLL2U/EjPlWbEvjwxmm2amocFl3A4ORIApTI2eONg8jzoffcdvEZ7N/eCNZOll
	sKU9VlryxyvtsMLaEtwfsqGUX4fQ60fBwZaBgag4UnquQQbOPSTssQYdnuyZ/FOi+bGJrmrYJj5
	K35fSPRIuS2B0Mqzs+jF8cYNC2783qUiAiMAeaPUx40PBBExGQwEtspGlkMqJEl+i9DpAgq2LDm
	cMz7SOQM/7KKGLFrydTSgW4dwhpfMZhAevewV2xLdq4DF3VhmX1Ooglj/weLJb/43/LCtmzkeJ/
	Y6XHEGT0IyQotXsIpx/eymHvtzYs+HNnR3A0km0Pv+bQVUdzcUCE+rz8zJv16NCZ9g1wxXWiauR
	61EwStZWPruX2dmz2t0isfiFq+C47FgB83QF+o
X-Received: by 2002:a17:903:2acc:b0:2ae:7f85:33d1 with SMTP id d9443c01a7336-2b0a4cd49e4mr4562165ad.0.1774288684737;
        Mon, 23 Mar 2026 10:58:04 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835551c3sm113415065ad.35.2026.03.23.10.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:58:04 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 24 Mar 2026 01:57:59 +0800
Subject: [PATCH] PCI: aspeed: Fix IRQ domain leak on platform_get_irq()
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-aspeed-v1-1-354181624c00@gmail.com>
X-B4-Tracking: v=1; b=H4sIACZ/wWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMT3cTigtTUFN0kA1MTUxNLM8MUc1MloOKCotS0zAqwQdGxtbUAgHK
 gQ1gAAAA=
X-Change-ID: 20260324-aspeed-b05454961d75
To: Jacky Chou <jacky_chou@aspeedtech.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774288681; l=1574;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=cYrcg8cZ1OOgmV+TAbZ97fcCPC0PWmH/iybgc6SDMxs=;
 b=l+RPKAQMkKB3prPtTq61GiYDOiTZZEVvZpdPRmil5aMf0ygzxdGhIKpTojXIdqk8Guifwxe3Y
 UOj7efLJOKnAPRYwxbJvxbBY6Iz1Z6VcYRmZbAzVLfAw5weD9l6RPeg
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_105806_176887_CBFBF9F7 
X-CRM114-Status: GOOD (  12.40  )
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

The aspeed_pcie_probe() function calls aspeed_pcie_init_irq_domain()
which allocates pcie->intx_domain and initializes MSI. However, if
platform_get_irq() fails afterwards, the cleanup action was not yet
registered via devm_add_action_or_reset(), causing the IRQ domain
resources to leak.

Fix this by registering the devm cleanup action immediately after
aspeed_pcie_init_irq_domain() succeeds, before calling
platform_get_irq(). This ensures proper cleanup on any subsequent
failure.

Fixes: 9aa0cb68fcc1 ("PCI: aspeed: Add ASPEED PCIe RC driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/pcie-aspeed.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
index 3e1a39d1e648..6acfae7d026e 100644
--- a/drivers/pci/controller/pcie-aspeed.c
+++ b/drivers/pci/controller/pcie-aspeed.c
@@ -1052,14 +1052,14 @@ static int aspeed_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
 	ret = devm_add_action_or_reset(dev, aspeed_pcie_irq_domain_free, pcie);
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	ret = devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHARED,
 			       dev_name(dev), pcie);
 	if (ret)

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260324-aspeed-b05454961d75

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


