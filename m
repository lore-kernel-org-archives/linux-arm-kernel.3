Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1153FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dk0rbNW6Fxl1MjITLgl5UrHBhTRzuW9neWQBfgl2jbo=; b=Qmjoy8fvX2jrOSu1+Dw4tmQa+j
	yvApdKCCFNsCtaaqjdrOK0Ksgc4vb975N1VUBw+pWcGT69cSIvEMO/ZWkSf8nGtbn+2e5DTc4GAbi
	Olhs2S/LGSQO2ChYzeYfrgxBd1OOPiUurgcds94Xj/xQSvWcqQqtO62uQsZYb9X5BEU8jJVGoaLr2
	PTcZoshJiQkg5mHo8ayZGchJ3+LuuOEPJcUe9wPzM+Wg8ihahlzdm1Otz1/QJPmgZXEkICal7FokE
	/bADmlFjD5e7foyHvKHQqkpwFXrUsfC8Sdrh7WcIL2AgcBo4BQ1OOo0ju4vol1k2ceVK2LrDABIt4
	jbFqNH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMX3Q-0000000Bgq8-1QtG;
	Tue, 03 Jun 2025 19:12:08 +0000
Received: from mail-mw2nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:200a::600] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMX1F-0000000Bgaz-14nE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 19:09:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vap1qwLYNhRvSPvNrPhnQ8V4s9Y3a3nKmXQ/szCpLs3KcCMNC11hg9bxirXdvE+fMBSUwTTEG+ueSoDPzXtreFQPJZjEpTRGkWP4MPbqGGFHw0GRAP54JErel0KYQG9KJSAeoOp4di3vOy4bPeReMrgqKPQrUqRCNQ8uqxrEQTFn12p0P3+vI5oOt4IATsk3ooww3FadpWbpg4V4y9qAPLOE35EBWwr0wa2uV2wEGbUl1BxZ1ELMkznRhKF5pMEXkUS3FLPUtQNfitoTWq+NLSFww6d+SrWk/AxGL/J7FgrI0/QamrlbmSzIZFcurB57a383RebJrSdVj21/1jZhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk0rbNW6Fxl1MjITLgl5UrHBhTRzuW9neWQBfgl2jbo=;
 b=tlPV9+jnOkEzL2s443DcSLjnLKVG6UCciAGG+dCYNFp3QoM8n42ZQ0f1fkvjZlanQVnvVabz9s8Q9P1LsDNKUo72QMguT2D4EIOx5/Jk5wdxlBOZYMW5XaG3aJ2xpIIS6fgaSpsx4gIjce/73XMcj8AlmAeYXvYV+dD8SDfNNMhbb8rvLRPTwBEmVkQJl6FkshyI45rXqpLepw/5yPcz1Ah1cZw0JjUVcPTh2PqOr7l42sbTk6u5t7Bx7fS5RvlyfXO/obh2MD7uZwaOBN4Kkq+KYnapsJ/Jo5+7zzTBfWoWzyF/6kxgJPVJtJM3YRo1jDvlAwmx7rwy3fjNT+DXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk0rbNW6Fxl1MjITLgl5UrHBhTRzuW9neWQBfgl2jbo=;
 b=4TzGxLthfv6LEgJQMzGali7W0CUqHlHhDGvcVGq8HfOOkXEPkc6feuv869DCdnuvVcF9Jkw6EKT3Y6aHkgyTLGdcuOT8nvfQpeZjZ4iMTWDfrbIwXrJT00cRBN2/SUTxKp2x449tOGBryP2123rAzje1AWkCBoZNGPmK1sP3j/4=
Received: from BY3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:254::16)
 by SA5PPFD911547FB.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 3 Jun
 2025 19:09:49 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::cf) by BY3PR05CA0011.outlook.office365.com
 (2603:10b6:a03:254::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 19:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:09:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:09:46 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 14:09:44 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] usb: dwc3: xilinx: add shutdown callback
