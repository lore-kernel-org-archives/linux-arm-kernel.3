Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5613E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 04:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QjXr7/gAhGvH3Fw1kT+t8GfkOpLq/6YNEl2eWiLfVI8=; b=UT57SAztQ2Y5R79JMT2Dtzb5Mz
	an8eLhtgf8ryMQ0GwN1+XfaRuE1y8xxT8rD+NNNkm8IiwurZh4vc1ZNJYRdIW9eKR7NKBLghRhEac
	T8DT915anQZ3mi2m4Xw2wI3ty04LInX6ZMk2EdeYFBEIKGypnzdmMOqxzbisloQZSWeR23tBpCMHq
	lzQ4Q8dqAu7GJQyI2nOBu2tle2RoVKVCTx4ZFDH2Nub6FynsnZeRRHkdM4u60BZlf5AZgTfALbXP7
	wkTwn9Y81SYkDYc2IIoImo57eOti6R98skydI1JTx5KsnXq8U3yurb80YRTR8SQcp3Mw8e/s2+rpf
	we5V5PmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNljt-0000000FYSr-18Hw;
	Wed, 18 Dec 2024 04:32:49 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlio-0000000FYLQ-0HFi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 04:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE75BZX4pOoiJzwPRKTJQesrUo+sAWGEG/DWkEcL+CNgnAItHKN037MXSl9mawXwgLgu9xMwL3PR65xyBklgEXh+tC5ssH8iYQSDKKmdgfNMIQE6rrOrguST184t8wyDqYqV0FyUHwvE8qio5eJ3FHx9aEMHfD11tM7R2a2n/uiVGGaBvlus/++OGI6U6P9P6jd6ph2sDKXg0UPAnnb0QyyrfSNyTuhXwDYGjBzEL3VjxdbEXGzRe6qSRyoYRGkenj0mYKKEz9mDcS+r4x2CkTpTFLB8L76NERs3cAkODGZJSJ+77YqT0O3Q0A+3aR4goe516MpObjfOnAy7EAi+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjXr7/gAhGvH3Fw1kT+t8GfkOpLq/6YNEl2eWiLfVI8=;
 b=qkpkzGLR4QeSdWzZvfzIE7G/XR8M0dt3mBnLW4VPpYpsQdGBngGq46k0xsxc5mqw6lKhwlov0OqiN5jPNB2QGVeL20EEfeCstuGOz3hPgbZPLnHXNbjVxIvTD6NMeHnQq39RN7i2LANrDhoFUPXjCfNjm3WoiUVHrFQ96U1xcjVBl4R5izO5Xm+OMB0fFDwTjtkvpg96iwjryLJNnmPbEVxojAM4e3u305JPy2d6eEXtDts0wecwdCCMQhaJxFubutpRQ81ETc4T4+JX690SNK4m4+QaaCgM6jtahrYQotx+4WyurCuPqEiWVHpWLvopAVFizoTiqp65g3Lcrl3pMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjXr7/gAhGvH3Fw1kT+t8GfkOpLq/6YNEl2eWiLfVI8=;
 b=dLchgk1lZ/tb++3H2qjftoIZzwKZai2lZX6HaHVfey5yBDhXhfwZ8oQo2gsVonlgEIFzuiuxttkAiTA3p3sHbTQ+2j/f1+7K6+xHFWEcX/bKkyc2WsicbU0ovNr3g4oatwXFj97+JtcvVFmlHQH0UqOXzIybsHjGSP5dj7mhiaUvCpArEpkGZ15F8pyajfyLejthqBzRz2aH9b99RcknxNbZU9m7PWFmAI2DIYtGcrm4SHZxxdrw0V77z4dwc5rgWrjQTd2M3U669LXAwfecG2YPFspwurde0tbTbwuIvw+OuWLsVrRaP0sEe0iNWG+JjlHXsVvzk4e0jMlfL0OtrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8873.eurprd04.prod.outlook.com (2603:10a6:20b:408::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 04:31:36 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 04:31:36 +0000
From: Carlos Song <carlos.song@nxp.com>
To: andi.shyti@kernel.org,
	frank.li@nxp.com,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v3] i2c: imx: add imx7d compatible string for applying errata ERR007805
