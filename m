Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60034CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 02:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6Qc+az4zBlNHfSiEiCFH3BNqC5b87qNN9H4yISVKn8=; b=SAaaF+LJG/v1wT
	lGjTei5S2qokQxOljJ0m3UIf7SWBGkRJc/R8vkOSXNX524jI1Vo/DNpkoq6iw1R/R24M5/vdORXFg
	oNNaEpfM/XclGV7fytGfF9fmyi9Fc43AtcDTXJj2Rm8wcXaCOPv8O4jXD0oKE9Hxk9iTf2I/SlSxi
	97MGkgC3Vv3XZur+gPgw0OM7PU/AJqYzkgMAbwD6geMrAWaQf/e1bfYsIkXxaX9cyswPjjKfXYWKl
	WRIH6n3sTatvog+bRTco7CnpdnH/XuyNwvEzCecCXMX6fww90zlrjz1CkDJZsDjSTksTKOj4tQrDq
	N8BLOhIKbL/F69SRU7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjPb-0000000AM27-1OOl;
	Tue, 26 Aug 2025 02:27:51 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjMx-0000000ALtj-495u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 02:25:09 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 26 Aug
 2025 10:25:02 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 26 Aug 2025 10:25:02 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v8 0/1] media: aspeed: Allow to capture from SoC display (GFX)
Date: Tue, 26 Aug 2025 10:25:00 +0800
Message-ID: <20250826022501.2354799-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_192508_036738_0E99FF9B 
X-CRM114-Status: UNSURE (   6.98  )
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

 v8 changes:
  - Add check in aspeed_video_set_input().
 v7 changes:
  - The change for Documentation is moved to a separate patch and has
    been accepted.
 v6 changes:
  - Replace aspeed-video.txt with aspeed,video-engine.yaml.
 v5 changes:
  - Remove dts.
  - Add doc, aspeed,video.yaml.
  - Simplify aspeed_regmap_lookup.
 v4 changes:
  - Use scoped/cleanup to make aspeed_regmap_lookup simpler.
  - Update dts
 v3 changes:
  - Update for enum_input.
 v2 changes:
  - Update patch subject and comments.

Jammy Huang (1):
  media: aspeed: Allow to capture from SoC display (GFX)

 drivers/media/platform/aspeed/aspeed-video.c | 195 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 2 files changed, 174 insertions(+), 28 deletions(-)


base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
-- 
2.25.1


