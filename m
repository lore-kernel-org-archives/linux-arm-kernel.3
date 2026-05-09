Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C60CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87WZK+0Ki+vIwya2tWprlTatpImM6jAj+om89wKvpKk=; b=BjBbCrcekYkU/H2Q8PW7u3Ba69
	8shUaxk80WbUKnpJibqwkOTg6r4Mu7N+LTrVbhFoR+W+K1DuTFr/j/9yUi3u9I/8HPVp7dfUnY56g
	gq9csXV5GNWzloje1L2HtrZNOPUW+Ku1UXpZmE9iRdjUDVX4+ITPCCFkRSpdE/H1nyfkdcgHeaJ07
	CGFUNJ0nXp8CmTQVf3753vjyLVZvRECTEPPdKYPerLCC9h5fhNvnV/qpIOe5xgZ2LIPFMC+L2+pQv
	TrUL/yESFG4skjF3iF/orbG0by6JEsG+ehHmdtmZDn8cnt90mM7ytpfefueiS/b4XB3vFvox3MFsr
	3GlZAclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLiot-000000098Hy-46RM;
	Sat, 09 May 2026 14:38:20 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLior-000000098HH-2xSN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 14:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5DHpgWy+gsycL6Jjb/J5jIVOU/02oE5md9WVfR3057RJiOyFjgkxUFh16XE7ytqSXI7a7QOQsZOLcnqbGvib2PEzFgZY6q6zE/y3ermjb6SF9JBF3tgxA1igdnKhdJtur9Fook6nDy8p9env8bUP98VT7g7OeOOAnR81nqJ/dZXnTN0tZJ11YyAEUKeX6DTUuZJdtuscQ/IQAJP01b/PaOjh44Odknd2KHxRJs5+LhbiEKSp7VzGUOVl2W7zuO9LM+QtALwuxh9SVUC0o+t2tItWld1ZQIhi3fk2W61R8U5UXqvYDsAdqvhyZ5Xmuksdi8y1hXb0QBNA9lv/1kk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87WZK+0Ki+vIwya2tWprlTatpImM6jAj+om89wKvpKk=;
 b=fzYcn0CT8zLSbtc5EFLpzi0hnJHdSk1yzGnxzcrF+zkE5T67l9NIVTclklh4vVWrTQRsjRVic2YHXENnSxNl/OfhfvZlwQcyTEuifg+fXowcgEEkU391V7IFTPzlTYH4uxwyrUJDic+GnTY9Y8SdTG0V3BeojJ9CFqgEKSpTvY85ibtWj1UnGMPBcMyeqtg72uvn0tyB+uPiJfd6gp6HeRiywBjnaPJGdZlye+bH7t6N32B5FnWNskDk6sW29TfU3ZSmdDrcl36E6xmP+vzdfp+h+jsFSeZpbvjj5ApK1MOACzA9bsKWuQ3+gwo5jVcS82MKKwA+uaz6WmkuJfbYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87WZK+0Ki+vIwya2tWprlTatpImM6jAj+om89wKvpKk=;
 b=tsSci8iWtJtjxdmDELLzL26WSbrk1LgDO4l1f/7Yi1msmxHosfR8QX/NdGHAs+He4vA2La2Q4+HkBJ6CLvIjtrO5z7u2i0Iv/ssq/JpfQccpF1sVPA0dYpuMUQjjJgWmtXEcyWvqc9LmFUFeDt+YkBjp/Ph7CPUheuSvOY1FCHEJpT3vqKdZzTmlhh2gWE/neOMc5omMSMyogoFmZGtFyirmYZNldqrCSkGkS88RH/1YQQZ8naPFgPTJXjNdzWCFPZpW5T80i2LOcez9fcpU10B7+1nv+o9Iu1ClT7u4gS50EPc0hxQFpRJcFzPQcd9hEhynfTFoeNR0VjAg2SZedQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BLAPR03MB5379.namprd03.prod.outlook.com (2603:10b6:208:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sat, 9 May
 2026 14:38:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 14:38:05 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Date: Sat,  9 May 2026 07:38:03 -0700
Message-ID: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|BLAPR03MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c079325-da19-4543-a969-08deadd89485
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: m17AHsT/39OPEuqxtagjXPhYqjaRj0GraCsLQ6IDfMPv5W2FixTBYn+cyzLyZFMI3aZeowA0zjjaZK04ykrRCJOlAwwA46MEZM++23bgcDl5xBxq8d+aZt1EEfkHugmoWGAXjMYY/5NLu7KOjPOkbWyGKLZjGxojsHo5Xq24PYWpvKf4LETd/bldboDNCLt3Ijygy0ycQxMxJzNJr7tvUs8d8Nrwti0/ZXLUAGgEg2IbI1wYDyNiIBHfcqzR9byX3bIOxBKqI1QHk4wGqRudJaFSjYAKOXl7VirfBVfqASuw+mmSGvPj3+Jjn/RvgbmcMGI2UBJbcMzNXzUQUFmJ+820MGG2oXh1VALRnGTv/6uKMPY6Ol1M3dJXpqmNU30NHK6NXVH99QU53WBVG1Y1G4otOwSrTcjGwxToE+cdOxvbxbw8fAja64LpeF5r73eulcH9cJ9gWdiuFewHtinfT8Gga+g4dvrHmTFo8RZrY6sxaEefCnzQQLL7jISteREPHKOFgDpdmElo1pCElN3k+Eu3OivUmV19q74De/ehIW15fBXfDvHPXKhnlhGyjSAVzrrHoinJBXClnGSrZq0QmibAG5IHm+wgso1dLRTUu/FRBi/m2AuAH85LGg3V+jtiQIJnOk+P7qXzdkuk48tx0buUPNn6MeihyhUGssSQJ5SUHeKH5wYpmHImNTvepvlU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qwIcuhLOhgZy2IMlsB8sATb6FtWOZJ73DLM5Y/EeW6zo0CrVQWXTB725d4SG?=
 =?us-ascii?Q?UTxByM+JJ4vA+Shah9IK2PtBm+YQyKFxo/qDxA/U0/XI+UJ+j5dSyM96unhp?=
 =?us-ascii?Q?uO/5EgptwukCc5D7ceXD9lo7ISFWI9vRcVxXaH2Lv1MTr/hh+PivG+JQ2jjA?=
 =?us-ascii?Q?ENUMca4+a8wy4EmC1LUhkykx/Xz4iaI6HtSTZ55+trL+OdZlS7imIIqcLYCy?=
 =?us-ascii?Q?bnU+I5EdRxLUff39K9TSjFsR88Sch4tVLoBO0FVgKcSZwScv2eLF4YDtkmDA?=
 =?us-ascii?Q?J/9l/sXcPcHFZymQoDJ20KsC4pJgE5H0+6C0qkU5M+AuF6cSAuQrsn5vChi7?=
 =?us-ascii?Q?rCuy4BhDXKH6S947nvYBDuY1UC5k1pgb7MQiUQcij978m9Jdd/UyEHajJJd1?=
 =?us-ascii?Q?92e2HEPWrPPSN3kIoBcH65ZPcTvbqbQxnP4VCH6XGvTRghCRXfoiF/qUds3G?=
 =?us-ascii?Q?7ZAYtTBs8Cqi/Idyez6ql/rPWkkftiQPFTNHc4Ev6TEiZPCA2Le5mKpgtMfS?=
 =?us-ascii?Q?8O4a7f520akdqR7GW+t9a0DH+a+/2EVJ+dEaow2EInFon23PMdbk/KEr9pjC?=
 =?us-ascii?Q?mrK2a3P7qp7ij8nDCsHlWxSjOLW4iAGPxQHgb659QsTpvH8saQzM43k+FBgu?=
 =?us-ascii?Q?pZoM6L0eDqAnRJTd9bh1LJJyqgcqjeaWGftJFj88hAvgRvdG5oipAU/tBnWg?=
 =?us-ascii?Q?o1kCvv9wZAo6NetrtGJlQAqA0Xb3vSAyN72TbaYn8uOZ4BgOeXL87Ks19dLN?=
 =?us-ascii?Q?U4Bxvvuw0h/OigADFrKi0MVZWcO2iTJnff0/Ea4DTMCtV4FKvfouPXOXu/d0?=
 =?us-ascii?Q?WCuOsiq9qo8d35j19iEOSyraW89/8ppPkRg68p8COkdAAEWwQbp9anN9GwDl?=
 =?us-ascii?Q?BytD7vrLZvypwQJwDflojgIkSCxmy88L6xToR2J1ewsRbp3b50SbuIcFkmEY?=
 =?us-ascii?Q?Spi20oMkbZkWcCL4lx2rBRs8pnrN1rqVIINyyfeip2kk+d2U6vQwlLqXZXnj?=
 =?us-ascii?Q?qA+bpPyTtz//OJRtjG32l2QAQEVcQ+s+gV/UNpZ3wvdY2EHDJI85NHPgijmz?=
 =?us-ascii?Q?6RXaLKW5BEY3XDWNf69GaF/kLnW+PuxbGAWpkEbHQtFqVTefTKIpFGME1d33?=
 =?us-ascii?Q?YMYErA8oa8wq6gxMUPV6NKwzpXOtNXQU989HNtsn1rSnxV9woBYMQSQocGNe?=
 =?us-ascii?Q?Dj0UU6FyUGUY2iQOAAjEayORtHQdjDO6MemWY4OLLd7BRSnybqttWoJEiDky?=
 =?us-ascii?Q?Ok0wSK2XtMs1ozSe+oJFnLmVwFRxdB2yFL4tIa9seCgU5ZfhXqEOpjWjS6kv?=
 =?us-ascii?Q?K6VtgEFdy/Jc5SS37ToqW/IIidCzPfoLnngBWn5sLDeUbcgakMaswcybKT+p?=
 =?us-ascii?Q?nzyy6S/w9tIHNPHF4P7j8G7i3mXzTVOAOfxrVQ5XyOOTu2mZ5Q/LDrfYZ63V?=
 =?us-ascii?Q?cZPBnzvFGtuHj9P5Dwww15Mo6WusepOQybuxUR1B5CyG7yy/xOAudz+eF6IH?=
 =?us-ascii?Q?U8AY4tzaAyoXxCfI+HrV6b1q2lZ/AYbUjMcw2pVzxPzk6IphAyC8SKyFH1GT?=
 =?us-ascii?Q?xp8NOftpdy+azlr2iURNYAqt/uyWeNv/M2PZay4LkgjDaTg6ZS18uDLZ71pz?=
 =?us-ascii?Q?cflU4hwdZK4qeuYBZpmxp0r+P+UNJ/RJUwVmL1zDHQMStHaGnanRYgAzG7n5?=
 =?us-ascii?Q?WN4IExiuu4pqPhvneM1r48KWKQppfSkQaKOx3stCuUZCCZfnp/2mPAjCram2?=
 =?us-ascii?Q?crNqnUhJCSWE+rkHzfv43TS54mgQ+l3uSoeUZqjGZ7W1/mlMGHZ+/7pN7QtN?=
X-MS-Exchange-AntiSpam-MessageData-1: 3JujXkWchbQ4yw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c079325-da19-4543-a969-08deadd89485
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 14:38:05.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVQEZAeCgiRC0N4ql2chKo5AzLqOmYTzndyXnWUfR+L9AQYVDCGw5UCDckAh2hoLjXrXjAzt6B4+bqEKb3yHtblILw9cy6y0ZEr6vokORHGMFrk/81TNKtG84K2dssI62iG6bc8CVk7WEkZot++Myw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_073817_763453_F3B689B1 
X-CRM114-Status: GOOD (  11.31  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The OCRAM ECC is always enabled either by the BootROM or by the
Secure Device Manager (SDM) during a power-on reset on SoCFPGA.

However, during a warm reset, the OCRAM content is retained to
preserve data, while the control and status registers are reset to
their default values. As a result, ECC must be explicitly re-enabled
after a warm reset.

Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/edac/altera_edac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 103b2c2eba2a..9e6a9786a881 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1186,8 +1186,14 @@ altr_check_ocram_deps_init(struct altr_edac_device_dev *device)
 
 	/* Verify OCRAM has been initialized */
 	if (!ecc_test_bits(ALTR_A10_ECC_INITCOMPLETEA,
-			   (base + ALTR_A10_ECC_INITSTAT_OFST)))
-		return -ENODEV;
+			   (base + ALTR_A10_ECC_INITSTAT_OFST))) {
+		if (!ecc_test_bits(ALTR_A10_ECC_EN,
+				   (base + ALTR_A10_ECC_CTRL_OFST)))
+			ecc_set_bits(ALTR_A10_ECC_EN,
+				     (base + ALTR_A10_ECC_CTRL_OFST));
+		else
+			return -ENODEV;
+	}
 
 	/* Enable IRQ on Single Bit Error */
 	writel(ALTR_A10_ECC_SERRINTEN, (base + ALTR_A10_ECC_ERRINTENS_OFST));
-- 
2.43.7


