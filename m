Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50109C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4XQMf7fL8GqZ+hyH3y/jkvSb5OnhiiRm88OJeVNfblo=; b=tPJSuPNoADuzFnNBO8fn2Z3QJU
	UxoPBCcGh7MiPPzXkEl1sykF9EdzxkfDras0/pOEZT+a/QovLhXHU83JGlE9JBpDNvbtR+//4IycG
	0bnDbTO48qkPjjfJNS0DdTBqq4OOQ6fm/H1lVl68b2gbGYi2DcDukOzGjiqqmhfMQRXrO8N3OuLyo
	DR+x36sUEXFOOx/Yi1rZBrpNUgDB0qeuNBMhLFYtpksoq7z3oT44mU60+bGV6m6vYVNhUsr/otFBW
	r7+LwvsHECH5X5kT/8CfWJDoenlQm5L8sFH/XHOTb5SfssnR5aDl1ko6Yx03QyRfLI5V3Y+5vr+K1
	gB/mWH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITf-00000007YFs-1Lmz;
	Wed, 23 Sep 2026 08:37:19 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITd-00000007YEs-0gA7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152637; x=1821688637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4XQMf7fL8GqZ+hyH3y/jkvSb5OnhiiRm88OJeVNfblo=;
  b=hk+aINoGFHLIIi5NjL/i1V4B+OfV1jde9ShEw7PuThZw8D/MSkVOlt9n
   hQZJapjTa8LkxbmmCiIX+sihjNgylplA1Ly3cYzRKapcwL2GkzuB9MVW1
   piHp/EBkTunpOCfYNgRy9LqRG8nGSRjENjcymS6pZujCtI3I9919Kp1Q4
   ekr6AnXqrdSNCo0HCbrXNE5oATJrwfd8uJQk9ShZDGdV1XRhZcgHFFaji
   s5urPv0tmZmp/8TIA6qVzCnhiVXBbat6pSWtClFi2eQu5zQ7qvCBOHToV
   4aFwGAxtHiQcN/pN6D5SGNHt4ysuFRxD6rxmtZaGQym5am/wgPxe+SBS3
   w==;
X-CSE-ConnectionGUID: YAz1xdkPSGK+mW0YPGAcGg==
X-CSE-MsgGUID: TbPHEv0RQXiMJQEwCYt4ZA==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29200393"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:11 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:32074]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id 995c8aff-5054-40eb-a43b-590ecd4d2368; Wed, 23 Sep 2026 08:37:10 +0000 (UTC)
X-Farcaster-Flow-ID: 995c8aff-5054-40eb-a43b-590ecd4d2368
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:10 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:09 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 0/4] irqchip/alpine-msi: Cleanups and debug logging
Date: Wed, 23 Sep 2026 08:36:59 +0000
Message-ID: <20260923083703.38974-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013717_279591_6922778F 
X-CRM114-Status: GOOD (  10.14  )
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

This series contains a few small cleanups for the Alpine MSIX irqchip
driver, followed by the addition of some optional debug logging.

Patches 1-3 are trivial, no-functional-change cleanups that address
the coding-style issues checkpatch reports for the file: convert the
license boilerplate to an SPDX identifier, drop the redundant
<asm/msi.h> include (already pulled in via <linux/msi.h>), and fix the
missing space after a comma in a GENMASK_ULL() invocation.

Patch 4 adds an info message on successful initialisation and debug
messages on the MSI interrupt allocation and free paths, to make it
easier to follow the driver flow when debugging.

Build-tested for arm64 with the aarch64 toolchain and KCFLAGS=-Werror.
The driver is used by the Alpine V2, Alpine V3 and AL8 SoCs.

Eliav Farber (4):
  irqchip/alpine-msi: Use SPDX-License-Identifier
  irqchip/alpine-msi: Drop redundant asm/msi.h include
  irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
  irqchip/alpine-msi: Add debug logging for MSI allocation

 drivers/irqchip/irq-alpine-msi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.47.3


