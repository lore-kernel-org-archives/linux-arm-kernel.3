Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E05CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaeR23XjV99KyKxtEKYRWyvyl2v/64v49i3KS/BYe9E=; b=VI0ph/1+1Od3aXWMsDqe78p0rj
	A1/XlcXgdBII8saD03rX0Tdh9MK4VsHO7kpRgSwVn9XK3P90EwUCNO2NO8Cimm47bUEAPfOgnevqq
	9bf+1I91VUuPOMcwtGwtQHrJ2OPre9umc97WZoBXXyL46/MFF9UnicrtHcylc6xvMsLU1Z4G4NFgh
	dguethPF2FiZ1Upa/TH1ASgGkBtY42qi0PNYiCKnPXCryOIsQBj+C1tQGpoEgjtzPpKvgWnv+rVhc
	MKgviYhIsc6d/HsrQL2MX3FTP2m7JNW25kJDwAHnKNRb+qxgoJDDWfaha40rvYO/1ANESqKDSUVlQ
	4tCveMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1N-0000000BJEH-1AqU;
	Sun, 12 Oct 2025 12:17:53 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1D-0000000BIt5-23fi;
	Sun, 12 Oct 2025 12:17:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyPHm/+/hAYnYGwSsUDwp2fa8KyNDi4rVZA/wkt3mvymMZlnTUxeKPD3J1G8oevY850ikvMSd2EwfrB4ZLeu6Agq3CKkw3SSSEOVfMKI6MhmL8GknRaXGZEZF53sJu6VAbZ5x1oHNeuSAQclVepoe7A8yIcCxU56LHObiDkpXz4e61hM+vrHgBcsJiPd6S0rChCvAZA0hQy383XBBY9+4jb0dRbK2nB4kHsagBbxrU1RXbh8XOm9YM3u2bbybFuCTFu509o6DkNiDUBZfz0sg9VVgtM82xBbzSYUo4pUZ3wFNBXpg3eX/WHl9IRKqN0w9BFjIBtPq8u/DCKbaS1pxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaeR23XjV99KyKxtEKYRWyvyl2v/64v49i3KS/BYe9E=;
 b=G39IbfPpb0VelzlFYnkrqRlr9nnSPigruBN0UMr4p3srzIdWLS5yWUtLemL9SjHY0J/pdhsYMI3MfBeVOtoAGBCfISfG61l0h4z72/mxFLg4/l+oG2VJqrxTKAjfEvTM/yTMQLFpTydXwBdiVlflDwERxK+D5+IQ9+kx/z44zJx6W10i2ULtt91mDVDYRAbJiwQW6ojZbSgyVLVxjdjhkTt8tswdUNNJCe03Hij9npr7BwPD+SV8wFiBp0byLwCmHF8kGvyaEjv+JqIZ9gTzEt0P3t0JzHTi06lyQme9TY8926jDJitxvNUOspNNicsPOVuWaEgJv0lBvcXMj3e12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaeR23XjV99KyKxtEKYRWyvyl2v/64v49i3KS/BYe9E=;
 b=mOcFkzfVpxjb3S5NQL8faBnSidzbjVaqD+SuY1tFRg5a0h7LeZcXz/LNRO0GpMII28B8fW9q928tKhZL24QgCHKjIa6pEhZRynA8HOL8YUtX1JhKK38X2yWMsfH9iPSOztwdI1vBdNQaUkxu4luadvIBsWOEp3xVKLO+pbZ26+q3noz0frdFsqXgJQIJ7bEFSd62C1zofT6Yw6i992Sfi4DdylvD/q6pr/wsDxmu7kE2hCb9XnWTni/P0VO0S0NGDgI81/LxU8So7Btr6KgghdlxlV14s/eXtdJMpilNgI6Iub4O9H7+z+pIGaiV4xlC95sqw0nctP4j//g7je67cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 12:17:34 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 12:17:34 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v10 10/16] spi: airoha: reduce the number of modification of REG_SPI_NFI_CNFG and REG_SPI_NFI_SECCUS_SIZE registers
