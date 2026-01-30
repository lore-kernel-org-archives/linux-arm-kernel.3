Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35831E6BF37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cLXlEJC+h7rFBD3ibOdHu+KZ2buSm7zH+Rd1j7CaWJY=; b=kU8tMFnUmyMdzz9jn0lj+KYXfU
	hpK1Da0faOt8+v1ZibsElNpZsGSy4s91XCbHzW2Zoi7ajTrYs3GTno4D1/XnjNXUtd1xzT2bMZq5z
	hFLVgyQWzQStM89wX9grkl7+ryFJYYV5fg7ntQ7pjN37B8pvLo06sGu8AfH8a2bra8LoCE5yPWwsl
	KquWoVieFlAW8F0fzlAjxziu8yi/wPGauy0DpZjhsPslyVTESHsFahgZsxSpxCsihMHNtZvaaVTDF
	7Ow/Wkactuy6cbLWlzXTMoAAlDGIjmMLzzLdIp9dj1KESFHFfoYXR8VWOkTdHf16ySx7G3FFYC0GM
	7pgv0+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvaD-00000001y2q-0kqs;
	Fri, 30 Jan 2026 20:59:13 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlva9-00000001y2T-2CwV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbsbOBKWNo3EroTHIg0COnDSZhWLsWROlh9vZ7bwk8QN0TEpBw5ITh2HSfxvMFIiAyXKtxFlYYitzD88K+hVC1ruJ0/GVq7YTSSRRCJ2oVaOeuADLRbE8k/dZg6JHDTUNwoT8wLKeTrPHZn1vUs5//pGrdcTYD6+yka15//S4I+30AhGdmS7yRzjp9jAkOUgZQD9RQL1uXBjSt7MskNlYB8Z+5qQlvyRxPLkOPN6TZP5WQfIvBaCzBXRXBmcMVoCuVKmtEi6FwCOfSmKLugXoaILVrmP4tk7D4Ose2/fTt8sNcxlcezrqXSdGFdcNZbIvSAuSyxvdt02obM0IJkxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLXlEJC+h7rFBD3ibOdHu+KZ2buSm7zH+Rd1j7CaWJY=;
 b=Q5R33HO+dLEEoLhIiKayWHLEB0jCPkdR1GuRxsurjewbxmDPuacF9QgNsvsX+SugjF2pBabnRoVhIe6bgLI3Nm2+dDmaeDyQJvs0+wFzXQdYtmE0D25UUdEj3N3VTwuHfZVMkeCgCOXfhPwZ2NoPHy+rhI4NWPwqc1Plrt+Lcg+ddGBGZpjIFxiDTJggIHI4fx1FkBZ3Z0y1nbGuOoBYMNTUqK4F4fm5BVPwWkkfHAw6hIWp2WyUKUBU6/MFXxK7kInV+sRwjSv+FXXxf7yfhVysZffeGTorz1cUAvddX6GnpedTZLOVSCepW0WkzPwUTdnBNIZDa1UL7h1usJGNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLXlEJC+h7rFBD3ibOdHu+KZ2buSm7zH+Rd1j7CaWJY=;
 b=ST8mo92Ug6nMSnURQsxpY31KU94JpoAqzt+bsYnQcDEEEQD80yzMwpXoZRKe/e76PApLPa5QJ+DX2jFjebIp5vCqKa7RBoaIDA/aAXZoXDNhFiNlSWvNKyIDjDzyEymzKM5NuXxVPRATVZ8Y8ViZdMmSL7twawC1VQ5wRpG6vpQa7orVq1Ya5DLS9UHjEanCIPxi6zkCT+C5pHLpq2aXD+Vi3iZQam/prJKYXlxcNLA3XoCfdIpknmjW8WLsWtkbiLtNeThYkeQGk91VYza9tkyZKxoeB5eSMjovRqPdPPfLC34vvkuShYXc27UyRqp4IjSJAJSiO545zydfm2ikkw==
Received: from DU7P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::31)
 by DBAP195MB1084.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 20:59:00 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::eb) by DU7P191CA0002.outlook.office365.com
 (2603:10a6:10:54e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Fri,
 30 Jan 2026 20:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 20:59:00 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:58:57 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>,
	<Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH 0/6] k3-am68-phyboard-izar dsi support
