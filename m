Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1764103E2F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HInTO4t1ZJ6RBrtr8PJoqMd+l+D3EyDdSPZwBSIvWSY=; b=DW00K8A16QJrFBNaj7U13jVNm4
	RQyh9sVEf1biliLyDcWrUDn1rvGyNPEXNCPvVuyWXHDTt3lJOxB56Wxkb0bixBr9y9OrRwkYexRpt
	GsyZs3EPB9KX4QurT6JkVesHZwyncEuYLTGaVH0yS9VfCtC1t6q1pqHse3TQmWE8ZE06tO0aZQlwt
	WLY1YeSRpa82h+8ALWKNNgB8wKgliJmulCSTO0wSVcZF/mkHNIq/hTxjhQ7LtdCcX7BaNWhAIk/0v
	C+cxBAJoLRLZnGsoJuNAvofnG4l1jV48M0KJE/M99KCjeEAGaEkytYcOT9uIoofeHAHvDUMMC2KWr
	qnHfx3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TIi-0000000Cris-3aUl;
	Wed, 11 Mar 2026 23:49:16 +0000
Received: from mail-northeuropeazon11020109.outbound.protection.outlook.com ([52.101.84.109] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TId-0000000CrhA-366w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1igzv0bvr1MVovDYvHlac8HHK1uctmGoR0PVsqm4L53nr2Kwsi6drEP2u0BZXgPVFbHh6bjhyC2+BKaKhJ8RaPuAJ82ZW+NCmhbobCx0fUnB6KO7SVXvcudp3PzoPvN1oQtnv6EnfKLQq0tGbb7PC8TwLppmS0BpChhr4KRfnGME7zM3a/r6E7RhPEDGUskbdsoZi1NC4kHbRn3NbjEK2CpT5Ynep2YDgPT3B1VWOfl+xljb4EtAWfLAdqUQ6ezSNaAc5opzAYFoRPWN+eJlw4N+S2hPCOujbKI2c1snqm92MPHYPqxD3apOZ5cIfwpUInHLTPof4iryTOsiI9oYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HInTO4t1ZJ6RBrtr8PJoqMd+l+D3EyDdSPZwBSIvWSY=;
 b=TdU4OBVbuH39zWjn0LHGYv8jzhW4btYF6GoDrIxndwsO/BrytU6VPGAjzKoOzwQB7+VMo4cCvfedvCQpE9IV/QcjeSl/gvYA+tu1PVVQGGsaD78g+Yfp24lI9itytgRWHSOyhXAVo08YmfTvZC8vc9PhPhRIDCfUsHBESTqVW9TIbglHssecIKkabOjXNEyBkaZKej0dwk2Hn/H/oIeKg3/9oDPtmCj0yo0DL5bhQk0RUXmFfduibAE464QZdlbTwYdRtNcnHgZxu+9QyoorRRdwk1NlLNyggvwp3QIcbSl5/+COR9kZEu9L6u3AgEOBmChbE/Ab/8g4ru+ZdA/IRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HInTO4t1ZJ6RBrtr8PJoqMd+l+D3EyDdSPZwBSIvWSY=;
 b=WcvZKKs23Mbv3yY9gaZK/ANRypIvsgxEaGw+NW4KorEtJnU1WKjoMkC2d/ssW48wPlgH75fzeqxLeqyR010a9zYG7Ejlnfjg3/63i3EeV1qAs1RzQZfOrj3DavNX38M2eBIry7ptKVmY0knY9h9PywtGd1OLTP7XBtN1iNpV56GaeBmO4CFhCWMl6U+xmX5FTw2B7/Zps+hoZP0KNmqWD/W1UH1Y9WfKIb1RJgs6z9d0CH/mQu6b/iGKkDRn/fCrl/jynFj1LFG+eggymxgVz/97GHY+fMRymUT2vjsxveBCuCA7YaOril85aGplA6Y46QhL+JXBYGoo5eu4MFsLVw==
Received: from PAZP264CA0119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::12)
 by PA1P195MB3070.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:4fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 23:49:03 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:102:1ef:cafe::16) by PAZP264CA0119.outlook.office365.com
 (2603:10a6:102:1ef::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 23:49:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 23:49:03 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 12 Mar
 2026 00:49:01 +0100
From: Dominik Haller <d.haller@phytec.de>
To: 
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v3 0/5] k3-am68-phyboard-izar dsi support
Date: Wed, 11 Mar 2026 16:48:36 -0700
Message-ID: <20260311234844.56443-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F98:EE_|PA1P195MB3070:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c1ebe6-6abc-4534-bf36-08de7fc8c658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: KlT8m29aj9AhP064hfQKnGPxXMIy54EVXRvV62ZtWITJmetu9ArT1iyU+RtTDjvDoc6HZt80/KBnz+a53h4cMM6tNTo6eN2B0jSB/Lx4c3DSNOARJYZ38DPlMnbBb8XJ3MhFujMQL4+Fg4B8XyAI+RLQBpOAyEiVlxhc/mF+PwSZikcSySddHZw1FaxnENT593N7kxkBVlHp2SHeA8TMBPgRcKBMYoU7FyilTUh/TrGrGe2UoUqBSwH/OqNWG6Cgs081k5+IXF8Jxcmu3J8BIQzDr4Zfd9HHsnOgJyRVKkVDrbtRuK3hBXzMR7eRCUmmLrVIbs5RJzQJP/z27mcr8rixkZtGc+xVxFJzLsbCeJP1fVc/VbNHyu/GqML7FgF7rPnqPnnpWwTINtJUlIp1dUf13MdnorxBwXI4/A2X9jEUJgyYRvZzs43m7FVDWMkU69zo8TdSWdvMmvMBa//MwL7lUpxeosJziz6VTGKuVtYbIsX4EOZmvRzvQ4HOunq0/+4bccmsJ3FqigCRwcVa/8Knb6Mw7AJO/5FSpBl5WijdRWP2bHdAlh/Ztx9M/Sh5MLSi7eqJ4UPO+fw3pQUA90j8bmAyENHQDuqgSRrjlZ2zWHCRInCC7BR1EdnTHaJEuVhjB5sc7ExE8PfLYg4ZyjouKLEI8HT30/XzUSImZMQmfA7zHyby4/AeMdj/8lJgVLcocc5mU8PPGx/fq/R+tPUEO4WFK6dNWujNNEhCDYs=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O7TFdhzpv9zOCFNnL2DruiJAdDHVH6sjuBOL537WbfqCfnL7ew2vO6IbOO1IgH592U5yzHu5GLUfdSK2+qKWSLCxOFdM4tZqrAY4twOvkElfqLNNbRmAK3x9F4FGskjRvFTR/pINLLYVBBehDunkLOw29jdeF+FLfgUCkslNTJq48TpqAOBJZxNWtHUdaXFe0BYskFjisJ1XwyYuRRUmP1seyGVhOivvKX3jnvAv0ytpgdxy3KZ701g1Q39l9QSArqY4MWpD5mTmtl6eyQu11BGuMm+X/0Tm1zRz2ey7S1jxsbqQIB+kQif4SGt4CYqsmhVdnB81qLyg8R4Bm5ie1ofhR7sIRickS4fFNL7mpQs+FBPzYdhbSjDmsLaA0U2CWNRwl0lsCy/pUPxmJz4/fi1Q5nEnh6IAlv5X3p2a3KSPBTyKpTsNQpmOKtWZfj50
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 23:49:03.0622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c1ebe6-6abc-4534-bf36-08de7fc8c658
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB3070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_164912_989935_2EB0E531 
X-CRM114-Status: GOOD (  11.82  )
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

