Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7260A2617
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SmUjoOwu;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WFYqKf0u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AwH7ysFtsnsarThHtf7y4gBrmg4OuM1XkF+YgRBc5/c=; b=SmUjoOwu1t/4dc
	XsPwvrb0w3RXxKJ690ylkreDYWcx6rkmmtm8lFjqECMsXHDoiSXvkyKDhdcaUw7EbSfh6dwbzvhDg
	YkE4WptShp+2av6p89AKhfss8KQDT+lhv6EjFd8d8rjzPeDMPfbkDVLiGuSEV6rF5PFjbUvxhtDdM
	/odr8IQPUV6XtBNyUkh/HqTkrSUUsFWMTxMW/6JphGKsXP4raSH/rbm/VWNh3R6oOGJeNKMFItRAX
	y1pL82rlZIpECxu0ix6DDwdHf6DZIwfRI6mJWkCqj1mYT7YGwiMbOMsmYNPmmKgITrDXbg/fS5fRQ
	ww3RtCdx8aYRqbs8siNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvme-00000006JFf-0YTx;
	Wed, 28 Oct 2026 05:01:08 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmX-00000006JDO-42aB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Aw
	H7ysFtsnsarThHtf7y4gBrmg4OuM1XkF+YgRBc5/c=; b=WFYqKf0uT1ID2zTvEz
	Gu/F9rbVgskRHWiBO4o4/gV5zeFPtmJ5SyxOko8QcE570G0UvG7NqKCIr0Abp01s
	U/yETfsXZd8yPB3TFTANEYyGSWLNgLP70ZVybB+qLrA3T8NC8GWx1Ik51Wbxt2ps
	1675dILWRnCbLfg5hR5TskHeY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S6;
	Wed, 28 Oct 2026 13:00:46 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 04/12] irqchip/gic-v5: validate MADT IRS records
Date: Wed, 28 Oct 2026 13:00:31 +0800
Message-Id: <20261028050039.121080-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050039.121080-1-yaojiale02@163.com>
References: <20261028050039.121080-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31_V5geFquXTKDA--.16748S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5Wr1fJw4xtF1rWr1fCrg_yoWDtFcE9r
	yDXF97JFWrCF18tr12kr13Zry8K34DuFn5urWjqFn5Jw4kuw4fuF12qrZ5Ca1DJF4vyFn3
	GrZxur1S9r47KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbyEEUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B6SzGrhgX5V+wAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220102_386379_FB44CEF0 
X-CRM114-Status: UNSURE (   9.77  )
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

The ACPI probe validator reads the version from a typed IRS record
without first establishing its minimum size. The accepted record is
later used by the initialization callback for further typed field
accesses.

Reject incomplete IRS records in the validator before either callback
can use them.

Fixes: 35866efa52fe ("irqchip/gic-v5: Add ACPI IRS probing")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v5.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 8c0303af71e7..8451b780b0ea 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1309,6 +1309,9 @@ static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
 {
 	struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
 
+	if (BAD_MADT_ENTRY(irs, (unsigned long)header + header->length))
+		return false;
+
 	return (irs->version == ape->driver_data);
 }
 
-- 
2.34.1