Date: Sun, 12 Oct 2025 15:17:01 +0300
Message-ID: <20251012121707.2296160-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 1016d4c1-938f-4c66-eb5c-08de098952f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pRGZrTrMIHcfrcNrvvvk/1redbOmqThsBd243hLFHQuJ0jV2UYc21Ma81VbY?=
 =?us-ascii?Q?nxPr4qg7DHExcCOabWot0cFrv4t3py2oSZgCE/Dfsxu1Eqv9bMMzB1WKIJt/?=
 =?us-ascii?Q?JRY+zZNXXL7r8fyyUQSXJm5qxiwdS4CXVBoeurH92yeLWU87cfjmgURRlO8R?=
 =?us-ascii?Q?t9QKDTT+zjYsURaXTakwjqzCug1xNu4SDAu/hdiogKXa0RwklE1cTvA5t90d?=
 =?us-ascii?Q?4DQQnQWUFxYjf/L26VMK3uK8XHQ2pmlqfrnBzvy0BFtOq9fQwAN/a90vz/li?=
 =?us-ascii?Q?lG9FFyt1F97pJEYT8og5FnQ2kStmIW2EpFGcgjGMk78wGE/jLaaXgW+MN89m?=
 =?us-ascii?Q?kr+KPppmzXUpWiTdjuJfQ/tR6/aDUq9VQFXtNkv6p/eFDnPT1qYD8vdAbYpo?=
 =?us-ascii?Q?UAEQzfwcErs6qZtsTIPBzANfkUqKWFJaKCSS9sCbzBUecyaYQJJ7+c3yMmyU?=
 =?us-ascii?Q?v1gWLfWLKin5cwkCp+6bnaIJ7MC6s39nTfqZ95e8u6kM+/4sRnkM5YXx1q0Q?=
 =?us-ascii?Q?VfwC0jm+1RQdvtYdv9r9y2pmBTT99K+ZjmVmMLwRORNEVhUVsCu5NU0vnLiw?=
 =?us-ascii?Q?6I6JGT96EJWjHpOlZqG+e/LtCQ7QoWVEe/WQG5cLr4KKiLiN13c0ObwijcAk?=
 =?us-ascii?Q?PAthpF0xwj2zA224+f5OOMoxY3Bu7EOPwZlpfYTaElk+JEBf8bK6/PVeyk8Z?=
 =?us-ascii?Q?BZeO9AHl6TXC8BHVu7Hm6nJafO0ewKleQW0IHExAS4E5fX291c2TMVNgqdFE?=
 =?us-ascii?Q?m05n00fnEmX2lD0z8b8eTClZ/LF2+ynYvioSA9ZrqXXQgQ8MIj1wYaWVDQiK?=
 =?us-ascii?Q?fivsxUeP8f9Y+wBtsdHDarX5OD102DY1qOpua9AGhrs46v8l7Bd7jZe8GS9U?=
 =?us-ascii?Q?s/nWvevA9gA7W6HQYzbaFPegEeaAPVVzgj3lLmfC2tCS35g8tGtEtj6Yjny7?=
 =?us-ascii?Q?0nHRuAGku31hcXNsc/vSF+AYj9Br6tmThJXSyM+PqFE5/otQ5NaYKHbe7y+5?=
 =?us-ascii?Q?rb9+NDM6nmMacGXdugZP3ft47AJCElvuT1YnVfVZQfcmEiorH6lGXvV9DEfM?=
 =?us-ascii?Q?oSATFqSNLREB5F9/BqBAEZ1HGlQFJCG/OF8cic6UI0kmPdZrJQOiAFP6TFl9?=
 =?us-ascii?Q?VeouS+t1l642rGnsoQ7kJ0Mb0QfV7ZshFBkeY5JiIoZCUxZUvn2/zcI8JhYd?=
 =?us-ascii?Q?5DrVT52D4kxkG62PiZhhKFAEHbyRwfQi2gFimiGMtOD9aTvq8EgzS636rbQ8?=
 =?us-ascii?Q?o/SdPZetsnSvaYus+Hp+CogPbUamR//tIetsm/zWskJw9CDnRrFdXxqZy1sp?=
 =?us-ascii?Q?GfcR0Zv7dUQSTQ816NpLtvc/uNFi5lUX0LUPf0vFbYCQPuYReE+n4lR4lBTR?=
 =?us-ascii?Q?HFCJAks+V7p+4sBKPSxnXwTEAUuZF45dYtHwNwkc9/E3KioGNmjRo610pRHf?=
 =?us-ascii?Q?e8lYA/F8jN57C9t9n/f277wH5h8riixfXwy1pTqUwV//k9bJWDEIGRykmMxF?=
 =?us-ascii?Q?GykZPGiu5OyOCcKZyMEPCKJAq8X3HRNt3rm3Mzlc6OY6n3RV8FGZwi/0cQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IxCDHlGNVtCmLQ8fZ2pr0dExNmJRAt/ikyF8rx7keQNPf3bVuZBD5nS/x69p?=
 =?us-ascii?Q?W60fu2bWtMSPQcX7lI7R5UwPD3k0TkBKv5QdjP3iQpSnP4izsO/iFpGgOXl4?=
 =?us-ascii?Q?MxalSSgQstIv53cwsyaG7O2HjrXlWFmBcam2GXGVJPqfT7iK3PjFq26uwb+z?=
 =?us-ascii?Q?/wMxHDXu5ge/d/EHuoudnZuK6Wi0LvtRPNtanY0PH+rGiiLD1cGR8QLok8fK?=
 =?us-ascii?Q?NoP/zNgpVG0+cRVT8uVy5a0XBSFIUdeXWjnhK9kS1XvY+N4GDgvsuGV44TOk?=
 =?us-ascii?Q?76K6A0WvGiu9r5IrKpr3YLx2YsHgmjUlYlI74lo4zp4Kk6XJjycoWqUtt63m?=
 =?us-ascii?Q?gv1aSwQRUnQzSfMF296kyG4oabH4IMuBQ8PIk14lPFWn7QXo9QzbeFwWMUs4?=
 =?us-ascii?Q?qCk8s5uoYXioan4L3OIbc6RjQxCIviGWvSPCB5RAXcqhXUQTQ0vpmW3dVnjy?=
 =?us-ascii?Q?nvctCSpNxC1S3JeXDN+aI57swq2o7ui22SZC1WFnv8bO8PDmEEZSaITkuWdQ?=
 =?us-ascii?Q?KfHFzgjYx9NWKDj9nZxnME8CTbMt/x2sWzDzOnB1zM8hjew84U7NHiszbNcZ?=
 =?us-ascii?Q?7wkFeB+d12+iDPgF71s4Ve4bhfoV+DzffiOK4vVfiw+ejhwrIm+MDi8+i7YQ?=
 =?us-ascii?Q?lgJvWug5IAMxA/ybP9Ey0pPvy+6OLFNkgC1/N2PsldC/Hz0lhDKnEW3bPbGQ?=
 =?us-ascii?Q?Nbfq/WPqog+vwFZOk+AhkgKkOX2xI/Wuza7KNw5stJGAeKvBfgnrexfYMI+b?=
 =?us-ascii?Q?r9IakqWh2VwGQXud/J8UcoG/z2TOVvbKIncA6B43IJE5ZBSYJQnHFqbXFjuB?=
 =?us-ascii?Q?kR5wLtIHeK9/N9ipbADULrJLJ5ErFE5K7BbH6Ga6fIdoXPRMi+vCUfMzCUFC?=
 =?us-ascii?Q?MVUWsJQRyifk/OhVmhY8Z3Lz0Ib28kKTZbAghjYgd/2Aezxls4vgJ/EVYchr?=
 =?us-ascii?Q?0KsBMLfeA8KmBB1xBptrV7Buwtzxl/8J1EeE6UnGwAVcpJl2e3Rvg7DyZfFn?=
 =?us-ascii?Q?dg/27Urh300S1qH2iCHLZXwbP1E+g2NmPhrXPevlFDr08Z8QSp8bC6cJ0AmZ?=
 =?us-ascii?Q?5D4SKGADDtI7Gtu7mJI7Lafz+TC1y4AxCVlyMLLVsozq68TXj+sKYYMLaPX1?=
 =?us-ascii?Q?a9vfZL0Z/Yz0nS4Mc80JUUt/iBwABlyMVd0fTXx4/Z7xtx+XEJ3wzSluZokq?=
 =?us-ascii?Q?+yVUxY25SDPoQoV/Xmj0t1NKD3e/PJz9SkH1TnShhC3ohbDpwC+/hohb+n/u?=
 =?us-ascii?Q?cEZFT3W6zhegufu71O10J9shdpeDw5ai0DIbR5V8RfDFXuoreGpvjvTXRIUO?=
 =?us-ascii?Q?Li692vipm7j6XiloXmJ6wg4FVa3jiyrtCBcMlJrx6Y9ZU3hHEX4DYlc3MbNH?=
 =?us-ascii?Q?nR8/12bYfxter95MoQOGlRZsDfey3c/TDCUpo1qI+YgEOtzVxGXv1AL6WN72?=
 =?us-ascii?Q?6GVHXbiOWdIcMMf0f2C5MS7Fz6paUdU29ti2+9cfU1UOuEeZcfctrVhex7qd?=
 =?us-ascii?Q?5rT0a7Z49FWCYtFSnhG/6b322/Sm/8TydQEB3EpowjU9ZQf4cfsdv4fmd8kN?=
 =?us-ascii?Q?D69QunQtFu+LlbevRdvjQYRn4VMS1YLiCdDUCLbHjPIM3d2W/1VXZKtdJW5o?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1016d4c1-938f-4c66-eb5c-08de098952f9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 12:17:34.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o6NDU0emI6j2oJG/Y5HjKaZxlhMozh5Ai315Jx37x0NGb5Zk/Ubo2XnUp+fPWcngq4AyOe4UdizvLmXJxC3miI4hJ/uttuFT6tLMgB3DRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_051743_548545_FF8B66F6 
