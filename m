Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A36CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1tLQICJccJfvVZEwWqtn+YGIYSr4fOfl7vSDc9+E8Y=; b=MSlzeQ4f4wAbUeJCH6zS0Rhc6S
	IHO9eDmIqqdHpkvKn4Ed2QcB2bQNvsDocRFePdG2NxJDao4BATC52jzhyn+2lpLhqhygcbwP0Tzwa
	1xvmSSsCztEWpA/t56EmC8CaIp4xKhTZi8F+oh60YtiRul4sLrsMcAXqy6qEGhba3UFOMvkYsaH2i
	Lr3DhMJN0rDsQQ28yk3gupqkLP8nWzBBBSSBDcaWSVATMsR6N2TixDnKc4grXcX6qUDaiJ/QSN8P0
	/k5nah9t9TCUrXS/gpHCr55vAscWO41XEXt6TSk8VmwKryU+whkuojl87X3QZmr+y0kNZx4HwIYkZ
	V473UavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5K-00000003svI-00nQ;
	Tue, 30 Sep 2025 02:27:22 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5G-00000003stv-2mKd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgslGRYCYbIdtXOLI+l5ehg08dkGyoorDpyz8rliCexO3YVtCnzFlErpJf8xfORgrZGAzatPCAiucyKPIyMZBT+QXO80Gj61XbL/XyKJSY+mozBk/e2n8zfSxaHlAccgAODNiSCqP5CsEEomodKL1AtnoIapZnYauAqCskJaEY9h5I5iPQnJIv4gw4JZxJ7FbS1+tV9dOU4qxnjEv7gdEnKfaZ6j+Ph3wXsA+rkVpMd1Mo6RekbN2asz5fAPK4K57iKjYEroYFvXo7i86VK28BOSQPWFLHN/v0ZcoypwBQoW3VKZVrmK1KFkppyUdFOBhyh5TGHLvfKTX2eXkfvncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1tLQICJccJfvVZEwWqtn+YGIYSr4fOfl7vSDc9+E8Y=;
 b=ZKWuaYQeByCOHEhLg3j3YcGi4/l/3IZq0WQxOFmch1rWZr6KnsjQf2gQYIuHSyMosJapTchIZKAa21mm+O1TbveO1Qh/a8eaepYgTtTtIS9cZn4PZgw/YYg59qyPVXQip5H18xjukzkjVuAONLLp6XjxkhcojPITA+k2plV1oIrQF1xH1EjZ2rPI4kXiXXhwnZEFVNBwEFUmLEla4UBfx0FsZmNaUrRGUpVnMBIH5vw6YuAY6NT2wc89CxDNv+2aA4SnYi/AM9ktW8jPA1BZfwjFGEaBxF2EAZDRCjgXdYkmfDMhyIoEtRQWC7dL3hUxyUMkPBzJDkygIR4tUFm03Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1tLQICJccJfvVZEwWqtn+YGIYSr4fOfl7vSDc9+E8Y=;
 b=jNhtcp4/upq2uq2ybhsViRvyglRuTwtR4U6C6mkZPxhsdSsynRal5zNlOlbpa3hubF+pCAdv8UT3v1EC5+1pFGF4cBr+QqoTOtQehmZHKkWsPHDruHw06TncmawI7Bm/zuSr7SFrZ+NFZY8ruF+94DrlFjxgojr5z6Nk2IKsPFJl0SeozAGgJDKkn6mXBiiV8+CSOQoxxn+N00igS2qv0Oohd8dvON1WIYaZ1yNRNZBna/Qrhj5bOXVeC4Ki/VVoDTEQBdd5YeDK4WbFhVkDFGcS4ZkYHv5gV66hObnH2YLslXmzAZYAnjigV6qQq1zIvwAb15eI5Oi6Cqkmd59YPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB7929.eurprd08.prod.outlook.com (2603:10a6:150:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 02:27:08 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 02:27:08 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v5 02/13] spi: airoha: remove unnecessary restriction length
