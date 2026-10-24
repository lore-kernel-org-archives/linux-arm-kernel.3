Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bM2NvUyl;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=S6cUMoKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i/eSNZ0iOeZ23He1SMGd7qc88ESlcmv15eX4fDnlw/o=; b=bM2NvUylIkvwSa31qQJe6wk9Fy
	K699F5n7DLLUYqf5loGSa3WkxH33N/QN4QD5AhgE3RgP67Q/1FzglKio1UxVUaUcyLShhpD78ki0i
	RmuUf9YhaFfXYjLdpBqi4iXzeKXX2KOfZQp+v52VBGEwLStTdtGvKxiMUSSGtfjxXVg0F3aUNBxyY
	sDhGJd26MnoBzDvGHLmQJP4OfOqXTgz1IkU3fBxnV4+w+UOPe15j4MwYgjkAOiz3bGqPuSo1S0fcy
	7vOi9f9lws/kpZYRtR8c1K7Fik7FeybUFNbT0y3RMzWP8dxE54WKEOnyoMkGwYIyWgaANDVcR4I2m
	BcSlfuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhXf-00000000TCV-0hZ9;
	Sat, 24 Oct 2026 19:36:35 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhXc-00000000TBa-2sxe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870592; x=1824406592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i/eSNZ0iOeZ23He1SMGd7qc88ESlcmv15eX4fDnlw/o=;
  b=S6cUMoKLVQzdvemGQPloDZCOQUd33sE+dIysW6IU9xdlyRL11gccWtcA
   uhNJaCbdid9V7PIq9EmrAwVGIzquW/stmKlLxHjjaL2NkJyGo/u3BaXx1
   sI07K25g+DjPfgRxtnXljpf0KIymLIIGolOWo2QSdkvNB+OOM0y9QAhPs
   7dCk+eWKm2cfAm+BZxuT4PFlHqWRUWCR4JgWOPclk+K+/1YNoqXIQGdwU
   yfxzwbyZUQ2e1uxlnwq3rxoVEYxssyr7XHqfVEAK18jDlUYjvW6NdIQw9
   hufxdfFfl68EG+FcQ8T/2pKz6YH8X1T7ozMRdxg4+sV1WO8MOlntDljsU
   Q==;
X-CSE-ConnectionGUID: p4aL8ta6TWGkTcJzkDvR3g==
X-CSE-MsgGUID: q825xlkIQpiJqtz3GJ9y+A==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32180774"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:36:26 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:8716]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.165:2525] with esmtp (Farcaster)
 id 8c2e6b8c-3405-4d6d-9fab-8f40645f2305; Sat, 24 Oct 2026 19:36:26 +0000 (UTC)
X-Farcaster-Flow-ID: 8c2e6b8c-3405-4d6d-9fab-8f40645f2305
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:36:26 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:36:24 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 0/5] irqchip/alpine-msi: Cleanups and debug logging
Date: Sat, 24 Oct 2026 19:36:15 +0000
Message-ID: <20261024193620.39999-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_123632_804172_A8BF6BE7 
X-CRM114-Status: GOOD (  10.90  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series contains a few small cleanups for the Alpine MSIX irqchip
driver, followed by the addition of some optional debug logging.

Patches 1-4 are trivial, no-functional-change cleanups: convert the
license boilerplate to an SPDX identifier, drop the redundant
<asm/msi.h> include (already pulled in via <linux/msi.h>), fix the
missing space after a comma in a GENMASK_ULL() invocation, and use %u
for the unsigned values in the existing registration debug message.

Patch 5 adds an info message on successful initialisation and debug
messages on the MSI interrupt allocation and free paths, to make it
easier to follow the driver flow when debugging.

Build-tested for arm64 with the aarch64 toolchain and KCFLAGS=-Werror.
The driver is used by the Alpine V2, Alpine V3 and AL8 SoCs.

Changes in v2:
- Collected Reviewed-by from Radu on patches 1-3.
- New patch 4: use %u for the unsigned values in the existing
  "Registering" debug message and fix its wording (Radu).
- Patch 5: use %u for the unsigned values in the new messages (Radu),
  and write MSI/SPI in upper case to match patch 4.

v1: https://lore.kernel.org/r/20260923083703.38974-1-farbere@amazon.com

Eliav Farber (5):
  irqchip/alpine-msi: Use SPDX-License-Identifier
  irqchip/alpine-msi: Drop redundant asm/msi.h include
  irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
  irqchip/alpine-msi: Fix format and wording of the registration debug
    print
  irqchip/alpine-msi: Add debug logging for MSI allocation

 drivers/irqchip/irq-alpine-msi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.47.3


