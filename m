Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E5FD4920A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfxgJwmyffLVm02qH+A40ClNyYgUroB1TqcG3Gtin/k=; b=UGY1WEYSIohYuyQohxLbeE9Xzv
	PaGJZnBNL+8Xub/DJfRftP1xdObeZnZ9CO1sqPlIiVLpvrxXLEgHWHwys3DR4tVkNt8HKW5q/vU2u
	0RFw+5CN4HgWI3v2RJ4w2W56A6Rx4r9LxVPoSLb3vvOBnaW9DlsgJERf9fZ4xGLsuje9wZ8RD/Chg
	2jHu01D8QJhKoLvPOA8iYaVbgjxzqpoy3IYjQrHSLk4icVi2inbsTp0v+1sjfKFt2VvOZOEoH4pqo
	AucsEh87ZIwh+YiX1aaZPdaSq03ZwEC1iCFr6rLuvU5Eh/UV7xS39/DpoqIrnOBOovZo9TwW7zruX
	Gt6t/0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzJV-000000098e2-1BFl;
	Mon, 18 Nov 2024 10:49:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzIV-000000098Sb-0vmH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:48:03 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 18 Nov
 2024 18:47:35 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 18 Nov 2024 18:47:35 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [net-next 0/3] Add Aspeed G7 MDIO support
Date: Mon, 18 Nov 2024 18:47:32 +0800
Message-ID: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_024759_254703_2A45EE6C 
X-CRM114-Status: UNSURE (   6.03  )
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

The Aspeed 7th generation SoC features three MDIO controllers.
The design of AST2700 MDIO controller is the same as AST2600.

Jacky Chou (3):
  dt-bindings: net: add support for AST2700
  net: mdio: aspeed: Add support for AST2700
  net: mdio: aspeed: Add dummy read for fire control

 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml      | 4 +++-
 drivers/net/mdio/mdio-aspeed.c                            | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.25.1


