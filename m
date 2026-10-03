Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB6DCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7Q639nPaMR4/rFy+rFDmOD9e0iJzjp1Tg6zqZRD7JY=; b=X0l3Bdg/0t2ZlqWN2wqgwuz8kA
	gFF4FCFLxsMc5Vqgj6Ztd1+qr9Pai7wJV45R3vTcMRoECmpNayQrgc6EBWPDjXH9hTKtdRWTSr1L9
	XtUG1mxk9/ZfLSs1YpWnMstgEEd0ySg6t690TZNBE321mYuyoZrCo+jbJQSgNjChYztoJaxFo0rqw
	ADN2IbcKfOztFG8SS2A0Y7CSMs7zFGG+o0rdpSYSm1wyJsPU02pklt8RsTRMFsDncrXNpUydEMDwF
	ALp+MbgpQcCTMsl5DyckrxkrXE+tzPqDt+V0jtm/TxlYRh396oK80bRFh6c6kuAlvqVViZW+Id0WE
	Z/XgvIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyZb-0000000DTGw-2ZcL;
	Sat, 03 Oct 2026 12:10:39 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyZY-0000000DTBd-27nO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 12:10:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8GKetRir8+3vjAcK/xRNHogKiq5kCUqkL9LVAQV1xarTDwB9v77SOlwoeFJ37uDMJceLdhvUgmgyFdktprMczXkMLyO737H9Y1v5O4h19LiEhH6c5M8fUaLH6cgHEpuwmED3LCR+yUJPtk3nyS0aLkFt+bgu4jcHbGz3qLpNazwvfizn01obZ+W+uFY8OjWVVGAJ8a4QoUNvOO/EgxbwJ+h3A0wogQwJ2T5T07QW9Vku1OJtSI72nQTXSSWgyXh1rjOwFwXe0yPMnf2cSZKBYKXPrsoD+EYhTTvpcfgJ0G4GnKYXnU5hDcvz5wYYhBEaMhhStQ3ldAQfGCQPZn5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7Q639nPaMR4/rFy+rFDmOD9e0iJzjp1Tg6zqZRD7JY=;
 b=PgtJ4Il+1IRp8tNLkgNBauhdtLMrNhyuc8dhoRUmVdrXouS/mCXQJTsJmlnveIyVFWBLQoM8B0mPB1Aqfv32zE+tS7vwy+gSbGrrKUyg39W99K41bTjaHonXFc3KpLceFJX5JOAKztpdwrOgmKJmxMcwX78AhJHqOQa3OPoMkDrZNAKE/U7A4ZFlQNCaXp6WjLrRVTB87EiUGHnxKF/BCxIqBduUGb0CLqubJnA6L1ZDGa87udrJ9T2gvYqY0UKEtxo6nMmFfKz2guXgQ5kye/mhY6zy8rcGiLp9FyJtHf46Rq6b0Y7RGe3JQgbDErwedc3qNZLrQHoxS2K4aax62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7Q639nPaMR4/rFy+rFDmOD9e0iJzjp1Tg6zqZRD7JY=;
 b=ad0uGwSHwX4Uk6M8Cfl3bG+HvmNKQv8jzBiByJEoXLO9V7hA9B2U/uHT/U+xD4Gr1qdU7NZTpp3Ssp/7H0QK8zwepG9l+7y9SIuKIecPJPqOhrQDgoC/+i75M1Sy48LRLg/TT2ZLbZoso1IRV5HKbjQPwqoCk7f5Fw5Mm9w2vy4wOZl5/gzqKwJBjpJYwAJhOYoqz8J7C9xCfP8097/JGmDhu86m/SwaNno424VxH+WVo08bubg8J+D64t0sytu9D8c6K0x8Xg1FHiqdnjxY6dA2InvLv23cvJeJ+XG46HcWeKhpLhOLNPmGtv10aDgybEtnawtZgRwZOEWmBesDRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:10:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:10:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:51 +0800