Date: Tue, 30 Sep 2025 05:26:47 +0300
Message-ID: <20250930022658.1485767-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00006627.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3cd) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV2PR08MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: ac486088-e85f-4cd5-f19f-08ddffc8da56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HB1nEP25GI1t8iIX5LnkVXCS9h2w6F9l0RMf2o64BzKTZ6Ac2fGcQilRxFWM?=
 =?us-ascii?Q?E0BTNN5feYaOoJcuW8F+Okz6iQCO7j4QKqcApm/5CgCbfFRzLN/PUhG8Ess3?=
 =?us-ascii?Q?LKWVP2MSJ2hlIPOHUPUmXFFeriwQXRKge0LRNVeGmvF3Lk1hLv9f0/MNcn9Q?=
 =?us-ascii?Q?alkTw1N4lld3s71yLwcG6BJ0TGUCCpc/cUw/53VLyPfjrl79lsaTzplflhUJ?=
 =?us-ascii?Q?4xchu5PxBmN12tm9mQUfoX+0Jo5bKnK3ulX4aBEyVsST86RkpLhixcSn3+wN?=
 =?us-ascii?Q?bQ2oweo/LL5V8JGOxVkYvktS4s6bTxDdkh9QDNZ7xBMV/WkqwHkBqywvJ2mH?=
 =?us-ascii?Q?nVSTOTC62GqfDbHqzv5ASWtfFJlGiXg5O5cccONHKJgC+mR4I4BvBs4Ee+5m?=
 =?us-ascii?Q?J5uFkgyf2gVekkRbgzLS9ZJJPOlhktOiKVaw+avXJFnDJMrxD5PLhthxJDgr?=
 =?us-ascii?Q?OOwfxwCtOYg5Q8DASuglTxq9UE/nOxAriDN9sEGR1lSZueecnlkeVzGaG6oP?=
 =?us-ascii?Q?mtaeRTfaXI+tUwwvhy/bVQvOhbY+im3AOK2sEPbDkOD7MfXgCEA9p4cnaGZs?=
 =?us-ascii?Q?kWLguy0DAtQNxKqr+9wBrGJ2x4fGiHY3dTJMnPpu2f0mT/yg/8l8KAu5th32?=
 =?us-ascii?Q?Qi7pBZcGhX7nGSkwFsWGHb4vzxYlsk9yMX0WPaSc5hionZcytZ3gh5IIu4e+?=
 =?us-ascii?Q?RtgUFch6Z9NlUIOBiggYcxlR6XO7bvNrsnbgbmpWYlutTRzTLlvUlMSKbsln?=
 =?us-ascii?Q?5OdzpSNf7P6SYel+IYwtk06nHEv/ai6vRZF+7JVj/M1dOyU2dOsS/CvLEeDB?=
 =?us-ascii?Q?5MfRvWNpPmLBlfL2iY1rVixRHOE3QCCpykTq04kmI9dKvU6fn9XC4Ebem4B1?=
 =?us-ascii?Q?7fMKuRnHybz8pbll2qJd49wf6kchRWmSkkMfXiMJIqkHmMX8y5sGIJvNs/cd?=
 =?us-ascii?Q?PM/5M3cDQMorCJnZtY1r7IZk0xOpssHAvYaoP2y9+lIuy4ltK8WBkV0qP3NT?=
 =?us-ascii?Q?m7ikzrtUnYlqq8IJI2Tv4Pcp3zJNc6ujRVXoQsbdd26oOMPO3GVrkpuZ2h0l?=
 =?us-ascii?Q?ZBnS+HnE0UGxLrB0UKhvuMJDwGOCYZNMpgERIy5h6lC6BPnsrbUgcPugWec3?=
 =?us-ascii?Q?B+1hQS0sg4AFmnWjBtE3CuoBgz6iUYpGWjKEPfsUlzh2otfLlyAp95L2+SBj?=
 =?us-ascii?Q?pDICfWBvVzkwRDR3yBLty5UepPdwnhUZv/AGNbosyHzaMHg6SVP0qaiIMJge?=
 =?us-ascii?Q?hYUMbjbZett06c7YN552QCEF7FhiV9tJJTFBGas4iaCWLYopR/Ulnz23jByI?=
 =?us-ascii?Q?KNQUq0EzBqV/Wx5BHDrNFY5+TkjvPyisK15uawZIdrpvTy2QxJX+YHIgtiJP?=
 =?us-ascii?Q?ZJiuqma/Vb4fQasz6gqFPusH6Ab21fxQkMcTcUZhP86k8jggN0ky8hfBJyZp?=
 =?us-ascii?Q?G0cvvWHcfF4+XS/JwJFwxvEoLt0hT9rBflQD1o5k4ekEqObK61Qwf9gxjmCI?=
 =?us-ascii?Q?24jNRa9hdIv9DIVqiSF2bSwx8Uqiz3TvXP3N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tjogCkWJ60ZbtLsHyqgASYCBc47pu77bdiZWBdaTgfvTUL0hJ713xJSAFcTh?=
 =?us-ascii?Q?Tzb46Mfs7pZAZhOdfteUfED8wt2hA9T8gblPLUQDUKdp8R+KKqImXQFl1p4Y?=
 =?us-ascii?Q?hvnPcQRLohJqu6WR2PnY74z8xGps+aOJJYoOLRuLw2OhyQe/u1QswzXA/1kW?=
 =?us-ascii?Q?/2aTNG3t2k0f89eRdbFpvrZiFSNpoMHeco/4csuf5s/szL0e5vjpj10ZgiJi?=
 =?us-ascii?Q?jnBai+cbJLtntvtA3b4l9KUiu9Jt4S9RlPPRGsyTc/63lz2Qn8nDk/XemmOT?=
 =?us-ascii?Q?6FWFEEAPXg0pekAawsusqAAT7yQgRTUjyIrDLXSTBJ1/mTqO49ho8n/Dczpz?=
 =?us-ascii?Q?iVLwCPqYBY1FRLfq+NaOQ0afsI6N5pjPKonpSkxyXdjQJnGanFbaM2UIIkuu?=
 =?us-ascii?Q?CsWfTjTcnV7dZVifHp5vB2QrI4c8sdKNdB4xQTDmajEH9Ox691Rv+h42B9ht?=
 =?us-ascii?Q?6gUnFHg/+cuOMOqio87gzSYhbL90fPu/XBpsM7Tpk4QVpYWsfCd2xyM8N1Ai?=
 =?us-ascii?Q?yepo95pg3cfOUJbzZ2XUsLTS2QwIHS5J7zZq4hT3kTbOtVAm62rPEKKxhIVB?=
 =?us-ascii?Q?rLeGQfPW98xO/Q9RtokUwOXaU6hV3q0LNw6+jm3O5aDHd3kmBblcBs5p1Mak?=
 =?us-ascii?Q?MWTgW6DeQk/K8LZDS+uVmH9Kgw0Yv/u4YvJ09dwDNwOBPUighnB3IT6U+MZr?=
 =?us-ascii?Q?74pMYpcgn60ITGk6jJMj6rwBhUCZUjcgEXDlcOTTksHDlrAe3jjjMztoATwX?=
 =?us-ascii?Q?eL8EA6KKTu9bnZzqufFw77SoVNNKzQtDZDM1MBmBZglMUGcrXZI/4LEp6Wf8?=
 =?us-ascii?Q?w3rwNJMrz7sdEIGLwGBmu4Dxl3hI+XA7+MtDCcgajZuXPNUy2d4tUlpAFvtw?=
 =?us-ascii?Q?Xhkw8eNcFKgufD8JN6AperlutpMb/PV2j4GUrUkKGY45kToz/xn8c9TkjohH?=
 =?us-ascii?Q?0SyKeMZrgDjT+xuiouLyx0IBm8oo0mzGcQWmirEloSYPqNhFTktcaX1BiNSv?=
 =?us-ascii?Q?fnt1GcIf4CV40qRchW3mxn6tLYBgse6URq4XBuKtwGWPY86E+d1RdbZTnQhC?=
 =?us-ascii?Q?kyrOze4oyVwLPfciEo2OgmM7cLJqafqRbPKafT3J5RjM8r9fxnGOZnLUnhq/?=
 =?us-ascii?Q?DC054HVz1DOFesNOyQL3GuFsaccF2piyA+Vp2i4im11MRBhz52XTvTcQNVIO?=
 =?us-ascii?Q?2xYQOqaMzdA3P+finUmaNIdrlI/gwuIMsT179+mcgC7hC/wpswl9nwX9cSCM?=
 =?us-ascii?Q?WfGvT0ISi1rOO477HyTgweFQHw1OafELqiIcIBwYElPshbx34uMup9XfvDGB?=
 =?us-ascii?Q?2ba4QaNxegmbNc0kVPxG18UYGgPdbK9TcqEREjlGvKHORfeZ73VdaN7S8Ftr?=
 =?us-ascii?Q?PrFVQbp36U8vquUxBJwUrUWVU4Ndcf2fB5YpxeJ/+7+8TRNkMj3AxmwfJ7Fn?=
 =?us-ascii?Q?i7LKjUAf1jaux623ar71uKfBIwb+xT0JPMiKgLRIH0YlKGvHONzSDJa84toJ?=
 =?us-ascii?Q?HUusxF9i2iDf7bY3yrVOxCwtVxARe6xf/pffuMhOBrOQxsw1mqe5q4evfa2R?=
 =?us-ascii?Q?aUkt5BqCXQYdsehfksKek54FaAALOWcg8n32IuZnY6uQgT9z+cyeURVdnToB?=
 =?us-ascii?Q?G/wYlIZ1lmjF17LahlbsxlE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ac486088-e85f-4cd5-f19f-08ddffc8da56
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 02:27:07.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mOPP6YooMLxoj5s7NMKF4NB2VSyfMs1dLQ244aiztZTZsP4MHYfbSgI6UBI6VraJqrh7AnK95p5xtdCSFZPirtFlyEXfhQYgY6KFwF4Rxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_192718_701399_C0F5953B 
X-CRM114-Status: UNSURE (   9.50  )
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

The "length < 160" restriction is not needed because airoha_snand_write_data()
and airoha_snand_read_data() will properly handle data transfers above
SPI_MAX_TRANSFER_SIZE.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 043a03cd90a1..bcc464ec9c61 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -579,13 +579,6 @@ static int airoha_snand_adjust_op_size(struct spi_mem *mem,
 
 		if (op->data.nbytes > max_len)
 			op->data.nbytes = max_len;
-	} else {
-		max_len = 1 + op->addr.nbytes + op->dummy.nbytes;
-		if (max_len >= 160)
-			return -EOPNOTSUPP;
-
-		if (op->data.nbytes > 160 - max_len)
-			op->data.nbytes = 160 - max_len;
 	}
 
 	return 0;
-- 
2.51.0


