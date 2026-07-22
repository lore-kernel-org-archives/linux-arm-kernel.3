Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A09C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEiTbO7RW+OfqkWvli8ohV3YYexfO1cVMQtK2N8si1c=; b=tqsYBk+5kAa6rdFj7IsLqjv6ZD
	sn1IZc/nzUiiJyJMMk+Y0hqyb8N2HcTwpBBqU+377y/tcoRn02zdY10/WLDWOQEuhV3mwrCvOSOGF
	LGg3LstdBILj8lUedqk9hivUVwBJVGIUOF7o2C7qNUu46WAyCz5w1n7KfSaailZeurKl6REbTZxMR
	bl9vBwCakoFw9zjV9W7xNneVWYzKeDPNH7UjXqqakQAjlWqNw/xx2o488qaIou9RYzu8f5WTRLaPm
	anXUyI0aTaBxOTm2meIlls4pAAeST+TYrQOSvrV2E53X5e/kRV/iXoj0K4/pLGJjJAOXkMJ3aEXiJ
	PaC6ixpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoY-0000000Al1s-3j1X;
	Wed, 22 Jul 2026 02:36:06 +0000
Received: from mail-japanwestazon11012043.outbound.protection.outlook.com ([40.107.75.43] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoT-0000000Akyq-1I20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 02:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DI4aPqdlGFJ06h9WyGqNC/TqGPMyQprUZmd10XoH2534LUq+XY6qM5WcGA7/UuGG5EPXmgnK8HIa1b7gV4F8S57+dwpUBDRU8mv3JQ3B7EBw4DYbkZIvGRrQ0rl0sBelI9/jgXbG79TIllt1vJNnFST2nr5SbU6E7evLei8sgktYOlCt4EvqZeylOoZ4EY/WsxyMVKPEruLWoSbWXh10jFnpteoK6nQ7p3J1ifs2SQ40Sf9lU79IiCMTNZtfddZGGDVvPFqODT6bzt06QA9iEFrq+YJH7d/C2MX7aFiQiVdvdcFVfsbbXbRf5ZW9VBWaNRJ6VXEVPKvdcKwd1G4LiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEiTbO7RW+OfqkWvli8ohV3YYexfO1cVMQtK2N8si1c=;
 b=mVnfXOQRlXjQHVHP2SH/pZxsaXPYcXhu3S8QhtyMANndamiKdMi/b+xU9N17SHdBUzxBDLUQ2AdJjDa+GfGKqHZaQ5PrY35t4xSavoMo/SqfQPwnRwICJsDrhe0098q4Gb6/8669CNMirzzPjS+2XGlmQSAzyI0NKY95/cWglcuzLNyjplMh1bgo993CnpDGz6TWAJoRS3RSN8puAQ+c4zkkqDN/WX43Sqqrd81XTQ7AHVqcureKYDQ1N/PyZjj8euKUpibsjXBisDaMdqQbzfpfb6qAcQuFHI70eVu6cVbhjsxcEbnA7+uAXVxmEc9xZFj5IrSjoXdqE0RRmvyQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEiTbO7RW+OfqkWvli8ohV3YYexfO1cVMQtK2N8si1c=;
 b=eTkb6pqADtjn3EHI3XgAVWGBKw3GA0KtCH0ZvK9ebg1HudsToE5n9J+FgGdRPZqYSN8zOqjiOVzz8RqPmJkCAF18ggG8VNyLCqHNSCILyvl2V67XU7V0HlIUTHbEffnQbP/JXsWN/sU7a2yF+/BdBHZb2mrU2KTWv9BKoHVOP4+MqmJVdPxFCQLIUEhUZYbXUIERBCnLacSdWG+1Ts8vM/8MOa5Sfd6O5CR7mBU5yqTvR706eoPIY4UvIih9AYzoxAb2ddaHqHsrcWseAM+pjbDxLzAZerLhiTvG+8A/QRfbWUejaFbyiKTCcgKB5ax86Z4949+PiCr6o7PUjy9qKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPFEBA6DFDFF.apcprd06.prod.outlook.com (2603:1096:108:1::7f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:35:45 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:35:45 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org (open list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS)
Cc: Pan Chuang <panchuang@vivo.com>,
	Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Subject: [PATCH v2] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
Date: Wed, 22 Jul 2026 10:35:22 +0800
Message-Id: <20260722023523.42269-6-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722023523.42269-1-panchuang@vivo.com>
References: <20260722023523.42269-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPFEBA6DFDFF:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c15c3d-6594-4074-75a2-08dee799eec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|23010399003|10067099003|11063799006|56012099006|6133799003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +1jZGIMcZDHSVzQgb+xqsI9plo6DW/khqg9qfu2IQKmrwDt1jCys33ZhsAtZZkodEtLYJj0XHhCGnKH4f0DOCVQ6zEShgWaSlE2pXlTyuBHEE0u/fUPrWl3LtbYEdsuulaxsQouIyBIgWJJgyHmd/B1zoYaP1iVbBiKN7dDh7cDF+le9XlImqrNNxkO7kr0lUeUjAsIIIOEpa3zIwb0TbML0sTQ1F9SCuHPSG+LbdQ7bYcbRUXTRLGgbd+nACTbmjGwX0kqJ28p00yDw9vlz1/wRGlYSvUmo5S/71FjUuHetvLiFiZGqEAwJZrVqRD+okYv+ORNz3dI/p/PYWOD+JYDV+DsjpXs57ugDw7/NSZzk2neu3IB3skZaJcsrRzIdnRohmBI/GAaTMcY//NQitZNUtECgUQDgyqPJi60k7Rz/P3SPdbXND8gPjCx55uJdLAag8g6k1PmixkY9+tfc7RmC57XxjvCpaAF2IJagpyeXP5Tofmp3BWxpE2F4thE8mMnuz/+CjJsGg6YYIzPDyM7d4EDCfw0AfhMs8qQAFTD4zTgYLkDOnpp2ittA3XRZxTni1U/bV7/NPThK9CHsAaa0FZK/ggtJ9a7fCb5LOVZHLOqkyqnArOz8ZcR7pV8SyQoiwQ9roqQTKw4ssisIobv1TP3WevCIshZvzAn7tsEvkrc7uwiH5rIip19mwkkaqwEPyg1hJWsj/a4gOvN/5eWV+/ddifRqwyzavNxKWYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IAVqX7YhVKuBDEWzsc78SLAPb2Ew13j7pGpYdZuW0rMOhkk8lueUHx4rac8p?=
 =?us-ascii?Q?fWCxY8+7z7cUkNo9ejBsjPxiaiHOTf2EbX29W1q49qHVvwAhCRg+Gkw5bYSv?=
 =?us-ascii?Q?eevL7alYMsXV3/+Thb0Ll8PH+DwLdBb6Qoa6TV2AlFoCTa9j45eR6VDptu5j?=
 =?us-ascii?Q?YHinuEUsb+7XYtU6yjmoXqHGOyAU8xbM6O6UYL1Id5D/B+m2tOhb/Inufk87?=
 =?us-ascii?Q?rv++BpZnUThSZF0Tzoit2rToIUcL8nwNcM8gGaxWDKaM4UJVfAwHwHRZ9PDz?=
 =?us-ascii?Q?e38pR8wbEFYWeenvZuURU59/Zm65uS68XavPNz/dS3H3lsGyzVyhzuv+v3d8?=
 =?us-ascii?Q?1GSZGVyJ3Si7+dIJ9Poz1GLtoyoclCre6ubJkzTL1aVTwFM/wG3ykHTmkloH?=
 =?us-ascii?Q?2kLXpXPsYihf+yWsoW0z+q4qWXJsWdXAv280NJU4b3A9tsx6ynMMOtoqM2Zg?=
 =?us-ascii?Q?iApHO5Gu0Osnu7lt5pIMw4HeN1S5Neuu9T4VV+sRISeVqkyoxmw1zKhf4XMA?=
 =?us-ascii?Q?23ffLqLMTM472QvuVS1qbYGvJmd/B8AtFQTwz1M75Q2BKJRElj+BS/n2KBsR?=
 =?us-ascii?Q?aGhYR9y/yyBCbOktrMYooT6VLxmzgGJL7b7iNZDifQOFqA8UN91yRrCQFRs+?=
 =?us-ascii?Q?c/fdXzGxa+Au6NyxSOwC6ri+94iAq+8opZmuRsi49yqUd0HYkQ1kb0DpqZb7?=
 =?us-ascii?Q?2LC3x7tbWWM9gYaBXI+2arJcuCwT/ASHVqNjyZUYk+EkLvjkJ9UhLL0ntqvL?=
 =?us-ascii?Q?fUgRJd9Jq4oN+EamhcX0T/tQaANNA5kTWTQ3d90NwBWfrfIMTlQr71iKfuwO?=
 =?us-ascii?Q?j/UPwAYX6YXdqRQ77nLTHfjxLuVH2/Wro7G3TrzbIKbdWCE/DC5mJS/H/v+B?=
 =?us-ascii?Q?sDjsDyAyGIAcZyMKq2YFhFoNOsqUjN/7qxVQxOGGztMBguRhVqrN7VyC1k7C?=
 =?us-ascii?Q?ZR0BSIcrdaVJ9ImazDGtF7nS+VA4Gnjnc0XyBMMqplWa1eri6TYwlkQ9k7On?=
 =?us-ascii?Q?DAn7JvvGIG4ra0MCim2cX21R1F4if5s2fSCXmiqhbe05V4Pbfcy43LDa/t7g?=
 =?us-ascii?Q?MLuATAYNAnwY2G7pXm3348GJhzh5Ms2iib7IypQUpeD6FMuZbb7srHWSdIrD?=
 =?us-ascii?Q?Neel7jr5wcCAIe3SwQxQD9hO2EnHA49B+pHU55VXjvOHcsFEq7fkpPSaS2D/?=
 =?us-ascii?Q?yy8zWqxLJIgs9RF5VPHTyhJMA65dbJjBsp53UncR1JotXbJvs9kZsO/Iv4nF?=
 =?us-ascii?Q?HYnZ2HBH6nHebjWd5ua859UDzdxoZzKP+zdgcuQrbNxAbQsCVraue57buVh1?=
 =?us-ascii?Q?A+KhMGTD86xShWctyFahl+gDNNZ573jwaBmBN1CHV+vDHFA2Fh3lg7KHgMu9?=
 =?us-ascii?Q?S1qKX9RvOlJx92N6EevaXa84t4SCREgxE/hzE0q6HNAhfhbtfBEa2zc/0rlZ?=
 =?us-ascii?Q?i6tvlM28lH6oJKbTlfKpUr6zuV5KZvBNf8GWjW9g9YKNcy9x52pbCFxHoXPA?=
 =?us-ascii?Q?+VFu/pMhB6EoOxLjQwCmImyCP56aqxozgIfFrZTr9aTPLK977p1r21kj7R29?=
 =?us-ascii?Q?+6K2/0tZpl3aCszzXaiX18msAnw6QkxCBTE1rPpCU3lS5RDWBAn8n3EvvvSD?=
 =?us-ascii?Q?Zs4+DcIRxSBB9QndicRCzE9wpkxEEDmh9plxHJ950YJLuIsQEpXxUVDann5e?=
 =?us-ascii?Q?sd5Vmy/SJhhjM60VqQ5JYw9G3UL6CaL9jcN2sUrHYtMG2iXLp6o+wLZjME88?=
 =?us-ascii?Q?X4jZ+oMG4Q=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c15c3d-6594-4074-75a2-08dee799eec7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:35:45.7007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lFHw6VemBFH/p/qO9zlliIVZX/NmbPrPHmQTwPOrcCGhXLwvgWMzjTF5nJqsnUor29X/VYQB4NxTL4slYcssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFEBA6DFDFF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193601_684943_E8948756 
X-CRM114-Status: UNSURE (   9.86  )
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
Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
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


