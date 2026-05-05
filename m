Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A4CCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sCTo8bSJmoSa+In6SVM+P+Xy6/f28UOClu9zIsQGzIg=; b=O/kLvC7hEPzFOyXHOni3n35bqb
	sjESxvFRRYDCCEU3zYiSxUPFJQYnDHkbmLar9pNRBi6tl2SXK3iZaG4oIV5sz/ZKjw6gA/ora4OlD
	WF1F5CZO8N9STuKuddHKtO8Gx0LeBYB9UL5byQOKMf1u0IrdrdNEWKhRt7Q21LqW+nbXYi+X+M7+I
	/AUVlFBk/TQv5wvcDhydnqsC4dzs3WyzCelWGRRq1rUjjtmpIrOD5RZrlA6B38Pbb952PhNW9c64D
	FeW62hj8D0wCf/8l/0Cq/8grEzc4ZOuNMT4fghG6EjbkUfPsll0ZwEgQ2iNWjNyckEo6ya84fEtwq
	tQGyhMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDZh-0000000FzBz-3VDB;
	Tue, 05 May 2026 11:04:25 +0000
Received: from mail-westus3azon11012067.outbound.protection.outlook.com ([40.107.209.67] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDZf-0000000FzB5-2lZ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkKAdy/syeA9aJTWDIsoaoyw7KW+ZlALEVmNMEh1U+RoPIZAIsxIuPsSBz7GoTdqTc5k7v5qH2IvmC7TDSBNYShhGUezttJ5w81VDPyWeK7IuyFl1dMgTo86yFq4vnkWwYp8v1/FueNkLIZXmT10s4Z8q4/DfXkJNBnGUuJpojYmORIFcjXeEtO4QvTXbgbAGM5naYBCXCrudt1hz01Am/p5eGyUCi2KwPIOc3uHw3OC2EqBCfAx63xYSz7UXRI3r/+wb9rnj/g7vB+3dwNI07qJpeyw4KQ+szN+i6Eytcy7s75FH6glwSBTNqCRcNT5/tfm9NRhP400cUP+yj0SDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCTo8bSJmoSa+In6SVM+P+Xy6/f28UOClu9zIsQGzIg=;
 b=aNP32itoYQ3MlcOFuRCbyi1Q5AA9MHmwNutABa2rWwCobWgn84JEnBaISkEjZO73A4AA4IWjcnHPA7d+dYbdMI13ZqQX5rs5wPT8aUyyT0WA2M/9MW9Dg9ZndRD9QIcMBAtVfEkQBgOCto7zRrXoyieOmoiKmAz9A8dX2lbnyqYEs1PRh/P5JB/ik8HfjL+qZ5mXQ62g4TEuKVN8xSAwNdrt+G5xkLcLBFECMrdH0wlAcFhn7FphP/kfFzbKDfuGkqR+XjUsbeLbZ5Xwb0XMatODMUw1Pk5qrpRdTlfexRIx7YW8TdvBLR6Gn2LSg63Ybz6mtd1QOD2B+GA68ezneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCTo8bSJmoSa+In6SVM+P+Xy6/f28UOClu9zIsQGzIg=;
 b=gq1XMETal1cEFrWwv9U2JoFq/POL55jeIeMB4c5YpVxd4rmRy/MiJwpgHTzq0ki1rXH+ZjxinHWFv7/nX1cLl6zD7lQZ2OTi2vi/2zzIMTBJjNVaLJdhy8PCkOIw6CP3XTUt35tTlxtHP5doDbZamo6xJblkhg5yvKdVZYAEwdM=
Received: from CH2PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:59::27)
 by CY8PR10MB6659.namprd10.prod.outlook.com (2603:10b6:930:53::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:04:18 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::13) by CH2PR03CA0017.outlook.office365.com
 (2603:10b6:610:59::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:04:17 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:16 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:04:16 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49gx2831834;
	Tue, 5 May 2026 06:04:10 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 00/13] TI: K3 DTS: fix USB Clocking for Compliance
