Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0F2CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NeuL4O0i8aHwG5gva8HOnGoVC/kDQhfImuOaFtAboFQ=; b=ELI3Cvr3QCc/ndp5x5wAa9Xafk
	jovU/lIXtPxnO6VeA1x5Aa6FrbrVX91EpyVp7xvibgSOTn4CQCqjqpfnGeM1Hc9Igpc0NlsBLgxNO
	BhITlaCdb+J15REAZK30ySCZ1BYmRn04ixRmPWtodUO1Id0Rk+uGn1SQX4LAAsswi8ms37xtEw9Ie
	iPxl3h0cu5HbLzPyy7VztadLdGlV2ikPzTIyaLVRibyUcEJAY0KXOBolf08vw5kaami8WfDJABLDL
	o64wpXMx51tD+nSjj5vnPIilonrqIIXC2ddDunzwuXtaHy/s3ENAa2QStAoRLkqn5iKqDIinAbUfF
	uzAVBhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFGV-0000000ATDr-2gpQ;
	Mon, 12 Oct 2026 12:36:27 +0000
Received: from mail-japanwestazon11022134.outbound.protection.outlook.com ([40.107.75.134] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFGS-0000000ATCT-25il;
	Mon, 12 Oct 2026 12:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JipQsyZcfhE9b0KpJnteBITzGjNaGQ9QhjkrmbB21HfV+Bn88MkLGK8PWdRP0aonJgmVn3EGgbqEL9OhljMri1bin2NMBgL6pdFzgOxag+31N7fSYx3S/VVDa/uK0YECOLMUHOTvzfZDd+o0Akuh8Y4bJyw85T9BjhDFu5nZz0LwvgMbdRdM+9iVeezxnA/BvDdPHIp70hyCmJqfPHOrErF16pBeOMswotOBCFIZYo2BkIJNDuHOlOrjYF643w2BAOrS3MbUcxXy7H7IrdEDupBDqaSg3ZwsudhNoloNtBZH6rjokmLT3KUuUwAYvFyxHkYYkGRi08X06xcMFJj8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeuL4O0i8aHwG5gva8HOnGoVC/kDQhfImuOaFtAboFQ=;
 b=qH8MFO7SGk824w1DiAqk9tkUl+D1f4pOnCtzyLOYNU4VrQDebZL/Q1S9nqK4sh/24+gp8a2aCzW5mXZc+kyOaC7arGGZiNSoVb1EvzD5Xh1lEqaNW2QpLj/tJqrRk7J4PuZQSGD43NUgZz8v1oHmhDuOdwgVobExPqmv2r6LafmFqgG1Efz1JDLNmWf7t6yTP3FIkYTTF8GM1aIvV1BMkTHhfFVftgdzQzsU/UGPUX3M+ZIUTv2TXo+fwg3vP9QCLtRT/M7l4Sm1wy+2pYYGs4Cu5AWUr02kG+Yqzh+TAT7tyxRwB/rf3SJh+yAifoO/ANTUqgZyeuy4z1+dWOSlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5d::12) by SEZPR06MB7057.apcprd06.prod.outlook.com
 (2603:1096:101:1f0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:36:20 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:990:5d:cafe::9c) by JH0PR01CA0054.outlook.office365.com
 (2603:1096:990:5d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 12:36:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 12:36:19 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 87348427E3AC;
	Mon, 12 Oct 2026 20:36:18 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v2 0/3] phy: cix: Add Sky1 DisplayPort PHY support
