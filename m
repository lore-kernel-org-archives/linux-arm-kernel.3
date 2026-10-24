Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ASEo07fn;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=LW6FLITh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rtWqW8qLJDrn7u8Th5PwOFI+Lm3egNVam53bNpAmvnc=; b=ASEo07fnMqvX3PVInzJr1MEmSL
	6OqBMeQ2f2XKAanGp5B2povm5hRx3+qMU6PdFODpwfk15sWxH5hWxM3d5CdcRvxBls+pZDNYgMCA4
	BsodQHbxBckbah4iPOpnH7ueznv8qIsFtHifATk3wfDVYOuIwTwOxzkh3LRjFdgY9fMKoEm+7y3Qs
	VJeD1JjAnPy8V+UZ4045jpL4aPgseew6z7y0jZlu4AYiXsWQn05wnhp6zwDfl9fU9zkQoT8GgJOz1
	jzWEysJixJqGNyaWFTeSTyr0/clqC36nzvMq5bevg3bQ+Kovw05OGN+ub0i7TNmmn6cXj1zbjhhuJ
	foqWRZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhYF-00000000TPe-390s;
	Sat, 24 Oct 2026 19:37:11 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhYD-00000000TOa-1TjU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870629; x=1824406629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rtWqW8qLJDrn7u8Th5PwOFI+Lm3egNVam53bNpAmvnc=;
  b=LW6FLIThCmq+eAcXwTMHdXHnMSQXzQSr5MEVIsioOkBkTHjjtOKCAyNX
   C4V8IYbPIBRz/gkK/Hpo+H2s7Z8d25Kwrg6LDpAVhfm1iHPocIr8hWzyq
   saioLArHcBbQc9TGP/ojYaZcoFCwFoTaRfb9iakS9Kl3+nM7+C3IYVjf1
   vPXLCWFPjRK6OzHeCEp7we94V4k4vb9uq/Gs78ejS6SlhUFQLe0WIKRyG
   N6L1Ww/siQPiNcmR44g1Qtno4kBp4zNSxrkYcGy4DuHnYhMH1HBRygdRF
   XfMD1pfOQ4/1OgBvYNUgWE1wPhTDlbOU41gX0V4FTQyY6WYq74aPpsU5/
   g==;
X-CSE-ConnectionGUID: aRo9yv+cThmilqjtYus8aQ==
X-CSE-MsgGUID: 2UHqYdcDT7uaublMm8yJ2g==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32048984"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:37:04 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:28643]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.165:2525] with esmtp (Farcaster)
 id bbdd5bed-8aa9-4d5a-9945-5dc26d78c48a; Sat, 24 Oct 2026 19:37:04 +0000 (UTC)
X-Farcaster-Flow-ID: bbdd5bed-8aa9-4d5a-9945-5dc26d78c48a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:37:03 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:37:02 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 3/5] irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
Date: Sat, 24 Oct 2026 19:36:18 +0000
Message-ID: <20261024193620.39999-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_123709_443882_D2FCC532 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -11.9 (-----------)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix the coding-style issue reported by checkpatch:

  ERROR: space required after that ',' (ctx:VxV)

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 20f1f7f7612b..8155f63cfd29 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -210,7 +210,7 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	 * To select the primary GIC as the target GIC, bits [18:17] must be set
 	 * to 0x0. In this case, bit 16 (SPI_TARGET_CLUSTER0) must be set.
 	 */
-	priv->addr = res.start & GENMASK_ULL(63,20);
+	priv->addr = res.start & GENMASK_ULL(63, 20);
 	priv->addr |= ALPINE_MSIX_SPI_TARGET_CLUSTER0;
 
 	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first)) {
-- 
2.47.3