Date: Wed, 18 Dec 2024 12:42:38 +0800
Message-Id: <20241218044238.143414-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::23) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eb1d8f-4c18-431f-356a-08dd1f1cdbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3V1qk2MkjkTNgZ1RyZVcbrP1leSAx8Uv7H6FG6j4sF/qSvK1KugtgVzoXYxP?=
 =?us-ascii?Q?xyFQUANQKL+tMaDc/u+8f3RseZLfT0f1G3W4SRljB5zsICclHmD2pnwJ4L3V?=
 =?us-ascii?Q?gk2CW4tOnB2ysub9AlgRRbAUWE2cGpjy7ONJpgRrGLSz0Sz7onAFFRftXnZr?=
 =?us-ascii?Q?F8gLFLn+M0DibJd9lMdJYGacYWr8GFzcau4kpnCtzD57kEWRmD0I45XJbR07?=
 =?us-ascii?Q?izP8Ly36dnG4OJYMY7jy+vwbqG4oYXcWtT1zzxEib97+GzmQRYSzDoROGJXQ?=
 =?us-ascii?Q?lpIXelMV4NKekPZSHllsN2wxv5isPh2ef27j8ZO+ErbVOEcWFKL5hsyETwHs?=
 =?us-ascii?Q?zY1KzVxxxUZKVww5MHiMNaBPLkBde6rcEwBsUFGY88LTM2ITenlKmUBXARMT?=
 =?us-ascii?Q?12cUt9iT0Od3QQATKDWrZ7Z8ihn3A6GvKf+xfmUspqOe87/mMiKAAD3J1dkC?=
 =?us-ascii?Q?Aubjs5Jd/9tNyd4roPcUivHSwqbbUEyR6r0izmOoEy2mW7q+D4aefcHMgVYq?=
 =?us-ascii?Q?/LgG4KG0Q0M8MLyUMX8V1vkeA5qK0Fa3N5Tmw2FZ9Od7vP5u4IlS6kC2LuFH?=
 =?us-ascii?Q?kVDDNHhjfXnUVe/l7V+ilgavUjoKGBR8jgsivQmD1JC3+HGW91jg08rUCA+n?=
 =?us-ascii?Q?yu2xpbD1xgA135AmPWZWO7WLoLG9BXZuufLWOWC3clRd1Ut8CiHcbO24TsUX?=
 =?us-ascii?Q?6u5/6GO/IpfKr/yNuFqP2eOtheM2hviJouqOd1z4PjqCBjCA+fqcLOsNMwjQ?=
 =?us-ascii?Q?w3ZOp4oLOVCqVAvEvFrXWAxrnaGegX/bePE19+vab9cJdrJeUGxX9lMGlNe5?=
 =?us-ascii?Q?H6mWWOzF61DLWg5IFn6FGXaAsuCFpP2YZKfargvg2Bsa6ZDBLn4UY1Pt0yZx?=
 =?us-ascii?Q?DZEuefDwQlbsneds7J/5NZPWJTicpjJGMa+7TRDo4Nl3sKFFXcjuoUDiD68Q?=
 =?us-ascii?Q?TVWlO+9SDfo8G99fRfy63ZFCOJRl4CAXDhme3yMvAnYBIiHWqF/B4gKlYSg8?=
 =?us-ascii?Q?hRasIJMkYi6HTu0qfk5PPQm2zND1ljx5SfQrzEHo6knFnnWAVF9KTNo4Z7rc?=
 =?us-ascii?Q?sjfk2xgGXTTN1ljFUMXNzz2Q3ZQnSquo1jwr23NU/cHj/sPSqPKvctrSMpej?=
 =?us-ascii?Q?EKMNdmyoLF3uQRhg0SrIZn02p/Kv4XwicebqnfFlCG7B3LjSSi8zuAzw8Che?=
 =?us-ascii?Q?4Pxeu71haoceysOW0V94pRdHnGJkb6/eQJu3CdS53fJUgbJtvj9ExZp11r7G?=
 =?us-ascii?Q?c8/TSuJkjs18+ZYqTmbXpsenZVByptdgIOybVpMu6z5WTkUzqMEwehXjPnLT?=
 =?us-ascii?Q?hI0lPlEBR9hDVJcaXadvgDn/uBP1Yj7NFo3WA8wa8M3Nk5N4fABD7Jz850I5?=
 =?us-ascii?Q?iQA6rqIs1D7hfSm/OLVqEXvi83/eUdrLSZG1AoMtDxYHr/My4WKU+XbT9b3f?=
 =?us-ascii?Q?SQS2sa8oLB8OT7B22dr2SE9zBW4k0AQX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmDg/baoYJMba8zsbL6c6NEjn0eJlkbktDo4jwyZnOcrPXsiQiftiZ6xjrnN?=
 =?us-ascii?Q?rMV9CwTSmHuZ2qtVR+grF/4acdTiiK31QTWI0l0P6yB6x/5Q3mqSkEuBqvIv?=
 =?us-ascii?Q?PaSbDhkYl0r1boFbGdiOGaivPsPHWfC26wp7ED51tVphECTKQX++xQgpU+KE?=
 =?us-ascii?Q?dwR9w8HDMRdckQaAr0Y59xCNuo+Voiqxnu4mCMUD46y3Fs1J8oIbbdC2zYEu?=
 =?us-ascii?Q?bZ8eVE/2vMHZOht6uq78g1/vpjXhN8DLC2MQjMx3To2tDx9onT8vt+pwjFVk?=
 =?us-ascii?Q?v8N51XKSZOVooMiNSVTh2bsjl5FMHTIvjxqm0iKSaDqhsCRazmvFTBQ/oF9S?=
 =?us-ascii?Q?iJ2ep2sNQzwfXUeddgQ9gQ5fIsW4AtXZoeJzCO2M+TBNUJaVkM1YvO7M/8ff?=
 =?us-ascii?Q?9qUfdgS8eVt0oiOTEAStLDdwG75A/O6I/bY+AkhT6zKW8RZyBIBkn8UOSyJI?=
 =?us-ascii?Q?UDY/7GYsPtIbTPFQjSjCsLO0vIlc8NsqhHZm8sjVX/Gvmm4Iv2KTgew66frD?=
 =?us-ascii?Q?syZD+78dFrmDAuuLly3X7I1QCWrE0+hJ6Mag1ZfH6+RnL5/fWtSfrrNsLRAp?=
 =?us-ascii?Q?yhvdQitRB1M0kgc++GEE7niBziDFBlqBtMgXM4nDYvg/ckS42ZqckuE5kALL?=
 =?us-ascii?Q?I8M117ITW8ktUI2s/5GfNMsr28oNF0tiXkhYQAqoxMhRrIeKJs4YeVsBfjAi?=
 =?us-ascii?Q?3cBAMHl/edeAccc9PG+qg55L8CfV5orFngXsc6BmagNqsMTVIxaqOtL8i6aw?=
 =?us-ascii?Q?malaM7zCHQbxyfPGNAVJg/DlBq6ePU8xbL4BnRITsv12je2JlrCdI1Lf6HiO?=
 =?us-ascii?Q?mQMSaY+/mM0kVC5fa1knlBf+BSodx/ogkhGTpnAjCsxdMLP+ndUF2Kp50gEa?=
 =?us-ascii?Q?BalkCLjRhV6GmX5ZgBPwwRR2YO+OsYUQ4N0YMF3VhLgHsBbTiSb+NAW4GuDR?=
 =?us-ascii?Q?T4y3kkwkJrxQKxI8uF/fTnQjF2blj2wjF5Lb2AktUg38/eZiRuhr13xwcawG?=
 =?us-ascii?Q?6f2wPLmOhUUAuqCe+F7FB0mmopxEvqg0KKRagqDLrWj31EofnQ8IRhaeDyk9?=
 =?us-ascii?Q?CHtIDjlkoRzUBvcIRIhi0CJpuiHo13eHAZBtjgtxrzMusK7VTMKvPtXT4vP3?=
 =?us-ascii?Q?GVfL7XXPCVyE27esl3oCbSNfBoJcf3BAaWp4XSUJswoJnmTe6V1m+lmM94Hs?=
 =?us-ascii?Q?3OIyVrNXmNH/ox3WrU+HE8JSCRweod+GeHzaarBQetkiztOoVeFWbmLq64s9?=
 =?us-ascii?Q?mSFpVPrxJ0lWohx6a/vE+JDmM5HNZVx+JET5NFa25FdcXbk1pEWIBVo/BryX?=
 =?us-ascii?Q?FiiRndcSKk0Fn0w6RgMzzu78U+bdNaLKxlgzFhYGlxXMhpdB6ejDSk0g+z6w?=
 =?us-ascii?Q?tbj7gEiJ3Vm7xtC3rusk3BFEF69VN/1qENekvHdyGUn3O9/gnA5NYsTi0hpC?=
 =?us-ascii?Q?K7GrSDuHux2rSYGEJMr+lf3bklnNF6FJ49yNU9pCih5l/sMi0ZXYi0D3Qgon?=
 =?us-ascii?Q?8Rl+8qTY3cNUZfyiihMg1uRUZk4EfamXIPPpPgcIWk0kb7mO7c5pSP93f/Hh?=
 =?us-ascii?Q?YXNcToaE6Bak9YQ/+H2oOAUzIq0sYmfvJUt/0nNL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eb1d8f-4c18-431f-356a-08dd1f1cdbd8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 04:31:36.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IkSGulvOoHqyaUqqykh7ZmQ/a4XeGouxcbzFREcUU8CfYDaB31AkmgIWh/1Y4lzpDRlTY0hb0c73sBJ/Y84aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8873
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_203142_110862_A0DF4DC5 
X-CRM114-Status: GOOD (  14.72  )
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

Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
compatible string table, at the result, "fsl,imx21-i2c" will be
matched, but it will cause errata ERR007805 not be applied in fact.

So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
IMX7DS_2N09P).

"fsl,imx7d-i2c" already is documented in binding doc. This errata
fix has been included in imx6_i2c_hwdata and it is the same in all
I.MX6/7/8, so just reuse it.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Change for V3:
- No ACK, so resend this patch.
Change for V2:
- I have tried to fix this issue at imx7s.dtsi in V1, according to
  the community suggestion, I make V2 patch for i2c-imx driver to
  avoid updating the FDT to fix an errata. Discussion in V1:
  Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for applying errata ERR007805
  Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 350346a7892c..9d5caa032c5c 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx7d-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
-- 
2.34.1


