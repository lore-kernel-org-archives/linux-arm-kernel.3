Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5C7C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 03:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JrPG3yRXJLnLTaeCCT8HAn+1KswtQvNPBpLJfHiZXPY=; b=p0kSi//7V7eVdxoxvLAUhjv9P8
	VAqQJzDEqvb/Ihkaj9WvScbrnyCV2naaUPk11pB/pHigtLoHCzQPx5kiCJs1VmXjCl43K4qW4SqSi
	wp5PGVbwu1HeF6TkSpB9ZjgNSqViV/YWorODgNQmXhJDTvbCF4Rnx/LMqJuJhoRATCUfJR+UYDIwI
	PH6MX4ubBo8I+5wpJZtfWSB79d94XLDlrgbxe5OBcVUtg7UFxKQasenmqsmSWzU0jdlMtabMyvu+d
	sOUA/zqyaUyNoqqvPeDiovT1kE2yNmb/WFe9ZCjnv0OixZTiOAorRYE1AyThkYuxB1vtl8W9nh5Lu
	RDByLf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0jD-000000010RL-1ve8;
	Mon, 17 Mar 2025 03:01:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0hW-00000000zyY-2QQ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 02:59:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Mar
 2025 10:59:22 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Mar 2025 10:59:22 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ratbert@faraday-tech.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [net-next 0/4] Add AST2600 RGMII delay into ftgmac100
Date: Mon, 17 Mar 2025 10:59:18 +0800
Message-ID: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_195938_612320_1779D054 
X-CRM114-Status: UNSURE (   8.33  )
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

In AST2600, the RGMII delay is configured in SCU.
Add the properties according ethernet-controller.yaml into AST2600 dts
and dtsi, and add these in the ftgmac100 driver and yaml to configure and
describe how to use.
Now, just support for AST2600 and the other platforms will be ignored
the RGMII delay setting according to compatible.

Jacky Chou (4):
  ARM: dts: aspeed-g6:add scu to mac for RGMII delay
  ARM: dts: ast2600-evb: add default RGMII delay
  dt-bindings: net: ftgmac100: add rgmii delay properties
  net: ftgmac100: add RGMII delay for AST2600

 .../bindings/net/faraday,ftgmac100.yaml       | 16 +++-
 .../boot/dts/aspeed/aspeed-ast2600-evb.dts    | 12 +++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 +
 drivers/net/ethernet/faraday/ftgmac100.c      | 88 +++++++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.h      | 12 +++
 5 files changed, 131 insertions(+), 1 deletion(-)

-- 
2.34.1


