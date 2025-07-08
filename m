Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D387C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 03:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=daOPI5l1FSi9/gW6dYQ/l4AsxwdRMgz5MN8VM2xXTJ8=; b=QKng7RqTibeztuJRiAsnf0ixGq
	vKOtUvNthCOAgKw6AxLacNZ88khzvTeUwYdUbEdgpnehF5ApvVsNBmmfMpDvPSNebaEXFoTwnriL7
	rY2vT1QOuVqavBdx0EQECAtnkNOOmIKAbIR+Gr7Nh3hIaXgOCz95sPAUqnzUejkqEor0UVEbLmPUR
	yjDndg6dJbpshhcxFyUCAR+PNo1vRmYMsF+xdYrrqeqhNNQR5+ILnqyTbpde0DqwFq9ftYEG+MpkE
	eJMcuVbMCI2EykM+EnzE22wKgV7Gv4fxoY3tHN5/AQTL1s1YyGll+r0UNUSQ6gB6NVzuswdpINTWV
	B27sqPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyqe-000000049kA-3jRC;
	Tue, 08 Jul 2025 03:18:24 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyoI-000000049Pn-3Og4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 03:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMv6SRR4jL9mo56GGMqkdqTe9q8gejV04OXIRlHsLEVn4iiJ2Xxdc3SgH0ntsI6foykV6ae5wOTDvgDlVZ22MWY0lU7A1DOQXIz8E3jeyeAFa9KlkU3pIKDwXQbeY/wwwL6QgNOeBPWqQpyFTQnPs6h2USGB/9vzMDLm/Sc0PeQ+NsuqHeieRleuOk/C+HjRmKU1mTDpfXfNwk2JTK5TNieYknp2s4cTdCdr61POEfVWdNGGj3s9YcjYNYflsJTmw5m0FRVmkbT8mahwnbebsNvFaYBPoirZsv9SbxXqTTzK+WNNlHdsRfU++0lU6Q2Qw59MtHcgBMJ0b1uSz+k3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daOPI5l1FSi9/gW6dYQ/l4AsxwdRMgz5MN8VM2xXTJ8=;
 b=CpYA71psBw6F2CQmks2bJs21xcDpLPt8c4qbwrjwcwG+Xu55Yz/XZvLIfDXLXUoUjMRXpCLJJeoCdx6yHMQowYjBSagHuYl+R2Yn0urAXdhvVJdC4J1OX8Q0zCDLWVGBPpiRjco7dwTe/gVOrxH+wnvmuvudX5gKlchOEmneAwIOvVP7P9ybwpe7AAKcZgXyVRuux3xfTD0sAD/6jVG3VUqnJfOKFc7cvcgxbzkg/hwEOc4wBPxpoYjfoeBaj3UObX2icfxADsueZrZOiDQIR2wpQnFE0QO5cBcZaiZzgoO+KkVNfYmoY6VXiRQdehVsNqFyIOmnanaivxT0E14d4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daOPI5l1FSi9/gW6dYQ/l4AsxwdRMgz5MN8VM2xXTJ8=;
 b=aBtbog8bCFwQUKWGMTvAoLseeIAo6x1kVe6zlXJtIkQB6Ro+RMAVAfcyiry8pbqbCb8TLP9Iup55SRKUnNIwoNvBNdHk9oGR/hmKNeARa22XUg2a7crHUh2X976LFX1LjDFeTfj7CLHbjKxnEChvakq/1gP4rsrQlqPuX6ASi6XOv/GBHp56p9OzSlYluh4hPOrCOE0QHLqw9beMx78WtS2U7QZ4BcTVPAEdO1RJoBNfIZn+0NqRgdKGxI9FIy0InLBtrfa3DrPR9UNwWWwR6pCUyfWSP7oCXpwADm40aT/0hy984zzULJ/qyFk/huTPcTLNtOCVw+h2uiaGsGK2lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB5923.apcprd06.prod.outlook.com (2603:1096:820:d3::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Tue, 8 Jul 2025 03:15:46 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Tue, 8 Jul 2025
 03:15:46 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: wsa+renesas@sang-engineering.com,
	Jonathan.Cameron@huawei.com,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH v3] i2c: busses: Use min() to improve code
