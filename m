Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C13606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TWsw8W/v;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FC7NItCV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dmI12ASRBID7pbG7Kj3YA2ZrzgqrOIsSp9SPF5rc8VU=; b=TWsw8W/vQOBnru
	wJw7a6GMzUj5dQyF6rJ9vfUtB08Swlcu7j+n2VPdcPfgflayr8XFaNtTQpKqC1WS9qgKhV7kFcDc4
	7HL8vOa6PNxvMEj20dJxHGIXE+QEXY/MFsTv3HrDQqsHyZbDX4k44Rg3zeCviewlD8hdn0b1WTQNB
	WaOItu9dAFROe2hYm1gfLmgGXHQDCY0RvzEiADX/X0njLUSN+8B5799ygiF5RCB5QsCKMY15zzEn/
	G+/vCu2Yd5NMPzdruL9nesz+x9KUSBf4Yoa1nfcbvF3nCgH02eqOBcPVoRILPh/iTihQyZxWTgMb4
	wuJmo2geiCRsTsi20Fkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCZ-00000008H5a-3zsy;
	Thu, 29 Oct 2026 03:53:19 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCV-00000008H4V-2gKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dm
	I12ASRBID7pbG7Kj3YA2ZrzgqrOIsSp9SPF5rc8VU=; b=FC7NItCVPYVa4JEEn3
	SkUqOTg+S5B03uMq1PK0zs0q/DKL/46ot0ENT64VfAldZA+a+V0aKrSlXeR5njPh
	aVkm3gPIuA7Lsj7o7F9TnReqruT0Rh5HPHOreUt199APsgb+FT9ZBr8bGrsUehRj
	17+sJGJEtoH5qpNAgc5L70ks4=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S6;
	Thu, 29 Oct 2026 11:53:02 +0800 (CST)
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
Subject: [PATCH v2 04/20] irqchip/gic-v5-its: validate MADT translate frames
Date: Thu, 29 Oct 2026 11:52:35 +0800
Message-Id: <20261029035253.2333852-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF18Gw45AFyfCw4xKr18AFb_yoWkGFX_Cw
	1kWFn3JF4xKr47tw1xJr45ZrW2vw1v9Fn5uFZ0qa95Gr48Zw13XFnrX395XF4DGFnYyFn3
	Gws8CF1fKr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbg_-PUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7x5LhWriwx5aLAAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205316_028831_12E31541 
X-CRM114-Status: UNSURE (   9.86  )
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

The GICv5 ITS translate-frame callback accesses IDs and the base address
without checking that the MADT entry contains the complete fixed-size
record. A truncated firmware entry can therefore cause out-of-bounds
reads.

Reject incomplete translate-frame entries before using their fields.

Fixes: a97efa5ba594 ("irqchip/gic-v5: Add ACPI ITS probing")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 28e39b065de0..dad3b95ba150 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1233,6 +1233,9 @@ static int __init gic_acpi_parse_madt_its_translate(union acpi_subtable_headers
 	int err;
 
 	its_frame = (struct acpi_madt_gicv5_translate_frame *)header;
+	if (BAD_MADT_ENTRY(its_frame, end))
+		return -EINVAL;
+
 	if (its_frame->linked_translator_id != current_its_entry->translator_id)
 		return 0;
 
-- 
2.34.1