Date: Mon, 12 Oct 2026 20:36:15 +0800
Message-Id: <20261012123618.648930-1-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEZPR06MB7057:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 538def5d-e962-4588-11a9-08df285d6aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|42112799006|23010399003|921020|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: KnpHytAm1jfb/U89j+koc0L3KCxNFCI+A0cAVUrMy7WWmBKoUBwtxHSTnhAulHiPdA6xvctMjYQO4Bbokc4GF+Q5T6PfHQFiIstKpiOKmjIwZagzemkvvRwHN7+9jej5ftnQWifFOTms3zJ6cHwK23RrlGuEjow2KunIobofKqOw1WNMBkIp8uJ5Uyi5WrlSnYSdYgRSLobyDzhuEi8i+lKvkGUKVbaf+uHtwf2tO0cKAhrNQ2rUNZb5LmhDJgmEbPhahopMaHR0E5NZD34J0jIDf0rp9KQmNdC/66OjRV6Xd6k3G7Y+QvHhVwkFQ8W53TqYUnu4M2pmejBX5VkhaGvX4z4cHniy3f35UUV1ZBagPr7cdeLl7ac2oAxFEmFD1BIfR3Ugh7jiBKxpS4ng9XKjnk7TjrEbnK/ns7LcUXXqwW1fvtrtW7iCBT2vxbCyaDK/bQOQTPM7oeq+ck9BLvPt3+dB8WUdM45XkFtM7C2LdzPvpHdecXOGUEGg8jrBqoG9Rke5Xu2zvkibrWqtt5SFZJQONe9+/dSztSIoA7WaO935DrI0Vl6o9vCIjBw5cODZ7XaB+If/3Z9Ddt9PMQL2HqATUONrAljW8FvGg/QbmW9QpHKCm5txr4QUauH1LigRlljH/UBs3k+OV3hP7exhMaXj2GtqB7X+ekBUdzufVK0Lh8vOTEgavZij1Hhnh4lGMGooKVbzEjVbGFTcUSQGei9uBgFmgxPTgJ+2TBwYyJBn60Fmje33TfNy9jvY
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(42112799006)(23010399003)(921020)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9nWERsf1JanO27Bykb0OQH43k4v23pCTkhMz6nFol3bLRTSKb4YW5g8X53GPiq7gXhvhCU9JcnXNV0bNP9ZYsWrWExryMxszds+4zzMVqDWGw2hlVsQzQNkF+BGvXFIa3kB2HSYq3ufV03GE4z56pUtC0Ci17wDypTr33oVYa6yCo+7CENhezKLdWp10GE31xd4CaFzaa5APE9tmVB40cWX/ZGVv9FviUlUGbOr34VUjuIoaTzwDzBCsT7AqDF/o+uYbXvRvfS5SsIcc+Z9/SM7vz+JKXrad49kL79yfzK29JjiMEJIaOHvPTYYEuVjDY9tWRc6MUFVGl8494EzUWiOfQNQqiPhdgDVpWJpW/mJZHV8ggS09w6Fe+UpmM4ibBhK+K5wyhLSin9KSbACEqNETyxE88E9afZc1I7grz3j4so31aT56nn3TjbR2LzOt
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:36:19.4837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 538def5d-e962-4588-11a9-08df285d6aaa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_053624_551800_9249FA2D 
X-CRM114-Status: UNSURE (   8.87  )
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

Add dt-bindings, driver and DTS support for the dedicated DisplayPort
PHY on the CIX Sky1 SoC.

The PHY exposes a PMA/CDB register interface and is controlled through
the generic PHY DP configure ops (link rate, lane count, SSC and
voltage swing).

Patch 1 adds the binding and MAINTAINERS entry.
Patch 2 adds the PHY driver.
Patch 3 describes the SoC node and enables it on Radxa Orion O6.

Changes in v2:
- Move MAINTAINERS into the binding patch; keep tabs; add R: entry
- Require resets in the binding; use exclusive reset in the driver
- Include linux/property.h; document Sky1 1/2-lane physical routing
- Rename DT label to dp_phy; enable it on sky1-orion-o6
- After CDB_ENABLE, wait for busy then idle to avoid a stale READY race

Luo Liu (3):
  dt-bindings: phy: Add CIX Sky1 DP PHY
  phy: cix: Add Sky1 DP PHY driver
  arm64: dts: cix: Add Sky1 DP PHY node

 .../bindings/phy/cix,sky1-dp-phy.yaml         |  53 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   4 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  18 +
 drivers/phy/cix/Makefile                      |   2 +
 drivers/phy/cix/phy-cix-dp.c                  | 985 ++++++++++++++++++
 9 files changed, 1080 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.25.1