Subject: [PATCH 9/9] gpio: mxc: simplify gpio_set_wake_irq() with
 irq_set_irq_wake and assign_bit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd8d694-7008-4a05-023c-08df214752ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tum+jrybJWN+3uANo4DjY+FeIu1nkByz8b/iPlpWWemivcxzb9CdujzCbLRFis/7a0RfH20iuK2Os4cm5Xhsyp7I4ZEs5YPwsNe0WeNQR3GtViSIYWmP1EZX9edG56SfufdCsI/tRWks5/3VeJ27plribcdETYZrjq7u5LDzFDzuazy08Uh8k28g3PSBGPNgg3UjhasmxSHFBEgqXw+tnJhjoqZqX6b53ggfVnrPV+1drp789ykzeB0PjYOqIUFqTGmMvbvdYo30WaqSlmbvL4Epet+lU0nphd1WcXVMC2E0JYebdlOcy/CK28UnrKCO2SbgV535BL4pnclCVJPMRLr8m27ghXiCYZ2lYSfRfdNeT8JnYYjqTZtV9dEbM7uaq0MtfzvN4ZgLTepniHfDOfdFyH6ByDT6E25sRzEuM/v+q9Q0EEmE6imZjoD0Hyp/KRVA/iub9dOkr6c6MOJyl8xX8ldsPC2hhz+CsJkaMgD/wMwIcgMBTZ8a9MXuHxCj1VECZHkTF9xrnuBUhgMpKJooF+CjCNj27qGm7Ag0QSi8fXbXco+Gd7IhMleiOAD850G1LA8aPv6lmfPgVfUqErgxLBenCGWhuE5HZbgduUfRFyFQtITeHvnc8atJkii2jC4gNT/Gr5wxfoj+rHhkGxnZ8mLpkdM+VmkgCcNCX+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDR1Nm9WcHp6dEpnanNZZExQVXB6RUFRenU3ekg3ZWxZTWo1c1YrUkdDbXZD?=
 =?utf-8?B?MUdRL2NKaXNVaVFYTjdhVXk4ZXFVekYrN2dzSmFJWERFQVdGYVpGYTRZK0RN?=
 =?utf-8?B?MXBlVW9OM2d1UTBndXlIdzBzeGdaMWhMbnJoWDRha1hBQzdGd3BOclFrT2xJ?=
 =?utf-8?B?YnJFbThzRXRVeEEyajBzdFVrSGxlNG1zUDlWU2hnbWUyYVBCSGdCQTBRbWVY?=
 =?utf-8?B?eHpuanBPWmo2Qm5mMFk3VTNBRUtiZEhleno5c3ZiUUtlMjZaMUFmSDNEdEJF?=
 =?utf-8?B?YWRJdldzV0RaeVZUN1pUZVI0QVVlbE1TSE54K041MFRCa0ZKQ2NWZ1VNSlhw?=
 =?utf-8?B?b2Y2UVRDZ2k0Z1pNOFFQV05ERzB2TEtBK3lZdHN3eUlwcFQzdzdIQUFmQ2ND?=
 =?utf-8?B?eDRpZ2w3dDYvMGNyVTBzeGdudUxvSTNVbzBNWGNPNnM1czZ4WGo3TW5VOGxH?=
 =?utf-8?B?NzdlUmZ6L1FGbUpYaEhJQ0YxeGgyOU1ZV21FdmNEdi9kaDEzTXQ3cG53NmdT?=
 =?utf-8?B?UUJKSDRyczB2bkpnTU0xNEE1V3FHdkJtaThKQ1Y5Z2kyVGtLN2ticzJLMG1Z?=
 =?utf-8?B?bXlJQlE3dllPampZNG55R1VoeWlRYXJGN1NUQmkycVpxbENQbU55c25renN1?=
 =?utf-8?B?Ly92dWdOOVl2WUpncnJpMjhWd29aNkMzTUdNMUxhZFFOUzhBMDdBS2JSdldt?=
 =?utf-8?B?WHRFajlEQlMxV3Bjc2hhNTFJVm1SajJQcDl0eXV5ZnovWGhZa2RrY1JpWDM0?=
 =?utf-8?B?cWtXYlpBQWhWRnYvbnU2UlRYMUtuNUFDYmpkbUxlcGp3WG1mN2ZEd2lhdE4v?=
 =?utf-8?B?Z0RmZzZSakJ2RDdkU3pHdmpDVzVaSHNJNm1CL3A4NFphRUk0N1FBT1dWQ0Ex?=
 =?utf-8?B?cUhsT0pCTldTd3Vjd2EzSTR1anRTdmFVby90M2dnNU5tODBUcWh3dmhoR2hC?=
 =?utf-8?B?Y3FldERNWU1VRGFUTGg0M3pIR2hzNzhPbFYzQlF4UkxSV2I4MVc2VUZQMnll?=
 =?utf-8?B?cUFubmZwQ2NDL0tQQ0hIRldPVERVNzVFcjFIakxrdHBpMC9rWnFYdDlxRmMw?=
 =?utf-8?B?RlVQU1E0TEFLTXg3cmJLM1c0Z1lmNEh4aFphNXRoNFZSaDdOYkRWMkwxOG91?=
 =?utf-8?B?ckIwVm8vMmpzMkJKdVphekI2MlZsTnJUcE1KNk4zSEhlOEg5OGJBYmN1RFpk?=
 =?utf-8?B?QkVlMitoZ3pucDhxZTgwTTZpY3VUQjdxRzhKSko3dmRlellET0ZNUVB6WUtp?=
 =?utf-8?B?dkxFaHJGMDg0LzBCZmh6S1JZdGRPSXBwTnR5M1RJczNTeGtlM2huSjZDTWJM?=
 =?utf-8?B?UlZoVzhZNjVqbTMxb2tkaGRTSUtIN0ljR2VOQlNJYUNxUU1STFRub2VXaTVq?=
 =?utf-8?B?cmM2MXNyY2swRVFGU0pqbEVlWFNuM3NTeHZRTE42WTZyQUxLQ0VYU29NeFFt?=
 =?utf-8?B?cUFMS3lhMmtBODZMMkhCSCtzYUFLSjBmc1NwdFZXczZmZkxyZ3owaERUZmhN?=
 =?utf-8?B?UHpidDd4djBCVkpubnhHVDY4T0RrbDFmQUVmNUZRQ01rVGk5K1gxTDRvWklB?=
 =?utf-8?B?elNhOWsxODU0NGJaY2VUYjYwRVR5OXpsNDJOYU9RbldGMy9OMWFnbVQwYkZR?=
 =?utf-8?B?aFBQbXV1MTRCUjB3dm5tb2RXMkVaOUkwM3VNTlUzUWowYUpZajJzdFFvZUU5?=
 =?utf-8?B?RDkxS2xsTDY5MitOZkJwRUpCc09RSG9udzhSS0FzWkFlTWNzVzJhelZkWVBT?=
 =?utf-8?B?eENGeDYxcnVBWGQ1NUswUHRRY1VNSVVoY29rMjFNS01QZmhLQlN1OVczQVlO?=
 =?utf-8?B?SXlyL3hwSEF6M05GeVFwcXVyRmxEWlc1MGlOZ3ZpcG1WclVCZGpvc1NpMmQ2?=
 =?utf-8?B?T0RwYnFaV24vNkR3bjl1VDcza0xneUVkWkRCVytKRjM4VHVHMTFyOWZ1SkZQ?=
 =?utf-8?B?Y29leWRyNVFRdkF5SzdVYjViMnUrQWJ6cHZiaU02Zy9Vcnc0NzVqcGpyNkMv?=
 =?utf-8?B?QmdJczNzdjlzQmpOd0lVYzlEYW4vMHAzNnNXb3F1aGhZT2w2MDlzV0lEeG1q?=
 =?utf-8?B?RmdSWWd4UzFoUUplWjZyMkJ3ajhMdEZhRUZYS2h2bWd2dFE1YVJ1dDlrc2lm?=
 =?utf-8?B?QTJ4TTYvQlBTbDRiRjJmZmZuT2d0bXpWdU16V0QycHNJMkpIaGZTaUlSVVpD?=
 =?utf-8?B?UldlekI4WFZJUXlUR3RlSTZ2WEVBVWVQQ0hyaTFBVmNCV09tTnJBVTJFSWo3?=
 =?utf-8?B?L2J6L1RsWGlYRHcvLzBucmxWQW1EL2xBTnNUZFg1RHUyNy81WXozL2RCVlo3?=
 =?utf-8?B?b2hQamp3SXNML3daOWRsTU9kZ2VITVZISllML0hXYnZGVlhkeGgxc3lKSmxs?=
 =?utf-8?Q?Uy0CrXX8ksuGZYdnWRmRuSmRIuLbX8sXHj+u4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd8d694-7008-4a05-023c-08df214752ce
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:10:32.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi0wKcCkFfZ+DND42TRQQ0bGcWFB8+LVOs9letjrdHnzQLkveVPEDnVEN3XAzhQBNpVB0g9kXzPC44uC8uUfSfOHwCixzoJHf4823e6yr394Njpn7iyqMmHVg5iBlZFa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_051036_578163_DDDA90E1 
X-CRM114-Status: GOOD (  11.17  )
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

To simplify gpio_set_wake_irq():
 - Replace the enable/disable_irq_wake() if/else branches with a single
   irq_set_irq_wake() call which handles both directions internally.
 - Replace the separate set_bit()/clear_bit() calls with assign_bit()
   which sets or clears the bit based on the enable parameter.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index bf1207f30460..546a46857e1d 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -329,21 +329,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	u32 gpio_idx = d->hwirq;
 	int ret;
 
-	if (enable) {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = enable_irq_wake(port->irq_high);
-		else
-			ret = enable_irq_wake(port->irq);
-		if (!ret)
-			set_bit(gpio_idx, &port->wakeup_pads);
-	} else {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = disable_irq_wake(port->irq_high);
-		else
-			ret = disable_irq_wake(port->irq);
-		if (!ret)
-			clear_bit(gpio_idx, &port->wakeup_pads);
-	}
+	if (port->irq_high && (gpio_idx >= 16))
+		ret = irq_set_irq_wake(port->irq_high, enable);
+	else
+		ret = irq_set_irq_wake(port->irq, enable);
+
+	if (!ret)
+		assign_bit(gpio_idx, &port->wakeup_pads, enable);
 
 	return ret;
 }

-- 
2.51.0


