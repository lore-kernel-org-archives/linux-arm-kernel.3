Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9ABE909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYt/pSwSIZDXvrj1I46J8BMXgsVDKYkGbx6oN+R1ytg=; b=Gav3aeMPF0xPi7d6/EI5JZaGxN
	39Lz53xFV2nL43y2Vn8ABonxZUrj+EKxmg0O2CZL0q3Td1e7PQlxnzZAvGiTQ97q7z+X9DQTpuA4N
	JvFQrpo7bNMHuyNqXuGYRs2M18UTBRVd3gbcuEKfRKln8bjz1RH72Uo2XbY2AaWpzX7CDXBn5zy3i
	u26XuJFKcT8jA14zNLBOY6RVgKdW1aGxumZZDtrEFLiguos1yoapMkuSn1SZ4Me5QdRK8pl0wRM3j
	q27iQfmMbTqFx9OCLMCE0U3v34Jbr2EgAxJyCCpIKPocDA8+cHucnPk7OYd0txysOkSq9ej/UW3IS
	Sd1twFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLYE-00000008Mxj-0INb;
	Tue, 17 Feb 2026 13:55:42 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLY6-00000008MtB-2djH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRNIplASk8Qz3vNkfeCqbHQXfAnJ2OxhaXArquC0yb7HIR87IEJPK8zc1yMRb1/oRMWgpukzA/Z8NckkJpvbzWcTVQfbXe1yw8GH5PfQrtgo4jdr2jmQUoHazfhinaIOWkIPcME9olmbOP0jWqeThlIbCTAKrqHTygPUA7C9lp6sWUVrgM4K20IcL7x38fPBILOmpvq7OtkzYbZjmCOdVD9aGJkGr7bqgHLk8vJbDEtjugYWgjHmP/DiGjd9+pQC3Nd+C4wbX1s5Ajgq/d5mZQYoGdI/3rRQ5pjPKGvmY4KzjJvFoQpX+nFffYLJwfOMsXlk6tLHxneuGfR/c4J+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYt/pSwSIZDXvrj1I46J8BMXgsVDKYkGbx6oN+R1ytg=;
 b=XlzOnNK1+m4ekSMLR+vSWty4XG035egKa5GNfKNaTrVu1wBP2AcwEA41GZdmr6fe/o9ztEBsWNq2i7PSc1YBIEzsuI9YIsU8RMrYjo1lhyLM2O7WNTj4ptWDvHqH06Sv1N59N93lnuuh0Vs1dgcrQc7FhwDAuLvFuT+CmSoge5YYdtufGxpfjObdQXVWM5AU77mdkkONjODDgp1SwZNH7DdgLfZ6Q0okXepfd5srOykAVW/b6mW4qAMWdyN+A79rW5xVdnnMYY3EcHJiSFZo5X4zTJAKxuqdFz3gC5/g5PMVvjC6a+ilIFj5hyjRohsXv7/HTmjKSkGPFYX1KBic+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYt/pSwSIZDXvrj1I46J8BMXgsVDKYkGbx6oN+R1ytg=;
 b=J5o26aBUEqWxPGGU1VWgo7vwbmdVnwo0s2WB1XLQgQXGZ4ZFEFuyLWyfu2HZuGuGgt6kVidTX1AoqQDs91cDRwtXQcyXflwUm+IBlh9vlXqBIVzntsojUDyhCuRXb3YjNL1wZ3VHW7hUmRzqyU8VuMpZmIz28cpWDtzph4pF3WXtFmimifFuvOcyxkD8S2QcS0x3UMAv6BJtKHFcSIo0LTDGRPUptUHm9UhZMk1Ssx0d5AxWvjB3Abu/zpAlpjS0LvugkwpP9lfdOF+5Z3iXCJXf7+o12qep5xLB+5Fkey5FZ14ztW7l4OpRXGVLVAYTbStijOJVrbVuNllYnuic0g==
Received: from BYAPR21CA0007.namprd21.prod.outlook.com (2603:10b6:a03:114::17)
 by IA0PPF72D6B8141.namprd22.prod.outlook.com (2603:10b6:20f:fc04::d2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Tue, 17 Feb
 2026 13:55:27 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::bb) by BYAPR21CA0007.outlook.office365.com
 (2603:10b6:a03:114::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.7 via Frontend Transport; Tue,
 17 Feb 2026 13:55:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:27 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 9D56BFD2FB;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/5] ARM: dts: imx: bx50v3: Configure phy-mode