X-CRM114-Status: GOOD (  13.37  )
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

This just reduce the number of modification of REG_SPI_NFI_CNFG and
REG_SPI_NFI_SECCUS_SIZE registers during dirmap operation.

This patch is a necessary step to avoid reading flash page settings
from SNFI registers during driver startup.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 135 +++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 719b424d4cce..3fb76e2dd5e3 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -668,7 +668,48 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err < 0)
 		return err;
 
-	err = airoha_snand_nfi_config(as_ctrl);
+	/* NFI reset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
+			   SPI_NFI_FIFO_FLUSH | SPI_NFI_RST);
+	if (err)
+		goto error_dma_mode_off;
+
+	/* NFI configure:
+	 *   - No AutoFDM (custom sector size (SECCUS) register will be used)
+	 *   - No SoC's hardware ECC (flash internal ECC will be used)
+	 *   - Use burst mode (faster, but requires 16 byte alignment for addresses)
+	 *   - Setup for reading (SPI_NFI_READ_MODE)
+	 *   - Setup reading command: FIELD_PREP(SPI_NFI_OPMODE, 6)
+	 *   - Use DMA instead of PIO for data reading
+	 */
+	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
+				 SPI_NFI_DMA_MODE |
+				 SPI_NFI_READ_MODE |
+				 SPI_NFI_DMA_BURST_EN |
+				 SPI_NFI_HW_ECC_EN |
+				 SPI_NFI_AUTO_FDM_EN |
+				 SPI_NFI_OPMODE,
+				 SPI_NFI_DMA_MODE |
+				 SPI_NFI_READ_MODE |
+				 SPI_NFI_DMA_BURST_EN |
+				 FIELD_PREP(SPI_NFI_OPMODE, 6));
+	if (err)
+		goto error_dma_mode_off;
+
+	/* Set number of sector will be read */
+	val = FIELD_PREP(SPI_NFI_SEC_NUM, as_ctrl->nfi_cfg.sec_num);
+	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
+				 SPI_NFI_SEC_NUM, val);
+	if (err)
+		goto error_dma_mode_off;
+
+	/* Set custom sector size */
+	val = as_ctrl->nfi_cfg.sec_size;
+	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
+				 SPI_NFI_CUS_SEC_SIZE |
+				 SPI_NFI_CUS_SEC_SIZE_EN,
+				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, val) |
+				 SPI_NFI_CUS_SEC_SIZE_EN);
 	if (err)
 		goto error_dma_mode_off;
 
