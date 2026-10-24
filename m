Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95593606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x8P8rF64;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sUNii+M3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=59OMXqwTvXB1PPKI3PGs4yTKJRfoBlZHmNQLMZEk3JM=; b=x8P8rF64xP5ZyzqJAcaHOyjnQZ
	uemjp3MAtXnhslvyd3WsQvx37qVgKyKI50Ha7VV6fZaEJYJKqmVRfc4AbxRbcgJ0JvdpQc1YZ0rhq
	DiLCO3gTe+wibau8k+cbKq/qRSaaq/NvdTHl6kO9GDPcQSkHpoZaax+NBKlG1XC9abIQ6ajzcYkt/
	j1KOtdnVW43K8+nLAU/KKEm+iN/fU7mkC47PPSxSAkK5ZIOvkjPmFNzLcO4LvkNF/eVRo8LM4rUTS
	VtT+1Ic+45ASMSQJFcuhUF9Cy40CvvKWve22r1IIbdJUsHiNbRTP/oX7PfBFAm5uo+U/cgZ1wMFv6
	u8enU7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhXk-00000000TEJ-22Qu;
	Sat, 24 Oct 2026 19:36:40 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhXe-00000000TC8-2b6Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870594; x=1824406594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59OMXqwTvXB1PPKI3PGs4yTKJRfoBlZHmNQLMZEk3JM=;
  b=sUNii+M33J53bbTWn2cxNy5aAbg3DLzxEZQtjhbfSDHwoJ1/EQRHah1P
   6YtL9nkHqZFqzrbDvLqrnGWmbVyiMDCU2JZOp871aMNz3kseRJ8zqTJwN
   eSX8LdX4PyCp2J8wyHTgzWz0EVpR6pdCbZWZEDQAAzuXyq6ciZrrt8QIe
   vrF0tO+J43Diz651xUaO/QN7JnBdtK7BDeWybXSsYC+Qku8i48rBK1yVs
   a8RGF1BaCKEm/8PdWgFmYnfOyqNnVo9JU9394j220upLSuE+C5MmKi3Rj
   uelzR9q30gSw4Ew7zI89w43H8xuvEjkElw9XQg0d8cN5Uz+hMMPygQPMy
   Q==;
X-CSE-ConnectionGUID: 0o3G7bNzSWC4jbC+0a1p+g==
X-CSE-MsgGUID: oc1V8vgSSF6DSNm0wevnrA==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32157191"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:36:29 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:8744]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.250:2525] with esmtp (Farcaster)
 id b4fb8220-4d62-4ef8-9f16-b97a5bc326e6; Sat, 24 Oct 2026 19:36:28 +0000 (UTC)
X-Farcaster-Flow-ID: b4fb8220-4d62-4ef8-9f16-b97a5bc326e6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:36:28 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:36:27 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 2/5] irqchip/alpine-msi: Drop redundant asm/msi.h include
Date: Sat, 24 Oct 2026 19:36:17 +0000
Message-ID: <20261024193620.39999-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_123634_716889_30443B72 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

The driver already includes <linux/msi.h>, which itself pulls in
<asm/msi.h>, so the explicit arch include is redundant. Remove it;
checkpatch also flags the direct use of the asm header in favour of
the linux one. No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-alpine-msi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 0d97abb85e16..20f1f7f7612b 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 
 #include <asm/irq.h>
-#include <asm/msi.h>
 
 /* MSIX message address format: local GIC target */
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
-- 
2.47.3


