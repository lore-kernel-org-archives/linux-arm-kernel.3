Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC85ACCD186
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 01:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp5KjYsVOUh23OaImHUWhpl9YGiPDIKLH5wGc2MnqkQ=; b=WdMpmAf1AAhCeLWokuOT3E2vUK
	bdUIU8rXcj/5CTkBX4V249wqPmbNX+yEzKHwVbXEUK6bNaFeE60tpYyNCkEkMzEIFZBFTae+xLmmS
	yZcpAqugu7oeFAMWWqmngm0hB1eEkhRTh7niOkvpD2Xn1pWtc3HOdim3tI3qDcmBn6sBlOhbRkF+W
	/cSzzqNPlbhjeYfsxFNvRoqddF6B/M5PFSbDMYJPf4jN2kKzixoVxSO7mt4EoF9JUFBnlpEV8lcAs
	3jNxRDoP2YtM3nv7+3IpEv+RN7hfcB2/4oZ9AstJEFClSEksRk9cKlOuQ4pwgSOCJ5YJJaip0hY3h
	HmvPBQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4V4S-0000000BX2A-2UA3;
	Fri, 03 Oct 2025 01:58:56 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4V4Q-0000000BWzv-0Rqo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 01:58:55 +0000
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
Subject: [PATCH v2 2/2] clk: aspeed: Add reset for HACE/VIDEO
Date: Fri, 3 Oct 2025 09:58:45 +0800
Message-ID: <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_185854_142359_19A36C2E 
X-CRM114-Status: UNSURE (   9.22  )
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

Add mappings of reset per hw's definition.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/clk/clk-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index ff84191d0fe8..74c8c1377b70 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -278,6 +278,8 @@ static const u8 aspeed_resets[] = {
 	[ASPEED_RESET_PECI]	= 10,
 	[ASPEED_RESET_I2C]	=  2,
 	[ASPEED_RESET_AHB]	=  1,
+	[ASPEED_RESET_HACE]	=  4,
+	[ASPEED_RESET_VIDEO]	=  6,
 
 	/*
 	 * SCUD4 resets start at an offset to separate them from
-- 
2.25.1


