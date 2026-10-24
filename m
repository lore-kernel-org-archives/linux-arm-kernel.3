Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cztl8YUt;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lh0vvk/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BSBsQmp5ZSIRZgSzayMlPUvaeplhZq6gDEMHtvGcZ+4=; b=cztl8YUt796Klbx8TF4UBbWY+V
	ABBs+rwTrFfeTLjAc5tPpLnETP6LBnk+/RNQcDNww6o9UN5wlh95rO3F13TxvBM16A1dVVePD9XHT
	UvDtcBUD5TeDfJjoualn3M52hS+JmLJdFlkoaupPwo2/J3ZuGGN0U7hOdTJjxEG68GU0QGU9ks+sf
	HJzF1GXjb4AjDEx2j3Q+Iu7fgbXlnlZvdLG/WHObABY6IByh27byH3TpkzXd72bM9VNG2vO9I0bwF
	zIZEO6B3VqlGtxZcmSrSr3hAzJ41Akg4TfFztx/cAoeq5jy1tLHI9JfIGStO0004l/KR3J6opzIhH
	fRrIGsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhXk-00000000TDy-1RkQ;
	Sat, 24 Oct 2026 19:36:40 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhXc-00000000TBc-46zv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870592; x=1824406592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BSBsQmp5ZSIRZgSzayMlPUvaeplhZq6gDEMHtvGcZ+4=;
  b=lh0vvk/tZ4JyXpNUtQwHjOFBndz8fkRZnuKvbNeYB1TtFSR92uu516gl
   oHaSSZRkRh37v5BKLbEuIOcZA+manMA2NyEGwuE6xMrtkPx/jvrLa61HX
   P2csDfIw5W18WuCDL22qs1J3dp7B2oKcBjrVNN6Do6eMopQePJVgE6Uhm
   +nhmfY5iS78NLu1thTAIH926nhv99sRbd6Nnw7cqjSSg3ijIzlJmrmFcj
   3t3IynMCYDss3t1DrT9UBy8dx4rmHATE/7Dudo2C6yuxcs8S4PW2P/4Ru
   N0b+WDTFEe1OsaWdiiRaWQlhzAZOu8C/MZc5OCsOyVEHf9M8d5KsNN0v/
   g==;
X-CSE-ConnectionGUID: h4f8CM/URaKOqrTQ8kHanA==
X-CSE-MsgGUID: ji8jyJ/URmWwgjRTzWUpVw==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32140324"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:36:27 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:14395]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.97:2525] with esmtp (Farcaster)
 id e9da9aa4-6b91-4698-9463-5f797bff959d; Sat, 24 Oct 2026 19:36:27 +0000 (UTC)
X-Farcaster-Flow-ID: e9da9aa4-6b91-4698-9463-5f797bff959d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:36:27 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:36:26 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 1/5] irqchip/alpine-msi: Use SPDX-License-Identifier
Date: Sat, 24 Oct 2026 19:36:16 +0000
Message-ID: <20261024193620.39999-2-farbere@amazon.com>
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
X-CRM114-CacheID: sfid-20261024_123633_066160_2CE9881C 
X-CRM114-Status: GOOD (  10.07  )
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

Replace the free-form GPL v2 license boilerplate with the equivalent
SPDX-License-Identifier tag, as preferred for new and updated files.
No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-alpine-msi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 6764d64e7950..0d97abb85e16 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Annapurna Labs MSIX support services
  *
  * Copyright (C) 2016, Amazon.com, Inc. or its affiliates. All Rights Reserved.
  *
  * Antoine Tenart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.47.3


