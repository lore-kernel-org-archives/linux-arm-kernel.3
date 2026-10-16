Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958DACCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fZThZnYNPE85kHBIb7C/IQ+qE8b8A0zCuSfmGZOXM0=; b=UUSHeO7eyw8exMCtTI3H54M30L
	UO5+2IRsQns+0wmCKo0svqnH9Fxju9cykhplXJxdu8KmXgl7I9VAXJOoMIzNsVaZFM0i0csbunK1m
	U3nhOfF3XOMXYN371pGM7VccSe/EwK846mzTWvTGDBrhq2osd/X2De7bOMaJ3lMfLZ+9y1uBCuUJD
	F5fKx0mp0hjLSZiERwE/zOXSS5mqZ8Zl+DXCL7PbRkDXG5/SXAS/CYHxMft92rruc9AsS2314njMy
	iVrWMq7lB7bz3nIWIM/ST/21TiCwgjUIaZYpBpsdeilEhf8oLQngAYUQEDHNrR6Ok/XZdLchPcD+q
	Xq3GdOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihI-000000036zM-485a;
	Fri, 16 Oct 2026 14:14:12 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihG-000000036y7-3Gvs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=6f
	ZThZnYNPE85kHBIb7C/IQ+qE8b8A0zCuSfmGZOXM0=; b=mu2SVuG1dYVUlk6DkR
	DhNVcJEv9G1funlMNw/+deAFEClR/CWC8s+tJHZ6GXP8iJ8hn2D5255YwhdLTFyG
	vWreuAjlwP8eEgJ5F5n8v37ySRm48S/QSIDhs7XAby+xqYt4WZaB8xf75SQw8Ywv
	3E7z1wUdKOYhXA6vDqwNPta3U=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S4;
	Fri, 16 Oct 2026 22:14:02 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/6] irqchip/gic-v3-its: validate MADT ITS entries
Date: Fri, 16 Oct 2026 22:13:53 +0800
Message-Id: <20261016141357.2793046-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3NysnMdJq1dUUAg--.27711S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWDGw15Jw45Gr4UGF17Jrb_yoWDCFc_ur
	yjgFn7JF4qgF4UKr1xtr1UZryY9a109w1kurZ2va95GrWkZ3W3urZrZ3s8ZrsrGFsFvF1f
	GrZ0kr1S9r13tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMrWrtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Aql32rSMSqrSgAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071411_133908_83FC4010 
X-CRM114-Status: UNSURE (   8.73  )
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

The MADT ITS callback reads the translator base address and ID without
checking that firmware supplied a complete generic translator record. A
truncated entry can therefore cause out-of-bounds reads.

Reject incomplete ITS entries before accessing their typed fields.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..485a790e4856 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5725,6 +5725,9 @@ static int __init gic_acpi_parse_madt_its(union acpi_subtable_headers *header,
 	int err;
 
 	its_entry = (struct acpi_madt_generic_translator *)header;
+	if (BAD_MADT_ENTRY(its_entry, end))
+		return -EINVAL;
+
 	memset(&res, 0, sizeof(res));
 	res.start = its_entry->base_address;
 	res.end = its_entry->base_address + ACPI_GICV3_ITS_MEM_SIZE - 1;
-- 
2.34.1