Date: Tue,  8 Jul 2025 11:15:20 +0800
Message-Id: <20250708031520.365110-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: de6ac3da-e73c-4d6c-d33c-08ddbdcdbafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LtSdWA6+ZxwNwfpVDdWLuuD2OFUfWX7nGh2Ssg8q7f62tCFwfGRDFKyxVrd0?=
 =?us-ascii?Q?tz+XBBTT0KSL5urw9JidXXNy5ZdpuZd0O4BFCg+h72cvC8MrkcimVE8Ajg64?=
 =?us-ascii?Q?4C97Mz5DTSNCfXg4lrl6VzUqGye596e6dxIOUnP4FWFEWrJ1LZR+kzAQPkIH?=
 =?us-ascii?Q?PKOi9k51DMZ0+Bckz15AlbttieKzqsDFGNIWRTa/gFEU3FU9F0Sbg4dliQHf?=
 =?us-ascii?Q?RivTyuSXyAwkv6JNgRfGWrNHTgEJbAD5ZZY8pMNzf5rbStpkLWCrgDQbqHFc?=
 =?us-ascii?Q?zP75vrd2UHcxcHWPygzNLUyWLRAGvgOCIZWwVaS441N9BGru4lTNBB6EJIHx?=
 =?us-ascii?Q?IpklIhJk4Q4DMDYDwxWt0jd7AXgnqJWcvqwq9lMU0jnhqhjSaOfcfaFuWPYl?=
 =?us-ascii?Q?RB5BLRV4bjD+gOys7VwPdU219PUdJKn7edKBs/f4727dJTCtArr7PIfOhHFL?=
 =?us-ascii?Q?KamxjmN7bTyDpQvVF0VziW/bHt5+zS0TkVn1iA1ZEVjNj6diaRYh/i89NrBZ?=
 =?us-ascii?Q?gqtrEltuhjB6w9OEmxitzDU5qZvNnaZRpFSeaN1wU/t3zja9pA6EUQQCm6HH?=
 =?us-ascii?Q?Or5URejXns+o1vKBriqaN2cfSmRyUMNA9QwxJIX2ZwtPQTCwJDw1Wuw0c3N2?=
 =?us-ascii?Q?waJC4m1OnEfpu/uvcUtMacqn8IcS26ELqxCR9L6M6QmRXLCr+skiiZHDOwQd?=
 =?us-ascii?Q?O/ze9C0Uz/WX0vRoomDi7a9i80h3kr7WA1vMEZ8IavcWy3xrS31m3vdF2dT8?=
 =?us-ascii?Q?nniI7qoHP/DBeQQyzbvljgHtO+/vH86h/8SNoEAz5xHxh0J3N3BsfEgZkRxI?=
 =?us-ascii?Q?tBs5+VRr+5CbSF0EXl4hiFmQKMMxxBbQw78E1STCXIO/hZa/oF0ghngcQeNu?=
 =?us-ascii?Q?UpT9+0+s7FvMRNroce8XDboiFM5OjGItpP7CIAlWPlJ4Qun49aiblEvKrbBx?=
 =?us-ascii?Q?BwV8Cia+702xC5zvhuPGY4Jww0oSKhApRV9E739Q+zXBXjqxD8mCtfBceC/e?=
 =?us-ascii?Q?6qoVfSWvWRnBaKn/ts14NrKJE/NAm7w1YM7KfnmasJiiZXwcwRiy967OsaTJ?=
 =?us-ascii?Q?KfX5sXBOCiiY4BOXBnq7UguIB8kusoFKUerX4SD88+velG7GYbhv80FxhJCs?=
 =?us-ascii?Q?M1PlM3dXrXR1M6RCx/Mbd1V/IZtLPt6OnQJCEUHGAScrp2Z1tofi8X81wbvV?=
 =?us-ascii?Q?UwgI65VxchcfiFJyI+YqU9+hhcO/3cAOcV7RI1/zaoEKAVDD1vN85qolYuBF?=
 =?us-ascii?Q?qcZwQV1KyDodRVmHzUejaJKbQvmbhb16xJnWAWWa79z+mGEGkAxIbyjP5Mwv?=
 =?us-ascii?Q?Bgn7aoJjh4j+vZoI8HOSAmemb2Yj2DoKCVQU4Uj9khvnSdfNZgxPyTjWf/lA?=
 =?us-ascii?Q?LsDi57Y3E6NXG8dN9mD1/aTKz2qjEQ3C3x2qPU3pzMiDjlywsiQl1oZHEZXp?=
 =?us-ascii?Q?ZxQEPXa7HuLFNlKy726PQrM0+zjKOGPDzXSGqt8geX0BNNyse7zaYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dE3IGZlwsKY3ycOJl/KkpBOAz/98+DNiMMBnci/fXQPJHyjo27xH/J4sKA4c?=
 =?us-ascii?Q?JZVR71CBuau7A/nkkSwuHWmJBMaXrK2y4Xj0IQVmZASbqmj3XorthUqTd9Oy?=
 =?us-ascii?Q?yxGmQfaCn8FkDhbmUsjdERlYmo921S9gIPcOPBMLYoX0svWd4xaPz/SlJ29/?=
 =?us-ascii?Q?0CcfZddXiKnC3pu6Hv9sc9DCPEftnvNlFP49F26R5zmK/nWQqEd7haoqnYp6?=
 =?us-ascii?Q?DMrwWunfcqjsjBX8oviu/BnFW0E8l3kzz/AGwaEoZopoLcaeBqVX8elSyDU5?=
 =?us-ascii?Q?Cn73iMgZbKBQRZhFPgvCuTp5YcMWFJPDKV2VnOUncxNIlhK15LLmoF7yF62T?=
 =?us-ascii?Q?tNecH5lm2FLFolB2JPkNkM0Jb0AumZq7gAUHrR9TBLLhNWmv8VrR8KXrZYON?=
 =?us-ascii?Q?nwlq2P1ip6WR7GiDVfEB0dk1Lr8XvA5B3z6WdyEgXjgZeL5cEHCK1cVjLF2u?=
 =?us-ascii?Q?X4nlDpfR6qqHuDkqFcm8S7RQRjvuYb/7BsRSDbx/bImN6eHV9CB71Y7tKUJM?=
 =?us-ascii?Q?hUUCG/EdV0QH5qttygVP8kyIe2m3wLWsULHcmHnuCupVNNbKq3U/ViBzeHHc?=
 =?us-ascii?Q?bjpE8Rm4oiEShI4E7qLcolmgiYHUSpvytDjrmXE8g0m0FqpSDLrlzo1UA25x?=
 =?us-ascii?Q?QCwZFj9lzuR2YLvFzQCflrMJmRUzJ9d+O8MQOu4SWz5xW9Gkz7RCqpqg70sv?=
 =?us-ascii?Q?ZkOkEPNnwtT/vsA/NyPiiiFfJavSv3u6Xj2YJX3lzl6EVqqXvhfMNMdE9J+T?=
 =?us-ascii?Q?HGf+rlIv4CUxUeP7+Silfr1CU5sV6dO7+jOPhE9sJjBfMiKV9cELFlzMa5hr?=
 =?us-ascii?Q?EeotaVlSmUg85u8zv232Rs6zYUAHN5EPSRMAXqQe6lrj2pcMKjxfz5Sx5EJL?=
 =?us-ascii?Q?Q12WIuHqbgP+lrdcY4M8/YOu+8WKfgUT8vZ+2DwVIAURxtaj9G9pDhdqab3M?=
 =?us-ascii?Q?bLSB/12ttf8IjqvxO52NQR8dUGXVEf7lIxi1HMXL1CNwGlsg0JOULG8+3ITt?=
 =?us-ascii?Q?jxfMHLVymxorFmQamqOH/MvafCD/N1CdBnsBfX4R8TBStsekREXwAjBJ9nzW?=
 =?us-ascii?Q?lKimoq0iuQT9aQv/58jJZfk+hA1g16NwNgI7UsNrCmk8/nN+oN3r53C9IxiR?=
 =?us-ascii?Q?mGHjk6j/KZToPq4sfw9n/pVeBQfUmShlbwsGCRdDjjV8i0FO7TI3mdauhdpv?=
 =?us-ascii?Q?VlxBqqGOKWDMWWOiy5GE807v/JyEDJW6ANc/+DnhKsvY4If2NFFyCxkUDJyB?=
 =?us-ascii?Q?nA36pt6qb2Y7NcDFCaH9nc3qlxPo4F4/PbbBhF8bhGpEJDxC8+LfWJchqcgY?=
 =?us-ascii?Q?fO6/AwjCusqJvk8Pw5navtk3YwYHTZ92W0VUNwJ3pkD/0a9yHkAVQSDNdq64?=
 =?us-ascii?Q?WQE/rhiVE2zTVfCGvWa9UjwUfsp3ziC4E9WnnRAwIgCYBG5PvuRcrDdau0g7?=
 =?us-ascii?Q?WwveY0Y2kCd6/y6WiD6miUdsxcPhScjFsaS0NU63h5iHl8DGKPNbq0TqgIMR?=
 =?us-ascii?Q?uLlghj2ovZQXg3w+32FFjQnmp5/XnJUnRWbOh+2S92qZrFkC0fGEujobWBy2?=
 =?us-ascii?Q?6Uynb5BKteghKHwqut5Jl5N6ohapw3QPn+DibDWg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6ac3da-e73c-4d6c-d33c-08ddbdcdbafa
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 03:15:46.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lidWbvPernG/0fvq067Tic5gcH0yFncJ8nb3kr1CSWf/8A1cNRUtxwmTNwvTgQodMKGeY9kcGrYGQq7gIuPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_201559_117885_1CE21A2F 
X-CRM114-Status: GOOD (  11.88  )
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