@@ -684,7 +725,14 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set cust sec size */
+	/*
+	 * Setup transfer length
+	 * ---------------------
+	 * The following rule MUST be met:
+	 *     transfer_length =
+	 *        = NFI_SNF_MISC_CTL2.read_data_byte_number =
+	 *        = NFI_CON.sector_number * NFI_SECCUS.custom_sector_size
+	 */
 	val = as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num;
 	val = FIELD_PREP(SPI_NFI_READ_DATA_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
@@ -711,18 +759,6 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set nfi read */
-	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-				 SPI_NFI_OPMODE,
-				 FIELD_PREP(SPI_NFI_OPMODE, 6));
-	if (err)
-		goto error_dma_unmap;
-
-	err = regmap_set_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-			      SPI_NFI_READ_MODE | SPI_NFI_DMA_MODE);
-	if (err)
-		goto error_dma_unmap;
-
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_CMD, 0x0);
 	if (err)
 		goto error_dma_unmap;
@@ -815,7 +851,48 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err < 0)
 		return err;
 
-	err = airoha_snand_nfi_config(as_ctrl);
+	/* NFI reset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
+			   SPI_NFI_FIFO_FLUSH | SPI_NFI_RST);
+	if (err)
+		goto error_dma_mode_off;
+
+	/*
+	 * NFI configure:
+	 *   - No AutoFDM (custom sector size (SECCUS) register will be used)
+	 *   - No SoC's hardware ECC (flash internal ECC will be used)
+	 *   - Use burst mode (faster, but requires 16 byte alignment for addresses)
+	 *   - Setup for writing (SPI_NFI_READ_MODE bit is cleared)
+	 *   - Setup writing command: FIELD_PREP(SPI_NFI_OPMODE, 3)
+	 *   - Use DMA instead of PIO for data writing
+	 */
+	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
+				 SPI_NFI_DMA_MODE |
+				 SPI_NFI_READ_MODE |
+				 SPI_NFI_DMA_BURST_EN |
+				 SPI_NFI_HW_ECC_EN |
+				 SPI_NFI_AUTO_FDM_EN |
+				 SPI_NFI_OPMODE,
+				 SPI_NFI_DMA_MODE |
+				 SPI_NFI_DMA_BURST_EN |
+				 FIELD_PREP(SPI_NFI_OPMODE, 3));
+	if (err)
+		goto error_dma_mode_off;
+
+	/* Set number of sector will be written */
+	val = FIELD_PREP(SPI_NFI_SEC_NUM, as_ctrl->nfi_cfg.sec_num);
+	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
+				 SPI_NFI_SEC_NUM, val);
+	if (err)
+		goto error_dma_mode_off;
+
+	/* Set custom sector size */
+	val = as_ctrl->nfi_cfg.sec_size;
+	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
+				 SPI_NFI_CUS_SEC_SIZE |
+				 SPI_NFI_CUS_SEC_SIZE_EN,
+				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, val) |
+				 SPI_NFI_CUS_SEC_SIZE_EN);
 	if (err)
 		goto error_dma_mode_off;
 
