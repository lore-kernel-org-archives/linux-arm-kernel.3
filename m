Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242AE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 06:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9VH8bVGmFjq2fDKXn6fOBviDseub8gAY1PTdU9nhYA=; b=W6V+fstcs0eSZrsv3XUQMl1t43
	LN7RsRktqWS8vfqekIeTdtde8IvFbkecp2tNvCF6sc3pzNZsh2cBFMMy7aR7tqla+Q1L/yobng5j2
	amR+hBV94XujAnuBKU4hG7kJqoIg+GWtuR9PZJ3p20LCtFnt7HMVkcTu1fsHUQeIkAQBn4xMWMwi4
	ded0A9oVI9rt+nlSBoJOEh6fjBJMGn27i3C8ilZajLqYdxnDy0NaqVzd8Uemysr18jhFhHoNb6kbU
	d5jYjE+tR8a3QNXrBHZQtVdZS6eiH12cV9AN7fqKXN9oMWqp70Id1QTdXxnztyVkJ2Halu6gMJSuR
	F+wK7jlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Ef-0000000Essm-30MG;
	Thu, 05 Dec 2024 06:21:13 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Bo-0000000EsRl-3WGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 06:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3dl+uyOVX6TdOd7wLaUlqmPjvK7roib/WASvGl/ye0NnBje8+brqHzidKW9yRic+aY/hZoVkecek+rduX6AHZFwwG4io43kaDMVMgc2B7ASTWFBQs9uD97XoH0iUGAjHMekWxp8gAhC5UbpxQBQJDnZ9canorEA3uY/N5GGzJWusqVYn9sV7T1jHL0ad8k58vNG3Uw0AEpMLGT2BvCkdJrSWL9BLiVTVpkRFWuSmsI709NvfGxVuma8aHu6fpAUG4LbU0GCjEymKlBNMNjuUl3ogVX8yRhnHNETCZtsxDks1rtKWwBHcHvIK0j4cycj4pF+/DaWiidmbezrt64ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9VH8bVGmFjq2fDKXn6fOBviDseub8gAY1PTdU9nhYA=;
 b=NyrSXEYxt9kcyT8N2dmj7u8diYPtOwnV+0ld5tSS12R13R5MJCAUjWJIW3PPAvn7/Z71nVAh1cw331IXB0zWUUUcmanDwOcNuz75CWCsZaS6XoG1jgIxkcKYSgSQlWfpNXjKiCn4zTcUy1My51HRvtU5B5kSXv0ZG6/ON/F9uqH8VFbJYjIqtV9bcsVYbNugckpMh9ffM9AuU75AeFJZIL3b4JMK0bDHgJpJ/s1CFP3YIpeQA6NRLf68iUK98A3h+yq8T0KlMVfCH80CTroU6qR5aiGzcX0EryQx4X0XPz4dwXO8hu2fQeXJijTMgCQ8EUoqxB86kt8+WA9qokgurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9VH8bVGmFjq2fDKXn6fOBviDseub8gAY1PTdU9nhYA=;
 b=t01D9cSK4/G8gAAZeTWRQGxiGChnDNXuLn7x+BMotubi/3FFJymd6NqsUM4nYCAkBsWv5ww1xlLDn+NqORPKHkToxhIRxxH+4ZzEJOeNNpSwZLyNmKQbJ0FrYZcaqC+JBojdZVthdqeoS0qmFGnXhXZQc3Tp/BmA7XtYkZ/Lj/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SJ0PR01MB7394.prod.exchangelabs.com (2603:10b6:a03:3f2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.10; Thu, 5 Dec 2024 06:18:12 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8230.008; Thu, 5 Dec 2024
 06:18:12 +0000
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] Documentation: dwc_pcie_pmu: Fix the mnemonics and eventid
Date: Thu,  5 Dec 2024 06:19:14 +0000
Message-ID: <20241205061914.5568-3-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
References: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::13) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SJ0PR01MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: a14542c7-c7a1-41dc-e013-08dd14f498da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qQZNGWxPMPpbu4WWY4+gstL4SWt4p8cspR/NV9hHGWlQlJ67huzHjfam8v+u?=
 =?us-ascii?Q?nEJku0lH6uaKnmoxbbqKgEnQDntHwV73iq/bz/vOAFePDSLLKDcwlHqN3Png?=
 =?us-ascii?Q?3y2JokyHB9y2yK7M3sR97rZyFNJbFkrdXG74eByENO2YS/0VAFdn6MelqYO/?=
 =?us-ascii?Q?IxkZg0M/MJMwM6pcCpieIKP0oTRtUjnx6nxCIoIWEIqMpFs10aiVxrhSxfe7?=
 =?us-ascii?Q?TtvqwjU0a94iKMsUcjJ4kvR4UXufCZGO1wegJCN2QjyeCc82xAayTCMwNuMq?=
 =?us-ascii?Q?GKJBMTe5SoKBpDBBJrA8aYdONfxkVg1BiAYOTsWgaUbggMdGtHYAzzMDh4xg?=
 =?us-ascii?Q?XEOjcf3dtvxL6Qtgti+mJ47UPyGZw28Q4dk3nED+rz8JEMNPecLIiZUrkO+w?=
 =?us-ascii?Q?OEdyfpsKw0xwMizHwksf+G5tU9DXTB5Id0w8PYb1AyHyQUn9uq7QDu3hLV4e?=
 =?us-ascii?Q?Cpg+XJO/9LLTi4PtzyPAqSmsv0H0v3EacUyFdW2EVONm9OnbCPPBZ1APUIgX?=
 =?us-ascii?Q?JTU+DrnKd1JQ2zstzbIBhTU9DxfqhJndQ6AzajGq38XdyBiZ/Ra5a0VS7R+9?=
 =?us-ascii?Q?41flAZjGS27JBHrzeNxDcCyAF33rLbylZ2qBbe1XFAHZPJ4KOTVsjBEmjo2n?=
 =?us-ascii?Q?s5xb7KJHUGzQeroEXrMOW/ELzFF07sICCZn2/NdlLCh1KtlXWBtHl2/pbVN0?=
 =?us-ascii?Q?AzPAQ0M+3hksT05dznp6Gsqr2gWavbMOmSrpnyGziigXK0St/0euTcOf0tgp?=
 =?us-ascii?Q?+qDzgQDnahdQVaCQK4tI0zgdM3x9vMLHhAuGmSLJ3mKhhjDIEPh6yztNai3U?=
 =?us-ascii?Q?HbYjboZoI8RqpX+3Jetlku9C4NSi9WWyeMndYOiA6CaxthhM0EBYXmD0HHSK?=
 =?us-ascii?Q?+zpueZniS00XwzzeHuKsQ2ID0uoRPuiYGMsjblakz0ETwrw7nz59buXf9f7l?=
 =?us-ascii?Q?yIYF8PmUVvIKxROUtYUzjQDQkmU3PGLrqWuPhfkHG2QRceH90iElJ5mcGL6A?=
 =?us-ascii?Q?p682/Cj3L44ddTaDtaPoRypoXyeFs7YnNmeGk9QhUsvkGd5Bk6AWX9saP4xH?=
 =?us-ascii?Q?Lk+u9zvEdD3nfMgEIrjhAF02zlP6gHpyt3Hqba63j8gFxVZDmR6x7JCxNvsv?=
 =?us-ascii?Q?IYZeR+2VkKYJLBBZNpz5ClM68UPZfG2dqbsdEuTIBehJIEFaSseun266sCYJ?=
 =?us-ascii?Q?Ye7M67cP2ZGz12WH6dNkX0pw5Y77cRGBiB0r3wI0JIZEPBe74acfFFHNu9ZH?=
 =?us-ascii?Q?tI8r1fDu8EGnf5NQyC8vQvjPFCftKzeXqCnsLt0nMto7Q5wa6C/yZkHw2r/v?=
 =?us-ascii?Q?WELjra2If2sCeMK6iCODak1P47wfg7C4pQtRoCxVna1Km5ePmwOJ2tZpsw8H?=
 =?us-ascii?Q?AfSQt952SgjWXrWnhVPpeag2bMZNiXk92s60ntr+Zf2Uni+Dlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eGNlTwkgKbKEXlzCuRM6KYv3y89Y01aeJkP2XYJyryvjfeukPePE1fAQaBiT?=
 =?us-ascii?Q?SPSYZ2oCVI/CMS/lMo1q9MTsq/C0+0WjWUj3mmcUKKTDlLXg5+lermBHOY3A?=
 =?us-ascii?Q?RBkPkSdKuNXNT/t8tabbqIRSGtt5kaNSLWC3sqvctlQ7C36ZNr+8c9UOwHlb?=
 =?us-ascii?Q?RrMWsl49TLEA+38SfwT0L0qbbV3YMFP368GE0NCMsWqZ0XzohTa4rGmB2bh7?=
 =?us-ascii?Q?LOn/HNEhcSgCFd/s5q/OTsHtLhdo6v6B7VUYhQLCkIHXddRxDiBjFSEwmp5u?=
 =?us-ascii?Q?WEZk3Nszn+gsbuzpO/clqsqxBgnnHg8HFBOlPQqNmLy4MdOudw0VPsQj24tF?=
 =?us-ascii?Q?Ypul4AOINVHkvuv/DWP3eVpcaEgIa42DoH0ntlIP1wTcS1myJudlbJ82TZDP?=
 =?us-ascii?Q?Md+Wm9bY3WXs5XoRcC92RgSyKo7nEiKvM59zUVcr/7ftEzEEPoaCSGv3ytmg?=
 =?us-ascii?Q?WUir8sW9ku8PphBx6wgevopdEjz7K8IOYnRAPtu9Im3f1fS6QXFr7nbkFJei?=
 =?us-ascii?Q?KqmDZ96m60oAFEbRtxu4rL426kcMCEl0/+d+XGrk3W6sTmVAQFIFtGUHRhC+?=
 =?us-ascii?Q?eqRG60bFNIE0lvpOH6HKunwtO2AM2l9gPSOjYrGox1m5Cor4kO0i8QhzlHw+?=
 =?us-ascii?Q?IcK0Py5sK75VyaddOudaGiifzbRT99mDO1jcMLl64RfAzeSEwcGXELgLsuSE?=
 =?us-ascii?Q?x/u8uYv7LaiZw18+OoctF48p5J5CqtsrWPKVGTk8o6FfxQIcfFRCVfRP+Cg8?=
 =?us-ascii?Q?eblNr93X2b3gear3pj7iq151/Locdm0pcfYmCUXrCkEDpNu0ArABOXo7Kjav?=
 =?us-ascii?Q?YSjR5Rd0AssmTgCQhObrMS/lejmqsQZzC3rHnG1vk4PnpWycA9AJPAnm4NWt?=
 =?us-ascii?Q?5DRTk86m1FhbLLy0BJ5qHQCACY1SHuz6ZSJU0HB2/By6/dBcJ6Pcsrx6jatF?=
 =?us-ascii?Q?T/39WIiBxeG2tbvTxshdTqxkkz4LrdVTZXlM7Vo611PhJ9YAD47htpWq1AJq?=
 =?us-ascii?Q?XFodCqLZT01sCVSGTa24nkNPAs8K0Mmp+ST64iQ+5k88Hxiw5wPgYB6JeUMo?=
 =?us-ascii?Q?NzHhbAwNsbwl2OC7kqSyZtV+45hOL+/3dxrspB+nXQPzB2j5b0MoSABo5XwC?=
 =?us-ascii?Q?FOO0x/09+qyGNRc6jZJE4yjHQL7I/pONOCQ6Dfvqx8hKqtn3ZIohuJWTUjjV?=
 =?us-ascii?Q?0vij7xXcmt0KidjcU6ePd176PwzIWWMU9YotByd7HzMcGmNmA11uAEtORsNu?=
 =?us-ascii?Q?XcQwo3zQ0rsHKwnY7RNx3wBdJzVt0RNTR906ZENFwwY4/ZQVnMZXGrOBSjuU?=
 =?us-ascii?Q?pAVCGM3L6oTxr8PooRg3y0v7kp04/20rKDDccn12Fpd8azZQvgfv2dk7j7KX?=
 =?us-ascii?Q?FsKnnjoJLprDmKoydj13LVRzQBVbCh9LTnswW0Ys1nXvH0dytoG0DDPAneFZ?=
 =?us-ascii?Q?milyfNv9fhKy3wKwVNxMG8lO5WyJn5MJgbEk0fWUUQYwqQOSeK8hgJMrCxrV?=
 =?us-ascii?Q?Fffz060vwKKBUG127K0t+VSuyMBaN833SRXjJS9xEAncvN8cKzszpbbciKAP?=
 =?us-ascii?Q?Ojkr50+TKXPq3+Et4iHdyc4+wmg5dM+wQbVic8ay80qZTQ8tvTFqOj3YroVZ?=
 =?us-ascii?Q?yj+HzlbcTQgJYr1tJjwoCUc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14542c7-c7a1-41dc-e013-08dd14f498da
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 06:18:12.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDhuJZ6luhWIHkoxAgVUMOaP2KGUv8sdFi4UhwymMj2AwCCNaLpAmSClYm9WW90CYRPktIrfX67VKi2NiMj6j9xPzl2M3Cmog09CqN99oHKcme5H2CaAOzTvHPmY0FP6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_221816_887503_8E32E528 
X-CRM114-Status: GOOD (  11.46  )
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