Use min() to reduce the code and improve its readability.

The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
was changed from int to u32, because the max parameter passed
in is always greater than 0.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
v2-> v3:
- added the <linux/minmax.h> as suggested by Jonathan.
- used i = min(...) as the loop initializer according
  to Jonathan.

v1-> v2:
- Change the max parameter type in st_i2c_rd_fill_tx_fifo()
  from int to u32
---
 drivers/i2c/busses/i2c-st.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 750fff3d2389..e4b2ed8a9264 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/minmax.h>
 
 /* SSC registers */
 #define SSC_BRG				0x000
@@ -422,12 +423,8 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = c->count;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
-
-	for (; i > 0; i--, c->count--, c->buf++)
+	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
+		i > 0; i--, c->count--, c->buf++)
 		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
 }
 
@@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
  * This functions fills the Tx FIFO with fixed pattern when
  * in read mode to trigger clock.
  */
-static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
+static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
 {
 	struct st_i2c_client *c = &i2c_dev->client;
 	u32 tx_fstat, sta;
@@ -452,12 +449,8 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = max;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
-
-	for (; i > 0; i--, c->xfered++)
+	for (i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
+		i > 0; i--, c->xfered++)
 		st_i2c_write_tx_fifo(i2c_dev, 0xff);
 }
 
-- 
2.34.1