This series adds support for the two dsi based display interfaces of the
phyboard-izar with the phycore-am68x/tda4x som.

dsi0 gets converted to lvds on the som using a SN65DSI83 bridge in the
default configuration. The phyboard-izar kit comes with a 10.1" lvds
display with usb touch as addon.

dsi1 is routed to the carrier board onto a connector. To use that Phytec
has developed a small extension board "PEB-AV-15" with a Lontium LT8912B
dsi->hdmi bridge.

Changes for v2:
- Drop the following patch as it got merged in the last window:
  dt-bindings: display: bridge: lt8912b: Drop reset gpio requirement

- In arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  Reduce pwm frequency to ~23kHz for the backlight. This is supported by
  the backlight and works better with most fans. Since the fan connector
  is using PWM0_A and the backlight PWM0_B they need to use the same
  frequency.

- In arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
  Fix license in boilerplate: s/GPL-2.0-or-only or MIT/GPL-2.0-only OR MIT

Link to v1:
https://lore.kernel.org/linux-devicetree/20260130205820.83189-1-d.haller@phytec.de/

Changes for v3:
- In arm64: dts: ti: k3-j721s2-main: Add DSI1
  Pick up Beleswar's Reviewed-by from v1

- In arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
  Fix the remaining style issues pointed out by Vignesh in v2

Link to v2:
https://lore.kernel.org/linux-devicetree/20260306033151.276202-1-d.haller@phytec.de/

Dominik Haller (5):
  arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
  arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
  arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  arm64: dts: ti: k3-j721s2-main: Add DSI1
  arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay

 arch/arm64/boot/dts/ti/Makefile               |   8 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 192 ++++++++++++++++++
 .../boot/dts/ti/k3-am68-phyboard-izar.dts     |  18 ++
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      |  17 ++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  39 ++++
 6 files changed, 399 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

-- 
2.43.0


