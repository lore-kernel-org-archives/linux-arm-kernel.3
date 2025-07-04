Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495E0C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 03:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jGY4gJzuITXAxQMRDEDLSXVX1CRJfZTvMJ5N5dB4cuQ=; b=OPTSbRW3fDpHK1ArRP+HidRDcE
	8pZ6L98w6Yrx3mvuwQ2rvQd7cKztG38crJOOXkmto4r6fwlfkNgwv8hZ+WXLw26yEWSs+Loo8HRLb
	7J0dP3ly2bDGnls4XcL7i/xEnG0+iLsUWHCAn3kV827qhkGiTOG0NblVJkqixDbaydkpFxl6tvNj3
	xL0V6RQs2pVStVmpthK00dFilWl0DB4n5YrA6sbC+CKnmKqo6PveNu4wZDVyaTkAiTpSuEXScp+kz
	HfZRv2k8F8IyGIf64WZ15b6YF8LyAVvVaTaA+OUNEzz8E67SMi4qP8Yr60GbiIvPCI/EbgJK5e/PB
	bXNZWjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWhC-0000000D7kD-19Of;
	Fri, 04 Jul 2025 03:02:38 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWSS-0000000D6Hu-1m4m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJgX898cXpaYojY4p07BmsNlyxPWPBTgD8e3WXcl4ZXYrZdMdDzMsQNJhb9n8cpkSKKtf6/kL9lfhO8Pw6dxEeC8HX1ejSxxXbnur9orD0c+NT5Ju/rSUXiVPJ5awDhqprzbblWJkwvlpQNM5PhT2+7VapDUdbs6zaD9KyddZyaS0C0wcX/s2bSIpQ6zAcaUpX3MjC04gKhXp3YIflI9Z7tuGyWAFZ27bevS/O2ZpzxfhsiwOX96fbVtOhbIf2AdcWzXpcWQsprFHRo+3Dd7cJK5PBufbIhzcw+/ICP4SO9X7Q1JevZ84gTi6OFKi8c1Cb4AJY4OFOpFYvYwovhskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGY4gJzuITXAxQMRDEDLSXVX1CRJfZTvMJ5N5dB4cuQ=;
 b=Gsb9vWGPhVTOBVScTEmxEc7DGSYILqN3VDtYb6X7lnx6kRnuSQDsJeGJX14v32vpaaTupLLSeygLwi/KkjiQiEzQFPWXtcAmAr+x7NfGyncw2EjJwFRsMrEjblaMznRB6ubKq2hqGm7RkkiMyPZOgUd3pE8OBwQ0X18W0/NPvvTswJ8z7U7Tz9vYgC7pNT75OwaPnxfUMqVvekCSBWhOFaJG42E2qLNsHHHapsDDr69KCYMJiTePgih0t5jdaFXEhJyp5Ch+N0J31TlMNbkl+xc6f6KN7gTS04dK+mG/ZpKgStWCaqZypNDD37jLPuv+nnPIokAHZYSoCIeqThpfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGY4gJzuITXAxQMRDEDLSXVX1CRJfZTvMJ5N5dB4cuQ=;
 b=fh1bkPtcT5TOBauIKSosmamitfUeDlPxv5HjFMzJQofz+zmm6By8RS7kXtZoRKIMFNSb2e40yUgFhIl2Toe1iPGHY2O6ccuFq9zvVUsUsmg59sKjgz9537SqRqbYFC52Ps5wEqVyRXXtgC58Il+yXj/NSa/BKUHfvJsr3Tc3P0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12880.jpnprd01.prod.outlook.com
 (2603:1096:604:340::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 02:47:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 02:47:20 +0000
Message-ID: <878ql4u0y0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 resend] arm: omap2: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 4 Jul 2025 02:47:19 +0000
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0102f133-e8f7-485f-c4e4-08ddbaa51892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ZqHfhqNF8/gK/mXJ4FIAij6BNYA/SXaj7eEy3XKIarS2vubwoOsC9JuTtns?=
 =?us-ascii?Q?NtXguDbOyIpcL8A1bEjkG6GQbhiV3LSmS9IHfOO1cRiGvhpZkTiWvfFKfStU?=
 =?us-ascii?Q?LbvbAWyb2QleKhIzhg7EC1k8BWtPLd2milVXMJKtD5MqtFPxGavJqPoW4qs5?=
 =?us-ascii?Q?X5DjI0ay+PhvgmSk6dNINDhMdAk7TlbysXody//iD3pNR2SKHXx17t0I8TuW?=
 =?us-ascii?Q?/kvWJebHHJW9nT7uD7I+pvVH+1aVNiNNLG1KdSKCvZCYCxQh1e/ohhVB+plQ?=
 =?us-ascii?Q?vz7r3I1ewFtzO5EgNb5n1CgJcSjB7/7Umk0ZtfVs0C/zgv3Dr/N1arM//zge?=
 =?us-ascii?Q?dYnnnUXxLp6URjE+ooJL0PSWLH1kRwnDoKrC3BbcPpCSdBx6h+AMI2Y5TJpt?=
 =?us-ascii?Q?fwzydQtNpSfTVwMBvsEvC8uGE6d5Uo+ssUPGwPvb+IqfB/eOlGt7LuuPsphn?=
 =?us-ascii?Q?YJBBT0kOmL7MYafWISfF0tLsgqFujB9lw+EkTgAznUXteA/Fq+3RppyxTuZr?=
 =?us-ascii?Q?490tQmZRec1vxUncKUu74CliW4Fc97i6w7KCBO9CA/r5GeekXLFNCTW+jaxK?=
 =?us-ascii?Q?0i5v4E0B4MgWmQjSk5Xrm2HPd26wInyHViTQ7jWtvwyxiR4rF22v2M7NMMCc?=
 =?us-ascii?Q?X4Couz65PwIUkiimmm1UsQxTt7SbssQ0ZTzUQyh3D43lW18ByZi2DWR5k9Xi?=
 =?us-ascii?Q?N26bzZg1Kyb/yMOZ8Qw9LnJJPIt1uuZuYPVo/bfDAYZqqurdsSV7+L4Qu5fD?=
 =?us-ascii?Q?0oMkyKP0AB/FwAuXTPgL60SNYPCSFPwVOTrNyt6VIF8XZ2SQOtRKXAKHlztX?=
 =?us-ascii?Q?UTm4niXR5CpHAc6ln7zu10z4lJtkm6zhxUuFbmdakjEpD96C9Ka1pYkzxblt?=
 =?us-ascii?Q?8QKAJ/oTn4sxCLHkZhLrbwW/Ds9fy3RLyHK8hmyppgsUG12MvhJkqDvoJK8Z?=
 =?us-ascii?Q?9GlU4DumcfP7lkJ2yG8C1o1X7RpndG7xTgcSVodOIJMwj+zGHMSI+IbnkF3v?=
 =?us-ascii?Q?1/3vMvFIFNwxffnV5KdsGC6nRngk4jj0L8KDDNxwTcjbdMdImmYzQ9vDO1pR?=
 =?us-ascii?Q?uBv/u3LqCfC5ytfOm4+f+0tWlmMtM2kizSd9fXshrWIJGvfZO2gjQXIdaahG?=
 =?us-ascii?Q?rvoTPuZ+/XQnalyLBbYqHgHvLapX38KIOVIbGLnsine160/iiDW9RHOwK3kR?=
 =?us-ascii?Q?a4yXlcug62u0bEskUVsfwVxyqisX2aPjH1V+VcgsRjxh3PwYsirGTwb5lhiQ?=
 =?us-ascii?Q?q86IP4koC7j+kGZnolmme4qBfd7Zx9iwd0LYketYGo7i1R+kEwXzzhKGYV5Q?=
 =?us-ascii?Q?lyXGdEMpnqTH9Oga8nF8c6BqBwP1QyB+eBkslwML1KOO7VU1LlleS1TPzunF?=
 =?us-ascii?Q?+02FuAzhzIDA+RUO5Soxms1IYMj3G6fwM1VCkjvjVZmEz0ZDnXkXjjYWWC0h?=
 =?us-ascii?Q?mbyyVs/dPl/Ig5nW5lAxQYP3WBL1Xy3wyFKxQVd4fn9lcxCKtAadCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUlSiCSKAM6Xj0Y1HOXrdoutswYFbzJ9b/EbQbAj4HXOdkMR+cHj4e1yRrPU?=
 =?us-ascii?Q?uketBXtIbAGMuu2RbwvBN7ZVd5rIMBPV6UuBOPzqjEmxn2KAw2whFnHL1QFH?=
 =?us-ascii?Q?GA+7My1QNUT5Ei3KdTJLmwm0nsX5ahVg1U/BYd1KmZLVwSI1GScZ5ssvVA2Y?=
 =?us-ascii?Q?AZ24blDikay97TCU3IyFuADtsJ3C9Es5Io9EhXQig7Uc7TabdKbpWAL+q2JZ?=
 =?us-ascii?Q?bX6jzm2gO6Iyt7Ue+AkI1LHCuZO+/mZ3R11KFJ9lPuN6ng/xwq+hQfNJsVv0?=
 =?us-ascii?Q?1e/MTZN5kcTEIAFLRtlnSLs5s+c9UPb6NH+b+J6OljWLILp7QEXQc9Oq0zWl?=
 =?us-ascii?Q?0YPvtMF/x22q93ykwX2234lIUPSVbRuOzD3Ky+EPdCpwJJkXgA+yTr+//nKK?=
 =?us-ascii?Q?aLVvaqGl9SGL7rJtoiIKsn8GsSXG5irDCPf3VHqlKV2M+Vpr+HXHQvtOPEjH?=
 =?us-ascii?Q?Bp16Spo88SS4WIcg+kyvPk4SCNSXT7crXtVJ8iKkxSCYYJasU5Ed8a/cb6O6?=
 =?us-ascii?Q?jnaphBsWfVxSKAwFzErIudxR1cpLy4fCd5Yqg6wbvI8lJNZkOC3mJESpkR37?=
 =?us-ascii?Q?ZWkuyqmWIpCg95fkrVMR1vSdd3t7YedrwSzMc+fFNQgTayKMntyBCD7llLZq?=
 =?us-ascii?Q?+S80p8/YkOBfp8h2/GuBrWXLcYVzdEi3qPolEFIiIvXJMHS3OtPUlSbD1QGg?=
 =?us-ascii?Q?fw7wu3YZm0jaSevIi7L5KnK76IsFYRaVRHLeGfGgqVb4lHQxFPqMu+Jf5+zE?=
 =?us-ascii?Q?liOshB20BOpSTeA5v8q5UdWTkeOPl/oPWn20BTr4wpI6Gv/Klb54ryDTCmsk?=
 =?us-ascii?Q?FteXsAQ6DRDtRiIGl0FoKrpDfJ6BzWKiDCXc3vVG14aqJzwmKLwmGQEp2Mto?=
 =?us-ascii?Q?1n8AoeP/0QZonlivl6D9tZ4FHOdMkzMH9Yx7fgqZQbcidaGwqROwMgjWWRzw?=
 =?us-ascii?Q?mcf5BuLm7Yg2OSNG/ZHh4XpHdh1Stffsnn4xwzt90CD/qxDR2CgQ3Rtml8B3?=
 =?us-ascii?Q?yFzvXP0jEdhkzXYUGc12y2eJ1If0vf6m7Q7owG2JtsqXWrMqOzIILGk6q8cg?=
 =?us-ascii?Q?hJfnj6qkRwDXN/NEVKbDCPc2ntoWkKuNwcPf+fTmyNJKdyJogSYAzoICxIDC?=
 =?us-ascii?Q?yW8auzXyeImiuv+PNg4kNZb3uSkDJX6jbIr6mvUzcACqpEhaJ/ETOceZRxDd?=
 =?us-ascii?Q?ikNNiroshRM6DLdLbk6rRzCG7+Fvmteejxt++LoxoS+cVzNltkw1pnPRWq/a?=
 =?us-ascii?Q?l+wjLA0cm7azpQZKaaOb3qtlFOgkIp70B/CZg3Fz1rVddXRiRMikZE6DDtuJ?=
 =?us-ascii?Q?mT0YHH8XRNj+kA4NMuXXgaRfKCmeNLX8PRvhzbSh03LpAlAbHopNkz/imkAH?=
 =?us-ascii?Q?EVOouCFcjAfYfomEA6mwh6StgbCFMuW9uAuDL74++wHVT1GWH17j8ADM06Vg?=
 =?us-ascii?Q?CP1ulEMowWG9l+aOGvagDm64A9sgk0JHJZ9nZ9N/z8wzhyaKO/6zIBWm/siI?=
 =?us-ascii?Q?5gnsEwq/OORV6c2dxzQodkuctBeftiDv591OQp3PNORRNdRD37uDUA91u3KY?=
 =?us-ascii?Q?g4S9ZOWHI6MqJvLyyeJkyyYCfpv2qj3pwJKLkuuwiRNubKk9iDmPUXqPhJTX?=
 =?us-ascii?Q?YX7YKfGrXdwGzrQmXAxkDoY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0102f133-e8f7-485f-c4e4-08ddbaa51892
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:47:20.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfbB8gKRFnHRtHYl1Cfa/4UspvJ77z3/2MJDej/K00i1KSS0+X/zMg4JIjHF5+AHst/e27St69DRWZbL+6ckAsP9N2h7skIlSj7dxi+9wT9QJcA/QHSeZkH7589WPug+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194724_461597_2D41A315 
X-CRM114-Status: GOOD (  10.86  )
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

We can use string choices helper, let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v1 -> v2
	- add commit message
	- add Reviewed-by

 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index ff2a4a4d8220..969265d5d5c6 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -167,7 +167,7 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 
 #ifdef CONFIG_MMC_DEBUG
 	dev_dbg(dev, "Set slot %d power: %s (vdd %d)\n", slot + 1,
-		power_on ? "on" : "off", vdd);
+		str_on_off(power_on), vdd);
 #endif
 	if (slot == 0) {
 		if (!power_on)
-- 
2.43.0


