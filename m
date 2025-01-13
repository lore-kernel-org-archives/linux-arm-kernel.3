Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D45E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xe5wMoct/kmwDf2zKa7aZzdKTC4p94nSDuPr1vWOIWg=; b=dAb5zdyL8xQ4Q/RSAy1iiY5cOM
	qNC15eaBPaaj69ZgjH2BbJu2iHTc7ZBj8nOomBSUJ+qNjxRKGxLWnoaM6oI/B9v1TNeOyT6+IJmI9
	4RJy6tJIpPSYaTr/Mk5o30q0B76Y/hTnOVJXT/Xe2v6z2NGJEJvDdosLChQDxSzQJbSxshUGAebqn
	tRpzr7y9AkFmryPGweZQS5CX6N5uP1fPrXFaJu+V2NYtnlJ20i6Aj0Fa4rr13TKMgMTbs5MVXU/IG
	34fhOyAOJehlkelNpcgF6z9dDqzEppExsBHY3+GSscfNxjV20kkAcStf8gfu0jwAWbYkMPhz2FuM8
	o0S17NvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGwx-00000004fJr-0Yv3;
	Mon, 13 Jan 2025 09:41:35 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGtG-00000004eKG-3VCy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:37:49 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 13 Jan
 2025 17:37:37 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 13 Jan 2025 17:37:37 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <andrew@codeconstruct.com.au>, <linux@roeck-us.net>,
	<wim@linux-watchdog.org>, <joel@jms.id.au>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<BMC-SW@aspeedtech.com>, <chnguyen@amperecomputing.com>,
	<aaron_lee@aspeedtech.com>
Subject: [PATCH v7 0/1] Update ASPEED WDT bootstatus
Date: Mon, 13 Jan 2025 17:37:36 +0800
Message-ID: <20250113093737.845097-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_013746_872559_CD78CD2D 
X-CRM114-Status: UNSURE (   8.69  )
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

This patch series inherits the patch submitted by Peter.
https://patchwork.kernel.org/project/linux-watchdog/patch/20240430143114.1323686-2-peteryin.openbmc@gmail.com/
Bootstatus mechanism is reconstructed to the latest
architecture and for all existing ASPEED BMC platforms.

Changes in v2:
  - Support SW restart on AST2600 by default without
    adding any dts property.

Changes in v3:
  - Get watchdog controller index by dividing register
    base offset by register size.

Changes in v4:
  - Update the commit message for updating bootstatus
    handling patch.
  - Rename aspeed_wdt_config struct to aspeed_wdt_data.
  - Create restart callback function.

Changes in v5:
  - Remove SW reset mechanism since there is no consensus
    about bootstatus for SW reset currently.
  - Correct the method for clearing reset event flag on
    AST2400 and AST2500 legacy platforms.

Changes in v6:
  - Use resource_size() function to get WDT controller
    registers size.

Changes in v7:
  - Update commit message. WDIOF_CARDRESET flag is
    used to represent all WDT reset events.

Chin-Ting Kuo (1):
  watchdog: aspeed: Update bootstatus handling

 drivers/watchdog/aspeed_wdt.c | 81 ++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)

-- 
2.34.1


