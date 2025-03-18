Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37A4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNzWX/IcDeJNyL5VsXyGRekJJgX/6YRIR0yRi8CoWTE=; b=v5MzAmu3OzEUXyCAlcQpzJjFpa
	Ar303+gqLjtRV56AY9dlhodOvLvAjPABLqcm5/e6I8ZkZ54Oso4Bjmm2vbFBEyFfDCtVQD464kDFO
	1tsCvBeWshcHt+mfctpbbw/yosygTxJDzfx9V9chNbxRUjb9udZFhJlr1KWiJoClE8XnNBLXnnhg8
	7IhxrD1OSu0aUQp0+5CBxWHa8BPKd+hbd7LocG4Peh31dU8LCOghFO809KISGZfm0UF7bjv8Vu/km
	7qwsjSWmJONhrUWbQXyUosF6TLt9cbZGhMDFnBF2Jk1MQB/awL3m5WtG5aaYVhhzK0PZt6eACCPgN
	0Jx9If9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSiv-00000005EnX-3rh6;
	Tue, 18 Mar 2025 08:54:57 +0000
Received: from mail-db8eur05on20621.outbound.protection.outlook.com ([2a01:111:f403:2614::621] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSc2-00000005DbW-02gI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIaLTzhDRZ04CkS4lYn1hMbyLQD0QMPc/t4IDAMGkxAQy0/QdNZGw/jXdjB859ktq5Daxi8HcPl9TFp8Dur+RqUgF8n23ljBmVUi028sgKXhhwtGowSHBD9L+uffBNQw/c9PumMPli4MvCKOpKsnZh/mq3NyKLphEsTEnsxSDr/OIKB1GG8HBzGhhO+ZEcP+pCuUdqKXjJMlbV0fIDcBL0RFlx6ZtwH98sSg/LA7CmtNkY+yB/A/eSIjlpMmXPi55jf2oVNX6Xsch3+caAch8H59iHWFqusc/YgNg522FenuphnZ1Ij+Byn3ECu/am196sIntfhhCYVF4c0TcUqJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNzWX/IcDeJNyL5VsXyGRekJJgX/6YRIR0yRi8CoWTE=;
 b=iRlh/DEXLKJFx6p9vf7mP/+V7j6+SLToBj5jRvPH6kBcWtU8LC6lgRDOdCQFd7W5ePEzjOJVxP8gl3TO8B8ZvGvIUiCBU6jCKyjyoUqwQbOosEOgo6IQwFphDjYenZwX5xp9r0eliGFNd8PHvq1eWJz8K6gKWzLZDygEV8wF3uxrCWNErZR499SIq0IyMzKUXi6y5LaAGp9E98kc2N28FjpZH4Kp0k+P2C0Vb/BV3IV9VWuEgWVoqh4f1zMT2N7V2v+w5jCqWweS9k6b/TF04TUossRE6PjyKZ0rntjdTMeHVi+t7h4O9tZ1C2sp6HzbTlvbc5iwHYDwx4TXgU/sjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNzWX/IcDeJNyL5VsXyGRekJJgX/6YRIR0yRi8CoWTE=;
 b=M3NvhzflehZu8HyWL1U3sFUwZSyYW8Lqm6Bg0mva+1v2CptA2UO9i90IqoP6FChAf5babHbQRJx/BTjufpwv1Dg2mZbauirEX7+bqDUPBpVUcxhXPfod8wwkp9SxoFslo8u6Z3czkEMVcAgKKs7UqHqtdf+0DntroKYGBMEVTwDf7Iyg91XGZSfl/knd3MH/hNyWU9bYGVr8bzHSL1Eyk7Ny/lJe/H/MDlj5X80+2KQcUHe6cMVSrnJT0r9qpMintQBhlGNzeEFR1ngx4kkUs4qUnm/xrIxGio1qkFKA3tBsfun67mnbmP+vySzoEBj5y6zqbCgTCa4jxVD2cvq6Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PA4PR04MB7742.eurprd04.prod.outlook.com (2603:10a6:102:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 08:47:40 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 08:47:39 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com,
	carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 2/3] hwmon: emc2305: Add OF support
Date: Tue, 18 Mar 2025 10:54:43 +0200
Message-Id: <20250318085444.3459380-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0063.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::13) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|PA4PR04MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8a434d-f44d-47de-9650-08dd65f98a33
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U36BexpoVcuBWUkm+1h1DfkZnpvKLWUsICnsKDJa+ySXyIlZ7393gx8wws?=
 =?iso-8859-1?Q?7Awi8peCJJmObRXzERhZ56vAjMNFyCDO//1E991Q9OuEVGn0+KKKF03J0E?=
 =?iso-8859-1?Q?zDPv9K+Kmm3Iv+VvyT9EIoRxDBHnBaY12drQ6RUqbiKjaOFQwXrAOqVrbq?=
 =?iso-8859-1?Q?Wbtp6uZr+rKdI/virOdajML0pP045XMdkh8oOsf3YNmPPF3KZzELGgqSIV?=
 =?iso-8859-1?Q?MIpTwPC0AyloW+2zl6zGqhY4/35CUZvU+5MP6xUXNNA30pIdJwr/Nr1Rk3?=
 =?iso-8859-1?Q?Yzm7T4MBzVApEZUiLkjj/axeEEnLeoi5obDWwvV6nroAyualu0MWhTkK+R?=
 =?iso-8859-1?Q?niZgZzUIOaPiPYnBPmnMYr2fjOEBHThmUmdhYsqC2h8y7ZZX/+jmid3Fuf?=
 =?iso-8859-1?Q?vLRfXlIPZEyas7EFDLOiriMj0P7tPqKPzPRqdJDyBFAz8oww5BgwlpGdCI?=
 =?iso-8859-1?Q?qad7lfzmY5wZcppsm82H9SbvKZkLQykKxphnSgOtMJmd50WVC7bOIVWGOw?=
 =?iso-8859-1?Q?WeWAoQ9FGXOQ6G/Lx9taUv9Wvz8QMGDeRBXVAbZFcuGIeWjrV+0P9Yjyrw?=
 =?iso-8859-1?Q?yyXJTm54V858l/9LVxIXqWz2r3NYDi4sGaKfPMIaxQd+O0AfMswvFvSm1v?=
 =?iso-8859-1?Q?dBh3OEomek8eGe3V+m9VaJYotHp+jI1uSSzZznsZNU6+UcNElScQIdPivv?=
 =?iso-8859-1?Q?TCtg3DBUFV2Hh4j3PEiWMcnmw79MPEXi0Ye1OI5zlkESgB+lFv/YUEBBab?=
 =?iso-8859-1?Q?aPqQgNWZJk1xx2H4Yj5YQTVV5pJDdsXPejbPFLX7ixBP5sgn27eN9Ps3A0?=
 =?iso-8859-1?Q?xOm7JdxUcQSDPyTQu8e1ZOVLtO5KUyM9ozj6u/VcrPlBsl9N3/nghJCoAp?=
 =?iso-8859-1?Q?XkMUVG2JCJ+FLQE7wUGsjJUrlqG9MHSAl0SEskJivbyeimoPnbz++X3lmW?=
 =?iso-8859-1?Q?Ka7SD9VGNlPFEO1dRpACAdK7nEc74Tcn38wOQ2Q9Pn6IYXv/mqvSL+BdIy?=
 =?iso-8859-1?Q?1A0gH8o+N4yDleMVo2bMrMBs0ZNMMIROgkyDysOk1l/XyVMTIgD3mKqfJ0?=
 =?iso-8859-1?Q?WDiwAaggaH5LJXHaVlKnhJwhTxRoemAjVL5H2OvJA6Yr+GMYOkc7nQzp+x?=
 =?iso-8859-1?Q?Wqp+qG3VHwl/7e+9OLWoIqXHpB3gYIQVEdU1B3f9D2IpMKS1F8UbTLjybx?=
 =?iso-8859-1?Q?BmdUCwpib1JmZpxcx5I2LyO1rrGW/dCfBsDurk+BJ0TE+9IssNrTBihStx?=
 =?iso-8859-1?Q?UDSNMQG6oj2pDLB+LG77DTts+j9t6f+dm3UwahWC7M/DP6DlZZDr1T9pWi?=
 =?iso-8859-1?Q?DfL+RMZ3b0REyv/uWXwkGcGcJTEpDtbv2YP/tKwV4jABvv2LeWGXM89Ota?=
 =?iso-8859-1?Q?dZnGRJZTe2Xwma/PuHFAaQdzsK6r509FKB/MIwtLmW81FXHrWFQt8MCyut?=
 =?iso-8859-1?Q?xlNHtBXsR8vxO6Vm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qtthf6PTlNzlBZ5XuqvTWPTIxKK+kwpOtS7bFCceWeyDn7BK1+XtHXu5Hw?=
 =?iso-8859-1?Q?kgSUC58L2s7PHgU+cOh11CA95Hu22f4UhfYdB9aTidVypJkWZb7+b7s2dx?=
 =?iso-8859-1?Q?Z+nBscs1h0BOxYg/R6bUt+KcFBRdGcbRNWkmpH/ZTYIk5aMSzNGpCFgiN6?=
 =?iso-8859-1?Q?qG4HdFv6I/SE3Pir1K+G6mYCmRH+7h38r4osnItvrDfNYhnVxIjs7xGm+s?=
 =?iso-8859-1?Q?rvYzS5ax42Cq4Nd5UpafT6uJxdXYOZrKgrXyYkQOcqN2J5kGo0LVomhISz?=
 =?iso-8859-1?Q?vBHhur5AhUULL4ERlogA9JMNLScZHaCBAoaTZ60qVOGR8h7tajMwTrZko1?=
 =?iso-8859-1?Q?5vYVOIVR+CtTf1Av6J3P0dTIEB0eqcqY2VoeYr5fz3xAOEznW38Tw+qmrw?=
 =?iso-8859-1?Q?9U9akuX3byZrVVhcCp/B0tkL+M2bQV/30YPwpu9WdOdXE9PTnaBg0V+P21?=
 =?iso-8859-1?Q?6WrrozVjjOvNsxQJ8UChi2GEzq3avcy+B1PwORmKbkltzH7GvPBP4ZlxO8?=
 =?iso-8859-1?Q?ZeRykel9sur7sE/jyP0909y9prgUvkdb2kp0i1sn5u8z9Jj2igyN6a5SHZ?=
 =?iso-8859-1?Q?uaCMqO9pccKRrnfpx41w3HoXHW3209fBPckMGnKW+X1nRTP7MP7QDhG+NA?=
 =?iso-8859-1?Q?WQzAP5k+Gmwf9HZjyidHT5YK0YC7Yd2gLAfx7c53Ks6fUOB9OB1dc4EIV1?=
 =?iso-8859-1?Q?65TxQ06pawWfyt98fMLIQwR0t97AYIPpKzkg1YuaSjO3WYQItsJAgSWePX?=
 =?iso-8859-1?Q?dJWfqBIHEq/s0MTQrEqg37wNqSc7Rfk9XChRWQ99/CFJdF20Lcbun9E18U?=
 =?iso-8859-1?Q?Mws7G+3YaJFM/zvPDzq0IgAHpXVB/Z/Pre3hJEAGXxBF2JZrltkw0lJ/U8?=
 =?iso-8859-1?Q?hFjSGoaXpIiyiy1pykwCQeXJd8TkzazdFtjORpxa63yhsNiMBTxVzxFtbn?=
 =?iso-8859-1?Q?wjahbATlBSUatNc+AtYLis59VMca6eqNdJL+JGVs5oAcKpNJeJoLnJwegQ?=
 =?iso-8859-1?Q?wN1/w3B8rcFwiGdyfTBfy6Q0bWS674+r5QWfCYdwstWFn1rOv9Y+x5mZ1k?=
 =?iso-8859-1?Q?eOb9tuJs7Aim/r/awkD5E1VXCyjxcegpTTICQVfyE6ZdoKQHQ+SqLXneMs?=
 =?iso-8859-1?Q?NtxfV98Bz7vlqOiFm8+jFwRggDbNka40pd1gugipgnap4eAKxmOBGO/+Et?=
 =?iso-8859-1?Q?ssxoiWuuefRztKyfHbxkvvyaZrlMPLPxRVvK1A+nrL1yVeECu4hRfZEBcU?=
 =?iso-8859-1?Q?rCsieJRh3UpQlzv4ak/KyCEYPmbsJUsk2VZj7Rw/JOYBmkjtIKKtlHxRjm?=
 =?iso-8859-1?Q?stScy64gmOedsSIimFnD+QEgk8RL5vMwAhEyxgbL5UFH+HJuir3NbZfq/n?=
 =?iso-8859-1?Q?lAWwY/a6iIdK29dRjqa+959+Kt7EOqyL2p644ySExRRz9HkE9i+5mmQTae?=
 =?iso-8859-1?Q?6BXn38rbCtNQeE0QcKI+DHqYmmXD3Vsnocfn11oeoMXzhkd2ArbXrO5i2M?=
 =?iso-8859-1?Q?ioyL+6Jr3ocNShtkVw+ErYUqJQ/B/7pOwL7dHiZf5/9IZl7cIXkoVjK/3d?=
 =?iso-8859-1?Q?n0BcsSK/2fFcVsqnu2+iAlyz5DNIe9fc7vDv3sa73VqtOrk8r72Y3ZCqyM?=
 =?iso-8859-1?Q?W6dANh54c0YxDwm3XgM5Cn1XQwR8mXt5sRaxv1EkQ0A825HNWcKdZ6SQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8a434d-f44d-47de-9650-08dd65f98a33
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 08:47:39.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmUqfi65hzHhxp3XnKdaBDcbP5jb4cRwz/2DYzlyZBZR7/QLaXIdkk0Q+m4TSgNQhMXtH2ipjIiEwqkWWfb1VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_014750_051448_61E8E470 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Introduce OF support for Microchip emc2305 pwm fan controller.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/hwmon/emc2305.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 4d39fbd83769..f8a4c76fcadd 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -607,9 +607,16 @@ static void emc2305_remove(struct i2c_client *client)
 		emc2305_unset_tz(dev);
 }
 
+static const struct of_device_id of_emc2305_match_table[] = {
+	{ .compatible = "microchip,emc2305", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_emc2305_match_table);
+
 static struct i2c_driver emc2305_driver = {
 	.driver = {
 		.name = "emc2305",
+		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
 	.remove	  = emc2305_remove,
-- 
2.34.1


