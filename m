Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B6560A3827
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kMAQP8Ml;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ukHbPpMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZMmEwIPZ2s+Faw1bSTkAT60fP83UKxdaz6POccvAnVQ=; b=kMAQP8Ml3rKNYf
	DN+U9Zu1RTC7rW/QYkJ9oTkr017UWpj2E5/sH3spV7/5+MI2dV8EjQDJw1XCF3nWdGg9mcUB7MF9w
	KRFqzB5UBsfNIDeKKKnVlkI4qwjJ9qBY+OwCKMRPvmJDJfjZGgcU7qm14SM6Jrq5dxUV5g7Vdh/Q2
	ell+U+yC9qfA8SXxGfosUeOLOPt2an6EC/RronxyCT6kcZ76LOg9J+SswwnATC3kdxvEuSEh8pyID
	6IWGjK3cR7fRZcvnXBRosHodvOBjlUXwY0Cg8MITkLbvrrD2bX8kvvrzjNwkLL8dhLM7IDKpECgMJ
	0Fvo1AUOvM6qL9pFZv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf6M-00000006Gvg-0iGo;
	Wed, 04 Nov 2026 17:48:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf6E-00000006Glx-0KUO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:48:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7386C1BB0;
	Wed,  4 Nov 2026 09:48:34 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4CF3F673;
	Wed,  4 Nov 2026 09:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814517; bh=847936L0BKkfHn86p6Ex3FvzCRa05a6B4pBN33YkgPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ukHbPpMmSS48XOoGNh4BsOsFB7TEJ89nm2VSr3f8kXm7ewhfThvxaKSUF0EbU9Mkb
	 ayO5GtbGo7oLGzaVGN4MhCJPz7ew4mZ9K78n+famQVEibKL3ABwRm8izSzZPeK1qhZ
	 qHiJ1+1QaJ0QR6RfJuywaWovjGYGZR0gxKT1jxO4=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:04 +0000
Subject: [PATCH v2 10/10] irqchip/gic-v5: Release ITS MMIO region on DT
 probe failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-host_gicv5_fixes-v2-10-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_094838_221228_07921444 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

of_io_request_and_map() reserves the ITS configuration frame region.
If ITS initialisation fails after mapping it, the error path only
unmaps the registers and leaves the region reserved.

Keep the resource description and release the region on that path.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index aebab9f306476..101aceec68f63 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 static int __init gicv5_its_init(struct device_node *node)
 {
 	void __iomem *its_base;
+	struct resource res;
 	int ret, idx;
 
 	idx = of_property_match_string(node, "reg-names", "ns-config");
@@ -1196,6 +1197,11 @@ static int __init gicv5_its_init(struct device_node *node)
 		return -ENODEV;
 	}
 
+	/* Save the region to release if ITS setup fails after mapping it. */
+	ret = of_address_to_resource(node, idx, &res);
+	if (ret)
+		return ret;
+
 	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
 	if (IS_ERR(its_base)) {
 		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
@@ -1212,6 +1218,7 @@ static int __init gicv5_its_init(struct device_node *node)
 
 out_unmap:
 	iounmap(its_base);
+	release_mem_region(res.start, resource_size(&res));
 	return ret;
 }
 

-- 
2.34.1


