Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IEf+jQLl;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=X3iXyfEi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=82gVcSSXM3hsqhEYpcnfhId+zvDl8pHYrLa0s7kwebQ=; b=IEf+jQLlFQy8ev
	ohIAN2wKeG1DkIwYKAgXGFMToRE23cNerrMCdW4C3+XOrhXao7fAL+oISESYwB7HyWtpHxu1UoXYA
	RskHpMQ9b+NwDp7xV8FwnsGkrKkTTbIzKor2woSzX3uqkWJQoUEORiqhoMXqRjKB1sBsHBua1soRm
	VjAxGSNT23yFQ+vOni1b4t0ZrpiQkr65B61eMfhWPr6535v9XFvwEKgxm1qy+PTASnWnVU4E9IpVQ
	UDItOZqwarOO1ZqYAFdwktpS+ojKRThKIhik4bZ7GaMQojK/E22fY61Fm28E1/zJNP2Y33ou+0FSk
	sZbNl7+0yWpRcgqSFpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvme-00000006JFx-0vvV;
	Wed, 28 Oct 2026 05:01:08 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmZ-00000006JDN-0XFv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=82
	gVcSSXM3hsqhEYpcnfhId+zvDl8pHYrLa0s7kwebQ=; b=X3iXyfEiZQpyYhsbCg
	gSWkbgbV1f5mV5D0DwCDiBV21g+t/kcm/w0Byj0pwPQo6PqU039gQ/7HSCqCxEeW
	cgSAJOQBX5UB6xrnKPLy2s1aHOZ9di5C7dgXnBxFfSWkm5r8Uye6UrsPakDyTb0e
	D2kuaRuA2mtDAl5lN97EaYnwk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S5;
	Wed, 28 Oct 2026 13:00:45 +0800 (CST)
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
Subject: [PATCH 03/12] irqchip/gic-v5-irs: validate MADT IRS entries
Date: Wed, 28 Oct 2026 13:00:30 +0800
Message-Id: <20261028050039.121080-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050039.121080-1-yaojiale02@163.com>
References: <20261028050039.121080-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31_V5geFquXTKDA--.16748S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr45CrWUKr4UXrWrAFy3twb_yoWfCrg_ur
	W0vFs7JFW0kr1rKw4xtw13ZrWjq3ykWFn5ur4UtFn3JrWIvwsxAF1avrWfAa1kAFs2yan3
	GrZ8Ar4Sqr12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8MrW7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh6SzGrhgX7RmAAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220104_009152_6536F3BC 
X-CRM114-Status: UNSURE (   9.30  )
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

The IRS parser uses configuration addresses and flags from a typed MADT
record without checking its size. Reject incomplete IRS records before
accessing those fields.

Fixes: 35866efa52fe ("irqchip/gic-v5: Add ACPI IRS probing")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v5-irs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 4e60a1caaba5..0139f80934d7 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -955,6 +955,9 @@ static int __init gic_acpi_parse_madt_irs(union acpi_subtable_headers *header,
 	struct resource *r;
 	int ret;
 
+	if (BAD_MADT_ENTRY(irs, end))
+		return -EINVAL;
+
 	/* Per-IRS data structure */
 	irs_data = kzalloc_obj(*irs_data);
 	if (!irs_data)
-- 
2.34.1


