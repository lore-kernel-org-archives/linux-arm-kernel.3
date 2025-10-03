Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE16BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 01:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sU3bZ3yajk98uIYpkUjxdudOFWcKYv8+jxfnMTTbsKw=; b=CKVISRRH7l/dAg
	4vpCjJ1F/3o7zRkMZc4qUKr0hPo3+GCQFWvQtGSnCX8rV6ZCxd5MRPPdH3p5ksWaPTt6rdL7QZ91t
	NSW8ZunX7qw7HlN5K8oBLbcOs0b7Vj6EiA3T4sLG63xgtplohoe8G7hE5LmZm2VqabY4yhNA/l/k3
	AY2E8LTIx/V7VK685RGx/q72NcWz9Pu264YZP2RlGS0KEGqzpjsV4A6sOBlM0LTyKWi1mugXMcJdN
	Qt6gPNtTtjQCBdq/HR+mPaLF5hSCI7s6Q+gbvVzueZkbEJPdL9yVCb0ZxoOoDsE0xVzrWfAV5Oo8u
	lsIlQ8EtG01jHx6ndamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4V4P-0000000BX0U-29ue;
	Fri, 03 Oct 2025 01:58:53 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4V4M-0000000BWzv-3VIw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 01:58:52 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 3 Oct
 2025 09:58:45 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 3 Oct 2025 09:58:45 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add video reset to aspeed-clk
Date: Fri, 3 Oct 2025 09:58:43 +0800
Message-ID: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_185850_876026_12A7234D 
X-CRM114-Status: UNSURE (   6.95  )
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

Add missing video reset to aspeed clock controller drivers.

 v2 changes:
  - Add patch for drivers/clk/clk-aspeed.c
  - Update index of ASPEED_RESET_VIDEO

Jammy Huang (2):
  dt-bindings: clock: aspeed: Add VIDEO reset definition
  clk: aspeed: Add reset for HACE/VIDEO

 drivers/clk/clk-aspeed.c                 | 2 ++
 include/dt-bindings/clock/aspeed-clock.h | 1 +
 2 files changed, 3 insertions(+)


base-commit: 7f7072574127c9e971cad83a0274e86f6275c0d5
-- 
2.25.1


