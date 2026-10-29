Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D643C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=El3P5JKM;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z3pfWb1D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LB8YpEUiZFUdxUpS3Yk2h4wJXrpFEdTYw4E3JAzYZ/A=; b=El3P5JKM81Yb3X
	dNGoJOC9Fn2L7VVLPBT93Wl6fPSJ6CMay633ftWEnUrPW6+LXPs0gQf77HJQ9Uk4ZONLuv3dfoXzd
	bUY93rtwd1rhVHysJ/Kg+z+GkOyiW750gqTRUO3QBm8pdesZbW/PXuQLpW8mwdCzmY5o3a2NHtpsu
	VIxYdkMLM99I7jt/YHJ31V33KI9ixrCzc8eJK1gHTHRNd6FYL+NK/K9r3ez8qm9kM0ulxCdp9c2ph
	9Qd/PoNlf736mA11I2gGpuwFtff7VOfdHKe/jHiwwzIftjuZdzVAAZP9PXhAiBhPlZpmDZRblHUYm
	xi9LLxWrR4rI2vL9to4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCZ-00000008H5G-3YIJ;
	Thu, 29 Oct 2026 03:53:19 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCV-00000008H4U-2o73
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LB
	8YpEUiZFUdxUpS3Yk2h4wJXrpFEdTYw4E3JAzYZ/A=; b=Z3pfWb1Dc6Qtm9LC9u
	iGe0hL57h4NuGis6KhNmHydKYwS2atUFVut3lpSai1+pj1iOf0e7tddizVrBvkQT
	qvH01dn/kYngO9Oqdp4rPBcLlaEcxVhzcVns8ctKo/d3jEGNwQvtiWgd8pEPbChS
	dJ7ywngz+xrBjEX6+fEz6Sclc=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S4;
	Thu, 29 Oct 2026 11:52:59 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tn@semihalf.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 02/20] irqchip/gic-v3-its: validate MADT ITS entries
Date: Thu, 29 Oct 2026 11:52:33 +0800
Message-Id: <20261029035253.2333852-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWDGw15Jw45Gr4UGF47XFb_yoWkArb_Cr
	98WFn7JF4qgr48Kr1xKr4UZryY93W09w1v9r4vvaykKrZ5Z3W7ZrZrZas8Zr4DGFn2yFn3
	Grs0kr1Skr1ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8FoGPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRtKhGriwxvjHAAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205316_072766_DD731302 
X-CRM114-Status: UNSURE (   9.41  )
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

The MADT ITS callback reads the translator base address and ID without
checking that firmware supplied a complete generic translator record. A
truncated entry can therefore cause out-of-bounds reads.

Reject incomplete ITS entries before accessing their typed fields.

Fixes: 3f010cf19732 ("irqchip/gicv3-its: Probe ITS in the ACPI way")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084..8af88eca14c2 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5736,6 +5736,9 @@ static int __init gic_acpi_parse_madt_its(union acpi_subtable_headers *header,
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


