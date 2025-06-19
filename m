Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B09C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeQx8yQ+aHI/nkhkY7qvSKQx4IhG9ARvqLA9qfqHO1Q=; b=AOJ73Zj8BPimIFc6KHbbfD5Vzq
	+EiwvpSUR90gSY99X6vC3dPG2HFFAg6o22HWqv1q4sdCS31RG0QeJIqzx/0T0wUgersSrUBdRao6E
	ZkWODs+RZQNwYQ5QNzK5QQ37+tgNVRuraCwVZ4bQgl+SZBW2BSz2uLa9zajF7h+ljqnOsHpcLAxmx
	n8lkJmS9ulMP6T/VEBTzm07Nr98jrwHX6nQZcbmnKWgBOmIJaNDICsSlEuKgUc+FZjQg/Cpml81UE
	fBCBwIJAMgnx4OO9OQ00fx2h4DR9ij/vBI5yZPputLqEronZ3Q7oYEQwGEiXX2rCWE/W2yrsyZTr7
	XonhnXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBnv-0000000CeEf-1nwm;
	Thu, 19 Jun 2025 09:43:31 +0000
Received: from mail-mw2nam10on20631.outbound.protection.outlook.com ([2a01:111:f403:2412::631] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAtT-0000000CTjE-2pqL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVG8EmbZlgnMLVy8FnASfjReJY9doEBrlQRjo0507zDGwLlhcllp8x2/DDcbCBWpKpSP7FG/BVuqVfx1PZ5qCz+IB/Gyxgc4+UvwD9u/kOB9A7AC7p+EXUKrinC1d5g1a7tFRFKWFaXMM5q2Gy6yoqkG63K9/IADMjFzB89FUTfPux6+jCjTMO0eAs+ZvAFlMt4qN18HM2PYnJQNhZFZaywwj2hmA+FiaJP4f9Hej+2lfYGq2A4v83ozDGTyPHeF5jICrMvfSnO93TBO+a4xmDKS8SFfTaxvOP1ElMDMhaXNfBpzBJ/pd8L8JrlagGTKlzXh8XhDygoGbBp+0yTLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeQx8yQ+aHI/nkhkY7qvSKQx4IhG9ARvqLA9qfqHO1Q=;
 b=QEV+iThsn+eDh+jWOC5iP7FxiXYEw1/fD3EZ6MiFQN1BeWBRxNDouvPkMOl9HsOA3QRPjpdfVlEhawk6gqT5hhA0JJD4bjwY23V/6rlGqnp9O3fvMvr6WlHrhjsGOGIFsxuB4rDYGGxgK6V1m8hb7XciVToAfWV4Gh2/l89TMu9m9BSO/FJXsOExecf8KPhTDMcXeRCBGRbhR29Q+5yJDK1bdjlF+YnqKHUC9FOPf2fF9d1ZiGVqCjrwd2wWWuAHh/gYxywbdPL9EMJEMx+oJPW+1ipXZ+qohzn/W/ygN9z4NKaNaK0m0Tn9VZdvokAns9zjG2u0gHj+NdnWXe2AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeQx8yQ+aHI/nkhkY7qvSKQx4IhG9ARvqLA9qfqHO1Q=;
 b=YCZG9/FiZ30PnWv4abe+lSXuLHlC46HGQyNUOcod7aUAoowvTXVAENTQLyqoHVHGmlPJJfLUpvUHUcppLnfcSfn2cbF7q+m01bl4eNc3WtWMLAD8NoH4p6FaUOekdvETdllTV62p3IBoMS8uMsSxn2VpghNpdVeHNxVs2b1cFOkQ+UCu/Gjy++1h9qjwJAuGM186b1M8IN6Z10HfVLXhdD8yLlFE/3RmhmSdHRwPqQlAsA8fbBP6zDVryWS06fVEAEnnRxq+qfb8jG0Bl0FIMcqGlDMOKfXdaa+Ut3K5PkHMLb9CTITnoZTWKi9nk+AtMXJf8U2TZm1AHMJw2S5xsQ==
Received: from DM6PR10CA0017.namprd10.prod.outlook.com (2603:10b6:5:60::30) by
 SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 08:45:06 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::c4) by DM6PR10CA0017.outlook.office365.com
 (2603:10b6:5:60::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.36 via Frontend Transport; Thu,
 19 Jun 2025 08:45:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:45:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:48 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:48 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 6/6] MAINTAINERS: Add NVIDIA VRS PSEQ driver entry
