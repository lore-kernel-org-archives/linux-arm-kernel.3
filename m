Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7B1C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=as3AHYumjdpXAzLD/8VQPJMVcsC9J6QPQC7XdOZFjKc=; b=LU3Nswz9xrcVZNJBF8ttgBTfGn
	zMA8QzX9orGcAPRspwVXny12MIaT/BXbj/ZGl6K1atfHqdGE9sAQ7uzLzjM1Xu9ZoY9a9ngWB2ET3
	clvqSan+3WNZXpH1poosugLJ4Ne1DPmIArboTOG7bP0fqre942IG5IwfxKPoYugeBY6i12Uo1Dhcu
	IaiDY1f1Nru80eoPi2Qs9WYiicYPj98GBcIQPkdk9Nm42wFuDMaBT5aDQiM6yn653Noz/HoPIS/lP
	j5VYlUaWZmyf0jMTQYHX57DfdVgShPEAOLvfipKhtWtWtjuef/ZprcLg53VN+kMcXyHqkigmf50oQ
	9fyFnkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqYQ-00000006hLS-30Oj;
	Thu, 22 Jan 2026 09:00:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqYO-00000006hKg-31hM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFD0540B09;
	Thu, 22 Jan 2026 09:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97E35C19423;
	Thu, 22 Jan 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769072434;
	bh=5hQaXHrU+ulEMhFvULmKUP25j1Dj68/YkS34BUUdKfE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VfWnGSG4qBJxKcm5ereT3hRBW4CCD3SftXVPVejBdNKLWkv5tkYO21pJvLNboNmKv
	 6u3odb5YV6gn57HKJDNQ7g1Ku0BvnRfWMEbnsWOlqyei23FMavAhXepr+D1hCOiz/Q
	 s6rfYK76uPJMJZUcQnjKIevJk1rNPibqeew5y4PMOxeNYpDheC8rgIe7u9ZxVn0ytT
	 BYHjD6zNsTXRJ4lhslL11GrsbAwy95MgCM2EwH6aoDWQHYC+DtUIFiyVIxM3s67rw8
	 FJUUDa+gPaN33do44xIK/EwUl1VvVrmK6bXxpeQBNDhnewJx6cNGh1fV14jz2N+n4V
	 tn/sJoiaStgxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE6BC44500;
	Thu, 22 Jan 2026 09:00:34 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 22 Jan 2026 09:00:29 +0000
Subject: [PATCH v3] spi: xilinx: use device property accessors.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIACzncWkC/03MQQ6CMBBA0auQWTukU6SiK+9hXBQZ7CRSyBRNE
 8LdbVy5fIv/N0iswgku1QbKH0kyx4LmUMEj+PhklKEYrLHOEHWYFsEsL4kZqe+649D2rqUzlGB
 RHiX/Zrd78ajzhGtQ9v+LkyFLjauta601SOj74a3qw+TjNXJew7zUXmDfv27egTSdAAAA
X-Change-ID: 20260118-spi-xilinx-1b884d5b6519
To: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769072434; l=1349;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=viHwx+jv2rWkq2BAgRQtX9ZKmm78TjPHuLyAvr0R44g=;
 b=MHAPlWH5Jbo0z7ZJ5RovdK2iNh+yldLOZ1VZvSlym04m9sAfV19Jv40biP9TcdKUKZEdGGZKW
 9ov8hyBh5KXCuoQ2jOiH2lz8DvLRM1hHIi+YBfDnE+J1WnZX8GYDOj9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_010036_786707_C786F2C1 
X-CRM114-Status: GOOD (  11.27  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Switch to device property accessors.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Switch to generic device property accessors.

Changed from v3:

Removed the patches to make irq optional from the series

2.52.0

base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
---
 drivers/spi/spi-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c86dc56f38b4..c4b70e95b695 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 		bits_per_word = pdata->bits_per_word;
 		force_irq = pdata->force_irq;
 	} else {
-		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
-					  &num_cs);
-		ret = of_property_read_u32(pdev->dev.of_node,
-					   "xlnx,num-transfer-bits",
-					   &bits_per_word);
+		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
+					 &num_cs);
+		ret = device_property_read_u32(&pdev->dev,
+					       "xlnx,num-transfer-bits",
+					       &bits_per_word);
 		if (ret)
 			bits_per_word = 8;
 	}

---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260118-spi-xilinx-1b884d5b6519

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



