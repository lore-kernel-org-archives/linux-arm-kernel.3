Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA2BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ROLjUFTvY7yEIYtRauTo5JdKllxGDl74arEF1R0IzI=; b=4A7HazMBWn9rKMA6pe081rN/w4
	KvOJBIXCFM5gaVu6+DP0ZMFM01/I2prFH7ZXDw0U7RekwLRNXqhbtq6pmFxinEmsXcGZT56utVfex
	i14ClXMroiUjrAg+xnbXiPI4tpYu7vqKr/xlpkacgqoT+TpWMi1lJr+C+18g5arvKrUFfN1j6ypHH
	EdRFm8zpj66oX7cFvZsz8QrK0Di5yO2WD8HsgqBK+VRKOg4YQ0Ei1hCTQCLqUjN6Fl1Vwy/1iQaiW
	GoRUaGy8TRnZHDizJDjqKKgiMWtC/YiU4ojjQwDMGaMv+FntFgev6L4SjN3jOrNSY8GaO79gwujcB
	ih2Nmvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYxK-0000000ETKT-0E4f;
	Wed, 07 May 2025 07:12:38 +0000
Received: from mail-db8eur05on2071e.outbound.protection.outlook.com ([2a01:111:f403:2614::71e] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYlm-0000000ERtU-1XKp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GY3SC+I3sQ84aMQlM1H4nxnhx+nJ1wU4C5NABJU3BXYneg+17IQPsJz9y4ICelpERQ2hXG/tb7QKxSo+zPsYCMu3VYZH6a5oo+A1MwMyDTP57mrpQkp2QoyxoJ96bK1QOmhp3LLB6e7LZ4+EtsAGX1kFC6MxLyyOvTaYPQ1L0m0v1KUL1RKjoHq8tvcnlGP9+DIN83OVp5ezHqiKTXxDYTKjJqXXXSOMiOhDcsXmCyfwcrlsdK51kMnkbcbumjnxPD2NmPOBEM2RG19CH5+j1hT1LNnMRoS2hkMuc6iW0ehxlamCl3kJ+uh4SEx2DVQfIfOhLX7bhRfcFAraQw1HEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ROLjUFTvY7yEIYtRauTo5JdKllxGDl74arEF1R0IzI=;
 b=Zkhc0fRRLkcV9iXYX/anHyrLF73czjhVeWTEKUYCDmCG6ryoDoXxs1sgEJzw1t+evzUDzHX7E2Kqgf51g9D45HE3a6RhjZLvEsMca5xdjk4fhMB5MAtDbjaD9H4ac7eP4k2L8qHgohA4X2iKhFpdu7jl4GnRlk/K+BnfWfRoqCVkYGL8zJpsKoR9PXrtmZ3Q2c2ZB8rYb/DbWX/4Mx1QPYYUhpK68HKZ3BQQhp1xmJwekQfx4rsfR2Olr8FAVht3fPDG73S0tvPopCkhBPVrhG9zzs4vKqEh/zykTZjzA79FNJeqZ7dNmDznEwm8NKZbqzP1hb4h2hwaL2Xml9T/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ROLjUFTvY7yEIYtRauTo5JdKllxGDl74arEF1R0IzI=;
 b=LvSHb9OVDMhPzmcevXEIb6a5ZRmp4wQIAmfUECTLME6dnm2hEqRYErCytKIDDAzV7DPh3ros+uU2I0Hd88e5HRnyfboMrfmDG25q4BuOvhBu3jj0Y1ZFMyMKn2DLX4Ya/no8RtKJLGIZwDg2TWInchKdZn0UPfsP6x33ykjlQCKj5Nc1XaRgRK69OMQpx0PaDHH6tzk0XCu4ni8BR0+K7HnPtMHBS7HheXzJ6+OlEvUXqeq0CqwinK2Q4QOCyJ1llQ3caSHXSOtIf3Z+X402sFjj8A5iEUF7HInQguAEb8U1knYn++7YrJ3MBKB54Vfc7FHc3JxhDZl/sOAPLW4tRA==
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by DB4P195MB2243.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3f8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 07:00:36 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::92) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 07:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 07:00:35 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:32 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:29 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>, Judith Mendez <jm@ti.com>
Subject: [PATCH v3 3/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
Date: Wed, 7 May 2025 00:00:07 -0700
Message-ID: <20250507070008.1231611-4-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DB4P195MB2243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a31cd05-f9cc-443c-9218-08dd8d34de1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B45XiumoBRLkjGrMZGHbx1hlNrr1/kML/Dj8trFSWh4z5D5wamu7jJYMmnkS?=
 =?us-ascii?Q?9rWTBWV9CsjTrQq9SMOefnhOgz621+cst8hiQStIwyAmRtulLVDdhbwiAdey?=
 =?us-ascii?Q?Rklg1xk5YJZzUTT1fkaW9QHIx3FClSQQzHs4WiWElD2qFgcQKtf9X0C9Wbu5?=
 =?us-ascii?Q?8aQ5DTwcCxmzAdqUpUCRJOJg12cb62AG0wvU7ReIO8BrHmDk4e+VEN8699lP?=
 =?us-ascii?Q?aevn1nm4Lmh8OOS/wRULkoOgGIgRKMo1Sz2zJiUokdW8UFCOK4E4uHB/dYnF?=
 =?us-ascii?Q?4vN71/lOoP5tqqBL+aFO9weUKyIxOMe6vg8SnV5+GG4MkUqI+Ru9EZzgsx0o?=
 =?us-ascii?Q?ExXnuCXoEMPyJ042wJR4y/Xo42Z6vrzuSPzb4VcTQoxOCQ05GbSPvVIg92eo?=
 =?us-ascii?Q?y/QzQGPFyRjDrBHiu01EcZbz0c0x4eFLzSLlg/vDbWy8AYoxPnTpXZQTODhm?=
 =?us-ascii?Q?rouu3HE2vnZ46KS1b5J1B36GdvNaxe2XJDhyKw4QIC87VLGzZTYIE2ZEg2JQ?=
 =?us-ascii?Q?802S3TYk0YzN3cqEB439jylkj9A7by59Vyzg06/2NxD3WqPnN/0jrqbWG6L9?=
 =?us-ascii?Q?FRFmII8b43bcdFZeLK5OMrxjUKWL4MPDJ67ufdt6DiTIgbqc73kHKY1dEcK2?=
 =?us-ascii?Q?YoGNGwE69elbleWwrp4wOlqpmVXlohmZJSXiGkgENYM1Rpx6uYd62lJ6swo9?=
 =?us-ascii?Q?6ekLzjveDH33lprfpuVC65LQWN6VDENvZ5S6mAAwHk2eAeRMVv3c0jG8z0nj?=
 =?us-ascii?Q?8vV8T3J1BMZWYQ5YMxi0IQLOAN3L1i+SzOq/N4IPcPpcLanyvtK8+I4sKkcX?=
 =?us-ascii?Q?n2liSxUs7O1BTSAfTuOSHsd09e84Z+wBli5gyawlk5/RfVn+9M/nfranpXQ2?=
 =?us-ascii?Q?R7S5qVa6aFAHntBJAhFNeJ+lBeCUlZW5hZcO+Ko8ctI2+mQpSczDH69u+MGO?=
 =?us-ascii?Q?qdD5fPaLs81DwRoZLij1RmJKm+MT81G/goDTtRNp4HqMGRhGufIH+uW83RCQ?=
 =?us-ascii?Q?EUQpNxLiLHOY+Q22ZSiH12OXHatjVkX1SlnOfRS40vy4iHmMSF13Anf7KhhZ?=
 =?us-ascii?Q?4blW11S5RuVEenPUiyc9dz3ozoF/GJM3U5TTpS1AEBZdNhK+RRB8G+rWnfsW?=
 =?us-ascii?Q?Tcc5tQw/7UAt1nYHbt81JViti7nvhVtjY+8kthssK8sue9CVp53TKExzf1Ph?=
 =?us-ascii?Q?DoF7lYp6AEj8iYz5L5ivz9RuTblRTL882lh3VQ1HER1VYq4JCVh5UhIPFEhz?=
 =?us-ascii?Q?rcPKFPIioWBRgybOkBSP7iD2j6scaF5+1ZkXgUPdaiXQmlvElXp8XAOVq3zG?=
 =?us-ascii?Q?E8DHVHzUJvGxUMm1nkyBMayvAXkgeodDbEzvTGtN0caTc5GRbuQsLVB+5xk/?=
 =?us-ascii?Q?bKTMifotEl01W+ERKTzG2lnWmTTRbKBDQXOlZGyI7ojU93Pp7zOhXKvVl91j?=
 =?us-ascii?Q?mNSCUtyt9L3CznA5wgQGS9aOjv4/b2ipCkQ9a/tMbt0I11nfRy3GeUiJ9pK3?=
 =?us-ascii?Q?6qCBHd/+V3CKUvoxgq6hO7hIZRIyA2KXUdVy?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:00:35.9930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a31cd05-f9cc-443c-9218-08dd8d34de1b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB2243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_000042_403082_01C994AB 
X-CRM114-Status: GOOD (  10.28  )
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

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Reviewed-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 0aa8d9bc5df9..434ce5c73d97 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -379,6 +379,11 @@ &main_pktdma {
 	bootph-all;
 };
 
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1


