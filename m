Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1562EC44527
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPaviEYsrg4Jez7DpeSaEVoPGKx65krDGLIabANxkJc=; b=PBY35yScssMt4BGgjPGSjCLr+D
	iqZuTtw7wMw/c0ErTyqiBtQEcYp91dKLuCKOgqz3fK19aSVT+0oV1LRDXgruOZXTtnYw63iOljLBs
	hN9ihXACzvP287DUd81hcDVr4WDqSKZNVvIRsb/jp+RKg+dIWn3GVlAN9oRqXptKren/pn8tJj39C
	KSFNgbkXrXFPqmJek8F0T+QUshduOS94cs9tQ8i5UE20VrQAdbzJDEYC5M0vQXN1qpUKD00E6LSih
	Ht1T6sVohxPkKHhlkTDmUEF+PlGn7Z5Ue30iLhqx7twUKdruqtQAiqZQHzXKL7oWXkvW5SNYXkyN2
	S0uEjdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknQ-00000006Ozy-3Nuf;
	Mon, 20 Jul 2026 10:00:24 +0000
Received: from mail-japaneastazon11012018.outbound.protection.outlook.com ([52.101.126.18] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknD-00000006Omg-0Fkg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohQLwnUlVTvrXskcoXqguaqK52iCuxjmIbfnCdgdOj2oiZTWqJHhbrqHoE1AaONKvfdH+Kn3Hj0J+AnRhOxe2nWqaZ59oIajHypTxdsjp1Ug4SAD5h+ifKp7T2IpLsgWAswMX5u/3GOy9i6hNBTu8ZxpSYh6qGil0EkSQTasc+HjPcyp+yKO+4khVd5ivDBgFxPgWX739UMKaVCfYVgChulLWj0QDwU4tRot/t6oF55Vxd7/JV+csHwxbmcoFe8Sep0g47VvzHcFgqX6VwSQksDSbNUCDbNRFxBI/fxB0OiOxMGyX8wDOOJ4Vj34FX29j00XlC6wnVmn0WbeKTQr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPaviEYsrg4Jez7DpeSaEVoPGKx65krDGLIabANxkJc=;
 b=cUzmnqsBgYMXTHWLJijhxjm6dNbu6YfdoFsZpi9cS7VL0nKGdoM5McJJVWCyktlDCoo7VFnnJxI5xKJSykLGAPHqk5gAn4eLPO3/63LJ3EWg5p1AQ/ijt5GQnC90Zt0RcA/qwGAmaoJtlmXmeuLgCy+aWJNhQ07/aLnp2YXAnpww5CMin21agscJErCtjz70gOl91aVFGQrY/H9fxx6eSJlDYvJv5nhaibtL0idQFfgk1eIcwiDTeVyiaLVoqmaRYQ1r5vzqPOsKrCNBCgKfdGLKLgUKdYAeKn6sb55/7K29RQD6OVMWv4bPBLajuCmAmZXr7FhIHvP+SIDvgh5tEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPaviEYsrg4Jez7DpeSaEVoPGKx65krDGLIabANxkJc=;
 b=L+PP8evEkuEFhzIZTIRsunC/4hXpWdhGm4ouAPffXEPXkiWyXuPVGERDO4lcrLq/Y5m0PGcEHFhx6zJ1lnoOJCekMalPPM0+L3LU0YQjspFsBBmtSqfK4XBhIjpZFnCvuQZAu+3noPfNuLz4gC5kJVRtHxWkdloE9wL+qofUttB7vJ35uQPwntzgGICS7rVhROGyj9vqz4W/tM28L6w0xARkS3WPbeeXDAC5/ZIhxKEjXACICoyRrSrjSWo62QJyR7kgf/WuwKeLK1Blfu1CO0ZPo0y/VBYPkLhs7y7WTebPDFPgmjVGAOkVXzaoXf13hi/iHsOdQNsZTOHQcH16Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by KU4PR06MB8458.apcprd06.prod.outlook.com (2603:1096:d10:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:59:48 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:48 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org (open list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 6/7] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 17:59:12 +0800
Message-Id: <20260720095920.542801-7-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|KU4PR06MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a4d566-2977-47d2-7c79-08dee645a235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OQCkiZ+R5wBOzcUeXx8RgcWDYTWezZtMVFLSrjFKSw4IgCTHpbUMqgr4NtxOAPoBC+UqBqTxGPBR01M7o0dGKTolWkzijAe2aUx4M26LzCr1y09tqNY2o8WVSZ4kJ4e0YQlDPb/uLagI+9ZbhEb66AwywYcsNSqWrlHUyCDsQjFMJef1TFlGq1S3Fnjj+JzaZHwV/xTNUAv8sG3Ay2mg8weTr309jl+/nrH3OagUOWrOgCluFrdbcSLYP5CplI5KumBhQ3ehjR8BSYb0o4uI8JwWOD0VV97v+BqIsJHtp0rdYR3UBXl0gfp06jwQoKVVg7mmyHcLjq+w5re4BUehvkgRhSq6AuvXEFvOzY6HfWJbYb4BZi7H7bVsJQzwongco1suCzUazOIYyyiLcekBlnRQNpnnXGzX5jwOt7yU3nJIzMMN8ldju/P9J8qZ3uvFAXH5Xb90YPf+b4V7ul6q2lzZysGiii0gZ+EEr/hl6W0x6jtrzUtJiKQ100psDFIcKEIDshW6PSSn1CgoCaKDVNlTL1b2IXNs1SYyh8XQwBKt78/+83CZWu2IvxvCppl1eLL3ooBBadu297nVCI2SriVebjUzZ9AM/Da4xhe+XmKbMNSkXDec/9Ry1MxjN++4rZ9zL1rk12tCqN0DxmyBQhQ8LPlngIDgqK2Xdft3J7cfMlSHApTfyyY8k2R4Cd5UIYtvEugSKT0ONc5cN6Is5MhzyT2fTeMm2esubxjE+CY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eTVBMj7E5OYSCeowZpiEJ2FuYSduRDaYAdBzeaoLVgoodiDBsb3g818FzjgD?=
 =?us-ascii?Q?kIUL+RKIsxqy23sW1wv13b9sIErLzlt7RWdJCSMjYDoftCDC5uuCQhwQzKL/?=
 =?us-ascii?Q?yaLBtaqK4JGA0iwqALvbzB08c1HdFf8InHVOBmBkGgjFU1QgPCescj5aC+GU?=
 =?us-ascii?Q?Bz1FJXvNVEiFHb2stRPSZ+LjkHHn/IvYoh//8GKpT6/b7OMKhW40cMO4jLoe?=
 =?us-ascii?Q?60ZvDECFj70bj8EG+8AqlMapfJLHe8eQui9bIEwaKukAkYSkuI2rROHSa6jI?=
 =?us-ascii?Q?DUJNxPUR9uLK80LW7FzmKld1cgsMY8EvtITYLgTZQzokLI5+Txe3aqxkb11v?=
 =?us-ascii?Q?fQDPAcFcQ8ueyFm76wCSi0w+wjjjUBHnovwKp20rluYHe3qEyOHjoIWyZ8nF?=
 =?us-ascii?Q?EkI9Ixb9sbxwbh09qLrtK+VFvy1d4MWvSbwxTBJ2tST8Huf2RtveY+VHefTj?=
 =?us-ascii?Q?S2UxosQ/BJ30cHccOfJJgaKvEdYZstP74xwfETc+BnKiWnjSfU6Es9UvEC0p?=
 =?us-ascii?Q?zyt1RM4o5owLhkyy1WENdHQS3UB3l6yCoyK3E2bjKVu4VcrobYOJqUTlAemy?=
 =?us-ascii?Q?WOhwp8Opw/rLUfvVxVVrHnLu5qaCLyC+DKnwHvq79dlYdwPFTjWNa6ENUdU7?=
 =?us-ascii?Q?QGju/vhu3dINdJgucXVgvgTOvjeY8maHZDBHzJP83LBbBm3Kpc1q0mgPRoCF?=
 =?us-ascii?Q?D543MseJMFP8YIjptOh3tdeNoQa+4v6TZ8o8Ro4REhMaL2a+zWH2bG589I98?=
 =?us-ascii?Q?WIATFMlrEg1ReUuOoB0MsZojTyu7l9Bd9stSE4SXjvbrKuUBC2htowxpcYu7?=
 =?us-ascii?Q?ClElYg01U1ZF/V4jj+wW9fSTlk5mfxr3RPNKxZmNsTG+SMyTYin1wRovQ8xB?=
 =?us-ascii?Q?Ugc+xpvyovjlfLgcEcE2KRpKYouzPKcdbdLrbMhZFO7oBi5e5FpAEOHfrGg3?=
 =?us-ascii?Q?QtFdbceBttE3lrWOO6z9s0wei2xts3tEta1xVMm9GqVlwqMdHgYLYRYsQLwi?=
 =?us-ascii?Q?UEhkVKQ44Ozlak7oXDd6U2mq5Jg3vAu0i+0XL76Byx/ewqp+KhC+aerSjxlS?=
 =?us-ascii?Q?pl5h3L1vrlQHzakUIGK6+rrZ1pFCX/O2ckVUHPL+ATiinRtcB1cdJc8jN8eW?=
 =?us-ascii?Q?EKM2qDPXFtIEvGs7x5Ok6GH2VZmPlPSbuJOaSRnpREUMW7ifGNJgeVbkzYqD?=
 =?us-ascii?Q?Cn1IXTUTZeUwuD00QMIjGIxQ2S+YRlZsbHzvpi+HpwPiFLt17qi2YUre46V+?=
 =?us-ascii?Q?/00v4vKe9vlhjD55EIgAqHqUPSi+ov6RW4OovaLgBs/FvMHKSg7tacVBg/56?=
 =?us-ascii?Q?2c6wOvbCuqaiLQPWk9NScLgANggPAdXzl+/KOu5ZP2IuuEZ/uCxdL3RMbUnh?=
 =?us-ascii?Q?5tkD0w1g+esyif85SoqD2iZ4OzbLuSoXZz/GOJ5vaoqJIogrzmhYk4Fuq+qQ?=
 =?us-ascii?Q?rSpOsFTfXTRD6nWSeIZjNvNrOa6EjEh/GLhO/w0vmpoJEnDpV7shI9lkvjQ5?=
 =?us-ascii?Q?qL5uOYi43T3Fk2Jrlr29q76x8f2bG4I+jyhfoHlMtIwpJD/jvVec9hrYo60V?=
 =?us-ascii?Q?Md8sQYjLJcpXnhS/3IgDQ7wu+oeptnCNXZ7HBYkkgRpOVtMpuPJyD49488Nq?=
 =?us-ascii?Q?HtC3MUlFGl/wJZA5T370beFAFACGaXP7QHSwodF+n0qoUYP+iWK2vfrYjvEl?=
 =?us-ascii?Q?8ZDw3Y1tWCT32FPbMUUQ7zpOZCZTh9p3WHJGOMAwq/UiRHAcL3SV8Q8VZtJm?=
 =?us-ascii?Q?jwwHcbk/0g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a4d566-2977-47d2-7c79-08dee645a235
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:48.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AHg2dsfLjt1AYu/tdiBM9mIHN0sjdBub+p/SrvkP4Lke8RKiFL6FRzaXFkWfr7NyiJg8D1SMvru4Vtt2RRecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030011_126353_41DADC3C 
X-CRM114-Status: UNSURE (   9.10  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 5845fc652adc..f8640cdc2a21 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -630,10 +630,8 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, wkup_m3_txev_handler,
 			       0, "wkup_m3_txev", m3_ipc);
-	if (ret) {
-		dev_err(dev, "request_irq failed\n");
+	if (ret)
 		return ret;
-	}
 
 	m3_ipc->mbox_client.dev = dev;
 	m3_ipc->mbox_client.tx_done = NULL;
-- 
2.34.1