Fix the event id and type in the example. In addition, the recent fix,
which addressed the mnemonics with mixed case, didn't fix the document.
Match the names with the driver.

Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
---
 Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
index 39b8e1fdd0cd..cb376f335f40 100644
--- a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
+++ b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
@@ -60,7 +60,7 @@ description of available events and configuration options in sysfs, see
 The "format" directory describes format of the config fields of the
 perf_event_attr structure. The "events" directory provides configuration
 templates for all documented events.  For example,
-"Rx_PCIe_TLP_Data_Payload" is an equivalent of "eventid=0x22,type=0x1".
+"rx_pcie_tlp_data_payload" is an equivalent of "eventid=0x21,type=0x0".
 
 The "perf list" command shall list the available events from sysfs, e.g.::
 
@@ -79,8 +79,8 @@ Example usage of counting PCIe RX TLP data payload (Units of bytes)::
 
 The average RX/TX bandwidth can be calculated using the following formula:
 
-    PCIe RX Bandwidth = Rx_PCIe_TLP_Data_Payload / Measure_Time_Window
-    PCIe TX Bandwidth = Tx_PCIe_TLP_Data_Payload / Measure_Time_Window
+    PCIe RX Bandwidth = rx_pcie_tlp_data_payload / Measure_Time_Window
+    PCIe TX Bandwidth = tx_pcie_tlp_data_payload / Measure_Time_Window
 
 Lane Event Usage
 -------------------------------
-- 
2.47.0