@@ -831,8 +908,16 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	val = FIELD_PREP(SPI_NFI_PROG_LOAD_BYTE_NUM,
-			 as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num);
+	/*
+	 * Setup transfer length
+	 * ---------------------
+	 * The following rule MUST be met:
+	 *     transfer_length =
+	 *        = NFI_SNF_MISC_CTL2.write_data_byte_number =
+	 *        = NFI_CON.sector_number * NFI_SECCUS.custom_sector_size
+	 */
+	val = as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num;
+	val = FIELD_PREP(SPI_NFI_PROG_LOAD_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
 				 REG_SPI_NFI_SNF_MISC_CTL2,
 				 SPI_NFI_PROG_LOAD_BYTE_NUM, val);
@@ -857,22 +942,6 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-				SPI_NFI_READ_MODE);
-	if (err)
-		goto error_dma_unmap;
-
-	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-				 SPI_NFI_OPMODE,
-				 FIELD_PREP(SPI_NFI_OPMODE, 3));
-	if (err)
-		goto error_dma_unmap;
-
-	err = regmap_set_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CNFG,
-			      SPI_NFI_DMA_MODE);
-	if (err)
-		goto error_dma_unmap;
-
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_CMD, 0x80);
 	if (err)
 		goto error_dma_unmap;
-- 
2.51.0