Date: Thu, 19 Jun 2025 08:44:27 +0000
Message-ID: <20250619084427.3559207-7-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619084427.3559207-1-shgarg@nvidia.com>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SA3PR12MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ffd18c-699e-4244-42b1-08ddaf0d9733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x4FHM4evOstQxInwORiE4BBOMqsQrW0ux/ihF+vdrFkuCBkbrH0w4d9H0NTB?=
 =?us-ascii?Q?t7w1h7c4Hc7HOC1rmcLxpt1O238KqGqewJbgZ5n34WCplBq77CDZ2GbI9YbY?=
 =?us-ascii?Q?3qK279fFAO2Jz9rOu8/a/wy2O3M0/vAsl5A6mc47umT2SAPUp/tpnrPQPwVo?=
 =?us-ascii?Q?kGDAwwJkxflz8DjjXWom1FKqVzwfD8Mhyf3Be5TAEGM92h7rUMBUCPqaD2HT?=
 =?us-ascii?Q?cMpgmUQ9TRKsAuEXw1ImK8Y5IZ0c9cC2MIqeCRxsHrCzln75iNU5N4DDE1tL?=
 =?us-ascii?Q?mlJoz9RZPtTxXEsiX15ZwpWotR7cA+/ZG+YyCdYMP5YtnFbwyQXksLfF+JPx?=
 =?us-ascii?Q?YLstzLhSgFv6ggb1ny/KZQ0zz2byHIza0dt5hioxV+qUW+HsEXQfE7D7/9Yz?=
 =?us-ascii?Q?VZxJzshSg7n1NUKcMu20/CDxvpgBDt8ukePppgAECM91WA+0AVJnF2N9WGYa?=
 =?us-ascii?Q?f1VqoBF8QLnkKhwjDIaK/XfKCi2Tli3of9W/oiVofbP5ZWy+HdMYdZY92K8L?=
 =?us-ascii?Q?2g9Z+suMFhRWcSHpwV0ISdO0GXZCj1RdstC31ZZJeb8iOeJ44gNzNtaYmkBD?=
 =?us-ascii?Q?iH3dybESb0TFeEiA6sIP7VRH4nOBQvU+uOJJfDjMeeQexmSB42BfHjuyVzVn?=
 =?us-ascii?Q?AkI01SK7oAe4Bwe/mZRN5cVIFI3LNSpUfq1fEPD+rm1dZ8XmMaMi9TkIFGmo?=
 =?us-ascii?Q?Yb8qVFaAxMedNFt0sdrYyWC+l798DaM3+toySMahNFbrQg9UsDYyVnqcEjL+?=
 =?us-ascii?Q?qBVj2DFZKZ1jp/g4xlprkOuHXz+K/yu1R9n/4Kxd2o3kQTwqnaEA8haqjJZO?=
 =?us-ascii?Q?2zxviRt1xTO7wwRGY0QEDIQN1bt1byso3Mg5swmQySutycJPo8C0Zkf8v3te?=
 =?us-ascii?Q?sj531JR3vW630bIp8385l1zBe2ZviHvAM1coUDR3WPqRmtL3k2HLD8FgXC2h?=
 =?us-ascii?Q?cAkyN2SDhFteqLNd7Unlt9OYR7Oh6PU85Wgz1GongTYYRxMf2E+HYyvJsVaS?=
 =?us-ascii?Q?14TBXkOqUvkntJU0utJk21GwUyBAfj86P3ai1Hk8VCCQ2fstUDcy9UfqlK8L?=
 =?us-ascii?Q?JNE+xA9kdzJu5Q+9sE0Fk4ILaGQjsn27D6fp2VhQj7meo33B2M241AsNDtmf?=
 =?us-ascii?Q?mUwuxhIFVf0LZ9tEGYEEjclSyfi/P1S9MN7oQ4pzoDV1GVLNzIjwZxgThy3M?=
 =?us-ascii?Q?pB9v0Wj2/iqn+lduYdRN/qI/Igc49cwNVHmDnSFqsdnVdpS37cDY3AgfJKne?=
 =?us-ascii?Q?/G1iWkNpDaJEmPfaHNYd0SZo1WtUeZjwDF/C2/NahXaMEBEXhl4ZsGuZH7jC?=
 =?us-ascii?Q?QJ+RZ52MRJ+aHT7v5/GR2Fv/XwaTxO7/lBSyGHnoIsfh8Eq63RI5b4YxX3pe?=
 =?us-ascii?Q?39a/2lRnQybp4vAcjd+1BjM6XCBak+Ax83PQ/mOFmKJukv8Me0ea9Fijn2Tm?=
 =?us-ascii?Q?H9Kd4JFuUxDR1wa0xhGL9AhkNo9Me5jFs4uM0mMFZYPUOl+yV1IrKGDNhyyw?=
 =?us-ascii?Q?9VtIXjoAAcwMOkWL5E5FXgKgV3xuOaut3FRm?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:45:06.1269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ffd18c-699e-4244-42b1-08ddaf0d9733
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_014511_725553_FF06724D 
X-CRM114-Status: UNSURE (   9.70  )
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

Add NVIDIA VRS (Voltage Regulator Specification) power sequencer driver
entry in MAINTAINERS.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v4:
- no changes

v3:
- fixed indentation

v2:
- this is a new patch in V2

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9165216d0cc0..11030db537ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17846,6 +17846,15 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS POWER SEQUENCER
+M:	Shubhi Garg <shgarg@nvidia.com>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
+F:	drivers/mfd/nvidia-vrs-pseq.c
+F:	drivers/rtc/rtc-nvidia-vrs-pseq.c
+F:	include/linux/mfd/nvidia-vrs-pseq.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0