Date: Tue, 5 May 2026 16:36:01 +0530
Message-ID: <20260505110631.1144200-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CY8PR10MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 5646be91-844b-4a1b-e9bd-08deaa960cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: TXOKoaA4Un2fsrefjfDzVvcWw1qD5HrEkWkR+XjIbzwwZ1lbEY4ZFWr6ZHqPgB5mZ5y+K2A/9J4eHaPJAiPfHM4cC02vXKXvRqfCaHDQP3dyxM1bi3x+Rj+qh5Mk5hF8J5XJxlpFVtdKV4mrW7N4XgTCH85EDFINvBSQpBxipkHqD/qnDkqNi0Bh5tL2DG3YPkzA/cn1yEaiRv9M09rXQqk1icv1QKMifZSR4vYhoF5qoBUFI1md0pe+IQawnH7MI6uI1GpCZJeTSWXNjlNncsVtTEAmA8K2jY0dhztmLxkTnbkKMP8QTqMmp88HRdIwCCRJqraFRnP3OupEx5GQ+0CjoB3FrAThX9/VNSuWzq070Fr0PPWPiD01eQWr8RLtYypeOi0aNsm1ieKuNNGecJsr99iRtlS23UfF2CXKCk0u09oX0papD5ZslEfUQBTzYipTFaNQjvRt5BOWoSFVxaTx0BgRJcCDRLpcxDzVOYt1ZFxO5+1raAUAYD82TTnpkYfa4P0EicJ+zmJMpaOZi67IFLmOndUkFx0wjogpTlKoH4kgS9VsUBwGz5Ptz+ZgDeFgyX/4owQX21DGuO7ZWfd+WgzOFvW5sDfeBdiNjWDTvjh1zS0qF4nMaO61dWdAC4rf128U+a+9yf9PHqJx+AumWubb+P82RWl5p0q+j90Q+CDEgHu15hVoiQo2fjRqQGHWl5yGXUG8nQsxOruh4qB8qLiPQd40N+27Qjwvp8Nve6Emj/gO0U5gWHQ5mVApdrpTmiyp9+28AU521pROdbeo+aHfAy9U5rIIeBQvNTA=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5ERdAM86cmGMPc+k+oFoQv2Ci40RU42sDyBdDqvj8jNfyUiNmHno6KxJ1jSKfbblfSNFgx9xnHAobS1SgWyUKdcW49Mj0od+oXmZRKCLrNM0Xu5dWmawgx3hy0XgwcvjnpqU0uZEthYu8h8Ft9HJgcbWvqdzFgKxjLV+dF0fbiGXk4qEkXqTlqtYZazmDQKlQX0mwC+G9bWw9oT3PRNF1ppfiGeSO3u1pe8RsO4NNg0oD7c2REhaRoJ5PgjJ5mZHTtLWvZhQ4xC6JSVZgdMNvi/6yhdTvhHE2fQo+BH+qF02cEJbY1s2UNmWQrj5KYG0NJByNCy+srW3XjOMTR9JnTD9IEN/O6zXFBv749XR76sKLyjOA19QHkYNQlULNeYt6cNZgq4OBoNM5ICOzt9W/t6KgL5oxtgI3/IuTtPymDLFy6q87fSwRDhro07nC+xD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:04:17.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5646be91-844b-4a1b-e9bd-08deaa960cf3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040423_698962_AF21A21A 
X-CRM114-Status: UNSURE (   6.40  )
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

Hello,

This series enables Internal Spread Spectrum Clocking (SSC) for USB
SuperSpeed configuration. This is mandated by the USB Specification
section 6.5.3 Normative Spread Spectrum Clocking (SSC).

Series has been posted as individual patches for respective boards since
the Fixes tag is different for each board and needs to be backported via
stable.

Series is based on commit
a293ec25d59d Merge tag 'linux_kselftest-fixes-7.1-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
of Mainline Linux.

Series has been tested on the following boards:
1. AM642-SK
https://gist.github.com/Siddharth-Vadapalli-at-TI/c9f644dda67a122d3299569b2a0214ab
2. AM68-SK-Baseboard
https://gist.github.com/Siddharth-Vadapalli-at-TI/4c0c0efb9a6fa59ef08a497acf5b2289
3. AM69-SK
https://gist.github.com/Siddharth-Vadapalli-at-TI/5b3c3ab5862e470de8ec74a49c442f3f
4. J721E-Common-Processor-Board
https://gist.github.com/Siddharth-Vadapalli-at-TI/c0abaabbf4fa4c9101d13afc7eba62c5
5. J721E-SK
https://gist.github.com/Siddharth-Vadapalli-at-TI/c57abc3305362b48e92b769c3e5ed8c8
6. J722S-EVM
https://gist.github.com/Siddharth-Vadapalli-at-TI/1f6557357214438767846e8b39b84ea7
7. J742S2-EVM
https://gist.github.com/Siddharth-Vadapalli-at-TI/efd1978d27e628afcc6eaf09cd776ff5
8. J784S4-EVM
https://gist.github.com/Siddharth-Vadapalli-at-TI/38e250068504f222cc0c9cc03b21b4ad

Regards,
Siddharth.

Luis Parga (2):
  arm64: dts: ti: k3-am642-sk: fix USB clocking for compliance
  arm64: dts: ti: k3-j722s-evm: fix USB clocking for compliance

Siddharth Vadapalli (11):
  arm64: dts: ti: k3-am642-hummingboard-t: fix USB clocking for
    compliance
  arm64: dts: ti: k3-am642-phyboard-electra-rdk: fix USB clocking for
    compliance
  arm64: dts: ti: k3-am642-tqma64xxl: fix USB clocking for compliance
  arm64: dts: ti: k3-am68-phyboard-izar: fix USB clocking for compliance
  arm64: dts: ti: k3-am68-sk-baseboard: fix USB clocking for compliance
  arm64: dts: ti: k3-am69-aquila: fix USB clocking for compliance
  arm64: dts: ti: k3-am69-sk: fix USB clocking for compliance
  arm64: dts: ti: k3-j721e-beagleboneai64: fix USB clocking for
    compliance
  arm64: dts: ti: k3-j721e-common-proc-board: fix USB clocking for
    compliance
  arm64: dts: ti: k3-j721e-sk: fix USB clocking for compliance
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: fix USB clocking for
    compliance

 .../boot/dts/ti/k3-am642-hummingboard-t-usb3.dts  |  9 +++++++++
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts |  9 +++++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts            |  6 ++++++
 .../boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts   |  9 +++++++++
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts  |  9 +++++++++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts  |  9 +++++++++
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi        |  6 ++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts             |  6 ++++++
 .../arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 15 +++++++++++++++
 .../boot/dts/ti/k3-j721e-common-proc-board.dts    |  6 ++++++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts            | 15 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts           |  6 ++++++
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi  |  6 ++++++
 13 files changed, 111 insertions(+)

-- 
2.51.1