Date: Fri, 30 Jan 2026 12:58:10 -0800
Message-ID: <20260130205820.83189-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|DBAP195MB1084:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bca447-7cef-40e0-78a4-08de60426473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xucHCrC0NmFkWoZ9LGxXdZxtWGVHXOt6l7ve0NO/AhDpMtPy1lcq2lZEs63s?=
 =?us-ascii?Q?nMXPbp3bkfrSeNjihCKDEh2pt0lIQlDo+kfwYKlM0xTOT9HeHMloiIZ83ehA?=
 =?us-ascii?Q?K7q3D7tI+98J2bdsHWGAaVSZZsQKpVYnzqWc3G1p7BnDjOExf9qNN5DPetWG?=
 =?us-ascii?Q?VGtL6cnsJRLKC54632nGPMXKo+5Z4aJ4JhFukWsLPLd+mGii3R0cCRGRWuMB?=
 =?us-ascii?Q?QxGeasm6PXf5PD6HvfLT9VTb5+LQqSSXBkLwZfzZIAdADda+ljLfzXcXYAG4?=
 =?us-ascii?Q?tsrI5nWxEzIUQjTCRjjmo2CqBxpoaq0EJUartMzoqdES+b5yCJypGrvpUoTE?=
 =?us-ascii?Q?clndIQJZaJ2yp4I1fm5T3l2VIRxllNEqpRcn+zHfzw/7oBUfftas/Zk+ScVA?=
 =?us-ascii?Q?bbRy/kKqhwMjAsAB4a7SS3YVnHttT27e7hcU2NKBYjjoDj66K2NfZ7nrv7ka?=
 =?us-ascii?Q?X4eLumr20/jfKPu/BTNEDMM9zBk9wfKqm+AnaXit3UOw9yWlE5EzkENeV+O+?=
 =?us-ascii?Q?MckAog1ci6UvGPvEr48GQxcC5syHc/KcaE7p3wYVsk8LcWjSJo1wgHZz7qMi?=
 =?us-ascii?Q?O9YaOHNImQhQgZkVBufBtu+wo44BfYNaJxXkeR1OUZE5tyMP+ejxPKEkeOKz?=
 =?us-ascii?Q?IuQpFgGA6ra0zQzqVasNTk1BYxlSjCWUJ04EU1izEe6LZEoi7yLXMAakIUeR?=
 =?us-ascii?Q?xUrG9cBypogwQJ81QkQYWmOflTs+pi8CBEbqHyVNO/fdyMX6lRoOs8Zo9Pyi?=
 =?us-ascii?Q?mVXn+yl5fVPz9CpNfuGZN2eVWxabCttMN/L/0Kz/rLBWHYNhMCwgfPQs0G8d?=
 =?us-ascii?Q?VuB86FpB/dset0i/2R/0VUr6xO3adeG3up5+R7GuHDL8gk7P+XpT2xwbjRKZ?=
 =?us-ascii?Q?q4FvsnZOvmdEQpUWr5QD7QAb3MAV+lHyorzwHnBepbnjaTOhC/wL6UrHJ09i?=
 =?us-ascii?Q?5aULmhbw/CmX5s+TKvXMqyUzpz0ZLtn/FYascEFG2ylyv261afpQ/6HnLUku?=
 =?us-ascii?Q?7GmE/cdgYg4b6ZH7VTTpwYpHq8fjVIf22TtkOchNPj51qIYCNcVgawaPO7J4?=
 =?us-ascii?Q?2sCFnI5pBRfPsQ/e9uQBMN9x644EAdZsqviEWWugR26DDTF3mlSD+sVf4rnE?=
 =?us-ascii?Q?s2CZT9t1iDFee1N5g48odLDP6Bi8hnOt8Bnw3NMPnuFN7jyfJ4BaiHmfnW6x?=
 =?us-ascii?Q?f6niLg4RxMpp9QSxNv9Z0uXoiveFSoAuNn3+zJDGO2SLRa+lURMxdP8vZlnn?=
 =?us-ascii?Q?y3r/XYAkfPCbpiMiLx3+QlMEObpqbff/t5L9kEVXGQA2sWmYG/GPZa7VkwGX?=
 =?us-ascii?Q?BEA8sEe8jgVclWSZxOXQdBGFJEBMuUML1ZLZCC5F3IyEHaJpRZQAumKmyf7J?=
 =?us-ascii?Q?kftQ9WdF56MuWXPVVwVkhDSKsqC7ua4YWthsSBDlwQ4myoT0NjiAa451r0D5?=
 =?us-ascii?Q?hGKH2Ei5rzDDpfdRvGQUyiXkJT8WfBSDk2heuw/1QoReX8kWyeBburOVuHYq?=
 =?us-ascii?Q?SmfItyDDK/aP9Gpin/a2wkWjc+44iAvVaEbZf/9qo+3P5WJSNbgkbgmexyEw?=
 =?us-ascii?Q?OX3MorPPzalbkx1HOO5rksP2zDL+NxyCWIVdNd9yVKJBenSGZ+60LjBaLlIb?=
 =?us-ascii?Q?58tWVGi3/iaG+avP4w5sSgTFSJiV7QxDxgsuA/la6KRem6yvAniX0qbysFcu?=
 =?us-ascii?Q?Yq2LJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +Ik7Fe/L4yv+goirL+jHg+caRT5O4kTyKejWht+WQPXDjYDPSxAwbEnovdL/XgmiKksYVlLtpEZ2yTTEbDME8TuokYCohUBCz80G7f8OW5LMHYgVPWlpKHMMVIUXIr7fAWYF6t8UD22eu1comCO1Cl2i25BkZ3akU8XuBw9/1FxPG92+byXr+o8HhLVshVPtAVBDzFSrFQNp9K+JCP9qo2JcdKTIyu+rcMdZtwB0RqE7wgJpmnCf2Pp2tE/0K5XQRWqsxVClENgSVeTOwFQK6PtYYmDsQjqz7bzqNcGSrrk10nM/GCET0xgpgtQKYryXiZc9sjmGgvR7C7l+R3xWa5Bumc8Uii1+WBaVBNshNWW0HzbOeXRSnWmN90kYS5+lFqvTIuIJ2sfAGFZ3EbKkDuvksuIqHrp0LHbRjddVvRQpeZa1aZHGhI+/apQPArpk
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:00.1890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bca447-7cef-40e0-78a4-08de60426473
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_125909_875860_83E78616 
X-CRM114-Status: GOOD (  10.15  )
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

Dominik Haller (6):
  arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
  arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
  arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  arm64: dts: ti: k3-j721s2-main: Add DSI1
  dt-bindings: display: bridge: lt8912b: Drop reset gpio requirement
  arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay

 .../display/bridge/lontium,lt8912b.yaml       |   1 -
 arch/arm64/boot/dts/ti/Makefile               |   8 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 192 ++++++++++++++++++
 .../boot/dts/ti/k3-am68-phyboard-izar.dts     |  18 ++
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      |  17 ++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  39 ++++
 7 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

-- 
2.43.0


