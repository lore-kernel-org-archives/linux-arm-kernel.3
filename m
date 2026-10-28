Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14462606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OYr77UNo;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YLPgo9+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WtpjjH3vtE/54r/970fSiN4Comd2TOvSsRScFTJeCcM=; b=OYr77UNo4sosL5
	nK1t64C23ocZiX1INvkPKt8cniRha6a8HUIP1hnxyIkoBM1y6E9Kllk4/CHiYZFYc2kUoe6FxnU/M
	DsGxEUmaRf647BVLtRgeITAQ+JXiKXwrIBXTAKjcvvR8RD8sW746gbUtFxmPuJEdvllBYDeIM6P36
	2kE+vo5A+O3P6/xvQ0fHX6JjT2LQWOZHtcUEE80dq/LehAzfdcWD3FJlGTfHZXT4nyBgEjuP0E2tK
	MmK6n40Fp/3M0kMjVyPOwCSWBIT0z8mKQLWOGPNxuZHpig0hBj6Nqs6wN8jaRpQw7gKRIlm6ahZY/
	Rd9d/pI3K/5yeHigNctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmZ-00000006JE9-0ALO;
	Wed, 28 Oct 2026 05:01:03 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmV-00000006JD8-2p5L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Wt
	pjjH3vtE/54r/970fSiN4Comd2TOvSsRScFTJeCcM=; b=YLPgo9+oow6/BR/t4v
	iEn+v8UaieMkw4jXc11Ky+HrUtZsOzURQz/fwPeOqUsZ3k16M9g6DkK9q1J/eyDT
	1YHQL8ydSok/4yHt92ndOGIygpTMmNmQOyBqzEZ/OzN9b/qlz5/C6McP3NxiLTCo
	s3FDPu31Ocz+pkAnhQz0fMmAk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S4;
	Wed, 28 Oct 2026 13:00:45 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 02/12] irqchip/gic-v5-irs: validate MADT GICC entries
Date: Wed, 28 Oct 2026 13:00:29 +0800
Message-Id: <20261028050039.121080-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050039.121080-1-yaojiale02@163.com>
References: <20261028050039.121080-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31_V5geFquXTKDA--.16748S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF17Gr13CrWrZrW8Ary3CFg_yoWDWrc_Cr
	yvvanrJFy8uF48Kr1xKr15ZrWUtFWkurn5uF4IqFn5GrW8Zw4fZFsxZFZ3Aa18GF4SvFn3
	AFZ0vrsa9r1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1gyCtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B2SzGrhgX1V3wAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220100_146840_0627A583 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The IAFFID parser reads fields from a typed GICC record without checking
that the MADT entry contains the fields it accesses. Reject truncated
entries before reading them.

Fixes: 35866efa52fe ("irqchip/gic-v5: Add ACPI IRS probing")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v5-irs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 9d60f474aa4f..4e60a1caaba5 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -891,6 +891,9 @@ static int __init gic_acpi_parse_iaffid(union acpi_subtable_headers *header,
 	struct acpi_madt_generic_interrupt *gicc = (struct acpi_madt_generic_interrupt *)header;
 	int cpu;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	if (!(gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
 
-- 
2.34.1


