Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7171606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BwLgGrc2;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z4E54OUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WtpjjH3vtE/54r/970fSiN4Comd2TOvSsRScFTJeCcM=; b=BwLgGrc2fKMDRj
	LOJb8dv2bGzPorYx9+Pug9zFBmO+3p8ze6jhhCpcy08tIQl4tZrYaloo8vz84fT5phCUN6WNowi2w
	qYDDJ9ku8OC5dw/xn7HZXzT0RbXKNjLf+jYRJjCp3/uFIFdVrvnNuvhI3+qpMge6/Bxo8zkmK2smh
	+vZ3WcTuH7prg6fAcXS3/C1Al7pbkgML7Yc37w1fXYp9O0XbOQh/i4SO8VXn4kIszQ5+PlYIIrQVY
	5jStJFlMP2HbAqEheGFiyz0I53aHhPamOf/gKH6OHvaOXHu3fzs7qf1OrpvADcLlIGU1eHjE6zCLZ
	diz5AYhUn6FUEArGIjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCl-00000008H9I-1ywN;
	Thu, 29 Oct 2026 03:53:31 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCd-00000008H5H-437P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Wt
	pjjH3vtE/54r/970fSiN4Comd2TOvSsRScFTJeCcM=; b=Z4E54OUs9YrrYCP/L4
	dO3qGwmLGFBt2CHcZPQ7VNPBYOID/2/M07BE1PiZHPCEzpYJMI4fRv8ryTbRsITF
	3OsXfBFPEuG0PGBAgP1PO/13mc0psy/QQ346WCZNOOSz1eREn8MSVzVLiT1QcWHe
	UjAJD34aluVWqpaNFqko+qw84=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S12;
	Thu, 29 Oct 2026 11:53:07 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 10/20] irqchip/gic-v5-irs: validate MADT GICC entries
Date: Thu, 29 Oct 2026 11:52:41 +0800
Message-Id: <20261029035253.2333852-11-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S12
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF17Gr13CrWrZrW8Ary3CFg_yoWDWrc_Cr
	yvvanrJFy8uF48Kr1xKr15ZrWUtFWkurn5uF4IqFn5GrW8Zw4fZFsxZFZ3Aa18GF4SvFn3
	AFZ0vrsa9r1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbyEEUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQNMhmriwyPkGQAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205324_416656_21E86666 
X-CRM114-Status: UNSURE (   9.75  )
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


