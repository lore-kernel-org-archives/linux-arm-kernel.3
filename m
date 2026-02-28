Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FDAFEE4C3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 03:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9NIMNiQVIQHEIcvjT4xNsGeFB39YhiHuR4vKtGfO64=; b=v5SZ1r2lKRacfKu5d2CPT7CO5W
	aBgd6orfeej4VYBkR8NtOLdkgQxS9kx8EOm7TaStHWJwZVxk5Kn2PL+yx8s4vSC7QqVmcRqt5dADm
	PTIuRqIzwKo9TnS2Hw6eOGhxxGS/W+4/0VGNQylgstlMN26AeWETO3RLAYT/EvegDfMaaNO/f+xos
	vxcvGMx48a7W1Vidp7EyI0nZvz6c05jnoeJfIX0sXg78Nnysyt5vsXBXWKAlwsf8Sehc+OAETDP2b
	OeadHaMgUJ6+hHd6918Yb10GxxM2WkRF3F5ITht097htt9rCCrKnm0WiQ9ampaFvUCM+/5Tjyij2w
	sWbnsZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwB7l-00000009Snu-2toN;
	Sat, 28 Feb 2026 03:36:13 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwB7i-00000009Snb-16BH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 03:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFwm3DOfb2EL9dURiLY+PclZm9mQnmbXGxUslqPBKs7om3mPa6Zmx1p4p69VloxlCdWdAwUzqjhmoK9E/AnsfoSGMxMYosuCoThlEhETk2wATy4HpPIM7Sz3SRjOAda6KLZoN7DZnOEId+FdMzTyWGUQgSMe2tVfkpscOpjfUm+J3zCEm31dUCydRGR9dewm3RtH/k+LUVnKpgq8rkTyYeaYG9vhzewzTMNPL68dFFRgGrXY7jMuaiEsVAjAUr7u+DIG9twP4hakN8hK0xF56/0Oo9kk+lX+9GRk81NGyDx5bl5bOe+HS/Vg3a0eaR3XimLvz1FSirq14uAM0lofuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9NIMNiQVIQHEIcvjT4xNsGeFB39YhiHuR4vKtGfO64=;
 b=rS+7Lh2rvI9jIFXubs9Yr7Z4WsrjkSDDt7+iQMJp9VJo92q8tW6FkG8c/ujxCshAzmzXdJOfZkXIJK/uwoaS/4sb7bS1j+hmJ8/lYZorIk4nws9QoEXb2NGe6Sf9sMI8vDcHF5lG6Mfm81EkB/0cy3U8PN+3cnmTVkmYHGptrUIFrhZOEmdiV122Qp2STSrOyBZwXkPc2OR2aRsr6srpNwqEJD76D+BfY7IRQOkpZe47LblWVHsjtpJW//jjTUHuG9Y9QT1IRjEKGaDXxIxRiI0FYbNBVyrtRsqBF5F2e2UP2mKKgMQbZnRi3YppZT0cyUDyEjM+hFQxg4esFkpjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9NIMNiQVIQHEIcvjT4xNsGeFB39YhiHuR4vKtGfO64=;
 b=qGGmB9SyWacZmARtAFjHzZAQ9X7k/DRgne5IY+WvaynFKDwTDJDR6hKF4UoW0Si41eAXO8dm28cpkvmFLZy3VX9x4V+lwpiaD90Yo/njF+iJ9r6/CH4c6wYVxFdBjPEvJ2RHLQkhoVG2/m+viUsyYuZ2lEaz5pr2QTfh0SoEK7G39x9z+whX9SsEgkWfcgrcD3zRzv1JPGApdvh2XVMp4bclipN+b9sJzkFnY37oPSaGJ05u2t8VJXZaaByjJA9ApGwzwehuv8PX2KUBzsYPzvPCzPclbPi9FwHmRLh7QcsYKa0rOZk8OCfs5XHebWpiPa7KzgoPcQb36UTrxG+Pdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 03:36:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 03:36:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 28 Feb 2026 11:37:33 +0800
Subject: [PATCH] firmware: arm_scmi: base: Simplify protocol list size
 calculation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPxiomkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNz3eLk3Ezd5IzU5GxdU0PTFAOjJONkIwsLJaCGgqLUtMwKsGHRsbW
 1ANiqKadcAAAA