Date: Wed, 4 Jun 2025 00:39:31 +0530
Message-ID: <1748977771-714153-1-git-send-email-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SA5PPFD911547FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d8e1f1-ffcd-4272-7c34-08dda2d235ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H8ydWNuCdqVJ8dNa+KGSM0KqSX6QlJ3XFxkwsa2mK11l9ooY5iN1j/irgKgz?=
 =?us-ascii?Q?C9NlB6fAyeRngPayUkiqsxPppSmiuwbyQikqz2mD9bX3n3GSl3HvWKumz5FR?=
 =?us-ascii?Q?CUPHl/HtJgBn42iP+DvRdEP3ySGWUOSHEijgoJmQTg9McRaYuqubyCW7XX7/?=
 =?us-ascii?Q?I4n8LqbMUKrrvLefm10aoZ+vO8dCkFeSuT/khgt5zGVvYF1lXr3EiCyf54wB?=
 =?us-ascii?Q?IpMUeCnFd0jITk5HJA3y7VugQMBs/FdDQYW3RAVk9PMUm+Xhx/GdKCMyrZVY?=
 =?us-ascii?Q?W8RQFR/j2I7yIahuNTGLd7Dt9+INmsjO3OQiu7venPPoGn9lyoPElCPrWaka?=
 =?us-ascii?Q?520bHPK/xnr7FQLoGR8U1f2CsytbttBXVq6RLgh/srBRbF83csPweWfcsNF7?=
 =?us-ascii?Q?JltPORa9YgR6QH/RuJfmutcjf4ykxcNqAFoejamUZymZXabl3Iv0kQb/ubKv?=
 =?us-ascii?Q?jF5yxWDPECnxcxH26Ckiz/5aSWfDFNL/3D769SyJVJhhzmcW5jbq9LLyShkO?=
 =?us-ascii?Q?llVf+OFtSCJ7vPB8Fixy9YrBt+dLzLYcsz3B26pEKqUdJvn0kO29n9IWHxeo?=
 =?us-ascii?Q?y2t3DNJwPV+Bb0pPR65Z5wh1hRAnIEQKanxTCW+VO46nC2zCjklY6lnb/BVl?=
 =?us-ascii?Q?w2flgG8GdKvB3fhyd/s8CbN4nRVPFXJu0VltmIy6LH8Ax2M4Ub4U6x2WOrhs?=
 =?us-ascii?Q?mIyeMz5UVjLRhmGumF9dobzkm/vItOuYgh0qeXjR1GWLZ+Xhy107uVXsD1zl?=
 =?us-ascii?Q?6NoQsggOydzEZweYApPipWFUZN3D1G7lNcCI8DnVj445jGKfbJYmLJ46ZJjT?=
 =?us-ascii?Q?gSkAyP8qKaCHGOsDZ7ni2+LYUlJUaa3zWok7bmr7YGLZ3j6mAqaUkbbSVaVK?=
 =?us-ascii?Q?WNv85+4F/L+LxzSukzKVS7T6vTtoG0buLPa2xk2DLMXp62FrDDcp9FzK+ve7?=
 =?us-ascii?Q?qGydcSiBGoY/pV5rXRtNGAgLtwue276uyrtpwUf46xt2m68rKkPeT884HCC0?=
 =?us-ascii?Q?ENcKiF/rfFtsf8mY7rNTlXMjFxv4nhnoi1VWgONoPMlERmvHsdfTfRQubZCm?=
 =?us-ascii?Q?IqSwFTssE4OLrfZSdn212Rlq3VFRKkVBlAoFEz+RMzqTeq6grzG42eENUhw4?=
 =?us-ascii?Q?5vtsG/U2zbYo8lHiRh9fmsfhxv0S3zfYUYWKMbysJddEaEYQwL1UVI6h6AmR?=
 =?us-ascii?Q?9GIc9FNDjebwed71rrGlyQMzxP2GK8mWcKyrx9h0mWYKjsglYVQeWszqN14b?=
 =?us-ascii?Q?AowIdO6sEBaWPy9t1Omcr5EHmFC4EocJZcK8LZQmjVjwQKasFLujDxX3BnOY?=
 =?us-ascii?Q?Hn7Nokqef8c5Z5HNrz3D+lnH3XwYB2RVhxz5OkG7BxBQvMkjnPHCinpRkWC+?=
 =?us-ascii?Q?lnHnOLpaVlBQwwp9G7bXwfqGgvNDkvtDpyMPLE8b5qBTaJvBtoEPjLmavvk0?=
 =?us-ascii?Q?nnZy/49rdWPCunHK/5U+aC64oPIqvUe5Efbd38WuUukPmA7t9D/DVxPcGKA+?=
 =?us-ascii?Q?xj8n2d2x91sG6Q7gUVpymJ16eqr/B7BnxHEI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:09:48.2944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d8e1f1-ffcd-4272-7c34-08dda2d235ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD911547FB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_120953_293270_FCC064D9 
X-CRM114-Status: GOOD (  11.86  )
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

Adds a shutdown callback to ensure that the XHCI stack is properly
shutdown in reboot/shutdown path.

In kexec flow, kernel_restart_prepare() performs actions necessary
to prepare the system for a restart and invokes device_shutdown. To
ensure proper shutdown attach the dwc3 shutdown implementation which
mirrors the remove method.

$ kexec -e

<snip>
xhci-hcd xhci-hcd.0.auto: remove, state 1
usb usb1: USB disconnect, device number 1
usb 1-1: USB disconnect, device number 6
xhci-hcd xhci-hcd.0.auto: USB bus 1 deregistered
kexec_core: Starting new kernel

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Referred implementation from mainline commit ' 85e8a23936ab
("scsi: lpfc: Add shutdown method for kexec").
---
 drivers/usb/dwc3/dwc3-xilinx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 4ca7f6240d07..09c3c5c226ab 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -422,6 +422,7 @@ static const struct dev_pm_ops dwc3_xlnx_dev_pm_ops = {
 static struct platform_driver dwc3_xlnx_driver = {
 	.probe		= dwc3_xlnx_probe,
 	.remove		= dwc3_xlnx_remove,
+	.shutdown	= dwc3_xlnx_remove,
 	.driver		= {
 		.name		= "dwc3-xilinx",
 		.of_match_table	= dwc3_xlnx_of_match,

base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
-- 
2.34.1