Date: Tue, 17 Feb 2026 15:55:17 +0200
Message-ID: <20260217135521.65742-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA0PPF72D6B8141:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f483d15-cbf4-4724-1a53-08de6e2c34a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g0OGrHCBQQO/YX6Q8Duf+ots+hmueufzQr1isBgb6tGAYYvFpwtO7dxh1orv?=
 =?us-ascii?Q?VCXpq2wYnbTEWRn+ThK5FRN3JTXw/Q7/fGYxxfXphA0bRqvLiC9K1XzR3E/y?=
 =?us-ascii?Q?i9Y99PnCuV+GAJ7qtFQtceJQHtxBO4UC5mt/9VYOyRLW70zzobxks6Wn9i5z?=
 =?us-ascii?Q?qpNaF5F2UehWzisAQczebJuhUjtDlwwScxBaMqSCfsncVILNkJD4DCysAPd8?=
 =?us-ascii?Q?WQS7ewwF+FHQI3HbCCaS9eYmTnRTk0JE4Ga4RogtjpzzQxOYUUD8BrCH5iU+?=
 =?us-ascii?Q?fZF0XIZjJP0+LNfdl9o4aoKpK/QzYXRVY4g2oHWy0wTjZsDuyZwxg0Umk4vV?=
 =?us-ascii?Q?AkzoBWMSy6MuQR9HIF3CqNbM38/xMsMQjG7zh0CgppvTWshvl1R2VVmWFRZm?=
 =?us-ascii?Q?e8fehS5lpO1sqRcGcRiCbn2YoXJ663WzW+IUQb4wlD0DJldVLhvn1JM9FFW4?=
 =?us-ascii?Q?3sfiW8T6zlV3qEJ4XOiMOaETGTUvx+lQhERBO4gjRC03EThd+uraa9zeiiEo?=
 =?us-ascii?Q?1LQAgQ4xC8jxDd8OscGfvxZEZOLt9A0wmrtlnlAhEr6pS7z2pnjdOjJbcjE8?=
 =?us-ascii?Q?BWqIZJcxi/kdLyGdG8PwK/zUe5U1I/pJypjjLH1C6JK6MjDbbA5YtV4TC7ws?=
 =?us-ascii?Q?Pn35tR0JCaSspuyymq2rn/19oFRSK0sH4VmVCc6dPBSlEg67tdf+CdT9RWCF?=
 =?us-ascii?Q?wesrhMt8OmfvcFTjTzqHOz+pz59LojcPjsKbiNX6qYcbK0kPV5xbxKRF/K3G?=
 =?us-ascii?Q?mqNpjTCJwf+SsmNSwTT5XmHWWKddp5c2rC7fLckDHrx0Uysy4jCZ0gOUOI0w?=
 =?us-ascii?Q?M4PN02AT0hruWMdOKN9yTfEa0oJuFhQnSjY1kI07vkfV/4pWaM5E5a0gmKTx?=
 =?us-ascii?Q?D99PEp6fuxlJCiS/4OhNBKinyUMhnuFamo5+v/kFR1Sr9e7pa6nimh9wW5vI?=
 =?us-ascii?Q?pfDEzpCUk2LgVRCpo61Uj2Kzh7bt7wDWs9VO8XjyLl9ghK80AJKdwRh48cRj?=
 =?us-ascii?Q?mf2Adp/boD6UxkCaRfTylN5Isx6Zwrg0AsDW7LXbkhtAtvmwAh76TciBkT+r?=
 =?us-ascii?Q?4Z9hqK0eaIIWa4a2dsnJ11fLCIIzHQaq3vgoxBFh/tbVTwVohICKmHCJEVZY?=
 =?us-ascii?Q?47NP/AQdHlktzfZ4s1mW2U6G/xfafkXQmdmUiTLkpl/TJuIs8F8L6Le/hb3K?=
 =?us-ascii?Q?pHP6zarzVwSeMQtr6hTK3TDVRo7/xxSPX0svhfMu6axhESfrkok9rIxJnNC7?=
 =?us-ascii?Q?hUR/6qBslIBFqMtqDcnRIDIRAGvFJvoqTzREN3XXAgj9+1fh6bhx82CZRqkS?=
 =?us-ascii?Q?8QUCUKymIa02GMVeNeJ350nyz/hNXevPVFB1A25Y21GNNbN9kZ4Kw0UJ0qAR?=
 =?us-ascii?Q?HyUVN9KksBH/rfIrj2A7wB6KxoT0xSVM4U7xDMHh+uacACYgNV+y4N87veCA?=
 =?us-ascii?Q?8Eed1SzIDR2eriz7+8o+B7Vjt68xxI6eM+cuS2RWlEtPLRXtA6HduKJN1alj?=
 =?us-ascii?Q?t7+vl2AKh+w4rZWwuc3/9xMCdaRWy4hYnu7Oi6/hiDZgIPAgZe0p5GHcBvj9?=
 =?us-ascii?Q?L8qn3behmApldjIJgeEo+cp2p6pHU3PnbidnzhOpindvmZWQakk0yONCLwqY?=
 =?us-ascii?Q?PjdKs0D9aHIRV0/emV/um62b7CEQtbSXbH5qb9FdQwUv6iicHdOC23uHMSlR?=
 =?us-ascii?Q?f5/xjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SnXrtfFGPDgW3iXOCsmZUcL+afdNBYwdzPwNnAKM3v57/Urf9LCqpxKswLZypTmNuyiu5TrphX3Waoq0vUVYCl3B214BkZJe1eJb1faO3FCjm2VqHwcfymw23ZGiO1DSTDJtVAm02eCGD1uTCUY0YCeIHc4xwL2XlkRu/4Y444KGlH0R4LvCvs8QdgnIrosLy748zq1EaQCmMYBfRZQJNsFBRk+EFd9H+cddbJdWlJ8ED1dR7BOwL9qfhsPLDKK1NYEe6W6eqcJkybKRZDALKN4QQ1+UX9hLJnHfGU/ImK1F4Md/trZG9pl1uUUAo0SLXlba5k+Ky8bCU5z2Jjb2ZoxKP7erCSUUVgrbUhDuUZkRlAUJ9Z7WZSNIKarLGN2NyMNku8QT2AiwSgbJS454dvYY/tjlRjDtOfgZLJs9+qV5EZi+RJUgfsTTttzUZ9Pm
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:27.0999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f483d15-cbf4-4724-1a53-08de6e2c34a2
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF72D6B8141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055534_677480_68929D64 
X-CRM114-Status: UNSURE (   8.46  )
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

Set `phy-mode' on network switch CPU ports to eliminate a warning:

```
mv88e6085 gpio-0:00: OF node /mdio-gpio/switch@0/ports/port@4 of CPU port 4 lacks the required "phy-mode" property
```

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
index d994b32ad825..7326b8ad08cb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
@@ -140,6 +140,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
index b0d345f5d071..9a43935be11c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
@@ -139,6 +139,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index cad112e05475..e7ccdcba2d5c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -286,6 +286,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
-- 
2.49.0