X-Change-ID: 20260227-scmi-check-515d02b3c288
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 2364eedd-5e09-456f-5b0b-08de767a7f75
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: eTivlL5q+jHI+ouwJDt/e4eWoMYmg1qNE1tm9sikXP4+j3kqDKCxyckfSnEBXC65n67PONuWIBpH8tuFxR8gPYlLM0irbOD9NZscZ/a/RmU9p78YTjThU/dxEHafgwZtD8fHhzNdg/7GOV5aPOHMG4CmwhUARbuLNkaXh5a88JEOBMhn0xQeCZFvi09PSwHSMvYuo8bfz6D0MytHpNhlFhGN2NkLnp/gdpHJJ2dNxPtQdIBOD3g7tpNc6H2jpVCLhuVIVc9uxi07z9IVVQw+XNUONPPlL0rTZpt6Vmabt4/xJsaJA8EExPsDvt4hUhekmluRLZIinDKAIvpVbxbOswSXNNID3bGgIaNwNlZE3kCTuPwTM19hhfgk6oDeYtSjjoEZy9VvmZtVxPf1iswdimcNu5hT69XwnXKT8r7JF1PD9og8Yp9vnTcRjdN/oJWoNmG+vNbZy+gO8txBTWjoTDHJR6DzuhMgDKoiu+RoAxx+1BKZJD+UCQKaDGAE+FRHt6Hi9YTwJ7g6t5AeNO2CcVc0N6RJgh7OLF8hyQYkql6220bQHWwMKf8+81sqT8qPNGsYl+s9ubstjBvQ7OX8VXcOf0NGetORwLdWGr3xkLVyBaV8z0qVnUg2c0xHIPWZt1sAVJVNrbtXsxWPHMcAg30+LrEkkEOmebupU+zdlygV/JD9w0Ti1gtbofOH4/4fvhNcY5aOuu3oLvpI+pP3hYZd+TCIqIBxI7sfczLnyXIKQZ1OxEp/tednSWiZWRlqrnvNT8z1ksDJapLm2pCZfYyoBmUU2a+loJHie+AtXjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdGblU5YTAzQkRJMDFrWmppdVlsUXFzdEU4SHluWk1kY0RyK3MwTE9RQXlh?=
 =?utf-8?B?cllMakswUzY3MFFwVGpLejlzSWUramkzVEQ3dVBhVzVaL1Y3N0ltamFvU3Ir?=
 =?utf-8?B?VWh6WENLM0FHWUVuVnY0b2xQUlkxTmxNN092UzRmczR5RHVnNmJmSktRYTJB?=
 =?utf-8?B?RDN6c3FKUnZtR05aM290azY0RVJ4V2JTRHZyblZ6cXg3d212SHUyb3hYbFdu?=
 =?utf-8?B?SEtUMjZPeFNiWXdkeTVlNk0weU0wOWhCYWFSWXZTZ2cvZzdtSjBHcXRXVkZi?=
 =?utf-8?B?UVJ4U2RjNkM4dXlyNXFnc1JHU0p3R2toMVVQWCtwZ2ZkdnQrZWVzU1Y5N3FK?=
 =?utf-8?B?cjN0RmZkMW5nbGVlbTRHdTdzZzNkS3FpQnR5MmtkOWpnK0lMRmJxYTZsd2VG?=
 =?utf-8?B?TTNNc3dLVStwbEZndG1KUEJVMUhpTkU1RXVneXR2MmJ4ZWtKNXpubXBubXBJ?=
 =?utf-8?B?bnpRZXM5V3RyZEd2VGdqcWZoQ3BReUZEbGNBaENXdlRoSTFWVjFPUkhLZklN?=
 =?utf-8?B?WnQvMTdJcW41NWxnWWwvcEd5SVFZcmQ3LzhMVks2TGw0bE5zT1l3N2FyYnRN?=
 =?utf-8?B?T2hXaTlrbWNSM3ZZZnVTbFRXeDEzYUxPZnpIMHVrbCtyNEVyaTFNTVJQbFRC?=
 =?utf-8?B?YWFtV2c5MUsxb0crMWVwc2FqeTFUbzVzMHNpUmcrR0NJSHkrbG1rakc5dmdJ?=
 =?utf-8?B?MkJjT3ZEaG9DMUcraHBsSEVyL2ZrZjAyT0xTeVV5OHlSMHJNL0g1aC8wNHB3?=
 =?utf-8?B?OFNpUWpUN3RvWm5VS0xOQVNxbjVSeFdhZkRxMmR1SlA2TjNkbXVaMHdhNXgr?=
 =?utf-8?B?MzQwRzdnTUUyMnVsRngzVThHcEhxRzNMREg4MUlSM2hiSldXUjNJNkVSSWVS?=
 =?utf-8?B?ZUpEWTR4RWp2Zml3UUZ3SXJVb3p6c1hlTlJGQ0xXL1R3Q3Q5NUw0Qms4SzBK?=
 =?utf-8?B?MUxEZGFXVGx5UTVBa2kzdGl4T0RmL1RzZ2hLeE5UTnlXM2dsMjJCdWVaQ09N?=
 =?utf-8?B?RThRTjE2ZTVEb2QrR3E0a3ljaUQ4eEV5ZmFQRTdnczVsV2wrMnpIenZ1ODJN?=
 =?utf-8?B?QzlGOERTWmF3c3BTMG1YOHZ3Z0tmOFVLY0JQdGhQTmlTbk92Vk1RUkhlOFdv?=
 =?utf-8?B?by9mOGVCOHRENHhndEtYVk5JZmdnVjErcDRnQmFYaWZvN3pNNkhrY3BqOVkx?=
 =?utf-8?B?a1BHVEpPb3ZrQkxRVC9tQm4rYm1zSEVnZnQvQzYvd1V3UFJrTFpjUSs1cWFP?=
 =?utf-8?B?cEZLa3JkdFRRanlBUHU5MnF6RDRHZkM2Um5tVElCcnNpUnpQWlErblIzVUdi?=
 =?utf-8?B?RnhMVjdDSDdDa3VvcW1wUzFvcWJDSnVjVG9vSkFMZUlYZzV6UDExWFNtKzha?=
 =?utf-8?B?bkVCd0VLaWdzZGVid2tFRklJamRURnVKOHcwdzIwMGoyUGtNanNrSkJwelRl?=
 =?utf-8?B?UGFwRnNPSTkzcTJpQkZXRHNNUmVrc25iRGV3MDFPRTVUSWdUYVVTZGdGVmFr?=
 =?utf-8?B?emdOb29UMk02ZU54aThCczBPY0dKNXhZOXk1QXhVWm9kblNILzR5S1ozSjhS?=
 =?utf-8?B?K2dRNUtFMUNxUWVQVVVVUkNPSEpBWHNiRkgwWVRjMW5HMjU4MUkzS0NhTVVM?=
 =?utf-8?B?RjFKUFdIcDdPellUMWN1UkI5Z1pXMnpQcFhvdkxuVjZUcGd6cDNSQnY0V2xQ?=
 =?utf-8?B?TFhNaHFEcXRkVEtGUUU3Y1N2Y0dzMXZlc05uanp2QlV4K3dXdXl5WUZWSEdn?=
 =?utf-8?B?SWhUdlJmd1hxNjZGeVM2RzFSeDZlVGRnV1UxcUJ1cHYrcm12eHFEbHcyT3Jj?=
 =?utf-8?B?MHc5TFJwWVAvVy9MTkNyUTBPT1EwdER5T2h1NzY2MGxFVU9xSjdVNjdDZmlP?=
 =?utf-8?B?b25NZ1ZMOTc3Q3JMaUVFM1V0N0xpVmNjeHRsMUVlQVNVaDNSaHJkemIvMGxl?=
 =?utf-8?B?c0JuRlJKRjVPaXc2N0ROUWVmelRJK21ZK3ZjdHdpeEE2YStqYTN4ZTlQZjJ6?=
 =?utf-8?B?VjVHSlVyNEo3Nm4zNHFLS2UvOEx4ODlQWW93UUFpOU1IeTFlSXJaWjRoTkpO?=
 =?utf-8?B?YjB4dU1Zc3NFWUQ1ZXVFeWJua0htUE9iMDhuMVpLZzZGME8wTnZ6WS9tREpm?=
 =?utf-8?B?SUVSN3hyZC9EUmg1WmFJc1JZMHZtWUdWcy9GWFlHWm1NbVhmbjU3TmZ5Q3FF?=
 =?utf-8?B?aVpvZWZKSnJKV29iK2ZCbzVWeis4T0dxVUhUYTQzVjF1UktRRUpYTkp3YlV6?=
 =?utf-8?B?SWNaZXZlTW8xdlo1TmFpMmMxZWtvSEJwYmdVcHFHRis4dnhENzMydmcvZVZG?=
 =?utf-8?B?NnhEaC9wRnVxMk9oTU04M2Q2aC84eXBobUxhb2JrODZ2d1pyZ3hMZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2364eedd-5e09-456f-5b0b-08de767a7f75
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 03:36:03.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XihfCCvdGnNeoiblYpAESApvHZOAYjOAMTlUd5CaDbSBTY41sBtExrkWkFwfooaefBHlVQ+g+K8ZKDOyWgCy0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_193610_666267_CA04D02C 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded round-up calculation with the kernel's round_up()
helper function for better readability.

The original expression:
  (1 + (loop_num_ret - 1) / sizeof(u32)) * sizeof(u32)

is equivalent to rounding up loop_num_ret to the nearest multiple of
sizeof(u32), which is exactly what round_up() does.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 22267bbd0f4db9e244480b3b9a3b5669e92d82c4..cd1331c2fc40355b54716d4b4fee69b017d3817e 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) "SCMI Notifications BASE - " fmt
 
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
 
@@ -219,8 +220,7 @@ scmi_base_implementation_list_get(const struct scmi_protocol_handle *ph,
 		}
 
 		real_list_sz = t->rx.len - sizeof(u32);
-		calc_list_sz = (1 + (loop_num_ret - 1) / sizeof(u32)) *
-				sizeof(u32);
+		calc_list_sz = round_up(loop_num_ret, sizeof(u32));
 		if (calc_list_sz != real_list_sz) {
 			dev_warn(dev,
 				 "Malformed reply - real_sz:%zd  calc_sz:%u  (loop_num_ret:%d)\n",

---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260227-scmi-check-515d02b3c288

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


